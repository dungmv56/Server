--L誧 D呓ngNPC 药理技能NPC   包含功能: 1药理技能to� 鸬 学习 2讲解药理技能
--白颖明
--普通

--脚本号
x000084_g_ScriptId = 000084

--所拥有to� 鸬 事件Id列表
--estudy_yaoli = 713527
--elevelup_yaoli = 713586
--edialog_yaoli = 713620
--所拥有to� 鸬 事件ID列表
x000084_g_eventList={713527,713586}--,713620}
--**********************************
--事件列表
--**********************************
function x000084_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"  Ng呓i mu痭 h鱟 k� n錸g d唼c l� ch錸g?")
	for i, eventId in x000084_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	AddNumText( sceneId, x000084_g_ScriptId, "Gi緄 thi畊 d唼c l�", 11, 100 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x000084_OnDefaultEvent( sceneId, selfId,targetId )
	x000084_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中m祎 项
--**********************************
function x000084_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 100 then
		BeginEvent( sceneId )
			AddText( sceneId, "#{function_help_008}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end

	for i, findId in x000084_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x000084_g_ScriptId )
		return
		end
	end
end

--**********************************
--Ti猵 th薔PCto� 鸬 任务
--**********************************
function x000084_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000084_g_eventList do
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
function x000084_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后,要Tr� v玁PCto� 鸬 事件列表
	for i, findId in x000084_g_eventList do
		if missionScriptId == findId then
			x000084_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续(已经接了任务)
--**********************************
function x000084_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000084_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完to� 鸬 任务
--**********************************
function x000084_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x000084_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x000084_OnDie( sceneId, selfId, killerId )
end
