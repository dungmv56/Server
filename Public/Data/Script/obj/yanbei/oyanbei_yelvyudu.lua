--Ү�����

--�ű���
x019003_g_scriptId = 019003


--��ӵ��to� � �¼�ID�б�
x019003_g_eventList={200032,200033}--211001,211006,211007}

--**********************************
--�¼��б�
--**********************************
function x019003_UpdateEventList( sceneId, selfId,targetId )

	BeginEvent(sceneId)
	AddText(sceneId,"  M�c d� M� Ph� t�n c�ng ��i doanh c�a ta, nh�ng ta lo l�ng nh�t v�n l� T�ng tri�u #RKh�c �oan#W, kh�ng ti�u di�t ���c con ng߶i n�y, th� bi�n c߽ng ph�a Nam c�a n߾c Li�u kh�ng bao gi� ���c b�nh y�n.")
	for i, eventId in x019003_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x019003_OnDefaultEvent( sceneId, selfId,targetId )
	x019003_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��m�t ��
--**********************************
function x019003_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x019003_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--Ti�p th���NPCto� � ����
--**********************************
function x019003_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x019003_g_eventList do
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
function x019003_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��,ҪTr� v�NPCto� � �¼��б�
	for i, findId in x019003_g_eventList do
		if missionScriptId == findId then
			x019003_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--����(�Ѿ���������)
--**********************************
function x019003_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x019003_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ������to� � ����
--**********************************
function x019003_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x019003_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x019003_OnDie( sceneId, selfId, killerId )

end

