--��Linh

--�ű���
x006001_g_scriptId = 006001

--��ӵ��to� � �¼�ID�б�
x006001_g_eventList={200099,200100}		--200901,200911,200921,201812

x006001_g_RSMissionId = 101
x006001_g_ActivateMissionId = 8			-- ��������
x006001_g_SongXinScriptId = 006668		-- ����
x006001_g_ShaGuaiScriptId = 006666		-- ɱ��
x006001_g_XunWuScriptId = 006667		-- Ѱ��

x006001_g_RoundStorytelling = {
		[0] = { misIndex = { 1039600 }, script = x006001_g_XunWuScriptId },
		[1] = { misIndex = { 1039601 }, script = x006001_g_XunWuScriptId },
		[2] = { misIndex = { 1039602 }, script = x006001_g_XunWuScriptId },
		[3] = { misIndex = { 1039603 }, script = x006001_g_XunWuScriptId },
		[4] = { misIndex = { 1039604 }, script = x006001_g_XunWuScriptId }}
			
x006001_g_SongXinMissionList = {
		[0] = { misIndex = { 1018360 }, script = x006001_g_SongXinScriptId },
		[1] = { misIndex = { 1018361 }, script = x006001_g_SongXinScriptId },
		[2] = { misIndex = { 1018362 }, script = x006001_g_SongXinScriptId },
		[3] = { misIndex = { 1018363 }, script = x006001_g_SongXinScriptId },
		[4] = { misIndex = { 1018364 }, script = x006001_g_SongXinScriptId },
		[5] = { misIndex = { 1018365 }, script = x006001_g_SongXinScriptId },
		[6] = { misIndex = { 1018366 }, script = x006001_g_SongXinScriptId },
		[7] = { misIndex = { 1018367 }, script = x006001_g_SongXinScriptId }}
			
x006001_g_ShaGuaiMissionList = {
		[0] = { misIndex = { 1039605 }, script = x006001_g_XunWuScriptId },
		[1] = { misIndex = { 1039606 }, script = x006001_g_XunWuScriptId },
		[2] = { misIndex = { 1039607 }, script = x006001_g_XunWuScriptId },
		[3] = { misIndex = { 1039608 }, script = x006001_g_XunWuScriptId },
		[4] = { misIndex = { 1039609 }, script = x006001_g_XunWuScriptId },
		[5] = { misIndex = { 1039610 }, script = x006001_g_XunWuScriptId },
		[6] = { misIndex = { 1039611 }, script = x006001_g_XunWuScriptId },
		[7] = { misIndex = { 1039612 }, script = x006001_g_XunWuScriptId }}


--**********************************
--�¼��б�
--**********************************
function x006001_UpdateEventList( sceneId, selfId,targetId )

	local PlayerName = GetName( sceneId, selfId )
	local PlayerSex = GetSex( sceneId, selfId )
	if PlayerSex == 0 then
		PlayerSex = " c� n߽ng "
	else
		PlayerSex = " c�c h� "
	end

	BeginEvent( sceneId )
		AddText(sceneId,"  Ng߶i ta b� tr�ng �c, kh�ng th� ch�y �i ch�y l�i ���c n�a m�. Kh�ng bi�t �o�n ca ca c� t�m ���c m� c�a m�nh kh�ng n�a, t�i sao �n gi� n�y v�n ch�a th�y �n c�u m�nh!");

		local missionIndex = GetScriptIDByMissionID( sceneId, selfId, x006001_g_RSMissionId )
		if missionIndex ~= -1 then
			local missionName = TGetMissionName( missionIndex )
			if missionName ~= "Nhi�m V� Chung Linh" and IsMissionHaveDone( sceneId, selfId, x006001_g_ActivateMissionId ) > 0 then
				AddNumText( sceneId, x006001_g_scriptId, "Nhi�m V� Chung Linh", 3, 1 )
			end
		elseif IsMissionHaveDone( sceneId, selfId, x006001_g_ActivateMissionId ) > 0 then
			AddNumText( sceneId, x006001_g_scriptId, "Nhi�m V� Chung Linh", 3, 1 )
		end

		for _, eventId in x006001_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate", sceneId, selfId, targetId )
		end
					
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
		
end

--**********************************
--�¼��������
--**********************************
function x006001_OnDefaultEvent( sceneId, selfId,targetId )
	x006001_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��m�t ��
