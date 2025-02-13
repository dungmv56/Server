--金质钟桘
--如意小子临时改写
x000176_g_scriptId = 000176

x000176_g_Jinzhizhongchui = {
	                 50313006,
50313001,
50313002,
50313003,
50313004,
50313005,
50314001,
50413006,
50413001,
50413002,
50413003,
50413004,
50413005,
50414001,
50513006,
50513001,
50513002,
50513003,
50513004,
50513005,
50514001,
50613006,
50613001,
50613002,
50613003,
50613004,
50613005,
50614001,
30008018,
30900014,
10141044,
30309152,
30309165,
}	

x000176_g_strGongGaoInfo = {
  "#{_INFOUSR%s}#c00FFFFTh叻ng th裞 b tay v鄌 l鄊 Kim Ch Chung Ch鵼, 鸬t nhi阯 kim quang ch⺶ l骵, nguy阯 lai Chung Ch鵼 h骯 th鄋h m祎 c醝 #{_INFOMSG%s}#c00FFFF!",
  "#{_INFOUSR%s}#c00FFFFTh叻ng th裞 b tay v鄌 l鄊 Kim Ch Chung Ch鵼, 鸬t nhi阯 kim quang ch⺶ l骵, nguy阯 lai Chung Ch鵼 h骯 th鄋h m祎 c醝 #{_INFOMSG%s}#c00FFFF!",
  "#{_INFOUSR%s}#c00FFFFTh叻ng th裞 b tay v鄌 l鄊 Kim Ch Chung Ch鵼, 鸬t nhi阯 kim quang ch⺶ l骵, nguy阯 lai Chung Ch鵼 h骯 th鄋h m祎 c醝 #{_INFOMSG%s}#c00FFFF!",
}
--**********************************
--事件交互入口
--**********************************
function x000176_OnDefaultEvent( sceneId, selfId, bagIndex )
-- 不C C醝 n鄖 接口,但要保留空函数
end

--**********************************
--C醝 n鄖 物品to� 鸬 使用过程喧ng否类似于技能: 
--H� th痭g会T読 执行开始时检测C醝 n鄖 函数to� 鸬 Tr� v�,如果Tr� v玹h b読则忽略后面to� 鸬 类似技能to� 鸬 执行。
--Tr� v�1: 技能类似to� 鸬 物品,可以继续类似技能to� 鸬 执行；Tr� v�0: 忽略后面to� 鸬 操作。
--**********************************
function x000176_IsSkillLikeScript( sceneId, selfId)
	return 1; --C醝 n鄖 脚本C 动作支持
end

--**********************************
--直接H鼀 b鲂Ч�: 
--H� th痭g会直接调用C醝 n鄖 接口,并根据C醝 n鄖 函数to� 鸬 Tr� v礨醕 nh以后to� 鸬 流程喧ng否执行。
--Tr� v�1: 已经H鼀 b龆杂πЧ�,不再执行后续操作；Tr� v�0: 没有检测到相关效果,继续执行。
--**********************************
function x000176_CancelImpacts( sceneId, selfId )
	return 0; --不C C醝 n鄖 接口,但要保留空函数,并且始终Tr� v�0。
end

--**********************************
--条件检测入口: 
--H� th痭g会T読 技能检测to� 鸬 时间 餴琺调用C醝 n鄖 接口,并根据C醝 n鄖 函数to� 鸬 Tr� v礨醕 nh以后to� 鸬 流程喧ng否执行。
--Tr� v�1: 条件检测通过,可以继续执行；Tr� v�0: 条件检测th b読,中断后续执行。
--**********************************
function x000176_OnConditionCheck( sceneId, selfId )

	--校验使用to� 鸬 物
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end

	local FreeSpace = LuaFnGetPropertyBagSpace( sceneId, selfId )
	if( FreeSpace < 3 ) then 
	        local strNotice = "Ch� tr痭g trong t鷌 x醕h kh鬾g 瘘."
		      x000176_ShowNotice( sceneId, selfId, strNotice)
	        return 0
	end


	FreeSpace = LuaFnGetMaterialBagSpace( sceneId, selfId )
	if( FreeSpace < 3 ) then 
	        local strNotice = "C祎 nguy阯 li畊 c黙 c醕 h� kh鬾g c� ch� tr痭g, c s x猵 l読."
		      x000176_ShowNotice( sceneId, selfId, strNotice)
	        return 0
	end
			
	return 1; --不C 任何条件,并且始终Tr� v�1。
