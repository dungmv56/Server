--��������
--Tri�u Thi�n S�Ѱ�����ү
--MisDescBegin
--�ű���
x210210_g_ScriptId = 210210

--Ti�p th�����NPC����
x210210_g_Position_X=296
x210210_g_Position_Z=239
x210210_g_SceneID=2
x210210_g_AccomplishNPC_Name="T�n B�t Gia"

--�����
x210210_g_MissionId = 450

--��m�t c�i����to� � ID
--g_MissionIdPre = 

--Ŀ��NPC
x210210_g_Name	="T�n B�t Gia"

--�������
x210210_g_MissionKind = 13

--��ng c�p nhi�m v� 
x210210_g_MissionLevel = 3

--��ng����ngTinhӢ����
x210210_g_IfMissionElite = 0

--������
x210210_g_MissionName="M�t l�n l�m ��i hi�p"
x210210_g_MissionInfo_1="#{event_dali_0012}"
x210210_g_MissionInfo_2="#W, l� n�o c�c h� kh�ng n�n �i gi�p c�c h� �y �?"
x210210_g_MissionTarget="� #G��i L� Th�nh Ng� Hoa ��n#W t�m th�y #Rm�t trong T� ��i thi�n nh�n #RT�n B�t Gia #W#{_INFOAIM173,146,2, T�n B�t Gia}. "
x210210_g_MissionComplete="  �i ch�, b�n c� c�a ta �, ta bi�t l� c�c h� s� �n gi�p ta"
x210210_g_MoneyBonus=72
x210210_g_SignPost = {x = 296, z = 239, tip = "T�n B�t Gia "}

x210210_g_Custom	= { {id="�� t�m th�y T�n B�t Gia",num=1} }

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x210210_OnDefaultEvent( sceneId, selfId, targetId )
  --��������ɹ�C�i n�y ����
	if (IsMissionHaveDone(sceneId,selfId,x210210_g_MissionId) > 0 ) then
		return
	elseif( IsHaveMission(sceneId,selfId,x210210_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x210210_g_Name then
			x210210_OnContinue( sceneId, selfId, targetId )
		end
		
	--Th�a m�n�����������
	elseif x210210_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x210210_g_Name then
			--��������Ti�p th�ʱ��ʾto� � ��Ϣ
			local  PlayerName=GetName(sceneId,selfId)	
			BeginEvent(sceneId)
				AddText(sceneId,x210210_g_MissionName)
				AddText(sceneId,x210210_g_MissionInfo_1..PlayerName..x210210_g_MissionInfo_2)
				AddText(sceneId,"#{M_MUBIAO}")
				AddText(sceneId,x210210_g_MissionTarget)
				AddMoneyBonus( sceneId, x210210_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x210210_g_ScriptId,x210210_g_MissionId)
		end
	end
end

--**********************************
--�о��¼�
--**********************************
function x210210_OnEnumerate( sceneId, selfId, targetId )
    --�����m�t �δ�����m�t c�i����
    --if 	IsMissionHaveDone(sceneId,selfId,g_MissionIdPre) <= 0 then
    --	return
    --end
    --��������ɹ�C�i n�y ����
    if IsMissionHaveDone(sceneId,selfId,x210210_g_MissionId) > 0 then
    	return 
    --����ѽӴ�����
    elseif IsHaveMission(sceneId,selfId,x210210_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x210210_g_Name then
			AddNumText(sceneId, x210210_g_ScriptId,x210210_g_MissionName,2,-1);
		end
    --Th�a m�n�����������
    elseif x210210_CheckAccept(sceneId,selfId) > 0 then
			if GetName(sceneId,targetId) ~= x210210_g_Name then
				AddNumText(sceneId,x210210_g_ScriptId,x210210_g_MissionName,1,-1);
			end
    end
end

--**********************************
--���Ti�p th�����
--**********************************
function x210210_CheckAccept( sceneId, selfId )
	--C�n 3c�p���ܽ�
	if GetLevel( sceneId, selfId ) >= 3 then
		return 1
	else
		return 0
	end
end

--**********************************
--Ti�p th�
--**********************************
function x210210_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x210210_g_MissionId, x210210_g_ScriptId, 0, 0, 0 )
	Msg2Player(  sceneId, selfId,"#YNh�n nhi�m v�#W: l�n �u l�m ��i hi�p",MSG2PLAYER_PARA )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, x210210_g_SignPost.x, x210210_g_SignPost.z, x210210_g_SignPost.tip )

	local misIndex = GetMissionIndexByID(sceneId,selfId,x210210_g_MissionId)
	SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
end

--**********************************
--����
--**********************************
function x210210_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧto� � ����
    DelMission( sceneId, selfId, x210210_g_MissionId )
	CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x210210_g_SignPost.tip )
end

--**********************************
--����
--**********************************
function x210210_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱto� � � �i�m���Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x210210_g_MissionName)
		AddText(sceneId,x210210_g_MissionComplete)
		AddMoneyBonus( sceneId, x210210_g_MoneyBonus )
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x210210_g_ScriptId,x210210_g_MissionId)
end

--**********************************
--�����ng������ύ
--**********************************
function x210210_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x210210_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--�ύ
--**********************************
function x210210_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x210210_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		--����������
		AddMoney(sceneId,selfId,x210210_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId,100)
		DelMission( sceneId,selfId,  x210210_g_MissionId )
		--���������Ѿ�����ɹ�
		MissionCom( sceneId,selfId,  x210210_g_MissionId )
		Msg2Player(  sceneId, selfId,"#YHo�n t�t nhi�m v�#W: l�n �u l�m ��i hi�p",MSG2PLAYER_PARA )
		CallScriptFunction( 210211, "OnDefaultEvent",sceneId, selfId, targetId)
	end
end

--**********************************
--ɱ����������
--**********************************
function x210210_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x210210_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x210210_OnItemChanged( sceneId, selfId, itemdataId )
end
