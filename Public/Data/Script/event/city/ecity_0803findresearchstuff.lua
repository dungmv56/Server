--副本任务
--找到原料

--************************************************************************
--MisDescBegin
--脚本号
x600043_g_ScriptId	= 600043
--任务号
x600043_g_MissionId	= 1113
--目标NPC
x600043_g_Name			= "Tr竛h V� Danh"
--衅ng c nhi甿 v� 
x600043_g_MissionLevel					= 10000
--任务归类
x600043_g_MissionKind						= 50
--喧ng否喧ngTinh英任务
x600043_g_IfMissionElite				= 0

--********下面几项喧ng动态显示to� 鸬 内容,用于T読 任务列表中动态显示任务情况******
--角色Mission变量� 餴琺�
x600043_g_IsMissionOkFail				= 0	--0 Nhi甿 v� ho鄋 th鄋h标记
x600043_g_MissionParam_SubId		= 1	--1 子任务脚本号存放位置
x600043_g_MissionParam_Phase		= 2	--2 阶段号 此号用于区分当前任务UIto� 鸬 描述信息
x600043_g_MissionParam_NpcId		= 3	--3 任务 NPC to� 鸬  NPCId 号
x600043_g_MissionParam_ItemId		= 4	--4 任务物品to� 鸬 编号
x600043_g_MissionParam_MonsterId= 5	--5 任务 Monster to� 鸬  NPCId 号
x600043_g_MissionParam_IsCarrier= 6	--6 喧ng否有送信任务
--循环任务to� 鸬 数据索引,里面存着已做to� 鸬 环数
x600043_g_MissionRound					= 61
--**********************************以上喧ng动态****************************

--任务文本描述
x600043_g_MissionName			= "Nghi阯 c製 nhi甿 v�"
x600043_g_MissionInfo			= "N礽 ch韓h th鄋h th� - nhi甿 v� nghi阯 c製"									--任务描述
x600043_g_MissionTarget		= "%f"																	--M鴆 ti陁 nhi甿 v�
x600043_g_ContinueInfo		= "    Nhi甿 v� c黙 c醕 h� v鏽 ch遖 ho鄋 th鄋h �?"					--未Ho鄋 t nhi甿 v鴗o� 鸬 npc对话
x600043_g_SubmitInfo			= "    S� t靚h ti猲 tri琻 nh� th� n鄌 r癷?"								--完成未提交时to� 鸬 npc对话
x600043_g_MissionComplete	= "    R t痶 r t痶, ti猲 鸬 nghi阯 c製 t錸g nhanh kh鬾g 韙. "--Ho鄋 t nhi甿 v鴑pc说话to� 鸬 话

x600043_g_Parameter_Item_IDRandom = { { id = 4, num = 1 } }

x600043_g_StrForePart			= 2

--用来保存字符串格式化to� 鸬 数据
x600043_g_FormatList			= {
	"",
	"    T靘 th %2i, giao cho bang h礽 姓i ch� qu鋘. ",	--1 寻找所需物品
	"    T� %2i giao tr� l読 cho bang h礽 姓i ch� qu鋘. "			--2 送还
}

--通用Th鄋h ph� 任务脚本
x600043_g_CityMissionScript	= 600001
x600043_g_ConstructionScript= 600040

--任务奖励

--MisDescEnd
--************************************************************************

x600043_g_ItemOffset			= 31	--表里第几c醝物品列to� 鸬 偏移量

--阶段任务
x600043_g_PhaseKey				= {}
x600043_g_PhaseKey["fnd"]	= 1		--寻找所需物品
x600043_g_PhaseKey["end"]	= 2		--送还

--**********************************
--任务入口函数
--**********************************
function x600043_OnDefaultEvent( sceneId, selfId, targetId )

	--判断该npc喧ng否喧ng对应任务to� 鸬 npc
	if GetName( sceneId, targetId ) ~= x600043_g_Name then
		return
	end

	--如果已接此任务
	if IsHaveMission( sceneId, selfId, x600043_g_MissionId ) > 0 then
		local bDone = x600043_CheckSubmit( sceneId, selfId )
		local strText

		if bDone == 1 then
			strText = x600043_g_SubmitInfo
		else
			strText = x600043_g_ContinueInfo
		end

		BeginEvent( sceneId )
			AddText( sceneId, x600043_g_MissionName )
			AddText( sceneId, strText )
		EndEvent( )
		DispatchMissionDemandInfo( sceneId, selfId, targetId, x600043_g_ScriptId, x600043_g_MissionId, bDone )

	--未接此任务,且Th鯽 m鉵任务接收条件
	elseif x600043_CheckAccept( sceneId, selfId ) > 0 then
		x600043_OnAccept( sceneId, selfId, targetId )
	end

