--NPC
--袁平
--普通

--**********************************
--事件交互入口
--**********************************
function x021202_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)

--**********************************
--NPC对话
--**********************************
		AddText(sceneId,"Ng呓i g qua b� phong � kh痠 b錸g l�  c� nh鈔 sao? Th mu痭 bi猼 h l� nh� th� n鄌 皙n......")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
