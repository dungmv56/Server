-- 402241
-- ������   �����븱����

--Th�i H� ���

--�ű���
x402241_g_scriptId = 402241

x402241_g_SceneData_1 = 8

--��ӵ��to� � �¼�ID�б�
x402241_g_eventList={}

--**********************************
--�¼��б�
--**********************************
function x402241_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		
		if LuaFnGetCopySceneData_Param(sceneId, 8) < 10  then
			AddText(sceneId, "#{dazhan_yzw_002}")
		elseif LuaFnGetCopySceneData_Param(sceneId, 8) >= 10  then
			AddText(sceneId, "#{dazhan_yzw_003}")
		end	
		
		
		if LuaFnGetCopySceneData_Param(sceneId, 8) == 1  then
			AddNumText( sceneId, x402241_g_scriptId, "S�n S�ng Chi�n Фu", 10 ,1  )
			--AddNumText( sceneId, x402241_g_scriptId, "ֱ�������ڶ���", 10 ,2  )
		end
		
		for i, eventId in x402241_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x402241_OnDefaultEvent( sceneId, selfId,targetId )
	x402241_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��m�t ��
--**********************************
function x402241_OnEventRequest( sceneId, selfId, targetId, eventId )

	if GetNumText() == 1  then
		-- ��⵱ǰ��ng����ngT�i ��ظ���,�������Ҫ����ȫ���,��T�i �ֲ���
		if GetName(sceneId, targetId) ~= "H� Di�n B�o"  then
			return
		end
		
		if LuaFnGetCopySceneData_Param(sceneId, 8) == 1  then
			LuaFnSetCopySceneData_Param(sceneId, 8, 2)
		end

		-- �رս���
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1000)
		
		return
	end
	
	if GetNumText() == 2  then
		-- ��⵱ǰ��ng����ngT�i ��ظ���,�������Ҫ����ȫ���,��T�i �ֲ���
		if GetName(sceneId, targetId) ~= "H� Di�n B�o"  then
			return
		end
		
		if LuaFnGetCopySceneData_Param(sceneId, 8) == 1  then
			LuaFnSetCopySceneData_Param(sceneId, 8, 10)
		end
		BeginEvent(sceneId)
			AddText(sceneId, "C�a th� hai �� m� ra.")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

		return
	end

	for i, findId in x402241_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--Ti�p th���NPCto� � ����
--**********************************
function x402241_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x402241_g_eventList do
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
--�ܾ���NPCto� � ����
--**********************************
function x402241_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��,ҪTr� v�NPCto� � �¼��б�
	for i, findId in x402241_g_eventList do
		if missionScriptId == findId then
			x402241_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--����(�Ѿ���������)
--**********************************
function x402241_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x402241_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ������to� � ����
--**********************************
function x402241_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x402241_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x402241_OnDie( sceneId, selfId, killerId )
	LuaFnSetCopySceneData_Param(sceneId, 26, 500)
end

