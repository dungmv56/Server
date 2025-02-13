--姓i L齆PC  铸造npc   学习铸造技能   升c铸造技能
--过三锤
--普通

--脚本号
x002062_g_ScriptId = 002062

--商店编号
x002062_g_shoptableindex=61

--所拥有to� 鸬 事件Id列表
--estudy_zhuzao = 713505
--elevelup_zhuzao = 713564
--edialog_zhuzao = 713604
--所拥有to� 鸬 事件ID列表
x002062_g_eventList={713505,713564,713604}
--**********************************
--事件列表
--**********************************
function x002062_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"#{OBJ_dali_0037}")
	for i, eventId in x002062_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
        --商店选项
	AddNumText(sceneId,x002062_g_ScriptId,"Mua h靚h ch猼 t誳",7,ABILITY_TEACHER_SHOP)
	AddNumText(sceneId,x002062_g_ScriptId,"#{INTERFACE_XML_1194}",7,12)  
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x002062_OnDefaultEvent( sceneId, selfId,targetId )
	x002062_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中m祎 项
--**********************************
function x002062_OnEventRequest( sceneId, selfId, targetId, eventId )
	if	GetNumText()==ABILITY_TEACHER_SHOP	then
		DispatchShopItem( sceneId, selfId,targetId, x002062_g_shoptableindex )
	elseif	GetNumText()==12	then
		DispatchShopItem( sceneId, selfId,targetId, 199 )   
  end
	for i, findId in x002062_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x002062_g_ScriptId )
		return
	end
end
end

--**********************************
--Ti猵 th薔PCto� 鸬 任务
--**********************************
function x002062_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002062_g_eventList do
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
function x002062_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后,要Tr� v玁PCto� 鸬 事件列表
	for i, findId in x002062_g_eventList do
		if missionScriptId == findId then
			x002062_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续(已经接了任务)
--**********************************
function x002062_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002062_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完to� 鸬 任务
--**********************************
function x002062_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x002062_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x002062_OnDie( sceneId, selfId, killerId )
end
