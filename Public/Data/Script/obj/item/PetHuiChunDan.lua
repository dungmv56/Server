-- 创建人[ QUFEI 2007-09-26 22:53 UPDATE BugID 25292 ]

-- 人民币宠粮_回春丹 (改成正确T阯)
-- ItemID = 30607001
-- 702001
-- 增加宠物生命值和快乐度
-- 物品可以使用100次
-- 以后每次使用扣m祎 次,扣完就删除物品

-- 宠物通用功能脚本
x702001_g_petCommonId = PETCOMMON

--******************************************************************************
-- 以下部分C 喧ngC 修改to� 鸬 部分
--******************************************************************************

--脚本号 (改成正确脚本号)
x702001_g_scriptId = 702001

-- 增加值 (根据要求改写具体数值)
x702001_g_HPValue = 10000			-- 生命值增加值
x702001_g_MaxHPValue = 0			-- 最大生命值增加值
x702001_g_LifeValue = 0				-- 寿命增加值
x702001_g_HappinessValue = 1	-- 快乐度增加值
x702001_g_MaxUseCount = 100		-- 最大使用次数100次

--标准效果ID (改成宠物吃宠粮to� 鸬 特效)
--g_ImpactID = 0

--******************************************************************************
-- 以上部分C 喧ngC 修改to� 鸬 部分
--******************************************************************************

--脚本

--**********************************
--必须Tr� v� 1 才能正确执行以下流程
--**********************************
function x702001_IsSkillLikeScript( sceneId, selfId)
	return 1
end

--**********************************
--条件检测入口: 
--H� th痭g会T読 技能检测to� 鸬 时间 餴琺调用C醝 n鄖 接口,并根据C醝 n鄖 函数to� 鸬 Tr� v礨醕 nh以后to� 鸬 流程喧ng否执行.
--Tr� v�1: 条件检测通过,可以继续执行；Tr� v�0: 条件检测th b読,中断后续执行.
--**********************************
function x702001_OnConditionCheck( sceneId, selfId )
	--校验使用to� 鸬 物品
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
	
	--  餴琺到当前正T読 使用to� 鸬 物品to� 鸬 tr� tay n鋓
	nIndex = LuaFnGetBagIndexOfUsedItem( sceneId, selfId )	
	ret = CallScriptFunction( x702001_g_petCommonId, "IsPetCanUseFood", sceneId, selfId, nIndex )
	return ret
end

--**********************************
--消耗检测及处理入口: 
--H� th痭g会T読 技能消耗to� 鸬 时间 餴琺调用C醝 n鄖 接口,并根据C醝 n鄖 函数to� 鸬 Tr� v礨醕 nh以后to� 鸬 流程喧ng否执行.
--Tr� v�1: 消耗处理通过,可以继续执行；Tr� v�0: 消耗检测th b読,中断后续执行.
--注意: 这不光负责消耗to� 鸬 检测也负责消耗to� 鸬 执行.
--**********************************
function x702001_OnDeplete( sceneId, selfId )
	if(0<LuaFnDepletingUsedItem(sceneId, selfId)) then
		return 1
	end
	return 0
end

