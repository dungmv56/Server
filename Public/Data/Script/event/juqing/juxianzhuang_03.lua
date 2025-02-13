-- 聚贤庄之 L誧 D呓ng场景护送,重 餴琺部分哦
-- 触发条件,Ho鄋 t nhi甿 v�21,然后进入L誧 D呓ngto� 鸬 事件区域

--MisDescBegin
--脚本号
x200022_g_ScriptId = 200022

--任务号
x200022_g_MissionId = 22

--前续任务号
x200022_g_PreMissionId = 47

--目标NPC
x200022_g_Name	="Ki玼 Phong"
x200022_g_Name1 ="T� Kinh L鬷"

--任务归类
x200022_g_MissionKind = 47

--衅ng c nhi甿 v� 
x200022_g_MissionLevel = 40

--喧ng否喧ngTinh英任务
x200022_g_IfMissionElite = 0

--任务名
x200022_g_MissionName="D� v課 ng叨i, ta v鏽 c� ti猲"
--任务描述
x200022_g_MissionInfo="#{Mis_juqing_0022}"
--M鴆 ti陁 nhi甿 v�
x200022_g_MissionTarget="#{Mis_juqing_Tar_0022}"		
--提交时npcto� 鸬 话
x200022_g_MissionComplete="  Ki玼 Phong th l�...l� n鄌 huynh ta ch� v� m祎 c� n呓ng, d醡 qu阯 c� t韓h m課g m靚h? Kh鬾g kh閛 gi� 疴y T� Hi玭 Trang 疸 鹫i lo課 m.."		

x200022_g_MoneyBonus=9000
x200022_g_exp=9600

x200022_g_RadioItemBonus={{id=10423008 ,num=1},{id=10423009,num=1},{id=10423010,num=1},{id=10423011,num=1}}

x200022_g_Custom	= {{id="D� v課 ng叨i, ta v鏽 c� ti猲",num=1}}

--MisDescEnd

-- 队伍Id
x200022_g_GroupId = 0

-- 护送路线Id
x200022_g_PatrolPathIndex = 4

-- 场景计时器Index
x200022_g_SceneTimerIndex = -1
x200022_g_Step = 0
x200022_g_StartTime = 0
x200022_g_PlayerNum = 0
x200022_g_PlayerId= {-1,-1,-1,-1,-1,-1}

function x200022_DisplayBonus(sceneId, missionIndex)
	
end

--**********************************
--任务入口函数
--**********************************
function x200022_OnDefaultEvent( sceneId, selfId, targetId, missionIndex )	-- 餴琺击该任务后执行此脚本

	--如果玩家完成过C醝 n鄖 任务
	if (IsMissionHaveDone(sceneId,selfId,x200022_g_MissionId) > 0 ) then
		return
	elseif( IsHaveMission(sceneId,selfId,x200022_g_MissionId) > 0)  then
		if GetName(sceneId, targetId) == x200022_g_Name1   then
			x200022_OnContinue( sceneId, selfId, targetId )
		end
	
	--Th鯽 m鉵任务接收条件
	elseif x200022_CheckAccept(sceneId,selfId) > 0 then
		-- 判断喧ngT読 副本,
		if GetName(sceneId, targetId) == x200022_g_Name   then
			--发送任务Ti猵 th毕允総o� 鸬 信息
			BeginEvent(sceneId)
				AddText(sceneId,x200022_g_MissionName)
				AddText(sceneId,x200022_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}#r")
				AddText(sceneId,x200022_g_MissionTarget)
				AddText(sceneId,"#{M_SHOUHUO}#r")
				for i, item in x200022_g_RadioItemBonus do
					AddRadioItemBonus( sceneId, item.id, item.num )
				end
				AddMoneyBonus( sceneId, x200022_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x200022_g_ScriptId,x200022_g_MissionId)
		end
	end

end

function x200022_OnMissionRefuse()
end

