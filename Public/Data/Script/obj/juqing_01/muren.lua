--��ٹ�ľ������

--�ű���
x119001_g_scriptId = 119001

--��ӵ��to� � �¼�ID�б�
x119001_g_eventList={}

--**********************************
--�¼��б�
--**********************************
function x119001_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	
		AddText(sceneId,"#{JQ_WJG_Y_002}")
		AddNumText(sceneId, x119001_g_scriptId,"��a ta v�o trong",9,0);
		AddNumText(sceneId, x119001_g_scriptId,"��a ta t�i ��i L�",9,1);

	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x119001_OnDefaultEvent( sceneId, selfId,targetId )
	x119001_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��m�t ��
--**********************************
function x119001_OnEventRequest( sceneId, selfId, targetId, eventId )
	if	GetNumText()==0	then
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, sceneId,104,77)
	elseif GetNumText()==1	then
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 2,74,53)
	end
end

--**********************************
--Ti�p th���NPCto� � ����
--**********************************
function x119001_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x119001_g_eventList do
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
function x119001_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��,ҪTr� v�NPCto� � �¼��б�
	for i, findId in x119001_g_eventList do
		if missionScriptId == findId then
			x119001_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--����(�Ѿ���������)
--**********************************
function x119001_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x119001_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ������to� � ����
--**********************************
function x119001_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x119001_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x119001_OnDie( sceneId, selfId, killerId )
end
