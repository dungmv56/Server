--07圣诞元旦

--幸福雪球使用脚本


--脚本号
x300064_g_scriptId = 300064

x300064_g_GiftTbl = {

	30501101,
	30501102,
	30501015,
	30008022,
	30008023,
	30008024,
	30505034,
	30505035,
	30505036,
	30505037

}


--**********************************
--事件交互入口
--**********************************
function x300064_OnDefaultEvent( sceneId, selfId, bagIndex )
-- 不C C醝 n鄖 接口,但要保留空函数
end

--**********************************
--C醝 n鄖 物品to� 鸬 使用过程喧ng否类似于技能: 
--H� th痭g会T読 执行开始时检测C醝 n鄖 函数to� 鸬 Tr� v�,如果Tr� v玹h b読则忽略后面to� 鸬 类似技能to� 鸬 执行.
--Tr� v�1: 技能类似to� 鸬 物品,可以继续类似技能to� 鸬 执行；Tr� v�0: 忽略后面to� 鸬 操作.
--**********************************
function x300064_IsSkillLikeScript( sceneId, selfId)
	return 1; --C醝 n鄖 脚本C 动作支持
end

--**********************************
--直接Hu� b鲂Ч�: 
--H� th痭g会直接调用C醝 n鄖 接口,并根据C醝 n鄖 函数to� 鸬 Tr� v礨醕 nh以后to� 鸬 流程喧ng否执行.
--Tr� v�1: 已经Hu� b龆杂πЧ�,不再执行后续操作；Tr� v�0: 没有检测到相关效果,继续执行.
--**********************************
function x300064_CancelImpacts( sceneId, selfId )
	return 0; --不C C醝 n鄖 接口,但要保留空函数,并且始终Tr� v�0.
end

--**********************************
--条件检测入口: 
--H� th痭g会T読 技能检测to� 鸬 时间 餴琺调用C醝 n鄖 接口,并根据C醝 n鄖 函数to� 鸬 Tr� v礨醕 nh以后to� 鸬 流程喧ng否执行.
--Tr� v�1: 条件检测通过,可以继续执行；Tr� v�0: 条件检测th b読,中断后续执行.
--**********************************
function x300064_OnConditionCheck( sceneId, selfId )

	--校验使用to� 鸬 物品
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end

	local targetId = LuaFnGetTargetObjID(sceneId, selfId)
	if targetId < 0 then
		return 0
	end

	local objType = GetCharacterType( sceneId, targetId )

	if objType == 1 then--打to� 鸬 喧ng玩家....

			--不能对自己使用....
		if selfId == targetId then
			LuaFnSendOResultToPlayer(sceneId, selfId, OR_INVALID_TARGET)
			return 0
		end

	elseif objType == 2 then--打to� 鸬 喧ngNPC....

		--如果喧ng对NPC使用to� 鸬 话....检测它喧ng否喧ng雪人....
		local ret = CallScriptFunction( 050023, "CanThrowSnowBall", sceneId, selfId, targetId )
		if ret ~= 1 then
			LuaFnSendOResultToPlayer(sceneId, selfId, OR_INVALID_TARGET)
			return 0
		end

	else

		LuaFnSendOResultToPlayer(sceneId, selfId, OR_INVALID_TARGET)
		return 0

	end

	return 1

end

--**********************************
--消耗检测及处理入口: 
--H� th痭g会T読 技能消耗to� 鸬 时间 餴琺调用C醝 n鄖 接口,并根据C醝 n鄖 函数to� 鸬 Tr� v礨醕 nh以后to� 鸬 流程喧ng否执行.
--Tr� v�1: 消耗处理通过,可以继续执行；Tr� v�0: 消耗检测th b読,中断后续执行.
--注意: 这不光负责消耗to� 鸬 检测也负责消耗to� 鸬 执行.
--**********************************
function x300064_OnDeplete( sceneId, selfId )
	if(LuaFnDepletingUsedItem(sceneId, selfId)) then
		return 1;
	end
	return 0;
end

--**********************************
--只会执行m祎 次入口: 
--聚气和瞬发技能会T読 消耗完成后调用C醝 n鄖 接口(聚气结束并且各种条件都Th鯽 m鉵to� 鸬 时候),而引导
--技能也会T読 消耗完成后调用C醝 n鄖 接口(技能to� 鸬 m祎 开始,消耗成功执行之后).
--Tr� v�1: 处理成功；Tr� v�0: 处理th b読.
--注: 这里喧ng技能生效m祎 次to� 鸬 入口
--**********************************
function x300064_OnActivateOnce( sceneId, selfId )
	
	local targetId = LuaFnGetTargetObjID(sceneId, selfId)
	if targetId < 0 then
		return 1
	end
	local objType = GetCharacterType( sceneId, targetId )

	if objType == 1 then--打to� 鸬 喧ng其他玩家....

		--1/12概率(9%)打中对方....给对方m祎 c醝特效....并醒目提示....
		local rand = random(100)
		if rand < 9 then
				LuaFnSendSpecificImpactToUnit(sceneId, targetId, targetId, targetId, 10482, 0)
				BeginEvent( sceneId )
					AddText( sceneId, "Ng呓i b� "..LuaFnGetName(sceneId,selfId).."h課h ph鷆 tuy猼 c n閙 tr鷑g!" )
				EndEvent( sceneId )
				DispatchMissionTips( sceneId, targetId )
		end

	elseif objType == 2 then--打to� 鸬 喧ng雪人....

		local ret = CallScriptFunction( 050023, "OnHitBySnowBall", sceneId, selfId, targetId )
		if ret == 1 then
			LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 10481, 0)
		else
			LuaFnSendOResultToPlayer(sceneId, selfId, OR_INVALID_TARGET)
			return 1
		end

	else

		LuaFnSendOResultToPlayer(sceneId, selfId, OR_INVALID_TARGET)
		return 1

	end

	--40c(含)使用本物品有m祎 定几率会 鹫t 疬㧟奖品....
	if GetLevel(sceneId, selfId) < 40 then
		return 1
	end

	--1/500 鹫t 疬㧟东西....
	local GoodLuck = random(5000)
	if GoodLuck > 10 then
		return 1
	end

	local idx = random( getn(x300064_g_GiftTbl) )
	local ItemId = x300064_g_GiftTbl[idx]
	local BagIndex = TryRecieveItem( sceneId, selfId, ItemId, QUALITY_MUST_BE_CHANGE )
	if BagIndex ~= -1 then

		local playerName = GetName(sceneId, selfId)
		local transfer = GetBagItemTransfer(sceneId,selfId,BagIndex)

		msg = format("#{_INFOUSR%s}#P 餰m h課h ph鷆 tuy猼 c n閙 餴 ra ngo鄆, #{_INFOMSG%s}#P t� tr阯 tr秈 r総 xu痭g, m祎 #{_INFOUSR%s}#P.", playerName, transfer, playerName )
		BroadMsgByChatPipe(sceneId, selfId, msg, 4)

	end

	return 1;

end

--**********************************
--引导心跳处理入口: 
--引导技能会T読 每次心跳结束时调用C醝 n鄖 接口.
--Tr� v�: 1继续下次心跳；0: 中断引导.
--注: 这里喧ng技能生效m祎 次to� 鸬 入口
--**********************************
function x300064_OnActivateEachTick( sceneId, selfId)
	return 1; --不喧ng引导性脚本, 只保留空函数.
end
