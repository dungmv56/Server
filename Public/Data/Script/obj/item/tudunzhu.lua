-- 土遁珠
-- 300056
-- 物品可以使用10次
-- 第m祎 次使用“定位Tr� v� 餴琺”
-- 以后每次使用扣m祎 次,扣完就删除物品,瞬移到Tr� v� 餴琺

x300056_g_scriptId = 300056
x300056_g_ItemId = 30008030


--银票
x300056_g_Yinpiao = 40002000

-- 限制使用传送功能to� 鸬 场景
x300056_g_NoChuangsongScn=
{
	151		-- 监狱
}

-- 限制使用土遁珠定位to� 鸬 场景
x300056_g_UselessScn=
{
	125,	-- 华山
	414	  -- 竞技场	
}


--禁止传送到某些场景to� 鸬 等c限制....
x300056_g_LimitTransScene =
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

x300056_g_Impact_NotTransportList = { 5929 } -- 禁止传送to� 鸬 Impact
x300056_g_TalkInfo_NotTransportList = { "#{GodFire_Info_062}" } -- 禁止传送to� 鸬 Impact提示信息

--**********************************
-- 事件交互入口
--**********************************
function x300056_OnDefaultEvent( sceneId, selfId, nItemIndex )
	
end

function x300056_IsSkillLikeScript( sceneId, selfId )
	return 1	 --C醝 n鄖 脚本C 动作支持
end

function x300056_CancelImpacts( sceneId, selfId )
	return 0	 --不C C醝 n鄖 接口,但要保留空函数,并且始终Tr� v�0.
end

function x300056_OnDeplete( sceneId, selfId )
	return 1
end

--**********************************
-- 
--**********************************
function x300056_OnConditionCheck( sceneId, selfId , idid)

	local	bagId	= LuaFnGetBagIndexOfUsedItem( sceneId, selfId )
	
	-- 判断C醝 n鄖 物品喧ng不喧ng已经定位
	if GetItemTableIndexByIndex(sceneId, selfId, bagId) ~= x300056_g_ItemId  then
		return 0
	end
	
	--检测物品喧ng否加锁
	if LuaFnLockCheck( sceneId, selfId, bagId, 0 ) < 0 then
		return 0
	end

	--检测Impact状态驻留效果
	for i, ImpactId in x300056_g_Impact_NotTransportList do
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, ImpactId) ~= 0 then
			BeginEvent(sceneId)			
				AddText(sceneId, x300056_g_TalkInfo_NotTransportList[i]);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return 0
		end
	end

	-- 1,检测C醝 n鄖 物品喧ng不喧ng有记录to� 鸬 数据了,
	-- C 记录to� 鸬 数据喧ng,使用次数,定位场景Id,已经坐标
	local nUseCount	= GetBagItemParam(sceneId, selfId, bagId, 0, 2)
	local x	= GetBagItemParam(sceneId, selfId, bagId, 4, 2)
	local z	= GetBagItemParam(sceneId, selfId, bagId, 8, 2)

	local nTarSceneId = floor(nUseCount/100)
	local nCount = nUseCount - nTarSceneId*100
	
	if nUseCount==0 and x==0 and z==0  then
		x300056_MsgBox( sceneId, selfId, "械n Th� Ch鈛 c黙 c醕 h� ch遖 h� 鸶nh v�!" )
		return 0
	end

	--检测目标场景喧ng否限制等c....
	for _, tmp in x300056_g_LimitTransScene do
		if ( (tmp[1] == nTarSceneId) and (GetLevel(sceneId, selfId) < tmp[2]) ) then
			local szMsg = format("B鋘 鸢 c c %d tr� l阯 m緄 c� th� ti猲 v鄌", tmp[2])
			x300056_MsgBox( sceneId, selfId, szMsg)
			return 0
		end
	end

	return 1
end

