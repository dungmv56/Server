-- �ʹ����to� � ��������
--MisDescBegin
-- �ű���
x600005_g_ScriptId = 600005

--�����
x600005_g_MissionId = 1105

--M�c ti�u nhi�m v�npc
x600005_g_Name = "M� �ng H�ng"

--�������
x600005_g_MissionKind = 50

--��ng c�p nhi�m v� 
x600005_g_MissionLevel = 10000

--��ng����ngTinhӢ����
x600005_g_IfMissionElite = 0

--���漸����ng��̬��ʾto� � ����,����T�i �����б��ж�̬��ʾ�������**********************
x600005_g_IsMissionOkFail = 0							-- Nhi�m v� ho�n th�nh���

--������ng��̬**************************************************************

--���������m�t λ�����洢��� �i�m��to� � �ű���

--�����ı�����
x600005_g_MissionName = "Nhi�m v� c�ng tr�nh"
x600005_g_MissionInfo = "    H�m nay ta mu�n c� %s, t�m l�i ��y gi�p ta!"			--��������
x600005_g_MissionTarget = "    �em %i ��a cho %n"							--M�c ti�u nhi�m v�
x600005_g_ContinueInfo = "    Nhi�m v� c�a c�c h� v�n ch�a ho�n th�nh �?"					--δHo�n t�t nhi�m v�to� � npc�Ի�
x600005_g_SubmitInfo = "    S� t�nh ti�n tri�n nh� th� n�o r�i?"								--���δ�ύʱto� � npc�Ի�
x600005_g_MissionComplete = "    L�m t�t l�m, r�t t�t r�t t�t. "					--Ho�n t�t nhi�m v�npc˵��to� � ��

x600005_g_StrForePart = 5
x600005_g_ItemOffset = 18												-- Suppose to 18, ����ڼ�c�i��Ʒ��to� � ƫ����
x600005_g_NPCOffset = 7													-- Suppose to 7, ����ڼ��� NPC to� � ƫ����
x600005_g_NPCOffsetEx = 245													-- Suppose to 7, ����ڼ��� NPC to� � ƫ����

x600005_g_MissionRound = 38

-- ͨ��Th�nh ph� ����ű�
x600005_g_CityMissionScript = 600001
x600005_g_EngineeringScript = 600002

--������

--MisDescEnd

x600005_g_Pronoun = {}
x600005_g_Pronoun[0] = "mu�i �y "
x600005_g_Pronoun[1] = "huynh �y "

--**********************************
--������ں���
--**********************************
function x600005_OnDefaultEvent( sceneId, selfId, targetId )	-- �i�m���������ִ�д˽ű�
	if GetName( sceneId, targetId ) ~= x600005_g_Name then		--�жϸ�npc��ng����ng��Ӧ����to� � npc
		return
	end

	--����ѽӴ�����
	if IsHaveMission( sceneId, selfId, x600005_g_MissionId ) > 0 then
		--������������to� � ��Ϣ
		local bDone = x600005_CheckSubmit( sceneId, selfId )
		local strText

		if bDone == 1 then
			strText = x600005_g_SubmitInfo
		else
			strText = x600005_g_ContinueInfo
		end

		--������������to� � ��Ϣ
		BeginEvent( sceneId )
			AddText( sceneId, x600005_g_MissionName )
			AddText( sceneId, strText )
		EndEvent( )
		DispatchMissionDemandInfo( sceneId, selfId, targetId, x600005_g_ScriptId, x600005_g_MissionId, bDone )
	--Th�a m�n�����������
	elseif x600005_CheckAccept( sceneId, selfId ) > 0 then
		local nTemp = CallScriptFunction( x600005_g_CityMissionScript, "CanDoMisToDay", sceneId, selfId )
		if nTemp == 1   then
			x600005_OnAccept( sceneId, selfId, targetId )
		end
	end
end

