--³ƽ


--�ű���
x031004_g_scriptId = 031004

--��ӵ��to� � �¼�ID�б�
x031004_g_eventList={212119}

--**********************************
--�¼��б�
--**********************************
function x031004_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"  Y�u �߽ng ham mu�n ng߶i kh�c, th�c gi�ng �u�c �i ng��c gi�, t�t c� c�i h�a b�ng tay. #r#rT� y�u t�t sinh bu�n r�u, c� y�u t�t sinh lo s�, n�u r�i xa y�u, c�n g� � bu�n � s�... #r#rTh� ch� c� hi�u ch�ng?")
	for i, eventId in x031004_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x031004_OnDefaultEvent( sceneId, selfId,targetId )
	x031004_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��m�t ��
--**********************************
function x031004_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x031004_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--Ti�p th���NPCto� � ����
--**********************************
function x031004_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x031004_g_eventList do
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
function x031004_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��,ҪTr� v�NPCto� � �¼��б�
	for i, findId in x031004_g_eventList do
		if missionScriptId == findId then
			x031004_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--����(�Ѿ���������)
--**********************************
function x031004_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x031004_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ������to� � ����
--**********************************
function x031004_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x031004_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x031004_OnDie( sceneId, selfId, killerId )
end