end

--**********************************
--列举事件
--**********************************
function x600043_OnEnumerate( sceneId, selfId, targetId )

	--判断该npc喧ng否喧ng对应任务to� 鸬 npc
	if GetName( sceneId, targetId ) ~= x600043_g_Name then
		return
	end

   --如果已接此任务
	if IsHaveMission( sceneId, selfId, x600043_g_MissionId ) > 0 then
		AddNumText( sceneId, x600043_g_ScriptId, x600043_g_MissionName,3,-1 )
	end

end

--**********************************
--检测Ti猵 th跫�
--**********************************
function x600043_CheckAccept( sceneId, selfId )

	local	ret	= CallScriptFunction( x600043_g_ConstructionScript, "CheckAccept", sceneId, selfId )
	return ret

end

--**********************************
--根据相应建筑 餴琺到对应MissionItem_HashTable.txt中to� 鸬 单元索引
--**********************************
function x600043_GetMissionItemIndex( sceneId, selfId )
	local nBuildingLevel = CityGetBuildingLevel( sceneId, selfId, sceneId, CITY_BUILDING_SHUFANG )
	local nPos

	if nBuildingLevel == 0 then								-- 1
		nPos = x600043_g_ItemOffset
	elseif nBuildingLevel == 1 then							-- 2
		nPos = x600043_g_ItemOffset + 1
	elseif nBuildingLevel == 2 then							-- 3
		nPos = x600043_g_ItemOffset + 2
	elseif nBuildingLevel == 3 then							-- 4
		nPos = x600043_g_ItemOffset + 3
	else													-- 5
		nPos = 160
	end

	return nPos
end

--**********************************
--Ti猵 th�
--**********************************
function x600043_OnAccept( sceneId, selfId, targetId )

	--没有任务才可以走这里
	if IsHaveMission( sceneId, selfId, x600043_g_MissionId ) == 0 then
		if GetLevel( sceneId, selfId ) < 10 then
			x600043_NotifyFailTips( sceneId, selfId, "Kh鬾g 瘘 鹌ng c" )
			return
		end

		--加入任务到玩家列表
		--LuaFnAddMission参数� 餴琺�: 
		--sceneId, selfId, misId(任务编号), scriptId, k(喧ng否回调x600043_OnKillObject), e(喧ng否回调OnEnterArea), i(喧ng否回调OnItemChange)
		--功能� 餴琺�: T読 玩家身上添加misId编号to� 鸬 任务,成功Tr� v�1
		AddMission( sceneId, selfId, x600043_g_MissionId, x600043_g_ScriptId, 0, 0, 1 )	-- kill、area、item
		if IsHaveMission( sceneId, selfId, x600043_g_MissionId ) <= 0 then
			return
		end

		--修改玩家身上misId编号to� 鸬 任务相应事件
		--eventId: 调用脚本编号,0 KillObj, 1 EnterArea, 2 ItemChanged, 3 PetChanged, 4 LockedTarget
		--注册 OnLockedTarget 事件
--	SetMissionEvent( sceneId, selfId, x600043_g_MissionId, 4 )
		CallScriptFunction( x600043_g_ConstructionScript, "OnAccept", sceneId, selfId, targetId, x600043_g_ScriptId )
		local misIndex	= GetMissionIndexByID( sceneId, selfId, x600043_g_MissionId )

		local nitemId, strItemName = GetOneMissionItem( x600043_GetMissionItemIndex( sceneId, selfId ) )

		SetMissionByIndex( sceneId, selfId, misIndex, x600043_g_MissionParam_Phase, x600043_g_PhaseKey["fnd"] )
		SetMissionByIndex( sceneId, selfId, misIndex, x600043_g_MissionParam_ItemId, nitemId )
		--喧ng否有送信任务
		--如果喧ng,怪物会不断掉落"收条书信",此时要求玩家必须完成m祎 次该任务
		SetMissionByIndex( sceneId, selfId, misIndex, x600043_g_MissionParam_IsCarrier, 0 )

		--显示内容告诉玩家已经Ti猵 th巳挝�
		local	missionInfo	= format( "    Bang ch鷑g ta trong qu� tr靚h nghi阯 c製 疸 g ph鋓 r r痠, r c %s l鄊 nguy阯 li畊, nhi甿 v� l n鄖 l読 phi玭 c醕 h� t靘 gi鷓 cho ta",
				strItemName )
		BeginEvent( sceneId )
			AddText( sceneId, x600043_g_MissionName )
			AddText( sceneId, missionInfo )
			AddText( sceneId, "#r    C醕 h� 疸 nh " .. x600043_g_MissionName )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

		-- 检测身上喧ng否已有此物品
		if LuaFnGetAvailableItemCount( sceneId, selfId, nitemId ) > 0 then
			x600043_OnItemChanged( sceneId, selfId, nitemId )
		end
	end

