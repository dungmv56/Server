--姓i L齆PC
--狄成
--普通

--**********************************
--事件交互入口
--**********************************
function x004005_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  Sao l quan qu鈔 t緄 th� nh�, ta kh鬾g d醡 ra c呔p 鸢 n鎍.")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
