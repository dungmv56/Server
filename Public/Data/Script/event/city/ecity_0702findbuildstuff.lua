--副本任务
--寻找建筑材料

--************************************************************************
--MisDescBegin
--脚本号
x600038_g_ScriptId	= 600038
--任务号
x600038_g_MissionId	= 1111
--目标NPC
x600038_g_Name			= "Tr竛h V� Danh"
--衅ng c nhi甿 v� 
x600038_g_MissionLevel					= 10000
--任务归类
x600038_g_MissionKind						= 50
--喧ng否喧ngTinh英任务
x600038_g_IfMissionElite				= 0

--********下面几项喧ng动态显示to� 鸬 内容,用于T読 任务列表中动态显示任务情况******
--角色Mission变量� 餴琺�
x600038_g_IsMissionOkFail				= 0	--0 Nhi甿 v� ho鄋 th鄋h标记
x600038_g_MissionParam_SubId		= 1	--1 子任务脚本号存放位置
x600038_g_MissionParam_Phase		= 2	--2 阶段号 此号用于区分当前任务UIto� 鸬 描述信息
x600038_g_MissionParam_NpcId		= 3	--3 任务 NPC to� 鸬  NPCId 号
x600038_g_MissionParam_ItemId		= 4	--4 任务物品to� 鸬 编号
x600038_g_MissionParam_MonsterId= 5	--5 任务 Monster to� 鸬  NPCId 号
x600038_g_MissionParam_IsCarrier= 6	--6 喧ng否有送信任务
--循环任务to� 鸬 数据索引,里面存着已做to� 鸬 环数
x600038_g_MissionRound					= 59
--**********************************以上喧ng动态****************************

--任务文本描述
x600038_g_MissionName			= "X鈟 d駈g nhi甿 v�"
x600038_g_MissionInfo			= "N礽 ch韓h th鄋h th� - Nhi甿 v� x鈟 d駈g"								--任务描述
x600038_g_MissionTarget		= "%f"																--M鴆 ti陁 nhi甿 v�
x600038_g_ContinueInfo		= "    Nhi甿 v� c黙 c醕 h� v鏽 ch遖 ho鄋 th鄋h �?"				--未Ho鄋 t nhi甿 v鴗o� 鸬 npc对话
x600038_g_SubmitInfo			= "    S� t靚h ti猲 tri琻 nh� th� n鄌 r癷?"							--完成未提交时to� 鸬 npc对话
x600038_g_MissionComplete	= "    R t痶 r t痶, ti猲 鸬 x鈟 d駈g l読 t錸g nhanh r癷. "--Ho鄋 t nhi甿 v鴑pc说话to� 鸬 话

x600038_g_Parameter_Item_IDRandom = { { id = 4, num = 1 } }

x600038_g_StrForePart			= 2

--用来保存字符串格式化to� 鸬 数据
x600038_g_FormatList			= {
	"",
	"    M th� vi猼: th� l頽h Tr靚h ng� t礳 nh, thu礳 h� 衞誸 稹c %2i nh唼c can, nh遪g kh鬾g mai g ph鋓 %1n nh 疳nh. V� n読 phong kh x� h�, xin nhanh ch髇g 疬a c醕 huynh 甬 皙n 瓞 chi vi畁 thu礳 h�. ",	--1 求援书信
	"    %3n gi 餴 %2i, c c醕 h� 餴 l l読. ",		--2 寻找建筑材料
	"    T� %2i giao tr� l読 cho bang h礽 姓i ch� qu鋘. "						--3 送还
}

--通用Th鄋h ph� 任务脚本
x600038_g_CityMissionScript	= 600001
x600038_g_ConstructionScript= 600035

--任务奖励

--MisDescEnd
--************************************************************************

x600038_g_ItemOffset			= 39	--表里第几c醝物品列to� 鸬 偏移量
x600038_g_NPCOffset				= 48	--表里第几列 NPC to� 鸬 偏移量
x600038_g_MonsterOffset		= 43	--表里第几列 Monster to� 鸬 偏移量

--阶段任务
--掉落规则: 10%几率掉落任务物品；T読 掉落to� 鸬 几率中,50%掉落任务索取to� 鸬 物品,另50%掉落"求援书信"
x600038_g_PhaseKey				= {}
x600038_g_PhaseKey["mal"]	= 1		--求援书信: 掉落书信,刷新任务描述,到NPC处追还所需物品
x600038_g_PhaseKey["fnd"]	= 2		--寻找建筑材料: 直接掉落所需物品
x600038_g_PhaseKey["end"]	= 3		--送还

