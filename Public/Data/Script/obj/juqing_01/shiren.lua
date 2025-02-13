--万劫谷石敢当

--脚本号
x119003_g_scriptId = 119003

--所拥有to� 鸬 事件ID列表
x119003_g_eventList={200004, 200003}

--**********************************
--事件列表
--**********************************
function x119003_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
		--从3句话中随机选择1句
		local rand = random( 3 )
		if rand == 1  then
			AddText(sceneId,"#{JQ_WJG_Y_003}")
		
		elseif rand == 2   then
			AddText(sceneId,"#{JQ_WJG_Y_004}")
		
		elseif rand == 3   then
			AddText(sceneId,"#{JQ_WJG_Y_005}")
		
		end
	for i, eventId in x119003_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x119003_OnDefaultEvent( sceneId, selfId,targetId )
	x119003_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中m祎 项
--**********************************
function x119003_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x119003_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--Ti猵 th薔PCto� 鸬 任务
--**********************************
function x119003_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x119003_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId, targetId)
			end
			return
		end
	end
end

--**********************************
--拒绝此NPCto� 鸬 任务
--**********************************
function x119003_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后,要Tr� v玁PCto� 鸬 事件列表
	for i, findId in x119003_g_eventList do
		if missionScriptId == findId then
			x119003_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续(已经接了任务)
--**********************************
function x119003_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	
	for i, findId in x119003_g_eventList do
		if 200003 == findId then
			CallScriptFunction( 200003, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完to� 鸬 任务
--**********************************
function x119003_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x119003_g_eventList do
		if 200003 == findId then
			CallScriptFunction( 200003, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x119003_OnDie( sceneId, selfId, killerId )
end
