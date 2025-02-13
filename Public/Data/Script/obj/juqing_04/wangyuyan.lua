--�� c� n߽ng 

--�ű���
x037002_g_ScriptId = 037002

--��ӵ��to� � �¼�ID�б�
x037002_g_eventList={200015, 200016, 200085}

--**********************************
--�¼��б�
--**********************************
function x037002_UpdateEventList( sceneId, selfId, targetId )

	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	AddText(sceneId,"#{JQ_YZW_B_002}")
	for i, eventId in x037002_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	
	--�������Ѿ������ ָ �i�mȺ��Ϸ 14,��ô��m�t c�iѡ��
	if IsMissionHaveDone( sceneId, selfId, 14 ) > 0 then  --��������C�i n�y ����
		if LuaFnGetCopySceneData_Param(sceneId, 10) == 0  then
			AddNumText( sceneId, x037002_g_ScriptId, "Ch� �i�m Qu�n H�o", 10, 999 )
		end
	end
		
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x037002_OnDefaultEvent( sceneId, selfId,targetId )
	x037002_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��m�t ��
--**********************************
function x037002_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 999  then
		--��ʼ �i�m��
		LuaFnSetCopySceneData_Param(sceneId, 10, 1)
		LuaFnSetCopySceneData_Param(sceneId, 11, GetGameTime(sceneId, selfId))
		LuaFnSetCopySceneData_Param(sceneId, 12, GetGameTime(sceneId, selfId))
		
		-- �i�m��m�t ����ʼ,�Ͳ�������m�t ����
		LuaFnSetCopySceneData_Param(sceneId, 25, 1)
		
		--�رտͻ��˽���
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId,1000)

		return
	end
	
	for i, findId in x037002_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--Ti�p th���NPCto� � ����
--**********************************
function x037002_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x037002_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId,targetId  )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId,targetId )
			end
			return
		end
	end
end

--**********************************
--�ܾ���NPCto� � ����
--**********************************
function x037002_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��,ҪTr� v�NPCto� � �¼��б�
	for i, findId in x037002_g_eventList do
		if missionScriptId == findId then
			x037002_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--����(�Ѿ���������)
--**********************************
function x037002_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x037002_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ������to� � ����
--**********************************
function x037002_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x037002_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x037002_OnDie( sceneId, selfId, killerId )
end
