--杀怪掉落任务(所有这m祎 类型都使用C醝 n鄖 LUA,修改请注意通用性)

MOD_EVENT = 006672

--脚本号
x006667_g_scriptId = 006667

x006667_g_duanyanqiId = 002016 --[tx43452]

x006667_g_StrForePart = 5
x006667_g_IsMissionOkFail = 0							-- 任务完成标记

--任务段分类列表_MissType	1.杀怪任务	2.送信任务	3.探索任务	4.寻物任务	5.护送任务
x006667_g_MissionTypeList	=	{ {StartIdx = 1000000, EndIdx = 1009999, ScriptId = 006666},
															{StartIdx = 1010000, EndIdx = 1019999, ScriptId = 006668},
															{StartIdx = 1020000, EndIdx = 1029999, ScriptId = 006669},
															{StartIdx = 1030000, EndIdx = 1039999, ScriptId = 006667},
															{StartIdx = 1050000, EndIdx = 1059999, ScriptId = 006671} }

--**********************************
-- 获取动态M鴆 ti陁 nhi甿 v� NPC to� 鸬 存储位置
-- 如果喧ng静态M鴆 ti陁 nhi甿 v� NPC,则Tr� v� -1
--**********************************
function x006667_GetTNpcStoreLoc( sceneId, selfId, targetId, missionIndex )
	return -1
end

--**********************************
-- 获取动态M鴆 ti陁 nhi甿 v� NPC to� 鸬  NPCID
-- 如果喧ng静态M鴆 ti陁 nhi甿 v� NPC,则Tr� v� -1
--**********************************
function x006667_GetTargetNpcId( sceneId, selfId, targetId, missionIndex )
	return -1
end

--**********************************
-- 获取动态任务物品to� 鸬  ItemIndex
-- 如果喧ng静态任务物品,则Tr� v� -1
--**********************************
function x006667_GetTItemStoreLoc( sceneId, selfId, targetId, missionIndex )
	local _, _, dynamicFlag = TGetLootItemInfo( missionIndex )

	if not dynamicFlag or dynamicFlag ~= 1 then
		return -1
	end

	local nOffset = 0
	if x006667_GetTNpcStoreLoc( sceneId, selfId, targetId, missionIndex ) ~= -1 then
		nOffset = nOffset + 1
	end

	return x006667_g_StrForePart + nOffset
end

--**********************************
-- 获取动态任务物品to� 鸬  ItemIndex
-- 如果喧ng静态任务物品,则Tr� v� -1
--**********************************
function x006667_GetTargetItemIndex( sceneId, selfId, targetId, missionIndex )
	local loc = x006667_GetTItemStoreLoc( sceneId, selfId, targetId, missionIndex )
	if loc == -1 then
		return -1
	end

	local missionId = TGetMissionIdByIndex( missionIndex )
	local misIndex = GetMissionIndexByID( sceneId, selfId, missionId )
	return GetMissionParam( sceneId, selfId, misIndex, loc )
end

