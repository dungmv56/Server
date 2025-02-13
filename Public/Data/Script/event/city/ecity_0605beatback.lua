-- 反击战
--MisDescBegin
-- 脚本号
x600044_g_ScriptId = 600044

--任务号
x600044_g_MissionId = 1109

--M鴆 ti陁 nhi甿 v鴑pc
x600044_g_Name = "V� 姓i Uy"

--任务归类
x600044_g_MissionKind = 50

--衅ng c nhi甿 v� 
x600044_g_MissionLevel = 10000

--喧ng否喧ngTinh英任务
x600044_g_IfMissionElite = 0

--下面几项喧ng动态显示to� 鸬 内容,用于T読 任务列表中动态显示任务情况**********************
x600044_g_IsMissionOkFail			= 0									--0 Nhi甿 v� ho鄋 th鄋h标记[值不能变]
x600044_g_MissionParam_SubId		= 1									--1 子任务脚本号存放位置[值不能变]

--以上喧ng动态**************************************************************

--任务变量第m祎 位用来存储随机 餴琺到to� 鸬 脚本号

--任务文本描述
x600044_g_MissionName = "Nhi甿 v� qu痗 ph騨g"
x600044_g_MissionInfo = "    Nhi甿 v� qu痗 ph騨g"									--任务描述
x600044_g_MissionTarget = "    Nhi甿 v� c黙 c醕 h� l� gi猼 ch猼 %n. "						--M鴆 ti陁 nhi甿 v�
x600044_g_ContinueInfo = "    Nhi甿 v� c黙 c醕 h� v鏽 ch遖 ho鄋 th鄋h �?"					--未Ho鄋 t nhi甿 v鴗o� 鸬 npc对话
x600044_g_SubmitInfo = "    S� t靚h ti猲 tri琻 nh� th� n鄌 r癷?"							--完成未提交时to� 鸬 npc对话
x600044_g_MissionComplete = "    L鄊 t痶 l, r t痶 r t痶. "					--Ho鄋 t nhi甿 v鴑pc说话to� 鸬 话

x600044_g_StrForePart = 4

x600044_g_MissionRound = 79

x600044_g_Parameter_Kill_AllRandom = { { id = 4, numNeeded = 5, numKilled = 6 } }

-- 通用Th鄋h ph� 任务脚本
x600044_g_CityMissionScript = 600001
x600044_g_MilitaryScript = 600030

--任务奖励

--MisDescEnd

x600044_g_MonsterOffset = 43											-- Suppose to 43, 表里第几列 Monster to� 鸬 偏移量

x600044_g_MissionParam_MonsterId = x600044_g_StrForePart
x600044_g_MissionParam_MonsterNeeded = x600044_g_StrForePart + 1
x600044_g_MissionParam_MonsterKilled = x600044_g_StrForePart + 2

--**********************************
--任务入口函数
--**********************************
function x600044_OnDefaultEvent( sceneId, selfId, targetId )	-- 餴琺击该任务后执行此脚本
	if GetName( sceneId, targetId ) ~= x600044_g_Name then		--判断该npc喧ng否喧ng对应任务to� 鸬 npc
		return
	end

	--如果已接此任务
	if IsHaveMission( sceneId, selfId, x600044_g_MissionId ) > 0 then
		--发送任务需求to� 鸬 信息
		local bDone = x600044_CheckSubmit( sceneId, selfId )
		local strText

		if bDone == 1 then
			strText = x600044_g_SubmitInfo
		else
			strText = x600044_g_ContinueInfo
		end

		--发送任务需求to� 鸬 信息
		BeginEvent( sceneId )
			AddText( sceneId, x600044_g_MissionName )
			AddText( sceneId, strText )
		EndEvent( )
		DispatchMissionDemandInfo( sceneId, selfId, targetId, x600044_g_ScriptId, x600044_g_MissionId, bDone )
	--Th鯽 m鉵任务接收条件
	elseif x600044_CheckAccept( sceneId, selfId ) > 0 then
		local nTemp = CallScriptFunction( x600044_g_CityMissionScript, "CanDoMisToDay", sceneId, selfId )
		if nTemp == 1 then
			x600044_OnAccept( sceneId, selfId, targetId )
		end
	end
end

