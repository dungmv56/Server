--琼州NPC
--悠悠
--普通

--**********************************
--事件交互入口
--**********************************
function x035001_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  Hu hu... � 疴y nhi玼 c� s qu�, ch苙g l� T� Kh鈓 ca ca ng鄖 ng鄖 s痭g trong t靚h c鋘h th� n鄖 sao?")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--死亡事件
--**********************************
function x035001_OnDie( sceneId, selfId, killerId )
end
