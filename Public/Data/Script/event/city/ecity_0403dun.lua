-- 催债,通知取货任务
--MisDescBegin
-- 脚本号
x600020_g_ScriptId = 600020

--任务号
x600020_g_MissionId = 1108

--M鴆 ti陁 nhi甿 v鴑pc
x600020_g_Name = "M礳 D竎h"

--任务归类
x600020_g_MissionKind = 50

--衅ng c nhi甿 v� 
x600020_g_MissionLevel = 10000

--喧ng否喧ngTinh英任务
x600020_g_IfMissionElite = 0

--下面几项喧ng动态显示to� 鸬 内容,用于T読 任务列表中动态显示任务情况**********************
x600020_g_IsMissionOkFail = 0							-- Nhi甿 v� ho鄋 th鄋h标记

--以上喧ng动态**************************************************************

--任务变量第m祎 位用来存储随机 餴琺到to� 鸬 脚本号

--任务文本描述
x600020_g_MissionName = "Nhi甿 v� th呓ng nghi畃"
x600020_g_MissionInfo = "    H鬽 nay ta mu痭 c� %s, t靘 l読 疴y gi鷓 ta!"			--任务描述
x600020_g_MissionTarget = "    Th鬾g b醥 %n nhanh ch髇g %s. "							--M鴆 ti陁 nhi甿 v�
x600020_g_ContinueInfo = "    Nhi甿 v� c黙 c醕 h� v鏽 ch遖 ho鄋 th鄋h �?"					--未Ho鄋 t nhi甿 v鴗o� 鸬 npc对话
x600020_g_SubmitInfo = "    S� t靚h ti猲 tri琻 nh� th� n鄌 r癷?"							--完成未提交时to� 鸬 npc对话
x600020_g_MissionComplete = "    L鄊 t痶 l, r t痶 r t痶. "					--Ho鄋 t nhi甿 v鴑pc说话to� 鸬 话

x600020_g_StrForePart = 5
x600020_g_Offset = 21													-- Suppose to 21, 表里第几列 NPC to� 鸬 偏移量
x600020_g_OffsetEx	= 251 										--表里第几列 NPC to� 鸬 偏移量扩充 modi:lby20071126
x600020_g_MissionRound = 44

-- 通用Th鄋h ph� 任务脚本
x600020_g_CityMissionScript = 600001
x600020_g_MarketScript = 600017

x600020_g_StrList = { "Tr� l読 s� n�", "歇n l h鄋h" }

--任务奖励

--MisDescEnd

x600020_g_Pronoun = {}
x600020_g_Pronoun[0] = "mu礽  "
x600020_g_Pronoun[1] = "huynh  "

--**********************************
--任务入口函数
--**********************************
function x600020_OnDefaultEvent( sceneId, selfId, targetId )	-- 餴琺击该任务后执行此脚本
	if GetName( sceneId, targetId ) ~= x600020_g_Name then		--判断该npc喧ng否喧ng对应任务to� 鸬 npc
		return
	end

	--如果已接此任务
	if IsHaveMission( sceneId, selfId, x600020_g_MissionId ) > 0 then
		--发送任务需求to� 鸬 信息
		local bDone = x600020_CheckSubmit( sceneId, selfId )
		local strText

		if bDone == 1 then
			strText = x600020_g_SubmitInfo
		else
			strText = x600020_g_ContinueInfo
		end

		--发送任务需求to� 鸬 信息
		BeginEvent( sceneId )
			AddText( sceneId, x600020_g_MissionName )
			AddText( sceneId, strText )
		EndEvent( )
		DispatchMissionDemandInfo( sceneId, selfId, targetId, x600020_g_ScriptId, x600020_g_MissionId, bDone )
	--Th鯽 m鉵任务接收条件
	elseif x600020_CheckAccept( sceneId, selfId ) > 0 then
		local nTemp = CallScriptFunction( x600020_g_CityMissionScript, "CanDoMisToDay", sceneId, selfId )
		if nTemp == 1   then
			x600020_OnAccept( sceneId, selfId, targetId )
		end
	end
end

