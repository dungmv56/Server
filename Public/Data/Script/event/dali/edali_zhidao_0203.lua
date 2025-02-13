--��������
--������Ѱ��¬����
--MisDescBegin
--�ű���
x210203_g_ScriptId = 210203

x210203_g_Position_X=102.8806
x210203_g_Position_Z=131.8685
x210203_g_SceneID=2
x210203_g_AccomplishNPC_Name="L� Tam Th�t"

--�����
x210203_g_MissionId = 443

--��m�t c�i����to� � ID
x210203_g_MissionIdPre = 442

--Ŀ��NPC
x210203_g_Name	="L� Tam Th�t"

--�������
x210203_g_MissionKind = 13

--��ng c�p nhi�m v� 
x210203_g_MissionLevel = 1

--��ng����ngTinhӢ����
x210203_g_IfMissionElite = 0

--������
x210203_g_MissionName="Ph�n thu�c th� nh�t"
x210203_g_MissionInfo="#{event_dali_0005}"
x210203_g_MissionTarget="� #G�߶ng l�n ph�a T�y th�nh ��i L�#W c� #YTi�m D��c#W h�y t�m �n #RL� Tam Th�t #W#{_INFOAIM103,132,2, L� Tam Th�t}. "
x210203_g_MissionComplete="  Kh�ng ng� c�c h� c� h�ng th� s�u s�c nh� v�y v�i y ��o, ���c ��m ��o v�i c�c h� th�t tho�i m�i. Ch� #Yd��c ph�m#W n�y c�c h� h�y ch�n l�y m�t, h�y coi �� l� m�n qu� di�n ki�n ta t�ng c�c h�"
x210203_g_MoneyBonus=10
x210203_g_SignPost = {x = 103, z = 133, tip = "L� Tam Th�t"}
x210203_g_RadioItemBonus={{id=30001001,num=5},{id=30003001,num=5},{id=30002001,num=5}}

x210203_g_Custom	= { {id="�� t�m ���c L� Tam Th�t",num=1} }
x210203_g_IsMissionOkFail = 1		--����to� � ��0λ

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x210203_OnDefaultEvent( sceneId, selfId, targetId )
    --��������ɹ�C�i n�y ����
    if (IsMissionHaveDone(sceneId,selfId,x210203_g_MissionId) > 0 ) then
    	return
	elseif( IsHaveMission(sceneId,selfId,x210203_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x210203_g_Name then
			x210203_OnContinue( sceneId, selfId, targetId )
		end
    --Th�a m�n�����������
    elseif x210203_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x210203_g_Name then
			--��������Ti�p th�ʱ��ʾto� � ��Ϣ
			BeginEvent(sceneId)
				AddText(sceneId,x210203_g_MissionName)
				AddText(sceneId,x210203_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}")
				AddText(sceneId,x210203_g_MissionTarget)
				for i, item in x210203_g_RadioItemBonus do
					AddRadioItemBonus( sceneId, item.id, item.num )
				end
				AddMoneyBonus( sceneId, x210203_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x210203_g_ScriptId,x210203_g_MissionId)
		end
    end
end

--**********************************
--�о��¼�
--**********************************
function x210203_OnEnumerate( sceneId, selfId, targetId )
    --�����m�t �δ�����m�t c�i����
    if 	IsMissionHaveDone(sceneId,selfId,x210203_g_MissionIdPre) <= 0 then
    	return
    end
    --��������ɹ�C�i n�y ����
    if IsMissionHaveDone(sceneId,selfId,x210203_g_MissionId) > 0 then
    	return 
    --����ѽӴ�����
    elseif IsHaveMission(sceneId,selfId,x210203_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x210203_g_Name then
			AddNumText(sceneId, x210203_g_ScriptId,x210203_g_MissionName,2,-1);
		end
    --Th�a m�n�����������
    elseif x210203_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x210203_g_Name then
			AddNumText(sceneId,x210203_g_ScriptId,x210203_g_MissionName,1,-1);
		end
    end
end

--**********************************
--���Ti�p th�����
--**********************************
function x210203_CheckAccept( sceneId, selfId )
	--C�n 1c�p���ܽ�
	if GetLevel( sceneId, selfId ) >= 1 then
		return 1
	else
		return 0
	end
end

--**********************************
--Ti�p th�
--**********************************
function x210203_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x210203_g_MissionId, x210203_g_ScriptId, 0, 0, 0 )
	Msg2Player(  sceneId, selfId,"#YNh�n nhi�m v�: d��c ph�m th� 1",MSG2PLAYER_PARA )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, x210203_g_SignPost.x, x210203_g_SignPost.z, x210203_g_SignPost.tip )

	-- ����������ɱ�־
	local misIndex = GetMissionIndexByID(sceneId,selfId,x210203_g_MissionId)
	SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
	SetMissionByIndex( sceneId, selfId, misIndex, 1, 1)
end

--**********************************
--����
--**********************************
function x210203_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧto� � ����
    DelMission( sceneId, selfId, x210203_g_MissionId )
	CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x210203_g_SignPost.tip )
end

--**********************************
--����
--**********************************
function x210203_OnContinue( sceneId, selfId, targetId )
    BeginEvent(sceneId)
		AddText(sceneId,x210203_g_MissionName)
		AddText(sceneId,x210203_g_MissionComplete)
		AddMoneyBonus( sceneId, x210203_g_MoneyBonus )
		for i, item in x210203_g_RadioItemBonus do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x210203_g_ScriptId,x210203_g_MissionId)
end

--**********************************
--�����ng������ύ
--**********************************
function x210203_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x210203_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--�ύ
--**********************************
function x210203_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x210203_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		BeginAddItem(sceneId)
			for i, item in x210203_g_RadioItemBonus do
				if item.id == selectRadioId then
					AddItem( sceneId,item.id, item.num )
				end
			end
		ret = EndAddItem(sceneId,selfId)
		if ret > 0 then
		--����������
			AddMoney(sceneId,selfId,x210203_g_MoneyBonus );
			LuaFnAddExp( sceneId, selfId,25)
			DelMission( sceneId,selfId,  x210203_g_MissionId )
			--���������Ѿ�����ɹ�
			MissionCom( sceneId,selfId,  x210203_g_MissionId )
			AddItemListToHuman(sceneId,selfId)
			Msg2Player(  sceneId, selfId,"#YHo�n t�t nhi�m v�#W: d��c ph�m th� 1",MSG2PLAYER_PARA )
			CallScriptFunction( 210204, "OnDefaultEvent",sceneId, selfId, targetId)
		else
			--������û�мӳɹ�
			BeginEvent(sceneId)
				strText = "Kh�ng th� Ho�n t�t nhi�m v�"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
	end
end

--**********************************
--ɱ����������
--**********************************
function x210203_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x210203_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x210203_OnItemChanged( sceneId, selfId, itemdataId )
end
