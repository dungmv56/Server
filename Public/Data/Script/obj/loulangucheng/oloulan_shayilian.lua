--L鈛 LanNPC....
--采药大师....

--脚本号
x001114_g_ScriptId = 001114
x001114_g_shoptableindex = 73

--所拥有to� 鸬 事件Id列表
--estudy_caiyao = 713509
--elevelup_caiyao = 713568
--edialog_caiyao = 713608
--所拥有to� 鸬 事件ID列表
x001114_g_eventList={713509,713568,713608}

--**********************************
--事件列表
--**********************************
function x001114_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"#{LLGC_20080324_07}")
		for i, eventId in x001114_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	--商店选项
	AddNumText(sceneId,x001114_g_ScriptId,"Mua c鬾g c�",7,ABILITY_TEACHER_SHOP)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x001114_OnDefaultEvent( sceneId, selfId,targetId )
	x001114_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中m祎 项
--**********************************
function x001114_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x001114_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x001114_g_ScriptId )
		return
		end
	end
		if	GetNumText() == ABILITY_TEACHER_SHOP	then
		DispatchShopItem( sceneId, selfId,targetId, x001114_g_shoptableindex )
	end
end

--**********************************
--Ti猵 th薔PCto� 鸬 任务
--**********************************
function x001114_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001114_g_eventList do
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
function x001114_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后,要Tr� v玁PCto� 鸬 事件列表
	for i, findId in x001114_g_eventList do
		if missionScriptId == findId then
			x001114_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续(已经接了任务)
--**********************************
function x001114_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001114_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完to� 鸬 任务
--**********************************
function x001114_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x001114_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end