--**********************************
-- 
--**********************************
function x300056_CallMe( sceneId, selfId, nItemIndex, PlayerGuid)	
	
	-- 检测C醝 n鄖 玩家喧ng不喧ng能够使用土遁珠定位
	--判断当前状态喧ng否可使用定位符
	if IsHaveMission( sceneId, selfId, 4021 ) > 0 then
		x300056_MsgBox( sceneId, selfId, "Khu v馽 c醕 h� kh鬾g cho ph閜 di chuy琻, kh鬾g th� s� d鴑g Th� 械n Ch鈛 d竎h chuy琻!" )
		return 0
	end

	--检测玩家身上是不是有“银票”这个东西，有就不能使用这里的功能
	if GetItemCount(sceneId, selfId, x300056_g_Yinpiao) >= 1  then
		x300056_MsgBox(sceneId, selfId, "Khu v馽 c醕 h� kh鬾g cho ph閜 di chuy琻, kh鬾g th� s� d鴑g Th� 械n Ch鈛 d竎h chuy琻!")
		return 0
	end
	
	--检测玩家是不是处于不允许传送的场景，比如监狱
	for _, tmp in x300056_g_NoChuangsongScn do
		if tmp == sceneId then
			x300056_MsgBox( sceneId, selfId, "Trong khu v馽 n鄖 kh鬾g th� s� d鴑g Th� 械n Ch鈛 d竎h chuy琻!" )
			return 0
		end
	end
	
	-- 检测玩家是不是处于摆摊状态，
	if LuaFnIsStalling(sceneId, selfId) == 1  then
		x300056_MsgBox( sceneId, selfId, "Trong tr課g th醝 bu鬾 b醤, kh鬾g th� s� d鴑g Th� 械n Ch鈛 d竎h chuy琻!" )
		return 0
	end
	
	-- 处于组队跟随状态下，不能传送
	if IsTeamFollow(sceneId, selfId) == 1  then
		x300056_MsgBox( sceneId, selfId, "C醕 h� 餫ng trong trang th醝 t� 鸬i theo sau, kh鬾g th� s� d鴑g Th� 械n Ch鈛 d竎h chuy琻!" )
		return 0
	end
	
	-- [ QUFEI 2007-08-23 20:50 UPDATE BugID 23699 ]
	-- 处于使用交通工具状态下，不能传送
	local	inbus = LuaFnGetBusPassengerIDIsInBus(sceneId, selfId)
	-- PrintNum(inbus)
	if inbus == 1 then
		x300056_MsgBox( sceneId, selfId, "Khu v馽 c醕 h� kh鬾g n trong t靚h tr課g s� d鴑g d竎h chuy琻, kh鬾g th� s� d鴑g 鹫o c� d竎h chuy琻!" )
		return 0
	end
	
	--检测Impact状态驻留效果
	for i, ImpactId in x300056_g_Impact_NotTransportList do
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, ImpactId) ~= 0 then
			BeginEvent(sceneId)			
				AddText(sceneId, x300056_g_TalkInfo_NotTransportList[i]);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return 0
		end
	end
	
	-- 看PlayerGuid 喧ng不喧ng队伍中to� 鸬 人,然后再看时间喧ng不喧ng过期,别to� 鸬 也没有什么能检查to� 鸬 了
	local Time = GetMissionData(sceneId,selfId,MD_TDZ_TIME)
	local nTarSceneId = GetMissionData(sceneId,selfId,MD_TDZ_SCENE)
	local x = GetMissionData(sceneId,selfId,MD_TDZ_X)
	local z = GetMissionData(sceneId,selfId,MD_TDZ_Y)
	
	--检测目标场景喧ng否限制等c....
	for _, tmp in x300056_g_LimitTransScene do
		if ( (tmp[1] == nTarSceneId) and (GetLevel(sceneId, selfId) < tmp[2]) ) then
			local szMsg = format("B鋘 鸢 c c %d tr� l阯 m緄 c� th� ti猲 v鄌", tmp[2])
			x300056_MsgBox( sceneId, selfId, szMsg)
			return 0
		end
	end
	
	if LuaFnGetCurrentTime() - Time < 30  then
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, nTarSceneId, x, z)
	end

	SetMissionData(sceneId,selfId,MD_TDZ_TIME,	0)
	SetMissionData(sceneId,selfId,MD_TDZ_SCENE,0)
	SetMissionData(sceneId,selfId,MD_TDZ_X,	0)
	SetMissionData(sceneId,selfId,MD_TDZ_Y,	0)
	
