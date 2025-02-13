--------------------------------------------
--Thg B秏 B鋙 Ch鈛道具脚本
--Created By 信德峰
--------------------------------------------

--脚本ID
x335136_g_scriptId = 335136

--Thg B秏 B鋙 Ch鈛ID
x335136_g_YuRenBaoZhuID = 30501161

--最大使用次数
x335136_g_CanUseMaxCount = 5

x335136_g_CanUseCity = {[1] = SCENE_LUOYANG,[2] = SCENE_SUZHOU,[3] = SCENE_DALI,
	                      [4] = SCENE_LOULAN,[5] = 71,[6] = 72}
--效果数量
x335136_g_ImpactCount = 10

--效果ID表
x335136_g_ImpactTable = { 
	[1] = 
	{													
		[1] = 5000,
		[2] = 5001,
		[3] = 5002,
		[4] = 5003,
		[5] = 5004,
		[6] = 5005,
		[7] = 5006,
		[8] = 5007,
		[9] = 5008,
		[10] = 5009
	},
	[2] =
	{
		[1] = 5014,
		[2] = 5015,
		[3] = 5016,
		[4] = 5017,
		[5] = 5018,
		[6] = 5019,
		[7] = 5020,
		[8] = 5021,
		[9] = 5022,
		[10] = 5023
	}
	

												}

--落马箭效果ID
x335136_g_LuoMaJianImpactID = 154


--**********************************
--事件交互入口
--**********************************
function x335136_OnDefaultEvent( sceneId, selfId, bagIndex )	
end

--**********************************
--C醝 n鄖 物品to� 鸬 使用过程喧ng否类似于技能: 
--H� th痭g会T読 执行开始时检测C醝 n鄖 函数to� 鸬 Tr� v�,如果Tr� v玹h b読则忽略后面to� 鸬 类似技能to� 鸬 执行.
--Tr� v�1: 技能类似to� 鸬 物品,可以继续类似技能to� 鸬 执行；Tr� v�0: 忽略后面to� 鸬 操作.
--**********************************
function x335136_IsSkillLikeScript( sceneId, selfId)
	return 1
end

--**********************************
--直接Hu� b鲂Ч�: 
--H� th痭g会直接调用C醝 n鄖 接口,并根据C醝 n鄖 函数to� 鸬 Tr� v礨醕 nh以后to� 鸬 流程喧ng否执行.
--Tr� v�1: 已经Hu� b龆杂πЧ�,不再执行后续操作；Tr� v�0: 没有检测到相关效果,继续执行.
--**********************************
function x335136_CancelImpacts( sceneId, selfId )
	return 0
end

--**********************************
--条件检测入口: 
--H� th痭g会T読 技能检测to� 鸬 时间 餴琺调用C醝 n鄖 接口,并根据C醝 n鄖 函数to� 鸬 Tr� v礨醕 nh以后to� 鸬 流程喧ng否执行.
--Tr� v�1: 条件检测通过,可以继续执行；Tr� v�0: 条件检测th b読,中断后续执行.
--**********************************
function x335136_OnConditionCheck( sceneId, selfId )
	--检测Item喧ng否有效
	if(LuaFnVerifyUsedItem(sceneId, selfId) == 0) then
		return 0;	--Item无效直接Tr� v�
	end
	-- zchw
	local itemIndex = LuaFnGetItemIndexOfUsedItem(sceneId, selfId);
	--不能给自己使用
	local targetId = LuaFnGetTargetObjID(sceneId, selfId)--对象ID
	if((targetId == selfId) or (targetId < 0))then
			x335136_MsgBox( sceneId, selfId, "#{YRJ_SelfUseTip}")	--不能给自己使用
			return 0;
	end
	
	--只能给玩家使用
	local objType = GetCharacterType( sceneId, targetId )--对象类型
	if(objType ~= 1)then	--对象不喧ngHuman
		x335136_MsgBox( sceneId, selfId, "#{ResultText_8}")	--无效目标
		return 0
	end
	
	--检测物品喧ng否加锁
	local	bagId	= LuaFnGetBagIndexOfUsedItem( sceneId, selfId )	--背包中to� 鸬 位置
	if LuaFnLockCheck( sceneId, selfId, bagId, 0 ) < 0 then
		x335136_MsgBox( sceneId, selfId, "#{Item_Locked}" )	--物品已加锁
		return 0
	end
	
	--检测玩家喧ng不喧ng处于摆摊状态
	if LuaFnIsStalling(sceneId, selfId) == 1  then
	  if itemIndex == x335136_g_YuRenBaoZhuID then
			x335136_MsgBox( sceneId, selfId, "#{YRJ_LimitStallageTip}")	--无法对摆摊状态to� 鸬 玩家使用Thg B秏 B鋙 Ch鈛
		else
			x335136_MsgBox( sceneId, selfId, "Kh鬾g th� 鸨i tr課g th醝 #GB鄖 b醤 #Wh銀 s� d鴑g s� 鸢 b鋙 ch鈛");
		end
		return 0
	end
	
	--检测对方喧ng否T読 BUS上
	if(LuaFnIsInBus(sceneId, selfId, targetId) == 1)then
		if itemIndex == x335136_g_YuRenBaoZhuID then
			x335136_MsgBox( sceneId, selfId, "#{YRJ_TargetInBusTip}")	--无法对BUS状态to� 鸬 玩家使用Thg B秏 B鋙 Ch鈛
		else
			x335136_MsgBox( sceneId, selfId, "Kh鬾g th� 鸨i tr課g th醝 BUFF h銀 s� d鴑g s� 鸢 b鋙 ch鈛");
		end
		return 0
	end
	
	--检测对方喧ng否T読 双人骑乘上
	if(LuaFnGetDRide(sceneId, selfId, targetId) == 1)then
		if itemIndex == x335136_g_YuRenBaoZhuID then
			x335136_MsgBox( sceneId, selfId, "#{YRJ_DoubleRideTip}")	--无法对双人骑乘to� 鸬 玩家使用Thg B秏 B鋙 Ch鈛.
		else
			x335136_MsgBox( sceneId, selfId, "Kh鬾g th� 鸨i song nh鈔 k� h銀 s� d鴑g s� 鸢 b鋙 ch鈛");
		end
		return 0
	end
	
	--检测玩家喧ng否T読 四大主城中(包括L鈛 Lan),玩家T読 ,对象玩家也就T読 喽
  local flag = 0 
  for i,_ in x335136_g_CanUseCity do
  	if sceneId == x335136_g_CanUseCity[i] then
  		 flag = 1
  	end
  end
  if flag == 0 then --0表示玩家不T読 四大主城中
		if itemIndex == x335136_g_YuRenBaoZhuID then
			x335136_MsgBox( sceneId, selfId, "#{YRJ_LimitCityTip}")	--只能T読 Th鄋h th改谑褂肨hg B秏 B鋙 Ch鈛
		else
			x335136_MsgBox( sceneId, selfId, "#{STBZ_090324_1}")
		end
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
function x335136_OnDeplete( sceneId, selfId )	
	if(0<LuaFnDepletingUsedItem(sceneId, selfId)) then
		return 1
	end
	return 0
