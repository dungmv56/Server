--�շ�

--�ű���
x030003_g_scriptId = 030003

--��ӵ��to� � �¼�ID�б�
x030003_g_eventList={212100, 808095, 808096, 808097, 808094}
-- 212100  �շ�to� � ����

--**********************************
--�¼��б�
--**********************************
function x030003_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	AddText(sceneId,"  Ch�ng ta v�n l� #rTh�y Qu�#W - tuy kh�ng ph�i lo�i ng߶i, nh�ng ch�ng ta v� lo�i ng߶i gi�ng nhau v� c� cu�c s�ng c�a m�nh, t� t߷ng c�a m�nh, ch�ng ta kh�ng ph�i l� ch�ng t�c hung �c hi�u chi�n")
	for i, eventId in x030003_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x030003_OnDefaultEvent( sceneId, selfId,targetId )
	x030003_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��m�t ��
--**********************************
function x030003_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x030003_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--Ti�p th���NPCto� � ����
--**********************************
function x030003_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x030003_g_eventList do
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
function x030003_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��,ҪTr� v�NPCto� � �¼��б�
	for i, findId in x030003_g_eventList do
		if missionScriptId == findId then
			x030003_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--����(�Ѿ���������)
--**********************************
function x030003_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x030003_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ������to� � ����
--**********************************
function x030003_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x030003_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x030003_OnDie( sceneId, selfId, killerId )
end
