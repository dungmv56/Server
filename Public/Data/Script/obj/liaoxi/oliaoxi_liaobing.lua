--Linh西NPC
--村民
--普通

--**********************************
--事件交互入口
--**********************************
function x021006_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  姓i Li陁 ta t trung r nhi玼 l馽 l唼ng tinh nhu�, t錸g th阭 醦 l馽 � Nh課 M鬾 Quan; Li陁 T鈟 ch� c騨 nh鎛g b鱪 gi� y猽 nh� b鱪 ta, 裯g ph� v緄 b鱪 m� ph� nh� th long  hi畁 th 馥u ch苙g th 饀鬷.")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
