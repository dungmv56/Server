--Gi�m иnh T� Ch�t Trang B�
--�ű���
x809261_g_ScriptId = 809261

--Gi�m иnh T� Ch�t Trang B�UI 1001

--**********************************
--�о��¼�
--**********************************
function x809261_OnEnumerate( sceneId, selfId, targetId )

end


--**********************************
--Gi�m иnh T� Ch�t Trang B�
--**********************************
function x809261_FinishAdjust( sceneId, selfId, nItemIndex)
	local ret = LuaFnIsItemLocked( sceneId, selfId, nItemIndex)
	
	if ret ~= 0 then
		BeginEvent(sceneId)
		AddText(sceneId,"Kh�ng d�ng ���c trang b� n�y");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	ret = LuaFnIsJudgeApt( sceneId, selfId, nItemIndex )
	if ret == -1 then
		BeginEvent(sceneId)
		AddText(sceneId,"Kh�ng th� s� d�ng v�t ph�m n�y");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	if ret == 1 then
		BeginEvent(sceneId)
		AddText(sceneId,"V�t ph�m n�y �� gi�m �nh ch�t l��ng");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	if ret == 2 then
		BeginEvent(sceneId)
		AddText(sceneId,"V�t ph�m n�y ch�a gi�m �nh, kh�ng th� ti�n h�nh gi�m �nh ch�t l��ng");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	if ret == 3 then
		BeginEvent(sceneId)
		AddText(sceneId,"V�t ph�m n�y kh�ng c� t� ch�t, kh�ng th� ti�n h�nh gi�m �nh ch�t l��ng");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	money = GetMoney( sceneId, selfId )+GetMoneyJZ(sceneId, selfId);
	equip_level = GetBagItemLevel( sceneId, selfId, nItemIndex )
	need_money = 20000
	if equip_level < 10 then
		need_money = 10
	elseif equip_level < 20 then
		need_money = 100
	elseif equip_level < 30 then
		need_money = 1000
	elseif equip_level < 40 then
		need_money = 3000
	elseif equip_level < 50 then
		need_money = 4000
	elseif equip_level < 60 then
		need_money = 5000
	elseif equip_level < 70 then
		need_money = 6000
	elseif equip_level < 80 then
		need_money = 7000
	elseif equip_level < 90 then
		need_money = 8000
	elseif equip_level < 100 then
		need_money = 10000
	elseif equip_level < 110 then
		need_money = 20000
	elseif equip_level < 120 then
		need_money = 30000
	else
		need_money = 40000
	end
	
	if money < need_money then
		BeginEvent(sceneId)
		AddText(sceneId,"Kh�ng �� ng�n l��ng");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	local jiaoZi, jinBi = LuaFnCostMoneyWithPriority( sceneId, selfId, need_money )
	if jiaoZi == -1 then
		BeginEvent(sceneId)
		AddText(sceneId,"Kh�ng bi�t l�i");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	ret = LuaFnJudgeApt( sceneId, selfId, nItemIndex )
	if ret == 1 then
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 49, 0);
		BeginEvent(sceneId)
		AddText(sceneId,"Gi�m �nh t� ch�t trang b� th�nh c�ng");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	else
		BeginEvent(sceneId)
		AddText(sceneId,"Kh�ng bi�t l�i");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
end




