--��ֲ

--�ű���
x018003_g_scriptId = 018003


--��ӵ��to� � �¼�ID�б�
x018003_g_eventList={}

--**********************************
--�¼��б�
--**********************************
function x018003_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"  Gia Lu�t t߾ng qu�n, nghe n�i ng߶i n߾c Kim kh�ng ���c �� m�t v�n, n�u �� m�t v�n th� thi�n h� v� �ch, c� ��ng l� th�t nh� v�y kh�ng?")
	for i, eventId in x018003_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x018003_OnDefaultEvent( sceneId, selfId,targetId )
	x018003_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��m�t ��
--**********************************
function x018003_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x018003_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--Ti�p th���NPCto� � ����
--**********************************
function x018003_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x018003_g_eventList do
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
function x018003_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��,ҪTr� v�NPCto� � �¼��б�
	for i, findId in x018003_g_eventList do
		if missionScriptId == findId then
			x018003_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--����(�Ѿ���������)
--**********************************
function x018003_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x018003_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ������to� � ����
--**********************************
function x018003_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x018003_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x018003_OnDie( sceneId, selfId, killerId )
end