--**********************************
--任务入口函数
--**********************************
function x006667_OnDefaultEvent( sceneId, selfId, targetId, missionIndex )	-- 餴琺击该任务后执行此脚本
	local missionId = TGetMissionIdByIndex( missionIndex )
	local missionName = TGetMissionName( missionIndex )
	local npcId = -1
	local itemIndex = -1

	local _, missionInfo, missionContinue = TGetMissionDesc( missionIndex )

	--发送任务需求to� 鸬 信息
	if IsHaveMission( sceneId, selfId, missionId ) > 0 then
		--发送任务需求to� 鸬 信息
		npcId = x006667_GetTargetNpcId( sceneId, selfId, targetId, missionIndex )
		itemIndex = x006667_GetTargetItemIndex( sceneId, selfId, targetId, missionIndex )
		
		
		BeginEvent( sceneId )
			AddText( sceneId, missionName )
			AddText( sceneId, CallScriptFunction( MOD_EVENT, "FormatDuologue", sceneId, selfId, missionContinue, npcId, itemIndex, "" ) )
		EndEvent( )
		local bDone = x006667_CheckSubmit( sceneId, selfId, missionIndex )		
		DispatchMissionDemandInfo( sceneId, selfId, targetId, missionIndex, missionId, bDone )
	elseif CallScriptFunction( MOD_EVENT, "CheckAccept", sceneId, selfId, missionIndex ) > 0 then
		local _, acceptNpcName = TGetAcceptNpcInfo( missionIndex )
		if acceptNpcName == "" then										-- 随机任务,自动接取
			if x006667_OnAccept( sceneId, selfId, targetId, missionIndex ) ~= 1 then
				return
			end

			npcId = x006667_GetTargetNpcId( sceneId, selfId, targetId, missionIndex )
			itemIndex = x006667_GetTargetItemIndex( sceneId, selfId, targetId, missionIndex )
		end
		
		--发送任务Ti猵 th毕允総o� 鸬 信息
		BeginEvent( sceneId )
			AddText( sceneId, missionName )
			AddText( sceneId, CallScriptFunction( MOD_EVENT, "FormatDuologue", sceneId, selfId, missionInfo, npcId, itemIndex, "" ) )
			CallScriptFunction( MOD_EVENT, "DisplayBonus", sceneId, missionIndex, selfId )
		EndEvent( )

		if acceptNpcName == "" then										-- 随机任务,自动接取
						
			local _, _, dynamicFlag = TGetLootItemInfo( missionIndex )
			
			-- PrintStr("dynamicFlag ="..dynamicFlag)
			
			if dynamicFlag ~= 2 then				
				DispatchEventList( sceneId, selfId, targetId )
				
				local LogInfo	= format( "[XunWu]Old..Accept:( sceneId=%d, GUID=%0X ), missionIndex=%d",
													sceneId,
													LuaFnObjId2Guid( sceneId, selfId ),
													missionIndex )
				MissionLog(sceneId, LogInfo)
				
			else
				local a, b, c, rowidx = TGetLootItemInfo( missionIndex )	
				-- PrintStr("rowidx ="..rowidx)
				
				if rowidx < 1 then
					return 0
				end
				
				local groupcnt = GetMissionGroupCount( sceneId, rowidx )
				-- PrintStr("groupcnt ="..groupcnt)			
				
				if groupcnt < 1 then
					return 0
				end
				
				local groupid = random(groupcnt)
				-- PrintStr("groupid ="..groupid)
				
				if groupid < 1 then
					return 0
				end
				
				local groupitemcnt = GetMissionItemCount( sceneId, rowidx, groupid )
				-- PrintStr("groupitemcnt ="..groupitemcnt)
				
				if groupitemcnt < 1 then
					return 0
				end
						
				local nitemid = 0
				local nitemname = 0
				
				local ItemNameList = ""
				for i = 1, groupitemcnt do
					nitemid = GetMissionGroupItemID( sceneId, rowidx, groupid, i-1 )
					nitemname = GetItemName( sceneId, nitemid )
					ItemNameList = ItemNameList..nitemname
					
					if i ~= groupitemcnt then
						ItemNameList = ItemNameList..","
					end
					-- PrintStr("itemid ="..nitemid)
					-- PrintStr("itemname ="..nitemname)
				end		
				
				-- PrintStr("ItemNameList ="..ItemNameList)
						
				--发送任务Ti猵 th毕允総o� 鸬 信息
				BeginEvent( sceneId )
					AddText( sceneId, missionName )
					AddText( sceneId, CallScriptFunction( MOD_EVENT, "FormatDuologue", sceneId, selfId, missionInfo, npcId, itemIndex, ItemNameList ) )
					CallScriptFunction( MOD_EVENT, "DisplayBonus", sceneId, missionIndex, selfId )
				EndEvent( )
				
				DispatchEventList( sceneId, selfId, targetId )
				
				local LogInfo	= format( "[XunWu]New..Accept:( sceneId=%d, GUID=%0X ), missionIndex=%d, groupitemcnt=%d, groupid=%d, rowidx=%d",
													sceneId,
													LuaFnObjId2Guid( sceneId, selfId ),
													missionIndex,
													groupitemcnt,
													groupid,
													rowidx )
				MissionLog(sceneId, LogInfo)
				
				local misIndex = GetMissionIndexByID( sceneId, selfId, missionId )
				-- PrintStr("misIndex ="..misIndex)
				SetMissionByIndex( sceneId, selfId, misIndex, 4, groupitemcnt )
				SetMissionByIndex( sceneId, selfId, misIndex, 6, groupid )
				SetMissionByIndex( sceneId, selfId, misIndex, 7, rowidx )
			end
		else
			-- PrintStr("acceptNpcName != NULL")
			DispatchMissionInfo( sceneId, selfId, targetId, missionIndex, missionId )
		end
	end
end

--**********************************
--列举事件
--**********************************
function x006667_OnEnumerate( sceneId, selfId, targetId, missionIndex )
	CallScriptFunction( MOD_EVENT, "DoEnumerate", sceneId, selfId, targetId, missionIndex )
end

--**********************************
--Ti猵 th�
--**********************************
function x006667_OnAccept( sceneId, selfId, targetId, missionIndex )
	local missionId = TGetMissionIdByIndex( missionIndex )
	local missionName = TGetMissionName( missionIndex )

	-- 检测玩家喧ng不喧ng已经完成过C醝 n鄖 任务
	if IsMissionHaveDone( sceneId, selfId, missionId ) > 0
	 and TIsMissionRoundable( missionIndex ) ~= 1 then
		return 0
	end

	-- 再次检测玩家喧ng不喧ng能够Ti猵 th鳦醝 n鄖 任务
	if CallScriptFunction( MOD_EVENT, "CheckAccept", sceneId, selfId, missionIndex )  <= 0  then
		return 0
	end

	--加入任务到玩家列表
	local ret = AddMission( sceneId, selfId, missionId, missionIndex, 1, 0, 1 )
	if ret <= 0 then
		Msg2Player( sceneId, selfId, "#YDanh s醕h nhi甿 v�#W: c黙 c醕 h� 疸 馥y r癷", MSG2PLAYER_PARA )
		return 0
	end

	--设置任务变量宝物to� 鸬 场景编号和坐标位置
	local misIndex = GetMissionIndexByID( sceneId, selfId, missionId )		-- 餴琺到任务T読 20c醝任务中to� 鸬 序列号
	SetMissionByIndex( sceneId, selfId, misIndex, x006667_g_IsMissionOkFail, 0 )	--根据序列号把任务变量to� 鸬 第m祎 位置0	第m祎 位喧ng完成/th b読情况

	-- 如果交任务to� 鸬 人不喧ng接任务to� 鸬 人
	local nscene1, name1 = TGetAcceptNpcInfo( missionIndex )
	local nscene2, name2 = TGetCompleteNpcInfo( missionIndex )
	if name1 ~= name2 then
		SetMissionEvent( sceneId, selfId, missionId, 4 )
	end

	-- 如果当前任务物品喧ng动态
	local itemStoreLocation = x006667_GetTItemStoreLoc( sceneId, selfId, targetId, missionIndex )
	if itemStoreLocation ~= -1 then
		local _, _, _, item = TGetLootItemInfo( missionIndex )
		-- 转换 item 号
		item = GetOneMissionItem( item )
		SetMissionByIndex( sceneId, selfId, misIndex, itemStoreLocation, item )
	end

	Msg2Player( sceneId, selfId, "#YTi猵 nh#W" .. missionName, MSG2PLAYER_PARA )
	return 1
