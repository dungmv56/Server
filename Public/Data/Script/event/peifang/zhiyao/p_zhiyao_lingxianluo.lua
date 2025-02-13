--Linh.仙罗配方脚本
--对应生活技能 制药

--脚本号
x700191_g_scriptId = 700191

--C to� 鸬 等c
x700191_g_AbilityNeedLevel = 10
--配方to� 鸬 ID
x700191_g_RecipeId = 191
--顺发特效ID
x700191_g_SpecialEffectID = 18;
--**********************************
--事件交互入口
--**********************************
function x700191_OnDefaultEvent( sceneId, selfId, bagIndex )
--	-- 鹫t 疬㧟玩家生活技能等c
--	AbilityLevel = QueryHumanAbilityLevel(sceneId,selfId ,ABILITY_PENGREN)

--	if AbilityLevel < x700191_g_AbilityNeedLevel then
--		BeginEvent(sceneId)
--			strText = "技能等c不足"
--			AddText(sceneId,strText);
--		EndEvent(sceneId)
--		DispatchMissionTips(sceneId,selfId)
--		return
--	end
--	-- 调用通用配方学习
--	SelfDestructFlag = CallScriptFunction( USERECIPE_SCRIPT, "ReadRecipe", sceneId, selfId, x700191_g_RecipeId )
--
--	-- 学完以后自我摧毁
--	if SelfDestructFlag > 0 then
--		EraseItem(sceneId, selfId, bagIndex)
--	end
end

--**********************************
--C醝 n鄖 物品to� 鸬 使用过程喧ng否类似于技能: 
--H� th痭g会T読 执行开始时检测C醝 n鄖 函数to� 鸬 Tr� v�,如果Tr� v玹h b読则忽略后面to� 鸬 类似技能to� 鸬 执行.
--Tr� v�1: 技能类似to� 鸬 物品,可以继续类似技能to� 鸬 执行；Tr� v�0: 忽略后面to� 鸬 操作.
--**********************************
function x700191_IsSkillLikeScript( sceneId, selfId)
	return 1;
end
--**********************************
--直接Hu� b鲂Ч�: 
--H� th痭g会直接调用C醝 n鄖 接口,并根据C醝 n鄖 函数to� 鸬 Tr� v礨醕 nh以后to� 鸬 流程喧ng否执行.
--Tr� v�1: 已经Hu� b龆杂πЧ�,不再执行后续操作；Tr� v�0: 没有检测到相关效果,继续执行.
--**********************************
function x700191_CancelImpacts( sceneId, selfId )
	return 0;
end
--**********************************
--条件检测入口: 
--H� th痭g会T読 技能检测to� 鸬 时间 餴琺调用C醝 n鄖 接口,并根据C醝 n鄖 函数to� 鸬 Tr� v礨醕 nh以后to� 鸬 流程喧ng否执行.
--Tr� v�1: 条件检测通过,可以继续执行；Tr� v�0: 条件检测th b読,中断后续执行.
--**********************************
function x700191_OnConditionCheck( sceneId, selfId )
	AbilityLevel = QueryHumanAbilityLevel(sceneId,selfId ,ABILITY_ZHIYAO)
	--校验使用to� 鸬 物品
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
	--如果技能不够使用要求
	if AbilityLevel < x700191_g_AbilityNeedLevel then
		BeginEvent(sceneId)
			strText = "技能等c不足"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId);
		return 0;
	end
	if (0<LuaFnIsPrescrLearned( sceneId, selfId, x700191_g_RecipeId)) then
		BeginEvent(sceneId)
			strText = "C醝 n鄖 配方已经学会了"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId);
		return 0;		
	end
	return 1;
end

--**********************************
--消耗检测及处理入口: 
--H� th痭g会T読 技能消耗to� 鸬 时间 餴琺调用C醝 n鄖 接口,并根据C醝 n鄖 函数to� 鸬 Tr� v礨醕 nh以后to� 鸬 流程喧ng否执行.
--Tr� v�1: 消耗处理通过,可以继续执行；Tr� v�0: 消耗检测th b読,中断后续执行.
--注意: 这不光负责消耗to� 鸬 检测也负责消耗to� 鸬 执行.
--**********************************
function x700191_OnDeplete( sceneId, selfId )
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
function x700191_OnActivateOnce( sceneId, selfId )
	-- 调用通用配方学习
	CallScriptFunction( USERECIPE_SCRIPT, "ReadRecipe", sceneId, selfId, x700191_g_RecipeId )
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x700191_g_SpecialEffectID, 0);
	return 1;
end

--**********************************
--引导心跳处理入口: 
--引导技能会T読 每次心跳结束时调用C醝 n鄖 接口.
--Tr� v�: 1继续下次心跳；0: 中断引导.
--注: 这里喧ng技能生效m祎 次to� 鸬 入口
--**********************************
function x700191_OnActivateEachTick( sceneId, selfId)
	return 1;
end
