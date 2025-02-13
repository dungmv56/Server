--注意: 

--物品技能to� 鸬 逻辑只能使用基础技能和脚本来实现

--脚本:

--以下喧ng脚本样例:


--4846.lua
------------------------------------------------------------------------------------------
--m祎 般物品to� 鸬 默认脚本
--定位符(红色、蓝色、白色、绿色、黄色、紫色)
--脚本号
x334846_g_ScriptId	= 334846

--效果to� 鸬 ID
x334846_g_Impact		= -1	--使用m祎 c醝特定to� 鸬 特效编号

--操作集
x334846_g_Key				= {}
x334846_g_Key["nul"]= 0		--啥都没做
x334846_g_Key["log"]= 1		--记录坐标
x334846_g_Key["bus"]= 2		--成功传送

--不同等cto� 鸬 定位符使用次数不同
x334846_g_UseTim		= { 8, 13, 20,30 }

x334846_g_Yinpiao = 40002000

x334846_g_Impact_NotTransportList = { 5929 } -- 禁止传送to� 鸬 Impact
x334846_g_TalkInfo_NotTransportList = { "#{GodFire_Info_062}" } -- 禁止传送to� 鸬 Impact提示信息

--禁止传送到L鈛 Lan场景等c上限	--add by xindefeng
x334846_g_LimitTransLevel = 75

--**********************************
--事件交互入口
--**********************************
function x334846_OnDefaultEvent( sceneId, selfId, bagIndex )
-- 不C C醝 n鄖 接口,但要保留空函数
end

--**********************************
--C醝 n鄖 物品to� 鸬 使用过程喧ng否类似于技能: 
--H� th痭g会T読 执行开始时检测C醝 n鄖 函数to� 鸬 Tr� v�,如果Tr� v玹h b読则忽略后面to� 鸬 类似技能to� 鸬 执行.
--Tr� v�1: 技能类似to� 鸬 物品,可以继续类似技能to� 鸬 执行；Tr� v�0: 忽略后面to� 鸬 操作.
--**********************************
function x334846_IsSkillLikeScript( sceneId, selfId )
	return 1	 --C醝 n鄖 脚本C 动作支持
end

--**********************************
--直接Hu� b鲂Ч�: 
--H� th痭g会直接调用C醝 n鄖 接口,并根据C醝 n鄖 函数to� 鸬 Tr� v礨醕 nh以后to� 鸬 流程喧ng否执行.
--Tr� v�1: 已经Hu� b龆杂πЧ�,不再执行后续操作；Tr� v�0: 没有检测到相关效果,继续执行.
--**********************************
function x334846_CancelImpacts( sceneId, selfId )
	return 0	 --不C C醝 n鄖 接口,但要保留空函数,并且始终Tr� v�0.
end

--**********************************
--条件检测入口: 
--H� th痭g会T読 技能检测to� 鸬 时间 餴琺调用C醝 n鄖 接口,并根据C醝 n鄖 函数to� 鸬 Tr� v礨醕 nh以后to� 鸬 流程喧ng否执行.
--Tr� v�1: 条件检测通过,可以继续执行；Tr� v�0: 条件检测th b読,中断后续执行.
--**********************************
function x334846_OnConditionCheck( sceneId, selfId )

	--背包中to� 鸬 位置
	local	bagId	= LuaFnGetBagIndexOfUsedItem( sceneId, selfId )
	if bagId < 0 then
		return 0
	end

	--判断当前状态喧ng否可使用定位符
	if IsHaveMission( sceneId, selfId, 4021 ) > 0 then
		x334846_MsgBox( sceneId, selfId, "您处于不允许传送to� 鸬 状态,不能使用定位符!" )
		return 0
	end

	--检测物品喧ng否加锁
	if LuaFnLockCheck( sceneId, selfId, bagId, 0 ) < 0 then
		x334846_MsgBox( sceneId, selfId, "V ph n鄖 疸 b� kh骯!" )
		return 0
	end

	--检测玩家身上喧ng不喧ng有“银票”C醝 n鄖 东西,有就不能使用这里to� 鸬 功能
	if GetItemCount(sceneId, selfId, x334846_g_Yinpiao) >= 1  then
		x334846_MsgBox(sceneId, selfId, "您处于跑商状态,不能使用定位符!")
		return 0
	end
	
	--检测Impact状态驻留效果
	for i, ImpactId in x334846_g_Impact_NotTransportList do
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, ImpactId) ~= 0 then
			BeginEvent(sceneId)			
				AddText(sceneId, x334846_g_TalkInfo_NotTransportList[i]);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return 0
		end
	end
	
	local	opx, opy	--记忆坐标
	opx		= GetBagItemParam( sceneId, selfId, bagId, 6, 1 )
	opy		= GetBagItemParam( sceneId, selfId, bagId, 8, 1 )
	local osid	= GetBagItemParam( sceneId, selfId, bagId, 4, 1 )--已定位场景ID
	--若未记录过定位信息
	if opx <= 0 and opy <= 0 then
		--判断当前场景喧ng否可使用定位符
		if sceneId ~= SCENE_DALI and sceneId ~= SCENE_LUOYANG and sceneId ~= SCENE_SUZHOU and sceneId ~= SCENE_LOULAN then	--L鈛 Lan也喧ng主城--modify by xindefeng
			x334846_MsgBox( sceneId, selfId, "除了T� Ch鈛、L誧 D呓ng、姓i L鈛 Lan外,不可T読 其他场景使用定位符!" )
			return 0
		end		
	else	
		--已经定位,并且定位到L鈛 Lan,则判断c别,<90c禁入!--add by xindefeng
		if (osid == SCENE_LOULAN) and (GetLevel(sceneId, selfId) < x334846_g_LimitTransLevel) then
			local szMsg = format("L鈛 LanC %dcm緄 c� th� ti猲 v鄌", x334846_g_LimitTransLevel)
			x334846_MsgBox( sceneId, selfId, szMsg )
			return 0
		end
	end

	--校验使用to� 鸬 物品
	if( 1 ~= LuaFnVerifyUsedItem( sceneId, selfId ) ) then
		return 0
	end
	return 1