end

--**********************************
--放弃
--**********************************
function x006667_OnAbandon( sceneId, selfId, missionIndex )
	local missionId = TGetMissionIdByIndex( missionIndex )
	local missionName = TGetMissionName( missionIndex )

	--删除玩家任务列表中对应to� 鸬 任务
	local a = { { name = "", flag = 0, item = 0, pro = 0, ct = 0 },
				{ name = "", item = 0, pro = 0, ct = 0 },
				{ name = "", item = 0, pro = 0, ct = 0 },
				{ name = "", item = 0, pro = 0, ct = 0 },
				{ name = "", item = 0, pro = 0, ct = 0 } }

	local killDataCount = 0
	killDataCount, a[1].name, a[1].flag, a[1].item, a[1].pro, a[1].ct, a[2].name, a[2].item, a[2].pro, a[2].ct,
		a[3].name, a[3].item, a[3].pro, a[3].ct, a[4].name, a[4].item, a[4].pro, a[4].ct, a[5].name, a[5].item,
		a[5].pro, a[5].ct = TGetLootItemInfo( missionIndex )

	local newItemIndex = x006667_GetTargetItemIndex( sceneId, selfId, -1, missionIndex )
	if newItemIndex ~= -1 then
		a[1].item = newItemIndex
	end

	for i = 1, killDataCount do
		DelItem( sceneId, selfId, a[i].item, a[i].ct )
	end

	-- 惩罚,扣除关系值
	CallScriptFunction( MOD_EVENT, "PunishRelationShip", sceneId, selfId, missionIndex )

	-- 惩罚,m祎 段时间不让接任务
	CallScriptFunction( MOD_EVENT, "AcceptTimeLimit", sceneId, selfId, missionIndex )

	DelMission( sceneId, selfId, missionId )
end

--**********************************
--继续
--**********************************
function x006667_OnContinue( sceneId, selfId, targetId, missionIndex )
	
	local missionId = TGetMissionIdByIndex( missionIndex )
	local missionName = TGetMissionName( missionIndex )
	local missionTarget, _, _, missionComplete = TGetMissionDesc( missionIndex )
	local npcId = x006667_GetTargetNpcId( sceneId, selfId, targetId, missionIndex )
	local itemIndex = x006667_GetTargetItemIndex( sceneId, selfId, targetId, missionIndex )

	local _, _, dynamicFlag = TGetLootItemInfo( missionIndex )
			
	-- PrintStr("dynamicFlag ="..dynamicFlag)
			
	if dynamicFlag ~= 2 then
		BeginEvent( sceneId )
			AddText( sceneId, missionName )
		--[tx43452]			
			--AddText( sceneId, CallScriptFunction( MOD_EVENT, "FormatDuologue", sceneId, selfId, missionComplete, npcId, itemIndex, "" ) )
			--AddText( sceneId, "#{M_MUBIAO}#r" )
			--AddText( sceneId, CallScriptFunction( MOD_EVENT, "FormatDuologue", sceneId, selfId, missionTarget, npcId, itemIndex, "" ) )
			local ret = CallScriptFunction(x006667_g_duanyanqiId, "NPCTalkOnFirstSubmission", sceneId, selfId, missionIndex, 0 )
			if ret == 0 then					
				AddText( sceneId, CallScriptFunction( MOD_EVENT, "FormatDuologue", sceneId, selfId, missionComplete, npcId, itemIndex, "" ) )
				AddText( sceneId, "#{M_MUBIAO}#r" )
				AddText( sceneId, CallScriptFunction( MOD_EVENT, "FormatDuologue", sceneId, selfId, missionTarget, npcId, itemIndex, "" ) )
			end	
		--[/tx43452]				
			CallScriptFunction( MOD_EVENT, "DisplayBonus", sceneId, missionIndex, selfId )
		EndEvent( )
		
		DispatchMissionContinueInfo( sceneId, selfId, targetId, missionIndex, missionId )
	else
		local missionId = TGetMissionIdByIndex( missionIndex )
		
		if IsHaveMission( sceneId, selfId, missionId ) <= 0 then
			return 0
		end
		
		local misIndex = GetMissionIndexByID( sceneId, selfId, missionId )
		local nitemcnt = GetMissionParam( sceneId, selfId, misIndex, 4 )
		local ngroupid = GetMissionParam( sceneId, selfId, misIndex, 6 )
		local nrowidx  = GetMissionParam( sceneId, selfId, misIndex, 7 )
		-- PrintStr("nitemcnt ="..nitemcnt)
		-- PrintStr("ngroupid ="..ngroupid)
		-- PrintStr("nrowidx ="..nrowidx)
		
		if nitemcnt < 1 or ngroupid < 1 or nrowidx < 1 then
			return 0
		end
		
		local nitemid = 0
		local nitemname = "" 
		
		local ItemNameList = ""
		for i = 1, nitemcnt do
			nitemid = GetMissionGroupItemID( sceneId, nrowidx, ngroupid, i-1 )
			nitemname = GetItemName( sceneId, nitemid )
			ItemNameList = ItemNameList..nitemname
			
			if i ~= nitemcnt then
				ItemNameList = ItemNameList..","
			end
			-- PrintStr("itemid ="..nitemid)
			-- PrintStr("itemname ="..nitemname)
		end		
		
		-- PrintStr("ItemNameList ="..ItemNameList)
		
		--发送任务Ti猵 th毕允総o� 鸬 信息
		BeginEvent( sceneId )
			AddText( sceneId, missionName )			
			-- AddText( sceneId, CallScriptFunction( MOD_EVENT, "FormatDuologue", sceneId, selfId, missionComplete, npcId, itemIndex, "" ) )
			AddText( sceneId, "#{M_MUBIAO}#r" )
			AddText( sceneId, CallScriptFunction( MOD_EVENT, "FormatDuologue", sceneId, selfId, missionTarget, npcId, itemIndex, ItemNameList ) )
			-- CallScriptFunction( MOD_EVENT, "DisplayBonus", sceneId, missionIndex, selfId )
		EndEvent( )
		
		local bDone = 2		
		DispatchMissionDemandInfo( sceneId, selfId, targetId, missionIndex, missionId, bDone )
		-- DispatchMissionContinueInfo( sceneId, selfId, targetId, missionIndex, missionId )
	end
	
