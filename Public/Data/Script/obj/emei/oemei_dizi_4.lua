--Nga MyNPC
--普通弟子
--普通

--**********************************
--事件交互入口
--**********************************
function x015033_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"<Ti猲g g醳 ph鴑g ho鄋g vang th tr秈 xanh>")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
