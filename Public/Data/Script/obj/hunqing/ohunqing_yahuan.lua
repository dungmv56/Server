--婚庆副本NPC
--普通

--**********************************
--事件交互入口
--**********************************
function x155002_OnDefaultEvent(sceneId, selfId,targetId)
	BeginEvent(sceneId);
		AddText(sceneId,"Cung h� hai v� t鈔 lang v� t鈔 n呓ng, B醕h ni阯 h鋙 h䅟, t鋙 稹c qu� t�!");
	EndEvent(sceneId);
	DispatchEventList(sceneId,selfId,targetId);
end

