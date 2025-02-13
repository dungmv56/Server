--注意: 

--物品技能to� 鸬 逻辑只能使用基础技能和脚本来实现

--脚本:

--以下喧ng脚本样例:


--tulingzhu.lua
------------------------------------------------------------------------------------------
--m祎 般物品to� 鸬 默认脚本
--土Linh珠

--土Linh珠有3种操作: 
--1.直接使用时打开土Linh珠使用界面
--2.使用界面上 餴琺击“定位”进行定位
--3.使用界面上 餴琺击“传送”进行传送
--使用土Linh珠时弹出to� 鸬 界面喧ngT読 客户端直接硬编码实现,实际上并没有“S� d鴑g v ph ”,因此不会调用到本脚本内.
--本脚本为土Linh珠to� 鸬 使用逻辑,正常使用土Linh珠to� 鸬 逻辑为“传送”.
--土Linh珠to� 鸬 定位喧ng通过客户端直接call本脚本to� 鸬 x330001_SetPosition函数实现,并不属于土Linh珠to� 鸬 使用逻辑.

--脚本号
x330001_g_ScriptId	= 330001

--物品ID
x330001_g_ItemId = 30008007
x330001_g_ItemId01 = 30505216

--效果to� 鸬 ID
x330001_g_Impact		= -1	--传送时要使用to� 鸬 特效to� 鸬 编号


x330001_g_UseTim		= 10				--使用次数
x330001_g_Yinpiao		= 40002000	--银票

--普通场景限制,这些场景内无法传送
x330001_g_UselessScn=
{
	125		-- 华山
}

--普通场景限制,这些场景内无法定位
x330001_g_SetPosLimitScn=
{
	125,	-- 华山
	414		-- 竞技场	
}

--禁止传送到某些场景to� 鸬 等c限制....
x330001_g_LimitTransScene =
{
	{423,90},	--火焰山
	{519,90},	--火焰谷
	{424,90},	--高昌
	{520,90},	--高昌迷宫
	{425,90},	--塔里木
	{427,90},	--塔克拉玛干
	{186,75},	--L鈛 Lan
	{431,90}, --大宛
	{432,90}  --汗血岭
}



x330001_g_StrCannotUse = "Khu v馽 c醕 h� kh鬾g n trong t靚h tr課g s� d鴑g d竎h chuy琻, kh鬾g th� s� d鴑g 鹫o c� d竎h chuy琻."

x330001_g_Impact_NotTransportList = { 5929 } -- 禁止传送to� 鸬 Impact
x330001_g_TalkInfo_NotTransportList = { "#{GodFire_Info_062}" } -- 禁止传送to� 鸬 Impact提示信息

--**********************************
--事件交互入口
--**********************************
function x330001_OnDefaultEvent( sceneId, selfId, bagIndex )
-- 不C C醝 n鄖 接口,但要保留空函数
end


--**********************************
--C醝 n鄖 物品to� 鸬 使用过程喧ng否类似于技能: 
--H� th痭g会T読 执行开始时检测C醝 n鄖 函数to� 鸬 Tr� v�,如果Tr� v玹h b読则忽略后面to� 鸬 类似技能to� 鸬 执行.
--Tr� v�1: 技能类似to� 鸬 物品,可以继续类似技能to� 鸬 执行；Tr� v�0: 忽略后面to� 鸬 操作.
--**********************************
function x330001_IsSkillLikeScript( sceneId, selfId )
	return 1	 --C醝 n鄖 脚本C 动作支持
end


--**********************************
--直接Hu� b鲂Ч�: 
--H� th痭g会直接调用C醝 n鄖 接口,并根据C醝 n鄖 函数to� 鸬 Tr� v礨醕 nh以后to� 鸬 流程喧ng否执行.
--Tr� v�1: 已经Hu� b龆杂πЧ�,不再执行后续操作；Tr� v�0: 没有检测到相关效果,继续执行.
--**********************************
function x330001_CancelImpacts( sceneId, selfId )
	return 0	 --不C C醝 n鄖 接口,但要保留空函数,并且始终Tr� v�0.
end


