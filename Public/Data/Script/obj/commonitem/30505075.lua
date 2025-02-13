--注意: 

--物品技能to� 鸬 逻辑只能使用基础技能和脚本来实现

--脚本:

--以下喧ng脚本样例:


--3004.lua
------------------------------------------------------------------------------------------
--m祎 般物品to� 鸬 默认脚本

--脚本号
x332000_g_scriptId = 332000 --临时写C醝 n鄖 ,真正用to� 鸬 时候m祎 定要改.

--C to� 鸬 等c

--效果to� 鸬 ID
x332000_g_Impact1 = 3004 --临时写C醝 n鄖 
x332000_g_Impact2 = -1 --不用

--**********************************
--事件交互入口
--**********************************
function x332000_OnDefaultEvent( sceneId, selfId, bagIndex )
-- 不C C醝 n鄖 接口,但要保留空函数
end

--**********************************
--C醝 n鄖 物品to� 鸬 使用过程喧ng否类似于技能: 
--H� th痭g会T読 执行开始时检测C醝 n鄖 函数to� 鸬 Tr� v�,如果Tr� v玹h b読则忽略后面to� 鸬 类似技能to� 鸬 执行.
--Tr� v�1: 技能类似to� 鸬 物品,可以继续类似技能to� 鸬 执行；Tr� v�0: 忽略后面to� 鸬 操作.
--**********************************
function x332000_IsSkillLikeScript( sceneId, selfId)
	return 1; --C醝 n鄖 脚本C 动作支持
end

--**********************************
--直接Hu� b鲂Ч�: 
--H� th痭g会直接调用C醝 n鄖 接口,并根据C醝 n鄖 函数to� 鸬 Tr� v礨醕 nh以后to� 鸬 流程喧ng否执行.
--Tr� v�1: 已经Hu� b龆杂πЧ�,不再执行后续操作；Tr� v�0: 没有检测到相关效果,继续执行.
--**********************************
function x332000_CancelImpacts( sceneId, selfId )
	return 0; --不C C醝 n鄖 接口,但要保留空函数,并且始终Tr� v�0.
end

--**********************************
--条件检测入口: 
--H� th痭g会T読 技能检测to� 鸬 时间 餴琺调用C醝 n鄖 接口,并根据C醝 n鄖 函数to� 鸬 Tr� v礨醕 nh以后to� 鸬 流程喧ng否执行.
--Tr� v�1: 条件检测通过,可以继续执行；Tr� v�0: 条件检测th b読,中断后续执行.
--**********************************
function x332000_OnConditionCheck( sceneId, selfId )

	if sceneId ~= 5 then
		return 0;
	end
	
	local targetX, targetZ;
	targetX = 268;
	targetZ = 241;
	local nPlayerX, nPlayerZ = GetWorldPos(sceneId, selfId);
	local fDis = floor(sqrt((targetX-nPlayerX)*(targetX-nPlayerX)+(targetZ-nPlayerZ)*(targetZ-nPlayerZ)))
	
--	local MonsterId = LuaFnCreateMonster( sceneId, 473, nPlayerX, nPlayerZ, 3, 0, 808038);
--	SetCharacterDieTime(sceneId, MonsterId, 1000*10)
	local msg;
	
	if fDis > 5    then
		msg = "Ch� c� g (268,241) c黙 K韓h H� c騨 c� th� ti猲 h鄋h luy畁 t.";
		x332000_NotifyTip(sceneId, selfId, msg);
		return 0;
	end
	
	local nItemBagIndex = GetBagPosByItemSn(sceneId, selfId, 40004414);
	if nItemBagIndex >= 0 then
		
		--检验 有效性
		local nStartTime = GetBagItemParam( sceneId, selfId, nItemBagIndex, 4, 2 );
		local nCurTime = LuaFnGetCurrentTime();		
		local nDelta = nCurTime - nStartTime;
		
		if nDelta >= 4*60*60 then
			DelItem (  sceneId, selfId, 40004414, 1);
			local msg = "秀 qu� th秈 h課 c� hi畊 l馽!";
			x332000_NotifyTip(sceneId, selfId, msg);
			return 0;		
		end
	end
	
	--活动 有效
	local actId = 36;
	
	local LianYaoStatus = GetActivityParam( sceneId, actId, 0 );
	
	if LianYaoStatus <= 0 then
		DelItem (  sceneId, selfId, 40004414, 1);
		local msg = "秀 qu� 22: 00 kh鬾g th� tr皀g tr鱰, ti阯 th鋙 疸 bi猲 m.";
		x332000_NotifyTip(sceneId, selfId, msg);
		return 0;
	end
	--生成 餴琺有效
	local QianNianCaoGen = GetActivityParam( sceneId, actId, 1 );
	if QianNianCaoGen <= 0 then
		return 0;
	end
	--确保 没有 药鼎
	local YaoDing_LianYao_Status = GetActivityParam( sceneId, actId, 2 );
	if YaoDing_LianYao_Status > 0 then
		return 0;
	end
	
	msg = "#{JingHu_LingYao_01}";
		
	BeginUICommand(sceneId)
		UICommand_AddInt(sceneId,x332000_g_scriptId);		
		UICommand_AddInt(sceneId,1);
		UICommand_AddString(sceneId,"DoUseItemReal");
		UICommand_AddString(sceneId, msg);
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 24)
	
	--校验使用to� 鸬 物品
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
		

	--加兰to� 鸬 满兰检查
	--if(GetMp(sceneId, selfId) >= GetMaxMp(sceneId, selfId)) then
	--	return 0
	--end

	--加血和蓝to� 鸬 满血满蓝检查
	--if((GetHp(sceneId, selfId) >= GetMaxHp(sceneId, selfId)) and (GetMp(sceneId, selfId) >= GetMaxMp(sceneId, selfId))) then
	--	return 0
	--end

	return 0; --不C 任何条件,并且始终Tr� v�1.
