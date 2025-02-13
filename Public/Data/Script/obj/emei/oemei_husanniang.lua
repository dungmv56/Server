--Nga MyNPC  
--扈三娘
--普通

--脚本号
x015006_g_ScriptId = 015006

--所拥有to� 鸬 事件
estudy_lingxinshu = 713535
elevelup_lingxinshu = 713594
edialog_lingxinshu = 713611
--所拥有to� 鸬 事件ID列表
x015006_g_eventList={estudy_lingxinshu,elevelup_lingxinshu}	
--MessageNum = 1		--MessageNum喧ng对话编号,用于调用不同对话
--**********************************
--事件列表
--**********************************
function x015006_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"K� n錸g c黙 ta ch� d誽 甬 t� b眓 ph醝")
	for i, eventId in x015006_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	AddNumText( sceneId, x015006_g_ScriptId, "Gi緄 thi畊 Linh T鈓 Thu", 11, 100 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x015006_OnDefaultEvent( sceneId, selfId,targetId )
	x015006_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中m祎 项
--**********************************
function x015006_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 100 then
		BeginEvent( sceneId )
			AddText( sceneId, "#{function_help_034}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end

	for i, findId in x015006_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x015006_g_ScriptId )
			return
		end
	end
end

--**********************************
--Ti猵 th薔PCto� 鸬 任务
--**********************************
function x015006_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x015006_g_eventList do
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
function x015006_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后,要Tr� v玁PCto� 鸬 事件列表
	for i, findId in x015006_g_eventList do
		if missionScriptId == findId then
			x015006_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续(已经接了任务)
--**********************************
function x015006_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x015006_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完to� 鸬 任务
--**********************************
function x015006_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x015006_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x015006_OnDie( sceneId, selfId, killerId )
end
