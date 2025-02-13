--Th�nh ph� NPC
--��ҵ��Ա

x805017_g_scriptId = 805017
x805017_g_BuildingID12 = 9

--��ӵ��to� � �¼�ID�б�
x805017_g_eventList = { 600017 }

-- �����¼� ID �б�,�����¼��������¼�
x805017_g_eventSetList = { 600017 }

--**********************************
--�¼��б�
--**********************************
function x805017_UpdateEventList( sceneId, selfId, targetId )
	local i = 1
	local eventId = 0
	local PlayerName = GetName( sceneId, selfId )

	local Humanguildid 	= GetHumanGuildID(sceneId,selfId)
	local cityguildid 	= GetCityGuildID(sceneId, selfId, sceneId)

	BeginEvent( sceneId )
		if Humanguildid == cityguildid then
			AddText( sceneId, "    Ta t� tr߾c t�i nay coi ��o Chu C�ng l� t�n s�, con �߶ng bu�n b�n, hai huynh � ta c� th� c�ng nhau nghi�n c�u" )
			for i, eventId in x805017_g_eventList do
				CallScriptFunction( eventId, "OnEnumerate", sceneId, selfId, targetId )
			end
			AddNumText( sceneId, x805017_g_scriptId, "Gi�i thi�u nhi�m v� th� t�p", 11, 1 )
			AddNumText( sceneId, x805017_g_scriptId, "Qu�n l� v�ng th߽ng nghi�p", 6, 3 )
			AddNumText( sceneId, x805017_g_scriptId, "Gi�i thi�u th� ph߶ng", 11, 2 )
			--life ����C�i n�y ������to� � ��Ӧ�����ѡ��
			CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "AddCityLifeAbilityOpt",sceneId, selfId, x805017_g_scriptId,x805017_g_BuildingID12,888)
		else
			AddText( sceneId, "    Kh�ng ph�i l� ng߶i c�a bang ta, suy ngh� c�a h� ch�c ch�n ph�i �c bi�t, th߽ng tr߶ng nh� chi�n tr߶ng, ta t�t nh�t kh�ng n�n nhi�u l�i v�n l� h�n" )
		end
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��������
--**********************************
function x805017_OnDefaultEvent( sceneId, selfId, targetId )
	x805017_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
-- �ж�ĳc�i�¼���ng�����ͨ���� NPC ִ��
--**********************************
function x805017_IsValidEvent( sceneId, selfId, eventId )
	local i = 1
	local findId = 0
	local bValid = 0

	for i, findId in x805017_g_eventList do
		if eventId == findId then
			bValid = 1
			break
		end
	end

	if bValid == 0 then
		for i, findId in x805017_g_eventSetList do
			if CallScriptFunction( findId, "IsInEventList", sceneId, selfId, eventId ) == 1 then
				bValid = 1
				break
			end
		end
	end

	return bValid
end

--**********************************
--�¼��б�ѡ��m�t ��
--**********************************
function x805017_OnEventRequest( sceneId, selfId, targetId, eventId )
	if x805017_IsValidEvent( sceneId, selfId, eventId ) == 1 then
		CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
		return
	--life ����C�i n�y ������to� � ��Ӧ�����ѡ��
	elseif eventId ~= x805017_g_scriptId then
		CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnDefaultEvent",sceneId, selfId, targetId, eventId, x805017_g_scriptId, x805017_g_BuildingID12 )
		return
	end
	if GetNumText() == 1 then
		BeginEvent(sceneId)
		AddText( sceneId, "#{City_Market_Mission_Help}" )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 2 then
		BeginEvent(sceneId)
			AddText( sceneId, "#{City_Intro_JiFang}" )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 3 then
		BeginEvent(sceneId)
			AddText( sceneId, "Ch�c n�ng n�y s�p ���c th�c hi�n" )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 888 then
		BeginEvent(sceneId)
		--life ����C�i n�y ������to� � ��Ӧ�����ѡ��
		CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnEnumerate",sceneId, selfId, targetId, x805017_g_BuildingID12 )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
	end
end

--**********************************
--Ti�p th���NPCto� � ����
--**********************************
function x805017_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	if x805017_IsValidEvent( sceneId, selfId, missionScriptId ) == 1 then
		local ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
		if ret > 0 then
			CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId, targetId )
		elseif ret == -1 then
			x805017_NotifyFailTips( sceneId, selfId, "Ng߽i hi�n kh�ng th� nh�n nhi�m v� n�y" )
		elseif ret == -2 then
			x805017_NotifyFailTips( sceneId, selfId, "Kh�ng th� ti�p nh�n nhi�u nhi�m v�" )
		end

		return
	end
end

--**********************************
--�ܾ���NPCto� � ����
--**********************************
function x805017_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	if x805017_IsValidEvent( sceneId, selfId, missionScriptId ) == 1 then
		x805017_UpdateEventList( sceneId, selfId, targetId )
		return
	end
end

--**********************************
--����(�Ѿ���������)
--**********************************
function x805017_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	if x805017_IsValidEvent( sceneId, selfId, missionScriptId ) == 1 then
		CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
		return
	end
end

--**********************************
--�ύ������to� � ����
--**********************************
function x805017_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	if x805017_IsValidEvent( sceneId, selfId, missionScriptId ) == 1 then
		CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
		return
	end
end

--**********************************
--�����¼�
--**********************************
function x805017_OnDie( sceneId, selfId, killerId )
end

function x805017_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