end

--**********************************
--检测喧ng否可以提交
--**********************************
function x006667_CheckSubmit( sceneId, selfId, missionIndex )
	
	-- 看 餴琺到to� 鸬 物品喧ng不喧ng任务C to� 鸬 
	local _, _, dynamicFlag = TGetLootItemInfo( missionIndex )
	-- PrintStr("dynamicFlag ="..dynamicFlag)
	if dynamicFlag ~= 2 then
		local a = { { name = "", flag = 0, item = 0, pro = 0, ct = 0 },
					{ name = "", item = 0, pro = 0, ct = 0 },
					{ name = "", item = 0, pro = 0, ct = 0 },
					{ name = "", item = 0, pro = 0, ct = 0 },
					{ name = "", item = 0, pro = 0, ct = 0 } }
	
		local killDataCount = 0
		killDataCount, a[1].name, a[1].flag, a[1].item, a[1].pro, a[1].ct, a[2].name, a[2].item, a[2].pro, a[2].ct,
			a[3].name, a[3].item, a[3].pro, a[3].ct, a[4].name, a[4].item, a[4].pro, a[4].ct, a[5].name, a[5].item,
			a[5].pro, a[5].ct = TGetLootItemInfo( missionIndex )
	
		local newItemIndex = x006667_GetTargetItemIndex( sceneId, selfId, -1, missionIndex )
		if newItemIndex ~= -1 then
			a[1].item = newItemIndex
		end
	
		local bGetAllFlag = 1
		local nItemNum
	
		for i = 1, killDataCount do
			--  鹫t 疬㧟当前玩家拥有C醝 n鄖 物品to� 鸬 物品数
			nItemNum = LuaFnGetAvailableItemCount( sceneId, selfId, a[i].item )
	
			if a[i].ct > nItemNum then
				bGetAllFlag = 0
			end
		end
	
		return bGetAllFlag
	else
	
		local missionId = TGetMissionIdByIndex( missionIndex )
		
		if IsHaveMission( sceneId, selfId, missionId ) <= 0 then
			return 0
		end
		
		local misIndex = GetMissionIndexByID( sceneId, selfId, missionId )
		local nitemcnt = GetMissionParam( sceneId, selfId, misIndex, 4 )
		local ngroupid = GetMissionParam( sceneId, selfId, misIndex, 6 )
		local nrowidx  = GetMissionParam( sceneId, selfId, misIndex, 7 )
		-- PrintStr("nitemcnt ="..nitemcnt)
		-- PrintStr("ngroupid ="..ngroupid)
		-- PrintStr("nrowidx ="..nrowidx)
		
		if nitemcnt < 1 or ngroupid < 1 or nrowidx < 1 then
			return 0
		end
				
		for i = 1, nitemcnt do
			local itemid = GetMissionGroupItemID( sceneId, nrowidx, ngroupid, i-1 )
			local itemcnt = LuaFnGetAvailableItemCount( sceneId, selfId, itemid )
			-- PrintStr("itemid ="..itemid)
			-- PrintStr("itemcnt ="..itemcnt)
			
			if itemcnt > 0 then
				return 1
			end		
			
		end		
		
		return 0
	end
