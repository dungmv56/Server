--Nga MyNPC
--小茗
--普通

--**********************************
--事件交互入口
--**********************************
function x015004_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  Ch叻ng m鬾 t� t� sau khi t� T� Ch鈛 v�, m ng鄖 li玭 kh鬾g thi猼 錸 u痭g, h靚h nh� c� nhi玼 chuy畁 t鈓 t�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
