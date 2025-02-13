--����NPC
--����

x050203_g_scriptId = 050203

--��ӵ��to� � �¼�ID�б�
x050203_g_eventList={050018, 050019}

--�ʱ��
x050203_g_StartDayTime = 8257   --���ʼʱ�� 2008-9-14,��������
x050203_g_EndDayTime = 8282   --�����ʱ�� 2008-10-09,��������

--**********************************
--�¼��б�
--**********************************
function x050203_UpdateEventList( sceneId, selfId, targetId )
	BeginEvent(sceneId)
		AddText( sceneId, "    C�nh � D� T�y H� th�t l� �p! N�u trong kh�ng gian n�y ma b�n th�m v�i ph�o hoa c�a ng�y l� th� th�t l� t�t." )
		if IsHaveMission(sceneId, selfId, 131) > 0 then
			CallScriptFunction( 050018, "OnEnumerate",sceneId, selfId, targetId )
		elseif IsHaveMission(sceneId, selfId, 132) > 0 then
			CallScriptFunction( 050019, "OnEnumerate",sceneId, selfId, targetId )
		else
			local randIndex = random(1, 2);
			if randIndex == 1 then
				CallScriptFunction( 050018, "OnEnumerate",sceneId, selfId, targetId )
			else
				CallScriptFunction( 050019, "OnEnumerate",sceneId, selfId, targetId )
			end
		end
		
		local check = x050203_IsMidAutumnPeriod(sceneId, selfId);
		if check and check == 1 then
			AddNumText(sceneId, x050203_g_scriptId, "Li�n quan �n th߷ng nguy�t ph�ng ph�o hoa", 11, 1);
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x050203_OnDefaultEvent( sceneId, selfId,targetId )
	x050203_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��m�t ��
--**********************************
function x050203_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x050203_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
	
	local num = GetNumText()
	if num == 1 then
		BeginEvent(sceneId);
			AddText( sceneId, "#{FANGYIANHUA_ABOUT}");
		EndEvent(sceneId);
		DispatchEventList(sceneId, selfId, targetId);
		return
	end
end

--**********************************
--Ti�p th���NPCto� � ����
--**********************************
function x050203_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x050203_g_eventList do
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
function x050203_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��,ҪTr� v�NPCto� � �¼��б�
	for i, findId in x050203_g_eventList do
		if missionScriptId == findId then
			x050203_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--����(�Ѿ���������)
--**********************************
function x050203_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x050203_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ������to� � ����
--**********************************
function x050203_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x050203_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x050203_OnDie( sceneId, selfId, killerId )
end

--**********************************
--���ng��M� ra 
--**********************************
function x050203_IsMidAutumnPeriod(sceneId, selfId)
	local curDay = GetDayTime();
	if not curDay then
		return 0;
	end

	if curDay < x050203_g_StartDayTime or curDay > x050203_g_EndDayTime then
		return 0;
	end

	return 1
end
