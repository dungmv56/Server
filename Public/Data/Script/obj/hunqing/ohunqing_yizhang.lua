--婚庆副本NPC
--普通

--**********************************
--事件交互入口
--**********************************
function x155007_OnDefaultEvent(sceneId, selfId,targetId)
	BeginEvent(sceneId);
		AddText(sceneId,"Cung h� hai v� t鈔 lang t鈔 n呓ng, trai t鄆 g醝 s, h課h ph鷆 皙n b誧 馥u");
	EndEvent(sceneId);
	DispatchEventList(sceneId,selfId,targetId);
end