--随机因子
x600038_g_RandomSeed			= 100
--掉落几率
x600038_g_DropOdds				= 10
--求援书信
x600038_g_itmMail					= 40004287

--**********************************
--任务入口函数
--**********************************
function x600038_OnDefaultEvent( sceneId, selfId, targetId )

	--判断该npc喧ng否喧ng对应任务to� 鸬 npc
	if GetName( sceneId, targetId ) ~= x600038_g_Name then
		return
	end

	--如果已接此任务
	if IsHaveMission( sceneId, selfId, x600038_g_MissionId ) > 0 then
		local bDone = x600038_CheckSubmit( sceneId, selfId )
		local strText

		if bDone == 1 then
			strText = x600038_g_SubmitInfo
		else
			strText = x600038_g_ContinueInfo
		end

		BeginEvent( sceneId )
			AddText( sceneId, x600038_g_MissionName )
			AddText( sceneId, strText )
		EndEvent( )
		DispatchMissionDemandInfo( sceneId, selfId, targetId, x600038_g_ScriptId, x600038_g_MissionId, bDone )

	--未接此任务,且Th鯽 m鉵任务接收条件
	elseif x600038_CheckAccept( sceneId, selfId ) > 0 then
		x600038_OnAccept( sceneId, selfId, targetId )
	end

end

--**********************************
--列举事件
--**********************************
function x600038_OnEnumerate( sceneId, selfId, targetId )

	--判断该npc喧ng否喧ng对应任务to� 鸬 npc
	if GetName( sceneId, targetId ) ~= x600038_g_Name then
		return
	end

   --如果已接此任务
	if IsHaveMission( sceneId, selfId, x600038_g_MissionId ) > 0 then
		AddNumText( sceneId, x600038_g_ScriptId, x600038_g_MissionName,3,-1 )
	end

end

--**********************************
--检测Ti猵 th跫�
--**********************************
function x600038_CheckAccept( sceneId, selfId )

	local	ret	= CallScriptFunction( x600038_g_ConstructionScript, "CheckAccept", sceneId, selfId )
	return ret

end

--**********************************
--根据玩家等c 餴琺到对应MissionItem_HashTable.txt中to� 鸬 单元索引
--**********************************
function x600038_GetMissionItemIndex( sceneId, selfId )

	return x600038_g_ItemOffset

end

--**********************************
--根据玩家等c 餴琺到对应MissionNPC_HashTable.txt中to� 鸬 选择信息
--**********************************
function x600038_GetMissionNPCKey( sceneId, selfId )

	return x600038_g_NPCOffset

end

--**********************************
--Ti猵 th�
--**********************************
function x600038_OnAccept( sceneId, selfId, targetId )

	--没有任务才可以走这里
	if IsHaveMission( sceneId, selfId, x600038_g_MissionId ) == 0 then
		if GetLevel( sceneId, selfId ) < 10 then
			x600038_NotifyFailTips( sceneId, selfId, "Kh鬾g 瘘 鹌ng c" )
			return
		end

		--加入任务到玩家列表
		--LuaFnAddMission参数� 餴琺�: 
		--sceneId, selfId, misId(任务编号), scriptId, k(喧ng否回调x600038_OnKillObject), e(喧ng否回调OnEnterArea), i(喧ng否回调OnItemChange)
		--功能� 餴琺�: T読 玩家身上添加misId编号to� 鸬 任务,成功Tr� v�1
		AddMission( sceneId, selfId, x600038_g_MissionId, x600038_g_ScriptId, 1, 0, 1 )	-- kill、area、item
		if IsHaveMission( sceneId, selfId, x600038_g_MissionId ) <= 0 then
			return
		end

		--修改玩家身上misId编号to� 鸬 任务相应事件
		--eventId: 调用脚本编号,0 KillObj, 1 EnterArea, 2 ItemChanged, 3 PetChanged, 4 LockedTarget
		--注册 x600038_OnLockedTarget 事件
