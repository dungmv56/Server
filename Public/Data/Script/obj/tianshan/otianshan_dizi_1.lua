--Thi阯 S絥NPC
--普通弟子
--普通

--**********************************
--事件交互入口
--**********************************
function x017030_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  Trong Linh Th製 Cung ph l緉 l� n� nh鈔, c� nhi玼 c k�. N猽 ng呓i c gi鷓 疝, m秈 皙n tri kh醕h 甬 t� g s絥 m鬾 nh� gi鷓 疝.")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
