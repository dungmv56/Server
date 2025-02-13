--Nam H鋓NPC
--叶流凡
--普通

--脚本号
x034001_g_scriptId = 34001

--所拥有to� 鸬 事件ID列表
x034001_g_eventList={212114}

--**********************************
--事件列表
--**********************************
function x034001_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  R痶 c鴆 l� ai g鈟 ra! Ta nh 鸶nh ph鋓 t靘 ra hung th�, ta mu痭 餰m 馥u h t� vong linh s� ph�, s� n呓ng v� t c� nh鎛g ng叨i c黙 Nam H鋓 ki猰 ph醝! #r#rC豼 s� mu礽 疳ng th呓ng nh, s� mu礽 nh 鸶nh r 餫u l騨g... Trong tim n鄋g , ch� c� 鹫i s� huynh")
		for i, eventId in x034001_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x034001_OnDefaultEvent( sceneId, selfId,targetId )
	x034001_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中m祎 项
--**********************************
function x034001_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x034001_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--Ti猵 th薔PCto� 鸬 任务
--**********************************
function x034001_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x034001_g_eventList do
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
function x034001_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后,要Tr� v玁PCto� 鸬 事件列表
	for i, findId in x034001_g_eventList do
		if missionScriptId == findId then
			x034001_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续(已经接了任务)
--**********************************
function x034001_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x034001_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完to� 鸬 任务
--**********************************
function x034001_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x034001_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x034001_OnDie( sceneId, selfId, killerId )
end
