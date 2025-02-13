-- 副本任务
-- 就地正法

--************************************************************************
--MisDescBegin

--脚本号
x228903_g_ScriptId = 228903

--任务号
x228903_g_MissionId = 947

-- 前续任务
x228903_g_PreMissionId = 946

-- 目标 NPC
x228903_g_Position_X = 262
x228903_g_Position_Z = 46
x228903_g_SceneID = 18
x228903_g_AccomplishNPC_Name = "Ch黱g Th� Ho鄋h"

--目标NPC
x228903_g_Name = "V呓ng Thi玼"

--衅ng c nhi甿 v� 
x228903_g_MissionLevel = 30

--任务归类
x228903_g_MissionKind = 28

--喧ng否喧ngTinh英任务
x228903_g_IfMissionElite = 0

--********下面几项喧ng动态显示to� 鸬 内容,用于T読 任务列表中动态显示任务情况******
--角色Mission变量� 餴琺�
x228903_g_IsMissionOkFail			=0	--0 任务完成标记
x228903_g_DemandKill				= { { id = 540, num = 1 }, { id = 541, num = 4 } }		--变量第1位
x228903_g_Param_QinNumber			=1	--1 C 杀死秦伯光数量
x228903_g_Param_LubaNumber			=2	--2 C 消灭to� 鸬 秦家寨路霸数量
x228903_g_MonsterList				= { [x228903_g_Param_QinNumber] = { "T B� Quang", 1 }, [x228903_g_Param_LubaNumber] = { "T gia tr読 l� b�", 4 } }
x228903_g_Param_sceneid				=3	--3号: 当前副本任务to� 鸬 场景号
x228903_g_Param_teamid				=4	--4号: 接副本任务时候to� 鸬 队伍号

--**********************************以上喧ng动态****************************

--任务文本描述
x228903_g_MissionName = "l t裞 th� l�"
x228903_g_MissionInfo = "#{TIANSHAN_SKILL_03}"													--任务描述
x228903_g_MissionTarget = "    #GNh課 M鬾 Quan#W#R Ch黱g Th� Ho鄋h #W#{_INFOAIM263,46,18, Ch黱g Th� Ho鄋h} mu痭 c醕 h� � ph� Th醝 Th� Nh課 M鬾 Quan gi猼 ch猼 T B� Quang v� 4 t阯 T Gia Tr読 L� B�."		--M鴆 ti陁 nhi甿 v�
x228903_g_ContinueInfo = "#{TIANSHAN_SKILL_04}"								--未Ho鄋 t nhi甿 v鴗o� 鸬 npc对话
x228903_g_MissionComplete = "#{TIANSHAN_SKILL_05}"							--Ho鄋 t nhi甿 v鴑pc说话to� 鸬 话

--任务奖励
x228903_g_MoneyBonus = 1000
x228903_g_exp = 2000

--MisDescEnd
--************************************************************************

x228903_g_TransScript = 400900

--副本名称
x228903_g_CopySceneName = "Ph� Th醝 Th� Nh課 M鬾 Quan"

x228903_g_CopySceneType = FUBEN_YMGTAISHOUFU	--副本类型,定义T読 ScriptGlobal.lua里面

x228903_g_CopySceneMap = "yamen.nav"
x228903_g_Monster = "yamentianshanmis_monster.ini"
x228903_g_Exit = "yamentianshanmis_area.ini"
x228903_g_LimitMembers = 3				--可以进副本to� 鸬 最小队伍人数
x228903_g_TickTime = 5					--回调脚本to� 鸬 时钟时间(单位:  gi鈟/次)
x228903_g_CloseTick = 3					--副本关闭前倒计时(单位: 次数)
x228903_g_NoUserTime = 10				--副本中没有人后可以继续保存to� 鸬 时间(单位:  gi鈟)
x228903_g_Fuben_X = 32					--进入副本to� 鸬 位置X
x228903_g_Fuben_Z = 48					--进入副本to� 鸬 位置Z
x228903_g_Back_X = 259					--源场景位置X
x228903_g_Back_Z = 49					--源场景位置Z

