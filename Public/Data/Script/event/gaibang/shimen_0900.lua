--��������
--Tr�n C� Nh�nѰ��H�ng Th�ng
--MisDescBegin
--�ű���
x221900_g_ScriptId = 221900

--�����
x221900_g_MissionId = 1069

--��m�t c�i����to� � ID
--g_MissionIdPre = 

--Ŀ��NPC
x221900_g_Name	="H�ng Th�ng"

--�������
x221900_g_MissionKind = 21

--��ng c�p nhi�m v� 
x221900_g_MissionLevel = 10

--��ng����ngTinhӢ����
x221900_g_IfMissionElite = 0

--������
x221900_g_MissionName="Chi�n �u v� s� m�n"
x221900_g_MissionInfo="#{event_gaibang_0001}"
x221900_g_MissionTarget="    � C�i Bang ��i vi�n t�m H�ng Th�ng #{_INFOAIM92,77,10, H�ng Th�ng}. "
x221900_g_MissionComplete="  C�c h� l� �ng m�n m�i �n ph�i kh�ng. C�c h� l�m tuy�t l�m. Ta � ��y c� nhi�u vi�c c�n c�c h� gi�p ��"
x221900_g_MoneyBonus=800

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x221900_OnDefaultEvent( sceneId, selfId, targetId )
    --��������ɹ�C�i n�y ����
    if (IsMissionHaveDone(sceneId,selfId,x221900_g_MissionId) > 0 ) then
    	return
	elseif( IsHaveMission(sceneId,selfId,x221900_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x221900_g_Name then
			x221900_OnContinue( sceneId, selfId, targetId )
		end
    --Th�a m�n�����������
    elseif x221900_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x221900_g_Name then
			--��������Ti�p th�ʱ��ʾto� � ��Ϣ
			BeginEvent(sceneId)
				AddText(sceneId,x221900_g_MissionName)
				AddText(sceneId,x221900_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}")
				AddText(sceneId,x221900_g_MissionTarget)
				AddMoneyBonus( sceneId, x221900_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x221900_g_ScriptId,x221900_g_MissionId)
		end
    end
end

--**********************************
--�о��¼�
--**********************************
function x221900_OnEnumerate( sceneId, selfId, targetId )
	--��������ɹ�C�i n�y ����
	if IsMissionHaveDone(sceneId,selfId,x221900_g_MissionId) > 0 then
		return 
	--����ѽӴ�����
	elseif IsHaveMission(sceneId,selfId,x221900_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x221900_g_Name then
			AddNumText(sceneId, x221900_g_ScriptId,x221900_g_MissionName,2,-1);
		end
	--Th�a m�n�����������
	elseif x221900_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x221900_g_Name then
			AddNumText(sceneId,x221900_g_ScriptId,x221900_g_MissionName,1,-1);
		end
    end
end

--**********************************
--���Ti�p th�����
--**********************************
function x221900_CheckAccept( sceneId, selfId )
	local  MenPai = GetMenPai( sceneId, selfId)
	if	MenPai ~= 2 then
		return 0
	else
		return 1
	end
end

--**********************************
--Ti�p th�
--**********************************
function x221900_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x221900_g_MissionId, x221900_g_ScriptId, 0, 0, 0 )
	Msg2Player(  sceneId, selfId,"#YNh�n nhi�m v�: chi�n �u v� s� m�n",MSG2PLAYER_PARA )
end

--**********************************
--����
--**********************************
function x221900_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧto� � ����
    DelMission( sceneId, selfId, x221900_g_MissionId )
end

--**********************************
--����
--**********************************
function x221900_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱto� � � �i�m���Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x221900_g_MissionName)
		AddText(sceneId,x221900_g_MissionComplete)
		AddMoneyBonus( sceneId, x221900_g_MoneyBonus )
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x221900_g_ScriptId,x221900_g_MissionId)
end

--**********************************
--�����ng������ύ
--**********************************
function x221900_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x221900_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--�ύ
--**********************************
function x221900_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x221900_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		AddMoney(sceneId,selfId,x221900_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId, 800)
		ret = DelMission( sceneId, selfId, x221900_g_MissionId )
		if ret > 0 then
			MissionCom( sceneId, selfId, x221900_g_MissionId )
			Msg2Player(  sceneId, selfId,"#YHo�n t�t nhi�m v�: chi�n �u v� s� m�n",MSG2PLAYER_PARA )
		end
	end
end

--**********************************
--ɱ����������
--**********************************
function x221900_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x221900_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x221900_OnItemChanged( sceneId, selfId, itemdataId )
end
