-- 311012
-- ����,to� � m�t Щ����,

-- ���ÿɱm�t c�i������to� � ��,H� th�ng�����¼m�t ��,����ʾT�i ��������������,��ʾΪ���������: XX��
-- ������ÿ��0 �i�mʱ��λΪ0
-- �����to� � �������>=10ʱ,ǿ��������ɱ��ֵ=10,����λ�������=0.

--MD_KILL_CAOYUN_PAOSHANG_CT = 150  -- m�t ��ʱ����ͷ���������to� � ����
--MD_KILL_CAOYUN_PAOSHANG_PRE_TIME = 151 --��m�t �δ��ʱ�� 

--�ű���
x311012_g_ScriptId = 311012
x311012_TIME_2000_01_03_ = 946828868

--**********************************
-- ����֮��
--**********************************
function x311012_OnDacoity( sceneId, selfId, Killer )
	-- �ȿ�����ng����ng����ɱto� � 
	local nKiller = Killer
	if LuaFnIsObjValid(sceneId, nKiller)==1  and
				--LuaFnIsCanDoScriptLogic(sceneId, nKiller) == 1 and
				GetCharacterType(sceneId, nKiller) == 3  then
		-- �����ng����ɱ��,C�n ת������
		nKiller = GetPetCreator(sceneId, nKiller)
	end	

	if nKiller == -1  then
		return
	end
	
	if LuaFnIsObjValid(sceneId, nKiller)==1  and
				LuaFnIsCanDoScriptLogic(sceneId, nKiller) == 1 and
				0 == IsInGuildWar(sceneId, selfId, nKiller) and   --��ng����ng����ս��
				GetCharacterType(sceneId, nKiller) == 1  then
				
		local nDacoityCount = GetMissionData(sceneId, nKiller, MD_KILL_CAOYUN_PAOSHANG_CT)
		local nPreTime = GetMissionData(sceneId, nKiller, MD_KILL_CAOYUN_PAOSHANG_PRE_TIME)
		local nCurTime = LuaFnGetCurrentTime()

		-- ��ʱ����ng����ng����m�t ��,���˾��ȸ���
		if (nCurTime - nPreTime  >= 3600*24)  or
			 (floor((nCurTime-x311012_TIME_2000_01_03_)/(3600*24)) ~= floor((nPreTime-x311012_TIME_2000_01_03_)/(3600*24)))   then
			nDacoityCount = 0
			nPreTime = nCurTime
			SetMissionData(sceneId, nKiller, MD_KILL_CAOYUN_PAOSHANG_PRE_TIME, nPreTime)
		end
		
		nDacoityCount = nDacoityCount + 1
		
		if nDacoityCount >= 10  then
			-- ǿ���������to� � ɱ��Ϊ10
			local nPkValue = LuaFnGetHumanPKValue(sceneId, nKiller)
			LuaFnSetHumanPKValue(sceneId, nKiller, 10)
			SetMissionData(sceneId, nKiller, MD_KILL_CAOYUN_PAOSHANG_CT, 0)
			
			-- [ QUFEI 2007-11-09 15:36 UPDATE BugID 27611 ]		
			local LogInfo	= format( "[ChangePKValue]:CaoYun sceneId=%d, GUID=%0X, CaoYunCount=%d, PKValueBgn=%d, PKValueEnd=%d",
					sceneId,
					LuaFnObjId2Guid( sceneId, selfId ),
					nDacoityCount,
					nPkValue,
					LuaFnGetHumanPKValue(sceneId, nKiller) )
			WriteCheckLog( sceneId, selfId, LogInfo )
			
			local KillGuid = LuaFnObjId2Guid(sceneId, nKiller)
			LuaFnSendMailToGUID(sceneId, KillGuid, "H�m nay c�c h� �� c߾p T�o v�n 10 l�n, �� �nh h߷ng �n l�i �ch c�a ng߶i ch�i kh�c, t�m th�i m�t s� t� do, l�n sau suy ngh� k� h�y l�m!")

		else
			SetMissionData(sceneId, nKiller, MD_KILL_CAOYUN_PAOSHANG_CT, nDacoityCount)
			SetMissionData(sceneId, nKiller, MD_KILL_CAOYUN_PAOSHANG_PRE_TIME, nCurTime)
			BeginEvent(sceneId)
				strText = "S� l�n c߾p T�o v�n h�m nay c�a c�c h� l� " .. tostring(nDacoityCount) .. " l�n, khi c�c h� c߾p T�o v�n ��t 10 l�n, s� b� b�t v�o nh� lao, xin suy ngh� k� h�y l�m!"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,nKiller)
		end
	end
end

--**********************************
-- ���±����to� � ����
--**********************************
function x311012_UpdataDacoityData( sceneId, selfId )

	local nDacoityCount = GetMissionData(sceneId, selfId, MD_KILL_CAOYUN_PAOSHANG_CT)
	local nPreTime = GetMissionData(sceneId, selfId, MD_KILL_CAOYUN_PAOSHANG_PRE_TIME)
	local nCurTime = LuaFnGetCurrentTime()
	
	-- ��ʱ����ng����ng����m�t ��,���˾��ȸ���
	if (nCurTime - nPreTime  >= 3600*24)  or
		 (floor((nCurTime-x311012_TIME_2000_01_03_)/(3600*24)) ~= floor((nPreTime-x311012_TIME_2000_01_03_)/(3600*24)))   then
		nDacoityCount = 0
		nPreTime = nCurTime
		SetMissionData(sceneId, selfId, MD_KILL_CAOYUN_PAOSHANG_PRE_TIME, nPreTime)
		SetMissionData(sceneId, selfId, MD_KILL_CAOYUN_PAOSHANG_CT, nDacoityCount)
	end
	
end