end

--**********************************
--消耗检测及处理入口: 
--H� th痭g会T読 技能消耗to� 鸬 时间 餴琺调用C醝 n鄖 接口,并根据C醝 n鄖 函数to� 鸬 Tr� v礨醕 nh以后to� 鸬 流程喧ng否执行。
--Tr� v�1: 消耗处理通过,可以继续执行；Tr� v�0: 消耗检测th b読,中断后续执行。
--注意: 这不光负责消耗to� 鸬 检测也负责消耗to� 鸬 执行。
--**********************************
function x000176_OnDeplete( sceneId, selfId )
	if(0<LuaFnDepletingUsedItem(sceneId, selfId)) then
		return 1;
	end

	return 0;
end

--**********************************
--只会执行m祎 次入口: 
--聚气和瞬发技能会T読 消耗完成后调用C醝 n鄖 接口(聚气结束并且各种条件都Th鯽 m鉵to� 鸬 时候),而引导
--技能也会T読 消耗完成后调用C醝 n鄖 接口(技能to� 鸬 m祎 开始,消耗成功执行之后)。
--Tr� v�1: 处理成功；Tr� v�0: 处理th b読。
--注: 这里喧ng技能生效m祎 次to� 鸬 入口
--**********************************
function x000176_OnActivateOnce( sceneId, selfId )

    --数据统计: 
	  LuaFnAuditZhuanDanUsed(sceneId, selfId, 5, 0)
	
    local RandomBase = GetZhuanDanItemDropCount( sceneId, selfId, 5 )
    
    if( RandomBase > 0 ) then    
       		
        local RandomNum = random( 0, RandomBase - 1 )
        local RandomID, Notice = ZhuanDanItemDropRandom( sceneId, selfId, RandomNum, 5 )
        
        local PrizeNum = 0
        if( RandomID == x000176_g_Jinzhizhongchui[29] ) then
          PrizeNum = 2
        else
          PrizeNum = 1
        end
        
        if( RandomID > 0 ) then
           BeginAddItem(sceneId)
				   AddItem( sceneId, RandomID, PrizeNum )
			     local Ret = LuaFnEndAddItemIgnoreFatigueState( sceneId, selfId )
			     if Ret > 0 then
			       	LuaFnAddItemListToHumanIgnoreFatigueState(sceneId,selfId)

			       	if 1 == Notice then
			       	   local szItemTransfer = GetItemTransfer(sceneId,selfId,0)
					       x000176_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
				      end
				      
				      local ItemName = GetItemName(sceneId, RandomID)
				      local strNotice = "姓t 疬㧟 "..ItemName
                         

				      x000176_ShowNotice( sceneId, selfId, strNotice)
				      LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0);
				   else
				      local strNotice = "Ch� tr痭g trong t鷌 x醕h kh鬾g 瘘"
				      x000176_ShowNotice( sceneId, selfId, strNotice)
			     end
			
        end
        
    end
    
	return 1;
end

--**********************************
--引导心跳处理入口: 
--引导技能会T読 每次心跳结束时调用C醝 n鄖 接口。
--Tr� v�: 1继续下次心跳；0: 中断引导。
--注: 这里喧ng技能生效m祎 次to� 鸬 入口
--**********************************
function x000176_OnActivateEachTick( sceneId, selfId)
	return 1; --不喧ng引导性脚本, 只保留空函数.
end

function x000176_ShowNotice( sceneId, selfId, strNotice)
	BeginEvent( sceneId )
		AddText( sceneId, strNotice )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )    
end

function x000176_ShowRandomSystemNotice( sceneId, selfId, strItemInfo )
	
	local PlayerName = GetName(sceneId,selfId)
	local nMsgIndex = random( 1, 3 )
	local str
	if nMsgIndex == 1 then
		str = format( x000176_g_strGongGaoInfo[1], PlayerName, strItemInfo )
	elseif nMsgIndex == 2 then
		str = format( x000176_g_strGongGaoInfo[2], PlayerName, strItemInfo )
	else
		str = format( x000176_g_strGongGaoInfo[3], PlayerName, strItemInfo )
	end
	BroadMsgByChatPipe( sceneId, selfId, str, 4 )
	
end
