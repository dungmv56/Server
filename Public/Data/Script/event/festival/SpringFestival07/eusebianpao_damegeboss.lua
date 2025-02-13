--注意: 

--物品技能to� 鸬 逻辑只能使用基础技能和脚本来实现

--脚本:

--以下喧ng脚本样例:


--鞭炮
------------------------------------------------------------------------------------------
--m祎 般物品to� 鸬 默认脚本

--脚本号
x050053_g_scriptId = 050053

--buffto� 鸬 列表
x050053_g_Impact = {

		5910,
		5911,
}

x050053_g_strDropNotice ="#{NSBS_20071228_12}"

x050053_g_BianPao1 = 30505165
x050053_g_BianPao2 = 30505166
x050053_g_MosterDataID = 11355
x050053_g_Distance = 16
x050053_g_DropItem = 0


x050053_g_PosTbl = {

	{154,47},	{154,59},
	{148,51},	{160,55},
	{148,55},	{160,51},
}

--生长 餴琺id
x050053_g_GrowPointID = 781
--**********************************
--事件交互入口
--**********************************
function x050053_OnDefaultEvent( sceneId, selfId, bagIndex )
-- 不C C醝 n鄖 接口,但要保留空函数
end

--**********************************
--C醝 n鄖 物品to� 鸬 使用过程喧ng否类似于技能: 
--H� th痭g会T読 执行开始时检测C醝 n鄖 函数to� 鸬 Tr� v�,如果Tr� v玹h b読则忽略后面to� 鸬 类似技能to� 鸬 执行.
--Tr� v�1: 技能类似to� 鸬 物品,可以继续类似技能to� 鸬 执行；Tr� v�0: 忽略后面to� 鸬 操作.
--**********************************
function x050053_IsSkillLikeScript( sceneId, selfId)
	return 1; --C醝 n鄖 脚本C 动作支持
end

--**********************************
--直接Hu� b鲂Ч�: 
--H� th痭g会直接调用C醝 n鄖 接口,并根据C醝 n鄖 函数to� 鸬 Tr� v礨醕 nh以后to� 鸬 流程喧ng否执行.
--Tr� v�1: 已经Hu� b龆杂πЧ�,不再执行后续操作；Tr� v�0: 没有检测到相关效果,继续执行.
--**********************************
function x050053_CancelImpacts( sceneId, selfId )
	return 0; --不C C醝 n鄖 接口,但要保留空函数,并且始终Tr� v�0.
end

--**********************************
--条件检测入口: 
--H� th痭g会T読 技能检测to� 鸬 时间 餴琺调用C醝 n鄖 接口,并根据C醝 n鄖 函数to� 鸬 Tr� v礨醕 nh以后to� 鸬 流程喧ng否执行.
--Tr� v�1: 条件检测通过,可以继续执行；Tr� v�0: 条件检测th b読,中断后续执行.
--**********************************
function x050053_OnConditionCheck( sceneId, selfId )
	--校验使用to� 鸬 物品
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
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
function x050053_OnDeplete( sceneId, selfId )
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
function x050053_OnActivateOnce( sceneId, selfId )
	local	bagId	= LuaFnGetBagIndexOfUsedItem( sceneId, selfId )
	if bagId < 0 then
		return
	end
	
	--计算伤害值
	local itemTblIndex = LuaFnGetItemIndexOfUsedItem( sceneId, selfId )
	local damagevale = 2
	
	local impactID = x050053_g_Impact[1]
		
	if x050053_g_BianPao2==itemTblIndex then
		damagevale = 20
		impactID = x050053_g_Impact[2]
		
		--给道具和给buff
	end
	
	--扣物品....
	if LuaFnDepletingUsedItem(sceneId, selfId) <= 0 then
		return
	end

	if x050053_g_BianPao2==itemTblIndex then
		
		local rand = random(100)
			
		
		if rand < 11 then
			
			if rand < 6 then  	--门神
				
				local BagIndex = TryRecieveItem( sceneId, selfId, 30501158, QUALITY_MUST_BE_CHANGE )

				if BagIndex ~= -1 then					
					LuaFnRefreshItemInfo( sceneId, selfId, BagIndex )
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 4874, 0);
				end
				
			else								--二踢脚	
				
				local BagIndex = TryRecieveItem( sceneId, selfId, 30501157, QUALITY_MUST_BE_CHANGE )

				if BagIndex ~= -1 then
					LuaFnRefreshItemInfo( sceneId, selfId, BagIndex )
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 4875, 0);
				end	
			end
			
		end
	end
	
	--只有喧ngm祎 挂鞭炮时加buff....增加特效
	if x050053_g_BianPao2==itemTblIndex then
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, impactID, 0);
	end
	
	--伤害boss
	--取 餴琺玩家当前坐标
	local mosterid = -1;
	
	local PlayerX = GetHumanWorldX(sceneId,selfId)
	local PlayerY = GetHumanWorldZ(sceneId,selfId)
	local MosterX = 0;
	local MosterY = 0;
	local mosterid = -1;
	local IsCreateBox = 0;
	local IsFindMonster = 0;


	--遍历场景中所有to� 鸬 怪....更新BOSS重建状态....
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		mosterid = GetMonsterObjID(sceneId,i)
		local MosDataID = GetMonsterDataID( sceneId, mosterid )
		
		if MosDataID == x050053_g_MosterDataID then
			MosterX = GetMonsterWorldX(sceneId,i)
			MosterY = GetMonsterWorldZ(sceneId,i)
			IsFindMonster = 1
			IsCreateBox = x050053_IsCreateSixBox(sceneId,i,damagevale)
			break;
		end
	end

	
	local Distance = floor(sqrt((MosterX-PlayerX)*(MosterX-PlayerX)+(MosterY-PlayerY)*(MosterY-PlayerY)))
	
	if Distance < x050053_g_Distance and IsFindMonster == 1 then	--boss减血
		LuaFnSetDamage(sceneId, selfId, mosterid, damagevale)
		
		if IsCreateBox ==1 then 
			x050053_CreateSixBox(sceneId, selfId)
		end
	end
	return 1;
