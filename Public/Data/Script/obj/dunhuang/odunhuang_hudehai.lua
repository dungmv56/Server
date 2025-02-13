--恤n Ho鄋g 胡德海

--脚本号
--g_scriptId = 008013

--所拥有to� 鸬 事件ID列表
x008013_g_eventList={}--210808} --212603,212606,210807

--**********************************
--事件列表
--**********************************
function x008013_UpdateEventList( sceneId, selfId,targetId )
    BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
    AddText(sceneId,"  凶ng ph� l秈 v� 韈h v緄 t読 h�, ch錷 ch� ho鄋 th鄋h vi甤 th� luy畁 c黙 c醕 h� 餴.")

	for i, eventId in x008013_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x008013_OnDefaultEvent( sceneId, selfId,targetId )
	x008013_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中m祎 项
--**********************************
function x008013_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x008013_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--Ti猵 th薔PCto� 鸬 任务
--**********************************
function x008013_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x008013_g_eventList do
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
function x008013_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后,要Tr� v玁PCto� 鸬 事件列表
	for i, findId in x008013_g_eventList do
		if missionScriptId == findId then
			x008013_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续(已经接了任务)
--**********************************
function x008013_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x008013_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完to� 鸬 任务
--**********************************
function x008013_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x008013_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x008013_OnDie( sceneId, selfId, killerId )
end
