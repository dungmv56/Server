-- 收集宝石
--MisDescBegin
-- 脚本号
x600027_g_ScriptId = 600027

--任务号
x600027_g_MissionId = 1110

--M鴆 ti陁 nhi甿 v鴑pc
x600027_g_Name = "恤ng Ph� Dung"

--任务归类
x600027_g_MissionKind = 50

--衅ng c nhi甿 v� 
x600027_g_MissionLevel = 10000

--喧ng否喧ngTinh英任务
x600027_g_IfMissionElite = 0

--下面几项喧ng动态显示to� 鸬 内容,用于T読 任务列表中动态显示任务情况**********************
x600027_g_IsMissionOkFail			=0	--0 Nhi甿 v� ho鄋 th鄋h标记[值不能变]
x600027_g_MissionParam_SubId		=1	--1 子任务脚本号存放位置[值不能变]
x600027_g_GemCount					=2	--2 C to� 鸬 宝石数量
x600027_g_GemSerialNum				=3	--3 C to� 鸬 宝石

--以上喧ng动态**************************************************************

--任务变量第m祎 位用来存储随机 餴琺到to� 鸬 脚本号

--任务文本描述
x600027_g_MissionName = "Nhi甿 v� khu猚h tr呓ng"
x600027_g_MissionInfo = ""			--任务描述
x600027_g_MissionTarget = "    T靘 %s c醝 %i 疬a cho b眓 bang 邪ng Ph� Dung (148, 96). "	--M鴆 ti陁 nhi甿 v�
x600027_g_ContinueInfo = "    Nhi甿 v� c黙 c醕 h� v鏽 ch遖 ho鄋 th鄋h �?"					--未Ho鄋 t nhi甿 v鴗o� 鸬 npc对话
x600027_g_SubmitInfo = "    S� t靚h ti猲 tri琻 nh� th� n鄌 r癷?"							--完成未提交时to� 鸬 npc对话
x600027_g_MissionComplete = "     R t痶 r t痶. "							--Ho鄋 t nhi甿 v鴑pc说话to� 鸬 话

x600027_g_Parameter_Item_AllRandom = { { id = 3, num = 2 } }

x600027_g_StrForePart = 2
x600027_g_Offset = 35													-- Suppose to ?, 表里第几c醝物品列to� 鸬 偏移量

x600027_g_MissionRound = 55

-- 通用Th鄋h ph� 任务脚本
x600027_g_CityMissionScript = 600001
x600027_g_ExpandScript = 600023

x600027_g_StrList = { " 0 ", " 1 ", " 2 ", " 3 ", " 4 ", " 5 ", " 6 ", " 7 ", " 8 ", " 9 ", " 10 " }

--任务奖励


--MisDescEnd
--**********************************
--任务入口函数
--**********************************
function x600027_OnDefaultEvent( sceneId, selfId, targetId )	-- 餴琺击该任务后执行此脚本
	if GetName( sceneId, targetId ) ~= x600027_g_Name then		--判断该npc喧ng否喧ng对应任务to� 鸬 npc
		return
	end

	--如果已接此任务
	if IsHaveMission( sceneId, selfId, x600027_g_MissionId ) > 0 then
		--发送任务需求to� 鸬 信息
		local bDone = x600027_CheckSubmit( sceneId, selfId )
		local strText

		if bDone == 1 then
			strText = x600027_g_SubmitInfo
		else
			strText = x600027_g_ContinueInfo
		end

		--发送任务需求to� 鸬 信息
		BeginEvent( sceneId )
			AddText( sceneId, x600027_g_MissionName )
			AddText( sceneId, strText )
		EndEvent( )
		DispatchMissionDemandInfo( sceneId, selfId, targetId, x600027_g_ScriptId, x600027_g_MissionId, bDone )
	--Th鯽 m鉵任务接收条件
	elseif x600027_CheckAccept( sceneId, selfId ) > 0 then
		local nTemp = CallScriptFunction( x600027_g_CityMissionScript, "CanDoMisToDay", sceneId, selfId )
		if nTemp == 1   then
			x600027_OnAccept( sceneId, selfId, targetId )
		end
	end
end

