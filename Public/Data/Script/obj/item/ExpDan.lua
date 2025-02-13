--注意: 

--物品技能to� 鸬 逻辑只能使用基础技能和脚本来实现

--脚本:

--以下喧ng脚本样例:


------------------------------------------------------------------------------------------
--Kinh nghi甿滋补丹使用脚本

--脚本号
x889035_g_scriptId = 889035 

x889035_ExpDan = {{ID =30504067,Exp =5355,flag =MF_TW_EXPDAN10},
		{ID =30504055,Exp =21665,flag =MF_TW_EXPDAN20},
		{ID =30504056,Exp =105080,flag =MF_TW_EXPDAN30},
		{ID =30504057,Exp =348381,flag =MF_TW_EXPDAN40},
		{ID =30504058,Exp =700000,flag =MF_TW_EXPDAN50},
	}

--**********************************
--事件交互入口
--**********************************
function x889035_OnDefaultEvent( sceneId, selfId, bagIndex )
-- 不C C醝 n鄖 接口,但要保留空函数
end

--**********************************
--C醝 n鄖 物品to� 鸬 使用过程喧ng否类似于技能: 
--H� th痭g会T読 执行开始时检测C醝 n鄖 函数to� 鸬 Tr� v�,如果Tr� v玹h b読则忽略后面to� 鸬 类似技能to� 鸬 执行.
--Tr� v�1: 技能类似to� 鸬 物品,可以继续类似技能to� 鸬 执行；Tr� v�0: 忽略后面to� 鸬 操作.
--**********************************
function x889035_IsSkillLikeScript( sceneId, selfId)
	return 1; --C醝 n鄖 脚本C 动作支持
end

--**********************************
--直接Hu� b鲂Ч�: 
--H� th痭g会直接调用C醝 n鄖 接口,并根据C醝 n鄖 函数to� 鸬 Tr� v礨醕 nh以后to� 鸬 流程喧ng否执行.
--Tr� v�1: 已经Hu� b龆杂πЧ�,不再执行后续操作；Tr� v�0: 没有检测到相关效果,继续执行.
--**********************************
function x889035_CancelImpacts( sceneId, selfId )
	return 0; --不C C醝 n鄖 接口,但要保留空函数,并且始终Tr� v�0.
end

--**********************************
--条件检测入口: 
--H� th痭g会T読 技能检测to� 鸬 时间 餴琺调用C醝 n鄖 接口,并根据C醝 n鄖 函数to� 鸬 Tr� v礨醕 nh以后to� 鸬 流程喧ng否执行.
--Tr� v�1: 条件检测通过,可以继续执行；Tr� v�0: 条件检测th b読,中断后续执行.
--**********************************
function x889035_OnConditionCheck( sceneId, selfId )

	--校验使用to� 鸬 物品
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
		
		-- 鹫t 疬㧟物品ID
	local Item = LuaFnGetItemIndexOfUsedItem(sceneId, selfId)
	local iIndex = -1
	for i=1,getn(x889035_ExpDan) do
		if (x889035_ExpDan[i].ID == Item) then
			iIndex = i
		end
	end

	if (iIndex ==-1) then
		return 0
	end
		
	--喧ng否参加过该活动
	local bHave = GetMissionFlag(sceneId, selfId, x889035_ExpDan[iIndex].flag)
	if (bHave ==1) then
		BeginEvent( sceneId )
			AddText( sceneId, "#{TSJH_090224_27}" )
		EndEvent( sceneId )
		DispatchMissionTips( sceneId, selfId )
		return 0
	end

	return 1; --不C 任何条件,并且始终Tr� v�1.
end

--**********************************
--消耗检测及处理入口: 
--H� th痭g会T読 技能消耗to� 鸬 时间 餴琺调用C醝 n鄖 接口,并根据C醝 n鄖 函数to� 鸬 Tr� v礨醕 nh以后to� 鸬 流程喧ng否执行.
--Tr� v�1: 消耗处理通过,可以继续执行；Tr� v�0: 消耗检测th b読,中断后续执行.
--注意: 这不光负责消耗to� 鸬 检测也负责消耗to� 鸬 执行.
--**********************************
function x889035_OnDeplete( sceneId, selfId )
	
		-- 鹫t 疬㧟物品ID
	local Item = LuaFnGetItemIndexOfUsedItem(sceneId, selfId)
	local iIndex = -1
	for i=1,getn(x889035_ExpDan) do
		if (x889035_ExpDan[i].ID == Item) then
			iIndex = i
		end
	end
	if (iIndex ==-1) then
		return 0
	end

	local ExpBonus = x889035_ExpDan[iIndex].Exp;
	AddExp( sceneId, selfId, ExpBonus )
	SetMissionFlag(sceneId, selfId, x889035_ExpDan[iIndex].flag, 1)
	if (Item == 30504058) then
		local szTransfer;
	
		local szPlayerName = LuaFnGetName( sceneId, selfId );
	
		local nItemBagIndex = GetBagPosByItemSn(sceneId, selfId, 30504058);
		if nItemBagIndex >= 0 then		
			szTransfer = GetBagItemTransfer(sceneId,selfId, nItemBagIndex);
		end

		local message = format("#{_INFOUSR%s}#{TSJH_090224_28}#{_INFOMSG%s}#{TSJH_090224_29}", szPlayerName, szTransfer );	
		AddGlobalCountNews( sceneId, message )
	end
	if(0<LuaFnDepletingUsedItem(sceneId, selfId)) then
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
function x889035_OnActivateOnce( sceneId, selfId )

	return 1;
end

--**********************************
--引导心跳处理入口: 
--引导技能会T読 每次心跳结束时调用C醝 n鄖 接口.
--Tr� v�: 1继续下次心跳；0: 中断引导.
--注: 这里喧ng技能生效m祎 次to� 鸬 入口
--**********************************
function x889035_OnActivateEachTick( sceneId, selfId)
	return 1; --不喧ng引导性脚本, 只保留空函数.
end


--**********************************
--醒目提示
--**********************************
function x889035_NotifyTip( sceneId, selfId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end