--**********************************
--任务入口函数
--**********************************
function x228903_OnDefaultEvent( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x228903_g_Name then		--判断该npc喧ng否喧ng对应任务to� 鸬 npc
		return
	end

	--如果已接此任务
	if IsHaveMission( sceneId, selfId, x228903_g_MissionId ) > 0 then
		local bDone = x228903_CheckSubmit( sceneId, selfId )

		if bDone == 0 then												--任务未完成
			if GetNumText() == 1 then
				x228903_AcceptEnterCopyScene( sceneId, selfId )
			else
				BeginEvent( sceneId )
					AddText( sceneId, x228903_g_MissionName )
					x228903_AskEnterCopyScene( sceneId, selfId )
				EndEvent( )
				DispatchEventList( sceneId, selfId, targetId )
			end
		elseif bDone == 1 then											--任务已经完成
			BeginEvent( sceneId )
				AddText( sceneId, x228903_g_MissionName )
				AddText( sceneId, x228903_g_ContinueInfo )
			EndEvent( )
			DispatchMissionDemandInfo( sceneId, selfId, targetId, x228903_g_ScriptId, x228903_g_MissionId, bDone )
		end
	--Th鯽 m鉵任务接收条件
	elseif x228903_CheckAccept( sceneId, selfId ) > 0 then
		--发送任务Ti猵 th毕允総o� 鸬 信息
		BeginEvent( sceneId )
			AddText( sceneId, x228903_g_MissionName )
			AddText( sceneId, x228903_g_MissionInfo )
			AddText( sceneId, "#{M_MUBIAO}#r" )
			AddText( sceneId, x228903_g_MissionTarget )
			AddText( sceneId, "#{M_SHOUHUO}#r" )
			AddMoneyBonus( sceneId, x228903_g_MoneyBonus )
		EndEvent( )
		DispatchMissionInfo( sceneId, selfId, targetId, x228903_g_ScriptId, x228903_g_MissionId )
	end
end

--**********************************
--列举事件
--**********************************
function x228903_OnEnumerate( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x228903_g_Name then		--判断该npc喧ng否喧ng对应任务to� 鸬 npc
		return
	end

   --如果已接此任务
	if IsHaveMission( sceneId, selfId, x228903_g_MissionId ) > 0 then
		AddNumText( sceneId, x228903_g_ScriptId, x228903_g_CopySceneName, 3, -1 )
	elseif x228903_CheckAccept( sceneId, selfId ) > 0 then
		AddNumText( sceneId, x228903_g_ScriptId, x228903_g_MissionName, 3, -1 )
	end
end

--**********************************
--检测Ti猵 th跫�
--**********************************
function x228903_CheckAccept( sceneId, selfId )
	if IsMissionHaveDone( sceneId, selfId, x228903_g_MissionId ) > 0 then
		return 0
	end

	if IsMissionHaveDone( sceneId, selfId, x228903_g_PreMissionId ) <= 0 then
		return 0
	end

	if IsHaveMission( sceneId, selfId, x228903_g_MissionId ) > 0 then
		return 0
	end

	if GetLevel( sceneId, selfId ) < 30 then
		return 0
	end

	return 1
end

--**********************************
--询问玩家喧ng否要进入副本
--**********************************
function x228903_AskEnterCopyScene( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x228903_g_MissionId ) <= 0 then	-- 没有任务
		return
	end

	AddText( sceneId, x228903_g_MissionInfo )
	AddText( sceneId, "#{M_MUBIAO}" )
	AddText( sceneId, x228903_g_MissionTarget )
	AddNumText( sceneId, x228903_g_ScriptId, x228903_g_CopySceneName, 10, 1 )
end

--**********************************
--Ti猵 th�
--**********************************
function x228903_OnAccept( sceneId, selfId, targetId )
	if x228903_CheckAccept( sceneId, selfId ) == 1 then					--没有任务才可以走这里
		--加入任务到玩家列表
		AddMission( sceneId, selfId, x228903_g_MissionId, x228903_g_ScriptId, 1, 0, 0 )	-- kill、area、item
		if IsHaveMission( sceneId, selfId, x228903_g_MissionId ) <= 0 then
			return
		end

		local misIndex = GetMissionIndexByID( sceneId, selfId, x228903_g_MissionId )

		--显示内容告诉玩家已经Ti猵 th巳挝�
		BeginEvent( sceneId )
			AddText( sceneId, x228903_g_MissionName )
			x228903_AskEnterCopyScene( sceneId, selfId )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

		--显示内容告诉玩家已经Ti猵 th巳挝�
		x228903_NotifyFailTips( sceneId, selfId, "C醕 h� 疸 nh nhi甿 v�: " .. x228903_g_MissionName )
		Msg2Player( sceneId, selfId, "#YTi猵 nh" .. x228903_g_MissionName, MSG2PLAYER_PARA )
	end
end

--**********************************
--玩家同意进入副本
--**********************************
function x228903_AcceptEnterCopyScene( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x228903_g_MissionId ) > 0 then					--有任务才可以走这里
		local misIndex = GetMissionIndexByID( sceneId, selfId, x228903_g_MissionId )

		if LuaFnHasTeam( sceneId, selfId ) == 0 then
			x228903_NotifyFailTips( sceneId, selfId, "C醕 h� ph鋓 gia nh v鄌 m祎 鸬i ng�" )
			return
		end

		if LuaFnIsTeamLeader( sceneId, selfId ) == 0 then
			x228903_NotifyFailTips( sceneId, selfId, "C醕 h� bu礳 ph鋓 l� 鸬i tr叻ng" )
			return
		end

		--取 餴琺玩家附近to� 鸬 队友数量(包括自己)
		local nearteammembercount = GetNearTeamCount( sceneId, selfId )
		if nearteammembercount ~= LuaFnGetTeamSize( sceneId, selfId ) then
			x228903_NotifyFailTips( sceneId, selfId, "Qu鈔 c黙 c醕 h� b bu礳 ph鋓 � g m緄 c� th� 皙n h� tr�" )
			return
		end

		if nearteammembercount < x228903_g_LimitMembers then
			x228903_NotifyFailTips( sceneId, selfId, "蛅 nh c醕 h� ph鋓 c hai l韓h 皙n gi鷓 c醕 h�" )
			return
		end

		SetMissionByIndex( sceneId, selfId, misIndex, x228903_g_IsMissionOkFail, 0 )	--将任务to� 鸬 第0号数据设置为0,表示未完成to� 鸬 任务
		SetMissionByIndex( sceneId, selfId, misIndex, x228903_g_Param_sceneid, -1 )		--将任务to� 鸬 第3号数据设置为-1, 用于保存副本to� 鸬 场景号
		x228903_MakeCopyScene( sceneId, selfId )
	end
end

--**********************************
--创建副本
--**********************************
function x228903_MakeCopyScene( sceneId, selfId )
	local leaderguid = LuaFnObjId2Guid( sceneId, selfId )
	LuaFnSetSceneLoad_Map( sceneId, x228903_g_CopySceneMap )						--地图喧ng必须选取to� 鸬 ,而且必须T読 Config/SceneInfo.ini里配置好
	LuaFnSetCopySceneData_TeamLeader( sceneId, leaderguid )
	LuaFnSetCopySceneData_NoUserCloseTime( sceneId, x228903_g_NoUserTime * 1000 )
	LuaFnSetCopySceneData_Timer( sceneId, x228903_g_TickTime * 1000 )
	LuaFnSetCopySceneData_Param( sceneId, 0, x228903_g_CopySceneType )				--设置副本数据,这里将0号索引to� 鸬 数据设置为999,用于表示副本号999(数字自定义)
	LuaFnSetCopySceneData_Param( sceneId, 1, x228903_g_ScriptId )					--将1号数据设置为副本场景事件脚本号
	LuaFnSetCopySceneData_Param( sceneId, 2, 0 )							--设置定时器调用次数
	LuaFnSetCopySceneData_Param( sceneId, 3, -1 )							--设置副本入口场景号, 初始化
	LuaFnSetCopySceneData_Param( sceneId, 4, 0 )							--设置副本关闭标志, 0开放,1关闭
	LuaFnSetCopySceneData_Param( sceneId, 5, 0 )							--设置离开倒计时次数
	LuaFnSetCopySceneData_Param( sceneId, 6, GetTeamId( sceneId, selfId ) )	--保存队伍号
	LuaFnSetCopySceneData_Param( sceneId, 7, 0 )							--杀死Bossto� 鸬 数量
	LuaFnSetCopySceneData_Param( sceneId, 8, 0 )							--杀死路霸to� 鸬 数量

	LuaFnSetSceneLoad_Area( sceneId, x228903_g_Exit )
	LuaFnSetSceneLoad_Monster( sceneId, x228903_g_Monster )

	LuaFnSetCopySceneData_Param( sceneId, CopyScene_LevelGap, 0 )			--c别差,CopyScene_LevelGap T読  scene.lua 中赋值

	local bRetSceneID = LuaFnCreateCopyScene( sceneId )						--初始化完成后调用创建副本函数
	if bRetSceneID > 0 then
		x228903_NotifyFailTips( sceneId, selfId, "D竎h chuy琻 th鄋h c鬾g!" )
	else
		x228903_NotifyFailTips( sceneId, selfId, "S� l唼ng b鋘 sao 疸 皙n gi緄 h課, 皤 ngh� l醫 n鎍 th� l読!" )
	end
end

--**********************************
--副本事件
--**********************************
function x228903_OnCopySceneReady( sceneId, destsceneId )
	LuaFnSetCopySceneData_Param( destsceneId, 3, sceneId )					--设置副本入口场景号
	local leaderguid = LuaFnGetCopySceneData_TeamLeader( destsceneId )
	local leaderObjId = LuaFnGuid2ObjId( sceneId, leaderguid )

	if leaderObjId == -1 then
		return
	end

	if LuaFnIsObjValid( sceneId, leaderObjId ) ~= 1 then			-- 处于无法执行逻辑to� 鸬 状态
		return
	end

	if LuaFnHasTeam( sceneId, leaderObjId ) == 0 then
		x228903_NotifyFailTips( sceneId, leaderObjId, "C醕 h� ph鋓 gia nh v鄌 m祎 鸬i ng�" )
		return
	end

	if LuaFnIsTeamLeader( sceneId, leaderObjId ) == 0 then
		x228903_NotifyFailTips( sceneId, leaderObjId, "C醕 h� bu礳 ph鋓 l� 鸬i tr叻ng" )
		return
	end

	--取 餴琺玩家附近to� 鸬 队友数量(包括自己)
	local nearteammembercount = GetNearTeamCount( sceneId, leaderObjId )
	if nearteammembercount < x228903_g_LimitMembers then
		x228903_NotifyFailTips( sceneId, leaderObjId, "S� ng叨i trong 鸬i ng� c黙 c醕 h� kh鬾g 瘘" )
		return
	end

	if IsHaveMission( sceneId, leaderObjId, x228903_g_MissionId ) > 0 then			--有任务才可以走这里
		local misIndex = GetMissionIndexByID( sceneId, leaderObjId, x228903_g_MissionId )

		--将任务to� 鸬 第2号数据设置为副本to� 鸬 场景号
		SetMissionByIndex( sceneId, leaderObjId, misIndex, x228903_g_Param_sceneid, destsceneId )

		local i = 0
		local member
		for i = 0, nearteammembercount - 1 do
			member = GetNearTeamMember( sceneId, leaderObjId, i )

			if LuaFnIsObjValid( sceneId, member ) == 1 then			-- 处于可以执行逻辑to� 鸬 状态
				NewWorld( sceneId, member, destsceneId, x228903_g_Fuben_X, x228903_g_Fuben_Z )
			end
		end
	end
end

--**********************************
--有玩家进入副本事件
--**********************************
function x228903_OnPlayerEnter( sceneId, selfId )
end

--**********************************
--有玩家T読 副本中死亡事件
--**********************************
function x228903_OnHumanDie( sceneId, selfId, killerId )
end

--**********************************
--放弃
--**********************************
function x228903_OnAbandon( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x228903_g_MissionId ) <= 0 then				--有任务才可以走这里
		return
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x228903_g_MissionId )
	local copyscene = GetMissionParam( sceneId, selfId, misIndex, x228903_g_Param_sceneid )

	--删除玩家任务列表中对应to� 鸬 任务
	DelMission( sceneId, selfId, x228903_g_MissionId )
	x228903_NotifyFailTips( sceneId, selfId, "Nhi甿 v� th b読!" )
end

--**********************************
--继续
--**********************************
function x228903_OnContinue( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, x228903_g_MissionName )
		AddText( sceneId, x228903_g_MissionComplete )
	EndEvent( )
	DispatchMissionContinueInfo( sceneId, selfId, targetId, x228903_g_ScriptId, x228903_g_MissionId )
end

--**********************************
--检测喧ng否可以提交
--**********************************
function x228903_CheckSubmit( sceneId, selfId, selectRadioId )
	--判断任务喧ng否已经完成
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x228903_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x228903_g_MissionId )				--  餴琺到任务to� 鸬 序列号
	bRet = GetMissionParam( sceneId, selfId, misIndex, x228903_g_IsMissionOkFail )
	if bRet ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--提交