--**********************************
--�о��¼�
--**********************************
function x600005_OnEnumerate( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x600005_g_Name then		--�жϸ�npc��ng����ng��Ӧ����to� � npc
		return
	end

   --����ѽӴ�����
	if IsHaveMission( sceneId, selfId, x600005_g_MissionId ) > 0 then
		AddNumText( sceneId, x600005_g_ScriptId, x600005_g_MissionName,3,-1 )
	end
end

--**********************************
--���Ti�p th�����
--**********************************
function x600005_CheckAccept( sceneId, selfId )
	local ret = CallScriptFunction( x600005_g_EngineeringScript, "CheckAccept", sceneId, selfId )
	return ret
end

--**********************************
--������ҵ�c�p �i�m����ӦMissionItem_HashTable.txt��to� � ��Ԫ����
--**********************************
function x600005_GetMissionItemIndex( sceneId, selfId )
	return x600005_g_ItemOffset
end

--**********************************
--������ҵ�c�p �i�m����ӦMissionNPC_HashTable.txt��to� � ѡ����Ϣ
--**********************************
function x600005_GetMissionNPCKey( sceneId, selfId )
	local nPlayerLevel = GetLevel( sceneId, selfId )
	local nPos

	if nPlayerLevel < 40 then								-- 20 ~ 39
		nPos = 0
	elseif nPlayerLevel < 60 then							-- 40 ~ 59
		nPos = 1
	elseif nPlayerLevel < 80 then							-- 60 ~ 79
		nPos = 2
	elseif nPlayerLevel < 100 then							-- 80 ~ 100
		nPos = 3
		
	elseif nPlayerLevel < 120 then							-- 100 ~ 119 modi:lby20071127
		nPos = 0
	else							-- >120
		nPos = 1
	end


	if nPlayerLevel < 100 then							--modi:lby20071127
		return nPos + x600005_g_NPCOffset
	else
		return nPos + x600005_g_NPCOffsetEx
	end
		
	--return nPos + x600005_g_NPCOffset
end

--**********************************
--Ti�p th�
--**********************************
function x600005_OnAccept( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x600005_g_Name then		--�жϸ�npc��ng����ng��Ӧ����to� � npc
		return
	end

	if GetLevel( sceneId, selfId ) < 20 then
		CallScriptFunction( x600005_g_CityMissionScript, "NotifyFailTips", sceneId, selfId, "Kh�ng �� ��ng c�p" )
		return
	end

	local nitemId, strItemName, _ = GetOneMissionItem( x600005_GetMissionItemIndex( sceneId, selfId ) )
	local pos = LuaFnTryRecieveItem( sceneId, selfId, nitemId, QUALITY_MUST_BE_CHANGE)
	if pos == -1 then
		CallScriptFunction( x600005_g_CityMissionScript, "NotifyFailTips", sceneId, selfId, "Ch� tr�ng trong t�i x�ch kh�ng ��" )
		return
	end

	--������������б�
	AddMission( sceneId, selfId, x600005_g_MissionId, x600005_g_ScriptId, 0, 0, 0 )	-- kill��area��item
	if IsHaveMission( sceneId, selfId, x600005_g_MissionId ) <= 0 then
		return
	end

	SetMissionEvent( sceneId, selfId, x600005_g_MissionId, 4 ) -- ע�� x600005_OnLockedTarget �¼�

	CallScriptFunction( x600005_g_EngineeringScript, "OnAccept", sceneId, selfId, targetId, x600005_g_ScriptId )

	local misIndex = GetMissionIndexByID( sceneId, selfId, x600005_g_MissionId )
	local nNpcId, strNpcName, strNpcScene, _, nPosX, nPosZ, _, nGender = GetOneMissionNpc( x600005_GetMissionNPCKey( sceneId, selfId ) )

	SetMissionByIndex( sceneId, selfId, misIndex, x600005_g_StrForePart, nitemId )
	SetMissionByIndex( sceneId, selfId, misIndex, x600005_g_StrForePart + 1, nNpcId )

	--��ʾ���ݸ�������Ѿ�Ti�p th�������
	BeginEvent( sceneId )
		local missionInfo
		local rand = random(2)

		if rand == 1 then
			missionInfo = format( "    Ch�ng ta v� %s %s (%d, %d) �� ��c th�nh #Y%s#W, hy v�ng c�c h� c� th� gi�p ta chuy�n gi�p.",
				strNpcScene, strNpcName, nPosX, nPosZ, strItemName )
		else
			missionInfo = format( "    %s %s (%d, %d) �� �t #Y%s#W � ��y, hy v�ng c�c h� c� th� chuy�n cho %s",
				strNpcScene, strNpcName, nPosX, nPosZ, strItemName, x600005_g_Pronoun[nGender] )
		end

		AddText( sceneId, missionInfo )
		AddText( sceneId, "#r    C�c h� �� nh�n " .. x600005_g_MissionName )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--����
--**********************************
function x600005_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧto� � ����
	CallScriptFunction( x600005_g_EngineeringScript, "OnAbandon", sceneId, selfId )
end

--**********************************
--����
--**********************************
function x600005_OnContinue( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, x600005_g_MissionName )
		AddText( sceneId, x600005_g_MissionComplete )
	EndEvent( )
	DispatchMissionContinueInfo( sceneId, selfId, targetId, x600005_g_ScriptId, x600005_g_MissionId )
end

--**********************************
--�����ng������ύ
--**********************************
function x600005_CheckSubmit( sceneId, selfId )
	local ret = CallScriptFunction( x600005_g_EngineeringScript, "CheckSubmit", sceneId, selfId )
	return ret
end

--**********************************
--�ύ
--**********************************
function x600005_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if GetName( sceneId, targetId ) ~= x600005_g_Name then		--�жϸ�npc��ng����ng��Ӧ����to� � npc
		return
	end

	if x600005_CheckSubmit( sceneId, selfId ) == 1 then
		CallScriptFunction( x600005_g_EngineeringScript, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
	end
end

--**********************************
--ɱ����������
--**********************************
function x600005_OnKillObject( sceneId, selfId, objdataId, objId )	--������˼: �����š����objId�������λ�úš�����objId
end

--**********************************
--���������¼�
--**********************************
function x600005_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x600005_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--������m�t c�i����
--**********************************
function x600005_OnLockedTarget( sceneId, selfId, objId )
	if IsHaveMission( sceneId, selfId, x600005_g_MissionId ) < 1 then
		return		-- û�и�����
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x600005_g_MissionId )		-- �i�m������T�i 20c�i������to� � ���к�
	if GetMissionParam( sceneId, selfId, misIndex, x600005_g_IsMissionOkFail ) > 0 then
		return		-- �����������
	end

	local nNpcId
	local strNpcName
	local PosX
	local PosZ

	nNpcId = GetMissionParam( sceneId, selfId, misIndex, x600005_g_StrForePart + 1 )
	_, strNpcName, _, PosX, PosZ = GetNpcInfoByNpcId(sceneId, nNpcId )

	-- ��ʱ���Ƚ�λ��
	if GetName( sceneId, objId ) == strNpcName then
		local nItemId
		nItemId = GetMissionParam( sceneId, selfId, misIndex, x600005_g_StrForePart )

		if DelItem( sceneId, selfId, nItemId, 1 ) == 1 then
			-- ���������Ѿ����
			SetMissionByIndex( sceneId, selfId, misIndex, x600005_g_IsMissionOkFail, 1 )
			-- ��������� x600005_OnLockedTarget �¼��б������,�������ٹ��Ĵ����¼�
			ResetMissionEvent( sceneId, selfId, x600005_g_MissionId, 4 )
			TAddText( sceneId, "    Danh t�n c�a qu� bang th�t t�t, v� c�ng c�m �n." )
		end
	end
end
