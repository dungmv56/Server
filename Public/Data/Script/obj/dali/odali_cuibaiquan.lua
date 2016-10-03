--�ް�Ȫ

--�ű���
x002008_g_scriptId = 002008

--��ӵ��to� � �¼�ID�б�
x002008_g_eventList={}
--x002008_g_eventList={200201,200202,200203,200301,200302,200303}

--**********************************
--�¼��б�
--**********************************
function x002008_UpdateEventList( sceneId, selfId,targetId )
	
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	AddText(sceneId,"  N߾c ��i L� g�n ��y qu�c th�i d�n an, v߽ng ph� c�ng r�t gi�u c")
	for i, eventId in x002008_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x002008_OnDefaultEvent( sceneId, selfId,targetId )
	x002008_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��m�t ��
--**********************************
function x002008_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x002008_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--Ti�p th���NPCto� � ����
--**********************************
function x002008_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002008_g_eventList do
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
function x002008_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��,ҪTr� v�NPCto� � �¼��б�
	for i, findId in x002008_g_eventList do
		if missionScriptId == findId then
			x002008_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--����(�Ѿ���������)
--**********************************
function x002008_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002008_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ������to� � ����
--**********************************
function x002008_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x002008_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x002008_OnDie( sceneId, selfId, killerId )
end
