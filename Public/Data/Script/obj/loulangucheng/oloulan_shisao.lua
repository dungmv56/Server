--NPC
--石嫂
--配方商品

x001157_g_scriptId = 001157
x001157_g_shoptableindex = 184

x001157_g_SegmentID = 30505706
x001157_g_JewelryID = 30501173
x001157_g_FractionSegmentID = 30501172

--**********************************
--事件交互入口
--**********************************
function x001157_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "  T読 h� t靘 ki猰 kh thi阯 h�, m緄 thu th 疬㧟 nh鎛g lo読 ph痠 ph呓ng n鄖!" )
--**********************************
--NPC对白
--**********************************
		AddNumText( sceneId, x001157_g_scriptId, "Ng呓i mu痭 mua g� n鄌?", 7, 0 )
		--AddNumText( sceneId, x001157_g_scriptId, "#{SJHC_081106_01}", 6, 1 )--打碎神节
		--AddNumText( sceneId, x001157_g_scriptId, "#{SJHC_081106_02}", 6, 2 )--合成神节
		AddNumText( sceneId, x001157_g_scriptId, "H䅟 th鄋h H鄋 Ng鱟", 6, 14 )
		--AddNumText( sceneId, x001157_g_scriptId, "#{SJHC_081106_03}", 11, 16 )--打碎神节帮助
		--AddNumText( sceneId, x001157_g_scriptId, "#{SJHC_081106_04}", 11, 17 )--合成神节帮助
		AddNumText( sceneId, x001157_g_scriptId, "Gi緄 thi畊 h䅟 th鄋h H鄋 Ng鱟", 11, 15 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中m祎 项
--**********************************
function x001157_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 0 then
		DispatchShopItem( sceneId, selfId, targetId, x001157_g_shoptableindex )
	end
	
	--打碎神节界面
	--if GetNumText() == 1 then
		--BeginEvent(sceneId)						
			--AddText(sceneId,"#{SJHC_081106_05}")
			--AddNumText(sceneId, x001157_g_scriptId, "X醕 nh", 8, 3 )
			--AddNumText(sceneId, x001157_g_scriptId, "H鼀 b�", 8, 4 )
		--EndEvent(sceneId)
		--DispatchEventList(sceneId,selfId,targetId)
		--return
	--end
	
	--合成神节界面
	--if GetNumText() == 2 then
		--BeginEvent(sceneId)						
			--AddText(sceneId,"#{SJHC_081106_09}")
			--AddNumText(sceneId, x001157_g_scriptId, "X醕 nh", 8, 5 )
			--AddNumText(sceneId, x001157_g_scriptId, "H鼀 b�", 8, 4 )
		--EndEvent(sceneId)
		--DispatchEventList(sceneId,selfId,targetId)
		--return
	--end
	
	--打碎神节X醕 nh
--	if GetNumText() == 3 then
		--x001157_FractionSegment( sceneId, selfId, targetId )
		--return
	--end
	
	--H鼀 b�
	--if GetNumText() == 4 then
	--	BeginUICommand( sceneId )
		--	UICommand_AddInt( sceneId, targetId )
		--EndUICommand( sceneId )
		--DispatchUICommand( sceneId, selfId, 1000 )
		--return
	--end
	
	--合成神节X醕 nh
	--if GetNumText() == 5 then
		--x001157_ComposeSegment( sceneId, selfId, targetId )
		--return
	--end
	
	if GetNumText() == 15 then
		BeginEvent(sceneId)						
			AddText(sceneId,"#{HY_20080602_001}")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end	
	
	if GetNumText() == 14 then
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 86021935 )
		return
	end
	
	--打碎神节帮助
	--if GetNumText() == 16 then
	--	x001157_NotifyFailBox( sceneId, selfId, targetId, "#{SJHC_081106_15}" )
	--	return
	--end	
	
	--合成神节帮助
	--if GetNumText() == 17 then
		--x001157_NotifyFailBox( sceneId, selfId, targetId, "#{SJHC_081106_16}" )
	--	return
	--end	
	
end

