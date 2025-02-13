--姓i L齆PC
--芮斯
--普通

--脚本号
x002090_g_scriptId	= 002090

--所拥有to� 鸬 事件ID列表
x002090_g_eventList	= { 808005, 808006 }

--**********************************
--事件列表
--**********************************
function x002090_UpdateEventList( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "  T読 h� t� 刵 械 xa x鬷 t緄 疴y, v� c鵱g ng咿ng m� v錸 ho�  th馽 c黙 Thi阯 tri玼 th唼ng qu痗, ngo鄆 ra t読 h� c鹡g ph鴑g l畁h ch鱪 mua m祎 v鄆 tr鈔 th� b鋙 b鋙 mang v� 黏t n呔c ch鷑g t鬷." )
		for i, eventId in x002090_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate", sceneId, selfId, targetId )
		end
	EndEvent( sceneId )
	DispatchEventList( sceneId,selfId,targetId )
end

--**********************************
--事件交互入口
--**********************************
function x002090_OnDefaultEvent( sceneId, selfId, targetId )
	x002090_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中m祎 项
--**********************************
function x002090_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x002090_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--Ti猵 th薔PCto� 鸬 任务
--**********************************
function x002090_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002090_g_eventList do
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
function x002090_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后,要Tr� v玁PCto� 鸬 事件列表
	for i, findId in x002090_g_eventList do
		if missionScriptId == findId then
			x002090_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续(已经接了任务)
--**********************************
function x002090_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002090_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完to� 鸬 任务
--**********************************
function x002090_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x002090_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--玩家提交to� 鸬 物品及珍兽
--**********************************
function x002090_OnMissionCheck( sceneId, selfId, npcid, scriptId, index1, index2, index3, indexpet )
	if scriptId ~= nil then
		CallScriptFunction( scriptId, "OnMissionCheck", sceneId, selfId, npcid, scriptId, index1, index2, index3, indexpet )
	end
end

--**********************************
--死亡事件
--**********************************
function x002090_OnDie( sceneId, selfId, killerId )
end