end

--**********************************
--提交
--**********************************
function x006667_OnSubmit( sceneId, selfId, targetId, selectRadioId, missionIndex )
	
	if x006667_CheckSubmit( sceneId, selfId, missionIndex ) > 0 then
		local missionId = TGetMissionIdByIndex( missionIndex )
		local missionName = TGetMissionName( missionIndex )

		-- 安全性检测
		-- 1、检测玩家喧ng不喧ng有C醝 n鄖 任务
		if IsHaveMission( sceneId, selfId, missionId ) <= 0 then
			return
		end

		-- 2、其他检测
		-- 发奖检测
		local ItemCount, nAddItemNum = 0, 0
		local item, count = 1, 2
		local mi = { { -1, 0 }, { -1, 0 }, { -1, 0 }, { -1, 0 }, { -1, 0 } }

		-- 尝试增加奖励物品
		BeginAddItem( sceneId )
		ItemCount, mi[1][1], mi[1][2], mi[2][1], mi[2][2], mi[3][1], mi[3][2],
			mi[4][1], mi[4][2], mi[5][1], mi[5][2] = TGetAwardItem( missionIndex )

		if ItemCount > 0 then											-- 固定奖励
			for i = 1, ItemCount do
				if mi[i][item] > 0 then
					AddItem( sceneId, mi[i][item], mi[i][count] )
					nAddItemNum = nAddItemNum + 1
				end
			end
		end

		ItemCount, mi[1][1], mi[1][2], mi[2][1], mi[2][2], mi[3][1], mi[3][2],
			mi[4][1], mi[4][2], mi[5][1], mi[5][2] = TGetRadioItem( missionIndex )

		if ItemCount > 0 then											-- 选择奖励
			for i = 1, ItemCount do
				if mi[i][item] > 0 and mi[i][item] == selectRadioId then
					AddItem( sceneId, mi[i][item], mi[i][count] )
					nAddItemNum = nAddItemNum + 1
					break
				end
			end
		end

		ItemCount, mi[1][1], mi[1][2], mi[2][1], mi[2][2], mi[3][1], mi[3][2],
			mi[4][1], mi[4][2], mi[5][1], mi[5][2] = TGetHideItem( missionIndex )

		if ItemCount > 0 then											-- 隐藏奖励
			for i = 1, ItemCount do
				if mi[i][item] > 0 then
					AddItem( sceneId, mi[i][item], mi[i][count] )
					nAddItemNum = nAddItemNum + 1
				end
			end
		end

		if CallScriptFunction(x006667_g_duanyanqiId, "OnAddRewards", sceneId, selfId, missionIndex) == 1 then--[tx43452]
			nAddItemNum = nAddItemNum + 1			
		end--[/tx43452]
		local ret = EndAddItem( sceneId, selfId )
		if ret <= 0 then
			x006667_NotifyFailTips( sceneId, selfId, "Kh鬾g th� Ho鄋 t nhi甿 v�" )
			return
		end

		--删除任务中提交to� 鸬 物品
		local _, _, dynamicFlag = TGetLootItemInfo( missionIndex )
	
		if dynamicFlag ~= 2 then		
			local a = { { name = "", flag = 0, item = 0, pro = 0, ct = 0 },
						{ name = "", item = 0, pro = 0, ct = 0 },
						{ name = "", item = 0, pro = 0, ct = 0 },
						{ name = "", item = 0, pro = 0, ct = 0 },
						{ name = "", item = 0, pro = 0, ct = 0 } }
	
			local killDataCount = 0
			killDataCount, a[1].name, a[1].flag, a[1].item, a[1].pro, a[1].ct, a[2].name, a[2].item, a[2].pro, a[2].ct,
				a[3].name, a[3].item, a[3].pro, a[3].ct, a[4].name, a[4].item, a[4].pro, a[4].ct, a[5].name, a[5].item,
				a[5].pro, a[5].ct = TGetLootItemInfo( missionIndex )
	
			local newItemIndex = x006667_GetTargetItemIndex( sceneId, selfId, -1, missionIndex )
			if newItemIndex ~= -1 then
				a[1].item = newItemIndex
			end
	
			local LogInfo	= format( "[XunWu]Old..Submit:( sceneId=%d, GUID=%0X ), missionIndex=%d",
													sceneId,
													LuaFnObjId2Guid( sceneId, selfId ),
													missionIndex )
			MissionLog(sceneId, LogInfo)
	
			for i = 1, killDataCount do
				LuaFnDelAvailableItem( sceneId, selfId, a[i].item, a[i].ct )
			end
		else
			
			local LogInfo	= format( "[XunWu]New..Submit:( sceneId=%d, GUID=%0X ), missionIndex=%d, selectRadioId=%d",
													sceneId,
													LuaFnObjId2Guid( sceneId, selfId ),
													missionIndex,
													selectRadioId )
			MissionLog(sceneId, LogInfo)
			local ItemType = GetItemClass( selectRadioId )											--  鹫t 疬㧟提交物品to� 鸬 Class
			
			local ItemPos = 0
			local startpos = 0
			while (ItemPos ~= -1)do
				ItemPos = LuaFnGetItemPosByItemDataID(sceneId, selfId, selectRadioId, startpos)
				if (ItemPos == -1) then																						--没找到
					break
				end
				
				startpos = ItemPos+1																							--从下m祎 c醝位置开始找
				
				if (LuaFnIsItemAvailable( sceneId, selfId, ItemPos ) ~= 0) then		--喧ng否锁定
					if ItemType == 1 then																						-- 喧ng否属于可以鉴定to� 鸬 物品
						if LuaFnIsJudgeApt(sceneId, selfId, ItemPos) == 1 then				--喧ng否鉴定过
							break																												--鉴定过才能扣除
						end
					else
						break;																												--不可鉴定物品只要Available就可以扣除
					end
				end
			end
			if (ItemPos == -1) then
				x006667_NotifyFailTips( sceneId, selfId, "Kh鬾g th� Ho鄋 t nhi甿 v�" )					
				return 0
			end
			
			local isdelitem  = 0
			if ItemType == 1 then
				isdelitem =	EraseItem(sceneId, selfId, ItemPos)													--C 鉴定to� 鸬 按位置删除
			else	
				isdelitem =	LuaFnDelAvailableItem( sceneId, selfId, selectRadioId, 1 )	--不C 鉴定to� 鸬 按物品删除(这里如果直接EraseItem堆叠物品会出问题)
			end
			
			if isdelitem == 0 then
				x006667_NotifyFailTips( sceneId, selfId, "Kh鬾g th� Ho鄋 t nhi甿 v�" )					
				return 0
			end
						
		end

		-- 添加奖励物品
		if nAddItemNum > 0 then
			AddItemListToHuman( sceneId, selfId )
		end

		-- 添加任务奖励
		local awardMoney = TGetAwardMoney( missionIndex )
		if awardMoney > 0 then
			AddMoney( sceneId, selfId, awardMoney, missionId, missionIndex )
		end

		local awardExp = TGetAwardExp( missionIndex )
		if awardExp > 0 then
			LuaFnAddExp( sceneId, selfId, awardExp )
		end

		-- 奖励关系值
		CallScriptFunction( MOD_EVENT, "RewardRelationShip", sceneId, selfId, missionIndex, targetId )

		local mdLocation, _, _ = TGetRelationShipAwardInfo( missionIndex );
		if mdLocation == MD_RELATION_AZHU then
			CallScriptFunction(005001, "OnModEvent_Submit", sceneId, selfId, targetId, missionIndex)
		elseif mdLocation == MD_RELATION_DUANYANQING then
			CallScriptFunction(x006667_g_duanyanqiId, "OnMissionSubmitionSuccess", sceneId, selfId, targetId, missionIndex) --[tx43452]	
		elseif mdLocation == MD_RELATION_MUWANQING then --zchw
			CallScriptFunction(002010, "OnModEvent_Submit", sceneId, selfId, targetId, missionIndex)
		end

		DelMission( sceneId, selfId, missionId )
		-- 设置任务已经被完成过
		MissionCom( sceneId, selfId, missionId )
		local strText = "#Y" .. missionName .. " nhi甿 v� 疸 ho鄋 th鄋h"
		x006667_NotifyFailTips( sceneId, selfId, strText )
		Msg2Player( sceneId, selfId, strText, MSG2PLAYER_PARA )

		LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 18, 0 )
		CallScriptFunction( SCENE_SCRIPT_ID, "PlaySoundEffect", sceneId, selfId, 66 )
		
		--  鹫t 疬㧟后续任务to� 鸬 Index
		local NextMissIndex = GetNextMissionIndex( missionIndex )

		for i, MissType in x006667_g_MissionTypeList do
			if MissType.ScriptId ~= nil and MissType.ScriptId ~= 0 then
				if NextMissIndex ~= 0 and NextMissIndex >= MissType.StartIdx and NextMissIndex <= MissType.EndIdx then
					local missionId = TGetMissionIdByIndex( NextMissIndex )
					local szNpcName = GetName( sceneId, targetId )
					local AcceptNpcScene, AcceptNpcName = TGetAcceptNpcInfo( NextMissIndex )

					if sceneId == AcceptNpcScene and szNpcName == AcceptNpcName then
						if MissType.ScriptId == x006667_g_scriptId then
							if IsHaveMission( sceneId, selfId, missionId ) <= 0 then
								x006667_OnDefaultEvent( sceneId, selfId, targetId, NextMissIndex )
							end
						else
							if IsHaveMission( sceneId, selfId, missionId ) <= 0 then
								CallScriptFunction( MissType.ScriptId, "OnDefaultEvent", sceneId, selfId, targetId, NextMissIndex )
							end
						end
					end
					
					break;
				end
			end
		end
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x006667_OnKillObject( sceneId, selfId, objdataId, objId, missionIndex )	--参数意思: 场景号、玩家objId、怪物表位置号、怪物objId
	local missionId = TGetMissionIdByIndex( missionIndex )
	local missionName = TGetMissionName( missionIndex )

	local misIndex = GetMissionIndexByID( sceneId, selfId, missionId )

	local a = { { name = "", flag = 0, item = 0, pro = 0, ct = 0 },
				{ name = "", item = 0, pro = 0, ct = 0 },
				{ name = "", item = 0, pro = 0, ct = 0 },
				{ name = "", item = 0, pro = 0, ct = 0 },
				{ name = "", item = 0, pro = 0, ct = 0 } }

	local killDataCount = 0
	killDataCount, a[1].name, a[1].flag, a[1].item, a[1].pro, a[1].ct, a[2].name, a[2].item, a[2].pro, a[2].ct,
		a[3].name, a[3].item, a[3].pro, a[3].ct, a[4].name, a[4].item, a[4].pro, a[4].ct, a[5].name, a[5].item,
		a[5].pro, a[5].ct = TGetLootItemInfo( missionIndex )

	local monsterName = GetMonsterNamebyDataId( objdataId )
	for i = 1, killDataCount do
		if monsterName == a[i].name then
			local num = GetMonsterOwnerCount( sceneId, objId )				--取 餴琺C醝 n鄖 怪物死后拥有分配权to� 鸬 人数
			for j = 0, num - 1 do
				local humanObjId = GetMonsterOwnerID( sceneId, objId, j )	--取 餴琺拥有分配权to� 鸬 人to� 鸬 objId
				if IsHaveMission( sceneId, humanObjId, missionId ) > 0 then	--如果C醝 n鄖 人拥有任务
					if GetItemCount( sceneId, humanObjId, a[i].item ) < a[i].ct then
						-- C 计算概率
						local nPro = random( 100 )
						if nPro <= a[i].pro then
							AddMonsterDropItem( sceneId, objId, humanObjId, a[i].item )	--给C醝 n鄖 人任务道具(道具会出现T読 尸体包里)
						end
					end
				end
			end
		end
	end