end

function x050053_ClearDromItemFlag( sceneId )
	x050053_g_DropItem = 0;
end

function x050053_IsCreateSixBox( sceneId, index, damagevale)

		local HP = GetMonsterHP(sceneId,index)
		local MaxHP = GetMonsterMaxHP(sceneId,index)
		
		local HP3 = MaxHP*3/4
		local HP2 = MaxHP*2/4
		local HP1 = MaxHP*1/4
		
		if HP >= HP3 and HP-damagevale < HP3 and x050053_g_DropItem == 0 then
			x050053_g_DropItem =1
			return 1
		elseif HP >= HP2 and (HP-damagevale) < HP2 and x050053_g_DropItem == 1 then
			x050053_g_DropItem =2
			return 1
		elseif HP >= HP1 and (HP-damagevale) < HP1 and x050053_g_DropItem == 2 then
			x050053_g_DropItem =3
			return 1
		end
		
		return 0;
end

function x050053_CreateSixBox( sceneId, selfId)

	--掉落公告
	BroadMsgByChatPipe( sceneId, selfId, x050053_g_strDropNotice, 4 )
	
	--创建宝箱
	for _, Pos in x050053_g_PosTbl do
		
		local ItemBoxId = ItemBoxEnterScene( Pos[1], Pos[2], x050053_g_GrowPointID, sceneId, QUALITY_MUST_BE_CHANGE, 1, 30501157 )
	
		AddItemToBox( sceneId, ItemBoxId, QUALITY_MUST_BE_CHANGE, 1, 30501158)	
		
		local rand = random(100)
		if rand < 26 then
			AddItemToBox( sceneId, ItemBoxId, QUALITY_MUST_BE_CHANGE, 1, 30505107)
		end
	
		rand = random(100)
		if rand < 16 then
			AddItemToBox( sceneId, ItemBoxId, QUALITY_MUST_BE_CHANGE, 1, 30501159)
		end
	
		rand = random(100)
		if rand < 16 then
			AddItemToBox( sceneId, ItemBoxId, QUALITY_MUST_BE_CHANGE, 1, 30501160)
		end
	
		rand = random(1000)
		if rand < 16 then
			AddItemToBox( sceneId, ItemBoxId, QUALITY_MUST_BE_CHANGE, 1, 10141105)
		end
	
		rand = random(1000)
		if rand < 16 then
			AddItemToBox( sceneId, ItemBoxId, QUALITY_MUST_BE_CHANGE, 1, 10141106)
		end
	
		rand = random(1000)
		if rand < 16 then
			AddItemToBox( sceneId, ItemBoxId, QUALITY_MUST_BE_CHANGE, 1, 10141107)
		end
	
		rand = random(1000)
		if rand < 16 then
			AddItemToBox( sceneId, ItemBoxId, QUALITY_MUST_BE_CHANGE, 1, 10141108)
		end
	
		rand = random(1000)
		if rand < 7 then
			AddItemToBox( sceneId, ItemBoxId, QUALITY_MUST_BE_CHANGE, 1, 10141109)
		end
		
		rand = random(1000)
		if rand < 7 then
			AddItemToBox( sceneId, ItemBoxId, QUALITY_MUST_BE_CHANGE, 1, 10141110)
		end
		
		SetItemBoxMaxGrowTime( sceneId, ItemBoxId, 5400000 )
	end
end
--**********************************
--引导心跳处理入口: 
--引导技能会T読 每次心跳结束时调用C醝 n鄖 接口.
--Tr� v�: 1继续下次心跳；0: 中断引导.
--注: 这里喧ng技能生效m祎 次to� 鸬 入口
--**********************************
function x050053_OnActivateEachTick( sceneId, selfId)
	return 1; --不喧ng引导性脚本, 只保留空函数.
end