--	SetMissionEvent( sceneId, selfId, x600038_g_MissionId, 4 )
		CallScriptFunction( x600038_g_ConstructionScript, "OnAccept", sceneId, selfId, targetId, x600038_g_ScriptId )
		local misIndex = GetMissionIndexByID( sceneId, selfId, x600038_g_MissionId )

		local nitemId, strItemName = GetOneMissionItem( x600038_GetMissionItemIndex( sceneId, selfId ) )
		--选择送信NPC
		local nNpcId, strNpcName, strNpcSceneDesc, _, nPosX, nPosZ, _, nGender = GetOneMissionNpc( x600038_GetMissionNPCKey( sceneId, selfId ) )
		--选择攻击Monster
		local nMonsterId, strMonsterName, strMonsterSceneDesc, _, _, _, _, _, nLevel = LuaFnGetLevelMatchingMonster( x600038_g_MonsterOffset, GetLevel( sceneId, selfId ) )

		SetMissionByIndex( sceneId, selfId, misIndex, x600038_g_MissionParam_Phase, x600038_g_PhaseKey["fnd"] )
		SetMissionByIndex( sceneId, selfId, misIndex, x600038_g_MissionParam_NpcId, nNpcId )
		SetMissionByIndex( sceneId, selfId, misIndex, x600038_g_MissionParam_ItemId, nitemId )
		SetMissionByIndex( sceneId, selfId, misIndex, x600038_g_MissionParam_MonsterId, nMonsterId )
		--喧ng否有送信任务
		--如果喧ng,怪物会不断掉落"求援书信",此时要求玩家必须完成m祎 次该任务
		if random( 2 ) <= 1 then
			SetMissionByIndex( sceneId, selfId, misIndex, x600038_g_MissionParam_IsCarrier, 0 )
		else
			SetMissionByIndex( sceneId, selfId, misIndex, x600038_g_MissionParam_IsCarrier, 1 )
		end

		--显示内容告诉玩家已经Ti猵 th巳挝�
		local	missionInfo	= format( "    %s, c醕 h� 皙n 瘊ng l鷆 qu�, h鬽 nay bang ch鷑g c黙 bang ch鷑g ta khi v chuy琻 %s 餴 ngang qua %s, kh鬾g may b� %s � 痼 c呔p 餴 m, th l� phi玭 h� qu�, c醕 h� nhanh ch髇g 餴 l v� 餴. Kh鬾g 疬㧟 瓞 x鋣 ra s� su g�, quay v� ch ch s� c� th叻ng",
				GetName( sceneId, selfId ), strItemName, strMonsterSceneDesc, strMonsterName )
		BeginEvent( sceneId )
			AddText( sceneId, x600038_g_MissionName )
			AddText( sceneId, missionInfo )
			AddText( sceneId, "#rC醕 h� 疸 nh " .. x600038_g_MissionName )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end

end

--**********************************
--当锁定m祎 c醝对象
--**********************************
function x600038_OnLockedTarget( sceneId, selfId, objId )

	if IsHaveMission( sceneId, selfId, x600038_g_MissionId ) < 1 then
		return		--没有该任务
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x600038_g_MissionId )
	local nNpcId = GetMissionParam( sceneId, selfId, misIndex, x600038_g_MissionParam_NpcId )
	local _, strNpcName = GetNpcInfoByNpcId(sceneId, nNpcId )
	if GetName( sceneId, objId ) ~= strNpcName then
		return		--找错人了
	end

	if LuaFnGetTaskItemBagSpace( sceneId, selfId ) < 1 then
		x600038_NotifyFailTips( sceneId, selfId, "Nhi甿 v� n鄖 c 韙 nh m祎 kh鬾g gian v ph nhi甿 v�" )
		return
	end

	local itemId = GetMissionParam( sceneId, selfId, misIndex, x600038_g_MissionParam_ItemId )
	local _, strDemandItemName = GetItemInfoByItemId( itemId )

	local Phase = GetMissionParam( sceneId, selfId, misIndex, x600038_g_MissionParam_Phase )

	--求援书信
	if Phase == x600038_g_PhaseKey["mal"] then
		local pos = LuaFnTryRecieveItem( sceneId, selfId, itemId, QUALITY_MUST_BE_CHANGE )
		if pos == -1 then
			x600038_NotifyFailTips( sceneId, selfId, "Ch� tr痭g trong t鷌 x醕h kh鬾g 瘘" )
			return
		end

		local missionInfo = format( "    L� %s n鄖 ta 疸 v� t靚h l 疬㧟, n骾 nh� th� t裞 l� h鄋g c黙 bang h礽 c醕 h�, c鹡g 疬㧟, b眓 hi畃 s� ho鄋 giao l読 cho c醕 h�, l sau ph鋓 c th 黏y",
				strDemandItemName )
		TAddText( sceneId, missionInfo )

		ResetMissionEvent( sceneId, selfId, x600038_g_MissionId, 4 )
		DelItem( sceneId, selfId, x600038_g_itmMail, 1 )

		--Nhi甿 v� ho鄋 th鄋h
		SetMissionByIndex( sceneId, selfId, misIndex, x600038_g_MissionParam_Phase, x600038_g_PhaseKey["end"] )
		SetMissionByIndex( sceneId, selfId, misIndex, x600038_g_IsMissionOkFail, 1 )
		x600038_NotifyFailTips( sceneId, selfId, "Nhi甿 v� ho鄋 th鄋h" )

	--意外情况
	else
		return
	end

