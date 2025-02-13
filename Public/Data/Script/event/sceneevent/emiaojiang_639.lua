-- 勇闯寒玉塔
-- 212115

--MisDescBegin
--脚本号
x212115_g_ScriptId = 212115

--任务号
x212115_g_MissionId = 639
--前续任务号
x212115_g_PreMissionId = 638

--任务归类
x212115_g_MissionKind = 40

--衅ng c nhi甿 v� 
x212115_g_MissionLevel = 98

--喧ng否喧ngTinh英任务
x212115_g_IfMissionElite = 0

--下面几项喧ng动态显示to� 鸬 内容,用于T読 任务列表中动态显示任务情况**********************
--任务喧ng否已经完成
x212115_g_IsMissionOkFail = 0		--变量to� 鸬 第0位

--以上喧ng动态**************************************************************

--任务C  餴琺到to� 鸬 物品
--x212115_g_DemandItem={{id=40002112,num=1}}		--变量第1位

--任务文本描述
x212115_g_MissionName="D鹡g c鋗 x鬾g v鄌 H鄋 Ng鱟 Th醦"
x212115_g_MissionInfo="#{Mis_H_Miaojiang_1050003}"
x212115_g_MissionTarget="  H� t痭g A V� #{_INFOAIM182,264,29, A V鹽 t緄 ch鈔 H鄋 Ng鱟 Th醦, t靘 ng叨i tr鬾g th醦 A H礽 Nam #{_INFOAIM92,266,29, A H礽 Nam}. "
x212115_g_MissionComplete="  Kh鬾g sao, ma l馽 c黙 H鄋 Ng鱟 Th醦 v頽h vi璶 kh鬾g nh� c醕 ng呓i t叻ng. H銀 餴 餴, l� ph鄊 nh鈔. C醕 ng呓i kh鬾g th� v鄌 疬㧟 H鄋 Ng鱟 Th醦. #r#r�, k� ph鄊 nh鈔 kia, v鄌 bg c醕h n鄌 th�? Mau ra ngay"

--奖励
x212115_g_MoneyBonus=16000
x212115_g_Exp = 30000
--x212115_g_ItemBonus={{id=10122010,num=1}}

x212115_g_Custom	= { {id="秀 h� t痭g A V�",num=1} }

x212115_g_RadioItemBonus={{id=10413081 ,num=1},{id=10411086,num=1},{id=10412078,num=1}}

--MisDescEnd

-- 场景计时器to� 鸬 Index
x212115_g_ScneneTimerIndex = -1
x212115_g_Step = 0
x212115_g_StartTime = 0
x212115_g_PlayerNum = 0
x212115_g_PlayerId= {0,0,0,0,0,0}

--**********************************
--任务入口函数
--**********************************
function x212115_OnDefaultEvent( sceneId, selfId, targetId )
	
	if GetName(sceneId, targetId) == "Linh h皀 c黙 A V�"  then
		--发送任务Ti猵 th毕允総o� 鸬 信息
		BeginEvent(sceneId)
			AddText(sceneId,"Ta c ph鋓 n骾 ch鷗 g�");
			AddNumText(sceneId, x212115_g_ScriptId, x212115_g_MissionName, 2, 999);
		EndEvent(sceneId)
		DispatchMissionInfo(sceneId,selfId,targetId,x212115_g_ScriptId,x212115_g_MissionId)
		return
	end
	
	--如果已接此任务
	if IsMissionHaveDone( sceneId, selfId, x212115_g_MissionId ) > 0 then
		return 
	elseif IsHaveMission(sceneId,selfId,x212115_g_MissionId) > 0 then
--		if GetName(sceneId,targetId) == x212115_g_Name then
			--发送交任务前to� 鸬 需求信息
			BeginEvent(sceneId)
				AddText(sceneId,x212115_g_MissionName);
			EndEvent(sceneId)
    		done = x212115_CheckSubmit( sceneId, selfId );
			DispatchMissionDemandInfo(sceneId,selfId,targetId,x212115_g_ScriptId,x212115_g_MissionId,done)
