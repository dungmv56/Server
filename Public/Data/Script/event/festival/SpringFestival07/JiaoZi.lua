--注意: 

--物品技能to� 鸬 逻辑只能使用基础技能和脚本来实现

--脚本:

--以下喧ng脚本样例:


--JiaoZi.lua
------------------------------------------------------------------------------------------
--m祎 般物品to� 鸬 默认脚本

--脚本号
x050057_g_scriptId = 050057 --临时写C醝 n鄖 ,真正用to� 鸬 时候m祎 定要改.

--buffto� 鸬 列表
x050057_g_Impact = {

		3004,
}

x050057_g_Impact1 = {
					10490,
					10491,
					10492,
					10493,
}

--吃到好东西to� 鸬 公告
x050057_g_strGetItem = {

	"",
	"",
	"",
}

x050057_g_GetItem =
{
	30505167,
	30505168,
	30505169,
}
--**********************************
--事件交互入口
--**********************************
function x050057_OnDefaultEvent( sceneId, selfId, bagIndex )
-- 不C C醝 n鄖 接口,但要保留空函数
end

--**********************************
--C醝 n鄖 物品to� 鸬 使用过程喧ng否类似于技能: 
--H� th痭g会T読 执行开始时检测C醝 n鄖 函数to� 鸬 Tr� v�,如果Tr� v玹h b読则忽略后面to� 鸬 类似技能to� 鸬 执行.
--Tr� v�1: 技能类似to� 鸬 物品,可以继续类似技能to� 鸬 执行；Tr� v�0: 忽略后面to� 鸬 操作.
--**********************************
function x050057_IsSkillLikeScript( sceneId, selfId)
	return 1; --C醝 n鄖 脚本C 动作支持
end

--**********************************
--直接Hu� b鲂Ч�: 
--H� th痭g会直接调用C醝 n鄖 接口,并根据C醝 n鄖 函数to� 鸬 Tr� v礨醕 nh以后to� 鸬 流程喧ng否执行.
--Tr� v�1: 已经Hu� b龆杂πЧ�,不再执行后续操作；Tr� v�0: 没有检测到相关效果,继续执行.
--**********************************
function x050057_CancelImpacts( sceneId, selfId )
	return 0; --不C C醝 n鄖 接口,但要保留空函数,并且始终Tr� v�0.
end

--**********************************
--条件检测入口: 
--H� th痭g会T読 技能检测to� 鸬 时间 餴琺调用C醝 n鄖 接口,并根据C醝 n鄖 函数to� 鸬 Tr� v礨醕 nh以后to� 鸬 流程喧ng否执行.
--Tr� v�1: 条件检测通过,可以继续执行；Tr� v�0: 条件检测th b読,中断后续执行.
--**********************************
function x050057_OnConditionCheck( sceneId, selfId )
	--校验使用to� 鸬 物品
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
	
	local	bagId	= LuaFnGetBagIndexOfUsedItem( sceneId, selfId )
	if bagId < 0 then
		return 0
	end
	
	local OwnGUID	= GetBagItemParam( sceneId, selfId, bagId, 4, 2 )
	OwnGUID = OwnGUID + 2147483648
	local SelfGUID = LuaFnGetGUID( sceneId, selfId )
	if OwnGUID == SelfGUID then
		BeginEvent( sceneId )
			AddText( sceneId, "礼品饺子只能交易给别人使用." )
		EndEvent( sceneId )
		DispatchMissionTips( sceneId, selfId )
		return 0
	end

	if LuaFnGetPropertyBagSpace(sceneId, selfId) == 0 then
		BeginEvent( sceneId )
			AddText( sceneId, "#{LLFB_80821_6}" )
		EndEvent( sceneId )
		DispatchMissionTips( sceneId, selfId )
		return 0
	end

	
	--local id = selfId
	--local itemTblIndex = LuaFnGetItemIndexOfUsedItem( sceneId, selfId )
	
	--if 30001035 < itemTblIndex then
		--id = LuaFnGetTargetObjID(sceneId, selfId)
		--if(1~=LuaFnUnitIsFriend(sceneId, selfId, id)) then
		--	SendOResultToPlayer(sceneId, selfId, OR_INVALID_TARGET)
			--return 0;
	--	end	
	--end
	--加血to� 鸬 满血检查
	--if(GetHp(sceneId, id) >= GetMaxHp(sceneId, id)) then
	--	LuaFnSendOResultToPlayer(sceneId, selfId, OR_HEALTH_IS_FULL)
	--	return 0
	--end
	

	return 1;
end

--**********************************
--消耗检测及处理入口: 
--H� th痭g会T読 技能消耗to� 鸬 时间 餴琺调用C醝 n鄖 接口,并根据C醝 n鄖 函数to� 鸬 Tr� v礨醕 nh以后to� 鸬 流程喧ng否执行.
--Tr� v�1: 消耗处理通过,可以继续执行；Tr� v�0: 消耗检测th b読,中断后续执行.
--注意: 这不光负责消耗to� 鸬 检测也负责消耗to� 鸬 执行.
--**********************************
function x050057_OnDeplete( sceneId, selfId )
	--不消耗....后边还要使用存到物品上to� 鸬 信息呢....
	return 1;