end

--**********************************
--放弃
--**********************************
function x600038_OnAbandon( sceneId, selfId )

	if IsHaveMission( sceneId, selfId, x600038_g_MissionId ) <= 0 then
		return
	end

	--删除物品
	local misIndex = GetMissionIndexByID( sceneId, selfId, x600038_g_MissionId )
	local demandItemId = GetMissionParam( sceneId, selfId, misIndex, x600038_g_MissionParam_ItemId )
	if GetItemCount( sceneId, selfId, demandItemId ) > 0 then
		DelItem( sceneId, selfId, demandItemId, 1 )
	end
	if GetItemCount( sceneId, selfId, x600038_g_itmMail ) > 0 then
		DelItem( sceneId, selfId, x600038_g_itmMail, 1 )
	end

	--删除玩家任务列表中对应to� 鸬 任务
	CallScriptFunction( x600038_g_ConstructionScript, "OnAbandon", sceneId, selfId )

end

--**********************************
--继续
--**********************************
function x600038_OnContinue( sceneId, selfId, targetId )

	BeginEvent( sceneId )
		AddText( sceneId, x600038_g_MissionName )
		AddText( sceneId, x600038_g_MissionComplete )
	EndEvent( )
	DispatchMissionContinueInfo( sceneId, selfId, targetId, x600038_g_ScriptId, x600038_g_MissionId )

end

--**********************************
--检测喧ng否可以提交
--**********************************
function x600038_CheckSubmit( sceneId, selfId, selectRadioId )

	--判断任务喧ng否已经完成
	local ret = CallScriptFunction( x600038_g_ConstructionScript, "CheckSubmit", sceneId, selfId )
	return ret

end

