--琼州NPC
--帮众
--普通

--**********************************
--事件交互入口
--**********************************
function x035005_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  Bang ch� ch鷑g ta v� c鬾g c醝 th�, thi阯 h� v� 鸶ch, v錸 th鄋h v� 鹧c!")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
