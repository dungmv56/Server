--毒障泽地NPC
--任道清
--普通

x050112_g_ScriptId	= 050112

--操作集
x050112_g_Key				=
{
		["zhu"]					= 100,	--我想删除所有to� 鸬 任务
		["itm"]					= 101,	--我想删除任务道具
		["do"]					= 102,	--确认删除所有to� 鸬 任务
}

-- C T読 删除所有任务to� 鸬 时候,同时删除to� 鸬 任务物品to� 鸬 列表
x050112_g_MisItemList = {	40004000,40004451,40004452,40004461,
		40004453,40004456,40004459,40004458,40004455,40004457,30505062,											
}

x050112_g_YinMoZhuList = {	40004455,40004456,40004457,40004458,40004459											
}

--******************************************************
--事件交互入口
--******************************************************
function x050112_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "  Ta c� th� gi鷓 c醕 v� anh h鵱g hu� b� nhi甿 v� 鹫o c� d� th譨. N猽 nhi甿 v� 鹫o c� l鄊 cho ng呓i c鋗 th bu皀 phi玭, h銀 皙n t靘 ta!" )
		AddNumText( sceneId, x050112_g_ScriptId, "Ta mu痭 hu� b� D鏽 Ma ch鈛", 6, x050112_g_Key["zhu"] )
		AddNumText( sceneId, x050112_g_ScriptId, "Ta mu痭 hu� b� nhi甿 v� 鹫o c�", 6, x050112_g_Key["itm"] )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中m祎 项
--**********************************
function x050112_OnEventRequest( sceneId, selfId, targetId, eventId )
	
	local	key	= GetNumText()

	if key == x050112_g_Key["zhu"]	then
		local iHave = 0;
		for i, nItemId in x050112_g_YinMoZhuList do
			--  鹫t 疬㧟C醝 n鄖 物品to� 鸬 数量
			local nItemCount = GetItemCount(sceneId, selfId, nItemId)
			
			if nItemCount > 0  then
				iHave = 1
			end
		end
		
		if (iHave == 0) then
			BeginEvent( sceneId )
				AddText( sceneId, "  Kh鬾g th� hu� b� D鏽 Ma ch鈛!" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
		else
			BeginEvent( sceneId )
				AddText( sceneId, "  C醕 h� c� mu痭 hu� b� D鏽 Ma Ch鈛?" )
				AddNumText( sceneId, x050112_g_ScriptId, "X醕 nh", 6, x050112_g_Key["do"] )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
		end
	elseif key == x050112_g_Key["itm"]	then
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 42 )

	elseif key == x050112_g_Key["do"]	then
		for i, nItemId in x050112_g_YinMoZhuList do
			--  鹫t 疬㧟C醝 n鄖 物品to� 鸬 数量
			local nItemCount = GetItemCount(sceneId, selfId, nItemId)
			
			if nItemCount > 0  then
				DelItem(sceneId, selfId, nItemId, nItemCount)
			end
		end
		BeginEvent( sceneId )
		AddText( sceneId, "  Hu� b� D鏽 Ma ch鈛 th鄋h c鬾g!" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end
end

--******************************************************
--销毁任务物品
--由Client\Interface\MissionObjDel\MissionObjDel.lua发出
--******************************************************
function x050112_OnDestroy( sceneId, selfId, posItem )
	if posItem < 0 then
		return
	end

	EraseItem( sceneId, selfId, posItem )
end