end

--**********************************
--消耗检测及处理入口: 
--H� th痭g会T読 技能消耗to� 鸬 时间 餴琺调用C醝 n鄖 接口,并根据C醝 n鄖 函数to� 鸬 Tr� v礨醕 nh以后to� 鸬 流程喧ng否执行.
--Tr� v�1: 消耗处理通过,可以继续执行；Tr� v�0: 消耗检测th b読,中断后续执行.
--注意: 这不光负责消耗to� 鸬 检测也负责消耗to� 鸬 执行.
--**********************************
function x334846_OnDeplete( sceneId, selfId )
--if( 0 < LuaFnDepletingUsedItem( sceneId, selfId ) ) then
--	return 1
--end
--return 0

	return 1
end

--**********************************
--只会执行m祎 次入口: 
--聚气和瞬发技能会T読 消耗完成后调用C醝 n鄖 接口(聚气结束并且各种条件都Th鯽 m鉵to� 鸬 时候),而引导
--技能也会T読 消耗完成后调用C醝 n鄖 接口(技能to� 鸬 m祎 开始,消耗成功执行之后).
--Tr� v�1: 处理成功；Tr� v�0: 处理th b読.
--注: 这里喧ng技能生效m祎 次to� 鸬 入口
--**********************************
function x334846_OnActivateOnce( sceneId, selfId )
	if( -1 ~= x334846_g_Impact ) then
		LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x334846_g_Impact, 0 )
	end
	
	--背包中to� 鸬 位置
	local	bagId	= LuaFnGetBagIndexOfUsedItem( sceneId, selfId )
	local	key, tim	= x334846_OnUse( sceneId, selfId )
	
	--判断喧ng否销毁物品
	if key == x334846_g_Key["bus"] and tim <= 0 then
--	LuaFnDepletingUsedItem( sceneId, selfId )
		if bagId >= 0 then
			EraseItem( sceneId, selfId, bagId )
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
function x334846_OnActivateEachTick( sceneId, selfId )
	return 1	 --不喧ng引导性脚本, 只保留空函数.
end