--**********************************
--只会执行m祎 次入口: 
--聚气和瞬发技能会T読 消耗完成后调用C醝 n鄖 接口(聚气结束并且各种条件都Th鯽 m鉵to� 鸬 时候),而引导
--技能也会T読 消耗完成后调用C醝 n鄖 接口(技能to� 鸬 m祎 开始,消耗成功执行之后).
--Tr� v�1: 处理成功；Tr� v�0: 处理th b読.
--注: 这里喧ng技能生效m祎 次to� 鸬 入口
--**********************************
function x702001_OnActivateOnce( sceneId, selfId )

	local bagId	 = LuaFnGetBagIndexOfUsedItem( sceneId, selfId )
	local UseValue = GetBagItemParam( sceneId, selfId, bagId, 8, 2 )
  local ValidValue = x702001_g_MaxUseCount - UseValue

	-- PrintNum(UseValue)
	
	local petGUID_H = LuaFnGetHighSectionOfTargetPetGuid( sceneId, selfId )
	local petGUID_L = LuaFnGetLowSectionOfTargetPetGuid( sceneId, selfId )	
	
	local valueHP = LuaFnGetPetHP( sceneId, selfId, petGUID_H, petGUID_L )
	local MaxHP = LuaFnGetPetMaxHP( sceneId, selfId, petGUID_H, petGUID_L )
	
	local valueHappy = LuaFnGetPetHappiness( sceneId, selfId, petGUID_H, petGUID_L )
	local MaxHappiness = 100
	
	-- PrintNum(valueHP)
	-- PrintNum(MaxHP)
	-- PrintNum(valueHappy)
	
	if valueHP == MaxHP and valueHappy == MaxHappiness then
		x702001_ShowMsg( sceneId, selfId, "Tr鈔 th� kh鬾g c s� d鴑g th裞 錸")
		return 0
	end

	--消耗m祎 次珍兽回春丹
	if bagId >= 0 then		
	
		if UseValue >= x702001_g_MaxUseCount then   --记录to� 鸬 使用次数大于等于最大可用次数,理论上不可能出现.
		    return 0
		end
		
		local CurValue = UseValue + 1
		
		-- PrintNum(CurValue)
		
		SetBagItemParam( sceneId, selfId, bagId, 4, 2, x702001_g_MaxUseCount ) --设置最大次数
		SetBagItemParam( sceneId, selfId, bagId, 8, 2, CurValue ) --设置已用次数
				
		--------------参数设置安全性检测,虽然理论上参数设置不会th b読
		local CheckParam1 = GetBagItemParam( sceneId, selfId, bagId, 4, 2 )   
		local CheckParam2 = GetBagItemParam( sceneId, selfId, bagId, 8, 2 )
		
		-- PrintNum(CheckParam1)
		-- PrintNum(CheckParam2)
		
		if CheckParam1 ~= x702001_g_MaxUseCount then
		    return 0
		end
		if CheckParam2 ~= CurValue then
		    return 0
		end
		--------------参数设置安全性检测,虽然理论上参数设置不会th b読
		
		
		LuaFnRefreshItemInfo( sceneId, selfId, bagId )	--刷新背包信息
	    
		if CurValue >= x702001_g_MaxUseCount then  --当使用次数达到最大次数时,将删除此物品
			local EraseRet = EraseItem( sceneId, selfId, bagId )
			
			-- PrintStr("删除")
			-- PrintNum(EraseRet)
			
			if EraseRet < 0 then      --如果删除th b読,将不会产生任何效果
			  local strMsg = "C Tr鈔 th� h癷 xu鈔 餫n"
				x702001_ShowMsg( sceneId, selfId, strMsg)
				return 0
			end
			
		end
	else
		local strMsg = "C Tr鈔 th� h癷 xu鈔 餫n"
		x702001_ShowMsg( sceneId, selfId, strMsg)
		return 0
	end

	-- 消耗珍兽回春丹完毕

	-- PrintNum(x702001_g_HPValue)

	if x702001_g_HPValue > 0 then
		CallScriptFunction( x702001_g_petCommonId, "IncPetHP", sceneId, selfId, x702001_g_HPValue )
	end

	if x702001_g_MaxHPValue > 0 then
		CallScriptFunction( x702001_g_petCommonId, "IncPetMaxHP", sceneId, selfId, x702001_g_MaxHPValue )
	end

	if x702001_g_LifeValue > 0 then
		CallScriptFunction( x702001_g_petCommonId, "IncPetLife", sceneId, selfId, x702001_g_LifeValue )
	end

	if x702001_g_HappinessValue > 0 then
		local happy = LuaFnGetPet_Happyness(sceneId, selfId, 0)
		
		-- PrintNum(happy)
		
		if valueHappy < 60 then
			local happyes = 61 - valueHappy
			
			-- PrintNum(happyes)
			
			CallScriptFunction( x702001_g_petCommonId, "IncPetHappiness", sceneId, selfId, happyes )
		else
			CallScriptFunction( x702001_g_petCommonId, "IncPetHappiness", sceneId, selfId, x702001_g_HappinessValue )
		end
	end

--	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, g_ImpactID, 0)
	return 1
end

--**********************************
--引导心跳处理入口: 
--引导技能会T読 每次心跳结束时调用C醝 n鄖 接口.
--Tr� v�: 1继续下次心跳；0: 中断引导.
--注: 这里喧ng技能生效m祎 次to� 鸬 入口
--**********************************
function x702001_OnActivateEachTick( sceneId, selfId )
	return 1
end

-- C醝 n鄖 函数没有什么用,但喧ng必须有
function x702001_CancelImpacts( sceneId, selfId )
	return 0
end

function x702001_ShowMsg( sceneId, selfId, strMsg)
	BeginEvent( sceneId )
		AddText( sceneId, strMsg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )    
end
