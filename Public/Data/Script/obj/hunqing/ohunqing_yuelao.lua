--婚庆副本NPC
--普通

--**********************************
--事件交互入口
--**********************************
function x155001_OnDefaultEvent(sceneId, selfId,targetId)
	BeginEvent(sceneId);
		AddText(sceneId,"N猽 c醕 h� c� � trung nh鈔, c� th� c鵱g 皙n t靘 ta, ta c� th� gi鷓 c醕 h� ch� tr� h鬾 s�.");
	EndEvent(sceneId);
	DispatchEventList(sceneId,selfId,targetId);
end

