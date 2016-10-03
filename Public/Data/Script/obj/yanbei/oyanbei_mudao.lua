-- 019033
-- �µ�

--�ű���
x019033_g_scriptId = 019033

--��ӵ��to� � �¼�ID�б�
x019033_g_eventList={212220}



--**********************************
--�¼��б�
--**********************************
function x019033_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  C�c h� mu�n �i b�o v�t c�a ta �? E r�ng c�c h� ph�i chu�n b� 1 t�i Y�n Huy�n Ng�c, th� �� trong C� M� c� r�t nhi�u, nh�ng ph�i xem c�c h� c�n m�ng � l�y ra kh�ng.");
		for i, eventId in x019033_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x019033_OnDefaultEvent( sceneId, selfId,targetId )
	x019033_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��m�t ��
--**********************************
function x019033_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x019033_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--Ti�p th���NPCto� � ����
--**********************************
function x019033_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x019033_g_eventList do
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
--�ܾ���NPCto� � ����
--**********************************
function x019033_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��,ҪTr� v�NPCto� � �¼��б�
	for i, findId in x019033_g_eventList do
		if missionScriptId == findId then
			x019033_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--����(�Ѿ���������)
--**********************************
function x019033_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x019033_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ������to� � ����
--**********************************
function x019033_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )

	for i, findId in x019033_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x019033_OnDie( sceneId, selfId, killerId )
end