--		end
	--Th鯽 m鉵任务接收条件
	elseif x212115_CheckAccept( sceneId, selfId ) then
	
		--发送任务Ti猵 th毕允総o� 鸬 信息
		BeginEvent(sceneId)
			AddText(sceneId,x212115_g_MissionName);
			AddText(sceneId,x212115_g_MissionInfo);
			AddText(sceneId,"#{M_MUBIAO}");
			AddText(sceneId,x212115_g_MissionTarget);
			AddMoneyBonus( sceneId, x212115_g_MoneyBonus )
			for i, item in x212115_g_RadioItemBonus do
				AddRadioItemBonus( sceneId, item.id, item.num )
			end
		EndEvent(sceneId)
		DispatchMissionInfo(sceneId,selfId,targetId,x212115_g_ScriptId,x212115_g_MissionId)

	end
end

--**********************************
--列举事件
--**********************************
function x212115_OnEventRequest( sceneId, selfId, targetId )
	
	if GetNumText() == 999 then
		-- b 馥u护送to� 鸬 请求
		x212115_g_Step = 3
	end
	
end

--**********************************
--列举事件
--**********************************
function x212115_OnEnumerate( sceneId, selfId, targetId )
	
	if IsMissionHaveDone( sceneId, selfId, x212115_g_MissionId ) > 0 then
		return 

	elseif IsHaveMission(sceneId,selfId,x212115_g_MissionId) > 0 then
		if GetName(sceneId, targetId) == "A H礽 Nam"  then
			AddNumText(sceneId, x212115_g_ScriptId,x212115_g_MissionName, 2, -1)
		end

	--Th鯽 m鉵任务接收条件
	elseif x212115_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x212115_g_MissionName then
			AddNumText(sceneId, x212115_g_ScriptId, x212115_g_MissionName, 1, -1);
		end
	end

end

--**********************************
--检测触发条件
--**********************************
function x212115_CheckAccept( sceneId, selfId )
	--C 60c才能接
	if GetLevel( sceneId, selfId ) < x212115_g_MissionLevel then
		return 0
	end
	
	-- 前续任务
	if IsMissionHaveDone( sceneId, selfId, x212115_g_PreMissionId ) < 1 then
		return 0
	end
	
	return 1
end

