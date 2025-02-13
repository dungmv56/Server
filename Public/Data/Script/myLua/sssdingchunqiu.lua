--少室山NPC
--Thi阯 S絥 邪ng L鉶
--如意小子策划

--脚本号
x002953_g_ScriptId = 002953

--所拥有to� 鸬 事件ID列表
x002953_g_eventList={250507}
--**********************************
--事件列表
--**********************************
function x002953_UpdateEventList( sceneId, selfId,targetId )
    local  PlayerName=GetName(sceneId,selfId)	
	local  PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex = " c� n呓ng "
	else
		PlayerSex = " c醕 h�"
	end
	BeginEvent(sceneId)
		AddText(sceneId,"  #72这不喧ng"..PlayerName..PlayerSex.."吗,老夫m祎 直觉 餴琺,武林中人以刀斧枪棒相互搏杀,实T読 喧ng残忍无比to� 鸬 事情。如果用毒功伤人,才能让人T読 平静、安逸、幸福、快乐之中死亡,毒功真喧ng功德无量to� 鸬 武功啊!")
		for i, eventId in x002953_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x002953_OnDefaultEvent( sceneId, selfId,targetId )
	x002953_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中m祎 项
--**********************************
function x002953_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x002953_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--Ti猵 th薔PCto� 鸬 任务
--**********************************
function x002953_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002953_g_eventList do
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
function x002953_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后,要Tr� v玁PCto� 鸬 事件列表
	for i, findId in x002953_g_eventList do
		if missionScriptId == findId then
			x002953_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续(已经接了任务)
--**********************************
function x002953_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002953_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完to� 鸬 任务
--**********************************
function x002953_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x002953_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x002953_OnDie( sceneId, selfId, killerId )
end
