--道具: ch靉 kh骯 耺 Kim<ID:30008011>
--脚本号 332200
--Author: Steven.Han 10:39 2007-5-17

x332200_g_scriptId = 332200
x332200_g_DarkBox = 30008010

--**********************************
--事件交互入口
--**********************************
function x332200_OnDefaultEvent( sceneId, selfId, bagIndex )
-- 不C C醝 n鄖 接口,但要保留空函数
end

--**********************************
--C醝 n鄖 物品to� 鸬 使用过程喧ng否类似于技能: 
--H� th痭g会T読 执行开始时检测C醝 n鄖 函数to� 鸬 Tr� v�,如果Tr� v玹h b読则忽略后面to� 鸬 类似技能to� 鸬 执行.
--Tr� v�1: 技能类似to� 鸬 物品,可以继续类似技能to� 鸬 执行；Tr� v�0: 忽略后面to� 鸬 操作.
--**********************************
function x332200_IsSkillLikeScript( sceneId, selfId)
	return 1; --C醝 n鄖 脚本C 动作支持
end

--**********************************
--直接Hu� b鲂Ч�: 
--H� th痭g会直接调用C醝 n鄖 接口,并根据C醝 n鄖 函数to� 鸬 Tr� v礨醕 nh以后to� 鸬 流程喧ng否执行.
--Tr� v�1: 已经Hu� b龆杂πЧ�,不再执行后续操作；Tr� v�0: 没有检测到相关效果,继续执行.
--**********************************
function x332200_CancelImpacts( sceneId, selfId )
	return 0; --不C C醝 n鄖 接口,但要保留空函数,并且始终Tr� v�0.
end

--**********************************
--条件检测入口: 
--H� th痭g会T読 技能检测to� 鸬 时间 餴琺调用C醝 n鄖 接口,并根据C醝 n鄖 函数to� 鸬 Tr� v礨醕 nh以后to� 鸬 流程喧ng否执行.
--Tr� v�1: 条件检测通过,可以继续执行；Tr� v�0: 条件检测th b読,中断后续执行.
--**********************************
function x332200_OnConditionCheck( sceneId, selfId )
	--校验使用to� 鸬 物品
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
	
	local FreeSpace = LuaFnGetPropertyBagSpace( sceneId, selfId )
	if( FreeSpace < 1 ) then
	        local strNotice = "C祎 鹫o c� c黙 c醕 h� kh鬾g c� ch� tr痭g, c s x猵 l読."
		    x332200_ShowNotice( sceneId, selfId, strNotice)
	        return 0
	end
	
	FreeSpace = LuaFnGetMaterialBagSpace( sceneId, selfId )
	if( FreeSpace < 1 ) then
	        local strNotice = "C祎 nguy阯 li畊 c黙 c醕 h� kh鬾g c� ch� tr痭g, c s x猵 l読."
		    x332200_ShowNotice( sceneId, selfId, strNotice)
	        return 0
	end
		
	local ItemCount = LuaFnGetAvailableItemCount( sceneId, selfId, x332200_g_DarkBox )
	if ItemCount < 1 then
		local strNotice = "C ".."#{_ITEM"..(x332200_g_DarkBox).."}" --暗金宝箱
		x332200_ShowNotice( sceneId, selfId, strNotice)
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
function x332200_OnDeplete( sceneId, selfId )
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
function x332200_OnActivateOnce( sceneId, selfId )

    --消耗m祎 c醝宝箱
    ret = LuaFnDelAvailableItem(sceneId, selfId, x332200_g_DarkBox, 1)
	if ret ~= 1 then
		return   --假如删除操th b読,则中断操作,不会给予玩家任何物品
	end
	
    --数据统计: 暗金宝箱to� 鸬 使用
	LuaFnAuditDarkKeyUsed(sceneId, selfId, 0, 0)
	
    local RandomBase = GetDarkBoxItemDropCount( sceneId, selfId )
    if( RandomBase > 0 ) then    
         
        local RandomNum = random( 0, RandomBase - 1 )
        local RandomID, Notice = DarkBoxItemDropRandom( sceneId, selfId, RandomNum )
       
        if( RandomID > 0 ) then

			BeginAddItem(sceneId)
				AddItem( sceneId, RandomID, 1 )
			local Ret = LuaFnEndAddItemIgnoreFatigueState( sceneId, selfId )
			
			if Ret > 0 then
				LuaFnAddItemListToHumanIgnoreFatigueState(sceneId,selfId)
				
				if 1 == Notice then
					local szItemTransfer = GetItemTransfer(sceneId,selfId,0)
					local ItemInfo = "#{_INFOMSG".. szItemTransfer .."}"
					x332200_ShowRandomSystemNotice( sceneId, selfId, ItemInfo )
				end
				
				local strNotice = "M� b鋙 s呓ng th鄋h c鬾g, ch鷆 m譶g c醕 h� thu 疬㧟: ".."#B#{_ITEM"..(RandomID).."}"
				x332200_ShowNotice( sceneId, selfId, strNotice)
				LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0);
			
			else
				local strNotice = "Ch� tr痭g trong t鷌 x醕h kh鬾g 瘘"
				x332200_ShowNotice( sceneId, selfId, strNotice)
			end
			
			local SubItem = 30008026  --附属物品,100%几率 鹫t 疬㧟
			BeginAddItem(sceneId)
				AddItem( sceneId, SubItem, 1 )
			Ret = LuaFnEndAddItemIgnoreFatigueState( sceneId, selfId )
			if Ret > 0 then
				LuaFnAddItemListToHumanIgnoreFatigueState(sceneId,selfId)
			else
				local strNotice = "Ch� tr痭g trong t鷌 x醕h kh鬾g 瘘"
				x332200_ShowNotice( sceneId, selfId, strNotice)
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
function x332200_OnActivateEachTick( sceneId, selfId)
	return 1; --不喧ng引导性脚本, 只保留空函数.
end

function x332200_ShowNotice( sceneId, selfId, strNotice)
	BeginEvent( sceneId )
		AddText( sceneId, strNotice )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )    
end

function x332200_ShowRandomSystemNotice( sceneId, selfId, strItemInfo )
	
	local strNotice =
	{
	"#W%s#c00FFFF nh靚 c醝#Y%s#c00FFFF tr痭g r瞡g, kh鬾g ki玬 疬㧟 s� t裞 gi, vung 餫o ch閙 n醫 v鴑. K猼 qu� 疸 ph醫 hi畁 trong n b鋙 s呓ng ch補 #W%s. ",
	" #W%s#c00FFFFh癷 h祊 run r d鵱g tay m� #Y%s#c00FFFF ra, ch� th 1 醤h s醤g ch緋 qua, v� 1 #W%s#c00FFFF餫ng n y阯 d呔i 疳y th鵱g.",
	"#W%s#c00FFF M礳 d鴆 canh y, Trai gi緄 t� th馽, T竛h thu� b醫 nhai, Ho鄋g th� 餴猰 鹫o.....T鴑g kinh thi阯 bi猲. M� c醝 #Y%s#c00FFFF ra, th l� linh, trong g呓ng qu� th c� 1 c醝 #W%s!"
	}
	
	local strDarkBox = "#{_ITEM30008010}" --暗金宝箱
	
	local PlayerName = GetName( sceneId, selfId )
	local PlayerInfoName = "#{_INFOUSR"..PlayerName .."}"
	
	local RandomNotice = random( 1, 3 )
	local SysStr = format( strNotice[ RandomNotice ], PlayerInfoName, strDarkBox, strItemInfo )
	
	BroadMsgByChatPipe( sceneId, selfId, SysStr, 4 )
	
end
