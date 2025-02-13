-- 891002
-- 高太公 匪寨传送人

--脚本号
x891002_g_scriptId = 891002

--所拥有的事件ID列表
x891002_g_eventList={891000}

--9级宝石
x891002_g_LootItem_1 = {
50901001,50901002,50902005,50902006,50902007,50902008,50903001,50904002,
50911001,50911002,50912005,50912006,50912007,50912008,50913001,50913002,
50913003,50913004,50913005,50913006,50914001,50921001,50921002,50921003,
50921004,
}
--最新宝宝
x891002_g_LootItem_2 = {
30504125,30504126,30504127,30504128,30504094,
}
--神器神节
x891002_g_LootItem_3 = {
30505706,30505706,30505706,
}
--武魂重楼
x891002_g_LootItem_4 = {
10422016,10423024,10433320,10433321,10433322,10433323,
}
--8级宝石
x891002_g_LootItem_5 = {
50801001,50801002,50802005,50802006,50802007,50802008,50803001,50804002,
50811001,50811002,50812005,50812006,50812007,50812008,50813001,50813002,
50813003,50813004,50813005,50813006,50814001,50821001,50821002,50821003,
50821004,
}

--**********************************
--事件列表
--**********************************
function x891002_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"  《生死门》#r╲生死門√商战游戏，刀刀见血，卧薪尝胆，苦尽甘来。彼此既是对方的生门也是死门，生死只在一念之间。")
	AddText(sceneId,"  #G规则：#W进入后杀怪得宝箱，持有宝箱直到生死夺宝结束，即获得生死宝箱，可兑换本服终极物品、宝石和装备。")
	AddText(sceneId,"  #G报名时间：#W每日晚#Y19：45-20：00；#r  #G夺宝时间：#W每日晚#Y20：00-21：00。")
	AddText(sceneId,"  #cFF0000奖励：#W每次兑换至少#Y5个8-9级#W随机顶级宝石,#G人民币宝宝,#Y顶级神器材料,#cFF0000重楼和顶级武魂。")
	
	AddNumText( sceneId, x891002_g_scriptId, "兑换生死宝箱",4 ,1  )
	
	for i, eventId in x891002_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x891002_OnDefaultEvent( sceneId, selfId,targetId )
	x891002_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x891002_OnEventRequest( sceneId, selfId, targetId, eventId )
	
	if GetNumText() == 1  then
		local nStoneId = 39910008
		local nStoneCount = GetItemCount(sceneId, selfId, nStoneId)
		if nStoneCount == 0  then
			BeginEvent(sceneId)
				AddText(sceneId,"#B生死夺宝");
				AddText(sceneId,"  请您携带生死宝盒过来兑换！");
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)		
			return 0
		end

		local ret = DelItem(sceneId, selfId, 39910008, 1)
		if ret > 0   then

	local nItemCount = 2
	local nItemId_1
	local nItemId_2
	local nItemId_3
	local nItemId_4
	local nItemId_5
	local nItemId_6
	local nItemId_7
	local nItemId_8

	nItemId_1 = x891002_g_LootItem_1[random( getn(x891002_g_LootItem_1) )]
	nItemId_2 = x891002_g_LootItem_5[random( getn(x891002_g_LootItem_5) )]
	nItemId_3 = x891002_g_LootItem_5[random( getn(x891002_g_LootItem_5) )]
	nItemId_7 = x891002_g_LootItem_1[random( getn(x891002_g_LootItem_1) )]
	nItemId_8 = x891002_g_LootItem_5[random( getn(x891002_g_LootItem_5) )]


	if random(1000) <= 500  then
		nItemCount = 3
		nItemId_4 = x891002_g_LootItem_2[random( getn(x891002_g_LootItem_2))]
	end

	if random(1000) <= 200  then
		nItemCount = 4
	       nItemId_5 = x891002_g_LootItem_3[random( getn(x891002_g_LootItem_3) )]
	end	
	if random(1000) <= 50  then
		nItemCount = 5
	       nItemId_6 = x891002_g_LootItem_4[random( getn(x891002_g_LootItem_4) )]
	end

	if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 8 then
		x891002_MsgBox( sceneId, selfId, targetId, "    你的背包空间不足8个，无法兑换奖励。")
		return
	end

	if nItemCount == 2  then
		local bagpos01 = TryRecieveItem( sceneId, selfId, nItemId_1, QUALITY_MUST_BE_CHANGE )	-- 放不下就没有了
		local bagpos02 = TryRecieveItem( sceneId, selfId, nItemId_2, QUALITY_MUST_BE_CHANGE )	-- 放不下就没有了
		local bagpos03 = TryRecieveItem( sceneId, selfId, nItemId_3, QUALITY_MUST_BE_CHANGE )	-- 放不下就没有了
		local bagpos07 = TryRecieveItem( sceneId, selfId, nItemId_7, QUALITY_MUST_BE_CHANGE )	-- 放不下就没有了
		local bagpos08 = TryRecieveItem( sceneId, selfId, nItemId_8, QUALITY_MUST_BE_CHANGE )	-- 放不下就没有了

	       local itemInfo1 = GetBagItemTransfer( sceneId, selfId, bagpos01 )
	       local itemInfo2 = GetBagItemTransfer( sceneId, selfId, bagpos02 )
	       local itemInfo3 = GetBagItemTransfer( sceneId, selfId, bagpos03 )
	       local itemInfo7 = GetBagItemTransfer( sceneId, selfId, bagpos07 )
	       local itemInfo8 = GetBagItemTransfer( sceneId, selfId, bagpos08 )

		-- 强制绑定										
		LuaFnItemBind( sceneId, selfId, bagpos01 )
		LuaFnItemBind( sceneId, selfId, bagpos02 )
		LuaFnItemBind( sceneId, selfId, bagpos03 )

		-- 系统公告										
		local playername = GetName(sceneId, selfId)
		local strText = format("#gffff00#{_INFOUSR%s}经过自己千辛万苦夺得的生死宝箱，开出了#Y#{_INFOMSG%s}#W、#e0e8de5#G#{_INFOMSG%s}#W和#e0e8de5#G#{_INFOMSG%s}#W、", playername, itemInfo1, itemInfo2, itemInfo3)										
		local Text = format("#Y#{_INFOMSG%s}#W、#e0e8de5#G#{_INFOMSG%s}各一个.",  itemInfo7, itemInfo8)										
		BroadMsgByChatPipe(sceneId, selfId, strText, 4)
		BroadMsgByChatPipe(sceneId, selfId, Text, 4)
		x891002_NotifyFailBox( sceneId, selfId, targetId, "恭喜您兑换宝盒成功，获得大量奖励，希望您下次继续努力。" )

	elseif nItemCount == 3  then
		local bagpos01 = TryRecieveItem( sceneId, selfId, nItemId_1, QUALITY_MUST_BE_CHANGE )	-- 放不下就没有了
		local bagpos02 = TryRecieveItem( sceneId, selfId, nItemId_2, QUALITY_MUST_BE_CHANGE )	-- 放不下就没有了
		local bagpos03 = TryRecieveItem( sceneId, selfId, nItemId_3, QUALITY_MUST_BE_CHANGE )	-- 放不下就没有了
		local bagpos04 = TryRecieveItem( sceneId, selfId, nItemId_4, QUALITY_MUST_BE_CHANGE )	-- 放不下就没有了
		local bagpos07 = TryRecieveItem( sceneId, selfId, nItemId_7, QUALITY_MUST_BE_CHANGE )	-- 放不下就没有了
		local bagpos08 = TryRecieveItem( sceneId, selfId, nItemId_8, QUALITY_MUST_BE_CHANGE )	-- 放不下就没有了

	       local itemInfo1 = GetBagItemTransfer( sceneId, selfId, bagpos01 )
	       local itemInfo2 = GetBagItemTransfer( sceneId, selfId, bagpos02 )
	       local itemInfo3 = GetBagItemTransfer( sceneId, selfId, bagpos03 )
	       local itemInfo4 = GetBagItemTransfer( sceneId, selfId, bagpos04 )
	       local itemInfo7 = GetBagItemTransfer( sceneId, selfId, bagpos07 )
	       local itemInfo8 = GetBagItemTransfer( sceneId, selfId, bagpos08 )

		-- 强制绑定										
		LuaFnItemBind( sceneId, selfId, bagpos01 )
		LuaFnItemBind( sceneId, selfId, bagpos02 )
		LuaFnItemBind( sceneId, selfId, bagpos03 )

		-- 系统公告										
		local playername = GetName(sceneId, selfId)
		local strText = format("#gffff00刀刀见血，卧薪尝胆，苦尽甘来,生死门中#{_INFOUSR%s}大显神威，力压群雄终于获得了#Y#{_INFOMSG%s}#W、#e0e8de5#G#{_INFOMSG%s}#W、#e0e8de5#G#{_INFOMSG%s}、", playername, itemInfo1, itemInfo2, itemInfo3)										
		local Text = format("#Y#{_INFOMSG%s}#W、#e0e8de5#G#{_INFOMSG%s}和顶级物品#e0e8de5#G#{_INFOMSG%s}各一个.",  itemInfo7, itemInfo8, itemInfo4)										
		BroadMsgByChatPipe(sceneId, selfId, strText, 4)
		BroadMsgByChatPipe(sceneId, selfId, Text, 4)
		x891002_NotifyFailBox( sceneId, selfId, targetId, "恭喜您兑换宝盒成功，获得大量奖励，希望您下次继续努力。" )

	elseif nItemCount == 4  then
		local bagpos01 = TryRecieveItem( sceneId, selfId, nItemId_1, QUALITY_MUST_BE_CHANGE )	-- 放不下就没有了
		local bagpos02 = TryRecieveItem( sceneId, selfId, nItemId_2, QUALITY_MUST_BE_CHANGE )	-- 放不下就没有了
		local bagpos03 = TryRecieveItem( sceneId, selfId, nItemId_3, QUALITY_MUST_BE_CHANGE )	-- 放不下就没有了
		local bagpos04 = TryRecieveItem( sceneId, selfId, nItemId_4, QUALITY_MUST_BE_CHANGE )	-- 放不下就没有了
		local bagpos05 = TryRecieveItem( sceneId, selfId, nItemId_5, QUALITY_MUST_BE_CHANGE )	-- 放不下就没有了
		local bagpos07 = TryRecieveItem( sceneId, selfId, nItemId_7, QUALITY_MUST_BE_CHANGE )	-- 放不下就没有了
		local bagpos08 = TryRecieveItem( sceneId, selfId, nItemId_8, QUALITY_MUST_BE_CHANGE )	-- 放不下就没有了

	       local itemInfo1 = GetBagItemTransfer( sceneId, selfId, bagpos01 )
	       local itemInfo2 = GetBagItemTransfer( sceneId, selfId, bagpos02 )
	       local itemInfo3 = GetBagItemTransfer( sceneId, selfId, bagpos03 )
	       local itemInfo4 = GetBagItemTransfer( sceneId, selfId, bagpos04 )
	       local itemInfo5 = GetBagItemTransfer( sceneId, selfId, bagpos05 )
	       local itemInfo7 = GetBagItemTransfer( sceneId, selfId, bagpos07 )
	       local itemInfo8 = GetBagItemTransfer( sceneId, selfId, bagpos08 )

		-- 强制绑定										
		LuaFnItemBind( sceneId, selfId, bagpos01 )
		LuaFnItemBind( sceneId, selfId, bagpos02 )
		LuaFnItemBind( sceneId, selfId, bagpos03 )

		-- 系统公告										
		local playername = GetName(sceneId, selfId)
		local strText = format("#gffff00天空嗡嗡作声，震声未绝，生死门中剑光霍霍，只见#{_INFOUSR%s}大喊一声，得，在生死宝箱中滚出了#Y#{_INFOMSG%s}#W、#e0e8de5#G#{_INFOMSG%s}#W、#e0e8de5#G#{_INFOMSG%s}、", playername, itemInfo1, itemInfo2, itemInfo3)										
		local Text = format("#Y#{_INFOMSG%s}#W、#e0e8de5#G#{_INFOMSG%s}各一个和#{_INFOMSG%s}和令人羡慕的#{_INFOMSG%s}.",  itemInfo7, itemInfo8, itemInfo4, itemInfo5)										
		BroadMsgByChatPipe(sceneId, selfId, strText, 4)
		BroadMsgByChatPipe(sceneId, selfId, Text, 4)
		x891002_NotifyFailBox( sceneId, selfId, targetId, "恭喜您兑换宝盒成功，获得大量奖励，希望您下次继续努力。" )

	elseif nItemCount == 5  then
		local bagpos01 = TryRecieveItem( sceneId, selfId, nItemId_1, QUALITY_MUST_BE_CHANGE )	-- 放不下就没有了
		local bagpos02 = TryRecieveItem( sceneId, selfId, nItemId_2, QUALITY_MUST_BE_CHANGE )	-- 放不下就没有了
		local bagpos03 = TryRecieveItem( sceneId, selfId, nItemId_3, QUALITY_MUST_BE_CHANGE )	-- 放不下就没有了
		local bagpos04 = TryRecieveItem( sceneId, selfId, nItemId_4, QUALITY_MUST_BE_CHANGE )	-- 放不下就没有了
		local bagpos05 = TryRecieveItem( sceneId, selfId, nItemId_5, QUALITY_MUST_BE_CHANGE )	-- 放不下就没有了
		local bagpos06 = TryRecieveItem( sceneId, selfId, nItemId_6, QUALITY_MUST_BE_CHANGE )	-- 放不下就没有了
		local bagpos07 = TryRecieveItem( sceneId, selfId, nItemId_7, QUALITY_MUST_BE_CHANGE )	-- 放不下就没有了
		local bagpos08 = TryRecieveItem( sceneId, selfId, nItemId_8, QUALITY_MUST_BE_CHANGE )	-- 放不下就没有了

	       local itemInfo1 = GetBagItemTransfer( sceneId, selfId, bagpos01 )
	       local itemInfo2 = GetBagItemTransfer( sceneId, selfId, bagpos02 )
	       local itemInfo3 = GetBagItemTransfer( sceneId, selfId, bagpos03 )
	       local itemInfo4 = GetBagItemTransfer( sceneId, selfId, bagpos04 )
	       local itemInfo5 = GetBagItemTransfer( sceneId, selfId, bagpos05 )
	       local itemInfo6 = GetBagItemTransfer( sceneId, selfId, bagpos06 )
	       local itemInfo7 = GetBagItemTransfer( sceneId, selfId, bagpos07 )
	       local itemInfo8 = GetBagItemTransfer( sceneId, selfId, bagpos08 )

		-- 强制绑定										
		LuaFnItemBind( sceneId, selfId, bagpos01 )
		LuaFnItemBind( sceneId, selfId, bagpos02 )
		LuaFnItemBind( sceneId, selfId, bagpos03 )

		-- 系统公告										
		local playername = GetName(sceneId, selfId)
		local strText = format("#gffff00#{_INFOUSR%s}生死门中人品爆发，竟然获得了#Y#{_INFOMSG%s}#W、#e0e8de5#G#{_INFOMSG%s}#W、#e0e8de5#G#{_INFOMSG%s}#W。", playername, itemInfo1, itemInfo2, itemInfo3)										
		local Text = format("#Y#{_INFOMSG%s}#W、#e0e8de5#G#{_INFOMSG%s}、#e0e8de5#G#{_INFOMSG%s}、#e0e8de5#W#{_INFOMSG%s}}、#e0e8de5#Y#{_INFOMSG%s}，大家一起祝贺他吧.",  itemInfo7, itemInfo8, itemInfo4, itemInfo5, itemInfo6)										
		BroadMsgByChatPipe(sceneId, selfId, strText, 4)
		BroadMsgByChatPipe(sceneId, selfId, Text, 4)
		x891002_NotifyFailBox( sceneId, selfId, targetId, "恭喜您兑换宝盒成功，获得大量奖励，希望您下次继续努力。" )

	end
		end

		return
	end

	for i, findId in x891002_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x891002_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x891002_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			end
			return
		end
	end
end

--**********************************
--拒绝此NPC的任务
--**********************************
function x891002_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x891002_g_eventList do
		if missionScriptId == findId then
			x891002_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x891002_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x891002_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x891002_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x891002_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x891002_OnDie( sceneId, selfId, killerId )
end

--**********************************
-- 对话窗口信息提示
--**********************************
function x891002_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