--**********************************
--事件列表选中m祎 项
--**********************************
function x200022_OnEventRequest( sceneId, selfId, targetId, eventId )
	
	if GetName(sceneId, targetId) == x200022_g_Name   then
		if GetNumText() == 0    then
			BeginEvent(sceneId)
				AddText(sceneId,x200022_g_MissionName)
				AddText(sceneId,x200022_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}#r")
				AddText(sceneId,x200022_g_MissionTarget)
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x200022_g_ScriptId,x200022_g_MissionId)
		end
	end
	
end

--**********************************
--列举事件
--**********************************
function x200022_OnEnumerate( sceneId, selfId, targetId )
	--如果玩家完成过C醝 n鄖 任务
	if IsMissionHaveDone(sceneId,selfId,x200022_g_MissionId) > 0 then
		return 
	--如果已接此任务
	elseif IsHaveMission(sceneId,selfId,x200022_g_MissionId) > 0 then
		if GetName(sceneId, targetId) == x200022_g_Name1   then
			AddNumText(sceneId, x200022_g_ScriptId,x200022_g_MissionName,2,-1);
		end
	--Th鯽 m鉵任务接收条件
	elseif x200022_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId, targetId) == x200022_g_Name    then
			AddNumText(sceneId,x200022_g_ScriptId,x200022_g_MissionName,1,-1);
		end
	end

end

--**********************************
-- 
--**********************************
function x200022_OnLockedTarget( sceneId, selfId, targetId, missionIndex )

end

--**********************************
--检测Ti猵 th跫�
--**********************************
function x200022_CheckAccept( sceneId, selfId )
	-- 接任务to� 鸬 条件喧ng,人物达到20c以上,并且完成了前续任务
	if GetLevel(sceneId, selfId) < 40   then
		return 0
	end
	
	if IsMissionHaveDone(sceneId, selfId, x200022_g_PreMissionId ) < 1   then
		return 0
	end
	
	return 1
end

--**********************************
--Ti猵 th�
--**********************************
function x200022_OnAccept( sceneId, selfId, targetId )

	-- 检测玩家喧ng不喧ng已经完成过C醝 n鄖 任务
	if IsMissionHaveDone(sceneId, selfId, x200022_g_MissionId) > 0   then
		return
	end
	
	if x200022_CheckAccept(sceneId, selfId)  < 1   then
		return
	end

	if x200022_g_Step ~= 0  and x200022_g_Step ~= 2   then
		BeginEvent(sceneId)
			AddText(sceneId, "M鴆 ti陁 餫ng b, xin 瘙i")
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		return
	end
	
	-- 这里to� 鸬 护送C 启动场景to� 鸬 计时器,不能使用任务计时器
	if x200022_g_Step == 0   then
		local ret = AddMission( sceneId,selfId, x200022_g_MissionId, x200022_g_ScriptId, 0, 0, 0 )
		if ret <= 0 then
			Msg2Player(  sceneId, selfId,"#YNh k� nhi甿 v� c黙 c醕 h� 疸 馥y" , MSG2PLAYER_PARA )
			return
		end
		
		-- C醝 n鄖 场景计时器,应该喧ngm祎 直被C醝 n鄖 活动占用to� 鸬 ,所以,只要C醝 n鄖 值不等于-1,就不要再尚鷑g�
		if x200022_g_SceneTimerIndex == -1  then
			x200022_g_SceneTimerIndex = SetTimer(sceneId, selfId, x200022_g_ScriptId, "OnSceneTimer", 1)
		end
		
		x200022_g_StartTime = LuaFnGetCurrentTime()
		x200022_g_Step = 1
		
		x200022_g_PlayerId[1] = selfId
		x200022_g_PlayerNum = 1
		
		Msg2Player(  sceneId, selfId,"#YNh nhi甿 v�#W: D� v課 ng叨i, ta v鏽 c� ti猲",MSG2PLAYER_PARA )
	end
	
	if x200022_g_Step == 2   then
		-- 把C醝 n鄖 玩家加到护送列表中去
		if x200022_g_PlayerNum >= 6   then
			-- 本次参加护送to� 鸬 人数满了,不能再＋你
			Msg2Player(  sceneId, selfId,"#Yng叨i tham gia l h� t痭g n鄖 疸 馥y, xin ch� l sau" , MSG2PLAYER_PARA )
			return
		end
		
		local ret = AddMission( sceneId,selfId, x200022_g_MissionId, x200022_g_ScriptId, 0, 0, 0 )
		if ret <= 0 then
			Msg2Player(  sceneId, selfId,"#YNh k� nhi甿 v� c黙 c醕 h� 疸 馥y" , MSG2PLAYER_PARA )
			return
		end
		
		x200022_g_PlayerNum = x200022_g_PlayerNum + 1
		x200022_g_PlayerId[x200022_g_PlayerNum] = selfId
		Msg2Player(  sceneId, selfId,"#YNh nhi甿 v�#W: D� v課 ng叨i, ta v鏽 c� ti猲",MSG2PLAYER_PARA )
	end
	
