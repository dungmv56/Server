--C�i BangNPC  ѧϰ��Ƽ���
--Ng� Tr߶ng Phong
--��ͨ

--�ű���
x010006_g_ScriptId = 010006

--��ӵ��to� � �¼�
--estudy_niangjiu = 713514
--elevelup_niangjiu = 713573
--edialog_niangjiu = 713613

--��ӵ��to� � �¼�ID�б�
x010006_g_eventList={713514,713573,701606}	

--**********************************
--�¼��б�
--**********************************
function x010006_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"K� n�ng c�a ta ch� d�y � t� b�n ph�i.")
	for i, eventId in x010006_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	AddNumText( sceneId, x010006_g_ScriptId, "Gi�i thi�u c�ch n�u r��u", 11, 100 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x010006_OnDefaultEvent( sceneId, selfId,targetId )
	x010006_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��m�t ��
--**********************************
function x010006_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 100 then
		BeginEvent( sceneId )
			AddText( sceneId, "#{function_help_025}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end

	for i, findId in x010006_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x010006_g_ScriptId )
			return
		end
	end
end

--**********************************
--Ti�p th���NPCto� � ����
--**********************************
function x010006_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x010006_g_eventList do
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
function x010006_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��,ҪTr� v�NPCto� � �¼��б�
	for i, findId in x010006_g_eventList do
		if missionScriptId == findId then
			x010006_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--����(�Ѿ���������)
--**********************************
function x010006_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x010006_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ������to� � ����
--**********************************
function x010006_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x010006_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x010006_OnDie( sceneId, selfId, killerId )
end
