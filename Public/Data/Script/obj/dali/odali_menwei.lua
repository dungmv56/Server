--姓i L齆PC
--门卫
--普通

--**********************************
--事件交互入口
--**********************************
function x002022_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  B鋙 v� th鄋h 姓i L� l� ch裞 tr醕h c黙 ta!")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