--**********************************
--Ti猵 th�
--**********************************
function x212115_OnAccept( sceneId, selfId )

	-- 检测玩家喧ng不喧ng已经完成过C醝 n鄖 任务
	if IsMissionHaveDone(sceneId, selfId, x212115_g_MissionId) > 0   then
		return
	end
	
	if x212115_CheckAccept(sceneId, selfId)  <= 0   then
		return
	end
	
	if x212115_g_Step > 1  then
		BeginEvent(sceneId)
			strText = "#YHi畁 kh鬾g th� nh nhi甿 v� n鄖#W"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	end
	
	-- 如果当前 
	if x212115_g_Step == 0  then
		-- 给玩家先加C醝 n鄖 任务
		local ret = AddMission( sceneId,selfId, x212115_g_MissionId, x212115_g_ScriptId, 0, 0, 0 )
		-- C 考虑玩家喧ng不喧ng能够Ti猵 th紺醝 n鄖 任务
		if ret <= 0      then
			Msg2Player(  sceneId, selfId,"#YNh k� nhi甿 v� c黙 c醕 h� 疸 馥y" , MSG2PLAYER_PARA )
			return
		end
		-- 消息通知客户端
		Msg2Player(  sceneId, selfId,"#YTi猵 nh#W ".. x212115_g_MissionName, MSG2PLAYER_PARA )
	
		BeginEvent(sceneId)
			strText = "#YTi猵 nh#W ".. x212115_g_MissionName
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		
		-- M� ra 护送剧情  213
		-- 检测场景中喧ng不喧ng有C醝 n鄖 人物了
		local nMonsterNum = GetMonsterCount(sceneId)
		local ii = 0
		local bHaveMonster = 0
		for ii=0, nMonsterNum-1 do
			local nMonsterId = GetMonsterObjID(sceneId,ii)
			if GetName(sceneId, nMonsterId)  == "Linh h皀 c黙 A V�"  then
				bHaveMonster = 1
			end
		end
		
		-- 有C醝 n鄖 人了,不能T読 现T読 去创建脚本
		if bHaveMonster == 0   then
			local nNpcId = LuaFnCreateMonster(sceneId, 213, 185, 263, 6, 0, 212115)
			SetCharacterName(sceneId, nNpcId, "Linh h皀 c黙 A V�")
			
			-- 设置小时时间喧ng10 ph鷗
			SetCharacterDieTime(sceneId, nNpcId, 600000)
		end
		
		-- 把C醝 n鄖 玩家加到护送玩家列表中
		x212115_g_PlayerNum = 1
		x212115_g_PlayerId[1] = selfId

		-- 启动m祎 c醝场景计时器
		x212115_g_ScneneTimerIndex = SetTimer(sceneId, selfId, 212115, "OnScneneTimer", 1)
		
		x212115_g_Step = 1
		
		--当前时间
		x212115_g_StartTime = LuaFnGetCurrentTime()
	end
	
	-- 加入到C醝 n鄖 护送to� 鸬 玩家
	if x212115_g_Step == 2  then
		if x212115_g_PlayerNum > 5  then
			--人满了
			return
		end
		
		-- 给玩家先加C醝 n鄖 任务
		local ret = AddMission( sceneId,selfId, x212115_g_MissionId, x212115_g_ScriptId, 0, 0, 0 )
		-- C 考虑玩家喧ng不喧ng能够Ti猵 th紺醝 n鄖 任务
		if ret <= 0      then
			Msg2Player(  sceneId, selfId,"#YNh k� nhi甿 v� c黙 c醕 h� 疸 馥y" , MSG2PLAYER_PARA )
			return
		end
		-- 消息通知客户端
		Msg2Player(  sceneId, selfId,"#YTi猵 nh#W ".. x212115_g_MissionName, MSG2PLAYER_PARA )
		
		x212115_g_PlayerNum = x212115_g_PlayerNum + 1
		x212115_g_PlayerId[x212115_g_PlayerNum] = selfId

		BeginEvent(sceneId)
			strText = "#YTi猵 nh#W ".. x212115_g_MissionName
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	end
	
end

