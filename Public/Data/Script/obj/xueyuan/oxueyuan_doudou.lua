--NPC
--豆豆
--普通

--**********************************
--事件交互入口
--**********************************
function x021203_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)

--**********************************
--NPC对话
--**********************************
		AddText(sceneId,"Ng呓i l� t緄 t靘 ta  sao? B醕 l誴 c鵱g vi阯 b靚h n骾 ta kh鬾g ph鋓 chim c醤h c鴗......")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
