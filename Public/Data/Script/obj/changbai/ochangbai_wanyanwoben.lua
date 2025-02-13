--完颜斡本

--脚本号
x022006_g_scriptId = 022006

--所拥有to� 鸬 事件ID列表
x022006_g_eventList={212110}	

--**********************************
--事件列表
--**********************************
function x022006_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	AddText(sceneId,"  Cha v� gia gia c鉯 nhau, sau 痼 cha ra ngo鄆 餴 s錸, m ng鄖 r癷 ta kh鬾g g cha r癷, th l� nh� ng叨i qu�.")
	for i, eventId in x022006_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x022006_OnDefaultEvent( sceneId, selfId,targetId )
	x022006_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中m祎 项
--**********************************
function x022006_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x022006_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--Ti猵 th薔PCto� 鸬 任务
--**********************************
function x022006_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x022006_g_eventList do
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
function x022006_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后,要Tr� v玁PCto� 鸬 事件列表
	for i, findId in x022006_g_eventList do
		if missionScriptId == findId then
			x022006_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续(已经接了任务)
--**********************************
function x022006_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x022006_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完to� 鸬 任务
--**********************************
function x022006_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x022006_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x022006_OnDie( sceneId, selfId, killerId )
end