--**********************************
--列举事件
--**********************************
function x600020_OnEnumerate( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x600020_g_Name then		--判断该npc喧ng否喧ng对应任务to� 鸬 npc
		return
	end

   --如果已接此任务
	if IsHaveMission( sceneId, selfId, x600020_g_MissionId ) > 0 then
		AddNumText( sceneId, x600020_g_ScriptId, x600020_g_MissionName,3,-1 )
	end
end

--**********************************
--检测Ti猵 th跫�
--**********************************
function x600020_CheckAccept( sceneId, selfId )
	local ret = CallScriptFunction( x600020_g_MarketScript, "CheckAccept", sceneId, selfId )
	return ret
end

--**********************************
--根据玩家等c 餴琺到对应MissionNPC_HashTable.txt中to� 鸬 选择信息
--**********************************
function x600020_GetMissionNPCKey( sceneId, selfId )
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

	--return nPos + x600020_g_Offset
	elseif	nPlayerLevel < 100 then					-- 85 ~ 99 Level
		nPos = 3
	elseif nPlayerLevel < 120 then					-- 100 ~ 119 Level	modi:lby20071126
		nPos = 0
	else 																		-- >=114 Level
		nPos = 1
		
	end
	
	if nPlayerLevel < 100 then
		return nPos + x600020_g_Offset
	else
		return nPos + x600020_g_OffsetEx
	end
	
end

--**********************************
--Ti猵 th�
--**********************************
function x600020_OnAccept( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x600020_g_Name then		--判断该npc喧ng否喧ng对应任务to� 鸬 npc
		return
	end

	if GetLevel( sceneId, selfId ) < 40 then
		CallScriptFunction( x600020_g_CityMissionScript, "NotifyFailTips", sceneId, selfId, "Kh鬾g 瘘 鹌ng c" )
		return
	end

	--加入任务到玩家列表
	AddMission( sceneId, selfId, x600020_g_MissionId, x600020_g_ScriptId, 0, 0, 0 )	-- kill、area、item
	if IsHaveMission( sceneId, selfId, x600020_g_MissionId ) <= 0 then
		return
	end

	SetMissionEvent( sceneId, selfId, x600020_g_MissionId, 4 ) -- 注册 x600020_OnLockedTarget 事件

	CallScriptFunction( x600020_g_MarketScript, "OnAccept", sceneId, selfId, targetId, x600020_g_ScriptId )

	local misIndex = GetMissionIndexByID( sceneId, selfId, x600020_g_MissionId )
	local nNpcId, strNpcName, strNpcScene, _, nPosX, nPosZ, _, nGender = GetOneMissionNpc( x600020_GetMissionNPCKey( sceneId, selfId ) )

	SetMissionByIndex( sceneId, selfId, misIndex, x600020_g_StrForePart, nNpcId )

	--显示内容告诉玩家已经Ti猵 th巳挝�
	BeginEvent( sceneId )
		local missionInfo
		local rand = random(2)

		SetMissionByIndex( sceneId, selfId, misIndex, x600020_g_StrForePart + 1, rand - 1 )

		if rand == 1 then
			missionInfo = format( "    %s %s (%d, %d) 疸 n� B鋘 Th鄋h, nhi甿 v� c黙 c醕 h� l n鄖 l� nh v緄 %s, b鋙 %s nhanh ch髇g tr� ch鷑g.",
				strNpcScene, strNpcName, nPosX, nPosZ, x600020_g_Pronoun[nGender], x600020_g_Pronoun[nGender] )
		else
			missionInfo = format( "    %s %s (%d, %d) 疸 tr� ti玭, phi玭 c醕 h� th鬾g b醥 cho %s 皙n l h鄋g",
				strNpcScene, strNpcName, nPosX, nPosZ, x600020_g_Pronoun[nGender] )
		end

		AddText( sceneId, missionInfo )
		AddText( sceneId, "    C醕 h� 疸 nh nhi甿 v�: " .. x600020_g_MissionName )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--放弃
--**********************************
function x600020_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应to� 鸬 任务
	CallScriptFunction( x600020_g_MarketScript, "OnAbandon", sceneId, selfId )
end

--**********************************
--继续
--**********************************
function x600020_OnContinue( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, x600020_g_MissionName )
		AddText( sceneId, x600020_g_MissionComplete )
	EndEvent( )
	DispatchMissionContinueInfo( sceneId, selfId, targetId, x600020_g_ScriptId, x600020_g_MissionId )
end

--**********************************
--检测喧ng否可以提交
--**********************************
function x600020_CheckSubmit( sceneId, selfId )
	local ret = CallScriptFunction( x600020_g_MarketScript, "CheckSubmit", sceneId, selfId )
	return ret
end

--**********************************
--提交
--**********************************
function x600020_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if GetName( sceneId, targetId ) ~= x600020_g_Name then		--判断该npc喧ng否喧ng对应任务to� 鸬 npc
		return
	end

	if x600020_CheckSubmit( sceneId, selfId ) == 1 then
		CallScriptFunction( x600020_g_MarketScript, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x600020_OnKillObject( sceneId, selfId, objdataId, objId )	--参数意思: 场景号、玩家objId、怪物表位置号、怪物objId
end

--**********************************
--进入区域事件
--**********************************
function x600020_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x600020_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--当锁定m祎 c醝对象
--**********************************
function x600020_OnLockedTarget( sceneId, selfId, objId )
	if IsHaveMission( sceneId, selfId, x600020_g_MissionId ) < 1 then
		return		-- 没有该任务
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x600020_g_MissionId )		-- 餴琺到任务T読 20c醝任务中to� 鸬 序列号
	if GetMissionParam( sceneId, selfId, misIndex, x600020_g_IsMissionOkFail ) > 0 then
		return		-- 该任务已完成
	end

	local nNpcId
	local strNpcName
	local PosX
	local PosZ

	nNpcId = GetMissionParam( sceneId, selfId, misIndex, x600020_g_StrForePart )
	_, strNpcName, _, PosX, PosZ = GetNpcInfoByNpcId(sceneId, nNpcId )

	-- 暂时不比较位置
	if GetName( sceneId, objId ) == strNpcName then
		local misType
		misType = GetMissionParam( sceneId, selfId, misIndex, x600020_g_StrForePart + 1 )
		misType = misType + 1

		-- 设置任务已经完成
		SetMissionByIndex( sceneId, selfId, misIndex, x600020_g_IsMissionOkFail, 1 )
		-- 将该任务从 x600020_OnLockedTarget 事件列表中清除,该任务不再关心此类事件
		ResetMissionEvent( sceneId, selfId, x600020_g_MissionId, 4 )
		if misType == 1 then
			TAddText( sceneId, "    T痶 t痶, xin chuy琻 l秈 cho ng叨i ph� tr醕h qu鋘 l� c豠 h鄋g M礳 D竎h, sau 痼 s� mang ti玭 h鄋g 皙n" )
		else
			TAddText( sceneId, "    T痶 t痶, s� cho ng叨i 疳nh xe 皙n l h鄋g ngay" )
		end
	end
end
