--Minh Gi醥NPC
--普通弟子
--普通

--**********************************
--事件交互入口
--**********************************
function x011032_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"Ta l� 甬 t� Minh Gi醥.")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