end

--**********************************
--只会执行m祎 次入口: 
--聚气和瞬发技能会T読 消耗完成后调用C醝 n鄖 接口(聚气结束并且各种条件都Th鯽 m鉵to� 鸬 时候),而引导
--技能也会T読 消耗完成后调用C醝 n鄖 接口(技能to� 鸬 m祎 开始,消耗成功执行之后).
--Tr� v�1: 处理成功；Tr� v�0: 处理th b読.
--注: 这里喧ng技能生效m祎 次to� 鸬 入口
--**********************************
function x050057_OnActivateOnce( sceneId, selfId )

	--自己不能使用....
	local	bagId	= LuaFnGetBagIndexOfUsedItem( sceneId, selfId )
	if bagId < 0 then
		return
	end
	
	local OwnGUID	= GetBagItemParam( sceneId, selfId, bagId, 4, 2 )
	OwnGUID = OwnGUID + 2147483648
	local SelfGUID = LuaFnGetGUID( sceneId, selfId )
	if OwnGUID == SelfGUID then
		BeginEvent( sceneId )
			AddText( sceneId, "礼品饺子只能交易给别人使用." )
		EndEvent( sceneId )
		DispatchMissionTips( sceneId, selfId )
		return
	end
	
	--扣物品....
	if LuaFnDepletingUsedItem(sceneId, selfId) <= 0 then
		return
	end

	--加buff....增加特效
	local id = selfId
	local itemTblIndex = LuaFnGetItemIndexOfUsedItem( sceneId, selfId )
	
	--if 30001035 < itemTblIndex then
		--id = LuaFnGetTargetObjID(sceneId, selfId)
		--if(1~=LuaFnUnitIsFriend(sceneId, selfId, id)) then
			--SendOResultToPlayer(sceneId, selfId, OR_INVALID_TARGET)
			--return 0;
		--end
		
	--end
	
	local impactID = x050057_g_Impact[1]
	LuaFnSendSpecificImpactToUnit(sceneId, id, id, id, impactID, 0);

	local randImpact = random(4)
	LuaFnSendSpecificImpactToUnit(sceneId, id, id, id, x050057_g_Impact1[randImpact], 0);
	
	local level = GetLevel( sceneId, selfId )
	local rand10 = random(10)
	
	if level < 30 and rand10 > 1 then
			return 0
	end
	
	--随机产生不同to� 鸬 金币
	local GoodLuck = random(4000)
	
	
	if GoodLuck < 5 then
	
		local BagIndex = TryRecieveItem( sceneId, selfId, x050057_g_GetItem[1], QUALITY_MUST_BE_CHANGE )
		if BagIndex ~= -1 then
			--发公告....
			local ItemInfo = GetBagItemTransfer( sceneId, selfId, BagIndex )
			local str = format("#W#{_INFOUSR%s}#PT読 热腾腾to� 鸬 饺子咬到m祎 c醝硬物,吐出m祎 看竟喧ngm祎 枚#cB3DB35#{_INFOMSG%s}#P,不禁喜笑颜开.祝牛年财源滚滚,万事如意.", GetName(sceneId,selfId), ItemInfo)
			BroadMsgByChatPipe( sceneId, selfId, str, 4 )
		end
	elseif GoodLuck > 1500 and GoodLuck < 1511 then
		local BagIndex = TryRecieveItem( sceneId, selfId, x050057_g_GetItem[2], QUALITY_MUST_BE_CHANGE )
		
		if BagIndex ~= -1 then
			local ItemInfo = GetBagItemTransfer( sceneId, selfId, BagIndex )
			local str = format("#W#{_INFOUSR%s}#PT読 热腾腾to� 鸬 饺子咬到m祎 c醝硬物,吐出m祎 看竟喧ngm祎 枚#cB3DB35#{_INFOMSG%s}#P,不禁喜笑颜开.祝牛年财源滚滚,万事如意.", GetName(sceneId,selfId), ItemInfo)
			BroadMsgByChatPipe( sceneId, selfId, str, 4 )
		end
	elseif GoodLuck > 2500 and GoodLuck < 2901 then
		local BagIndex = TryRecieveItem( sceneId, selfId, x050057_g_GetItem[3], QUALITY_MUST_BE_CHANGE )
		
		if BagIndex ~= -1 then
			--local str = format("#W#{_INFOUSR%s}#PT読 热腾腾to� 鸬 饺子咬到m祎 c醝硬物,吐出m祎 看竟喧ngm祎 枚#H#{_ITEM%d}#P,不禁喜笑颜开.祝牛年财源滚滚,万事如意.", GetName(sceneId,selfId), x050057_g_GetItem[3])
			--BroadMsgByChatPipe( sceneId, selfId, str, 4 )
		end
	end
	
	return 1;
end

--**********************************
--引导心跳处理入口: 
--引导技能会T読 每次心跳结束时调用C醝 n鄖 接口.
--Tr� v�: 1继续下次心跳；0: 中断引导.
--注: 这里喧ng技能生效m祎 次to� 鸬 入口
--**********************************
function x050057_OnActivateEachTick( sceneId, selfId)
	return 1; --不喧ng引导性脚本, 只保留空函数.
end
