--石林 郑圆

--脚本号
x026004_g_scriptId = 026004

--所拥有to� 鸬 事件ID列表
x026004_g_eventList={212124}--211705

--**********************************
--事件列表
--**********************************
function x026004_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)	
	AddText(sceneId,"D� x鋣 ra b k� chuy畁 g�, ta v鏽 kh鬾g tin t呔ng c鬾g ta l読 bi猲 th鄋h Y琻 s�, 鬾g l� ng叨i ta y陁 qu� nh, c鹡g l� ng叨i th鈔 duy nh c黙 ta tr阯 th� gian n鄖, nh 鸶nh 鬾g c� n眎 kh� t鈓, nh 鸶nh v. T c� 皤u do l瞚 c黙 l� Y琻 s�, t c� l� do l瞚 c黙 ch鷑g!")
	for i, eventId in x026004_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x026004_OnDefaultEvent( sceneId, selfId,targetId )
	x026004_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中m祎 项
--**********************************
function x026004_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x026004_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--Ti猵 th薔PCto� 鸬 任务
--**********************************
function x026004_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x026004_g_eventList do
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
function x026004_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后,要Tr� v玁PCto� 鸬 事件列表
	for i, findId in x026004_g_eventList do
		if missionScriptId == findId then
			x026004_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续(已经接了任务)
--**********************************
function x026004_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x026004_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完to� 鸬 任务
--**********************************
function x026004_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x026004_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x026004_OnDie( sceneId, selfId, killerId )
end
