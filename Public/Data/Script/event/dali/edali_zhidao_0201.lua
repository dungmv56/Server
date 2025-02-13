--�ͻ�����
--�����ͻ���������
--MisDescBegin
--�ű���
x210201_g_ScriptId = 210201

x210201_g_Position_X=230
x210201_g_Position_Z=251
x210201_g_SceneID=2
x210201_g_AccomplishNPC_Name="в T� Тng"

--�����
x210201_g_MissionId = 441

--��m�t c�i����to� � ID
x210201_g_MissionIdPre = 440

--Ŀ��NPC
x210201_g_Name	="в T� Тng"

--������߱��
x210201_g_ItemId = 40002110

--���������������
x210201_g_ItemNeedNum = 1

--�������
x210201_g_MissionKind = 13

--��ng c�p nhi�m v� 
x210201_g_MissionLevel = 1

--��ng����ngTinhӢ����
x210201_g_IfMissionElite = 0

--���漸����ng��̬��ʾto� � ����,����T�i �����б��ж�̬��ʾ�������**********************
--������ng���Ѿ����
x210201_g_IsMissionOkFail = 0		--����to� � ��0λ

--������ng��̬**************************************************************

--������
x210201_g_MissionName="L�n �u giao h�ng"
x210201_g_MissionInfo="#{event_dali_0003}"
x210201_g_MissionTarget="Mang #Ym�t h�m d�ng c� B�p#W �n#G �߶ng l�n ph�a T�y th�nh ��i L�#Y T�u qu�n#W cho �ng ch� #Rв T� Тng #W#{_INFOAIM110,158,2, в T� Тng}. "
x210201_g_MissionComplete="  C�c h� th�t hi�u ��ng c�n nguy c�p c�a ta, ta �ang c�n g�p #Ychi�c r߽ng d�ng c� n�u n߾ng#W n�y!"
x210201_g_MoneyBonus=10
x210201_g_SignPost = {x = 230, z = 251, tip = "в T� Тng"}

x210201_g_DemandItem={{id=40002110,num=1}}		--������1λ
x210201_g_IsMissionOkFail = 1		--����to� � ��0λ

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x210201_OnDefaultEvent( sceneId, selfId, targetId )
    --��������ɹ�C�i n�y ����
    if (IsMissionHaveDone(sceneId,selfId,x210201_g_MissionId) > 0 ) then
    	return
	elseif( IsHaveMission(sceneId,selfId,x210201_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x210201_g_Name then
			x210201_OnContinue( sceneId, selfId, targetId )
		end
    --Th�a m�n�����������
    elseif x210201_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x210201_g_Name then
			--��������Ti�p th�ʱ��ʾto� � ��Ϣ
			BeginEvent(sceneId)
				AddText(sceneId,x210201_g_MissionName)
				AddText(sceneId,x210201_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}")
				AddText(sceneId,x210201_g_MissionTarget)
				AddMoneyBonus( sceneId, x210201_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x210201_g_ScriptId,x210201_g_MissionId)
		end
    end
end

--**********************************
--�о��¼�
--**********************************
function x210201_OnEnumerate( sceneId, selfId, targetId )
    --�����m�t �δ�����m�t c�i����
    if 	IsMissionHaveDone(sceneId,selfId,x210201_g_MissionIdPre) <= 0 then
    	return
    end
    --��������ɹ�C�i n�y ����
    if IsMissionHaveDone(sceneId,selfId,x210201_g_MissionId) > 0 then
    	return 
    --����ѽӴ�����
    elseif IsHaveMission(sceneId,selfId,x210201_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x210201_g_Name then
			AddNumText(sceneId, x210201_g_ScriptId,x210201_g_MissionName,2,-1);
		end
    --Th�a m�n�����������
    elseif x210201_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x210201_g_Name then
			AddNumText(sceneId,x210201_g_ScriptId,x210201_g_MissionName,1,-1);
		end
    end
end

--**********************************
--���Ti�p th�����
--**********************************
function x210201_CheckAccept( sceneId, selfId )
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
function x210201_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x210201_g_MissionId, x210201_g_ScriptId, 0, 0, 0 )
	BeginAddItem(sceneId)
		--�����ż�����Ʒ
		AddItem( sceneId,x210201_g_ItemId, x210201_g_ItemNeedNum )
		ret = EndAddItem(sceneId,selfId)
		--����������
	if ret > 0 then
		AddItemListToHuman(sceneId,selfId)
		Msg2Player(  sceneId, selfId,"#YNh�n nhi�m v�: giao h�ng l�n 1",MSG2PLAYER_PARA )
		CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, x210201_g_SignPost.x, x210201_g_SignPost.z, x210201_g_SignPost.tip )

		-- ����������ɱ�־
		local misIndex = GetMissionIndexByID(sceneId,selfId,x210201_g_MissionId)
		SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
		SetMissionByIndex( sceneId, selfId, misIndex, 1, 1)

	else
		--������û�мӳɹ�
		BeginEvent(sceneId)
			strText = "T�i x�ch �� �y, kh�ng th� ti�p nh�n th�m nhi�m v�"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	end
end

--**********************************
--����
--**********************************
function x210201_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧto� � ����
    res = DelMission( sceneId, selfId, x210201_g_MissionId )
	if res > 0 then
		--��ȥ������Ʒ
		for i, item in x210201_g_DemandItem do
			DelItem( sceneId, selfId, item.id, item.num )
		end
		CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x210201_g_SignPost.tip )
	end
end

--**********************************
--����
--**********************************
function x210201_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱto� � � �i�m���Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x210201_g_MissionName)
		AddText(sceneId,x210201_g_MissionComplete)
		AddMoneyBonus( sceneId, x210201_g_MoneyBonus )
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x210201_g_ScriptId,x210201_g_MissionId)
end

--**********************************
--�����ng������ύ
--**********************************
function x210201_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x210201_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	for i, item in x210201_g_DemandItem do
		itemCount = GetItemCount( sceneId, selfId, item.id )
		if itemCount < item.num then
			return 0
		end
	end
	return 1
end

--**********************************
--�ύ
--**********************************
function x210201_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x210201_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		--�۳�������Ʒ
		for i, item in x210201_g_DemandItem do
			DelItem( sceneId, selfId, item.id, item.num )
		end
		DelMission( sceneId,selfId,  x210201_g_MissionId )
		--���������Ѿ�����ɹ�
		MissionCom( sceneId,selfId,  x210201_g_MissionId )
		--����������
		AddMoney(sceneId,selfId,x210201_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId,15)
		--���������Ѿ�����ɹ�
		Msg2Player(  sceneId, selfId,"#YHo�n t�t nhi�m v�#W: giao h�ng l�n 1",MSG2PLAYER_PARA )
		CallScriptFunction( 210202, "OnDefaultEvent",sceneId, selfId, targetId)
	end
end

--**********************************
--ɱ����������
--**********************************
function x210201_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x210201_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x210201_OnItemChanged( sceneId, selfId, itemdataId )
end
