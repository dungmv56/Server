--琼州NPC
--岳老三
--普通

--**********************************
--事件交互入口
--**********************************
function x035004_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  G 疴y c� b醝 m祎 v� s� ph� m緄 � 姓i L�, b鋘 l鉵h kh鬾g h� b靚h th叨ng. Kh鬾g n骾 疴u kh醕, ch� m祎 tuy畉 k� \"L錸g Ba Vi B礬" c黙 s� ph� th鬷, ch th� gian n鄖 kh鬾g c� k� th� 2. #r#rL n鄖 v� Qu蟦h Ch鈛, ch� y猽 l� 皙n 痼n phu nh鈔 ta.")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
