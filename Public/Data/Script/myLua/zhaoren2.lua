--地共四层NPC
--老娘
--如意小子策划

--脚本号
x002946_g_ScriptId = 000102

--所拥有to� 鸬 事件ID列表
x002946_g_eventList={250507}
--**********************************
--事件列表
--**********************************
function x002946_UpdateEventList( sceneId, selfId,targetId )
    local  PlayerName=GetName(sceneId,selfId)	
	local  PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex = " c� n呓ng "
	else
		PlayerSex = " c醕 h� "
	end
	BeginEvent(sceneId)
		AddText(sceneId,"  #77Kh鬾g ph鋓"..PlayerName..PlayerSex.."sao, m畉 ch猼 ta 疬㧟! Nghe n骾 h鄆 t� � Tg Ho鄋g 懈a Cung 4 ki琺 so醫 kinh nghi甿, l鉶 n呓ng ng鄋 d xa x鬷 t� L誧 D呓ng t緄 疴y, l鄊 phi玭 ng呓i chuy琻 c醥 v緄 h, m� h g鱥 v� nh� 錸 c絤.")
		for i, eventId in x002946_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x002946_OnDefaultEvent( sceneId, selfId,targetId )
	x002946_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中m祎 项
--**********************************
function x002946_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x002946_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--Ti猵 th薔PCto� 鸬 任务
--**********************************
function x002946_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002946_g_eventList do
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
function x002946_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后,要Tr� v玁PCto� 鸬 事件列表
	for i, findId in x002946_g_eventList do
		if missionScriptId == findId then
			x002946_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续(已经接了任务)
--**********************************
function x002946_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002946_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完to� 鸬 任务
--**********************************
function x002946_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x002946_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x002946_OnDie( sceneId, selfId, killerId )
end
