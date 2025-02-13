--热卖元宝 NPC
--注意本脚本含有随身元宝相关功能,请m祎 定参照现有to� 鸬 例子进行修改.

x181002_g_scriptId 	= 181002
x181002_g_buyrate 	= 0.5

x181002_g_shoptableindex=151
x181002_g_goodact		= 1		--热卖元宝商店
x181002_g_YuanBaoIntro	= 18	--元宝介绍

--**********************************
--事件交互入口
--**********************************
function x181002_OnDefaultEvent( sceneId, selfId, targetId )
	if targetId == -1 then
		x181002_OnEventRequest( sceneId, selfId, targetId, nil )
	else
		BeginEvent( sceneId )
			strText = "    歇n 疴y m� xem, th呓ng ph b醤 ch誽 nh, gi� r� nh. Kh醕h quan, ng鄆 mau ch鱪 v鄆 m髇 餴, b鋙 痄m ng鄆 mua v� xong 痍m nay n m� c鹡g ph鋓 c叨i "
			AddText( sceneId, strText )
			--AddNumText( sceneId, x181002_g_scriptId, "Mua nhi畉 m読 th呓ng ph", 5, x181002_g_goodact)
			AddNumText( sceneId, x181002_g_scriptId, "Gi緄 thi畊 Kim Nguy阯 B鋙", 11, x181002_g_YuanBaoIntro)
			if targetId < 0 then
				targetId = -1	--为了能正常弹出选项
			end
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
end

--**********************************
--事件列表选中m祎 项
--**********************************
function x181002_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == x181002_g_goodact then
		x181002_NewDispatchShopItem( sceneId, selfId,targetId, x181002_g_shoptableindex )
	elseif GetNumText() == x181002_g_YuanBaoIntro	then
		BeginEvent( sceneId )
			AddText( sceneId, "#{INTRO_YUANBAO}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
end

--**********************************
--按需来弹出商店,分为随身商店和NPC商店
--**********************************
function x181002_NewDispatchShopItem(sceneId,selfId,targetId,shopId)
	if targetId >= 0 then
		DispatchShopItem( sceneId, selfId,targetId, shopId )
	else
		DispatchNoNpcShopItem( sceneId, selfId, shopId )
	end
end
