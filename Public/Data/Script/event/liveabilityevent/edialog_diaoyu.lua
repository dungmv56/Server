--对话事件 

--脚本号
x713609_g_ScriptId = 713609

--**********************************
--任务入口函数
--**********************************
function x713609_OnDefaultEvent( sceneId, selfId, targetId )
	dialog = "#{event_liveabilityevent_0009}"
		BeginEvent(sceneId)
		AddText(sceneId, dialog)
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
end

--**********************************
--列举事件
--**********************************
function x713609_OnEnumerate( sceneId, selfId, targetId )
		AddNumText(sceneId,x713609_g_ScriptId,"T靘 hi瑄 c鈛 c�",11,-1)
end

--**********************************
--检测Ti猵 th跫�
--**********************************
function x713609_CheckAccept( sceneId, selfId )
end

--**********************************
--Ti猵 th�
--**********************************
function x713609_OnAccept( sceneId, selfId, AbilityId )
end
