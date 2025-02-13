--Ҷ����

--�ű���
x002003_g_scriptId = 002003

--��ӵ��to� � �¼�ID�б�
x002003_g_eventList={200099,200100}
--x002003_g_eventList={201001,201002,201101,201102,201202,201301}	

x002003_g_RSMissionId = 101
x002003_g_ActivateMissionId = 37			-- ��������
x002003_g_SongXinScriptId = 006668		-- ����
x002003_g_ShaGuaiScriptId = 006666		-- ɱ��
x002003_g_XunWuScriptId = 006667			-- Ѱ��

x002003_g_RoundStorytelling = {
		[0] = { misIndex = { 1039650 }, script = x002003_g_XunWuScriptId },
		[1] = { misIndex = { 1039651 }, script = x002003_g_XunWuScriptId },
		[2] = { misIndex = { 1039652 }, script = x002003_g_XunWuScriptId },
		[3] = { misIndex = { 1039653 }, script = x002003_g_XunWuScriptId },
		[4] = { misIndex = { 1039654 }, script = x002003_g_XunWuScriptId }}
			
x002003_g_SongXinMissionList = {
		[0] = { misIndex = { 1018300,1018304,1018308 }, script = x002003_g_SongXinScriptId },
		[1] = { misIndex = { 1018301,1018305,1018309 }, script = x002003_g_SongXinScriptId },
		[2] = { misIndex = { 1018302,1018306,1018310 }, script = x002003_g_SongXinScriptId },
		[3] = { misIndex = { 1018303,1018307,1018311 }, script = x002003_g_SongXinScriptId }}
					
x002003_g_ShaGuaiMissionList = {
		[0] = { misIndex = { 1009000,1009004,1009008,1009012,1009016,1009020,1009024 }, script = x002003_g_ShaGuaiScriptId },
		[1] = { misIndex = { 1009001,1009005,1009009,1009013,1009017,1009021,1009025 }, script = x002003_g_ShaGuaiScriptId },
		[2] = { misIndex = { 1009002,1009006,1009010,1009014,1009018,1009022,1009026 }, script = x002003_g_ShaGuaiScriptId },
		[3] = { misIndex = { 1009003,1009007,1009011,1009015,1009019,1009023,1009027 }, script = x002003_g_ShaGuaiScriptId }}
			

--**********************************
--�¼��б�
--**********************************
function x002003_UpdateEventList( sceneId, selfId,targetId )
  
	local PlayerName = GetName( sceneId, selfId )
	local PlayerSex = GetSex( sceneId, selfId )
	if PlayerSex == 0 then
		PlayerSex = " c� n߽ng"
	else
		PlayerSex = " c�c h�"
	end

	BeginEvent( sceneId )
		AddText(sceneId,"  "..PlayerName..PlayerSex..", ta l�ng l� nh�n ng߽i �i �i l�i l�i trong th�nh ��i L�, v�i v�i v�ng v�ng. L�c n�o c�ng kh�ng n�n n�i l�ng m�nh mu�n h�i ng߽i, nh�ng vi�c ng߽i l�m, �� l� v� b�n th�n ng߽i hay l� v� ng߶i kh�c?");

		local missionIndex = GetScriptIDByMissionID( sceneId, selfId, x002003_g_RSMissionId )
		if missionIndex ~= -1 then
			local missionName = TGetMissionName( missionIndex )
			if missionName ~= "Nh�n nhi�m v�" and IsMissionHaveDone( sceneId, selfId, x002003_g_ActivateMissionId ) > 0 then
				AddNumText( sceneId, x002003_g_scriptId, "Nh�n nhi�m v�", 3, 1 )
			end
		elseif IsMissionHaveDone( sceneId, selfId, x002003_g_ActivateMissionId ) > 0 then
			AddNumText( sceneId, x002003_g_scriptId, "Nh�n nhi�m v�", 3, 1 )
		end

		for i, eventId in x002003_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate", sceneId, selfId, targetId )
		end
					
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
	
end

--**********************************
--�¼��������
--**********************************
function x002003_OnDefaultEvent( sceneId, selfId,targetId )
	x002003_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��m�t ��
--**********************************
function x002003_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x002003_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
		
	local num = GetNumText()
	if num == 1 then										-- H� Tr�c����
		if IsHaveMission( sceneId, selfId, x002003_g_RSMissionId ) > 0 then
			x002003_NotifyFailBox( sceneId, selfId, targetId, "    B�n v�n c�n nhi�m v� anh h�ng li�n quan (nhi�n v� k�ch t�nh) v�n ch�a ho�n th�nh, h�y mau ch�ng ho�n th�nh sau �� �n g�p ta." )
			return
		end
		
		-- �����ng��Th�a m�n���񼤻�����
		if IsMissionHaveDone( sceneId, selfId, x002003_g_ActivateMissionId ) <= 0 then
			return 0
		end
		
		--���½���to� � H� Tr�c������ng����ng����50����
		--begin modified by zhangguoxin 090208
		local nDayCount = GetMissionData(sceneId, selfId, MD_JQXH_XUZHU_LIMITI)
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
					AddText( sceneId, "  H�m nay b�n �� kh�ng ho�n th�nh ���c nhi�m v�, xin l�i ng߽i h�y quay l�i v�o ng�y mai." )
				EndEvent( sceneId )
				DispatchEventList( sceneId, selfId, targetId )
				return
			end
			
		else		-- ��to� � m�t ��
			SetMissionData(sceneId, selfId, MD_JQXH_XUZHU_LIMITI, 0)
		end

		local mission = x002003_g_RoundStorytelling[0];
		local relation = GetMissionData(sceneId, selfId, MD_RELATION_XUZHU)
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
				mission = x002003_g_SongXinMissionList[0];
			elseif playerlevel == 70 then
				mission = x002003_g_SongXinMissionList[1];
			elseif playerlevel == 80 then
				mission = x002003_g_SongXinMissionList[2];
			elseif playerlevel == 90 then
				mission = x002003_g_SongXinMissionList[3];			
			end
		-- ɱ������
		elseif randtype <= 95 then
			if playerlevel == 60 then
				mission = x002003_g_ShaGuaiMissionList[0];
			elseif playerlevel == 70 then
				mission = x002003_g_ShaGuaiMissionList[1];
			elseif playerlevel == 80 then
				mission = x002003_g_ShaGuaiMissionList[2];
			elseif playerlevel == 90 then
				mission = x002003_g_ShaGuaiMissionList[3];			
			end
		-- Ѱ������
		elseif randtype <= 100 then
			if relation <= 999 then
				mission = x002003_g_RoundStorytelling[0];
			elseif relation <= 1999 then
				mission = x002003_g_RoundStorytelling[1];
			elseif relation <= 3999 then
				mission = x002003_g_RoundStorytelling[2];
			elseif relation <= 6499 then
				mission = x002003_g_RoundStorytelling[3];
			elseif relation <= 9999 then
				mission = x002003_g_RoundStorytelling[4];
			end
		end
				
		CallScriptFunction( mission.script, "OnDefaultEvent", sceneId, selfId, targetId, mission.misIndex[ random( getn(mission.misIndex) ) ] )		
		
		return
	end	
	
end

--**********************************
--Ti�p th���NPCto� � ����
--**********************************
function x002003_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002003_g_eventList do
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
function x002003_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��,ҪTr� v�NPCto� � �¼��б�
	for i, findId in x002003_g_eventList do
		if missionScriptId == findId then
			x002003_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--����(�Ѿ���������)
--**********************************
function x002003_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002003_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ������to� � ����
--**********************************
function x002003_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x002003_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x002003_OnDie( sceneId, selfId, killerId )
end

--**********************************
-- �Ի�������Ϣ��ʾ
--**********************************
function x002003_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--�ύ��Ʒ
--**********************************
function x002003_OnMissionCheck( sceneId, selfId, targetId, scriptId, index1, index2, index3, indexpet, missionIndex )
	
	for i, eventId in x002003_g_XunWuScriptId do
		
		if eventId == scriptId then
			CallScriptFunction( scriptId, "OnMissionCheck", sceneId, selfId, targetId, scriptId, index1, index2, index3, indexpet, missionIndex )
			return 1
		end
	end
		
end
