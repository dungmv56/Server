--副本测试NPC, make by Jack

--脚本号
x805000_g_scriptId = 805000

--所拥有的事件ID列表
x805000_g_eventList={805001,805002,805003,805004,805005}

--**********************************
--事件列表
--**********************************
function x805000_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	AddText(sceneId,"Ta l� NPC ph� c豠 ra v鄌 n鄖, c醕 h� c� vi甤 g� kh鬾g?");
	for i, eventId in x805000_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x805000_OnDefaultEvent( sceneId, selfId,targetId )
	x805000_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x805000_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x805000_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x805000_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x805000_g_eventList do
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
--拒绝此NPC的任务
--**********************************
function x805000_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x805000_g_eventList do
		if missionScriptId == findId then
			x805000_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x805000_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x805000_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x805000_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x805000_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x805000_OnDie( sceneId, selfId, killerId )
end
