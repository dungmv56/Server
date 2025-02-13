--L誧 D呓ngNPC		缝纫npc		1学习缝纫技能		2中医技能� 餴琺�
--符敏之
--生活技能npc

--脚本号
x000067_g_ScriptId = 000067

--商店编号
x000067_g_shoptableindex=65

--所拥有to� 鸬 事件Id列表
--estudy_fengren = 713506
--elevelup_fengren = 713565
--edialog_fengren = 713605
--所拥有to� 鸬 事件ID列表
x000067_g_eventList={713506,713565}--,713605}
--**********************************
--事件列表
--**********************************
function x000067_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"#{OBJ_luoyang_0020}")
	for i, eventId in x000067_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	--商店选项
	AddNumText(sceneId,x000067_g_ScriptId,"Mua h靚h m鐄",7,ABILITY_TEACHER_SHOP)
	AddNumText(sceneId,x000067_g_ScriptId,"#{INTERFACE_XML_1195}",7,12)      
	AddNumText( sceneId, x000067_g_ScriptId, "Gi緄 thi畊 may v�", 11, 100 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x000067_OnDefaultEvent( sceneId, selfId,targetId )
	x000067_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中m祎 项
--**********************************
function x000067_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 100 then
		BeginEvent( sceneId )
			AddText( sceneId, "#{function_help_010}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end

	if	GetNumText()==ABILITY_TEACHER_SHOP	then
		DispatchShopItem( sceneId, selfId,targetId, x000067_g_shoptableindex )
	elseif GetNumText()==12	then
		DispatchShopItem( sceneId, selfId,targetId, 200 ) 
	end
	for i, findId in x000067_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x000067_g_ScriptId )
		return
		end
	end
end

--**********************************
--Ti猵 th薔PCto� 鸬 任务
--**********************************
function x000067_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000067_g_eventList do
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
function x000067_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后,要Tr� v玁PCto� 鸬 事件列表
	for i, findId in x000067_g_eventList do
		if missionScriptId == findId then
			x000067_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续(已经接了任务)
--**********************************
function x000067_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000067_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完to� 鸬 任务
--**********************************
function x000067_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x000067_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x000067_OnDie( sceneId, selfId, killerId )
end
