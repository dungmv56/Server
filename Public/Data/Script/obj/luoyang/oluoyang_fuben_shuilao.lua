--水牢副本任务npc

--脚本号
x000089_g_scriptId = 000090


--所拥有to� 鸬 事件ID列表
x000089_g_eventList={231000}

--**********************************
--事件列表
--**********************************
function x000089_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		local  PlayerName=GetName(sceneId,selfId)
		AddText(sceneId,"  "..PlayerName..", t緄 疴y. \n")
		for i, findId in x000089_g_eventList do
			CallScriptFunction( x000089_g_eventList[i], "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x000089_OnDefaultEvent( sceneId, selfId, targetId )
------------------------------------------------------
--[Nov.1 2006]Lybin Close
--x000089_UpdateEventList( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "  C醕 h� mau 皙n B誧h M� t�, Tr� Thanh 鹫i s� 餫ng r n髇g l騨g g c醕 h� 痼! Ta m h鬽 nay vi甤 qu� b, 瘙i ta b靚h 鸶nh xong lo課 痄ng � Th鼀 lao, nh 鸶nh s� 皙n B誧h M� t� quy阯 t� cho d鈔 t� n課" )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
------------------------------------------------------
end

--**********************************
--事件列表选中m祎 项
--**********************************
function x000089_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x000089_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--Ti猵 th薔PCto� 鸬 任务
--**********************************
function x000089_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000089_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			return
		end
	end
end

--**********************************
--拒绝此NPCto� 鸬 任务
--**********************************
function x000089_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后,要Tr� v玁PCto� 鸬 事件列表
	for i, findId in x000089_g_eventList do
		if missionScriptId == findId then
			x000089_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续(已经接了任务)
--**********************************
function x000089_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000089_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完to� 鸬 任务
--**********************************
function x000089_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x000089_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x000089_OnDie( sceneId, selfId, killerId )
end
