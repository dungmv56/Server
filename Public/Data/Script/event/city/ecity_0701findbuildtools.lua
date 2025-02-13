--副本任务
--寻找建设工具

--************************************************************************
--MisDescBegin

--脚本号
x600036_g_ScriptId = 600036

--任务号
x600036_g_MissionId = 1111

--目标NPC
x600036_g_Name = "Tr竛h V� Danh"

--衅ng c nhi甿 v� 
x600036_g_MissionLevel = 10000

--任务归类
x600036_g_MissionKind = 50

--喧ng否喧ngTinh英任务
x600036_g_IfMissionElite = 0

--********下面几项喧ng动态显示to� 鸬 内容,用于T読 任务列表中动态显示任务情况******
--角色Mission变量� 餴琺�

x600036_g_IsMissionOkFail			=0	--0 Nhi甿 v� ho鄋 th鄋h标记
x600036_g_MissionParam_SubId		=1	--1 子任务脚本号存放位置
x600036_g_MissionParam_Phase		=2	--2 阶段号 此号用于区分当前任务UIto� 鸬 描述信息
x600036_g_MissionParam_NpcId		=3	--3 任务 NPC to� 鸬  NPCId 号
x600036_g_MissionParam_ItemId		=4	--4 任务物品to� 鸬 编号
x600036_g_MissionParam_MonsterId	=5	--5 任务 Monster to� 鸬  NPCId 号

--循环任务to� 鸬 数据索引,里面存着已做to� 鸬 环数
x600036_g_MissionRound = 59
--**********************************以上喧ng动态****************************

--任务文本描述
x600036_g_MissionName = "X鈟 d駈g nhi甿 v�"
x600036_g_MissionInfo = "N礽 ch韓h th鄋h th� - Nhi甿 v� x鈟 d駈g"								--任务描述
x600036_g_MissionTarget = "%f"												--M鴆 ti陁 nhi甿 v�
x600036_g_ContinueInfo = "    Nhi甿 v� c黙 c醕 h� v鏽 ch遖 ho鄋 th鄋h �?"						--未Ho鄋 t nhi甿 v鴗o� 鸬 npc对话
x600036_g_SubmitInfo = "    S� t靚h ti猲 tri琻 nh� th� n鄌 r癷?"								--完成未提交时to� 鸬 npc对话
x600036_g_MissionComplete = "    R t痶 r t痶, ti猲 鸬 x鈟 d駈g l読 t錸g nhanh r癷. "			--Ho鄋 t nhi甿 v鴑pc说话to� 鸬 话

x600036_g_Parameter_Item_IDRandom = { { id = 4, num = 1 } }

x600036_g_StrForePart = 2

--用来保存字符串格式化to� 鸬 数据
x600036_g_FormatList = {
	"",
	"    衖 皙n %1n m唼n l %2i. ",					-- 1
	"    T� %2i giao tr� l読 cho bang h礽 姓i ch� qu鋘. ",			-- 2
	"    衖 皙n %1n m唼n l %2i. ",					-- 3
	"    衖 皙n %1n m唼n l %2i. ",					-- 4
	"    %3n gi 餴 %2i, c c醕 h� 餴 l l読. ",	-- 5
	"    T� %2i giao tr� l読 cho bang h礽 姓i ch� qu鋘. ",			-- 6
}

-- 通用Th鄋h ph� 任务脚本
x600036_g_CityMissionScript = 600001
x600036_g_ConstructionScript = 600035

--任务奖励

--MisDescEnd
--************************************************************************

x600036_g_ItemOffset = 29				-- Suppose to 29, 表里第几c醝物品列to� 鸬 偏移量
x600036_g_NPCOffset = 34				-- Suppose to 34, 表里第几列 NPC to� 鸬 偏移量
x600036_g_NPCOffsetEx	= 257 		--表里第几列 NPC to� 鸬 偏移量扩充 modi:lby20071126
x600036_g_MonsterOffset = 43		-- Suppose to 43, 表里第几列 Monster to� 鸬 偏移量

