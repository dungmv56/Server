--姓i L齆PC
--初击平
--鉴定符商人

x002077_g_scriptId = 002077
x002077_g_shoptableindex = 10

--**********************************
--事件交互入口
--**********************************
function x002077_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "    B眓 nh鈔 b醤 gi醡 鸶nh ph� m ch� 鸬c gia, c� th� gi醡 鸶nh t c� c醕 lo読 h靚h trang b�, hoan ngh阯h t緄 mua!" )
		AddNumText( sceneId, x002077_g_scriptId, "Ng呓i mu痭 mua g� n鄌?", 7, 0 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中m祎 项
--**********************************
function x002077_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 0 then
		DispatchShopItem( sceneId, selfId, targetId, x002077_g_shoptableindex )
	end
end