end

--**********************************
--场景Timer
--**********************************
function x200022_OnSceneTimer( sceneId, selfId )
	--PrintNum(x200022_g_Step)

	if x200022_g_Step < 3  then
		local nSelfId = -1
		local bHavePlayer = 0
	--	if LuaFnIsObjValid(sceneId, nSelfId)==1  and
	--		 LuaFnIsCanDoScriptLogic(sceneId, nSelfId) == 0   then
			for i=1, x200022_g_PlayerNum  do	
				if x200022_g_PlayerId[i] ~= -1  then
					if LuaFnIsObjValid(sceneId, x200022_g_PlayerId[i])==1  and
						 LuaFnIsCanDoScriptLogic(sceneId, x200022_g_PlayerId[i]) == 1   then
						bHavePlayer = 1
						nSelfId = x200022_g_PlayerId[i]
						
						break
					end
				end
			end
	--	else
	--		bHavePlayer = 1
	--	end
		
		if bHavePlayer == 0   then
			-- 计时器停止,清除所有to� 鸬 全局变量
			x200022_g_Step = 0
			x200022_g_StartTime = 0
			x200022_g_PlayerId[1] = -1
			x200022_g_PlayerId[2] = -1
			x200022_g_PlayerId[3] = -1
			x200022_g_PlayerId[4] = -1
			x200022_g_PlayerId[5] = -1
			x200022_g_PlayerId[6] = -1
			x200022_g_PlayerNum = 0
			x200022_g_StartTime = 0
			
			return
		end
		--end
	end
	
	-- 检测只要Ki玼 Phong和阿珠中to� 鸬 任何m祎 c醝人不T読 场景中了,就清空所有to� 鸬 全局变量
	local nNpcNum = GetMonsterCount(sceneId)
	local kk = 0
	local bHaveQiao = 0
	for kk = 0, nNpcNum-1 do
		local nNpcId = GetMonsterObjID(sceneId,kk)
		if GetName(sceneId, nNpcId)  == "Ki玼 Phong"  then
			bHaveQiao = 1+bHaveQiao
		end
		
		if GetName(sceneId, nNpcId)  == "A Ch鈛"  then
			bHaveQiao = 1+bHaveQiao
		end
	end
	
	if 	bHaveQiao ~= 2   then
		--StopTimer(sceneId, x200022_g_SceneTimerIndex)
		--x200022_g_SceneTimerIndex = -1
		x200022_g_Step = 0
		x200022_g_StartTime = 0
		x200022_g_PlayerId[1] = -1
		x200022_g_PlayerId[2] = -1
		x200022_g_PlayerId[3] = -1
		x200022_g_PlayerId[4] = -1
		x200022_g_PlayerId[5] = -1
		x200022_g_PlayerId[6] = -1
		x200022_g_PlayerNum = 0
		x200022_g_StartTime = 0
		
		return
	end
	
	
	if x200022_g_Step == 1   then
		-- 给小队to� 鸬 所有玩家发送m祎 起护送to� 鸬 邀请
		--local groupId = AllocateMonsterGroup(sceneId)
		local nMonsterNum = GetMonsterCount(sceneId)
		local jj = 0
		local nQiaofenId = 0
		local bHaveMonster = 0
		for jj=0, nMonsterNum-1 do
			local nMonsterId = GetMonsterObjID(sceneId,jj)
			if GetName(sceneId, nMonsterId)  == "Ki玼 Phong"  then
				nQiaofenId = nMonsterId
				bHaveMonster = 1
			end
		end
		
		for i=1, x200022_g_PlayerNum  do	
			if x200022_g_PlayerId[i] ~= -1  then
				if LuaFnIsObjValid(sceneId, x200022_g_PlayerId[i])==1  and
					 LuaFnIsCanDoScriptLogic(sceneId, x200022_g_PlayerId[i]) == 1   then
					bHavePlayer = 1
					nSelfId = x200022_g_PlayerId[i]
					
					break
				end
			end
		end