end

--**********************************
--放弃
--**********************************
function x600043_OnAbandon( sceneId, selfId )

	if IsHaveMission( sceneId, selfId, x600043_g_MissionId ) <= 0 then
		return
	end

	--普通物品不C 删除

	--删除玩家任务列表中对应to� 鸬 任务
	CallScriptFunction( x600043_g_ConstructionScript, "OnAbandon", sceneId, selfId )

end

--**********************************
--继续
--**********************************
function x600043_OnContinue( sceneId, selfId, targetId )

	BeginEvent( sceneId )
		AddText( sceneId, x600043_g_MissionName )
		AddText( sceneId, x600043_g_MissionComplete )
	EndEvent( )
	DispatchMissionContinueInfo( sceneId, selfId, targetId, x600043_g_ScriptId, x600043_g_MissionId )

end

--**********************************
--检测喧ng否可以提交
--**********************************
function x600043_CheckSubmit( sceneId, selfId, selectRadioId )

	--判断任务喧ng否已经完成
	local ret = CallScriptFunction( x600043_g_ConstructionScript, "CheckSubmit", sceneId, selfId )
	return ret

end

--**********************************
--提交
--**********************************
function x600043_OnSubmit( sceneId, selfId, targetId, selectRadioId )

	--判断该npc喧ng否喧ng对应任务to� 鸬 npc
	if GetName( sceneId, targetId ) ~= x600043_g_Name then
		return
	end

	if x600043_CheckSubmit( sceneId, selfId ) == 1 then
		--扣东西
		local misIndex = GetMissionIndexByID( sceneId, selfId, x600043_g_MissionId )
		local demandItemId = GetMissionParam( sceneId, selfId, misIndex, x600043_g_MissionParam_ItemId )
		local nItemNum = LuaFnGetAvailableItemCount( sceneId, selfId, demandItemId )

		if nItemNum > 0 then	--成功提交
			if LuaFnDelAvailableItem( sceneId, selfId, demandItemId, 1 ) < 1 then
				return
			end
		else									--只作为容错,理论上不可能发生
			SetMissionByIndex( sceneId, selfId, misIndex, x600043_g_IsMissionOkFail, 0 )
			x600043_NotifyFailTips( sceneId, selfId, "Nhi甿 v� th b読" )
			return
		end

		CallScriptFunction( x600043_g_ConstructionScript, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
	end

end

--**********************************
--杀死怪物或玩家
--**********************************
function x600043_OnKillObject( sceneId, selfId, objdataId, objId )
end

--**********************************
--进入区域事件
--**********************************
function x600043_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x600043_OnItemChanged( sceneId, selfId, itemdataId )

	local misIndex = GetMissionIndexByID( sceneId, selfId, x600043_g_MissionId )
	local _, strItemName = GetItemInfoByItemId( itemdataId )
	local demandItemId = GetMissionParam( sceneId, selfId, misIndex, x600043_g_MissionParam_ItemId )
	local _, strDemandItemName = GetItemInfoByItemId( demandItemId )

	if itemdataId ~= demandItemId then
		return
	end

	local nItemNum	= GetItemCount( sceneId, selfId, itemdataId )
	local strText		= nil
	if nItemNum > 0 then
		strText = format( "L 疬㧟 %s", strItemName )
		SetMissionByIndex( sceneId, selfId, misIndex, x600043_g_IsMissionOkFail, 1 )
		SetMissionByIndex( sceneId, selfId, misIndex, x600043_g_MissionParam_Phase, x600043_g_PhaseKey["end"] )
	else
		strText = format( "M 餴 %s", strItemName )
		SetMissionByIndex( sceneId, selfId, misIndex, x600043_g_IsMissionOkFail, 0 )
	end

	if strText ~= nil then
		x600043_NotifyFailTips( sceneId, selfId, strText )
	end

end

--**********************************
--醒目提示
--**********************************
function x600043_NotifyFailTips( sceneId, selfId, Tip )

	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end
