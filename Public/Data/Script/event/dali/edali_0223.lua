--��������
--V�n Phi�u Phi�uѰ������ʦ
--MisDescBegin
--�ű���
x210223_g_ScriptId = 210223

--Ti�p th�����NPC����
x210223_g_Position_X=282
x210223_g_Position_Z=254
x210223_g_SceneID=2
x210223_g_AccomplishNPC_Name="Tri�u Thi�n S�"

--�����
x210223_g_MissionId = 703

--��m�t c�i����to� � ID
x210223_g_MissionIdPre = 701

--Ŀ��NPC
x210223_g_Name	="Tri�u Thi�n S�"

--�������
x210223_g_MissionKind = 13

--��ng c�p nhi�m v� 
x210223_g_MissionLevel = 7

--��ng����ngTinhӢ����
x210223_g_IfMissionElite = 0

--������
x210223_g_MissionName="L� th� gi�i thi�u th� 7"
x210223_g_MissionInfo="#{event_dali_0033}"
x210223_g_MissionTarget="    V� #GNg� Hoa ��n th�nh ��i L�#W t�m �n #GTri�u Thi�n S� #W#{_INFOAIM160,157,2, Tri�u Thi�n S�}. "
x210223_g_MissionComplete="  C�ng ng�y nhi�u ng߶i tr� th�nh b�n h�u c�a c�c h�. H� �u ��nh gi� r�t cao v� c�c h�. Ta �� thay m�t T� ��i Thi�n Nh�n, vi�t th�m cho c�c h� #Ym�t l� th� gi�i thi�u #W"
x210223_g_MoneyBonus=24
x210223_g_SignPost = {x = 282, z = 254, tip = "Tri�u Thi�n S�"}
x210223_g_ItemBonus={{id=40002108,num=1}}

x210223_g_Custom	= { {id="�� t�m th�y Tri�u Thi�n S�",num=1} }
x210223_g_IsMissionOkFail = 1		--����to� � ��0λ

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x210223_OnDefaultEvent( sceneId, selfId, targetId )
    --��������ɹ�C�i n�y ����
    if (IsMissionHaveDone(sceneId,selfId,x210223_g_MissionId) > 0 ) then
    	return
	elseif( IsHaveMission(sceneId,selfId,x210223_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x210223_g_Name then
			x210223_OnContinue( sceneId, selfId, targetId )
		end
    --Th�a m�n�����������
    elseif x210223_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x210223_g_Name then
			--��������Ti�p th�ʱ��ʾto� � ��Ϣ
			BeginEvent(sceneId)
				AddText(sceneId,x210223_g_MissionName)
				AddText(sceneId,x210223_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}")
				AddText(sceneId,x210223_g_MissionTarget)
				for i, item in x210223_g_ItemBonus do
					AddItemBonus( sceneId, item.id, item.num )
				end
				AddMoneyBonus( sceneId, x210223_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x210223_g_ScriptId,x210223_g_MissionId)
		end
    end
end

--**********************************
--�о��¼�
--**********************************
function x210223_OnEnumerate( sceneId, selfId, targetId )
    --�����m�t �δ�����m�t c�i����
    if 	IsMissionHaveDone(sceneId,selfId,x210223_g_MissionIdPre) <= 0 then
    	return
    end
    --��������ɹ�C�i n�y ����
    if IsMissionHaveDone(sceneId,selfId,x210223_g_MissionId) > 0 then
    	return 
    --����ѽӴ�����
    elseif IsHaveMission(sceneId,selfId,x210223_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x210223_g_Name then
			AddNumText(sceneId, x210223_g_ScriptId,x210223_g_MissionName,2,-1);
		end
    --Th�a m�n�����������
    elseif x210223_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x210223_g_Name then
			AddNumText(sceneId,x210223_g_ScriptId,x210223_g_MissionName,1,-1);
		end
    end
end

--**********************************
--���Ti�p th�����
--**********************************
function x210223_CheckAccept( sceneId, selfId )
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
function x210223_OnAccept( sceneId, selfId )
	--������������б�
	AddMission( sceneId,selfId, x210223_g_MissionId, x210223_g_ScriptId, 0, 0, 0 )
	Msg2Player(  sceneId, selfId,"#YNh�n nhi�m v�#W: L� th� gi�i thi�u th� 7",MSG2PLAYER_PARA )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, x210223_g_SignPost.x, x210223_g_SignPost.z, x210223_g_SignPost.tip )

	-- ����������ɱ�־
	local misIndex = GetMissionIndexByID(sceneId,selfId,x210223_g_MissionId)
	SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
	SetMissionByIndex( sceneId, selfId, misIndex, 1, 1)
end

--**********************************
--����
--**********************************
function x210223_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧto� � ����
    DelMission( sceneId, selfId, x210223_g_MissionId )
	CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x210223_g_SignPost.tip )
end

--**********************************
--����
--**********************************
function x210223_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱto� � � �i�m���Ϣ
    BeginEvent(sceneId)
		AddText(sceneId,x210223_g_MissionName)
		AddText(sceneId,x210223_g_MissionComplete)
		AddMoneyBonus( sceneId, x210223_g_MoneyBonus )
		for i, item in x210223_g_ItemBonus do
			AddItemBonus( sceneId,item.id, item.num )
		end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x210223_g_ScriptId,x210223_g_MissionId)
end

--**********************************
--�����ng������ύ
--**********************************
function x210223_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x210223_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--�ύ
--**********************************
function x210223_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x210223_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
    	BeginAddItem(sceneId)
			for i, item in x210223_g_ItemBonus do
				AddItem( sceneId,item.id, item.num )
			end
		ret = EndAddItem(sceneId,selfId)
		--����������
			if ret > 0 then
					AddMoney(sceneId,selfId,x210223_g_MoneyBonus );
					LuaFnAddExp( sceneId, selfId,800)
					ret = DelMission( sceneId, selfId, x210223_g_MissionId )
				if ret > 0 then
					MissionCom( sceneId, selfId, x210223_g_MissionId )
					AddItemListToHuman(sceneId,selfId)
					Msg2Player(  sceneId, selfId,"#YHo�n t�t nhi�m v�#W: L� th� gi�i thi�u th� 7",MSG2PLAYER_PARA )
				end
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
function x210223_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x210223_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x210223_OnItemChanged( sceneId, selfId, itemdataId )
end