end

--**********************************
-- 玩家自己S� d鴑g v ph 
--**********************************
function x300056_UseItem( sceneId, selfId, nType, nItemIndex )
	
	if GetLevel(sceneId, selfId)<10  then
		x300056_MsgBox( sceneId, selfId, "Kh鬾g 瘘 鹌ng c" )
		return
	end
	
	-- Tr� v问�,定位0,传送1
	if nType == 0  then
		x300056_SetPosition( sceneId, selfId, nItemIndex )
		
	elseif nType == 1  then
		--x300056_PlayerGoto( sceneId, selfId, nItemIndex )
	end
	
end

--**********************************
-- 
--**********************************
function x300056_OnActivateOnce( sceneId, selfId )
	
	local	bagId	= LuaFnGetBagIndexOfUsedItem( sceneId, selfId )
	
	if bagId<0  then
		return
	end
	
	x300056_PlayerGoto( sceneId, selfId, bagId )

	--	-- 新to� 鸬 修改,T読 这里弹出对话框提问玩家喧ng做传送还喧ng定位.=======
	--	local	nItemIndex	= LuaFnGetBagIndexOfUsedItem( sceneId, selfId )
	--
	--	BeginUICommand(sceneId)
	--		UICommand_AddInt(sceneId,x300056_g_scriptId);
	--		UICommand_AddString(sceneId,"UseItem");
	--		UICommand_AddInt(sceneId,nItemIndex);
	--	EndUICommand(sceneId)
	--	DispatchUICommand(sceneId,selfId, 1008)
	
end

