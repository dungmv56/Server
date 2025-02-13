-- T� Ch�uNPC
-- Ǯ����
-- ��ͨ

-- �ű���
x001065_g_ScriptId = 001065

--��ӵ��to� � �¼�ID�б�
x001065_g_EventList = { 050100, 050102, 050106, 500609, 500611 }

--**********************************
--�¼��б�
--**********************************
function x001065_UpdateEventList( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "    Kh� l�m, hi�u �y T� Ch�u Ti�n H�ng V� ch�nh l� ta! T�m ta c� chuy�n g�?" )

		local i, findId
		for i, findId in x001065_g_EventList do
			CallScriptFunction( findId, "OnEnumerate", sceneId, selfId, targetId )
		end

		AddNumText( sceneId, x001065_g_ScriptId, "Gi�i thi�u ph� b�n li�n ho�n", 11, 10 )
		AddNumText( sceneId, x001065_g_ScriptId, "Gi�i thi�u v� L�u Lan li�n ho�n ph� b�n", 11, 11 )


	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��������
--**********************************
function x001065_OnDefaultEvent( sceneId, selfId, targetId )
	x001065_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��m�t ��
--**********************************
function x001065_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 10 then
		BeginEvent( sceneId )
			AddText( sceneId, "#{function_help_078}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	elseif GetNumText() == 11 then
		BeginEvent( sceneId )
			AddText( sceneId, "#{XSHBZ_80917_1}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end

	local i, findId
	for i, findId in x001065_g_EventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--Ti�p th���NPCto� � ����
--**********************************
function x001065_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	local i, findId
	for i, findId in x001065_g_EventList do
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
function x001065_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	local i, findId

	--�ܾ�֮��,ҪTr� v�NPCto� � �¼��б�
	for i, findId in x001065_g_EventList do
		if missionScriptId == findId then
			x001065_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--����(�Ѿ���������)
--**********************************
function x001065_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	local i, findId
	for i, findId in x001065_g_EventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ������to� � ����
--**********************************
function x001065_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	local i, findId
	for i, findId in x001065_g_EventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x001065_OnDie( sceneId, selfId, killerId )
end
