--L誧 D呓ngNPC
--Nguy畉 L鉶
--普通

--脚本号
x000093_g_scriptId = 000093

--目标NPC
x000093_g_name	="Nguy畉 L鉶"

x000093_StartTime   = 9040
x000093_EndTime     = 9047

--所拥有to� 鸬 事件ID列表 {结婚, 学习夫妻技能, 离婚, 强制离婚, 购买请帖,夫妻问答}
x000093_g_RelationEventList={806003, 806016, 806005, 806004, 806017,888901, 808010} --婚戒升c 808010 zchw

--**********************************
--事件交互入口
--**********************************
function x000093_OnDefaultEvent( sceneId, selfId, targetId )
	x000093_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表
--**********************************
function x000093_UpdateEventList( sceneId, selfId, targetId )
	BeginEvent(sceneId)
		local i
		local eventId
		AddText( sceneId, "#{OBJ_luoyang_0025}" )
		
		AddNumText( sceneId, x000093_g_scriptId, "Gi緄 thi畊 k猼 h鬾", 11, 10 )
		AddNumText( sceneId, x000093_g_scriptId, "Li阯 quan t鈓 h鎢 linh t�", 11, 11 )
		
		local curDayTime = GetDayTime()
		if (curDayTime>=x000093_StartTime and curDayTime<x000093_EndTime) then
			AddNumText(sceneId,x000093_g_scriptId,"V� V頽h Hg To鄋 Gi緄",11,12)
		end
		
		for i, eventId in x000093_g_RelationEventList do
			CallScriptFunction( eventId, "OnEnumerate", sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId, selfId, targetId)
end

--**********************************
--事件列表选中m祎 项
--**********************************
function x000093_OnEventRequest( sceneId, selfId, targetId, eventId )

	if x000093_g_scriptId == eventId and GetNumText() == 10 then
			BeginEvent(sceneId)	
					
				AddText( sceneId, "#{function_help_066}" )
								
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
	end
	
	if x000093_g_scriptId == eventId and GetNumText() == 11 then
			BeginEvent(sceneId)	
					
				AddText( sceneId, "#{function_help_102}" )
								
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
	end
	if x000093_g_scriptId == eventId and GetNumText() == 12 then
		
		BeginEvent(sceneId)	
					
				AddText( sceneId, "#{QRJ_81009_01}" )
								
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
	end


	local i
	local findId
	for i, findId in x000093_g_RelationEventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
--		x000093_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--Ti猵 th薔PCto� 鸬 任务
--**********************************
function x000093_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	local i
	local findId
	for i, findId in x000093_g_RelationEventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			return
		end
	end
end

--**********************************
--拒绝此NPCto� 鸬 任务
--**********************************
function x000093_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	local i
	local findId
	--拒绝之后,要Tr� v玁PCto� 鸬 事件列表
	for i, findId in x000093_g_RelationEventList do
		if missionScriptId == findId then
			x000093_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end
