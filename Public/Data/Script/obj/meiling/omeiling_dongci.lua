--梅岭NPC
--冬刺
--普通

--**********************************
--事件交互入口
--**********************************
function x033005_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  Ta th d鵱g ph son c黙 Th ti阯 sinh c鹡g 皓p l, th阭 m祎 ch鷗 m� h皀g c鄋g 皓p. �, l鬾g mi c鹡g ph鋓 s豠 m祎 ch鷗.")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
