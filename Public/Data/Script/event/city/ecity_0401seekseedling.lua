-- 寻找药草样苗任务
--MisDescBegin
-- 脚本号
x600018_g_ScriptId = 600018

--任务号
x600018_g_MissionId = 1108

--M鴆 ti陁 nhi甿 v鴑pc
x600018_g_Name = "M礳 D竎h"

--任务归类
x600018_g_MissionKind = 50

--衅ng c nhi甿 v� 
x600018_g_MissionLevel = 10000

--喧ng否喧ngTinh英任务
x600018_g_IfMissionElite = 0

--下面几项喧ng动态显示to� 鸬 内容,用于T読 任务列表中动态显示任务情况**********************
x600018_g_IsMissionOkFail = 0							-- Nhi甿 v� ho鄋 th鄋h标记

--以上喧ng动态**************************************************************

--任务变量第m祎 位用来存储随机 餴琺到to� 鸬 脚本号

--任务文本描述
x600018_g_MissionName = "Nhi甿 v� th呓ng nghi畃"
x600018_g_MissionInfo = ""			--任务描述
x600018_g_MissionTarget = "    T靘 ki猰 %i, 疬a cho bang h礽 th鄋h th� M礳 D竎h (46, 91). "	--M鴆 ti陁 nhi甿 v�
x600018_g_ContinueInfo = "    Nhi甿 v� c黙 c醕 h� v鏽 ch遖 ho鄋 th鄋h �?"					--未Ho鄋 t nhi甿 v鴗o� 鸬 npc对话
x600018_g_SubmitInfo = "    S� t靚h ti猲 tri琻 nh� th� n鄌 r癷?"							--完成未提交时to� 鸬 npc对话
x600018_g_MissionComplete = "    L鄊 t痶 l, r t痶 r t痶. "					--Ho鄋 t nhi甿 v鴑pc说话to� 鸬 话

x600018_g_Parameter_Item_IDRandom = { { id = 5, num = 1 } }

x600018_g_StrForePart = 5
x600018_g_Offset = 14													-- Suppose to 14, 表里第几c醝物品列to� 鸬 偏移量

x600018_g_MissionRound = 44

-- 通用Th鄋h ph� 任务脚本
x600018_g_CityMissionScript = 600001
x600018_g_MarketScript = 600017

--任务奖励

--MisDescEnd
--**********************************
--任务入口函数
--**********************************
function x600018_OnDefaultEvent( sceneId, selfId, targetId )	-- 餴琺击该任务后执行此脚本
	if GetName( sceneId, targetId ) ~= x600018_g_Name then		--判断该npc喧ng否喧ng对应任务to� 鸬 npc
		return
	end

	--如果已接此任务
	if IsHaveMission( sceneId, selfId, x600018_g_MissionId ) > 0 then
		--发送任务需求to� 鸬 信息
		local bDone = x600018_CheckSubmit( sceneId, selfId )
		local strText

		if bDone == 1 then
			strText = x600018_g_SubmitInfo
		else
			strText = x600018_g_ContinueInfo
		end

		--发送任务需求to� 鸬 信息
		BeginEvent( sceneId )
			AddText( sceneId, x600018_g_MissionName )
			AddText( sceneId, strText )
		EndEvent( )
		DispatchMissionDemandInfo( sceneId, selfId, targetId, x600018_g_ScriptId, x600018_g_MissionId, bDone )
	--Th鯽 m鉵任务接收条件
	elseif x600018_CheckAccept( sceneId, selfId ) > 0 then
		local nTemp = CallScriptFunction( x600018_g_CityMissionScript, "CanDoMisToDay", sceneId, selfId )
		if nTemp == 1   then
			x600018_OnAccept( sceneId, selfId, targetId )
		end
	end
end

