--塔里木NPC
--兰德
--**********************************
--事件交互入口
--**********************************
function x044507_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)

--**********************************
--NPC对话
--**********************************
		AddText(sceneId,"Th鄋h th� L鈛 Lan c� v鄆 vi阯 ng鱟 trai trong xa m誧, nh遪g ng鄖 ng鄖 c醫 t錸g d v鵬 l kh鬾g bi猼 n絠 n鄌...")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
