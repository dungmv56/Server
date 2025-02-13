-- 创建人:[ QUFEI 2008-03-10 10:41 UPDATE BugID 32708 ]
-- 火把使者 ItemID 40004444

-- 脚本号
x808084_g_scriptId = 808084

x808084_g_event = 808080				-- Nhi甿 v� R鵤-Th� thi ch誽脚本
--任务号
x808084_g_MissionId			= 1000

--任务每天环数标记
x808084_g_Mission_RoundNum	 = 7		--任务参数to� 鸬 第7位

-- 任务物品参数标记
x808084_g_LuoYangLighten_Cnt 	= 5	--孔明灯L誧 D呓ngM� ra 数量索引
x808084_g_SuZhouLighten_Cnt		= 7	--孔明灯T� Ch鈛M� ra 数量索引
x808084_g_DaLiLighten_Cnt		= 9		--孔明灯姓i L齅� ra 数量索引

--孔明灯完成数量标记
x808084_g_KongMing_Lighten				= 4		--任务参数to� 鸬 第4位

x808084_g_KongMingLighten_Count		=	8		-- 每段路中C  餴琺燃to� 鸬 孔明灯数量
x808084_g_KongMingLighten_MaxCnt	=	24	-- R鵤-Th� thi ch誽活动C  餴琺燃to� 鸬 孔明灯总数

-- 每天R鵤-Th� thi ch誽活动M� ra 时间
x808084_g_ActivityTime						= { {tstart=1230, tend=1330},
																		  {tstart=1930, tend=2030},
																		  {tstart=2130, tend=2230} }

--**********************************
--事件交互入口
--**********************************
function x808084_OnDefaultEvent( sceneId, selfId, bagIndex )
-- 不C C醝 n鄖 接口,但要保留空函数
end


--**********************************
--C醝 n鄖 物品to� 鸬 使用过程喧ng否类似于技能: 
--H� th痭g会T読 执行开始时检测C醝 n鄖 函数to� 鸬 Tr� v�,如果Tr� v玹h b読则忽略后面to� 鸬 类似技能to� 鸬 执行.
--Tr� v�1: 技能类似to� 鸬 物品,可以继续类似技能to� 鸬 执行；Tr� v�0: 忽略后面to� 鸬 操作.
--**********************************
function x808084_IsSkillLikeScript( sceneId, selfId )
	return 1	 --C醝 n鄖 脚本C 动作支持
end


--**********************************
--直接Hu� b鲂Ч�: 
--H� th痭g会直接调用C醝 n鄖 接口,并根据C醝 n鄖 函数to� 鸬 Tr� v礨醕 nh以后to� 鸬 流程喧ng否执行.
--Tr� v�1: 已经Hu� b龆杂πЧ�,不再执行后续操作；Tr� v�0: 没有检测到相关效果,继续执行.
--**********************************
function x808084_CancelImpacts( sceneId, selfId )
	return 0	 --不C C醝 n鄖 接口,但要保留空函数,并且始终Tr� v�0.
end

--**********************************
--引导心跳处理入口: 
--引导技能会T読 每次心跳结束时调用C醝 n鄖 接口.
--Tr� v�: 1继续下次心跳；0: 中断引导.
--注: 这里喧ng技能生效m祎 次to� 鸬 入口
--**********************************
function x808084_OnActivateEachTick( sceneId, selfId )
	return 1	 --不喧ng引导性脚本, 只保留空函数.
end


