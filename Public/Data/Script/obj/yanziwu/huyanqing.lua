-- 402240
-- 呼延庆  燕子坞副本内

--脚本号
x402240_g_scriptId = 402240

--所拥有to� 鸬 事件ID列表
x402240_g_eventList={}

--**********************************
--事件列表
--**********************************
function x402240_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId, "#{dazhan_yzw_001}")		    				
		for i, eventId in x402240_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
		
		-- 添加m祎 c醝退出副本to� 鸬 选项
		--AddNumText( sceneId, x402240_g_scriptId, "前往Th醝 H�", 9 ,1  )
		
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x402240_OnDefaultEvent( sceneId, selfId,targetId )
	x402240_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中m祎 项
--**********************************
function x402240_OnEventRequest( sceneId, selfId, targetId, eventId )
	
--	if GetNumText() == 1   then
--		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 4,70,121)
--		return
--	end

	for i, findId in x402240_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--Ti猵 th薔PCto� 鸬 任务
--**********************************
function x402240_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x402240_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId, targetId )
			end
			return
		end
	end
end

--**********************************
--拒绝此NPCto� 鸬 任务
--**********************************
function x402240_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后,要Tr� v玁PCto� 鸬 事件列表
	for i, findId in x402240_g_eventList do
		if missionScriptId == findId then
			x402240_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续(已经接了任务)
--**********************************
function x402240_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x402240_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完to� 鸬 任务
--**********************************
function x402240_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x402240_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x402240_OnDie( sceneId, selfId, killerId )

end

