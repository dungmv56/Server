--恤n Ho鄋g 赵行德

--脚本号
--g_scriptId = 008002

--所拥有to� 鸬 事件ID列表
x008002_g_eventList={}--210801,210802,210803,210804}--212603,212606}	

--**********************************
--事件列表
--**********************************
function x008002_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
--	local IsDone511 = IsMissionHaveDone(sceneId,selfId,511)	
	
	AddText(sceneId,"L鈛 l kh鬾g g, hi畁 t読 h� 疸 thu礳 鹫o qu鈔 ng叨i H醤 c黙 n呔c T鈟 H�")
	for i, eventId in x008002_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x008002_OnDefaultEvent( sceneId, selfId,targetId )
	x008002_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中m祎 项
--**********************************
function x008002_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x008002_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--Ti猵 th薔PCto� 鸬 任务
--**********************************
function x008002_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x008002_g_eventList do
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
function x008002_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后,要Tr� v玁PCto� 鸬 事件列表
	for i, findId in x008002_g_eventList do
		if missionScriptId == findId then
			x008002_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续(已经接了任务)
--**********************************
function x008002_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x008002_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完to� 鸬 任务
--**********************************
function x008002_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x008002_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x008002_OnDie( sceneId, selfId, killerId )
end