--**********************************
--列举事件
--**********************************
function x600018_OnEnumerate( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x600018_g_Name then		--判断该npc喧ng否喧ng对应任务to� 鸬 npc
		return
	end

   --如果已接此任务
	if IsHaveMission( sceneId, selfId, x600018_g_MissionId ) > 0 then
		AddNumText( sceneId, x600018_g_ScriptId, x600018_g_MissionName,3,-1 )
	end
end

--**********************************
--检测Ti猵 th跫�
--**********************************
function x600018_CheckAccept( sceneId, selfId )
	local ret = CallScriptFunction( x600018_g_MarketScript, "CheckAccept", sceneId, selfId )
	return ret
end

--**********************************
--根据相应建筑 餴琺到对应MissionItem_HashTable.txt中to� 鸬 单元索引
--**********************************
function x600018_GetMissionItemIndex( sceneId, selfId )
	local nBuildingLevel = CityGetBuildingLevel( sceneId, selfId, sceneId, CITY_BUILDING_JIFANG )
	local nPos

	if nBuildingLevel == 0 then								-- 1
		nPos = x600018_g_Offset
	elseif nBuildingLevel == 1 then							-- 2
		nPos = x600018_g_Offset + 1
	elseif nBuildingLevel == 2 then							-- 3
		nPos = x600018_g_Offset + 2
	elseif nBuildingLevel == 3 then							-- 4
		nPos = x600018_g_Offset + 3
	else													-- 5
		nPos = 159
	end

	return nPos
end

--**********************************
--Ti猵 th�
--**********************************
function x600018_OnAccept( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x600018_g_Name then		--判断该npc喧ng否喧ng对应任务to� 鸬 npc
		return
	end

	if GetLevel( sceneId, selfId ) < 40 then
		CallScriptFunction( x600018_g_CityMissionScript, "NotifyFailTips", sceneId, selfId, "Kh鬾g 瘘 鹌ng c" )
		return
	end

	--加入任务到玩家列表
	AddMission( sceneId, selfId, x600018_g_MissionId, x600018_g_ScriptId, 0, 0, 1 )	-- kill、area、item
	if IsHaveMission( sceneId, selfId, x600018_g_MissionId ) <= 0 then
		return
	end

	CallScriptFunction( x600018_g_MarketScript, "OnAccept", sceneId, selfId, targetId, x600018_g_ScriptId )

	local misIndex = GetMissionIndexByID( sceneId, selfId, x600018_g_MissionId )
	local nitemId, strItemName, _ = GetOneMissionItem( x600018_GetMissionItemIndex( sceneId, selfId ) )

	SetMissionByIndex( sceneId, selfId, misIndex, x600018_g_StrForePart, nitemId )

	--显示内容告诉玩家已经Ti猵 th巳挝�
	BeginEvent( sceneId )
		local missionInfo
		if random(2) == 1 then
			missionInfo = format( "    B鋘 Th鄋h 餫ng nghi阯 c製 c醕 lo読 thu痗 l�, hi畁 c騨 餫ng thi猽 #Y%s#W, mong c醕 h� c� th� t靘 gi鷓 h� ta", strItemName )
		else
			missionInfo = format( "    Nghe n骾 d唼c l馽 c黙 #Y%s#W r m課h, ch鷑g ta c bi猼 nguy阯 nh鈔, mong c醕 h� t靘 gi鷓 v�, ch ch s� c� c鋗 t�", strItemName )
		end

		AddText( sceneId, missionInfo )
		AddText( sceneId, "#rC醕 h� 疸 nh " .. x600018_g_MissionName )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

	-- 检测身上喧ng否已有此物品
	if LuaFnGetAvailableItemCount( sceneId, selfId, nitemId ) > 0 then
		x600018_OnItemChanged( sceneId, selfId, nitemId )
	end
end

--**********************************
--放弃
--**********************************
function x600018_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应to� 鸬 任务
	CallScriptFunction( x600018_g_MarketScript, "OnAbandon", sceneId, selfId )
end

--**********************************
--继续
--**********************************
function x600018_OnContinue( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, x600018_g_MissionName )
		AddText( sceneId, x600018_g_MissionComplete )
	EndEvent( )
	DispatchMissionContinueInfo( sceneId, selfId, targetId, x600018_g_ScriptId, x600018_g_MissionId )
end

--**********************************
--检测喧ng否可以提交
--**********************************
function x600018_CheckSubmit( sceneId, selfId )
	local ret = CallScriptFunction( x600018_g_MarketScript, "CheckSubmit", sceneId, selfId )

	if ret == 1 then
		local misIndex = GetMissionIndexByID( sceneId, selfId, x600018_g_MissionId )
		local demandItemId = GetMissionParam( sceneId, selfId, misIndex, x600018_g_StrForePart )
		local nItemNum = LuaFnGetAvailableItemCount( sceneId, selfId, demandItemId )

		if nItemNum < 1 then
			ret = 0
		end
	end

	return ret
end

--**********************************
--提交
--**********************************
function x600018_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if GetName( sceneId, targetId ) ~= x600018_g_Name then		--判断该npc喧ng否喧ng对应任务to� 鸬 npc
		return
	end

	if x600018_CheckSubmit( sceneId, selfId ) == 1 then
		-- 扣东西
		local misIndex = GetMissionIndexByID( sceneId, selfId, x600018_g_MissionId )
		local demandItemId = GetMissionParam( sceneId, selfId, misIndex, x600018_g_StrForePart )
		local nItemNum = GetItemCount( sceneId, selfId, demandItemId )

		if nItemNum > 0 then
			DelItem( sceneId, selfId, demandItemId, 1 )
		else											-- 只作为容错,理论上不可能发生
			SetMissionByIndex( sceneId, selfId, misIndex, x600018_g_IsMissionOkFail, 0 )
			return
		end

		CallScriptFunction( x600018_g_MarketScript, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x600018_OnKillObject( sceneId, selfId, objdataId, objId )	--参数意思: 场景号、玩家objId、怪物表位置号、怪物objId
end

--**********************************
--进入区域事件
--**********************************
function x600018_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x600018_OnItemChanged( sceneId, selfId, itemdataId )
	local misIndex = GetMissionIndexByID( sceneId, selfId, x600018_g_MissionId )

	local _, strItemName, _ = GetItemInfoByItemId( itemdataId )
	local demandItemId = GetMissionParam( sceneId, selfId, misIndex, x600018_g_StrForePart )
	local _, strDemandItemName, _ = GetItemInfoByItemId( demandItemId )

	if strItemName == strDemandItemName then
		local nItemNum = GetItemCount( sceneId, selfId, itemdataId )
		local strText
		if nItemNum > 0 then
			strText = format( "秀 c� 疬㧟 %s", strItemName )
			SetMissionByIndex( sceneId, selfId, misIndex, x600018_g_IsMissionOkFail, 1 )
		else
			strText = format( "M 餴 %s", strItemName )
			SetMissionByIndex( sceneId, selfId, misIndex, x600018_g_IsMissionOkFail, 0 )
		end

		CallScriptFunction( x600018_g_CityMissionScript, "NotifyFailTips", sceneId, selfId, strText )
	end
end
