--Nga MyNPC
--掌门人
--孟青青
--普通

--脚本号
x015000_g_scriptId = 015000

--所拥有to� 鸬 事件ID列表
x015000_g_eventList={226901,229009,229012,808092}

--**********************************
--事件列表
--**********************************
function x015000_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		local  PlayerName=GetName(sceneId,selfId)
		AddText(sceneId,"  "..PlayerName.." , trong thung l鹡g c黙 n鷌 Nga My, c� m祎 朽o Hoa tr, do s� ph� ta 瓞 l読 tr呔c l鷆 餴. Trong tr bao g癿 c� K� m鬾 鸬n gi醦, Ng� h鄋h b醫 qu醝")
		for i, findId in x015000_g_eventList do
			CallScriptFunction( x015000_g_eventList[i], "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x015000_OnDefaultEvent( sceneId, selfId,targetId )
	x015000_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中m祎 项
--**********************************
function x015000_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x015000_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, MP_EMEI )
			return
		end
	end
end

--**********************************
--Ti猵 th薔PCto� 鸬 任务
--**********************************
function x015000_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x015000_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--拒绝此NPCto� 鸬 任务
--**********************************
function x015000_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后,要Tr� v玁PCto� 鸬 事件列表
	for i, findId in x015000_g_eventList do
		if missionScriptId == findId then
			x015000_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续(已经接了任务)
--**********************************
function x015000_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x015000_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完to� 鸬 任务
--**********************************
function x015000_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x015000_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x015000_OnDie( sceneId, selfId, killerId )
end

