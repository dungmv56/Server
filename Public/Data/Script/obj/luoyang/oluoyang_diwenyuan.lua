--L誧 D呓ngNPC
--狄文远
--普通

--脚本号
x000083_g_scriptId = 000083

x000083_g_missionName = "更改阵营"

--所拥有to� 鸬 事件ID列表
x000083_g_eventList={250503}
--**********************************
--事件列表
--**********************************
function x000083_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		local  PlayerName=GetName(sceneId,selfId)
		AddText(sceneId,"   Gi鎍 tr叨ng t� th�, s痭g ch猼 t読 m畁h, 餴玭 t阯 v鄌 gi sinh t� n鄖 r癷 l� kh鬾g 疬㧟 thay 鸨i n鎍, c醕 h� ph鋓 ngh� cho th k�!");
		--如果玩家完成过C醝 n鄖 任务
		if GetCurCamp (sceneId, selfId) == 1 then
			AddNumText(sceneId, x000083_g_scriptId,"Kh鬷 ph鴆 l読 tr doanh ban 馥u",6,0);
		--Th鯽 m鉵任务接收条件
		else
			AddNumText(sceneId,x000083_g_scriptId,"校t l読 th鄋h tr doanh PK",6,1);
		end
		for i, eventId in x000083_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end


--**********************************
--事件交互入口
--**********************************
function x000083_OnDefaultEvent( sceneId, selfId,targetId )
	x000083_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中m祎 项
--**********************************
function x000083_OnEventRequest( sceneId, selfId, targetId, eventId )
	if	GetNumText()==0	then
			SetCurCamp (sceneId, selfId, 0)
		BeginEvent(sceneId)
  			AddText(sceneId,"C醕 h� 疸 kh鬷 ph鴆 l読 tr doanh ban 馥u");
  		EndEvent(sceneId)
  		DispatchMissionTips(sceneId,selfId)
	elseif	GetNumText()==1	then
		SetCurCamp (sceneId, selfId, 1 )
		BeginEvent(sceneId)
	  		AddText(sceneId,"C醕 h� 疸 kh鬷 ph鴆 l読 tr doanh PK");
		EndEvent(sceneId)
	  	DispatchMissionTips(sceneId,selfId)
	end
	for i, findId in x000083_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--Ti猵 th薔PCto� 鸬 任务
--**********************************
function x000083_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000083_g_eventList do
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
function x000083_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后,要Tr� v玁PCto� 鸬 事件列表
	for i, findId in x000083_g_eventList do
		if missionScriptId == findId then
			x000083_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续(已经接了任务)
--**********************************
function x000083_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000083_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完to� 鸬 任务
--**********************************
function x000083_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x000083_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x000083_OnDie( sceneId, selfId, killerId )
end
