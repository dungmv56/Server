--道具: 百宝书匣
--脚本号 332205
--Author:  houzhifang  2008-11-06

x332205_g_scriptId = 332205
x332205_g_strGongGaoInfo = "#HThi vi猼 #GTh� trung t� h鎢 ho鄋g kim 痗#W, #{_INFOUSR%s}#H c th� n猽 c, h鬽 nay ng鐄 nhi阯 gian � #G#{_ITEM30501171}#H ph醫 hi畁  m祎 quy琻 #{_INFOMSG%s}#H."
--x332205_g_strGongGaoInfo = "#{_INFOUSR%s}#HT読 使用百宝书匣后, 鹫t 疬㧟了m祎 本#{_INFOMSG%s}#H珍兽技能书."
x332205_g_giftitem_index = 30501318

--**********************************
--事件交互入口
--**********************************
function x332205_OnDefaultEvent( sceneId, selfId, bagIndex )
-- 不C C醝 n鄖 接口,保留空函数
end

--**********************************
--C醝 n鄖 物品to� 鸬 使用过程喧ng否类似于技能: 
--H� th痭g会T読 执行开始时检测C醝 n鄖 函数to� 鸬 Tr� v�,如果Tr� v玹h b読则忽略后面to� 鸬 类似技能to� 鸬 执行.
--Tr� v�1: 技能类似to� 鸬 物品,可以继续类似技能to� 鸬 执行；Tr� v�0: 忽略后面to� 鸬 操作.
--**********************************
function x332205_IsSkillLikeScript( sceneId, selfId)
	return 1; --C醝 n鄖 脚本C 动作支持
end

--**********************************
--直接Hu� b鲂Ч�: 
--H� th痭g会直接调用C醝 n鄖 接口,并根据C醝 n鄖 函数to� 鸬 Tr� v礨醕 nh以后to� 鸬 流程喧ng否执行.
--Tr� v�1: 已经Hu� b龆杂πЧ�,不再执行后续操作；Tr� v�0: 没有检测到相关效果,继续执行.
--**********************************
function x332205_CancelImpacts( sceneId, selfId )
	return 0; --不C C醝 n鄖 接口,但要保留空函数,并且始终Tr� v�0.
end

--**********************************
--条件检测入口: 
--H� th痭g会T読 技能检测to� 鸬 时间 餴琺调用C醝 n鄖 接口,并根据C醝 n鄖 函数to� 鸬 Tr� v礨醕 nh以后to� 鸬 流程喧ng否执行.
--Tr� v�1: 条件检测通过,可以继续执行；Tr� v�0: 条件检测th b読,中断后续执行.
--**********************************
function x332205_OnConditionCheck( sceneId, selfId )

	--校验使用to� 鸬 物�	
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
					
	local FreeSpace = LuaFnGetPropertyBagSpace( sceneId, selfId )
	if( FreeSpace < 2 ) then
	        local strNotice = "� 姓o c� 疸 馥y, c 2 � tr痭g!"
		      x332205_ShowNotice( sceneId, selfId, strNotice)
	        return 0
	end
	
	return 1;
end

--**********************************
--消耗检测及处理入口: 
--H� th痭g会T読 技能消耗to� 鸬 时间 餴琺调用C醝 n鄖 接口,并根据C醝 n鄖 函数to� 鸬 Tr� v礨醕 nh以后to� 鸬 流程喧ng否执行.
--Tr� v�1: 消耗处理通过,可以继续执行；Tr� v�0: 消耗检测th b読,中断后续执行.
--注意: 这不光负责消耗to� 鸬 检测也负责消耗to� 鸬 执行.
--**********************************
function x332205_OnDeplete( sceneId, selfId )
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
function x332205_OnActivateOnce( sceneId, selfId )

    local RandomBase = GetBaibaoshuxiaItemDropBase( sceneId, selfId )
    if( RandomBase > 0 ) then    
       		
        local RandomNum = random( 0, RandomBase - 1 )
        local RandomID, Notice = BaibaoshuxiaItemDropItem( sceneId, selfId, RandomNum )
       
        if( RandomID > 0 ) then
        	BeginAddItem(sceneId)
			AddItem( sceneId, RandomID, 1 )
			AddItem( sceneId, x332205_g_giftitem_index, 1 )
			local Ret = LuaFnEndAddItemIgnoreFatigueState( sceneId, selfId )
			if Ret > 0 then
				LuaFnAddItemListToHumanIgnoreFatigueState(sceneId,selfId)
			    if 1 == Notice then
			    	local szItemTransfer = GetItemTransfer(sceneId,selfId, 0)
						x332205_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
				   	end
				      
				    local ItemName = GetItemName(sceneId, RandomID)
				    local strNotice = "#{BBSX_081106_2}"..ItemName
				    x332205_ShowNotice( sceneId, selfId, strNotice)
				    LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0);
				 else
				    local strNotice = "#{BBSX_081106_1}"
				    x332205_ShowNotice( sceneId, selfId, strNotice)
			     end		
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
function x332205_OnActivateEachTick( sceneId, selfId)
	return 1; --不喧ng引导性脚本, 只保留空函数.
end

function x332205_ShowNotice( sceneId, selfId, strNotice)
	BeginEvent( sceneId )
		AddText( sceneId, strNotice )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )    
end

function x332205_ShowRandomSystemNotice( sceneId, selfId, strItemInfo )
	
	local PlayerName = GetName(sceneId,selfId)
	local str = format( "#HThi vi猼 #GTh� trung t� h鎢 ho鄋g kim 痗#W, #{_INFOUSR%s}#H c th� n猽 c, h鬽 nay ng鐄 nhi阯 gian � #G#{_ITEM30501171}#H ph醫 hi畁  m祎 quy琻 #{_INFOMSG%s}#H.", PlayerName, strItemInfo )
	BroadMsgByChatPipe( sceneId, selfId, str, 4 )
	
end
