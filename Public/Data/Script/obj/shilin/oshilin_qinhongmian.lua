--石林 秦红棉

--脚本号
x026001_g_scriptId = 026001

--所拥有to� 鸬 事件ID列表
x026001_g_eventList={}--211703,211706	

--**********************************
--事件列表
--**********************************
function x026001_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId, "    Ng呓i 皙n t� 姓i L� sao $N? V ch ng呓i 疸 g 衞鄋 lang ? 衞鄋 lang? 衞鄋 lang ng呓i kh鬾g bi猼 sao? Ch韓h l� Tr Nam V呓ng 衞鄋 Ch韓h Thu c黙 姓i L�! H�, h 疳ng ch閙 ngh靚 餫o. 玄i 皙n khi ta g ph鋓... s� cho h bi猼 tay.")	
		for i, eventId in x026001_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x026001_OnDefaultEvent( sceneId, selfId,targetId )
	x026001_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中m祎 项
--**********************************
function x026001_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x026001_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--Ti猵 th薔PCto� 鸬 任务
--**********************************
function x026001_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x026001_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId, targetId )
			end
			return
		end
	end
end

--**********************************
--拒绝此NPCto� 鸬 任务
--**********************************
function x026001_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后,要Tr� v玁PCto� 鸬 事件列表
	for i, findId in x026001_g_eventList do
		if missionScriptId == findId then
			x026001_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续(已经接了任务)
--**********************************
function x026001_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x026001_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完to� 鸬 任务
--**********************************
function x026001_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x026001_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x026001_OnDie( sceneId, selfId, killerId )
end
