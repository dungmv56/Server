--NPC
--
--�ű���
x000151_g_scriptId = 000151

--��ӵ��to� � �¼�ID�б�
x000151_g_eventList={500601}
--��ͨ

--**********************************
--�¼��������
--**********************************
function x000151_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)

--**********************************
--NPC�Ի�
--**********************************
		AddText(sceneId,"  Ph߽ng c�ch gian t� h�u thi�n �a, H�c b�ch x� �m t�ng c�n kh�n!")
		for i, eventId in x000151_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��б�ѡ��m�t ��
--**********************************
function x000151_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x000151_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--Ti�p th���NPCto� � ����
--**********************************
function x000151_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000151_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId, targetId )
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
function x000151_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��,ҪTr� v�NPCto� � �¼��б�
	for i, findId in x000151_g_eventList do
		if missionScriptId == findId then
			x000151_OnDefaultEvent( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--����(�Ѿ���������)
--**********************************
function x000151_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000151_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ������to� � ����
--**********************************
function x000151_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x000151_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x000151_OnDie( sceneId, selfId, killerId )
end