--**********************************
--条件检测入口: 
--H� th痭g会T読 技能检测to� 鸬 时间 餴琺调用C醝 n鄖 接口,并根据C醝 n鄖 函数to� 鸬 Tr� v礨醕 nh以后to� 鸬 流程喧ng否执行.
--Tr� v�1: 条件检测通过,可以继续执行；Tr� v�0: 条件检测th b読,中断后续执行.
--**********************************
function x330001_OnConditionCheck( sceneId, selfId )

	--
	--正常使用土Linh珠to� 鸬 逻辑为传送,此处只C 进行传送前to� 鸬 检测就可以了.
	--

	--背包中to� 鸬 位置
	local	bagId	= LuaFnGetBagIndexOfUsedItem( sceneId, selfId )
	if bagId < 0 then
		return 0
	end

	--校验使用to� 鸬 物品
	if( 1 ~= LuaFnVerifyUsedItem( sceneId, selfId ) ) then
		return 0
	end
	
	--检测物品喧ng否加锁
	if LuaFnLockCheck( sceneId, selfId, bagId, 0 ) < 0 then
		x330001_MsgBox( sceneId, selfId, "V ph n鄖 疸 b� kh骯!" )
		return 0
	end

	-- 处于组队跟随状态下,不能传送
	if IsTeamFollow(sceneId, selfId) == 1  then
		x330001_MsgBox( sceneId, selfId, x330001_g_StrCannotUse )
		return 0
	end

	-- 检测玩家喧ng不喧ng处于摆摊状态,
	if LuaFnIsStalling(sceneId, selfId) == 1  then
		x330001_MsgBox( sceneId, selfId, x330001_g_StrCannotUse )
		return 0
	end

	--判断当前状态喧ng否可使用(漕运)
	if IsHaveMission( sceneId, selfId, 4021 ) > 0 then
		x330001_MsgBox( sceneId, selfId, x330001_g_StrCannotUse )
		return 0
	end

	--检测玩家身上喧ng不喧ng有“银票”C醝 n鄖 东西,有就不能使用这里to� 鸬 功能
	if GetItemCount(sceneId, selfId, x330001_g_Yinpiao) >= 1  then
		x330001_MsgBox(sceneId, selfId, x330001_g_StrCannotUse )
		return 0
	end
	
	--检测Impact状态驻留效果
	for i, ImpactId in x330001_g_Impact_NotTransportList do
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, ImpactId) ~= 0 then
			BeginEvent(sceneId)			
				AddText(sceneId, x330001_g_TalkInfo_NotTransportList[i]);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return 0
		end
	end
	
	--配置to� 鸬 指定场景不能往定位 餴琺传送
	for _, tmp in x330001_g_UselessScn do
		if tmp == sceneId then
			x330001_MsgBox( sceneId, selfId, "Trong khu v馽 n鄖 kh鬾g th� s� d鴑g!" )
			return 0
		end
	end
	
	--检测目标场景喧ng否喧ng90c以内不能传送to� 鸬 场景	--add by xindefeng
	--获取记录T読 物品身上to� 鸬 数据结构
	local	otim			--剩余使用次数
	local	osid			--场景编号
	local	opx, opy	--记忆坐标
	otim	= GetBagItemParam( sceneId, selfId, bagId, 3, 0 )
	osid	= GetBagItemParam( sceneId, selfId, bagId, 4, 1 )
	opx		= GetBagItemParam( sceneId, selfId, bagId, 6, 1 )
	opy		= GetBagItemParam( sceneId, selfId, bagId, 8, 1 )

	if opx > 0 and opy > 0 then	--已经定过位了		

		for _, tmp in x330001_g_LimitTransScene do
			if ( (tmp[1] == osid) and (GetLevel(sceneId, selfId) < tmp[2]) ) then
				local szMsg = format("Khu v馽 n鄖 y陁 c c %d tr� l阯 m緄 c� th� v鄌!", tmp[2] )
				x330001_MsgBox( sceneId, selfId, szMsg)
				return 0
			end
		end

	end
	
	return 1

end


