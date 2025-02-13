--��n Ho�ngNPC
--C�u Ma Tr�
--��ͨ

--�ű���
x008011_g_scriptId = 008011

--��ӵ��to� � �¼�ID�б�
x008011_g_eventList={200099,200100}

x008011_g_RSMissionId = 101
x008011_g_ActivateMissionId = 37			-- ��������
x008011_g_SongXinScriptId = 006668		-- ����
x008011_g_ShaGuaiScriptId = 006666		-- ɱ��
x008011_g_XunWuScriptId = 006667			-- Ѱ��

x008011_g_RoundStorytelling = {
		[0] = { misIndex = { 1039550 }, script = x008011_g_XunWuScriptId },
		[1] = { misIndex = { 1039551 }, script = x008011_g_XunWuScriptId },
		[2] = { misIndex = { 1039552 }, script = x008011_g_XunWuScriptId },
		[3] = { misIndex = { 1039553 }, script = x008011_g_XunWuScriptId },
		[4] = { misIndex = { 1039554 }, script = x008011_g_XunWuScriptId }}
			
x008011_g_SongXinMissionList = {
		[0] = { misIndex = { 1018530,1018534,1018538 }, script = x008011_g_SongXinScriptId },
		[1] = { misIndex = { 1018531,1018535,1018539 }, script = x008011_g_SongXinScriptId },
		[2] = { misIndex = { 1018532,1018536,1018540 }, script = x008011_g_SongXinScriptId },
		[3] = { misIndex = { 1018533,1018537,1018541 }, script = x008011_g_SongXinScriptId }}
			
x008011_g_ShaGuaiMissionList = {
		[0] = { misIndex = { 1009100 }, script = x008011_g_ShaGuaiScriptId },
		[1] = { misIndex = { 1009101 }, script = x008011_g_ShaGuaiScriptId },
		[2] = { misIndex = { 1009102 }, script = x008011_g_ShaGuaiScriptId },
		[3] = { misIndex = { 1009103 }, script = x008011_g_ShaGuaiScriptId }}
			

--**********************************
--�¼��б�
--**********************************
function x008011_UpdateEventList( sceneId, selfId,targetId )
	
	local PlayerName = GetName( sceneId, selfId )
	local PlayerSex = GetSex( sceneId, selfId )
	if PlayerSex == 0 then
		PlayerSex = " c� n߽ng "
	else
		PlayerSex = " c�c h� "
	end

	BeginEvent( sceneId )
		AddText(sceneId,"  Th� ch� phong tr�n �߶ng xa �n Ng�c M�n Quan l� � �i n߾c T�y H� ch�ng? Th� l�i cho ti�u t�ng n�i n�ng th�ng th�n, �n �߶ng c�a th� ch� t�i m�u, l�n n�y �i T�y H� �t h�n l�nh �t d� nhi�u, t�t nh�t l� n�n s�m quay v� Trung Nguy�n, m�i l� k� v�n to�n")

		local missionIndex = GetScriptIDByMissionID( sceneId, selfId, x008011_g_RSMissionId )
		if missionIndex ~= -1 then
			local missionName = TGetMissionName( missionIndex )
			if missionName ~= "C�u Ma Tr�����" and IsMissionHaveDone( sceneId, selfId, x008011_g_ActivateMissionId ) > 0 then
				AddNumText( sceneId, x008011_g_scriptId, "C�u Ma Tr�����", 3, 1 )
			end
		elseif IsMissionHaveDone( sceneId, selfId, x008011_g_ActivateMissionId ) > 0 then
			AddNumText( sceneId, x008011_g_scriptId, "C�u Ma Tr�����", 3, 1 )
		end

		for i, eventId in x008011_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate", sceneId, selfId, targetId )
		end
					
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
	
end

--**********************************
--�¼��������
--**********************************
function x008011_OnDefaultEvent( sceneId, selfId,targetId )
	x008011_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��m�t ��
--**********************************
function x008011_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x008011_g_eventList do
		if eventId == findId then			
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
		
	local num = GetNumText()
	if num == 1 then										-- C�u Ma Tr�����
		if IsHaveMission( sceneId, selfId, x008011_g_RSMissionId ) > 0 then
			x008011_NotifyFailBox( sceneId, selfId, targetId, "    , c�c h� c� nhi�m v� ch�a ho�n th�nh, ��i ho�n th�nh xong l�i �n t�m t�i h�." )
			return
		end
		
		-- �����ng��Th�a m�n���񼤻�����
		if IsMissionHaveDone( sceneId, selfId, x008011_g_ActivateMissionId ) <= 0 then
			return 0
		end
		
		--���½���to� � C�u Ma Tr�������ng����ng����50����
		--begin modified by zhangguoxin 090208
		local nDayCount = GetMissionData(sceneId, selfId, MD_JQXH_JIUMOZHI_LIMITI)
		local nCount = 		floor(nDayCount/100000)
		local nTime = 		mod(nDayCount,100000)
		--local nDayTime = 	floor(nTime/100)	--��m�t �ν�����to� � ʱ��(����)
		local nDayTime = 	nTime								--��m�t �ν�����to� � ʱ��(����)
		
		--local CurTime = GetHourTime()				--��ǰʱ��
		local CurTime = GetDayTime()					--��ǰʱ��
		--local CurDaytime = floor(CurTime/100)	--��ǰʱ��(��)
		local CurDaytime = CurTime							--��ǰʱ��(��)
		--end modified by zhangguoxin 090208
		
		if nDayTime == CurDaytime  then -- ����
			if nCount >= 50  then
				BeginEvent( sceneId )
					AddText( sceneId, "  H�m nay c�c h� �� g�p qu� nhi�u chuy�n phi�n ph�c r�i, th�t xin l�i, ng�y mai m�i l�m phi�n c�c h� n�a v�y!" )
				EndEvent( sceneId )
				DispatchEventList( sceneId, selfId, targetId )
				return
			end
			
		else		-- ��to� � m�t ��
			SetMissionData(sceneId, selfId, MD_JQXH_JIUMOZHI_LIMITI, 0)
		end

		local mission = x008011_g_RoundStorytelling[0];
		local relation = GetMissionData(sceneId, selfId, MD_RELATION_JIUMOZHI)
		local playerlevel = GetLevel( sceneId, selfId )
		
		-- ��c�p���޴���
		if playerlevel >= 100 then
			playerlevel = 90
		end
		
		playerlevel = floor( playerlevel / 10 ) * 10
		local randtype = random(100)
		
		-- ��������
		if randtype <= 60 then
			if playerlevel == 60 then
				mission = x008011_g_SongXinMissionList[0];
			elseif playerlevel == 70 then
				mission = x008011_g_SongXinMissionList[1];
			elseif playerlevel == 80 then
				mission = x008011_g_SongXinMissionList[2];
			elseif playerlevel == 90 then
				mission = x008011_g_SongXinMissionList[3];			
			end
		-- ɱ������
		elseif randtype <= 95 then
			if playerlevel == 60 then
				mission = x008011_g_ShaGuaiMissionList[0];
			elseif playerlevel == 70 then
				mission = x008011_g_ShaGuaiMissionList[1];
			elseif playerlevel == 80 then
				mission = x008011_g_ShaGuaiMissionList[2];
			elseif playerlevel == 90 then
				mission = x008011_g_ShaGuaiMissionList[3];			
			end
		-- Ѱ������
		elseif randtype <= 100 then
			if relation <= 999 then
				mission = x008011_g_RoundStorytelling[0];
			elseif relation <= 1999 then
				mission = x008011_g_RoundStorytelling[1];
			elseif relation <= 3999 then
				mission = x008011_g_RoundStorytelling[2];
			elseif relation <= 6499 then
				mission = x008011_g_RoundStorytelling[3];
			elseif relation <= 9999 then
				mission = x008011_g_RoundStorytelling[4];
			end
		end
				
		CallScriptFunction( mission.script, "OnDefaultEvent", sceneId, selfId, targetId, mission.misIndex[ random( getn(mission.misIndex) ) ] )		
		
		return
	end	
	
end

--**********************************
--Ti�p th���NPCto� � ����
--**********************************
function x008011_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x008011_g_eventList do
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
function x008011_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��,ҪTr� v�NPCto� � �¼��б�
	for i, findId in x008011_g_eventList do
		if missionScriptId == findId then
			x008011_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end	
end

--**********************************
--����(�Ѿ���������)
--**********************************
function x008011_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x008011_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end	
end

--**********************************
--�ύ������to� � ����
--**********************************
function x008011_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x008011_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end	
end

--**********************************
--�����¼�
--**********************************
function x008011_OnDie( sceneId, selfId, killerId )
end

--**********************************
-- �Ի�������Ϣ��ʾ
--**********************************
function x008011_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--�ύ��Ʒ
--**********************************
function x008011_OnMissionCheck( sceneId, selfId, targetId, scriptId, index1, index2, index3, indexpet, missionIndex )
	
	for i, eventId in x008011_g_XunWuScriptId do
		
		if eventId == scriptId then
			CallScriptFunction( scriptId, "OnMissionCheck", sceneId, selfId, targetId, scriptId, index1, index2, index3, indexpet, missionIndex )
			return 1
		end
	end
		
end
