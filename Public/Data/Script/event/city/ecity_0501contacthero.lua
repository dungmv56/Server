-- 结识江湖豪杰
--MisDescBegin
-- 脚本号
x600024_g_ScriptId = 600024

--任务号
x600024_g_MissionId = 1110

--M鴆 ti陁 nhi甿 v鴑pc
x600024_g_Name = "恤ng Ph� Dung"

--任务归类
x600024_g_MissionKind = 50

--衅ng c nhi甿 v� 
x600024_g_MissionLevel = 10000

--喧ng否喧ngTinh英任务
x600024_g_IfMissionElite = 0

--下面几项喧ng动态显示to� 鸬 内容,用于T読 任务列表中动态显示任务情况**********************
x600024_g_IsMissionOkFail = 0							-- Nhi甿 v� ho鄋 th鄋h标记

--以上喧ng动态**************************************************************

--任务变量第m祎 位用来存储随机 餴琺到to� 鸬 脚本号

--任务文本描述
x600024_g_MissionName = "Nhi甿 v� khu猚h tr呓ng"
x600024_g_MissionInfo = "    H鬽 nay ta mu痭 c� %s, t靘 l読 疴y gi鷓 ta!"			--任务描述
x600024_g_MissionTarget = "    Sau 痼 疬a tin cho %n. "							--M鴆 ti陁 nhi甿 v�
x600024_g_ContinueInfo = "    Nhi甿 v� c黙 c醕 h� v鏽 ch遖 ho鄋 th鄋h �?"					--未Ho鄋 t nhi甿 v鴗o� 鸬 npc对话
x600024_g_SubmitInfo = "    S� t靚h ti猲 tri琻 nh� th� n鄌 r癷?"							--完成未提交时to� 鸬 npc对话
x600024_g_MissionComplete = "    羞㧟 l 疬㧟 l, l n鄖 ti猲g t錷 c黙 b眓 bang s� 疬㧟 lan truy玭 trong giang h�. "		--Ho鄋 t nhi甿 v鴑pc说话to� 鸬 话

x600024_g_StrForePart = 5
x600024_g_NPCOffset = 30												-- Suppose to 30, 表里第几列 NPC to� 鸬 偏移量
x600024_g_NPCOffsetEx	= 255 										--表里第几列 NPC to� 鸬 偏移量扩充 modi:lby20071126

x600024_g_MissionRound = 55

-- 通用Th鄋h ph� 任务脚本
x600024_g_CityMissionScript = 600001
x600024_g_ExpandScript = 600023

--任务奖励

--MisDescEnd

x600024_g_TargetNPC = x600024_g_StrForePart
x600024_g_MissionItem = 40004256

x600024_g_Pronoun = {}
x600024_g_Pronoun[0] = "mu礽  "
x600024_g_Pronoun[1] = "huynh  "

--**********************************
--任务入口函数
--**********************************
function x600024_OnDefaultEvent( sceneId, selfId, targetId )	-- 餴琺击该任务后执行此脚本
	if GetName( sceneId, targetId ) ~= x600024_g_Name then		--判断该npc喧ng否喧ng对应任务to� 鸬 npc
		return
	end

	--如果已接此任务
	if IsHaveMission( sceneId, selfId, x600024_g_MissionId ) > 0 then
		--发送任务需求to� 鸬 信息
		local bDone = x600024_CheckSubmit( sceneId, selfId )
		local strText

		if bDone == 1 then
			strText = x600024_g_SubmitInfo
		else
			strText = x600024_g_ContinueInfo
		end

		--发送任务需求to� 鸬 信息
		BeginEvent( sceneId )
			AddText( sceneId, x600024_g_MissionName )
			AddText( sceneId, strText )
		EndEvent( )
		DispatchMissionDemandInfo( sceneId, selfId, targetId, x600024_g_ScriptId, x600024_g_MissionId, bDone )
	--Th鯽 m鉵任务接收条件
	elseif x600024_CheckAccept( sceneId, selfId ) > 0 then
		local nTemp = CallScriptFunction( x600024_g_CityMissionScript, "CanDoMisToDay", sceneId, selfId )
		if nTemp == 1   then
			x600024_OnAccept( sceneId, selfId, targetId )
		end
	end