--**********************************
--消耗检测及处理入口: 
--H� th痭g会T読 技能消耗to� 鸬 时间 餴琺调用C醝 n鄖 接口,并根据C醝 n鄖 函数to� 鸬 Tr� v礨醕 nh以后to� 鸬 流程喧ng否执行.
--Tr� v�1: 消耗处理通过,可以继续执行；Tr� v�0: 消耗检测th b読,中断后续执行.
--注意: 这不光负责消耗to� 鸬 检测也负责消耗to� 鸬 执行.
--**********************************
function x330001_OnDeplete( sceneId, selfId )

	--使用土遁珠进行传送之前会调用本函数来消耗物品....

	--
	--T読 此还要再次检测m祎 下....
	--
	local ret
	ret = x330001_OnConditionCheck( sceneId, selfId )
	if 0 == ret then
		return 0
	end

	--背包中to� 鸬 位置
	local	bagId	= LuaFnGetBagIndexOfUsedItem( sceneId, selfId )

	--获取记录T読 物品身上to� 鸬 数据结构
	local	otim			--剩余使用次数
	local	osid			--场景编号
	local	opx, opy	--记忆坐标
	otim	= GetBagItemParam( sceneId, selfId, bagId, 3, 0 )
	osid	= GetBagItemParam( sceneId, selfId, bagId, 4, 1 )
	opx		= GetBagItemParam( sceneId, selfId, bagId, 6, 1 )
	opy		= GetBagItemParam( sceneId, selfId, bagId, 8, 1 )

	--已经定过位了....
	if opx > 0 and opy > 0 then

		--不同场景传送....如果目标场景不可用....则消耗th b読....
		if sceneId ~= osid then
			if IsCanNewWorld( sceneId, selfId, osid, opx, opy ) ~= 1 then
				x330001_MsgBox( sceneId, selfId, "Kh鬾g th� d竎h chuy琻 皙n khu v馽 m鴆 ti陁." )
				return 0
			end
		end

		--可以传送....则消耗物品....
		--但喧ngT読 此处不直接消耗....因为T読 x330001_OnActivateOnce()中还C 访问物品身上to� 鸬 定位信息....
		--因此此处to� 鸬 消耗挪到x330001_OnActivateOnce()中....

		return 1

	else

		--还没定位....则消耗th b読....
		x330001_MsgBox( sceneId, selfId, "Vui l騨g ch鱪 鸶a 餴琺 鸶nh v� th韈h h䅟 r癷 h銀 s� d鴑g ch裞 n錸g d竎h chuy琻." )
		return 0

	end

	return 1

end


--**********************************
--只会执行m祎 次入口: 
--聚气和瞬发技能会T読 消耗完成后调用C醝 n鄖 接口(聚气结束并且各种条件都Th鯽 m鉵to� 鸬 时候),而引导
--技能也会T読 消耗完成后调用C醝 n鄖 接口(技能to� 鸬 m祎 开始,消耗成功执行之后).
--Tr� v�1: 处理成功；Tr� v�0: 处理th b読.
--注: 这里喧ng技能生效m祎 次to� 鸬 入口
--**********************************
function x330001_OnActivateOnce( sceneId, selfId )

	--
	--正常使用土Linh珠to� 鸬 逻辑为传送,此处只C 进行传送就可以了.
	--

	--背包中to� 鸬 位置
	local	bagId			= LuaFnGetBagIndexOfUsedItem( sceneId, selfId )


	--获取记录T読 物品身上to� 鸬 定位数据....
	local	otim			--剩余使用次数....
	local	osid			--场景编号
	local	opx, opy	--记忆坐标
	otim	= GetBagItemParam( sceneId, selfId, bagId, 3, 0 )
	osid	= GetBagItemParam( sceneId, selfId, bagId, 4, 1 )
	opx		= GetBagItemParam( sceneId, selfId, bagId, 6, 1 )
	opy		= GetBagItemParam( sceneId, selfId, bagId, 8, 1 )

	-- 餴琺到定位数据后就可以消耗物品了....

	--减少可使用次数
	otim = otim - 1
	SetBagItemParam( sceneId, selfId, bagId, 3, 0, otim )
	--记录统计信息
	LuaFnAuditGPS( sceneId, selfId, 0 )
	--刷新Client端to� 鸬 背包物品信息
	LuaFnRefreshItemInfo( sceneId, selfId, bagId )

	--如果可使用次数用完则删除物品....删除th b読则不传送....
	local ret
	if otim <= 0 then
		ret = EraseItem( sceneId, selfId, bagId )
		if 1 ~= ret then
			return
		end
	end

	--如果配置了使用to� 鸬 特效则加到玩家身上....
	if( -1 ~= x330001_g_Impact ) then
		LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x330001_g_Impact, 0 )
	end

	--若已记录过定位信息则传送....
	if opx > 0 and opy > 0 then

		if sceneId == osid then
			--同m祎 场景传送
			SetPos( sceneId, selfId, opx, opy )
		else
			--不同场景传送
			NewWorld( sceneId, selfId, osid, opx, opy )
		end

	end

	return 1

end


