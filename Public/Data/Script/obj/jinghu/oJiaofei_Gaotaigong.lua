-- 005114
-- 高太公 匪寨传送人

--脚本号
x005114_g_scriptId = 005114

--所拥有to� 鸬 事件ID列表
x005114_g_eventList={}

--**********************************
--事件列表
--**********************************
function x005114_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"  Ta l� ng叨i ch� ngh頰 h騛 b靚h.")
	
	AddNumText( sceneId, x005114_g_scriptId, "羞a ta 皙n K韓h H�",9 ,1  )
	
	for i, eventId in x005114_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x005114_OnDefaultEvent( sceneId, selfId,targetId )
	x005114_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中m祎 项
--**********************************
function x005114_OnEventRequest( sceneId, selfId, targetId, eventId )
	
	if GetNumText() == 1  then
		NewWorld( sceneId, selfId, 5, 200, 52)
		return
	end

	for i, findId in x005114_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--Ti猵 th薔PCto� 鸬 任务
--**********************************
function x005114_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x005114_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			end
			return
		end
	end
end

--**********************************
--拒绝此NPCto� 鸬 任务
--**********************************
function x005114_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后,要Tr� v玁PCto� 鸬 事件列表
	for i, findId in x005114_g_eventList do
		if missionScriptId == findId then
			x005114_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续(已经接了任务)
--**********************************
function x005114_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x005114_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完to� 鸬 任务
--**********************************
function x005114_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x005114_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x005114_OnDie( sceneId, selfId, killerId )
end

