--NPC
--宁令哥
--普通

--**********************************
--事件交互入口
--**********************************
function x021200_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)

--**********************************
--NPC对话
--**********************************
		AddText(sceneId,"Ng呓i nghe n骾 qua  chim c醤h c鴗 gi�  h課h ph鷆 n鄖 truy玭 thuy猼 sao?")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
