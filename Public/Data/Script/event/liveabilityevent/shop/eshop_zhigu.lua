--�̵�
--�����̵�
--��i L� �ƹ�

--�ű���
x701613_g_ScriptId = 701613

--�̵��
x701613_g_shoptableindex=52

--�̵�����
x701613_g_ShopName = "Mua ph߽ng th�c ch� �c"

--**********************************
--������ں���
--**********************************
function x701613_OnDefaultEvent( sceneId, selfId, targetId )	-- �i�m���������ִ�д˽ű�
	DispatchShopItem( sceneId, selfId,targetId, x701613_g_shoptableindex )
end

--**********************************
--�о��¼�
--**********************************
function x701613_OnEnumerate( sceneId, selfId, targetId )
	--�ж���ng����ng���ɵ���
	if GetMenPai(sceneId,selfId) == MP_DALI then
		AddNumText(sceneId,x701613_g_ScriptId,x701613_g_ShopName,7,-1)
    end
	return
end

--**********************************
--���Ti�p th�����
--**********************************
function x701613_CheckAccept( sceneId, selfId )
end

--**********************************
--Ti�p th�
--**********************************
function x701613_OnAccept( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x701613_OnAbandon( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x701613_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--�����ng������ύ
--**********************************
function x701613_CheckSubmit( sceneId, selfId )
end

--**********************************
--�ύ
--**********************************
function x701613_OnSubmit( sceneId, selfId, targetId,selectRadioId )
end

--**********************************
--ɱ����������
--**********************************
function x701613_OnKillObject( sceneId, selfId, objdataId,objId)
end

--**********************************
--���������¼�
--**********************************
function x701613_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x701613_OnItemChanged( sceneId, selfId, itemdataId )
end
