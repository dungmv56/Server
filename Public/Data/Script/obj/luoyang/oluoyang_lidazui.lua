--��i L�NPC		���   1��⿼���ѧϰ 2��⿼���� �i�m�
--�����
--��ͨ

--�ű���
x000107_g_ScriptId = 000107

--��ӵ��to� � �¼�Id�б�
--elevelup_pengren = 713561
--edialog_pengren = 713601
--��ӵ��to� � �¼�ID�б�
x000107_g_eventList={713561,250505}--,713601
--**********************************
--�¼��б�
--**********************************
function x000107_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"  Mu�n h�c v� n�ng cao k� n�ng n�u n߾ng, h�y th߶ng xuy�n t�i ch� ta, luy�n t�p kh�ng ng�ng, nh� v�y tr�nh � n�u n߾ng th�nh th�o v� k� n�ng n�u n߾ng c�a ng߽i m�i c� th� n�ng cao")
	AddText(sceneId,"  �n v�o th�ng c�p k� n�ng n�u n߾ng, c�c h� c� th� h�c ���c k� thu�t n�u n߾ng � c�p cao h�n")
	for i, eventId in x000107_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	AddNumText( sceneId, x000107_g_ScriptId, "Gi�i thi�u n�u n߾ng", 11, 100 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x000107_OnDefaultEvent( sceneId, selfId,targetId )
	x000107_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��m�t ��
--**********************************
function x000107_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 100 then
		BeginEvent( sceneId )
			AddText( sceneId, "#{function_help_001}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end

	for i, findId in x000107_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x000107_g_ScriptId )
			return
		end
	end
end

--**********************************
--Ti�p th���NPCto� � ����
--**********************************
function x000107_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000107_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId,ABILITY_PENGREN )
			end
			return
		end
	end
end

--**********************************
--�ܾ���NPCto� � ����
--**********************************
function x000107_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��,ҪTr� v�NPCto� � �¼��б�
	for i, findId in x000107_g_eventList do
		if missionScriptId == findId then
			x000107_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--����(�Ѿ���������)
--**********************************
function x000107_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000107_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ������to� � ����
--**********************************
function x000107_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x000107_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x000107_OnDie( sceneId, selfId, killerId )
end