--**********************************
function x228903_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if GetName( sceneId, targetId ) ~= x228903_g_Name then		--判断该npc喧ng否喧ng对应任务to� 鸬 npc
		return
	end

	if x228903_CheckSubmit( sceneId, selfId ) == 1 then
		--添加任务奖励
		AddMoney( sceneId, selfId, x228903_g_MoneyBonus )
		LuaFnAddExp( sceneId, selfId, x228903_g_exp )

		DelMission( sceneId, selfId, x228903_g_MissionId )
		--设置任务已经被完成过
		MissionCom( sceneId, selfId, x228903_g_MissionId )
		Msg2Player( sceneId, selfId, "#YHo鄋 th鄋h nhi甿 v�: " .. x228903_g_MissionName, MSG2PLAYER_PARA )
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x228903_OnKillObject( sceneId, selfId, objdataId, objId )
	--喧ng否喧ng副本
	local sceneType = LuaFnGetSceneType( sceneId )
	if sceneType ~= 1 then
		return
	end

	--喧ng否喧ng所C to� 鸬 副本
	local fubentype = LuaFnGetCopySceneData_Param( sceneId, 0 )
	if fubentype ~= x228903_g_CopySceneType then
		return
	end

	--副本关闭标志
	local leaveFlag = LuaFnGetCopySceneData_Param( sceneId, 4 )
	if leaveFlag == 1 then														--如果副本已经被置成关闭状态,则杀怪无效
		return
	end

	local paramIndex = 0
	local monsterName = GetMonsterNamebyDataId( objdataId )
	if monsterName == x228903_g_MonsterList[x228903_g_Param_QinNumber][1] then
		paramIndex = x228903_g_Param_QinNumber
	elseif monsterName == x228903_g_MonsterList[x228903_g_Param_LubaNumber][1] then
		paramIndex = x228903_g_Param_LubaNumber
	else
		return
	end

	local num = GetMonsterOwnerCount( sceneId, objId )
	local ownerid = -1
	local strText = "秀 gi猼 ch猼 " .. monsterName .. ": %d/" .. x228903_g_MonsterList[paramIndex][2]
	local bFinished = 0

	for i = 0, num - 1 do
		ownerid = GetMonsterOwnerID( sceneId, objId, i )

		-- 看有没有C醝 n鄖 任务
		if ownerid and ownerid > 0 and IsHaveMission( sceneId, ownerid, x228903_g_MissionId ) > 0 then
			local misIndex = GetMissionIndexByID( sceneId, ownerid, x228903_g_MissionId )
			local count = GetMissionParam( sceneId, ownerid, misIndex, paramIndex ) + 1
			SetMissionByIndex( sceneId, ownerid, misIndex, paramIndex, count )
			local strText1 = format( strText, count )
			x228903_NotifyFailTips( sceneId, ownerid, strText1 )

			if GetMissionParam( sceneId, ownerid, misIndex, x228903_g_Param_QinNumber ) >=
				x228903_g_MonsterList[x228903_g_Param_QinNumber][2] then
				if GetMissionParam( sceneId, ownerid, misIndex, x228903_g_Param_LubaNumber ) >=
					x228903_g_MonsterList[x228903_g_Param_LubaNumber][2] then
						SetMissionByIndex( sceneId, ownerid, misIndex, x228903_g_IsMissionOkFail, 1 )
						x228903_NotifyFailTips( sceneId, ownerid, "Nhi甿 v� ho鄋 th鄋h" )
						bFinished = 1
				end
			end
		end
	end

	if bFinished == 1 then
		LuaFnSetCopySceneData_Param( sceneId, 4, 1 )

		local membercount = LuaFnGetCopyScene_HumanCount( sceneId )
		local member
		strText = format( "C醕 h� s� r秈 kh鰅 n絠 n鄖 trong v騨g %d gi鈟 n鎍", x228903_g_CloseTick * x228903_g_TickTime )

		for i = 0, membercount - 1 do
			member = LuaFnGetCopyScene_HumanObjId( sceneId, i )

			if LuaFnIsObjValid( sceneId, member ) == 1 then
				x228903_NotifyFailTips( sceneId, member, strText )
			end
		end
	end
