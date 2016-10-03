--����̩

--�ű���
x002018_g_scriptId = 002018


--��ӵ��to� � �¼�ID�б�
x002018_g_eventList={}
--x002018_g_eventList={200301,200302}

--**********************************
--�¼��б�
--**********************************
function x002018_UpdateEventList( sceneId, selfId,targetId )
    local  PlayerName=GetName(sceneId,selfId)	
	local  PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex = " c� n߽ng "
	else
		PlayerSex = " c�c h� "
	end
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	AddText(sceneId,"  Hi�n c� r�t nhi�u nh�n s� v� l�m t�p h�p � ��i L� th�nh,"..PlayerName..PlayerSex..", n�u ng߽i mu�n l�m g� cho tri�u ��nh, h�y �i t�m L� C�ng B� � Ng� Hoa ��n. �ng ta s� giao vi�c cho ng߽i. L�m vi�c cho tri�u ��nh s� ���c t�ng th߷ng")
	--�Ĵ���˴˴�ǰ����i L�,��֪�к���ͼ,���ܶ���֮,����ng����.");
	for i, eventId in x002018_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x002018_OnDefaultEvent( sceneId, selfId,targetId )
	x002018_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��m�t ��
--**********************************
function x002018_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x002018_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--Ti�p th���NPCto� � ����
--**********************************
function x002018_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002018_g_eventList do
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
function x002018_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��,ҪTr� v�NPCto� � �¼��б�
	for i, findId in x002018_g_eventList do
		if missionScriptId == findId then
			x002018_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--����(�Ѿ���������)
--**********************************
function x002018_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002018_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ������to� � ����
--**********************************
function x002018_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x002018_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x002018_OnDie( sceneId, selfId, killerId )
end
