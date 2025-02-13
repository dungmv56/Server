--完颜斡离不

--脚本号
x022005_g_scriptId = 022005

--所拥有to� 鸬 事件ID列表
x022005_g_eventList={212110}--211303	

--**********************************
--事件列表
--**********************************
function x022005_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	AddText(sceneId,"  B畁h c黙 th鷆 th鷆 l� do ng叨i H痶 Th誧h Li畉 h読, ta nh 鸶nh ph鋓 ti陁 di畉 ng叨i H痶 Th誧h Li畉, tr� th� cho th鷆 th鷆!")
	for i, eventId in x022005_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x022005_OnDefaultEvent( sceneId, selfId,targetId )
	x022005_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中m祎 项
--**********************************
function x022005_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x022005_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--Ti猵 th薔PCto� 鸬 任务
--**********************************
function x022005_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x022005_g_eventList do
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
function x022005_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后,要Tr� v玁PCto� 鸬 事件列表
	for i, findId in x022005_g_eventList do
		if missionScriptId == findId then
			x022005_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续(已经接了任务)
--**********************************
function x022005_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x022005_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完to� 鸬 任务
--**********************************
function x022005_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x022005_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x022005_OnDie( sceneId, selfId, killerId )
end
