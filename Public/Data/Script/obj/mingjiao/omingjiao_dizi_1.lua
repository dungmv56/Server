--Minh Gi醥NPC
--普通弟子
--普通

--**********************************
--事件交互入口
--**********************************
function x011030_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  Quang Minh 痫nh l� c 鸶a, kh鬾g 疬㧟 餴 l読 t鵼 ti畁! n猽 ng呓i c gi鷓 疝, h銀 t緄 g 姓i M鬾 t靘 Tri Kh醕h S� nh� gi鷓 疝.")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
