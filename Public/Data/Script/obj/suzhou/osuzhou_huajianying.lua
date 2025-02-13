-- T� Ch�uNPC
-- ������
-- m�t ��

-- �ű���
x001029_g_ScriptId = 001029

--��ӵ��to� � �¼�ID�б�
x001029_g_EventList = { 050101, 500610 }

--**********************************
--�¼��б�
--**********************************
function x001029_UpdateEventList( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "    B�n ti�u c�c ���c h�c b�ch l��ng ��o n� m�t, b�o ti�u ch�a bao gi� s� s�t, �n ti�u c�c ta bao ti�u l� c� th� y�n t�m r�i" )

		local i, findId
		for i, findId in x001029_g_EventList do
			CallScriptFunction( findId, "OnEnumerate", sceneId, selfId, targetId )
		end
		
		AddNumText( sceneId, x001029_g_ScriptId, "Gi�i thi�u ph� b�n li�n ho�n", 11, 105 )
		AddNumText( sceneId, x001029_g_ScriptId, "Gi�i thi�u v� L�u Lan li�n ho�n ph� b�n", 11, 106 )
		
		
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��������
--**********************************
function x001029_OnDefaultEvent( sceneId, selfId, targetId )
	x001029_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��m�t ��
--**********************************
function x001029_OnEventRequest( sceneId, selfId, targetId, eventId )

	if GetNumText() == 105 then
		BeginEvent( sceneId )
			AddText( sceneId, "#{function_help_077}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return	
	elseif GetNumText() == 106 then
		BeginEvent( sceneId )
			AddText( sceneId, "#{XSHBZ_80917_1}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end


	local i, findId
	for i, findId in x001029_g_EventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--Ti�p th���NPCto� � ����
--**********************************
function x001029_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	local i, findId
	for i, findId in x001029_g_EventList do
		if missionScriptId == findId then
			local ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId, targetId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId, targetId, missionScriptId )
			end
			return
		end
	end
end

--**********************************
--�ܾ���NPCto� � ����
--**********************************
function x001029_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	local i, findId

	--�ܾ�֮��,ҪTr� v�NPCto� � �¼��б�
	for i, findId in x001029_g_EventList do
		if missionScriptId == findId then
			x001029_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--����(�Ѿ���������)
--**********************************
function x001029_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	local i, findId
	for i, findId in x001029_g_EventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ������to� � ����
--**********************************
function x001029_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	local i, findId
	for i, findId in x001029_g_EventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x001029_OnDie( sceneId, selfId, killerId )
end
