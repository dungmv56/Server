--姓i L齆PC
--士兵
--普通
--脚本号
x000080_g_scriptId = 000080

--所拥有to� 鸬 事件ID列表
x000080_g_eventList={500000}	

--**********************************
--事件列表
--**********************************
function x000080_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		local  PlayerName=GetName(sceneId,selfId)
		local  PlayerSex=GetSex(sceneId,selfId)
		if PlayerSex == 0 then
			PlayerSex = " c� n呓ng"
		else
			PlayerSex = " c醕 h�"
		end
		AddText(sceneId,"  "..PlayerName..PlayerSex..", v� s� an nguy c黙 n呔c 姓i T痭g, 瓞 cho ng叨i th鈔 ch鷑g ta c� th� s痭g y阯 b靚h, ch鷑g t鬷 s� c鄋g d鴑g c鬾g t luy畁!")
		for i, eventId in x000080_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x000080_OnDefaultEvent( sceneId, selfId,targetId )
	x000080_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中m祎 项
--**********************************
function x000080_OnEventRequest( sceneId, selfId, targetId, eventId )
	CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
	return
end

--**********************************
--Ti猵 th薔PCto� 鸬 任务
--**********************************
function x000080_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000080_g_eventList do
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
function x000080_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后,要Tr� v玁PCto� 鸬 事件列表
	for i, findId in x000080_g_eventList do
		if missionScriptId == findId then
			x000080_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续(已经接了任务)
--**********************************
function x000080_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000080_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完to� 鸬 任务
--**********************************
function x000080_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x000080_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x000080_OnDie( sceneId, selfId, killerId )
end
