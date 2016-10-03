--��˼��

--�ű���
x002013_g_scriptId = 002013

--��ӵ��to� � �¼�ID�б�
x002013_g_eventList={}
--x002013_g_eventList={201002,201101,201102,201103}

--**********************************
--�¼��б�
--**********************************
function x002013_UpdateEventList( sceneId, selfId,targetId )
    local  PlayerName=GetName(sceneId,selfId)	
	local  PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex = " c� n߽ng "
	else
		PlayerSex = " c�c h� "
	end
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	AddText(sceneId,"  Nghe n�i � V� L��ng S�n lu�n c� B�ch Vi�n l�m h�i ng߶i. "..PlayerName..PlayerSex.." ��i m�y ng�y n�a t� ��i h� v� ch�ng ta c�ng t�i xem sao, c� th� c�n mang ���c th� g� hay hay v�");
	for i, eventId in x002013_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x002013_OnDefaultEvent( sceneId, selfId,targetId )
	x002013_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��m�t ��
--**********************************
function x002013_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x002013_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--Ti�p th���NPCto� � ����
--**********************************
function x002013_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002013_g_eventList do
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
function x002013_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��,ҪTr� v�NPCto� � �¼��б�
	for i, findId in x002013_g_eventList do
		if missionScriptId == findId then
			x002013_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--����(�Ѿ���������)
--**********************************
function x002013_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002013_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ������to� � ����
--**********************************
function x002013_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x002013_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x002013_OnDie( sceneId, selfId, killerId )
end
