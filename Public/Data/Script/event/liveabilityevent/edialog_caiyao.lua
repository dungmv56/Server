--对话事件 npc白颖明

--脚本号
x713608_g_ScriptId = 713608

--**********************************
--任务入口函数
--**********************************
function x713608_OnDefaultEvent( sceneId, selfId, targetId)
	dialog = "#{event_liveabilityevent_0008}"
		BeginEvent(sceneId)
		AddText(sceneId, dialog)
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
end

--**********************************
--列举事件
--**********************************
function x713608_OnEnumerate( sceneId, selfId, targetId )
		AddNumText(sceneId,x713608_g_ScriptId,"T靘 hi瑄 h醝 d唼c",11,-1)
end

--**********************************
--检测Ti猵 th跫�
--**********************************
function x713608_CheckAccept( sceneId, selfId )
end

--**********************************
--Ti猵 th�
--**********************************
function x713608_OnAccept( sceneId, selfId, AbilityId )
end