--		PrintNum(nSelfId)
--		PrintNum(x200022_g_PlayerNum)
		local nTeamCount = GetNearTeamCount(sceneId, nSelfId)
		for i=0, nTeamCount-1 do
			local PlayerId = GetNearTeamMember(sceneId, nSelfId, i)
			if PlayerId ~= nSelfId    then
				CallScriptFunction((200022), "OnDefaultEvent", sceneId, PlayerId, nQiaofenId )
			end
		end
		
		-- 记下C醝 n鄖 接了任务to� 鸬 玩家
		--x200022_g_PlayerNum = 1
		--x200022_g_PlayerId[1]= nSelfId
		x200022_g_StartTime = LuaFnGetCurrentTime()
		
		x200022_g_Step = 2

		CallScriptFunction((200060), "Paopao",sceneId, "Ki玼 Phong", "L誧 D呓ng", "#{juqing_start_007}")
		
	elseif x200022_g_Step == 2   then
		-- 等待5 gi鈟,C醝 n鄖 时间喧ng等待别to� 鸬 玩家m祎 起进行C醝 n鄖 护送to� 鸬 时间
		if LuaFnGetCurrentTime() - x200022_g_StartTime > 5   then
			CallScriptFunction((200060), "Paopao",sceneId, "Ki玼 Phong", "L誧 D呓ng", "#{juqing_start_008}")
			x200022_g_Step = 3
			return
		end
		
	elseif x200022_g_Step == 3   then
		CallScriptFunction((200060), "Paopao",sceneId, "Ki玼 Phong", "L誧 D呓ng", "#{juqing_start_009}")
		
		-- 尚鷑g雖祎 c醝巡逻组,开始走
		--local groupId = AllocateMonsterGroup(sceneId)

		-- 原来喧ng用to� 鸬 喧ng尚鷑g雖祎 c醝新to� 鸬 巡逻组,现T読 使用m祎 c醝固定to� 鸬 巡逻组来完成
		-- T読 b 馥uC醝 n鄖 群体护送前,现清空m祎 下C醝 n鄖 组
		ReleaseMonsterGroup(sceneId, x200022_g_GroupId)
		local nMonsterNum = GetMonsterCount(sceneId)
		local jj = 0
		local nHaveMonster = 0
		local nQiaofenId = 0
		for jj=0, nMonsterNum-1 do
			local nMonsterId = GetMonsterObjID(sceneId,jj)
			if GetName(sceneId, nMonsterId)  == "A Ch鈛"  then
				AddGroupMember(sceneId, x200022_g_GroupId, nMonsterId, 2, 1)
				SetConvoyNPC(sceneId, nMonsterId, 1)
				nHaveMonster = nHaveMonster + 1
			end
			if GetName(sceneId, nMonsterId)  == "Ki玼 Phong"  then
				AddGroupLeader(sceneId, x200022_g_GroupId, nMonsterId)
				nQiaofenId = nMonsterId
				nHaveMonster = nHaveMonster + 1
			end
		end
		SetIntervalDistOfGroupMember(sceneId, x200022_g_GroupId, 1)
		
		RefixPosOfGroupMember(sceneId,x200022_g_GroupId,nQiaofenId)
		-- 餴琺到护送巡逻路线
		SetPatrolId(sceneId, nQiaofenId, x200022_g_PatrolPathIndex)
		
		x200022_g_Step = 4
		
	elseif x200022_g_Step == 4   then
	
		-- 计时器每次检测玩家喧ng不喧ng有任务th b読to� 鸬 情况出现,
		for i=1, x200022_g_PlayerNum  do
			-- 如果玩家离开了场景,就任务th b読
			if x200022_g_PlayerId[i] ~= -1   then
				if LuaFnIsObjValid(sceneId, x200022_g_PlayerId[i])==0  or
					 LuaFnIsCanDoScriptLogic(sceneId, x200022_g_PlayerId[i]) == 0  then
					x200022_g_PlayerId[i] = -1
				end	
			end
		end
		
		-- T読 这里添加L誧 D呓ng居民to� 鸬 泡泡,增加气氛
		
		
		-- 检测护送to� 鸬 完成条件,Ki玼 Phong 走到了目标 餴琺
		local nMonsterNum = GetMonsterCount(sceneId)
		local jj = 0
		local bHaveMonster = 0
		for jj=0, nMonsterNum-1 do
			local nMonsterId = GetMonsterObjID(sceneId,jj)
			if GetName(sceneId, nMonsterId)  == "Ki玼 Phong"  then
				-- 判断Ki玼 Phong喧ng不喧ng走到了
				local targetX, targetZ = GetWorldPos(sceneId, nMonsterId)
				local x, z = GetLastPatrolPoint(sceneId, x200022_g_PatrolPathIndex)
				local distance = floor(sqrt((targetX-x)*(targetX-x)+(targetZ-z)*(targetZ-z)))
				
				if distance<=2   then
					x200022_g_Step = 5
					-- 通知所有人,护送成功
					for i=1, x200022_g_PlayerNum   do
						if x200022_g_PlayerId[i]~=-1   then
							local misIndex = GetMissionIndexByID(sceneId, x200022_g_PlayerId[i], x200022_g_MissionId)-- 餴琺到任务T読 20c醝任务中to� 鸬 序列号
							SetMissionByIndex(sceneId, x200022_g_PlayerId[i], misIndex, 0, 1)
							BeginEvent(sceneId)
								AddText(sceneId, "H� t痭g Ki玼 Phong th鄋h c鬾g")
							EndEvent()
							DispatchMissionTips(sceneId, x200022_g_PlayerId[i])
						end
					end
				end
			end
		end
		
	elseif x200022_g_Step == 5  then
		--喊话剧情
		CallScriptFunction((200060), "Paopao",sceneId, "T� Kinh L鬷", "L誧 D呓ng", "#{JQ_PaoPao_79}") 
		x200022_g_Step = 6
		x200022_g_StartTime = LuaFnGetCurrentTime()
		
	elseif x200022_g_Step == 6  then
		if LuaFnGetCurrentTime()-x200022_g_StartTime > 3   then
			CallScriptFunction((200060), "Paopao",sceneId, "Ki玼 Phong", "L誧 D呓ng", "#{JQ_PaoPao_80}")
			x200022_g_Step = 7
			x200022_g_StartTime = LuaFnGetCurrentTime()
		end
		
	elseif x200022_g_Step == 7  then
		if LuaFnGetCurrentTime()-x200022_g_StartTime > 3   then
			CallScriptFunction((200060), "Paopao",sceneId, "T� Kinh L鬷", "L誧 D呓ng", "#{JQ_PaoPao_81}")
			x200022_g_Step = 8
			x200022_g_StartTime = LuaFnGetCurrentTime()
		end
		
	elseif x200022_g_Step == 8  then
		if LuaFnGetCurrentTime()-x200022_g_StartTime > 5   then
		
			-- 计时器停止,清除所有to� 鸬 全局变量
			--StopTimer(sceneId, x200022_g_SceneTimerIndex)
			
			--x200022_g_SceneTimerIndex = -1
			x200022_g_Step = 0
			x200022_g_StartTime = 0
			x200022_g_PlayerId[1] = -1
			x200022_g_PlayerId[2] = -1
			x200022_g_PlayerId[3] = -1
			x200022_g_PlayerId[4] = -1
			x200022_g_PlayerId[5] = -1
			x200022_g_PlayerId[6] = -1
			x200022_g_PlayerNum = 0
			x200022_g_StartTime = 0
			
			--删除Ki玼 Phong和A Ch鈛
		  local nMonsterNum = GetMonsterCount(sceneId)
			local ii = 0
			local bHaveMonster = 0
			for ii=0, nMonsterNum-1 do
				local nMonsterId = GetMonsterObjID(sceneId,ii)
				if GetName(sceneId, nMonsterId)  == "Ki玼 Phong"  then
					LuaFnDeleteMonster(sceneId, nMonsterId)
				end
				
				if GetName(sceneId, nMonsterId)  == "A Ch鈛"  then
					LuaFnDeleteMonster(sceneId, nMonsterId)
				end
			end
		end	
	end
	
