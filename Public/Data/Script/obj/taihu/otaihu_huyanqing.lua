--Th�i H�NPC
--������
--��ͨ

--�ű���
x004001_g_ScriptId	= 004001

--��ӵ��to� � �¼�ID�б�
x004001_g_EventList	= { 232002 }


--**********************************
--�¼��б�
--**********************************
function x004001_UpdateEventList( sceneId, selfId, targetId )

	BeginEvent( sceneId )
		local	nam	= LuaFnGetName( sceneId, selfId )
		AddText( sceneId, "  "..nam.." , n�o t�i �i.#r" )
		for i, findId in x004001_g_EventList do
			CallScriptFunction( x004001_g_EventList[i], "OnEnumerate", sceneId, selfId, targetId )
		end
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

end

--**********************************
--�¼��������
--**********************************
function x004001_OnDefaultEvent( sceneId, selfId, targetId )
	x004001_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��m�t ��
--**********************************
function x004001_OnEventRequest( sceneId, selfId, targetId, eventId )

	for i, findId in x004001_g_EventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
			return
		end
	end

end

--**********************************
--Ti�p th���NPCto� � ����
--**********************************
function x004001_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )

	for i, findId in x004001_g_EventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			return
		end
	end

end

--**********************************
--�ܾ���NPCto� � ����
--**********************************
function x004001_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )

	--�ܾ�֮��,ҪTr� v�NPCto� � �¼��б�
	for i, findId in x004001_g_EventList do
		if missionScriptId == findId then
			x004001_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end

end

--**********************************
--����(�Ѿ���������)
--**********************************
function x004001_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )

	for i, findId in x004001_g_EventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end

end

--**********************************
--�ύ������to� � ����
--**********************************
function x004001_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )

	for i, findId in x004001_g_EventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end

end

--**********************************
--�����¼�
--**********************************
function x004001_OnDie( sceneId, selfId, killerId )
end
