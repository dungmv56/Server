--L鈛 LanNPC....
--铸造技能大师....

--脚本号
x001104_g_ScriptId = 001104

--所拥有to� 鸬 事件Id列表
--estudy_zhuzao = 713505
--elevelup_zhuzao = 713564
--edialog_zhuzao = 713604
--所拥有to� 鸬 事件ID列表
x001104_g_eventList={713505,713564,713604}

--**********************************
--事件列表
--**********************************
function x001104_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"#{LLGC_20080324_05}")
		for i, eventId in x001104_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
		AddNumText( sceneId, x001104_g_ScriptId, "#{INTERFACE_XML_1197}", 7, 27 )
		AddNumText( sceneId, x001104_g_ScriptId, "#{INTERFACE_XML_1194}", 7, 28 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x001104_OnDefaultEvent( sceneId, selfId,targetId )
	x001104_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中m祎 项
--**********************************
function x001104_OnEventRequest( sceneId, selfId, targetId, eventId )
	
	if GetNumText() == 27 then 
	   DispatchShopItem( sceneId, selfId, targetId, 205 )                    
	elseif GetNumText() == 28 then 
	   DispatchShopItem( sceneId, selfId, targetId, 202 )                    
	end
	for i, findId in x001104_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x001104_g_ScriptId )
		return
		end
	end
end

--**********************************
--Ti猵 th薔PCto� 鸬 任务
--**********************************
function x001104_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001104_g_eventList do
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
function x001104_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后,要Tr� v玁PCto� 鸬 事件列表
	for i, findId in x001104_g_eventList do
		if missionScriptId == findId then
			x001104_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续(已经接了任务)
--**********************************
function x001104_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001104_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完to� 鸬 任务
--**********************************
function x001104_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x001104_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end