--**********************************
--���¼���װ������(ϴ����)
--**********************************
function x809261_FinishReAdjust( sceneId, selfId, nEquItemIndex )

	-- ���װ����ng�����....
	local ret = LuaFnIsItemLocked( sceneId, selfId, nEquItemIndex)
	if ret ~= 0 then
		BeginEvent(sceneId)
			AddText(sceneId,"Kh�ng d�ng ���c trang b� n�y");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	-- �����ng���н��ɰ....
	itemCount = LuaFnGetAvailableItemCount(sceneId, selfId, 30008034)
	itemCount2 = LuaFnGetAvailableItemCount(sceneId, selfId, 30008048)
	if itemCount < 1 and itemCount2 < 1 then
		BeginEvent(sceneId)
			AddText(sceneId,"C�c h� thi�u Kim C߽ng Sa.");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	-- ���װ������to� � �������....
	ret = LuaFnIsJudgeApt( sceneId, selfId, nEquItemIndex )
	if ret == -1 then
		BeginEvent(sceneId)
			AddText(sceneId,"Kh�ng th� s� d�ng v�t ph�m n�y");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	if ret == 0 then
		BeginEvent(sceneId)
			AddText(sceneId,"V�t ph�m n�y v�n ch�a gi�m �nh t� ch�t qua, xin h�y ti�n h�nh gi�m �nh t� ch�t trang b� tr߾c.");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	--if ret == 1 then
	-- 1 �����Ѿ�����������....
	--end
	if ret == 2 then
		BeginEvent(sceneId)
			AddText(sceneId,"V�t ph�m n�y v�n ch�a gi�m �nh qua, xin h�y ti�n h�nh gi�m �nh tr߾c.");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	if ret == 3 then
		BeginEvent(sceneId)
			AddText(sceneId,"V�t ph�m n�y kh�ng c� t� ch�t, kh�ng th� ti�n h�nh gi�m �nh ch�t l��ng");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	-- ����Ǯ��ng��....
	money = GetMoney( sceneId, selfId )+GetMoneyJZ(sceneId, selfId);
	equip_level = GetBagItemLevel( sceneId, selfId, nEquItemIndex )
	need_money = 20 * equip_level + 50
	
	if money < need_money then
		BeginEvent(sceneId)
			AddText(sceneId,"Ti�n c�c h� mang theo kh�ng ��.");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	--���װ����ng����ng��
	ret = LuaFnGetItemBindStatus( sceneId, selfId, nEquItemIndex )
	--�۳�������ng: ������,Ȼ����ng���ɰ����.Ҳ�Ϳ۳�������ng�󶨽��ɰ,�󶨽���,���ɰ,����
	--�Ұ󶨽��ɰ
	local ShaPos = GetBagPosByItemSnAvailableBind(sceneId, selfId, 30008034, tonumber(1) )
	
	local needBind = 0
	
	if ret == 0 then
		if ShaPos ~= -1 then
			needBind = 1
		end
	end
	
	local ShaPos2 = -1
	if ShaPos == -1 then --�Ұ󶨽���
		ShaPos2 = GetBagPosByItemSnAvailableBind(sceneId, selfId, 30008048, tonumber(1))
	end
	
	if ret == 0 then
		if ShaPos2 ~= -1 then
			needBind = 1
		end
	end
	
	if ShaPos == -1 and ShaPos2 == -1 then --�ҽ��ɰ
		ShaPos = GetBagPosByItemSnAvailableBind(sceneId, selfId, 30008034, tonumber(0))
	end
	
	if ShaPos == -1 and ShaPos2 == -1 then --�ҽ���
		ShaPos2 = GetBagPosByItemSnAvailableBind(sceneId, selfId, 30008048, tonumber(0))
	end

	local ShaInfo = 0
	-- �۽��ɰ�����....
	if ShaPos ~= -1 then
		ShaInfo = GetBagItemTransfer( sceneId, selfId, ShaPos )
	
		ret = LuaFnEraseItem(sceneId, selfId, ShaPos)
		if ret ~= 1 then
			BeginEvent(sceneId)
				AddText(sceneId,"Kim C߽ng Sa kh�ng th� s� d�ng.");
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return
		end
	elseif ShaPos2 ~= -1 then
		ShaInfo = GetBagItemTransfer( sceneId, selfId, ShaPos2 )

		local r, t = LuaFnEraseItemTimes( sceneId, selfId, ShaPos2, 11 )

			BeginEvent(sceneId)
			local	szMsg				= format( "S� l�n s� d�ng c�n �i: %d/%d", tonumber(t), tonumber(11) );
			AddText(sceneId,szMsg);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
	end
	
	-- ���¼���װ������....
	
	ret = LuaFnReSetItemApt( sceneId, selfId, nEquItemIndex )
	if ret == 1 then

		-- ��Ǯ....
		LuaFnCostMoneyWithPriority( sceneId, selfId, need_money ) --zchw

		-- �Ӽ����ɹ���Ч....
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 49, 0);
		
		--��
		if needBind == 1 then
			LuaFnItemBind( sceneId, selfId, nEquItemIndex )
		end

		BeginEvent(sceneId)
			AddText(sceneId,"Gi� �nh l�i t� ch�t trang b� th�nh c�ng");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return

	elseif ret == 2 or ret == 3 then -- zchw for notice
		
		-- [ QUFEI 2007-09-17 17:22 UPDATE BugID 25245 ]
		-- ��Ǯ....
		LuaFnCostMoneyWithPriority( sceneId, selfId, need_money ) --zchw

		-- �Ӽ����ɹ���Ч....
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 49, 0);
		
		--��
		if needBind == 1 then
			LuaFnItemBind( sceneId, selfId, nEquItemIndex )
		end

		BeginEvent(sceneId)
			AddText(sceneId,"Gi� �nh l�i t� ch�t trang b� th�nh c�ng");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)

		--������....
		x809261_ReAdjustNotify( sceneId, selfId, ret, ShaPos, ShaPos2, ShaInfo, nEquItemIndex )

		return

	else
	
		BeginEvent(sceneId)
		AddText(sceneId,"Kh�ng bi�t l�i");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return

	end

