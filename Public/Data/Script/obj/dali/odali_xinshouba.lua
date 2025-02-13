--孙八爷

--脚本号
x002032_g_scriptId = 002032


--所拥有的事件ID列表
x002032_g_eventList={210210,210211,210212}

--**********************************
--事件列表
--**********************************
function x002032_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local PlayerName=GetName(sceneId,selfId)	
	local PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex = " mu礽 mu礽"
	else
		PlayerSex = " huynh 甬"
	end
	AddText(sceneId,"  "..PlayerName..PlayerSex.."#{OBJ_dali_0014}")
	for i, eventId in x002032_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	AddNumText( sceneId, x002032_g_scriptId, "Ho誸 鸬ng T ho鄋g chi猲 th", 6, 200 )
	AddNumText( sceneId, x002032_g_scriptId, "Xoa ho誸 鸬ng T ho鄋g chi猲 th", 6, 201 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x002032_OnDefaultEvent( sceneId, selfId,targetId )
	x002032_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x002032_OnEventRequest( sceneId, selfId, targetId, eventId )
	local nNumText = GetNumText()
	for i, findId in x002032_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
	if nNumText == 200 then
		BeginEvent(sceneId)
			--5965 Chan.Trung Lau Ngoc
			--5952 TLGioi
			--5953 TLNgoc
			--20000-21000 Co tan hoang chien than
			if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 5970) == 0 then
				LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 5970, 0 )
				LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 18, 0 ) --Hieu ung thang cap
				--CallScriptFunction( SCENE_SCRIPT_ID, "PlaySoundEffect", sceneId, selfId, 66 )
				AddText(sceneId,"  Ch鷆 m譶g c醕 h� 疸 nh hi畊 裯g c黙 ho誸 鸬ng T ho鄋g chi猲 th th鄋h c鬾g, h銀 b鬾 t giang h� Thi阯 Long B醫 B� c鵱g n� nh�!")
			else
				LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 49, 0 ) --Hieu ung thang cap vo hon
				AddText(sceneId,"  C醕 h� 餫ng gi� tr阯 ng叨i tr課g th醝 n鄖 r癷!")
			end
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	if nNumText == 201 then
		BeginEvent(sceneId)
			for i=5000,5970 do
			LuaFnCancelSpecificImpact(sceneId,selfId,i)
			end
			AddText(sceneId,"  Xoa OK")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x002032_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002032_g_eventList do
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
--拒绝此NPC的任务
--**********************************
function x002032_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x002032_g_eventList do
		if missionScriptId == findId then
			x002032_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x002032_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002032_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x002032_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x002032_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x002032_OnDie( sceneId, selfId, killerId )
end
