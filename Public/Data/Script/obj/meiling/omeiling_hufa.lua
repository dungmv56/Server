--梅岭NPC
--护法
--普通

--**********************************
--事件交互入口
--**********************************
function x033008_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  斜i 鸲i r癷! 斜i 鸲i r癷! Ch鷑g ta s l鄊 ch� r癷!")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
