--L誧 D呓ngNPC
--陈夫之
--普通

--脚本号
x000112_g_scriptId = 000112

--目标NPC
x000112_g_name	="陈夫之"

--所拥有to� 鸬 事件ID列表 {结拜,解除结拜,强制解除结拜}
x000112_g_RelationEventList={806001,806002,806000}

--**********************************
--事件交互入口
--**********************************
function x000112_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  Mu痭 k猼 b醝 v緄 ng叨i kh醕 kh鬾g? T読 h� c� th� vi猼 Kim Lan ph� cho c醕 v�")
		
		AddNumText( sceneId, x000112_g_scriptId, "Gi緄 thi畊 k猼 b醝", 11, 10 )
		
		for i, eventId in x000112_g_RelationEventList do
			CallScriptFunction( eventId, "OnEnumerate", sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件列表选中m祎 项
--**********************************
function x000112_OnEventRequest( sceneId, selfId, targetId, eventId )

	if GetNumText() == 10 then
			BeginEvent(sceneId)	
					
				AddText( sceneId, "#{function_help_067}" )
								
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
	end

	local i
	local findId
	for i, findId in x000112_g_RelationEventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
--		x000112_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--Ti猵 th薔PCto� 鸬 任务
--**********************************
function x000112_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	local i
	local findId
	for i, findId in x000112_g_RelationEventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			return
		end
	end
end

--**********************************
--拒绝此NPCto� 鸬 任务
--**********************************
function x000112_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	local i
	local findId
	--拒绝之后,要Tr� v玁PCto� 鸬 事件列表
	for i, findId in x000112_g_RelationEventList do
		if missionScriptId == findId then
			x000112_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end
