--������

--�ű���
x000005_g_ScriptId = 000005


--��ӵ��to� � �¼�ID�б�
x000005_g_eventList={200502,200601,200602,200603,250508}

--�԰�״̬����
x000005_g_missionId = 12

--**********************************
--�¼��б�
--**********************************
function x000005_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
  if  (IsMissionHaveDone(sceneId,selfId,x000005_g_missionId) > 0 ) then
  			AddText(sceneId,"  Ta l� L� Hu� Khanh. Thi�u hi�p �i nh�n ph�c thi�n, t߽ng lai t�t ���c tr�ng d�ng");
	else			
			AddText(sceneId,"#{OBJ_luoyang_0002}");
	end
	for i, eventId in x000005_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x000005_OnDefaultEvent( sceneId, selfId,targetId )
	x000005_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��m�t ��
--**********************************
function x000005_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x000005_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--Ti�p th���NPCto� � ����
--**********************************
function x000005_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000005_g_eventList do
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
function x000005_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��,ҪTr� v�NPCto� � �¼��б�
	for i, findId in x000005_g_eventList do
		if missionScriptId == findId then
			x000005_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--����(�Ѿ���������)
--**********************************
function x000005_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000005_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ������to� � ����
--**********************************
function x000005_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x000005_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x000005_OnDie( sceneId, selfId, killerId )
end