--**********************************
--场景计时器
--**********************************
function x212115_OnScneneTimer(sceneId, selfId)

	local bHavePlayer = 0
	if LuaFnIsCanDoScriptLogic(sceneId, selfId) == 0   then
		for i=1, x212115_g_PlayerNum  do
			if LuaFnIsCanDoScriptLogic(sceneId, x212115_g_PlayerId[i]) == 1   then
				bHavePlayer = 1
				selfId = x212115_g_PlayerId[i]
				break
			end
		end
		
		if bHavePlayer == 0    then
			-- 计时器停止,清除所有to� 鸬 全局变量
			x212115_CloseTimer(sceneId, x212115_g_ScneneTimerIndex)
		end
	end	
	
	-- 等待5 gi鈟进入2
	if x212115_g_Step == 1   then
		-- 通知自己队伍to� 鸬 其他玩家接C醝 n鄖 任务
		local nMonsterNum = GetMonsterCount(sceneId)
		local jj = 0
		local nAyuId = 0
		local bHaveMonster = 0
		for jj=0, nMonsterNum-1 do
			local nMonsterId = GetMonsterObjID(sceneId,jj)
			if GetName(sceneId, nMonsterId)  == "A V�"  then
				nAyuId = nMonsterId
				bHaveMonster = 1
			end
		end

		local nTeamCount = GetNearTeamCount(sceneId, selfId)
		for i=0, nTeamCount-1 do
			local PlayerId = GetNearTeamMember(sceneId, selfId, i)
			if PlayerId ~= selfId    then
				CallScriptFunction((212115), "OnDefaultEvent", sceneId, PlayerId, nAyuId )
			end
		end
		
		x212115_g_Step = 2
	end
	
	-- b 馥u等待别to� 鸬 玩家来m祎 起做C醝 n鄖 任务
	if x212115_g_Step == 2   then
		if LuaFnGetCurrentTime() - x212115_g_StartTime >= 10   then
			x212115_g_Step = 3
		end
		
	end
	
	-- 有玩家 餴琺击了开始护送
	if x212115_g_Step == 3   then

		local nMonsterNum = GetMonsterCount(sceneId)
		local ii = 0
		local bHaveMonster = 0
		local nAyuId = 0
		for ii=0, nMonsterNum-1 do
			local nMonsterId = GetMonsterObjID(sceneId,ii)
			if GetName(sceneId, nMonsterId)  == "Linh h皀 c黙 A V�"  then
				bHaveMonster = 1
				nAyuId = nMonsterId
			end
		end
		
		if bHaveMonster == 1  then
			SetPatrolId(sceneId, nAyuId, 0)
			x212115_g_Step = 4
		end
		
	end
	
	-- 护送过程
	if x212115_g_Step == 4   then
		local nMonsterNum = GetMonsterCount(sceneId)
		local ii = 0
		local bHaveMonster = 0
		local nAyuId = 0
		for ii=0, nMonsterNum-1   do
			local nMonsterId = GetMonsterObjID(sceneId,ii)
			if GetName(sceneId, nMonsterId)  == "Linh h皀 c黙 A V�"  then
				bHaveMonster = 1
				nAyuId = nMonsterId
			end
		end
		
		if bHaveMonster == 0   then
			-- 关闭计时器
			x212115_CloseTimer(sceneId, x212115_g_ScneneTimerIndex)
			return
		end
		
		-- 检测Ayu 和玩家之间to� 鸬 距离
		local targetX, targetZ = GetWorldPos(sceneId, nAyuId)
		
		-- 检测如果玩家to� 鸬 距离已经离开to� 鸬 场景或者玩家不T読 护送对象10米内,C醝 n鄖 玩家th b読
		for i=1, x212115_g_PlayerNum  do
			if x212115_g_PlayerId[i] ~= 0  then
				if LuaFnIsCanDoScriptLogic(sceneId, x212115_g_PlayerId[i]) == 0   then
					-- 从列表中删除C醝 n鄖 玩家
					x212115_g_PlayerId[i] = 0
					local nPlayerX, nPlayerZ = GetWorldPos(sceneId, x212115_g_PlayerId[i])
					local distance1 = floor(sqrt((targetX-nPlayerX)*(targetX-nPlayerX)+(targetZ-nPlayerZ)*(targetZ-nPlayerZ)))
					
					if distance1 > 10    then
						--提示C醝 n鄖 玩家任务th b読
						BeginEvent(sceneId)
							strText = "#YH� t痭g A V� th b読!#W"
							AddText(sceneId,strText);
						EndEvent(sceneId)
						DispatchMissionTips(sceneId,x212115_g_PlayerId[i])
						
						x212115_g_PlayerId[i] = 0
					end
				end
			end
		end
		
		local x, z = GetLastPatrolPoint(sceneId, 0)
		local distance = floor(sqrt((targetX-x)*(targetX-x)+(targetZ-z)*(targetZ-z)))
		
		-- 到达终 餴琺
		if distance<=1  then

			for i=1, x212115_g_PlayerNum  do
				if x212115_g_PlayerId[i]~=0   then
					-- 检测玩家喧ng不喧ng有C醝 n鄖 任务
					if IsHaveMission(sceneId,x212115_g_PlayerId[i],x212115_g_MissionId) > 0 then
						local misIndex = GetMissionIndexByID(sceneId, x212115_g_PlayerId[i], x212115_g_MissionId)
						SetMissionByIndex(sceneId,x212115_g_PlayerId[i],misIndex,0,1)
						SetMissionByIndex(sceneId,x212115_g_PlayerId[i],misIndex,1,1)
						
						BeginEvent(sceneId)
							strText = "#YH� t痭g A V�: 1/1#W"
							AddText(sceneId,strText);
						EndEvent(sceneId)
						DispatchMissionTips(sceneId,x212115_g_PlayerId[i])
					end
				end
			end
			-- 删除阿雨to� 鸬 模型
			LuaFnDeleteMonster(sceneId, nAyuId)
			x212115_g_Step = 5
			
			-- 关闭计时器
			x212115_CloseTimer(sceneId, x212115_g_ScneneTimerIndex)
		end
	end
	
