--梅岭NPC
--太阳花
--普通

--**********************************
--事件交互入口
--**********************************
function x033002_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  朽n 鬾g? Trong b� t礳 S絥 Vi畉 ta 疣n 鬾g ch� l� n� b礳, sinh ra 疸 ch� c� th� l鄊 h� ph醦, ch竨 sai khi猲 c黙 n� t� t� b鱪 ta. Phong t鴆 n鄖 c� t� ng鄋 n錷 tr呔c, l� � c黙 th linh, kh鬾g 疬㧟 ch痭g l読!")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
