--玉溪NPC
--阿诗玛
--普通

--**********************************
--事件交互入口
--**********************************
function x027005_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  L� ng呓i c製 ta? A H, A H ca � 疴u?")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