--**********************************
-- 
--**********************************
function x300056_MsgBox( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
-- 玩家S� d鴑g v ph  定位
--**********************************
function x300056_SetPosition( sceneId, selfId, nItemIndex )

	if LuaFnGetSceneType( sceneId ) == 1 or LuaFnGetSceneType( sceneId ) == 4 then
		x300056_MsgBox( sceneId, selfId, "Trong th鄋h th� bang h礽 ho ph� b鋘 kh鬾g th� s� d鴑g Th� 械n Ch鈛 鸶nh v�!" )
		return 0
	end
	for _, tmp in x300056_g_UselessScn do
		if tmp == sceneId then
			x300056_MsgBox( sceneId, selfId, "Trong khu v馽 n鄖 kh鬾g th� s� d鴑g Th� 械n Ch鈛 鸶nh v�!" )
			return 0
		end
	end

	-- 0,物品安全性检查
	-- 先检测C醝 n鄖  nItemIndex to� 鸬 物品喧ng不喧ng和当前to� 鸬 对应,
	if GetItemTableIndexByIndex(sceneId, selfId, nItemIndex) ~= x300056_g_ItemId  then
		BeginEvent(sceneId)
			AddText(sceneId,"  Sai s髏 trong tay n鋓")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	--检测物品喧ng否加锁
	if LuaFnLockCheck( sceneId, selfId, nItemIndex, 0 ) < 0 then
		x300056_MsgBox( sceneId, selfId, "V ph n鄖 疸 b� kh骯!" )
		return 0
	end

	-- 1,检测C醝 n鄖 物品喧ng不喧ng有记录to� 鸬 数据了,
	-- C 记录to� 鸬 数据喧ng,使用次数,定位场景Id,已经坐标
	local nUseCount	= GetBagItemParam(sceneId, selfId, nItemIndex, 0, 2)
	local x	= GetBagItemParam(sceneId, selfId, nItemIndex, 4, 2)
	local z	= GetBagItemParam(sceneId, selfId, nItemIndex, 8, 2)

	local nTarSceneId = floor(nUseCount/100)
	local nCount = nUseCount - nTarSceneId*100
	
	if nUseCount==0 and x==0 and z==0  then
		nCount = 10
	end 
	
	-- m祎 c醝新to� 鸬 没有定位过to� 鸬 物品
	-- 记录下当前场景和位置,设置使用次数为10
	local x
	local z
	x,z = GetWorldPos(sceneId, selfId)
	
	SetBagItemParam(sceneId, selfId, nItemIndex, 0, 2, sceneId*100+nCount)
	SetBagItemParam(sceneId, selfId, nItemIndex, 4, 2, floor(x))
	SetBagItemParam(sceneId, selfId, nItemIndex, 8, 2, floor(z))
	LuaFnRefreshItemInfo( sceneId, selfId, nItemIndex )
	
	BeginEvent(sceneId)
		AddText(sceneId,"械n Th� Ch鈛 c黙 c醕 h� 疸 鸶nh v� th鄋h c鬾g.")
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	
end

--**********************************
-- 玩家自己to� 鸬 传送
--**********************************
function x300056_PlayerGoto( sceneId, selfId, nItemIndex )
	
	-- 0,物品安全性检查
	-- 先检测C醝 n鄖  nItemIndex to� 鸬 物品喧ng不喧ng和当前to� 鸬 对应,
	if GetItemTableIndexByIndex(sceneId, selfId, nItemIndex) ~= x300056_g_ItemId  then
		BeginEvent(sceneId)
			AddText(sceneId,"  Sai s髏 trong tay n鋓")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end

	-- 处于组队跟随状态下,不能传送
	if IsTeamFollow(sceneId, selfId) == 1  then
		x300056_MsgBox( sceneId, selfId, "C醕 h� 餫ng trong trang th醝 t� 鸬i theo sau, kh鬾g th� s� d鴑g Th� 械n Ch鈛 d竎h chuy琻!" )
		return 0
	end
	
	--判断当前状态是否可使用定位符
	if IsHaveMission( sceneId, selfId, 4021 ) > 0 then
		x300056_MsgBox( sceneId, selfId, "Khu v馽 c醕 h� kh鬾g cho ph閜 di chuy琻, kh鬾g th� s� d鴑g Th� 械n Ch鈛 d竎h chuy琻!" )
		return 0
	end

	--检测物品是否加锁
	if LuaFnLockCheck( sceneId, selfId, nItemIndex, 0 ) < 0 then
		x300056_MsgBox( sceneId, selfId, "V ph n鄖 疸 b� kh骯!" )
		return 0
	end

	--检测玩家身上是不是有“银票”这个东西，有就不能使用这里的功能
	if GetItemCount(sceneId, selfId, x300056_g_Yinpiao) >= 1  then
		x300056_MsgBox(sceneId, selfId, "Khu v馽 c醕 h� kh鬾g cho ph閜 di chuy琻, kh鬾g th� s� d鴑g Th� 械n Ch鈛 d竎h chuy琻!")
		return 0
	end
	
	--检测玩家是不是处于不允许传送的场景，比如监狱
	for _, tmp in x300056_g_NoChuangsongScn do
		if tmp == sceneId then
			x300056_MsgBox( sceneId, selfId, "Trong khu v馽 n鄖 kh鬾g th� s� d鴑g Th� 械n Ch鈛 d竎h chuy琻!" )
			return 0
		end
	end
	
	-- 检测玩家是不是处于摆摊状态，
	if LuaFnIsStalling(sceneId, selfId) == 1  then
		x300056_MsgBox( sceneId, selfId, "Trong tr課g th醝 bu鬾 b醤, kh鬾g th� s� d鴑g Th� 械n Ch鈛 d竎h chuy琻!" )
		return 0
	end
	
	--检测Impact状态驻留效果
	for i, ImpactId in x300056_g_Impact_NotTransportList do
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, ImpactId) ~= 0 then
			BeginEvent(sceneId)			
				AddText(sceneId, x300056_g_TalkInfo_NotTransportList[i]);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return 0
		end
	end
	
	-- 1,检测C醝 n鄖 物品喧ng不喧ng有记录to� 鸬 数据了,
	-- C 记录to� 鸬 数据喧ng,使用次数,定位场景Id,以及坐标
	local nUseCount	= GetBagItemParam(sceneId, selfId, nItemIndex, 0, 2)
	
	-- 执行传送
	local nTarSceneId = floor(nUseCount/100)
	local nCount = nUseCount - nTarSceneId*100
	local nPointX		= GetBagItemParam(sceneId, selfId, nItemIndex, 4, 2)
	local nPointZ		= GetBagItemParam(sceneId, selfId, nItemIndex, 8, 2)
	
	if nCount==0 and nPointX==0 and nPointZ==0  then
		x300056_MsgBox( sceneId, selfId, "Th� 械n Ch鈛 n鄖 ch遖 h� 鸶nh v� n阯 kh鬾g th� d竎h chuy琻." )
		return
	end
	
	-- 检查目标场景喧ng不喧ng能够到达
	if sceneId ~= nTarSceneId then
		if IsCanNewWorld( sceneId, selfId, nTarSceneId, nPointX, nPointZ ) ~= 1 then
			x300056_MsgBox( sceneId, selfId, "Kh鬾g th� d竎h chuy琻 皙n khu v馽 m鴆 ti陁." )
			return 0
		end
	end
	
	local ret = 0
	if nCount > 1  then
		-- 物品可以继续消耗
		SetBagItemParam( sceneId, selfId, nItemIndex, 0, 2, nTarSceneId*100+(nCount-1) )
		LuaFnRefreshItemInfo( sceneId, selfId, nItemIndex )
		ret = 1
		
	elseif nCount <= 1  then
		-- 删除物品
		ret = EraseItem(sceneId, selfId, nItemIndex)
	end
	
	if ret == 1  then
		--  鹫t 疬㧟玩家队伍中T読 附近to� 鸬 械i vi阯 
		local nTeamCount = GetNearTeamCount(sceneId,selfId)
		local selfGuid = LuaFnGetGUID(sceneId,selfId)
		
		local nTarSceneName = GetSceneName(nTarSceneId)

		if nTeamCount > 0  then
			for i=0, nTeamCount-1  do
				local nPlayerId = GetNearTeamMember(sceneId,selfId, i)
				if nPlayerId ~= selfId  then
					-- 给C醝 n鄖 玩家发送m祎 c醝传送邀请
					local str = "械i h鎢 c黙 c醕 h� " .. GetName(sceneId, selfId) .. " 秀 s� d鴑g Th� 械n Ch鈛, v� [" .. nTarSceneName .. "], c醕 h� ph鋓 ch錸g mu痭 c鵱g d竎h chuy琻? Ch� �: qu� 20 gi鈟 m� kh鬾g quy猼 鸶nh s� h鼀 b� d竎h chuy琻."
					BeginUICommand(sceneId)
						UICommand_AddInt(sceneId,x300056_g_scriptId);
						UICommand_AddInt(sceneId,nItemIndex)
						UICommand_AddInt(sceneId,selfGuid)
						UICommand_AddString(sceneId,"CallMe");
						UICommand_AddString(sceneId,str);
					EndUICommand(sceneId)
					DispatchUICommand(sceneId,nPlayerId, 1009)
					
					-- 同时把这些重要数据记录到MissionData中
					SetMissionData(sceneId,nPlayerId,MD_TDZ_TIME,LuaFnGetCurrentTime())
					SetMissionData(sceneId,nPlayerId,MD_TDZ_SCENE,nTarSceneId)
					SetMissionData(sceneId,nPlayerId,MD_TDZ_X,nPointX)
					SetMissionData(sceneId,nPlayerId,MD_TDZ_Y,nPointZ)
				end
			end
		end
		
		-- 传送自己
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, nTarSceneId, nPointX, nPointZ)
	end

end
