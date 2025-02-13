-- 125012
-- 复活设定

--脚本号
x125012_g_scriptId = 125012

--所拥有to� 鸬 事件ID列表
x125012_g_eventList={}

x125012_g_Position = {
				{x=143,z=151,name="Ph誱 Chung Ly"},
				{x=28, z=152,name="Th誧h Th� S鵱g"},
				{x=149,z=80,name="校ng 懈nh Th鬾g"},
				{x=36, z=49,name="L唼ng V課 K�"},
}

--**********************************
--事件列表
--**********************************
function x125012_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"Ng呓i mu痭 鸶nh 餴琺 h癷 sinh c黙 ng呓i � n絠 n鄖 sao?");
		for i, eventId in x125012_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
		
		AddNumText( sceneId, x125012_g_scriptId, "懈nh 餴琺 h癷 sinh c黙 ta � n絠 n鄖" ,9 ,1  )
		
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x125012_OnDefaultEvent( sceneId, selfId,targetId )
	x125012_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中m祎 项
--**********************************
function x125012_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText()==1  then
		local nIndex = 0
		for i=1, 4  do
			if GetName(sceneId, targetId) == x125012_g_Position[i].name  then
				nIndex = i
			end
		end

		--SetPlayerDefaultReliveInfo( sceneId, selfId, "%100", "%100", "0", 
		--			sceneId, x125012_g_Position[nIndex].x, x125012_g_Position[nIndex].z )
		
		SetPlayerDefaultReliveInfoEx( sceneId, selfId, "%100", "%100", "0", 
						sceneId, 
						x125012_g_Position[nIndex].x, 
						x125012_g_Position[nIndex].z, 
						125020 )
					
		BeginEvent(sceneId)
			AddText(sceneId,"衖琺 h癷 sinh c黙 ng呓i 疸 thi猼 l n絠 n鄖.");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		
		-- 给m祎 c醝特效
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, 
										selfId, 152, 100 )
		
		return
	end
	for i, findId in x125012_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--Ti猵 th薔PCto� 鸬 任务
--**********************************
function x125012_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x125012_g_eventList do
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
function x125012_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后,要Tr� v玁PCto� 鸬 事件列表
	for i, findId in x125012_g_eventList do
		if missionScriptId == findId then
			x125012_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续(已经接了任务)
--**********************************
function x125012_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x125012_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完to� 鸬 任务
--**********************************
function x125012_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x125012_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x125012_OnDie( sceneId, selfId, killerId )
end
