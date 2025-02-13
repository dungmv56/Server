---------------------------------------------------
--Name: 	2008 5.1活动脚本 之 签名牌秏祎 �
--Author: 	刘盾
--Date: 	2008-04-15
---------------------------------------------------

--脚本号
x808091_g_ScriptId = 808091

--L頽h 声音效果ID

--GlobalLaborDayActivityTable = {
--	PetCageCardID					= 40004446,
--	PetCageLv1 						= 30509500,
--	PetCageDelayBuff 				= 30187,
--	PetCagePresentStartTime 		= 20080415, --秏祎 皇蘩缚际奔�
--	PetCagePresentEndTime 			= 20080417, --秏祎 皇蘩附崾奔�
--	CardPresentStartTime 			= 20080417,	--签名牌开蔯m祎 皇奔�
--	CardPresentEndTime 				= 20080417,	--签名牌结束秏祎 皇奔�
--	MailStartDayTime 				= 20080415,	--发送邮件开始时间
--	MailEndDayTime 					= 20080418	--发送邮件结束时间
--}

--**********************************
--任务入口函数
--**********************************
function x808091_OnDefaultEvent( sceneId, selfId, targetId )

	local ItemID = GetNumText()
	if(ItemID == 808091001) then
		BeginEvent(sceneId)
			AddText(sceneId, "#{SL_20080416_06}")
			AddNumText( sceneId, x808091_g_ScriptId, "Ta mu痭 tham gia", 6, 808091003 )
			AddNumText( sceneId, x808091_g_ScriptId, "Hay l� th鬷 餴", 13, 808091004 )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	--活动帮助
	elseif(ItemID == 808091002) then
		BeginEvent(sceneId)
			AddText(sceneId,"#{SL_20080416_11}")
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)

	elseif(ItemID == 808091003) then
	
		local condition = x808091_CheckActivityCondition(sceneId, selfId)
		
		--发放秏祎 磺┟�,并给m祎 c醝50 ph鷗to� 鸬 buf
		if condition == 0 then
			local is_suc = x808091_PresentPetCageCard(sceneId, selfId, targetId)
			if(is_suc == 1) then
				BeginEvent(sceneId)
					AddText(sceneId, "#{SL_20080416_10}")
				EndEvent( sceneId )
				DispatchEventList( sceneId, selfId, targetId )
			end

		--秏祎 磺┟苩o� 鸬 时间已经过了
		elseif(condition == 1) then
			BeginEvent(sceneId)
				AddText(sceneId, "Xin l瞚, ho誸 鸬ng s� m鬾 l� v 疸 k猼 th鷆 鸨i k� t阯 b鄆")
			EndEvent(sceneId)
			DispatchEventList(sceneId, selfId, targetId)
			
		--已经参加过秏祎 磺┟苩o� 鸬 活动了, 并且已经秏祎 涣耸蘩�
		elseif(condition == 2) then
			BeginEvent(sceneId)
				AddText(sceneId, "#{SL_20080416_09}")
			EndEvent(sceneId)
			DispatchEventList(sceneId, selfId, targetId)
	
		--已经参加,并且身上还带着签名牌
		elseif(condition == 3) then
			BeginEvent(sceneId)
				AddText(sceneId, "#{SL_20080416_08}")
			EndEvent(sceneId)
			DispatchEventList(sceneId, selfId, targetId)
				
		--你还没有加入门派呢
		elseif(condition == 4) then
			BeginEvent(sceneId)
				AddText(sceneId, "#{SL_20080416_07}")
			EndEvent(sceneId)
			DispatchEventList(sceneId, selfId, targetId)	
		end

	elseif(ItemID == 808091004) then
		--关闭界面
		DispatchUICommand(sceneId, selfId, 1000)
	end
end

--**********************************
--列举事件
--**********************************
function x808091_OnEnumerate( sceneId, selfId, targetId )
	if (x808091_IsActivityTimeOut() == 0) then
		AddNumText( sceneId, x808091_g_ScriptId, "Tham gia s� ki畁 s� m鬾 tg l�", 6, 808091001 )
		AddNumText( sceneId, x808091_g_ScriptId, "V� s� ki畁 s� m鬾 tg l�", 11, 808091002 )
	end
end