--**********************************
--打碎神节
--**********************************
function x001157_FractionSegment( sceneId, selfId, targetId )
	
	--喧ng否有神节
	if LuaFnGetAvailableItemCount( sceneId, selfId, x001157_g_SegmentID ) <= 0 then
		x001157_NotifyFailBox( sceneId, selfId, targetId, "#{SJHC_081106_06}" )
		return
	end
	
	--喧ng否有天玑珠
	if LuaFnGetAvailableItemCount( sceneId, selfId, x001157_g_JewelryID ) <= 0 then
		x001157_NotifyFailBox( sceneId, selfId, targetId, "#{SJHC_081106_07}" )
		return
	end
	
	--身上� 鹫o c� 疸 馥y甘�
	if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 1 then
		x001157_NotifyFailBox( sceneId, selfId, targetId, "    #{STZDY_20080513_23}" )
		x001157_NotifyFailTips( sceneId, selfId, "#{STZDY_20080513_23}" )
		return
	end
	
	--找m祎 c醝神节to� 鸬 物品链接,可参考city0_building5.lua 606~613
	local SegmentInfo = ""
	local JewelryInfo = ""
	local MaxEquipIndex = LuaFnGetMaterialStartBagPos(sceneId, selfId)
	for i = 0, MaxEquipIndex - 1 do
		if LuaFnGetItemTableIndexByIndex( sceneId, selfId, i ) == x001157_g_SegmentID then
			SegmentInfo = GetBagItemTransfer( sceneId, selfId, i )
			break
		end
	end
	--找m祎 c醝天玑珠to� 鸬 物品链接
	for i = 0, MaxEquipIndex - 1 do
		if LuaFnGetItemTableIndexByIndex( sceneId, selfId, i ) == x001157_g_JewelryID then
			JewelryInfo = GetBagItemTransfer( sceneId, selfId, i )
			break
		end
	end
	
	--扣除物品
	if LuaFnDelAvailableItem( sceneId, selfId, x001157_g_SegmentID, 1 ) ~= 1 or
		LuaFnDelAvailableItem( sceneId, selfId, x001157_g_JewelryID, 1 ) ~= 1 then
		x001157_NotifyFailBox( sceneId, selfId, targetId, "    Kh鬾g th鄋h c鬾g!" )
		return
	end
	
	--给物品
	local FractionSegmentIndex = TryRecieveItem( sceneId, selfId, x001157_g_FractionSegmentID, QUALITY_MUST_BE_CHANGE )
	if FractionSegmentIndex == -1 then
		x001157_NotifyFailBox( sceneId, selfId, targetId, "    #{STZDY_20080513_23}" )
		return
	end
	local FractionSegmentInfo = GetBagItemTransfer( sceneId, selfId, FractionSegmentIndex )
	AuditSegment(sceneId, selfId, 1)
	
	x001157_NotifyFailBox( sceneId, selfId, targetId, "#{SJHC_081106_08}" )
	
	local message = format("#{_INFOUSR%s}#{DSSJ_1}#{_INFOMSG%s}#{DSSJ_2}#{_INFOMSG%s}#{DSSJ_3}#{_INFOMSG%s}#{DSSJ_4}",LuaFnGetName(sceneId, selfId),JewelryInfo,SegmentInfo,FractionSegmentInfo)
	BroadMsgByChatPipe(sceneId, selfId, message, 4);
	
end

--**********************************
--合成神节
--**********************************
function x001157_ComposeSegment( sceneId, selfId, targetId )
	
	--喧ng否有神节碎片
	if LuaFnGetAvailableItemCount( sceneId, selfId, x001157_g_FractionSegmentID ) < 5 then
		x001157_NotifyFailBox( sceneId, selfId, targetId, "#{SJHC_081106_10}" )
		return
	end
	
	--身上� 鹫o c� 疸 馥y甘�
	if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 1 then
		x001157_NotifyFailBox( sceneId, selfId, targetId, "    #{STZDY_20080513_23}" )
		x001157_NotifyFailTips( sceneId, selfId, "#{STZDY_20080513_23}" )
		return
	end
	
	--找m祎 c醝碎片to� 鸬 物品链接,可参考city0_building5.lua 606~613
	local FractionSegmentInfo = ""
	local MaxEquipIndex = LuaFnGetMaterialStartBagPos(sceneId, selfId)
	for i = 0, MaxEquipIndex - 1 do
		if LuaFnGetItemTableIndexByIndex( sceneId, selfId, i ) == x001157_g_FractionSegmentID then
			FractionSegmentInfo = GetBagItemTransfer( sceneId, selfId, i )
			break
		end
	end
	
	--扣除物品
	if LuaFnDelAvailableItem( sceneId, selfId, x001157_g_FractionSegmentID, 5 ) ~= 1 then
		x001157_NotifyFailBox( sceneId, selfId, targetId, "    Kh鬾g th鄋h c鬾g!" )
		return
	end
	
	--给物品
	local BagIndex = TryRecieveItem( sceneId, selfId, x001157_g_SegmentID, QUALITY_MUST_BE_CHANGE )
	if BagIndex == -1 then
		x001157_NotifyFailBox( sceneId, selfId, targetId, "    #{STZDY_20080513_23}" )
		return
	end
	local ItemInfo = GetBagItemTransfer( sceneId, selfId, BagIndex )
	AuditSegment(sceneId, selfId, 2)
	
	x001157_NotifyFailBox( sceneId, selfId, targetId, "#{SJHC_081106_11}" )
	
	local message = format("#{_INFOUSR%s}#{SJHC_081106_12}#{_INFOMSG%s}#{SJHC_081106_13}#{_INFOMSG%s}#{SJHC_081106_14}",LuaFnGetName(sceneId, selfId),FractionSegmentInfo,ItemInfo)
	BroadMsgByChatPipe(sceneId, selfId, message, 4);
	
end

--**********************************
-- 对话窗口信息提示
--**********************************
function x001157_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
-- 屏幕中间信息提示
--**********************************
function x001157_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
