--Tinh T鷆NPC
--普通弟子
--普通

--**********************************
--事件交互入口
--**********************************
function x016030_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  Mu痭 b靚h an ra v鄌 Tinh T鷆 H鋓, kh鬾g c� ch鷗 l緉 gan th� kh鬾g 疬㧟. N猽 ng呓i nh醫 gan c s� gi鷓 疝, h銀 t靘 Tri kh醕h 甬 t� g 姓i m鬾 gi鷓 疝.")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
