-- 212221
-- �m�t ���Ʒ
x212221_g_scriptId = 212221

x212221_g_Stone = {
									{level=75, id=20310004, id2=20310005, num=60}, --20310004�ػ��� 20310005���ػ���
									{level=85, id=20310004, id2=20310005, num=200},

									}
										


x212221_g_Item = {
									{level=750,id=10412080},{level=750,id=10413083},{level=750,id=10422121},{level=750,id=10423046}, --75�ڹ���װ
									{level=751,id=10412082},{level=751,id=10413085},{level=751,id=10422123},{level=751,id=10423048}, --75�⹦��װ
									{level=850,id=10412081},{level=850,id=10413084},{level=850,id=10422122},{level=850,id=10423047}, --85�ڹ���װ				
									{level=851,id=10412083},{level=851,id=10413086},{level=851,id=10422124},{level=851,id=10423049}, --85�⹦��װ		
								 }


--MisDescEnd
--**********************************
--������ں���
--**********************************
function x212221_OnDefaultEvent( sceneId, selfId, targetId )
	local nNum = GetNumText()
	if nNum == 750 or nNum == 850  or nNum == 751 or nNum == 851   then		
		local str		
		if nNum == 750 or nNum == 751 then
			str = "#{DG_8724_5}"
		elseif nNum == 850 or nNum == 851  then
			str = "#{DG_8724_6}"
		end
		BeginEvent(sceneId)
			AddText(sceneId,str);
			for i, temp in x212221_g_Item do
				if temp.level == nNum  then
					AddRadioItemBonus( sceneId, temp.id, 1 )
				end
			end
		EndEvent(sceneId)
		DispatchMissionContinueInfo(sceneId,selfId,targetId,x212221_g_scriptId,0)
	end
end

--**********************************
--�о��¼�
--**********************************
function x212221_OnEnumerate( sceneId, selfId, targetId )
	AddNumText( sceneId, x212221_g_scriptId, "L�y b� trang b� n�i c�ng c�p 75", 6, 750 )
	AddNumText( sceneId, x212221_g_scriptId, "L�y b� trang b� ngo�i c�ng c�p 75", 6, 751 )
	AddNumText( sceneId, x212221_g_scriptId, "L�y b� trang b� n�i c�ng c�p 85", 6, 850 )	
	AddNumText( sceneId, x212221_g_scriptId, "L�y b� trang b� ngo�i c�ng c�p 85", 6, 851 )
end

--**********************************
--���Ti�p th�����
--**********************************
function x212221_CheckAccept( sceneId, selfId )
end

--**********************************
--Ti�p th�
--**********************************
function x212221_OnAccept( sceneId, selfId )

end

--**********************************
--����
--**********************************
function x212221_OnAbandon( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x212221_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--�����ng������ύ
--**********************************
function x212221_CheckSubmit( sceneId, selfId )
end

--**********************************
--�ύ
--**********************************
function x212221_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	
	-- ��⴫����to� � C�i n�y ֵ��ng����ng��Чto� � 
	local logNum1 = 0
	local item
	local stone

	local bHaveItem = 0
	local bHaveStone = 0
	local temp
	local temp1
	for i, temp in x212221_g_Item do
		if temp.id == selectRadioId  then
			item = temp
			bHaveItem = 1
		end
	end
	
	-- �ύto� � ��Ʒ����Ӧ,ֱ��Tr� v�,��������
	if bHaveItem == 0  then
		return
	end
	
	for i, temp1 in x212221_g_Stone do
		if (10*temp1.level == item.level) or ((10*temp1.level+1 == item.level)) then --�� �i�m��,ֻ��������,��Ϊlua��������.
			stone = temp1
			bHaveStone = 1
		end
	end
	
	-- �Ҳ�����Ӧto� � ʯͷ,ֱ��Tr� v�
	if bHaveStone == 0    then
		return
	end
	
	-- 1,������������ng����ng��λ���ܹ�������Ʒ
	BeginAddItem(sceneId)
		AddItem( sceneId, item.id, 1 )
	local ret = EndAddItem(sceneId,selfId)

	if ret < 1 then
		return
	end
	
	-- 2,����ʯͷ����
	local selfStoneCount = GetItemCount(sceneId,selfId, stone.id) + GetItemCount(sceneId, selfId, stone.id2);
	if stone.num > selfStoneCount   then
		BeginEvent(sceneId)
			strText = format("Xin th� l�i, T�n Ho�ng Ch�u c�n ph�i c� 200 vi�n", tostring(stone.num))
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return		
	end
	
	-- 3,��ⱳ����,�����ʯͷ����,�Ͳ���ִ����ȥ
	local availableStone = LuaFnGetAvailableItemCount( sceneId, selfId, stone.id ) + LuaFnGetAvailableItemCount( sceneId, selfId, stone.id2 );
	if availableStone < stone.num  then
		BeginEvent(sceneId)
			strText = "#{DG_8724_8}"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end	
	
	-- 4,ɾ����Ʒ ����ɾ����to� � 
	local bindNum = LuaFnGetAvailableItemCount(sceneId, selfId, stone.id2);
	if (bindNum >= stone.num) then --��to� � ʯͷ�㹻
		if LuaFnDelAvailableItem(sceneId, selfId, stone.id2, stone.num) == 0 then
			BeginEvent(sceneId)
				strText = "Dong 2";
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return
		end
	else --����
		if (LuaFnDelAvailableItem(sceneId, selfId, stone.id2, bindNum) == 0) or (LuaFnDelAvailableItem(sceneId, selfId, stone.id, stone.num-bindNum) == 0) then
			BeginEvent(sceneId)
				strText = "Dong 2";
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return
		end
	end
	logNum1 = stone.num;
	-- ������
	AddItemListToHuman(sceneId,selfId)
	-- ��¼Log
	LuaFnAuditYanXuanYuExchange(sceneId, selfId, stone.id, logNum1, item.id)
	
	--�m�t ��ɹ�,������Ч
	LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,18,0)
	
	-- �����繫��
	local szItem = GetItemTransfer(sceneId,selfId,0)

  message = format("#W#{_INFOUSR%s}#P�ɹ���#Y������#P��#G�ػʵع�#P�����ȳ�%s��#Y�ػ���#P,������Ϊ��ʾ�м�,���洫to� � #Y#{_INFOMSG%s}#Pm�t c�i����.", 
   										GetName(sceneId, selfId), tostring(stone.num),  szItem);
	AddGlobalCountNews( sceneId, message )	
end

--**********************************
--ɱ����������
--**********************************
function x212221_OnKillObject( sceneId, selfId, objdataId ,objId )
end

--**********************************
--���������¼�
--**********************************
function x212221_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x212221_OnItemChanged( sceneId, selfId, itemdataId )
end