--**********************************
--检测参与活动to� 鸬 情况
--**********************************
function x808091_CheckActivityCondition(sceneId, selfId)
	--秏祎 磺┟苩o� 鸬 时间已经过了
	if (x808091_IsActivityTimeOut() == 1) then
		return 1
	end
		
	--已经秏祎 还蘩噶�
	local flag = GetMissionFlag(sceneId, selfId, MF_LABORDAY_PETCAGE_GIFT)
	if(flag > 0) then
		return 2
	end
	
	--身上还带着签名牌
	local card_count = GetItemCount(sceneId, selfId, GlobalLaborDayActivityTable.PetCageCardID)
	if (card_count >= 1) then
		return 3
	end
	
	--你还没有加入门派呢
	local mp_id = GetMenPai(sceneId, selfId)
	if (mp_id == 9) then
		return 4
	end
		
	return 0
end

--**********************************
--检测赠送秏祎 慌苩o� 鸬 情况
--**********************************
function x808091_CheckPresentCardCondition(sceneId, selfId)
	--检测任务背包喧ng否有地方
	if (LuaFnGetTaskItemBagSpace( sceneId, selfId ) < 1 ) then
		return 1
	end	
	return 0
end

--**********************************
--检测添加Buffto� 鸬 情况
--**********************************
function x808091_CheckBuffCondition(sceneId, selfId)
	return 0
end


--**********************************
--检测活动喧ng否过期
--**********************************
function x808091_IsActivityTimeOut( )
	local curDayTime = GetTime2Day()
	if (curDayTime < GlobalLaborDayActivityTable.CardPresentStartTime) then 
		return 1
	
	elseif (curDayTime > GlobalLaborDayActivityTable.CardPresentEndTime) then
		return 1
	end
	return 0
end

--**********************************
--检测邮件通知时间喧ng否过期
--**********************************
function x808091_IsMailTimeOut( )
	local curDayTime = GetTime2Day()
	if (curDayTime < GlobalLaborDayActivityTable.MailStartDayTime) then
		return 1
	elseif (curDayTime > GlobalLaborDayActivityTable.MailEndDayTime) then
		return 1
	end
	return 0
end

--**********************************
--赠送秏祎 慌�,加buff
--**********************************
function x808091_PresentPetCageCard(sceneId, selfId, targetId)

	local present_card_condition = x808091_CheckPresentCardCondition(sceneId, selfId)

	--可以添加秏祎 慌�
	if (present_card_condition == 0) then
		--发放m祎 c醝"活动兑奖牌"
		BeginAddItem(sceneId)
			AddItem(sceneId, GlobalLaborDayActivityTable.PetCageCardID, 1)
		EndAddItem(sceneId, selfId)
		AddItemListToHuman(sceneId, selfId)--加物品给玩家
		
		--公告玩家自己
		BroadMsgByChatPipe( sceneId, selfId, "Ng呓i 鹫t 疬㧟 m祎 c醝 th� lan l� v k� t阯 b鄆", MSG2PLAYER_PARA )	
		
		--醒目提示
		BeginEvent( sceneId )
			AddText( sceneId, "Ng呓i 鹫t 疬㧟 m祎 c醝 th� lan l� v k� t阯 b鄆." )
		EndEvent( sceneId )
		DispatchMissionTips( sceneId, selfId )
		
		--添加50 ph鷗to� 鸬 特效
		x808091_PresentPetCageBuffer(sceneId, selfId)
		return 1
	
	--任务物品Ch� tr痭g trong t鷌 x醕h kh鬾g 瘘
	elseif(present_card_condition == 1) then		
		BeginEvent(sceneId)
			AddText(sceneId, "� nhi甿 v� 疸 馥y, mong h銀 s x猵 l読")
		EndEvent(sceneId)
		DispatchMissionTips( sceneId, selfId )
		return 0
	end
	
end

--**********************************
--给玩家添加秏祎 籅uff
--**********************************
function x808091_PresentPetCageBuffer(sceneId, selfId)
	LuaFnCancelSpecificImpact( sceneId, selfId, GlobalLaborDayActivityTable.PetCageDelayBuff )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, GlobalLaborDayActivityTable.PetCageDelayBuff, 100 )
end

--**********************************
--给新玩家发邮件
--**********************************
function x808091_OnPlayerLogin( sceneId, selfId )
	if ( x808091_IsMailTimeOut() == 0 ) then
		local flag = GetMissionFlag(sceneId, selfId, MF_LABORDAY_PETCAGE_MAIL)
		if (flag == 0) then
			LuaFnSendSystemMail( sceneId, GetName( sceneId, selfId ), "#{SL_20080416_01}" )
			SetMissionFlag(sceneId, selfId, MF_LABORDAY_PETCAGE_MAIL, 1)
		end
	end
end