end


--**********************************
--���¼���װ�����ʹ���
--**********************************
function x809261_ReAdjustNotify( sceneId, selfId, ret, ShaPos, ShaPos2, ShaInfo, nEquItemIndex )

	local Name = GetName(sceneId, selfId)		
	local itemInfo = GetBagItemTransfer( sceneId, selfId, nEquItemIndex )
	local strText
	local nEquipID = LuaFnGetItemTableIndexByIndex( sceneId, selfId, nEquItemIndex )

	--ֻ���ض�����to� � װ��ϴ����250����to� � ����ʱ....������ϴ����c�pװ��to� � ����....
	--1ñ�� 2�·� 3���� 4Ь 15����
	-- ���� 0������6,11��ָ(2c�i)��12,13����(2c�i)
	if ret == 3 then
		local EquipPoint = GetItemEquipPoint( nEquipID )
		if EquipPoint~= 1 and EquipPoint~= 2 and EquipPoint~= 3 and EquipPoint~= 4 and EquipPoint~= 15  and EquipPoint ~= 0 and EquipPoint ~= 6 and EquipPoint ~= 11 and EquipPoint ~= 12 and EquipPoint ~= 13 and EquipPoint ~= 17 then
			ret = 2
		end
	end


	--�������ϴ����250���Ͼͻᷢϴ����c�pװ��to� � ����....
	if ret == 3 then

		if ShaPos ~= -1 then
			strText = format("#W#{_INFOUSR%s}#{AQ_16}#{_INFOMSG%s}#{AQ_17}#{_INFOMSG%s}#{AQ_18}", Name, ShaInfo, itemInfo);
			BroadMsgByChatPipe(sceneId,selfId, strText, 4)
		elseif ShaPos2 ~= -1 then
			strText = format("#W#{AQ_28}#{_INFOUSR%s}#H s� d�ng #{_INFOMSG%s}#{AQ_29}#{_INFOMSG%s}#{AQ_30}", Name, ShaInfo, itemInfo);
			BroadMsgByChatPipe(sceneId,selfId, strText, 4)
		end

	end


	--�������û��ϴ����250����....��Ҳ�Ѿ��ﵽ����....�ͻᷢϴ����ͨװ��to� � ����....
	if ret == 2 then

		if ShaPos ~= -1 then
			local rand = random( 4 )
			if rand == 1 then
				strText = format("#W#{_INFOUSR%s}#{AQ_1}#{_INFOMSG%s}#{JinGangSha_1B}#{_INFOMSG%s}#{AQ_6}", Name, ShaInfo, itemInfo )
			elseif rand == 2 then
				strText = format("#W#{_INFOUSR%s}#{AQ_3}#{_INFOMSG%s}#{JinGangSha_2B}#{_INFOMSG%s}#{AQ_8}", Name, ShaInfo, itemInfo )
			elseif rand == 3 then
				strText = format("#W#{_INFOUSR%s}#{AQ_5}#{_INFOMSG%s}#{JinGangSha_3B}#{_INFOMSG%s}#{AQ_2}", Name, ShaInfo, itemInfo )
			elseif rand == 4 then
				strText = format("#W#{_INFOUSR%s}#{AQ_7}#{_INFOMSG%s}#{JinGangSha_4B}#{_INFOMSG%s}#{AQ_4}", Name, ShaInfo, itemInfo )
			end
			BroadMsgByChatPipe(sceneId,selfId, strText, 4)
		elseif ShaPos2 ~= -1 then
			local rand = random( 3 )
			if rand == 1 then
				strText = format("#W#{_INFOUSR%s}#{AQ_19}#{_INFOMSG%s}#{AQ_20}#{_INFOMSG%s}#{AQ_21}", Name, ShaInfo, itemInfo )
			elseif rand == 2 then
				strText = format("#W#{_INFOUSR%s}#{AQ_22}#{_INFOMSG%s}#{AQ_23}#{_INFOMSG%s}#{AQ_24}", Name, ShaInfo, itemInfo )
			elseif rand == 3 then
				strText = format("#W#{AQ_25}#{_INFOUSR%s}#{AQ_26}#{_INFOMSG%s}#{AQ_27}#{_INFOMSG%s}.", Name, ShaInfo, itemInfo )
			end
			BroadMsgByChatPipe(sceneId,selfId, strText, 4)
		end

	end


end
