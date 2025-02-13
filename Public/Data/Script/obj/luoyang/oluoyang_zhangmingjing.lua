--L誧 D呓ngNPC		制药npc		1学习制药技能		2中医技能� 餴琺�
--张明景
--普通

--脚本号
x000108_g_ScriptId = 000108

--所拥有to� 鸬 事件Id列表
--estudy_zhiyao = 713503
--elevelup_zhiyao = 713562
--edialog_zhiyao = 713602
--所拥有to� 鸬 事件ID列表
x000108_g_eventList={713503,713562,250502}--,713602
--**********************************
--事件列表
--**********************************
function x000108_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  Mu痭 h鱟 t v� n鈔g cao k� n錸g ch� d唼c th� ph鋓 ch錷 t緄 疴y m� xem, mu痭 s痭g 疬㧟 trong giang h� th� kh鬾g th� thi猽 m祎 s� ph呓ng thu痗 t痶")
		AddText(sceneId,"  B v鄌 h鱟 ch� d唼c, c醕 h� c� th� t� l鄊 m祎 s� thu痗 d鵱g khi c k韕, h銀 th� nhi玼 l, c醕 h� s� ph醫 hi畁 ra c鄋g nhi玼 ph呓ng ph醦 ch� 餫n d唼c")
		for i, eventId in x000108_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
		AddNumText( sceneId, x000108_g_ScriptId, "Gi緄 thi畊 b鄌 ch� d唼c", 11, 100 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x000108_OnDefaultEvent( sceneId, selfId,targetId )
	x000108_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中m祎 项
--**********************************
function x000108_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 100 then
		BeginEvent( sceneId )
			AddText( sceneId, "#{function_help_007}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end

	for i, findId in x000108_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x000108_g_ScriptId )
		return
	end
end
end

--**********************************
--Ti猵 th薔PCto� 鸬 任务
--**********************************
function x000108_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000108_g_eventList do
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
function x000108_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后,要Tr� v玁PCto� 鸬 事件列表
	for i, findId in x000108_g_eventList do
		if missionScriptId == findId then
			x000108_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续(已经接了任务)
--**********************************
function x000108_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000108_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完to� 鸬 任务
--**********************************
function x000108_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x000108_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x000108_OnDie( sceneId, selfId, killerId )
end