end

--**********************************
--道具改变
--**********************************
function x006667_OnItemChanged( sceneId, selfId, itemdataId, missionIndex )
	-- 看 餴琺到to� 鸬 物品喧ng不喧ng任务C to� 鸬 
	local a = { { name = "", flag = 0, item = 0, pro = 0, ct = 0 },
				{ name = "", item = 0, pro = 0, ct = 0 },
				{ name = "", item = 0, pro = 0, ct = 0 },
				{ name = "", item = 0, pro = 0, ct = 0 },
				{ name = "", item = 0, pro = 0, ct = 0 } }

	local killDataCount = 0
	killDataCount, a[1].name, a[1].flag, a[1].item, a[1].pro, a[1].ct, a[2].name, a[2].item, a[2].pro, a[2].ct,
		a[3].name, a[3].item, a[3].pro, a[3].ct, a[4].name, a[4].item, a[4].pro, a[4].ct, a[5].name, a[5].item,
		a[5].pro, a[5].ct = TGetLootItemInfo( missionIndex )

	local newItemIndex = x006667_GetTargetItemIndex( sceneId, selfId, -1, missionIndex )
	if newItemIndex ~= -1 then
		a[1].item = newItemIndex
	end

	local bGetAllFlag = 1
	local nItemNum, strText

	for i = 1, killDataCount do
		nItemNum = GetItemCount( sceneId, selfId, a[i].item )

		if a[i].ct > nItemNum then
			bGetAllFlag = 0
		end

		if itemdataId == a[i].item then
			--  鹫t 疬㧟当前玩家拥有C醝 n鄖 物品to� 鸬 物品数

			-- 只有T読 物品c醝数小于C 或者等于C to� 鸬 时候才显示
			if a[i].ct >= nItemNum then
				strText = format( "秀 鹫t 疬㧟 #{_ITEM%s} %d/%d", a[i].item, nItemNum, a[i].ct )
				x006667_NotifyFailTips( sceneId, selfId, strText )
			end
		end
	end

	if bGetAllFlag == 1 then
		local missionId = TGetMissionIdByIndex( missionIndex )
		local misIndex = GetMissionIndexByID( sceneId, selfId, missionId )
		SetMissionByIndex( sceneId, selfId, misIndex, x006667_g_IsMissionOkFail, 1 )
	end