--**********************************
--引导心跳处理入口: 
--引导技能会T読 每次心跳结束时调用C醝 n鄖 接口.
--Tr� v�: 1继续下次心跳；0: 中断引导.
--注: 这里喧ng技能生效m祎 次to� 鸬 入口
--**********************************
function x330001_OnActivateEachTick( sceneId, selfId )
	return 1	 --不喧ng引导性脚本, 只保留空函数.
end


--**********************************
--信息提示
--**********************************
function x330001_MsgBox( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end


--**********************************
-- 玩家S� d鴑g v ph  定位
--**********************************
function x330001_SetPosition( sceneId, selfId, nItemIndex )

	--
	--定位前to� 鸬 检测
	--
	
	--定位喧ng客户端直接callC醝 n鄖 函数实现to� 鸬 ....所以没有经过S� d鴑g v ph to� 鸬 检测....
	--因此这里要进行等c限制等检测....
	if GetLevel(sceneId, selfId)<10  then
		x330001_MsgBox( sceneId, selfId, "Kh鬾g 瘘 鹌ng c" )
		return
	end

	--检测物品喧ng否加锁
	if LuaFnLockCheck( sceneId, selfId, nItemIndex, 0 ) < 0 then
		x330001_MsgBox( sceneId, selfId, "V ph n鄖 疸 b� kh骯!" )
		return 0
	end

	--检测喧ng不喧ng土Linh珠
	if GetItemTableIndexByIndex(sceneId, selfId, nItemIndex) ~= x330001_g_ItemId 
		 and GetItemTableIndexByIndex(sceneId, selfId, nItemIndex) ~= x330001_g_ItemId01  then
		x330001_MsgBox( sceneId, selfId, "Sai s髏 trong tay n鋓" )
		return
	end

	--副本或帮会Th鄋h th改谖薹ǘㄎ�
	if LuaFnGetSceneType( sceneId ) == 1 or LuaFnGetSceneType( sceneId ) == 4 then
		x330001_MsgBox( sceneId, selfId, "Trong ph� b鋘 ho th鄋h th� bang h礽 kh鬾g  th� 鸶nh v�!" )
		return
	end

	--配置to� 鸬 指定场景不能定位
	for _, tmp in x330001_g_SetPosLimitScn do
		if tmp == sceneId then
			x330001_MsgBox( sceneId, selfId, "Trong khu v馽 n鄖 kh鬾g th� s� d鴑g!" )
			return
		end
	end

	--
	--开蔯ㄎ�
	--

	--获取记录T読 物品身上to� 鸬 数据结构
	local	otim			--剩余使用次数
	local	osid			--场景编号
	local	opx, opy	--记忆坐标
	otim	= GetBagItemParam( sceneId, selfId, nItemIndex, 3, 0 )
	osid	= GetBagItemParam( sceneId, selfId, nItemIndex, 4, 1 )
	opx		= GetBagItemParam( sceneId, selfId, nItemIndex, 6, 1 )
	opy		= GetBagItemParam( sceneId, selfId, nItemIndex, 8, 1 )

	--如果还未曾定位过则重置物品信息....
	if otim == 0 and osid == 0 and opx == 0 and opy == 0 then
		otim = x330001_g_UseTim
	end

	--获取玩家to� 鸬 当前坐标和场景ID....
	osid			= sceneId
	opx, opy	= LuaFnGetUnitPosition( sceneId, selfId )
	opx	= floor( opx )
	opy	= floor( opy )

	--将信息设置到物品中(定位)....
	SetBagItemParam( sceneId, selfId, nItemIndex, 0, 1, 10 )								--Key,这位标识操作集合,也喧ngClient修正Tooltipsto� 鸬 依据
	SetBagItemParam( sceneId, selfId, nItemIndex, 2, 0, x330001_g_UseTim )	--最大使用次数
	SetBagItemParam( sceneId, selfId, nItemIndex, 3, 0, otim )							--剩余使用次数
	SetBagItemParam( sceneId, selfId, nItemIndex, 4, 1, osid )							--场景编号
	SetBagItemParam( sceneId, selfId, nItemIndex, 6, 1, opx )								--X坐标
	SetBagItemParam( sceneId, selfId, nItemIndex, 8, 1, opy )								--Y坐标
	
	--记录统计信息
	LuaFnAuditGPS( sceneId, selfId, 1 )

	--刷新Client端to� 鸬 背包物品信息
	LuaFnRefreshItemInfo( sceneId, selfId, nItemIndex )

	x330001_MsgBox( sceneId, selfId, "Th� Linh Ch鈛 c黙 c醕 h� 鸶nh v� th鄋h c鬾g." )

end