--**********************************
--信息提示
--**********************************
function x808084_MsgBox( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--条件检测入口: 
--H� th痭g会T読 技能检测to� 鸬 时间 餴琺调用C醝 n鄖 接口,并根据C醝 n鄖 函数to� 鸬 Tr� v礨醕 nh以后to� 鸬 流程喧ng否执行.
--Tr� v�1: 条件检测通过,可以继续执行；Tr� v�0: 条件检测th b読,中断后续执行.
--**********************************
function x808084_OnConditionCheck( sceneId, selfId )
	
	--背包中to� 鸬 位置
	local	BagPos	= LuaFnGetBagIndexOfUsedItem( sceneId, selfId )

	if BagPos < 0 then
		return 0
	end
	
	--校验使用to� 鸬 物品喧ng否存T読 
	if( 1 ~= LuaFnVerifyUsedItem( sceneId, selfId ) ) then
		return 0
	end
	
	--检测有没有Nhi甿 v� R鵤-Th� thi ch誽
	if IsHaveMission( sceneId, selfId, x808084_g_MissionId ) <= 0 then
		x808084_MsgBox( sceneId, selfId, "#{GodFire_Info_011}" )
		return 0
	end

	--检测喧ng否处于活动时间内
	if x808084_CheckHuoDongTime() == 0 then
		x808084_MsgBox( sceneId, selfId, "#{GodFire_Info_036}" )
		return 0
	end
	
	local misIndex = GetMissionIndexByID(sceneId,selfId,x808084_g_MissionId)
	
	-- 鹫t 疬㧟孔明灯完成信息
	local LuoYangCnt = GetBagItemParam(sceneId, selfId, BagPos, x808084_g_LuoYangLighten_Cnt, 1)
	local SuZhouCnt = GetBagItemParam(sceneId, selfId, BagPos, x808084_g_SuZhouLighten_Cnt, 1)
	local DaLiCnt = GetBagItemParam(sceneId, selfId, BagPos, x808084_g_DaLiLighten_Cnt, 1)
	local	nAllCount = GetMissionParam(sceneId, selfId, misIndex, x808084_g_KongMing_Lighten)
		
	BeginEvent(sceneId)
		AddText(sceneId, "#{GodFire_Info_001}")
		local str01 = format("#{GodFire_Info_021} %d/%d", LuoYangCnt, x808084_g_KongMingLighten_Count)
		local str02 = format("#{GodFire_Info_022} %d/%d", SuZhouCnt, x808084_g_KongMingLighten_Count)
		local str03 = format("#{GodFire_Info_023} %d/%d", DaLiCnt, x808084_g_KongMingLighten_Count)
		local str04 = format("#{GodFire_Info_035} %d/%d", nAllCount, x808084_g_KongMingLighten_MaxCnt)
		AddText(sceneId, str01)
		AddText(sceneId, str02)
		AddText(sceneId, str03)
		AddText(sceneId, str04)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,-1)
	return 1
	
end

--**********************************
--消耗检测及处理入口: 
--H� th痭g会T読 技能消耗to� 鸬 时间 餴琺调用C醝 n鄖 接口,并根据C醝 n鄖 函数to� 鸬 Tr� v礨醕 nh以后to� 鸬 流程喧ng否执行.
--Tr� v�1: 消耗处理通过,可以继续执行；Tr� v�0: 消耗检测th b読,中断后续执行.
--注意: 这不光负责消耗to� 鸬 检测也负责消耗to� 鸬 执行.
--**********************************
function x808084_OnDeplete( sceneId, selfId )	
	--
	--T読 此还要再次检测m祎 下....
	--
	return 0
end

--**********************************
--只会执行m祎 次入口: 
--聚气和瞬发技能会T読 消耗完成后调用C醝 n鄖 接口(聚气结束并且各种条件都Th鯽 m鉵to� 鸬 时候),而引导
--技能也会T読 消耗完成后调用C醝 n鄖 接口(技能to� 鸬 m祎 开始,消耗成功执行之后).
--Tr� v�1: 处理成功；Tr� v�0: 处理th b読.
--注: 这里喧ng技能生效m祎 次to� 鸬 入口
--**********************************
function x808084_OnActivateOnce( sceneId, selfId )
	return 0
end

--**********************************
--检测活动时间
--**********************************
function x808084_CheckHuoDongTime()

	local nHour	 = GetHour()
	local nMinute = GetMinute()  
  local curHourTime = nHour*100+nMinute

	for i=1, getn(x808084_g_ActivityTime) do
	  if curHourTime >= x808084_g_ActivityTime[i].tstart and curHourTime <= x808084_g_ActivityTime[i].tend then
	  	return i		
	  end
	end

	return 0

end