end

function x006667_OnLockedTarget( sceneId, selfId, targetId, missionIndex )
	local missionId = TGetMissionIdByIndex( missionIndex )
	local missionName = TGetMissionName( missionIndex )
	local szNpcName = GetName( sceneId, targetId )
	local nScene, szName = TGetCompleteNpcInfo( missionIndex )
	if szNpcName == szName then
		-- 找对人咯
		-- 喧ng否为循环任务
		if TIsMissionRoundable( missionIndex ) == 1 then
			TAddNumText( sceneId, missionIndex, missionName, 4, -1 )
		else
			TAddNumText( sceneId, missionIndex, missionName, 2, -1 )
		end
		TDispatchEventList( sceneId, selfId, targetId )
		return 1
	end

	return 0
end

--**********************************
-- 屏幕中间信息提示
--**********************************
function x006667_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

-- 任务物品提交界面
function x006667_OnMissionCheck( sceneId, selfId, targetId, scriptId, index1, index2, index3, petindex, missionIndex )
		
	if scriptId ~= x006667_g_scriptId then
		x006667_NotifyFailTips( sceneId, selfId, "Kh鬾g th� Ho鄋 t nhi甿 v�" )					
		return 0
	end
	
	local index = 0
	local ItemID = 0	
	
	for i=1, 3 do
		if i == 1 then
			index = index1
		elseif i == 2 then
			index = index2
		elseif i == 3 then
			index = index3
		else
			index = index1
		end
		
		if index < 100 then	
			ItemID = LuaFnGetItemTableIndexByIndex(sceneId, selfId, index)
			-- 检测物品喧ng否符合任务提交要求
			
			-- 物品喧ng否锁定
			if LuaFnIsItemAvailable( sceneId, selfId, index ) == 0 then
				break
			end
									
			local missionId = TGetMissionIdByIndex( missionIndex )
		
			if IsHaveMission( sceneId, selfId, missionId ) <= 0 then
				return 0
			end
		
			local misIndex = GetMissionIndexByID( sceneId, selfId, missionId )
			local nitemcnt = GetMissionParam( sceneId, selfId, misIndex, 4 )
			local ngroupid = GetMissionParam( sceneId, selfId, misIndex, 6 )
			local nrowidx  = GetMissionParam( sceneId, selfId, misIndex, 7 )
			-- PrintStr("nitemcnt ="..nitemcnt)
			-- PrintStr("ngroupid ="..ngroupid)
			-- PrintStr("nrowidx ="..nrowidx)
			
			if nitemcnt < 1 or ngroupid < 1 or nrowidx < 1 then
				return 0
			end
			
			local submitcnt = 0			
			local ItemNameList = ""
			for i = 1, nitemcnt do
				local nitemid = GetMissionGroupItemID( sceneId, nrowidx, ngroupid, i-1 )
				local itemcnt = LuaFnGetAvailableItemCount( sceneId, selfId, nitemid )
				local nitemname = GetItemName( sceneId, nitemid )
				ItemNameList = ItemNameList..nitemname
			
				if i ~= nitemcnt then
					ItemNameList = ItemNameList.."、"
				end
				-- PrintStr("nitemid ="..nitemid)
				-- PrintStr("itemcnt ="..itemcnt)
				if itemcnt > 0 and ItemID == nitemid then
					submitcnt = submitcnt + 1
				end
			end
				
			if submitcnt > 0 then
			
				local ItemType = GetItemClass( ItemID )				--  鹫t 疬㧟提交物品to� 鸬 Class
			
				if ItemType == 1 then													-- 喧ng否属于可以鉴定to� 鸬 物品
					
					-- 物品喧ng否鉴定
					if LuaFnIsJudgeApt(sceneId, selfId, index) ~= 1 then					
						BeginEvent(sceneId)
							AddText(sceneId, "C醝 n鄖 trang b� thu礳 t韓h c鵱g t� ch c騨 ch遖 t痶, c� l� n� l� nh ki畁 thi阯 h� #Gc馽 ph#W! Ta c trang b� To鄋 m�!")
						EndEvent( )
						DispatchEventList( sceneId, selfId, targetId )
						return 0
					end
							
				end
			
				local res = x006667_OnSubmit( sceneId, selfId, targetId, ItemID, missionIndex )
				
				if res == 0 then
					x006667_NotifyFailTips( sceneId, selfId, "Kh鬾g th� Ho鄋 t nhi甿 v�" )					
					return 0
				end
				
				local missionName = TGetMissionName( missionIndex )
				local npcId = x006667_GetTargetNpcId( sceneId, selfId, targetId, missionIndex )
				local missionTarget, _, _, missionComplete = TGetMissionDesc( missionIndex )
				local itemIndex = x006667_GetTargetItemIndex( sceneId, selfId, targetId, missionIndex )
				--发送任务提交时显示to� 鸬 信息
				BeginEvent( sceneId )
					AddText( sceneId, missionName )				
				--[tx43452]
					--AddText( sceneId, CallScriptFunction( MOD_EVENT, "FormatDuologue", sceneId, selfId, missionComplete, npcId, itemIndex, "" ) )
					local ret = CallScriptFunction(x006667_g_duanyanqiId, "NPCTalkOnFirstSubmission", sceneId, selfId, missionIndex, 1 )
					if ret == 0 then					
						AddText( sceneId, CallScriptFunction( MOD_EVENT, "FormatDuologue", sceneId, selfId, missionComplete, npcId, itemIndex, "" ) )
					end	
				--[/tx43452]			
					-- AddText( sceneId, "#{M_MUBIAO}#r" )
					-- AddText( sceneId, CallScriptFunction( MOD_EVENT, "FormatDuologue", sceneId, selfId, missionTarget, npcId, itemIndex, ItemNameList ) )
					-- CallScriptFunction( MOD_EVENT, "DisplayBonus", sceneId, missionIndex, selfId )
				EndEvent( )
									
				DispatchEventList( sceneId, selfId, targetId )
			
				return 1
			else
				x006667_NotifyFailTips( sceneId, selfId, "Kh鬾g th� Ho鄋 t nhi甿 v�" )					
				BeginEvent(sceneId)
					AddText(sceneId, "N鄖 c鹡g kh鬾g gi痭g nh� l� ta c  v ph.")
					EndEvent( )
				DispatchEventList( sceneId, selfId, targetId )
				
				return 0
			end
			
		end
		
	end
	
	x006667_NotifyFailTips( sceneId, selfId, "Kh鬾g th� Ho鄋 t nhi甿 v�" )					
	return 0
			
end