end

--**********************************
--放弃
--**********************************
function x200022_OnAbandon( sceneId, selfId )
  --将护送npc瞬移回原来位置
  DelMission(sceneId, selfId, x200022_g_MissionId)
  
end

--**********************************
--继续
--**********************************
function x200022_OnContinue( sceneId, selfId, targetId )

	BeginEvent(sceneId)
		AddText(sceneId,x200022_g_Name)
		AddText(sceneId,x200022_g_MissionComplete)
		AddText(sceneId,"#{M_MUBIAO}#r")
		AddText(sceneId,x200022_g_MissionTarget)
		AddText(sceneId,"#{M_SHOUHUO}#r")
		AddMoneyBonus( sceneId, x200022_g_MoneyBonus )
		for i, item in x200022_g_RadioItemBonus do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
	EndEvent( )
	
	DispatchMissionContinueInfo(sceneId, selfId, targetId, x200022_g_ScriptId, x200022_g_MissionId)

end

--**********************************
--检测喧ng否可以提交
--**********************************
function x200022_CheckSubmit( sceneId, selfId )
	local misIndex = GetMissionIndexByID(sceneId, selfId, x200022_g_MissionId)-- 餴琺到任务T読 20c醝任务中to� 鸬 序列号
	local bComplete = GetMissionParam(sceneId, selfId, misIndex, 0)	
	if bComplete == 1 then
		return 1
	else
		return 0
	end
