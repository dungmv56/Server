--道具: 密银炼剂<ID:30501167>
--脚本号 300074
--Author:zhangzhuang 2008-10-20

x300074_g_scriptId = 300074
x300074_g_KuangShi = 30501168
x300074_g_MiYin  = 20502001

--**********************************
--事件交互入口
--**********************************
function x300074_OnDefaultEvent( sceneId, selfId, bagIndex )
-- 不C C醝 n鄖 接口,但要保留空函数
end

--**********************************
--C醝 n鄖 物品to� 鸬 使用过程喧ng否类似于技能: 
--H� th痭g会T読 执行开始时检测C醝 n鄖 函数to� 鸬 Tr� v�,如果Tr� v玹h b読则忽略后面to� 鸬 类似技能to� 鸬 执行.
--Tr� v�1: 技能类似to� 鸬 物品,可以继续类似技能to� 鸬 执行；Tr� v�0: 忽略后面to� 鸬 操作.
--**********************************
function x300074_IsSkillLikeScript( sceneId, selfId)
	return 1; --C醝 n鄖 脚本C 动作支持
end

--**********************************
--直接Hu� b鲂Ч�: 
--H� th痭g会直接调用C醝 n鄖 接口,并根据C醝 n鄖 函数to� 鸬 Tr� v礨醕 nh以后to� 鸬 流程喧ng否执行.
--Tr� v�1: 已经Hu� b龆杂πЧ�,不再执行后续操作；Tr� v�0: 没有检测到相关效果,继续执行.
--**********************************
function x300074_CancelImpacts( sceneId, selfId )
	return 0; --不C C醝 n鄖 接口,但要保留空函数,并且始终Tr� v�0.
end

--**********************************
--条件检测入口: 
--H� th痭g会T読 技能检测to� 鸬 时间 餴琺调用C醝 n鄖 接口,并根据C醝 n鄖 函数to� 鸬 Tr� v礨醕 nh以后to� 鸬 流程喧ng否执行.
--Tr� v�1: 条件检测通过,可以继续执行；Tr� v�0: 条件检测th b読,中断后续执行.
--**********************************
function x300074_OnConditionCheck( sceneId, selfId )
	--校验使用to� 鸬 物品
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
	
		local ItemCount = LuaFnGetAvailableItemCount( sceneId, selfId, x300074_g_KuangShi )
	if ItemCount < 1 then
		local strNotice = "#{MYKS_081021_2}" --密银矿石检测
		x300074_ShowNotice( sceneId, selfId, strNotice)
	    return 0
	end
	
	local FreeSpace = LuaFnGetMaterialBagSpace( sceneId, selfId )
	if( FreeSpace < 1 ) then
	        local strNotice = "#{MYKS_081021_3}"
		    x300074_ShowNotice( sceneId, selfId, strNotice)
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
function x300074_OnDeplete( sceneId, selfId )
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
function x300074_OnActivateOnce( sceneId, selfId )

    --消耗m祎 c醝密银矿石
  ret = LuaFnDelAvailableItem(sceneId, selfId, x300074_g_KuangShi, 1)
	if ret ~= 1 then
		return   --假如删除操th b読,则中断操作,不会给予玩家任何物品
	end
	
  --数据统计: 密银溶剂to� 鸬 使用
	LuaFnAuditMiYinKuangShiUsed(sceneId, selfId)
	Msg2Player(sceneId, selfId, "#C醕 h� 疸 nh 疬㧟 m祎 c醝#Hb� ng鈔 c 1", MSG2PLAYER_PARA )
	BeginAddItem(sceneId)
			AddItem( sceneId, x300074_g_MiYin, 1 )
	local Ret = LuaFnEndAddItemIgnoreFatigueState( sceneId, selfId )
			
	if Ret > 0 then
		LuaFnAddItemListToHumanIgnoreFatigueState(sceneId,selfId)
		x300074_ShowNotice( sceneId, selfId, "#{MYKS_081021_4}")
	end 
	
   
    
	return 1;
end

--**********************************
--引导心跳处理入口: 
--引导技能会T読 每次心跳结束时调用C醝 n鄖 接口.
--Tr� v�: 1继续下次心跳；0: 中断引导.
--注: 这里喧ng技能生效m祎 次to� 鸬 入口
--**********************************
function x300074_OnActivateEachTick( sceneId, selfId)
	return 1; --不喧ng引导性脚本, 只保留空函数.
end

function x300074_ShowNotice( sceneId, selfId, strNotice)
	BeginEvent( sceneId )
		AddText( sceneId, strNotice )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )    
end