end


function x332000_DoUseItemReal( sceneId, selfId, param1, param2 )
	if sceneId ~= 5 then
		return 0;
	end
	local nItemBagIndex = GetBagPosByItemSn(sceneId, selfId, 40004414);
	if nItemBagIndex >= 0 then
	
		-- 检查喧ng否T読 有效范围内
		local targetX, targetZ;
		targetX = 268;
		targetZ = 241;
		local nPlayerX, nPlayerZ = GetWorldPos(sceneId, selfId);
		local fDis = floor(sqrt((targetX-nPlayerX)*(targetX-nPlayerX)+(targetZ-nPlayerZ)*(targetZ-nPlayerZ)))
	
		if fDis > 5    then
			local msg;
			msg = "Ch� c� g (268,241) c黙 K韓h H� c騨 c� th� ti猲 h鄋h luy畁 t.";
			x332000_NotifyTip(sceneId, selfId, msg);
			return 0;
		end
		
		--检验 有效性
		local nStartTime = GetBagItemParam( sceneId, selfId, nItemBagIndex, 4, 2 );
		local nCurTime = LuaFnGetCurrentTime();		
		local nDelta = nCurTime - nStartTime;
		
		if nDelta >= 4*60*60 then
			DelItem (  sceneId, selfId, 40004414, 1);
			local msg = "秀 qu� th秈 h課 c� hi畊 l馽!";
			x332000_NotifyTip(sceneId, selfId, msg);
			return 0;		
		end

		local szTransfer = GetBagItemTransfer(sceneId,selfId, nItemBagIndex);

		local message = format("#{JingHu_LingYao_02}#{_INFOMSG%s}#{JingHu_LingYao_03}", szTransfer);		

		BroadMsgByChatPipe(sceneId, selfId, message, 4);
		
		DelItem (  sceneId, selfId, 40004414, 1);
		
		local nPlayerX, nPlayerZ = GetWorldPos(sceneId, selfId);
		
		nPlayerX = nPlayerX + 1;
		nPlayerZ = nPlayerZ + 1;
		
		
		local MonsterId = LuaFnCreateMonster( sceneId, 881, nPlayerX, nPlayerZ, 3, -1, 502000 );	
		
--		SetUnitReputationID(sceneId, selfId, MonsterId, GetUnitReputationID(sceneId, selfId, selfId))
		
		SetCharacterDieTime(sceneId, MonsterId, 1000*60*60)

		local nCurTime = LuaFnGetCurrentTime()
		local actId = 36;
		SetActivityParam( sceneId, actId, 4, nCurTime );
		SetActivityParam( sceneId, actId, 2, 1 );
		
		local selfGUID = LuaFnGetGUID(sceneId, selfId);
		
		SetActivityParam( sceneId, actId, 3, selfGUID );
		
		local szPlayerName = LuaFnGetName( sceneId, selfId );		
		JINGHU_YAODING_CREATER_NAME = szPlayerName;
		
		SetActivityParam( sceneId, actId, 5, MonsterId );
		
		--为了避免m祎 c醝人有多c醝 药鼎任务道具
		DelItem (  sceneId, selfId, 40004415, 1);
		if TryRecieveItem( sceneId, selfId, 40004415, 1 ) >= 0 then
			local nItemBagIndex = GetBagPosByItemSn(sceneId, selfId, 40004415);
						
			SetBagItemParam( sceneId, selfId, nItemBagIndex, 3, 2, nCurTime )			
			
		end
		
	end
	


end



--**********************************
--消耗检测及处理入口: 
--H� th痭g会T読 技能消耗to� 鸬 时间 餴琺调用C醝 n鄖 接口,并根据C醝 n鄖 函数to� 鸬 Tr� v礨醕 nh以后to� 鸬 流程喧ng否执行.
--Tr� v�1: 消耗处理通过,可以继续执行；Tr� v�0: 消耗检测th b読,中断后续执行.
--注意: 这不光负责消耗to� 鸬 检测也负责消耗to� 鸬 执行.
--**********************************
function x332000_OnDeplete( sceneId, selfId )
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
function x332000_OnActivateOnce( sceneId, selfId )
	if(-1~=x332000_g_Impact1) then
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x332000_g_Impact1, 0);
	end
	return 1;
end

--**********************************
--引导心跳处理入口: 
--引导技能会T読 每次心跳结束时调用C醝 n鄖 接口.
--Tr� v�: 1继续下次心跳；0: 中断引导.
--注: 这里喧ng技能生效m祎 次to� 鸬 入口
--**********************************
function x332000_OnActivateEachTick( sceneId, selfId)
	return 1; --不喧ng引导性脚本, 只保留空函数.
end


--**********************************
--醒目提示
--**********************************
function x332000_NotifyTip( sceneId, selfId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end