x600036_g_subScriptId = 600037
x600036_g_subMissionId = 1112

x600036_g_FamilyNamesList = { "Tri畊", "Ti玭", "T鬾 ", "L�", "Ch鈛", "Ng� ", "Tr竛h ", "V呓ng", "Ph鵱g ", "Tr ", "Ch� ", "Ngu�", "T叻ng ", "Th ", "H鄋", "D呓ng", "Chuy琻 giao t靚h b醥", "T", "V遳 ", "H補 ", "H� ", "L� ", "Thi ", "Tr呓ng", }

--**********************************
--任务入口函数
--**********************************
function x600036_OnDefaultEvent( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x600036_g_Name then		--判断该npc喧ng否喧ng对应任务to� 鸬 npc
		return
	end

	--如果已接此任务
	if IsHaveMission( sceneId, selfId, x600036_g_MissionId ) > 0 then
		local bDone = x600036_CheckSubmit( sceneId, selfId )
		local strText

		if bDone == 1 then
			strText = x600036_g_SubmitInfo
		else
			strText = x600036_g_ContinueInfo
		end

		BeginEvent( sceneId )
			AddText( sceneId, x600036_g_MissionName )
			AddText( sceneId, strText )
		EndEvent( )
		DispatchMissionDemandInfo( sceneId, selfId, targetId, x600036_g_ScriptId, x600036_g_MissionId, bDone )

	--Th鯽 m鉵任务接收条件
	elseif x600036_CheckAccept( sceneId, selfId ) > 0 then
		x600036_OnAccept( sceneId, selfId, targetId )
	end
end

--**********************************
--列举事件
--**********************************
function x600036_OnEnumerate( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x600036_g_Name then		--判断该npc喧ng否喧ng对应任务to� 鸬 npc
		return
	end

   --如果已接此任务
	if IsHaveMission( sceneId, selfId, x600036_g_MissionId ) > 0 then
		AddNumText( sceneId, x600036_g_ScriptId, x600036_g_MissionName,3,-1 )
	end
end

--**********************************
--检测Ti猵 th跫�
--**********************************
function x600036_CheckAccept( sceneId, selfId )
	local ret = CallScriptFunction( x600036_g_ConstructionScript, "CheckAccept", sceneId, selfId )
	return ret
end

--**********************************
--根据玩家等c 餴琺到对应MissionItem_HashTable.txt中to� 鸬 单元索引
--**********************************
function x600036_GetMissionItemIndex( sceneId, selfId )
	return x600036_g_ItemOffset
end

--**********************************
--根据玩家等c 餴琺到对应MissionNPC_HashTable.txt中to� 鸬 选择信息
--**********************************
function x600036_GetMissionNPCKey( sceneId, selfId )
	local nPlayerLevel = GetLevel( sceneId, selfId )
	local nPos

	if nPlayerLevel < 30 then								-- 10 ~ 30
		nPos = 0
	elseif nPlayerLevel < 50 then							-- 30 ~ 50
		nPos = 1
	elseif nPlayerLevel < 70 then							-- 50 ~ 70
		nPos = 2
	--else													-- 70 ~ 100
	--	nPos = 3
	--end

	--return nPos + x600036_g_NPCOffset
	elseif	nPlayerLevel < 100 then		-- 70 ~ 100 Level
		nPos = 3
	elseif nPlayerLevel < 120 then		-- 100 ~ 120 Level	modi:lby20071126
		nPos = 0
	else 															-- >=120 Level
		nPos = 1
		
	end
	
	if nPlayerLevel < 100 then
		return nPos + x600036_g_NPCOffset
	else
		return nPos + x600036_g_NPCOffsetEx
	end
end

--**********************************
--Ti猵 th�
--**********************************
function x600036_OnAccept( sceneId, selfId, targetId )
	if IsHaveMission( sceneId, selfId, x600036_g_MissionId ) == 0 then					--没有任务才可以走这里
		if GetLevel( sceneId, selfId ) < 10 then
			CallScriptFunction( x600036_g_CityMissionScript, "NotifyFailTips", sceneId, selfId, "Kh鬾g 瘘 鹌ng c" )
			return
		end

		--加入任务到玩家列表
		AddMission( sceneId, selfId, x600036_g_MissionId, x600036_g_ScriptId, 0, 0, 0 )	-- kill、area、item
		if IsHaveMission( sceneId, selfId, x600036_g_MissionId ) <= 0 then
			return
		end

		SetMissionEvent( sceneId, selfId, x600036_g_MissionId, 4 ) -- 注册 x600036_OnLockedTarget 事件
		CallScriptFunction( x600036_g_ConstructionScript, "OnAccept", sceneId, selfId, targetId, x600036_g_ScriptId )
		local misIndex = GetMissionIndexByID( sceneId, selfId, x600036_g_MissionId )

		local nitemId, strItemName = GetOneMissionItem( x600036_GetMissionItemIndex( sceneId, selfId ) )
		local nNpcId, strNpcName, strNpcSceneDesc, _, nPosX, nPosZ, _, nGender = GetOneMissionNpc( x600036_GetMissionNPCKey( sceneId, selfId ) )
		local PlayerGender = GetSex( sceneId, selfId )
		local rank

		SetMissionByIndex( sceneId, selfId, misIndex, x600036_g_MissionParam_Phase, 1 )
		SetMissionByIndex( sceneId, selfId, misIndex, x600036_g_MissionParam_NpcId, nNpcId )
		SetMissionByIndex( sceneId, selfId, misIndex, x600036_g_MissionParam_ItemId, nitemId )

		if PlayerGender == 0 then
			rank = "N� hi畃"
		elseif PlayerGender == 1 then
			rank = " c醕 h�"
		else
			rank = " c醕 h� "
		end

		--显示内容告诉玩家已经Ti猵 th巳挝�
		BeginEvent( sceneId )
			AddText( sceneId, x600036_g_MissionName )
			local missionInfo = format( "    � c鬾g tr叨ng %s s� ph�, kh鬾g may 疳nh m %s, kh th飊h %s 餴 v� %s%s (%d, %d) m唼n, s� v� c鵱g c鋗 k韈h. ",
				x600036_g_FamilyNamesList[random(getn(x600036_g_FamilyNamesList))], strItemName, rank,
				strNpcSceneDesc, strNpcName, nPosX, nPosZ )

			AddText( sceneId, missionInfo )
			AddText( sceneId, "#rC醕 h� 疸 nh " .. x600036_g_MissionName )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
end

--**********************************
--当锁定m祎 c醝对象
--**********************************
function x600036_OnLockedTarget( sceneId, selfId, objId )
	if IsHaveMission( sceneId, selfId, x600036_g_MissionId ) < 1 then
		return		-- 没有该任务
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x600036_g_MissionId )

	local nNpcId = GetMissionParam( sceneId, selfId, misIndex, x600036_g_MissionParam_NpcId )
	local _, strNpcName = GetNpcInfoByNpcId(sceneId, nNpcId )
	if GetName( sceneId, objId ) ~= strNpcName then			-- 找错人了
		return
	end

	if LuaFnGetTaskItemBagSpace( sceneId, selfId ) < 1 then
		x600036_NotifyFailTips( sceneId, selfId, "Nhi甿 v� n鄖 c 韙 nh m祎 kh鬾g gian v ph nhi甿 v�" )
		return
	end

	local itemId = GetMissionParam( sceneId, selfId, misIndex, x600036_g_MissionParam_ItemId )
	local _, strDemandItemName = GetItemInfoByItemId( itemId )

	local Phase = GetMissionParam( sceneId, selfId, misIndex, x600036_g_MissionParam_Phase )

	local PlayerGender = GetSex( sceneId, selfId )
	local rank

	if PlayerGender == 0 then
		rank = "侠女"
	else
		rank = " c醕 h�"
	end

	if Phase == 1 then				-- 刚接了任务来找 NPC
		-- 8 成机会直接给与任务物品,Nhi甿 v� ho鄋 th鄋h,1 成机会给副本任务,1 成机会给杀怪任务
		local rand = random(100)	-- 直接Ho鄋 t nhi甿 v�
		if rand <= 80 then
			local pos = LuaFnTryRecieveItem( sceneId, selfId, itemId, QUALITY_MUST_BE_CHANGE )
			if pos == -1 then
				CallScriptFunction( x600036_g_CityMissionScript, "NotifyFailTips", sceneId, selfId, "Ch� tr痭g trong t鷌 x醕h kh鬾g 瘘" )
				return
			end

			SetMissionByIndex( sceneId, selfId, misIndex, x600036_g_MissionParam_Phase, 2 )
			SetMissionByIndex( sceneId, selfId, misIndex, x600036_g_IsMissionOkFail, 1 )		-- Nhi甿 v� ho鄋 th鄋h

			local missionInfo = format( "    N猽 %s 皙n l, d� nhi阯 s� l鄊 h猼 s裞 m靚h, 疴y l� %s, xin nh h� cho",
				rank, strDemandItemName )

			TAddText( sceneId, missionInfo )

			ResetMissionEvent( sceneId, selfId, x600036_g_MissionId, 4 )
			return
		elseif rand <= 90 then		-- 分派副本任务
			--加入任务到玩家列表
			AddMission( sceneId, selfId, x600036_g_subMissionId, x600036_g_subScriptId, 1, 0, 0 )	-- kill、area、item
			if IsHaveMission( sceneId, selfId, x600036_g_subMissionId ) <= 0 then
				return
			end

			SetMissionByIndex( sceneId, selfId, misIndex, x600036_g_MissionParam_Phase, 3 )
			local subMisIndex = GetMissionIndexByID( sceneId, selfId, x600036_g_subMissionId )
			SetMissionByIndex( sceneId, selfId, subMisIndex, 2, 10 )						--C 杀死to� 鸬 怪物数量,仅供客户端使用

			CallScriptFunction( x600036_g_subScriptId, "OnEnumerate", sceneId, selfId, objId )

			return
		else						-- 分派杀怪任务
			SetMissionByIndex( sceneId, selfId, misIndex, x600036_g_MissionParam_Phase, 5 )

			SetMissionEvent( sceneId, selfId, x600036_g_MissionId, 0 )					-- 注册 KillObj 事件
			SetMissionEvent( sceneId, selfId, x600036_g_MissionId, 2 )					-- 注册 itemchange 事件
			local myLevel = GetLevel( sceneId, selfId )
			local nMonsterId, strMonsterName, strMonsterSceneDesc, _, _, _, _, _, nLevel = LuaFnGetLevelMatchingMonster( x600036_g_MonsterOffset, myLevel )

--		PrintStr( "我to� 鸬 c别: " .. myLevel .. ",怪to� 鸬 c别: " .. nLevel )
			SetMissionByIndex( sceneId, selfId, misIndex, x600036_g_MissionParam_MonsterId, nMonsterId )

			strMonsterSceneDesc	= gsub( strMonsterSceneDesc, "许ch", "" )
			local missionInfo = format( "    羒 ch�, th kh鬾g 瘊ng l鷆 ch鷗 n鄌, %s th� c�, m h鬽 tr呔c khi 餴 qua %s, kh鬾g th tr鱪g 瓞 %s � 痼 c呔p 餴 m r癷, n猽 %s mu痭 c� th� 餴 gi鄋h l読",
				strDemandItemName, strMonsterSceneDesc, strMonsterName, rank )

			TAddText( sceneId, missionInfo )

			ResetMissionEvent( sceneId, selfId, x600036_g_MissionId, 4 )
			return
		end
	elseif Phase == 3 then			-- 分配了副本任务
			--加入任务到玩家列表
		if IsHaveMission( sceneId, selfId, x600036_g_subMissionId ) <= 0 then
			AddMission( sceneId, selfId, x600036_g_subMissionId, x600036_g_subScriptId, 1, 0, 0 )	-- kill、area、item
			if IsHaveMission( sceneId, selfId, x600036_g_subMissionId ) <= 0 then
				return
			end
		end

		CallScriptFunction( x600036_g_subScriptId, "OnEnumerate", sceneId, selfId, objId )
		return
	elseif Phase == 4 then			-- 副本Nhi甿 v� ho鄋 th鄋h了
		-- 删除副本任务,给与任务物品
		local pos = LuaFnTryRecieveItem( sceneId, selfId, itemId, QUALITY_MUST_BE_CHANGE)
		if pos == -1 then
			CallScriptFunction( x600036_g_CityMissionScript, "NotifyFailTips", sceneId, selfId, "Ch� tr痭g trong t鷌 x醕h kh鬾g 瘘" )
			return
		end

		SetMissionByIndex( sceneId, selfId, misIndex, x600036_g_MissionParam_Phase, 2 )
		SetMissionByIndex( sceneId, selfId, misIndex, x600036_g_IsMissionOkFail, 1 )		-- Nhi甿 v� ho鄋 th鄋h

		local missionInfo = format( "    衋 t� %s r鷗 餫o c製 vi畁, %s n鄖 xin mang h� v� qu� bang",
			rank, strDemandItemName )

		TAddText( sceneId, missionInfo )

		ResetMissionEvent( sceneId, selfId, x600036_g_MissionId, 4 )
		return
	elseif Phase == 5 then			-- 已经分配了杀怪任务
		local myLevel = GetLevel( sceneId, selfId )
		local nMonsterId, strMonsterName, strMonsterSceneDesc = LuaFnGetLevelMatchingMonster( x600036_g_MonsterOffset, myLevel )
		strMonsterSceneDesc	= gsub( strMonsterSceneDesc, "许ch", "" )
		local missionInfo = format( "    羒 ch�, th kh鬾g 瘊ng l鷆 ch鷗 n鄌, %s th� c�, m h鬽 tr呔c khi 餴 qua %s, kh鬾g th tr鱪g 瓞 %s � 痼 c呔p 餴 m r癷, n猽 %s mu痭 c� th� 餴 gi鄋h l読",
			strDemandItemName, strMonsterSceneDesc, strMonsterName, rank )

		TAddText( sceneId, missionInfo )
		return
	else							-- 意外情况
		return
	end
end

--**********************************
--放弃
--**********************************
function x600036_OnAbandon( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x600036_g_subMissionId ) == 1 then
		x600036_NotifyFailTips( sceneId, selfId, "蝎 ngh� ph鋓 b� 餴 c醕 nhi甿 v� c� li阯 quan" )
		return		-- 没有该任务
	end

	--删除物品
	local misIndex = GetMissionIndexByID( sceneId, selfId, x600036_g_MissionId )
	local demandItemId = GetMissionParam( sceneId, selfId, misIndex, x600036_g_MissionParam_ItemId )
	if GetItemCount( sceneId, selfId, demandItemId ) > 0 then
		DelItem( sceneId, selfId, demandItemId, 1 )
	end

	--删除玩家任务列表中对应to� 鸬 任务
	CallScriptFunction( x600036_g_ConstructionScript, "OnAbandon", sceneId, selfId )
end

--**********************************
--继续
--**********************************
function x600036_OnContinue( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, x600036_g_MissionName )
		AddText( sceneId, x600036_g_MissionComplete )
	EndEvent( )
	DispatchMissionContinueInfo( sceneId, selfId, targetId, x600036_g_ScriptId, x600036_g_MissionId )
end

--**********************************
--检测喧ng否可以提交
--**********************************
function x600036_CheckSubmit( sceneId, selfId, selectRadioId )
	--判断任务喧ng否已经完成
	local ret = CallScriptFunction( x600036_g_ConstructionScript, "CheckSubmit", sceneId, selfId )
	return ret
end

--**********************************
--提交
--**********************************
function x600036_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if GetName( sceneId, targetId ) ~= x600036_g_Name then		--判断该npc喧ng否喧ng对应任务to� 鸬 npc
		return
	end

	if x600036_CheckSubmit( sceneId, selfId ) == 1 then
		-- 扣东西
		local misIndex = GetMissionIndexByID( sceneId, selfId, x600036_g_MissionId )
		local demandItemId = GetMissionParam( sceneId, selfId, misIndex, x600036_g_MissionParam_ItemId )
		local nItemNum = LuaFnGetAvailableItemCount( sceneId, selfId, demandItemId )

		if nItemNum > 0 then
			if LuaFnDelAvailableItem( sceneId, selfId, demandItemId, 1 ) < 1 then
				return
			end
		else											-- 只作为容错,理论上不可能发生
			SetMissionByIndex( sceneId, selfId, misIndex, x600036_g_IsMissionOkFail, 0 )
			return
		end

		CallScriptFunction( x600036_g_ConstructionScript, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x600036_OnKillObject( sceneId, selfId, objdataId, objId )
	local allOwnersCount = GetMonsterOwnerCount( sceneId, objId )		--取 餴琺C醝 n鄖 怪物死后拥有分配权to� 鸬 人数
	local i, curOwner, misIndex, nNpcId, strNpcName
	local MonsterName = GetName( sceneId, objId )
	local demandItemId, demandItemCount

	for i = 0, allOwnersCount - 1 do
		curOwner = GetMonsterOwnerID( sceneId, objId, i )				--取 餴琺拥有分配权to� 鸬 人to� 鸬 objId
		if IsHaveMission( sceneId, curOwner, x600036_g_MissionId ) > 0 and
		   GetScriptIDByMissionID( sceneId, curOwner, x600036_g_MissionId ) == x600036_g_ScriptId then		--如果C醝 n鄖 人拥有任务
			misIndex = GetMissionIndexByID( sceneId, curOwner, x600036_g_MissionId )

		 	if GetMissionParam( sceneId, curOwner, misIndex, x600036_g_MissionParam_Phase ) ~= 5 then
		 		return
		 	end

			nNpcId = GetMissionParam( sceneId, curOwner, misIndex, x600036_g_MissionParam_MonsterId )
			_, strNpcName = GetNpcInfoByNpcId(sceneId, nNpcId )
			demandItemId = GetMissionParam( sceneId, curOwner, misIndex, x600036_g_MissionParam_ItemId )

			if MonsterName == strNpcName then
			-- m祎 定几率打出任务所需物品
				if GetItemCount( sceneId, curOwner, demandItemId ) < 1 then
					--if random( 100 ) > 10 then
						--return
					--end

					AddMonsterDropItem( sceneId, objId, curOwner, demandItemId )
				end
			end
		end
	end
end

--**********************************
--进入区域事件
--**********************************
function x600036_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x600036_OnItemChanged( sceneId, selfId, itemdataId )
	local misIndex = GetMissionIndexByID( sceneId, selfId, x600036_g_MissionId )

	local _, strItemName = GetItemInfoByItemId( itemdataId )
	local demandItemId = GetMissionParam( sceneId, selfId, misIndex, x600036_g_MissionParam_ItemId )
	local _, strDemandItemName = GetItemInfoByItemId( demandItemId )

	if strItemName == strDemandItemName then
		local nItemNum = GetItemCount( sceneId, selfId, itemdataId )
		local strText
		if nItemNum > 0 then
			strText = format( "秀 c� 疬㧟 %s", strItemName )
			SetMissionByIndex( sceneId, selfId, misIndex, x600036_g_IsMissionOkFail, 1 )
			SetMissionByIndex( sceneId, selfId, misIndex, x600036_g_MissionParam_Phase, 6 )
		else
			strText = format( "M 餴 %s", strItemName )
			SetMissionByIndex( sceneId, selfId, misIndex, x600036_g_IsMissionOkFail, 0 )
		end

		CallScriptFunction( x600036_g_CityMissionScript, "NotifyFailTips", sceneId, selfId, strText )
	end
end

function x600036_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