--**********************************
--列举事件
--**********************************
function x600027_OnEnumerate( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x600027_g_Name then		--判断该npc喧ng否喧ng对应任务to� 鸬 npc
		return
	end

   --如果已接此任务
	if IsHaveMission( sceneId, selfId, x600027_g_MissionId ) > 0 then
		AddNumText( sceneId, x600027_g_ScriptId, x600027_g_MissionName,3,-1 )
	end
end

--**********************************
--检测Ti猵 th跫�
--**********************************
function x600027_CheckAccept( sceneId, selfId )
	local ret = CallScriptFunction( x600027_g_ExpandScript, "CheckAccept", sceneId, selfId )
	return ret
end

--**********************************
--根据相应建筑 餴琺到对应MissionItem_HashTable.txt中to� 鸬 单元索引
--**********************************
function x600027_GetMissionItemIndex( sceneId, selfId )
	local nBuildingLevel = CityGetBuildingLevel( sceneId, selfId, sceneId, CITY_BUILDING_XIANYA )
	local nPos

	if nBuildingLevel == 0 then								-- 1
		nPos = x600027_g_Offset
	elseif nBuildingLevel == 1 then							-- 2
		nPos = x600027_g_Offset + 1
	elseif nBuildingLevel == 2 then							-- 3
		nPos = x600027_g_Offset + 2
	elseif nBuildingLevel == 3 then							-- 4
		nPos = x600027_g_Offset + 3
	else													-- 5
		nPos = 161
	end

	return nPos
end

--**********************************
--根据玩家等c 餴琺到C 找寻to� 鸬 宝石数量
--**********************************
function x600027_GetMissionItemCount( sceneId, selfId )
	local nPlayerLevel = GetLevel( sceneId, selfId )
	local nCount

	if nPlayerLevel < 55 then								-- 40 ~ 54
		nCount = 1
	elseif nPlayerLevel < 70 then							-- 55 ~ 69
		nCount = random(2)
	elseif nPlayerLevel < 85 then							-- 70 ~ 84
		nCount = random(2)
	else													-- 85 ~ 100
		nCount = random(3)
	end

	return nCount
end

--**********************************
--Ti猵 th�
--**********************************
function x600027_OnAccept( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x600027_g_Name then		--判断该npc喧ng否喧ng对应任务to� 鸬 npc
		return
	end

	if GetLevel( sceneId, selfId ) < 40 then
		CallScriptFunction( x600027_g_CityMissionScript, "NotifyFailTips", sceneId, selfId, "Kh鬾g 瘘 鹌ng c" )
		return
	end

	--加入任务到玩家列表
	AddMission( sceneId, selfId, x600027_g_MissionId, x600027_g_ScriptId, 0, 0, 1 )	-- kill、area、item
	if IsHaveMission( sceneId, selfId, x600027_g_MissionId ) <= 0 then
		return
	end

	CallScriptFunction( x600027_g_ExpandScript, "OnAccept", sceneId, selfId, targetId, x600027_g_ScriptId )

	local misIndex = GetMissionIndexByID( sceneId, selfId, x600027_g_MissionId )
	local nitemId, strItemName, _ = GetOneMissionItem( x600027_GetMissionItemIndex( sceneId, selfId ) )
	local nCount = x600027_GetMissionItemCount( sceneId, selfId )

	SetMissionByIndex( sceneId, selfId, misIndex, x600027_g_GemSerialNum, nitemId )
	SetMissionByIndex( sceneId, selfId, misIndex, x600027_g_GemCount, nCount )

	--显示内容告诉玩家已经Ti猵 th巳挝�
	BeginEvent( sceneId )
		local missionInfo
		if random(2) == 1 then
			missionInfo = format( "    Bang ta v� mu痭 k猼 giao giang h� hi畃 kh醕h, c l鄊 m祎 s� 鸢 c鬾g ngh� ph, c醕 h� c t痗 t靘 %d %s h� ta v�", nCount, strItemName )
		else
			missionInfo = format( "    Bang ta c %d %s 瓞 k猼 giao v緄 h鄌 ki畉 giang h�, nhi甿 v� t靘 %s ch ch ch� c� c醕 h� ch� kh鬾g c騨 ai kh醕", nCount, strItemName, strItemName )
		end

		AddText( sceneId, missionInfo )
		AddText( sceneId, "#rC醕 h� 疸 nh " .. x600027_g_MissionName )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

	-- 检测身上喧ng否已有此物品
	if LuaFnGetAvailableItemCount( sceneId, selfId, nitemId ) > 0 then
		x600027_OnItemChanged( sceneId, selfId, nitemId )
	end
end

--**********************************
--放弃
--**********************************
function x600027_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应to� 鸬 任务
	CallScriptFunction( x600027_g_ExpandScript, "OnAbandon", sceneId, selfId )
end

--**********************************
--继续
--**********************************
function x600027_OnContinue( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, x600027_g_MissionName )
		AddText( sceneId, x600027_g_MissionComplete )
	EndEvent( )
	DispatchMissionContinueInfo( sceneId, selfId, targetId, x600027_g_ScriptId, x600027_g_MissionId )
end

--**********************************
--检测喧ng否可以提交
--**********************************
function x600027_CheckSubmit( sceneId, selfId )
	local ret = CallScriptFunction( x600027_g_ExpandScript, "CheckSubmit", sceneId, selfId )

	if ret == 1 then
		local misIndex = GetMissionIndexByID( sceneId, selfId, x600027_g_MissionId )
		local demandItemId = GetMissionParam( sceneId, selfId, misIndex, x600027_g_GemSerialNum )
		local nCountNeeded = GetMissionParam( sceneId, selfId, misIndex, x600027_g_GemCount )
		local nItemNum = LuaFnGetAvailableItemCount( sceneId, selfId, demandItemId )

		if nItemNum < nCountNeeded then
			ret = 0
		end
	end

	return ret
end

--**********************************
--提交
--**********************************
function x600027_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if GetName( sceneId, targetId ) ~= x600027_g_Name then		--判断该npc喧ng否喧ng对应任务to� 鸬 npc
		return
	end

	if x600027_CheckSubmit( sceneId, selfId ) == 1 then
		-- 扣东西
		local misIndex = GetMissionIndexByID( sceneId, selfId, x600027_g_MissionId )
		local demandItemId = GetMissionParam( sceneId, selfId, misIndex, x600027_g_GemSerialNum )
		local nCountNeeded = GetMissionParam( sceneId, selfId, misIndex, x600027_g_GemCount )
		local nItemNum = LuaFnGetAvailableItemCount( sceneId, selfId, demandItemId )

		if nItemNum >= nCountNeeded then
			LuaFnDelAvailableItem( sceneId, selfId, demandItemId, nCountNeeded )
		else											-- 只作为容错,理论上不可能发生
			SetMissionByIndex( sceneId, selfId, misIndex, x600027_g_IsMissionOkFail, 0 )
			return
		end

		CallScriptFunction( x600027_g_ExpandScript, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x600027_OnKillObject( sceneId, selfId, objdataId, objId )	--参数意思: 场景号、玩家objId、怪物表位置号、怪物objId
end

--**********************************
--进入区域事件
--**********************************
function x600027_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x600027_OnItemChanged( sceneId, selfId, itemdataId )
	local misIndex = GetMissionIndexByID( sceneId, selfId, x600027_g_MissionId )

	local _, strItemName, _ = GetItemInfoByItemId( itemdataId )
	local demandItemId = GetMissionParam( sceneId, selfId, misIndex, x600027_g_GemSerialNum )
	local nCountNeeded = GetMissionParam( sceneId, selfId, misIndex, x600027_g_GemCount )
	local _, strDemandItemName, _ = GetItemInfoByItemId( demandItemId )

	if strItemName == strDemandItemName then
		local nItemNum = GetItemCount( sceneId, selfId, itemdataId )
		local strText = format( "C� 疬㧟 %s %d/%d", strItemName, nItemNum, nCountNeeded )

		if nItemNum <= nCountNeeded then
			SetMissionByIndex( sceneId, selfId, misIndex, x600027_g_IsMissionOkFail, 0 )
		end

		if nItemNum >= nCountNeeded then
			SetMissionByIndex( sceneId, selfId, misIndex, x600027_g_IsMissionOkFail, 1 )
		end
		if (strText and nItemNum <= nCountNeeded) then
			CallScriptFunction( x600027_g_CityMissionScript, "NotifyFailTips", sceneId, selfId, strText )
		end
	end
end
