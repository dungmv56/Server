--L誧 D呓ngNPC
--崔宗之
--普通

x000055_g_shoptableindex=8

x000055_g_scriptId=000055

--**********************************
--事件交互入口
--**********************************
function x000055_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  M鱥 ng叨i n骾 t鬷 u痭g say r癷 d醤g v� nh� c鈟 ng鱟 tr呔c gi�, ch苙g bi猼 瘊ng c鹡g kh鬾g 瘊ng")
		AddNumText(sceneId,x000055_g_scriptId,"Mua th竧",7,0)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件列表选中m祎 项
--**********************************
function x000055_OnEventRequest( sceneId, selfId, targetId, eventId )
	DispatchShopItem( sceneId, selfId,targetId, x000055_g_shoptableindex )
end
