--对话事件 npc白颖明

--脚本号
x713606_g_ScriptId = 713606

--**********************************
--任务入口函数
--**********************************
function x713606_OnDefaultEvent( sceneId, selfId, targetId )
	dialog = "#{event_liveabilityevent_0006}"
		BeginEvent(sceneId)
		AddText(sceneId, dialog)
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
end

--**********************************
--列举事件
--**********************************
function x713606_OnEnumerate( sceneId, selfId, targetId )
		AddNumText(sceneId,x713606_g_ScriptId,"T靘 hi瑄 c鬾g ngh�",11,-1)
end

--**********************************
--检测Ti猵 th跫�
--**********************************
function x713606_CheckAccept( sceneId, selfId )
end

--**********************************
--Ti猵 th�
--**********************************
function x713606_OnAccept( sceneId, selfId, AbilityId )
end
