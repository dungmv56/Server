--黄龙NPC
--宇文苏
--普通

--**********************************
--事件交互入口
--**********************************
function x023002_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  A V錸 g 疴y ch苙g hi瑄 sao, kh鬾g 錸 kh鬾g ng�, su痶 ng鄖 ng� ng� ng ng..")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
