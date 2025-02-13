--西京枢密使

--脚本号
x311000_g_scriptId = 311000


--所拥有to� 鸬 事件ID列表
x311000_g_eventList={311004,311005}

--**********************************
--事件列表
--**********************************
function x311000_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		local  PlayerName=GetName(sceneId,selfId)
		AddText(sceneId,"  "..PlayerName..", 疴y l� l鷆 tri玼 痨nh tr鱪g d鴑g ng叨i t鄆, ng叨i tr� tu眎 n阯 ra m b醥 疳p n呔c nh�. Ta 疸 th鬾g b醥 cho L遳 Ki畁 Minh, cung c cho nh鎛g anh h鵱g tr阯 giang h� nh� c醕 h� g 痿i kinh nghi甿, 瓞 n鈔g cao hi畊 su c黙 c醕 v�. C醕 h� c� th� 皙n qu鋘g tr叨ng tr呔c ph� 瓞 nh l頽h")

	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x311000_OnDefaultEvent( sceneId, selfId,targetId )
	--if ( IsHaveMission(sceneId,selfId,4001) > 0) then
	--	DelMission(sceneId,selfId,4001)	
	--elseif ( IsHaveMission(sceneId,selfId,4002) > 0) then
	--	DelMission(sceneId,selfId,4002)
	--end
	x311000_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中m祎 项
--**********************************
function x311000_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x311000_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--Ti猵 th薔PCto� 鸬 任务
--**********************************
function x311000_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x311000_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			return
		end
	end
end

--**********************************
--拒绝此NPCto� 鸬 任务
--**********************************
function x311000_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后,要Tr� v玁PCto� 鸬 事件列表
	for i, findId in x311000_g_eventList do
		if missionScriptId == findId then
			x311000_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续(已经接了任务)
--**********************************
function x311000_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x311000_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完to� 鸬 任务
--**********************************
function x311000_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x311000_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x311000_OnDie( sceneId, selfId, killerId )
end