end

--**********************************
--关闭计时器
--**********************************
function x212115_CloseTimer( sceneId, TimerIndex )
	StopTimer(sceneId, TimerIndex)
	x212115_g_ScneneTimerIndex = -1
	x212115_g_Step = 0
	x212115_g_StartTime = 0
	x212115_g_PlayerNum = 0
	x212115_g_PlayerId[1]= 0
	x212115_g_PlayerId[2]= 0
	x212115_g_PlayerId[3]= 0
	x212115_g_PlayerId[4]= 0
	x212115_g_PlayerId[5]= 0
	x212115_g_PlayerId[6]= 0
end


--**********************************
--放弃
--**********************************
function x212115_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应to� 鸬 任务
	DelMission( sceneId, selfId, x212115_g_MissionId )
end

--**********************************
--已经接了任务再给出to� 鸬 提示
--**********************************
function x212115_OnContinue( sceneId, selfId, targetId )
	--提交任务时to� 鸬 � 餴琺餍畔�
	BeginEvent(sceneId)
		AddText(sceneId,x212115_g_MissionName)
		AddText(sceneId,x212115_g_MissionComplete)
		AddMoneyBonus( sceneId, x212115_g_MoneyBonus )
		for i, item in x212115_g_RadioItemBonus do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
	EndEvent(sceneId)
	DispatchMissionContinueInfo(sceneId,selfId,targetId,x212115_g_ScriptId,x212115_g_MissionId)
end

--**********************************
--检测喧ng否可以提交
--**********************************
function x212115_CheckSubmit( sceneId, selfId )
	--检测条件喧ng看任务中to� 鸬 标记喧ng不喧ng被改为1了
	local misIndex = GetMissionIndexByID(sceneId,selfId,x212115_g_MissionId)			-- 餴琺到任务to� 鸬 序列号
	
	if GetMissionParam(sceneId, selfId, misIndex, 0) > 0  then
		return 1
	end
	return 0
end

--**********************************
--提交(完成)
--**********************************
function x212115_OnSubmit( sceneId, selfId,targetId,selectRadioID )
	-- 安全性检测
	-- 1、检测玩家喧ng不喧ng有C醝 n鄖 任务
	if IsHaveMission(sceneId,selfId,x212115_g_MissionId) <= 0 then
		return
	end
	-- 2、其他检测
	if x212115_CheckSubmit( sceneId, selfId )  <= 0  then
		return
	end
	
	BeginAddItem(sceneId)
		for i, item in x212115_g_RadioItemBonus do
			if item.id == selectRadioID then
				AddItem( sceneId,item.id, item.num )
			end
		end
	local ret = EndAddItem(sceneId,selfId)
	--添加任务奖励
	if ret > 0 then		
		AddExp(sceneId,selfId,x212115_g_Exp)
		AddMoney(sceneId,selfId,x212115_g_MoneyBonus );

		DelMission( sceneId, selfId, x212115_g_MissionId )
		MissionCom( sceneId, selfId, x212115_g_MissionId )
		AddItemListToHuman(sceneId,selfId)

	else
	--任务奖励没有加成功
		BeginEvent(sceneId)
			strText = "Kh鬾g th� Ho鄋 t nhi甿 v�"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x212115_OnKillObject( sceneId, selfId, objdataId ,objId )
	
end

--**********************************
--进入区域事件
--**********************************
function x212115_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x212115_OnItemChanged( sceneId, selfId, itemdataId )
	
end

