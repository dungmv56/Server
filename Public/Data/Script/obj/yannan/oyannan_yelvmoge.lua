--Ү��Ī��

--�ű���
x018004_g_scriptId = 018004


--��ӵ��to� � �¼�ID�б�
x018004_g_eventList={200030,200034,212120}

--**********************************
--�¼��б�
--**********************************
function x018004_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"  Ti�u ��i V߽ng l�n n�y �i Nam tri�u, l�nh �t d� nhi�u... Nh�ng t�i sao th�i h�u l�i ki�n quy�t b�t �ng �i nh�?")
	for i, eventId in x018004_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x018004_OnDefaultEvent( sceneId, selfId,targetId )
	x018004_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��m�t ��
--**********************************
function x018004_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x018004_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--Ti�p th���NPCto� � ����
--**********************************
function x018004_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x018004_g_eventList do
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
function x018004_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��,ҪTr� v�NPCto� � �¼��б�
	for i, findId in x018004_g_eventList do
		if missionScriptId == findId then
			x018004_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--����(�Ѿ���������)
--**********************************
function x018004_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x018004_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ������to� � ����
--**********************************
function x018004_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x018004_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x018004_OnDie( sceneId, selfId, killerId )
end