end

--**********************************
--提交
--**********************************
function x200022_OnSubmit( sceneId, selfId, targetId, selectRadioId, missionIndex )
	-- 检测喧ng不喧ngTh鯽 m鉵Ho鄋 t nhi甿 v鴗o� 鸬 条件
	if x200022_CheckSubmit(sceneId, selfId) ~= 1 then 
		return
	end
	BeginAddItem(sceneId)
	for i, item in x200022_g_RadioItemBonus do
		if item.id == selectRadioId then
			AddItem( sceneId,item.id, item.num )
		end
	end
	ret = EndAddItem(sceneId,selfId)
	--添加任务奖励
	if ret < 1 then
		--任务奖励没有加成功
		BeginEvent(sceneId)
			strText = "Kh鬾g th� Ho鄋 t nhi甿 v�"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	AddItemListToHuman(sceneId,selfId)

	AddMoney(sceneId,selfId,x200022_g_MoneyBonus );
	LuaFnAddExp( sceneId, selfId,x200022_g_exp)
	
	DelMission( sceneId,selfId, x200022_g_MissionId )
	--设置任务已经被完成过
	MissionCom( sceneId,selfId, x200022_g_MissionId )
	Msg2Player(  sceneId, selfId,"#YHo鄋 t nhi甿 v�#W: D� v課 ng叨i, ta v鏽 c� ti猲",MSG2PLAYER_PARA )

end

function x200022_OnHumanDie(sceneId, selfId)

end

--**********************************
--定时事件
--**********************************
function x200022_OnTimer(sceneId,selfId)--,missionIndex)
	
end