--**********************************
--使用,Tr� v僮髦噶钜约笆Ｓ嗍褂么问�
--**********************************
function x334846_OnUse( sceneId, selfId )

	--背包中to� 鸬 位置
	local	bagId	= LuaFnGetBagIndexOfUsedItem( sceneId, selfId )
	if bagId < 0 then
		return x334846_g_Key["nul"]
	end

	--判断当前状态喧ng否可使用定位符
	if IsHaveMission( sceneId, selfId, 4021 ) > 0 then
		x334846_MsgBox( sceneId, selfId, "您处于不允许传送to� 鸬 状态,不能使用定位符!" )
		return x334846_g_Key["nul"]
	end

	--检测物品喧ng否加锁
	if LuaFnLockCheck( sceneId, selfId, bagId, 0 ) < 0 then
		x334846_MsgBox( sceneId, selfId, "V ph n鄖 疸 b� kh骯!" )
		return x334846_g_Key["nul"]
	end

	--检测玩家身上喧ng不喧ng有“银票”C醝 n鄖 东西,有就不能使用这里to� 鸬 功能
	if GetItemCount(sceneId, selfId, x334846_g_Yinpiao) >= 1  then
		x334846_MsgBox(sceneId, selfId, "您处于跑商状态,不能使用定位符!")
		return x334846_g_Key["nul"]
	end
	
	--检测Impact状态驻留效果
	for i, ImpactId in x334846_g_Impact_NotTransportList do
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, ImpactId) ~= 0 then
			BeginEvent(sceneId)			
				AddText(sceneId, x334846_g_TalkInfo_NotTransportList[i]);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return 0
		end
	end
	
	--定位符to� 鸬 最大使用次数
	local	oid		= LuaFnGetItemTableIndexByIndex( sceneId, selfId, bagId )
	local	olev	= GetCommonItemGrade( oid )
	local	omax	= x334846_g_UseTim[olev]

	--获取记录T読 物品身上to� 鸬 数据结构
	local	otim			--定位符to� 鸬 剩余使用次数
	local	osid			--场景编号
	local	opx, opy	--记忆坐标
	otim	= GetBagItemParam( sceneId, selfId, bagId, 3, 0 )
	osid	= GetBagItemParam( sceneId, selfId, bagId, 4, 1 )
	opx		= GetBagItemParam( sceneId, selfId, bagId, 6, 1 )
	opy		= GetBagItemParam( sceneId, selfId, bagId, 8, 1 )

	--若已记录过定位信息则传送,否则记录当前信息
	--同时可使用次数减1,当其值为0时删除该物品
	if opx > 0 and opy > 0 then
		if sceneId == osid then
			--同m祎 场景传送
			SetPos( sceneId, selfId, opx, opy )
		else
			--L鈛 Lan<90c禁入--add by xindefeng
			if (osid == SCENE_LOULAN) and (GetLevel(sceneId, selfId) < x334846_g_LimitTransLevel) then
				local szMsg = format("L鈛 LanC %dcm緄 c� th� ti猲 v鄌", x334846_g_LimitTransLevel)
				x334846_MsgBox( sceneId, selfId, szMsg )
				return x334846_g_Key["nul"]
			end
			--检测喧ng否可以切换到目标场景
			if IsCanNewWorld( sceneId, selfId, osid, opx, opy ) ~= 1 then
				return x334846_g_Key["nul"]
			end
			--不同场景传送
			NewWorld( sceneId, selfId, osid, opx, opy )
		end
		SetBagItemParam( sceneId, selfId, bagId, 3, 0, (otim-1) )
		--记录统计信息
		LuaFnAuditGPS(sceneId, selfId, 0)

		--刷新Client端to� 鸬 背包物品信息
		LuaFnRefreshItemInfo( sceneId, selfId, bagId )
		return x334846_g_Key["bus"], (otim-1)
	end

	--记耤ㄎ恍畔�	
	--判断当前场景喧ng否可使用定位符
	if sceneId ~= SCENE_DALI and sceneId ~= SCENE_LUOYANG and sceneId ~= SCENE_SUZHOU and sceneId ~= SCENE_LOULAN then	--L鈛 Lan也喧ng主城--modify by xindefeng
		x334846_MsgBox( sceneId, selfId, "除了T� Ch鈛、L誧 D呓ng、姓i L鈛 Lan外,不可T読 其他场景使用定位符!" )
		return x334846_g_Key["nul"]
	end	

	--获取玩家to� 鸬 当前坐标
	osid			= sceneId
	opx, opy	= LuaFnGetUnitPosition( sceneId, selfId )
	opx	= floor( opx )
	opy	= floor( opy )

	SetBagItemParam( sceneId, selfId, bagId, 0, 1, 10 )		--Key,这位标识操作集合,也喧ngClient修正Tooltipsto� 鸬 依据
	SetBagItemParam( sceneId, selfId, bagId, 2, 0, omax )	--最大使用次数
	SetBagItemParam( sceneId, selfId, bagId, 3, 0, omax )	--剩余使用次数
	SetBagItemParam( sceneId, selfId, bagId, 4, 1, osid )	--场景编号
	SetBagItemParam( sceneId, selfId, bagId, 6, 1, opx )	--X坐标
	SetBagItemParam( sceneId, selfId, bagId, 8, 1, opy )	--Y坐标
	--刷新Client端to� 鸬 背包物品信息
	LuaFnRefreshItemInfo( sceneId, selfId, bagId )
	--记录统计信息
	LuaFnAuditGPS(sceneId, selfId, 1)

	return x334846_g_Key["log"], omax
end

--**********************************
--信息提示
--**********************************
function x334846_MsgBox( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
