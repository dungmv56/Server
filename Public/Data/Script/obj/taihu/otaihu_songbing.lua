--姓i L齆PC
--天仙 mu礽 mu礽
--普通

--**********************************
--事件交互入口
--**********************************
function x004008_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  Kh鬾g bi猼 ch鷑g ta c騨 ch� g� n鎍? Mau k猼 th鷆 vi甤 � 疴y, 餴 ra Ng鱟 M鬾 Quan chi vi畁 cho D呓ng T呔ng qu鈔.")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
