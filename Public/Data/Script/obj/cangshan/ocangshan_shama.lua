--�ʱ���

--�ű���
x025004_g_scriptId = 025004

--��ӵ��to� � �¼�ID�б�
x025004_g_eventList={212121}

--**********************************
--�¼��б�
--**********************************
function x025004_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	AddText(sceneId,"  Tang S�n �i tuy�t nh� ng�n n�n th�p s�ng b�u tr�i ph�a nam. #r#rTh� m�nh �� ch�n d� ��ng d� sai, ch�ng ai c� th� n�i r� ���c");
	for i, eventId in x025004_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x025004_OnDefaultEvent( sceneId, selfId,targetId )
	x025004_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��m�t ��
--**********************************
function x025004_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x025004_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--Ti�p th���NPCto� � ����
--**********************************
function x025004_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x025004_g_eventList do
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
function x025004_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��,ҪTr� v�NPCto� � �¼��б�
	for i, findId in x025004_g_eventList do
		if missionScriptId == findId then
			x025004_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--����(�Ѿ���������)
--**********************************
function x025004_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x025004_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ������to� � ����
--**********************************
function x025004_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x025004_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x025004_OnDie( sceneId, selfId, killerId )
end
