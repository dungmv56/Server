--程青霜

--脚本号
x002045_g_scriptId = 002045


--所拥有to� 鸬 事件ID列表
x002045_g_eventList={210209,210287}

--**********************************
--事件列表
--**********************************
function x002045_UpdateEventList( sceneId, selfId,targetId )
	
	local  Menpai=LuaFnGetMenPai(sceneId,selfId)
	local  PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex = "S� mu礽"
	else
		PlayerSex = "S� 甬"
	end
	
	BeginEvent(sceneId)	
	if Menpai == 9 then
		AddText(sceneId,"#{OBJ_dali_0024}")
	elseif Menpai == MP_TIANSHAN then
		AddText(sceneId,"  "..PlayerSex..", v� c鬾g c黙 ng呓i ti猲 b� th nhanh. #r#rL鉶 l鉶 nh 鸶nh coi tr鱪g ng呓i, th ng咿ng m�. Ta c鹡g ph鋓 h癷 cung b醝 ki猲 L鉶 l鉶 r癷")
	else
		AddText(sceneId,"  L鈛 l kh鬾g g ng呓i, v緄 thi阯 ch nh� v c黙 ng呓i, th 疳ng ti猚 l読 kh鬾g � Linh Th製 Cung Thi阯 S絥 ta")
	end
	
	if	GetLevel( sceneId, selfId)<=10	then
		AddNumText(sceneId,x002045_g_scriptId,"H銀 t緄 Linh Th製 Cung xem sao",9,0)
	end
	for i, eventId in x002045_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x002045_OnDefaultEvent( sceneId, selfId,targetId )
	x002045_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中m祎 项
--**********************************
function x002045_OnEventRequest( sceneId, selfId, targetId, eventId )
	if	GetNumText()==0	then
		if IsHaveMission(sceneId,selfId,4021) > 0 then
			BeginEvent(sceneId)
				AddText(sceneId,"Ng呓i c� nhi甿 v� ch� h鄋g bg 疬秐g thu�, d竎h tr誱 ch鷑g ta kh鬾g th� cung c d竎h v� cho ng呓i");
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		else	
			CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 17,94,149)
		end

	elseif   GetNumText()==10	then
		BeginEvent(sceneId)
			AddText(sceneId,"#{MnepaiDesc_tianshan_1}");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif   GetNumText()==11	then
		BeginEvent(sceneId)
			AddText(sceneId,"#{MnepaiDesc_tianshan_2}");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif   GetNumText()==12	then
		BeginEvent(sceneId)
			AddText(sceneId,"#{MnepaiDesc_tianshan_3}");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif   GetNumText()==13	then
		BeginEvent(sceneId)
			AddText(sceneId,"#{MnepaiDesc_tianshan_4}");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	else
		for i, findId in x002045_g_eventList do
			if eventId == findId then
				CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
				return
			end
		end
	end
end

--**********************************
--Ti猵 th薔PCto� 鸬 任务
--**********************************
function x002045_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002045_g_eventList do
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
function x002045_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后,要Tr� v玁PCto� 鸬 事件列表
	for i, findId in x002045_g_eventList do
		if missionScriptId == findId then
			x002045_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续(已经接了任务)
--**********************************
function x002045_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002045_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完to� 鸬 任务
--**********************************
function x002045_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x002045_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x002045_OnDie( sceneId, selfId, killerId )
end
