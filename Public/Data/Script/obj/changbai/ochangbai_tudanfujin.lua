--����ӯ��

--�ű���
x022009_g_scriptId = 022009

--��ӵ��to� � �¼�ID�б�
x022009_g_eventList={}--211302,211303,211304,211307,211308	

--**********************************
--�¼��б�
--**********************************
function x022009_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	AddText(sceneId,"  Ng�t Thu�t v�n c�n l� 1 ��a tr�, quy�t kh�ng ph�i c� � mu�n h�i Ng� Th�i M�i. Ph�i ph߽ng c�a th�n y nh�t �nh v�n c�n � Tr߶ng B�ch S�n, n�u nh� t�m v� ���c th� qu� t�t.")
	for i, eventId in x022009_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x022009_OnDefaultEvent( sceneId, selfId,targetId )
	x022009_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��m�t ��
--**********************************
function x022009_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x022009_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--Ti�p th���NPCto� � ����
--**********************************
function x022009_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x022009_g_eventList do
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
function x022009_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��,ҪTr� v�NPCto� � �¼��б�
	for i, findId in x022009_g_eventList do
		if missionScriptId == findId then
			x022009_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--����(�Ѿ���������)
--**********************************
function x022009_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x022009_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ������to� � ����
--**********************************
function x022009_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x022009_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x022009_OnDie( sceneId, selfId, killerId )
end