end

--**********************************
--进入区域事件
--**********************************
function x228903_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x228903_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--副本场景定时器事件
--**********************************
function x228903_OnCopySceneTimer( sceneId, nowTime )

	--副本时钟读取及设置
	local TickCount = LuaFnGetCopySceneData_Param( sceneId, 2 )						--取 餴琺已经执行to� 鸬 定时次数
	TickCount = TickCount + 1
	LuaFnSetCopySceneData_Param( sceneId, 2, TickCount )							--设置新to� 鸬 定时器调用次数

	local membercount = LuaFnGetCopyScene_HumanCount( sceneId )
	local mems = {}
	for i = 0, membercount - 1 do
		mems[i] = LuaFnGetCopyScene_HumanObjId( sceneId, i )
	end

	--副本关闭标志
	local leaveFlag = LuaFnGetCopySceneData_Param( sceneId, 4 )

	-- 没有人to� 鸬 时候关闭副本
	if leaveFlag == 1 then															--C 离开
		--离开倒计时间to� 鸬 读取和设置
		local leaveTickCount = LuaFnGetCopySceneData_Param( sceneId, 5 )
		leaveTickCount = leaveTickCount + 1
		LuaFnSetCopySceneData_Param( sceneId, 5, leaveTickCount )

		if leaveTickCount >= x228903_g_CloseTick then										--倒计时间到,大家都出去吧
			--将当前副本场景里to� 鸬 所有人传送回原来进入时候to� 鸬 场景
			for i = 0, membercount - 1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					x228903_OnEnterArea( sceneId, mems[i] )
				end
			end
		else
			--通知当前副本场景里to� 鸬 所有人,场景关闭倒计时间
			local strText = format( "C醕 h� s� r秈 kh鰅 n絠 n鄖 trong v騨g %d gi鈟 n鎍", ( x228903_g_CloseTick - leaveTickCount ) * x228903_g_TickTime )

			for i = 0, membercount - 1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					x228903_NotifyFailTips( sceneId, mems[i], strText )
				end
			end
		end
	else
		local monstercount = GetMonsterCount( sceneId )
		if monstercount <= 0 then
			--通知当前副本场景里to� 鸬 所有人,场景关闭倒计时间
			local strText = format( "C醕 h� s� r秈 kh鰅 n絠 n鄖 trong v騨g %d gi鈟 n鎍", x228903_g_CloseTick * x228903_g_TickTime )
			LuaFnSetCopySceneData_Param( sceneId, 4, 1 )

			for i = 0, membercount - 1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					x228903_NotifyFailTips( sceneId, mems[i], strText )
				end
			end

			return
		end
	end
end

-- 玩家进入传送 餴琺
function x228903_OnEnterArea( sceneId, selfId )
	CallScriptFunction( x228903_g_TransScript, "TransferFunc", sceneId, selfId, x228903_g_SceneID, x228903_g_Back_X, x228903_g_Back_Z )
end

-- 玩家停留T読 传送 餴琺
function x228903_OnTimer( sceneId, selfId )
	return
end

-- 玩家离开传送 餴琺
function x228903_OnLeaveArea( sceneId, selfId )
	return
end

function x228903_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
