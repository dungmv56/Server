--�ʱ���

--�ű���
x025001_g_scriptId = 025001

--��ӵ��to� � �¼�ID�б�
x025001_g_eventList={}

--**********************************
--�¼��б�
--**********************************
function x025001_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	AddText(sceneId,"  H�! Ch� c�n ta c� m�t, kh�ng ai ���c ��ng t�i T�t Tang ��i nh�n! #r#rT�n m�p th�i T�t L� kia n�u ng߽i d�m x�ng v�o, t�i 1 ta gi�t 1, t�i 2 ta gi�t 2!");
	for i, eventId in x025001_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x025001_OnDefaultEvent( sceneId, selfId,targetId )
	x025001_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��m�t ��
--**********************************
function x025001_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x025001_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--Ti�p th���NPCto� � ����
--**********************************
function x025001_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x025001_g_eventList do
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
function x025001_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��,ҪTr� v�NPCto� � �¼��б�
	for i, findId in x025001_g_eventList do
		if missionScriptId == findId then
			x025001_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--����(�Ѿ���������)
--**********************************
function x025001_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x025001_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ������to� � ����
--**********************************
function x025001_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x025001_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x025001_OnDie( sceneId, selfId, killerId )
end