--**********************************
--提交
--**********************************
function x600038_OnSubmit( sceneId, selfId, targetId, selectRadioId )

	--判断该npc喧ng否喧ng对应任务to� 鸬 npc
	if GetName( sceneId, targetId ) ~= x600038_g_Name then
		return
	end

	if x600038_CheckSubmit( sceneId, selfId ) == 1 then
		--扣东西
		local misIndex = GetMissionIndexByID( sceneId, selfId, x600038_g_MissionId )
		local demandItemId = GetMissionParam( sceneId, selfId, misIndex, x600038_g_MissionParam_ItemId )
		local nItemNum = LuaFnGetAvailableItemCount( sceneId, selfId, demandItemId )

		if nItemNum > 0 then	--成功提交
			if LuaFnDelAvailableItem( sceneId, selfId, demandItemId, 1 ) < 1 then
				return
			end
		else									--只作为容错,理论上不可能发生
			SetMissionByIndex( sceneId, selfId, misIndex, x600038_g_IsMissionOkFail, 0 )
			return
		end

		CallScriptFunction( x600038_g_ConstructionScript, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
	end

end

--**********************************
--杀死怪物或玩家
--**********************************
function x600038_OnKillObject( sceneId, selfId, objdataId, objId )

	--取 餴琺C醝 n鄖 怪物死后拥有分配权to� 鸬 人数
	local allOwnersCount = GetMonsterOwnerCount( sceneId, objId )
	local i, curOwner, misIndex, nNpcId, strNpcName
	local MonsterName = GetName( sceneId, objId )
	local demandItemId, demandItemCount

	for i = 0, allOwnersCount - 1 do
		--取 餴琺拥有分配权to� 鸬 人to� 鸬 objId
		curOwner = GetMonsterOwnerID( sceneId, objId, i )
		--如果C醝 n鄖 人拥有任务
		if IsHaveMission( sceneId, curOwner, x600038_g_MissionId ) > 0 and
		   GetScriptIDByMissionID( sceneId, curOwner, x600038_g_MissionId ) == x600038_g_ScriptId then
			misIndex = GetMissionIndexByID( sceneId, curOwner, x600038_g_MissionId )
			nNpcId = GetMissionParam( sceneId, curOwner, misIndex, x600038_g_MissionParam_MonsterId )
			_, strNpcName = GetNpcInfoByNpcId(sceneId, nNpcId )
			demandItemId = GetMissionParam( sceneId, curOwner, misIndex, x600038_g_MissionParam_ItemId )

			if MonsterName == strNpcName then
				x600038_OnItemDrop( sceneId, selfId, objId, curOwner, demandItemId )
			end
		end
	end

end

--**********************************
--进入区域事件
--**********************************
function x600038_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x600038_OnItemChanged( sceneId, selfId, itemdataId )

	local misIndex = GetMissionIndexByID( sceneId, selfId, x600038_g_MissionId )
	local _, strItemName = GetItemInfoByItemId( itemdataId )
	local demandItemId = GetMissionParam( sceneId, selfId, misIndex, x600038_g_MissionParam_ItemId )
	local _, strDemandItemName = GetItemInfoByItemId( demandItemId )

	if itemdataId ~= demandItemId and itemdataId ~= x600038_g_itmMail then
		return
	end

	local nItemNum	= GetItemCount( sceneId, selfId, itemdataId )
	local strText		= nil
	if itemdataId == x600038_g_itmMail then
		if nItemNum > 0 then
			strText = format( "C醕 h� c� 疬㧟 m祎 b裞 th� m, d叨ng nh� trong 痼 c� g� m� 醡, ph鋓 xem xem nhi甿 v�" )
			SetMissionByIndex( sceneId, selfId, misIndex, x600038_g_MissionParam_Phase, x600038_g_PhaseKey["mal"] )

			--修改玩家身上misId编号to� 鸬 任务相应事件
			--eventId: 调用脚本编号,0 KillObj, 1 EnterArea, 2 ItemChanged, 3 PetChanged, 4 LockedTarget
			--注册 x600038_OnLockedTarget 事件
			SetMissionEvent( sceneId, selfId, x600038_g_MissionId, 4 )
		else
			SetMissionByIndex( sceneId, selfId, misIndex, x600038_g_MissionParam_Phase, x600038_g_PhaseKey["end"] )
			SetMissionByIndex( sceneId, selfId, misIndex, x600038_g_MissionParam_IsCarrier, 0 )
		end
	else
		if nItemNum > 0 then
			strText = format( "L 疬㧟 %s", strItemName )
			SetMissionByIndex( sceneId, selfId, misIndex, x600038_g_IsMissionOkFail, 1 )
			SetMissionByIndex( sceneId, selfId, misIndex, x600038_g_MissionParam_Phase, x600038_g_PhaseKey["end"] )
		else
			strText = format( "M 餴 %s", strItemName )
			SetMissionByIndex( sceneId, selfId, misIndex, x600038_g_IsMissionOkFail, 0 )
		end
	end

	if strText ~= nil then
		x600038_NotifyFailTips( sceneId, selfId, strText )
	end

end

--**********************************
--物品掉落
--**********************************
function x600038_OnItemDrop( sceneId, selfId, monsterId, curOwner, demandItemId )

	--m祎 定几率打出任务所需物品
	--if random( x600038_g_RandomSeed ) > x600038_g_DropOdds then
		--return
	--end

	--必须Ti猵 th托湃挝�
	local misIndex = GetMissionIndexByID( sceneId, selfId, x600038_g_MissionId )
	if GetMissionParam( sceneId, selfId, misIndex, x600038_g_MissionParam_IsCarrier ) == 1 then
		if GetItemCount( sceneId, curOwner, x600038_g_itmMail ) >= 1 then
			return	--包中已经有信
		end
		AddMonsterDropItem( sceneId, monsterId, curOwner, x600038_g_itmMail )

	--直接掉落任务所需物品
	else
		AddMonsterDropItem( sceneId, monsterId, curOwner, demandItemId )
	end

end

--**********************************
--醒目提示
--**********************************
function x600038_NotifyFailTips( sceneId, selfId, Tip )

	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end