end

--**********************************
--列举事件
--**********************************
function x600024_OnEnumerate( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x600024_g_Name then		--判断该npc喧ng否喧ng对应任务to� 鸬 npc
		return
	end

   --如果已接此任务
	if IsHaveMission( sceneId, selfId, x600024_g_MissionId ) > 0 then
		AddNumText( sceneId, x600024_g_ScriptId, x600024_g_MissionName,3,-1 )
	end
end

--**********************************
--检测Ti猵 th跫�
--**********************************
function x600024_CheckAccept( sceneId, selfId )
	local ret = CallScriptFunction( x600024_g_ExpandScript, "CheckAccept", sceneId, selfId )
	return ret
end

--**********************************
--根据玩家等c 餴琺到对应MissionNPC_HashTable.txt中to� 鸬 选择信息
--**********************************
function x600024_GetMissionNPCKey( sceneId, selfId )
	local nPlayerLevel = GetLevel( sceneId, selfId )
	local nPos

	if nPlayerLevel < 55 then								-- 40 ~ 54
		nPos = 0
	elseif nPlayerLevel < 70 then							-- 55 ~ 69
		nPos = 1
	elseif nPlayerLevel < 85 then							-- 70 ~ 84
		nPos = 2
	--else													-- 85 ~ 100
	--	nPos = 3
	--end

	--return nPos + x600024_g_NPCOffset
	elseif	nPlayerLevel < 100 then					-- 85 ~ 99 Level
		nPos = 3
	elseif nPlayerLevel < 115 then					-- 100 ~ 119 Level	modi:lby20071126
		nPos = 0
	else 																		-- >=115 Level
		nPos = 1
		
	end
	
	if nPlayerLevel < 100 then
		return nPos + x600024_g_NPCOffset
	else
		return nPos + x600024_g_NPCOffsetEx
	end
end

--**********************************
--Ti猵 th�
--**********************************
function x600024_OnAccept( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x600024_g_Name then		--判断该npc喧ng否喧ng对应任务to� 鸬 npc
		return
	end

	if GetLevel( sceneId, selfId ) < 40 then
		CallScriptFunction( x600024_g_CityMissionScript, "NotifyFailTips", sceneId, selfId, "Kh鬾g 瘘 鹌ng c" )
		return
	end

	local pos = LuaFnTryRecieveItem( sceneId, selfId, x600024_g_MissionItem, QUALITY_MUST_BE_CHANGE )
	if pos == -1 then
		CallScriptFunction( x600024_g_CityMissionScript, "NotifyFailTips", sceneId, selfId, "Ch� tr痭g trong t鷌 x醕h kh鬾g 瘘" )
		return
	end

	--加入任务到玩家列表
	AddMission( sceneId, selfId, x600024_g_MissionId, x600024_g_ScriptId, 0, 0, 0 )	-- kill、area、item
	if IsHaveMission( sceneId, selfId, x600024_g_MissionId ) <= 0 then
		return
	end

	SetMissionEvent( sceneId, selfId, x600024_g_MissionId, 4 ) -- 注册 x600024_OnLockedTarget 事件

	CallScriptFunction( x600024_g_ExpandScript, "OnAccept", sceneId, selfId, targetId, x600024_g_ScriptId )

	local misIndex = GetMissionIndexByID( sceneId, selfId, x600024_g_MissionId )
	local nNpcId, strNpcName, strNpcScene, nScene, nPosX, nPosZ, _, nGender = GetOneMissionNpc( x600024_GetMissionNPCKey( sceneId, selfId ) )

	SetMissionByIndex( sceneId, selfId, misIndex, x600024_g_TargetNPC, nNpcId )

	strNpcScene = gsub( strNpcScene, "to� 鸬 ", "" )

	--显示内容告诉玩家已经Ti猵 th巳挝�
	BeginEvent( sceneId )
		local missionInfo
		local rand = random( 2 )

		if rand == 1 then
			missionInfo = format( "    L鄊 ng叨i m� kh鬾g bi猼 %s, k� c� c� l� anh h鵱g c鹡g bg kh鬾g. C醕 h� 疬a %s 餴, chuy琻 b裞 th� k猼 giao n鄖 cho %s (%d, %d)",
				strNpcName, strNpcScene, strNpcName, nPosX, nPosZ )
		else
			missionInfo = format( "    %s (%d, %d) c� danh ti猲g tr阯 giang h�, r c� l㱮 cho ch鷑g ta, 餴 %s 疬a th� k猼 giao cho %s",
				strNpcName, nPosX, nPosZ, strNpcScene, x600024_g_Pronoun[nGender] )
		end

		AddText( sceneId, missionInfo )
		AddText( sceneId, "    C醕 h� 疸 nh nhi甿 v�: " .. x600024_g_MissionName )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--放弃
--**********************************
function x600024_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应to� 鸬 任务
	CallScriptFunction( x600024_g_ExpandScript, "OnAbandon", sceneId, selfId )
end

--**********************************
--继续
--**********************************
function x600024_OnContinue( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, x600024_g_MissionName )
		AddText( sceneId, x600024_g_MissionComplete )
	EndEvent( )
	DispatchMissionContinueInfo( sceneId, selfId, targetId, x600024_g_ScriptId, x600024_g_MissionId )
end

--**********************************
--检测喧ng否可以提交
--**********************************
function x600024_CheckSubmit( sceneId, selfId )
	local ret = CallScriptFunction( x600024_g_ExpandScript, "CheckSubmit", sceneId, selfId )
	return ret
end

--**********************************
--提交
--**********************************
function x600024_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if GetName( sceneId, targetId ) ~= x600024_g_Name then		--判断该npc喧ng否喧ng对应任务to� 鸬 npc
		return
	end

	if x600024_CheckSubmit( sceneId, selfId ) == 1 then
		CallScriptFunction( x600024_g_ExpandScript, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x600024_OnKillObject( sceneId, selfId, objdataId, objId )	--参数意思: 场景号、玩家objId、怪物表位置号、怪物objId
end

--**********************************
--进入区域事件
--**********************************
function x600024_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x600024_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--当锁定m祎 c醝对象
--**********************************
function x600024_OnLockedTarget( sceneId, selfId, objId )
	if IsHaveMission( sceneId, selfId, x600024_g_MissionId ) < 1 then
		return		-- 没有该任务
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x600024_g_MissionId )		-- 餴琺到任务T読 20c醝任务中to� 鸬 序列号
	if GetMissionParam( sceneId, selfId, misIndex, x600024_g_IsMissionOkFail ) > 0 then
		return		-- 该任务已完成
	end

	local nNpcId, strNpcName, PosX, PosZ

	nNpcId = GetMissionParam( sceneId, selfId, misIndex, x600024_g_TargetNPC )
	_, strNpcName, _, PosX, PosZ = GetNpcInfoByNpcId(sceneId, nNpcId )

	-- 暂时不比较位置
	if GetName( sceneId, objId ) == strNpcName then
		if DelItem( sceneId, selfId, x600024_g_MissionItem, 1 ) == 1 then
			-- 设置任务已经完成
			SetMissionByIndex( sceneId, selfId, misIndex, x600024_g_IsMissionOkFail, 1 )
			-- 将该任务从 x600024_OnLockedTarget 事件列表中清除,该任务不再关心此类事件
			ResetMissionEvent( sceneId, selfId, x600024_g_MissionId, 4 )

			local rand = random( 2 )
			local strText

			if rand == 1 then
				strText = format( "    D� th鬷, bang ch� c黙 qu� bang ch� kh� ch韓h ngh頰 cao h絥 tr秈 xanh, c� vi甤 g� c ch鷑g ta gi鷓, d� c� ph鋓 nh鋣 v鄌 l豠 c鹡g kh鬾g ch痠 t�" )
			else
				strText = format( "    Kh醕h kh� qu�, 疬㧟 l鄊 vi甤 cho qu� bang l� vinh h課h c黙 %s ta", strNpcName )
			end

			TAddText( sceneId, strText )
		end
	end
end