end

--**********************************
--只会执行m祎 次入口: 
--聚气和瞬发技能会T読 消耗完成后调用C醝 n鄖 接口(聚气结束并且各种条件都Th鯽 m鉵to� 鸬 时候),而引导
--技能也会T読 消耗完成后调用C醝 n鄖 接口(技能to� 鸬 m祎 开始,消耗成功执行之后).
--Tr� v�1: 处理成功；Tr� v�0: 处理th b読.
--注: 这里喧ng技能生效m祎 次to� 鸬 入口
--**********************************
function x335136_OnActivateOnce( sceneId, selfId )
	local targetId = LuaFnGetTargetObjID(sceneId, selfId)
	if(targetId < 0) then	--目标不合法
		return 0
	end
	
	--获取"宝珠"所T読 背包中to� 鸬 位置
	local	bagId = LuaFnGetBagIndexOfUsedItem(sceneId, selfId)
	--zchw
  local itemIndex = LuaFnGetItemIndexOfUsedItem(sceneId, selfId);
	--获取记录T読 物品身上to� 鸬 定位数据
	local	CurUseCount		= GetBagItemParam( sceneId, selfId, bagId, 8, 2 )	--获取剩余使用次数	
	if(CurUseCount == 0)then	--第m祎 次使用
		CurUseCount = x335136_g_CanUseMaxCount		
	end
  
	--减少可使用次数
	CurUseCount = CurUseCount - 1
	if(CurUseCount <= 0) then
		local ret = EraseItem( sceneId, selfId, bagId )		
		if ret ~= 1 then
			return 0--删除th b読
		end
	end
	
	--保存m祎 下数据
	SetBagItemParam( sceneId, selfId, bagId, 4, 2, x335136_g_CanUseMaxCount )--保存最大使用次数
	SetBagItemParam( sceneId, selfId, bagId, 8, 2, CurUseCount )--保存还可以使用次数
	
	--刷新Client端to� 鸬 背包物品信息
	LuaFnRefreshItemInfo( sceneId, selfId, bagId )
	
	--加效果
	local bRet = LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, targetId, x335136_g_LuoMaJianImpactID, 0)	--先使用落马箭效果
	
	if (bRet == 1) then	--落马箭成功
	  -- zchw
	  if (itemIndex == x335136_g_YuRenBaoZhuID) then
			local ImpactIndex = x335136_g_ImpactTable[1][random(x335136_g_ImpactCount)]	--随机选择效果
			bRet = LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, targetId, ImpactIndex, 0)		--再添加变身效果
		elseif (itemIndex == 30501162) then --S� 邪 B鋙 Ch鈛
			local ImpactIndex = x335136_g_ImpactTable[2][random(x335136_g_ImpactCount)]	--随机选择效果
			bRet = LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, targetId, ImpactIndex, 0)		--再添加变身效果
		end
	end
	
	if(bRet == 1) then --变身成功
		--zchw
		if (itemIndex == x335136_g_YuRenBaoZhuID) then
			 szMsg = format("Ng呓i %s s� d鴑g Thg B秏 B鋙 Ch鈛", GetName(sceneId,selfId))
		elseif (itemIndex == 30501162) then --S� 邪 B鋙 Ch鈛
			 szMsg = format("Ng呓i %s s� d鴑g S� 邪 B鋙 Ch鈛", GetName(sceneId,selfId))
		end	
		x335136_MsgBox( sceneId, targetId, szMsg )	--给对方发m祎 c醝消息:Ng呓i XXXS� d鴑g Thg B秏 B鋙 Ch鈛
	end
	
	return 1
end

--**********************************
--引导心跳处理入口: 
--引导技能会T読 每次心跳结束时调用C醝 n鄖 接口.
--Tr� v�: 1继续下次心跳；0: 中断引导.
--注: 这里喧ng技能生效m祎 次to� 鸬 入口
--**********************************
function x335136_OnActivateEachTick( sceneId, selfId)
	return 1
end

--**********************************
--信息提示
--**********************************
function x335136_MsgBox( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