--**********************************
--列举事件
--**********************************
function x600044_OnEnumerate( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x600044_g_Name then		--判断该npc喧ng否喧ng对应任务to� 鸬 npc
		return
	end

   --如果已接此任务
	if IsHaveMission( sceneId, selfId, x600044_g_MissionId ) > 0 then
		AddNumText( sceneId, x600044_g_ScriptId, x600044_g_MissionName,3,-1 )
	end
end

--**********************************
--检测Ti猵 th跫�
--**********************************
function x600044_CheckAccept( sceneId, selfId )
	local ret = CallScriptFunction( x600044_g_MilitaryScript, "CheckAccept", sceneId, selfId )
	return ret
end

--**********************************
--Ti猵 th�
--**********************************
function x600044_OnAccept( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x600044_g_Name then		--判断该npc喧ng否喧ng对应任务to� 鸬 npc
		return
	end

	local myLevel = GetLevel( sceneId, selfId )

	if GetLevel( sceneId, selfId ) < 40 then
		CallScriptFunction( x600044_g_CityMissionScript, "NotifyFailTips", sceneId, selfId, "Kh鬾g 瘘 鹌ng c" )
		return
	end

	--加入任务到玩家列表
	AddMission( sceneId, selfId, x600044_g_MissionId, x600044_g_ScriptId, 1, 0, 0 )	-- kill、area、item
	if IsHaveMission( sceneId, selfId, x600044_g_MissionId ) <= 0 then
		return
	end

	CallScriptFunction( x600044_g_MilitaryScript, "OnAccept", sceneId, selfId, targetId, x600044_g_ScriptId )

	local misIndex = GetMissionIndexByID( sceneId, selfId, x600044_g_MissionId )
	local nMonsterId, strMonsterName, strMonsterSceneDesc = LuaFnGetLevelMatchingMonster( x600044_g_MonsterOffset, myLevel )

	local count = floor( myLevel/10 ) * 5 + 5
	SetMissionByIndex( sceneId, selfId, misIndex, x600044_g_MissionParam_MonsterId, nMonsterId )
	SetMissionByIndex( sceneId, selfId, misIndex, x600044_g_MissionParam_MonsterNeeded, count )

	strMonsterSceneDesc = gsub( strMonsterSceneDesc, "许ch", "" )

	--显示内容告诉玩家已经Ti猵 th巳挝�
	BeginEvent( sceneId )
		local missionInfo
		missionInfo = format( "    L鷆 m緄 x鈟 d駈g th鄋h th�, lu鬾 g ph鋓 %s c黙 %s x鈓 l唼c, l鷆 痼 ch鷑g t鬷 d鈔 韙, th� l馽 y猽 総, ch� c� th� nh靚 b鱪 %s l祅g h鄋h. #r B鈟 gi�, %s, ch鷑g t鬷 疸 c� 馥y 瘘 l馽 l唼ng! 衖 %s gi猼 %d t阯 %s, h銀 疳nh 1 tr th 皓p m!",
				strMonsterSceneDesc, strMonsterName, strMonsterName, GetName( sceneId, selfId ),
				strMonsterSceneDesc, count, strMonsterName )

		AddText( sceneId, missionInfo )
		AddText( sceneId, "    C醕 h� 疸 nh nhi甿 v�: " .. x600044_g_MissionName )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--放弃
--**********************************
function x600044_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应to� 鸬 任务
	CallScriptFunction( x600044_g_MilitaryScript, "OnAbandon", sceneId, selfId )
end

--**********************************
--继续
--**********************************
function x600044_OnContinue( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, x600044_g_MissionName )
		AddText( sceneId, x600044_g_MissionComplete )
	EndEvent( )
	DispatchMissionContinueInfo( sceneId, selfId, targetId, x600044_g_ScriptId, x600044_g_MissionId )
end

--**********************************
--检测喧ng否可以提交
--**********************************
function x600044_CheckSubmit( sceneId, selfId )
	local ret = CallScriptFunction( x600044_g_MilitaryScript, "CheckSubmit", sceneId, selfId )
	return ret
end

--**********************************
--提交
--**********************************
function x600044_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if GetName( sceneId, targetId ) ~= x600044_g_Name then			--判断该npc喧ng否喧ng对应任务to� 鸬 npc
		return
	end

	if x600044_CheckSubmit( sceneId, selfId ) == 1 then
		CallScriptFunction( x600044_g_MilitaryScript, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x600044_OnKillObject( sceneId, selfId, objdataId, objId )	--参数意思: 场景号、玩家objId、怪物表位置号、怪物objId
	local allOwnersCount = GetMonsterOwnerCount( sceneId, objId )		--取 餴琺C醝 n鄖 怪物死后拥有分配权to� 鸬 人数
	local curOwner, misIndex
	local nNpcId, strNpcName, nNeeded, nKilled
	local MonsterName = GetName( sceneId, objId )

	for i = 0, allOwnersCount - 1 do
		curOwner = GetMonsterOwnerID( sceneId, objId, i )				--取 餴琺拥有分配权to� 鸬 人to� 鸬 objId
		if IsHaveMission( sceneId, curOwner, x600044_g_MissionId ) > 0 and
		   GetScriptIDByMissionID( sceneId, curOwner, x600044_g_MissionId ) == x600044_g_ScriptId then		--如果C醝 n鄖 人拥有任务
			misIndex = GetMissionIndexByID( sceneId, curOwner, x600044_g_MissionId )
			nNpcId = GetMissionParam( sceneId, curOwner, misIndex, x600044_g_MissionParam_MonsterId )
			_, strNpcName = GetNpcInfoByNpcId( sceneId, nNpcId )

			if MonsterName == strNpcName then
				nNeeded = GetMissionParam( sceneId, curOwner, misIndex, x600044_g_MissionParam_MonsterNeeded )
				nKilled = GetMissionParam( sceneId, curOwner, misIndex, x600044_g_MissionParam_MonsterKilled )
				nKilled = nKilled + 1

				SetMissionByIndex( sceneId, curOwner, misIndex, x600044_g_MissionParam_MonsterKilled, nKilled )
				CallScriptFunction( x600044_g_CityMissionScript, "NotifyFailTips", sceneId, curOwner,
					format( "秀 gi猼 ch猼 %s: %d/%d", MonsterName, nKilled, nNeeded ) )

				if nNeeded <= nKilled then
					SetMissionByIndex( sceneId, curOwner, misIndex, x600044_g_IsMissionOkFail, 1 )
					ResetMissionEvent( sceneId, curOwner, x600044_g_MissionId, 0 )	-- 不再关心杀怪
				end
			end
		end
	end
end

--**********************************
--进入区域事件
--**********************************
function x600044_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x600044_OnItemChanged( sceneId, selfId, itemdataId )
end