--**********************************
function x006001_OnEventRequest( sceneId, selfId, targetId, eventId )
		
	for _, findId in x006001_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
			return
		end
	end
	
	local num = GetNumText()
	if num == 1 then										-- Nhi�m V� Chung Linh
		if IsHaveMission( sceneId, selfId, x006001_g_RSMissionId ) > 0 then
			x006001_NotifyFailBox( sceneId, selfId, targetId, "    Ah, ng߽i �ang th�c hi�n nhi�m v� (Nhi�m v� tu�n ho�n k�ch t�nh), sau khi ho�n th�nh h�y �n t�m ta." )
			return
		end
		
		-- �����ng��Th�a m�n���񼤻�����
		if IsMissionHaveDone( sceneId, selfId, x006001_g_ActivateMissionId ) <= 0 then
			return 0
		end
		
		--���½���to� � Nhi�m V� Chung Linh��ng����ng����50����
		--begin modified by zhangguoxin 090208
		local nDayCount = GetMissionData(sceneId, selfId, MD_JQXH_ZHONGLING_LIMITI)
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
					AddText( sceneId, "  Ng�y h�m nay �� phi�n ph�c ng߽i nhi�u r�i, th�t s� �y n�y, ng�y mai quay l�i ��y!" )
				EndEvent( sceneId )
				DispatchEventList( sceneId, selfId, targetId )
				return
			end
			
		else		-- ��to� � m�t ��
			SetMissionData(sceneId, selfId, MD_JQXH_ZHONGLING_LIMITI, 0)
		end

		local mission = x006001_g_RoundStorytelling[0];
		local relation = GetMissionData(sceneId, selfId, MD_RELATION_ZHONGLING)
		local playerlevel = GetLevel( sceneId, selfId )
		
		-- ��c�p���޴���
		if playerlevel >= 100 then
			playerlevel = 90
		end
		
		playerlevel = floor( playerlevel / 10 ) * 10
		local randtype = random(100)
		
		-- ��������
		if randtype <= 60 then
			if playerlevel == 20 then
				mission = x006001_g_SongXinMissionList[0];
			elseif playerlevel == 30 then
				mission = x006001_g_SongXinMissionList[1];
			elseif playerlevel == 40 then
				mission = x006001_g_SongXinMissionList[2];
			elseif playerlevel == 50 then
				mission = x006001_g_SongXinMissionList[3];
			elseif playerlevel == 60 then
				mission = x006001_g_SongXinMissionList[4];
			elseif playerlevel == 70 then
				mission = x006001_g_SongXinMissionList[5];
			elseif playerlevel == 80 then
				mission = x006001_g_SongXinMissionList[6];
			elseif playerlevel == 90 then
				mission = x006001_g_SongXinMissionList[7];
			end
		-- ɱ������
		elseif randtype <= 95 then
			if playerlevel == 20 then
				mission = x006001_g_ShaGuaiMissionList[0];
			elseif playerlevel == 30 then
				mission = x006001_g_ShaGuaiMissionList[1];
			elseif playerlevel == 40 then
				mission = x006001_g_ShaGuaiMissionList[2];
			elseif playerlevel == 50 then
				mission = x006001_g_ShaGuaiMissionList[3];
			elseif playerlevel == 60 then
				mission = x006001_g_ShaGuaiMissionList[4];
			elseif playerlevel == 70 then
				mission = x006001_g_ShaGuaiMissionList[5];
			elseif playerlevel == 80 then
				mission = x006001_g_ShaGuaiMissionList[6];
			elseif playerlevel == 90 then
				mission = x006001_g_ShaGuaiMissionList[7];
			end
		-- Ѱ������
		elseif randtype <= 100 then
			if relation <= 999 then
				mission = x006001_g_RoundStorytelling[0];
			elseif relation <= 1999 then
				mission = x006001_g_RoundStorytelling[1];
			elseif relation <= 3999 then
				mission = x006001_g_RoundStorytelling[2];
			elseif relation <= 6499 then
				mission = x006001_g_RoundStorytelling[3];
			elseif relation <= 9999 then
				mission = x006001_g_RoundStorytelling[4];
			end
		end
				
		CallScriptFunction( mission.script, "OnDefaultEvent", sceneId, selfId, targetId, mission.misIndex[ random( getn(mission.misIndex) ) ] )		
		
		return
	end	
	
end

--**********************************
--Ti�p th���NPCto� � ����
--**********************************
function x006001_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x006001_g_eventList do
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
function x006001_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��,ҪTr� v�NPCto� � �¼��б�
	for i, findId in x006001_g_eventList do
		if missionScriptId == findId then
			x006001_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--����(�Ѿ���������)
--**********************************
function x006001_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x006001_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ������to� � ����
--**********************************
function x006001_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x006001_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x006001_OnDie( sceneId, selfId, killerId )
end

--**********************************
-- �Ի�������Ϣ��ʾ
--**********************************
function x006001_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--�ύ��Ʒ
--**********************************
function x006001_OnMissionCheck( sceneId, selfId, targetId, scriptId, index1, index2, index3, indexpet, missionIndex )
	
	for i, eventId in x006001_g_XunWuScriptId do
		
		if eventId == scriptId then
			CallScriptFunction( scriptId, "OnMissionCheck", sceneId, selfId, targetId, scriptId, index1, index2, index3, indexpet, missionIndex )
			return 1
		end
	end
		
end
