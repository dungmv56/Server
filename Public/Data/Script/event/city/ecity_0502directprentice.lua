--副本任务
--指 餴琺本派弟子

--************************************************************************
--MisDescBegin

--脚本号
x600025_g_ScriptId = 600025

--任务号
x600025_g_MissionId = 1110

--目标NPC
x600025_g_Name = "恤ng Ph� Dung"

--衅ng c nhi甿 v� 
x600025_g_MissionLevel = 10000

--任务归类
x600025_g_MissionKind = 50

--喧ng否喧ngTinh英任务
x600025_g_IfMissionElite = 0

--********下面几项喧ng动态显示to� 鸬 内容,用于T読 任务列表中动态显示任务情况******
--角色Mission变量� 餴琺�
x600025_g_IsMissionOkFail			=0	--0 Nhi甿 v� ho鄋 th鄋h标记[值不能变]
x600025_g_MissionParam_SubId		=1	--1 子任务脚本号存放位置[值不能变]
x600025_g_MissionParam_KillNumber	=2	--2 C 消灭to� 鸬 怪物数量
x600025_g_Param_sceneid				=3	--3号: 当前副本任务to� 鸬 场景号
x600025_g_Param_teamid				=4	--4号: 接副本任务时候to� 鸬 队伍号
x600025_g_Param_killcount			=5	--5号: 杀死任务怪to� 鸬 数量
x600025_g_Param_time				=6	--6号: 完成副本所用时间(单位:  gi鈟)
--6号: 未用
--7号: 未用

--循环任务to� 鸬 数据索引,里面存着已做to� 鸬 环数
x600025_g_MissionRound = 55
--**********************************以上喧ng动态****************************

--任务文本描述
x600025_g_MissionName = "Nhi甿 v� khu猚h tr呓ng"
x600025_g_MissionInfo = ""													--任务描述
x600025_g_MissionTarget = "    Ch� 餴琺 � 疴y t c� 甬 t� c黙 b眓 bang. "					--M鴆 ti陁 nhi甿 v�
x600025_g_ContinueInfo = "    Nhi甿 v� c黙 c醕 h� v鏽 ch遖 ho鄋 th鄋h �?"						--未Ho鄋 t nhi甿 v鴗o� 鸬 npc对话
x600025_g_SubmitInfo = "    S� t靚h ti猲 tri琻 nh� th� n鄌 r癷?"								--完成未提交时to� 鸬 npc对话
x600025_g_MissionComplete = "    X裯g 疳ng l� 甬 t� 遳 t� c黙 b眓 bang, ha ha ha. "			--Ho鄋 t nhi甿 v鴑pc说话to� 鸬 话

x600025_g_Parameter_Kill_CountRandom = { { id = 300469, numNeeded = 2, numKilled = 5 } }

-- 通用Th鄋h ph� 任务脚本
x600025_g_CityMissionScript = 600001
x600025_g_ExpandScript = 600023
x600025_g_TransScript = 400900

--任务奖励

--MisDescEnd
--************************************************************************

--副本名称
x600025_g_CopySceneName = "Tr叨ng v�"

x600025_g_CopySceneType = FUBEN_JIAOCHANG	--副本类型,定义T読 ScriptGlobal.lua里面

x600025_g_CopySceneMap = "jiaochang.nav"
x600025_g_Exit = "jiaochang_area.ini"
x600025_g_LimitMembers = 1				--可以进副本to� 鸬 最小队伍人数
x600025_g_TickTime = 5					--回调脚本to� 鸬 时钟时间(单位:  gi鈟/次)
x600025_g_LimitTotalHoldTime = 360		--副本可以存活to� 鸬 时间(单位: 次数),如果此时间到了,则任务将会th b読
x600025_g_LimitTimeSuccess = 500		--副本时间限制(单位: 次数),如果此时间到了,Nhi甿 v� ho鄋 th鄋h
x600025_g_CloseTick = 3					--副本关闭前倒计时(单位: 次数)
x600025_g_NoUserTime = 300				--副本中没有人后可以继续保存to� 鸬 时间(单位:  gi鈟)
x600025_g_DeadTrans = 0					--死亡转移模式,0: 死亡后还可以继续T読 副本,1: 死亡后被强制移出副本
x600025_g_MonsterCount = 10				--弟子数量
x600025_g_Fuben_X = 31					--进入副本to� 鸬 位置X
x600025_g_Fuben_Z = 13					--进入副本to� 鸬 位置Z
x600025_g_Back_X = 146					--源场景位置X
x600025_g_Back_Z = 95					--源场景位置Z

--**********************************
--任务入口函数
--**********************************
function x600025_OnDefaultEvent( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x600025_g_Name then		--判断该npc喧ng否喧ng对应任务to� 鸬 npc
		return
	end

	--如果已接此任务
	if IsHaveMission( sceneId, selfId, x600025_g_MissionId ) > 0 then
		local bDone = x600025_CheckSubmit( sceneId, selfId )
		local strText

		if bDone == 1 then
			strText = x600025_g_SubmitInfo
		else
			strText = x600025_g_ContinueInfo
		end

		if bDone == 0 then												--任务未完成
			if GetNumText() == 1 then
				x600025_AcceptEnterCopyScene( sceneId, selfId )
			else
				BeginEvent( sceneId )
					AddText( sceneId, x600025_g_MissionName )
					x600025_AskEnterCopyScene( sceneId, selfId )
				EndEvent( )
				DispatchEventList( sceneId, selfId, targetId )
			end
		elseif bDone == 1 then											--任务已经完成
			BeginEvent( sceneId )
				AddText( sceneId, x600025_g_MissionName )
				AddText( sceneId, strText )
			EndEvent( )
			DispatchMissionDemandInfo( sceneId, selfId, targetId, x600025_g_ScriptId, x600025_g_MissionId, bDone )
		end
	--Th鯽 m鉵任务接收条件
	elseif x600025_CheckAccept( sceneId, selfId ) > 0 then
		local nTemp = CallScriptFunction( x600025_g_CityMissionScript, "CanDoMisToDay", sceneId, selfId )
		if nTemp == 1   then
			x600025_OnAccept( sceneId, selfId, targetId )
		end
	end
end

--**********************************
--列举事件
--**********************************
function x600025_OnEnumerate( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x600025_g_Name then		--判断该npc喧ng否喧ng对应任务to� 鸬 npc
		return
	end

   --如果已接此任务
	if IsHaveMission( sceneId, selfId, x600025_g_MissionId ) > 0 then
		AddNumText( sceneId, x600025_g_ScriptId, x600025_g_MissionName,3,-1 )
	end
end

--**********************************
--检测Ti猵 th跫�
--**********************************
function x600025_CheckAccept( sceneId, selfId )
	local ret = CallScriptFunction( x600025_g_ExpandScript, "CheckAccept", sceneId, selfId )
	return ret
end

--**********************************
--询问玩家喧ng否要进入副本
--**********************************
function x600025_AskEnterCopyScene( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x600025_g_MissionId ) <= 0 then	-- 没有任务
		return
	end

	local missionInfo = format( "    Tr叨ng c� m祎 v鄆 b鱪 甬 t� m緄 c黙 bang n鄖, c醕 h� 餴 ch� b鋙 h� 餴." )

	AddText( sceneId, missionInfo )
	AddNumText( sceneId, x600025_g_ScriptId, "V鄌 tr叨ng", 10, 1 )
end

--**********************************
--Ti猵 th�
--**********************************
function x600025_OnAccept( sceneId, selfId, targetId )
	if IsHaveMission( sceneId, selfId, x600025_g_MissionId ) == 0 then					--没有任务才可以走这里
		if GetLevel( sceneId, selfId ) < 40 then
			CallScriptFunction( x600025_g_CityMissionScript, "NotifyFailTips", sceneId, selfId, "Kh鬾g 瘘 鹌ng c" )
			return
		end

		--加入任务到玩家列表
		AddMission( sceneId, selfId, x600025_g_MissionId, x600025_g_ScriptId, 1, 0, 0 )	-- kill、area、item
		if IsHaveMission( sceneId, selfId, x600025_g_MissionId ) <= 0 then
			return
		end

		CallScriptFunction( x600025_g_ExpandScript, "OnAccept", sceneId, selfId, targetId, x600025_g_ScriptId )
		local misIndex = GetMissionIndexByID( sceneId, selfId, x600025_g_MissionId )
		SetMissionByIndex( sceneId, selfId, misIndex, x600025_g_MissionParam_KillNumber, x600025_g_MonsterCount )	--C 杀死to� 鸬 怪物数量,仅供客户端使用

		--显示内容告诉玩家已经Ti猵 th巳挝�
		BeginEvent( sceneId )
			AddText( sceneId, x600025_g_MissionName )
			x600025_AskEnterCopyScene( sceneId, selfId )
			AddText( sceneId, "#rC醕 h� 疸 nh " .. x600025_g_MissionName )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
end

--**********************************
--玩家同意进入副本
--**********************************
function x600025_AcceptEnterCopyScene( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x600025_g_MissionId ) > 0 then					--有任务才可以走这里
		local misIndex = GetMissionIndexByID( sceneId, selfId, x600025_g_MissionId )
		local copysceneid = GetMissionParam( sceneId, selfId, misIndex, x600025_g_Param_sceneid )

		--changed by xindefeng
		--副本新机制:无论什么原因,T読 未Ho鄋 t nhi甿 v龈北�,副本不对玩家身上to� 鸬 任务做任何改动(设置th b読或者删除任务),而玩家再进该副本时,都要重新初始化任务数据,而且副本都要重新创建
		--if copysceneid >= 0 then												--进过副本
		--	--将自己传送到副本场景
		--	if IsCanEnterCopyScene( copysceneid, GetHumanGUID( sceneId, selfId ) ) == 1 then
		--		NewWorld( sceneId, selfId, copysceneid, x600025_g_Fuben_X, x600025_g_Fuben_Z )
		--		return
		--	end
		--end

		SetMissionByIndex( sceneId, selfId, misIndex, x600025_g_IsMissionOkFail, 0 )	--将任务to� 鸬 第0号数据设置为0,表示未完成to� 鸬 任务
		SetMissionByIndex( sceneId, selfId, misIndex, x600025_g_Param_sceneid, -1 )		--将任务to� 鸬 第2号数据设置为-1, 用于保存副本to� 鸬 场景号
		
		--add by xindefeng
		SetMissionByIndex( sceneId, selfId, misIndex, x600025_g_Param_killcount, 0 )	--将任务to� 鸬 第5号数据设置为0, 设置玩家杀死怪物数量为0
		
		x600025_MakeCopyScene( sceneId, selfId )
	end
end

--**********************************
--创建副本
--**********************************
function x600025_MakeCopyScene( sceneId, selfId )
	local mylevel = GetLevel( sceneId, selfId )

	local leaderguid = LuaFnObjId2Guid( sceneId, selfId )
	LuaFnSetSceneLoad_Map( sceneId, x600025_g_CopySceneMap )						--地图喧ng必须选取to� 鸬 ,而且必须T読 Config/SceneInfo.ini里配置好
	LuaFnSetCopySceneData_TeamLeader( sceneId, leaderguid )
	LuaFnSetCopySceneData_NoUserCloseTime( sceneId, x600025_g_NoUserTime * 1000 )
	LuaFnSetCopySceneData_Timer( sceneId, x600025_g_TickTime * 1000 )
	LuaFnSetCopySceneData_Param( sceneId, 0, x600025_g_CopySceneType )				--设置副本数据,这里将0号索引to� 鸬 数据设置为999,用于表示副本号999(数字自定义)
	LuaFnSetCopySceneData_Param( sceneId, 1, x600025_g_ScriptId )					--将1号数据设置为副本场景事件脚本号
	LuaFnSetCopySceneData_Param( sceneId, 2, 0 )							--设置定时器调用次数
	LuaFnSetCopySceneData_Param( sceneId, 3, -1 )							--设置副本入口场景号, 初始化
	LuaFnSetCopySceneData_Param( sceneId, 4, 0 )							--设置副本关闭标志, 0开放,1关闭
	LuaFnSetCopySceneData_Param( sceneId, 5, 0 )							--设置离开倒计时次数
	LuaFnSetCopySceneData_Param( sceneId, 7, x600025_g_MonsterCount )				--剩余弟子to� 鸬 数量

	local PlayerMaxLevel = GetHumanMaxLevelLimit() --modi:lby20071127
	
	local iniLevel
	if mylevel < 10 then
		iniLevel = 10
	elseif mylevel < PlayerMaxLevel then
		iniLevel = floor( mylevel/10 ) * 10
	else
		iniLevel = PlayerMaxLevel
	end

	LuaFnSetSceneLoad_Area( sceneId, x600025_g_Exit )
	LuaFnSetSceneLoad_Monster( sceneId, "jiaochang_monster_" .. iniLevel .. ".ini" )

	LuaFnSetCopySceneData_Param(sceneId, CopyScene_LevelGap, mylevel - iniLevel) --c别差,CopyScene_LevelGap T読  scene.lua 中赋值

	local bRetSceneID = LuaFnCreateCopyScene( sceneId )						--初始化完成后调用创建副本函数
	if bRetSceneID > 0 then
		x600025_NotifyFailTips( sceneId, selfId, "D竎h chuy琻 th鄋h c鬾g!" )
	else
		x600025_NotifyFailTips( sceneId, selfId, "S� l唼ng b鋘 sao 疸 皙n gi緄 h課, 皤 ngh� l醫 n鎍 th� l読!" )
	end

end

--**********************************
--副本事件
--**********************************
function x600025_OnCopySceneReady( sceneId, destsceneId )
	LuaFnSetCopySceneData_Param( destsceneId, 3, sceneId )					--设置副本入口场景号
	local leaderguid = LuaFnGetCopySceneData_TeamLeader( destsceneId )
	local leaderObjId = LuaFnGuid2ObjId( sceneId, leaderguid )

	if leaderObjId == -1 then
		return
	end

	if LuaFnIsCanDoScriptLogic( sceneId, leaderObjId ) ~= 1 then			-- 处于无法执行逻辑to� 鸬 状态
		return
	end

	if IsHaveMission( sceneId, leaderObjId, x600025_g_MissionId ) > 0 then			--有任务才可以走这里
		local misIndex = GetMissionIndexByID( sceneId, leaderObjId, x600025_g_MissionId )

		--将任务to� 鸬 第3号数据设置为副本to� 鸬 场景号
		SetMissionByIndex( sceneId, leaderObjId, misIndex, x600025_g_Param_sceneid, destsceneId )
		NewWorld( sceneId, leaderObjId, destsceneId, x600025_g_Fuben_X, x600025_g_Fuben_Z )
	end
end

--**********************************
--有玩家进入副本事件
--**********************************
function x600025_OnPlayerEnter( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x600025_g_MissionId ) == 0 then				--如果进入副本前删除任务,则直接传送回
		x600025_NotifyFailTips( sceneId, selfId, "C醕 h� 疸 kh鬾g nh nhi甿 v� n鄖 t� tr呔c" )
		local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )		--取 餴琺副本入口场景号
		NewWorld( sceneId, selfId, oldsceneId, x600025_g_Back_X, x600025_g_Back_Z )
		return
	end
end

--**********************************
--有玩家T読 副本中死亡事件
--**********************************
function x600025_OnHumanDie( sceneId, selfId, killerId )
	if x600025_g_DeadTrans == 1 then														--死亡后C 被强制踢出场景
		local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )				--取 餴琺副本入口场景号
		NewWorld( sceneId, selfId, oldsceneId, x600025_g_Back_X, x600025_g_Back_Z )
	end
end

--**********************************
--放弃
--**********************************
function x600025_OnAbandon( sceneId, selfId )
	local misIndex = GetMissionIndexByID( sceneId, selfId, x600025_g_MissionId )
	local copyscene = GetMissionParam( sceneId, selfId, misIndex, x600025_g_Param_sceneid )

	--删除玩家任务列表中对应to� 鸬 任务
	CallScriptFunction( x600025_g_ExpandScript, "OnAbandon", sceneId, selfId )

	if sceneId == copyscene then											--如果T読 副本里删除任务,则直接传送回
		x600025_NotifyFailTips( sceneId, selfId, "Nhi甿 v� th b読!" )
		local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )		--取 餴琺副本入口场景号
		NewWorld( sceneId, selfId, oldsceneId, x600025_g_Back_X, x600025_g_Back_Z )
	end
end

--**********************************
-- 回城,只有Th鄋h ph� 任务副本可以调用此接口
--**********************************
function x600025_BackToCity( sceneId, selfId )
	local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )					--取 餴琺副本入口场景号
	CallScriptFunction( x600025_g_TransScript, "TransferFunc", sceneId, selfId, oldsceneId, x600025_g_Back_X, x600025_g_Back_Z )
end

--**********************************
--继续
--**********************************
function x600025_OnContinue( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, x600025_g_MissionName )
		AddText( sceneId, x600025_g_MissionComplete )
	EndEvent( )
	DispatchMissionContinueInfo( sceneId, selfId, targetId, x600025_g_ScriptId, x600025_g_MissionId )
end

--**********************************
--检测喧ng否可以提交
--**********************************
function x600025_CheckSubmit( sceneId, selfId, selectRadioId )
	--判断任务喧ng否已经完成
	local ret = CallScriptFunction( x600025_g_ExpandScript, "CheckSubmit", sceneId, selfId )
	return ret
end

--**********************************
--提交
--**********************************
function x600025_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if GetName( sceneId, targetId ) ~= x600025_g_Name then		--判断该npc喧ng否喧ng对应任务to� 鸬 npc
		return
	end

	if x600025_CheckSubmit( sceneId, selfId ) == 1 then
		CallScriptFunction( x600025_g_ExpandScript, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x600025_OnKillObject( sceneId, selfId, objdataId, objId )
	if IsHaveMission( sceneId, selfId, x600025_g_MissionId ) == 0 then
		return
	end

	--喧ng否喧ng副本
	local sceneType = LuaFnGetSceneType( sceneId )
	if sceneType ~= 1 then
		return
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x600025_g_MissionId )

	--喧ng否喧ng所C to� 鸬 副本
	local fubentype = LuaFnGetCopySceneData_Param( sceneId, 0 )
	if fubentype ~= x600025_g_CopySceneType then
		return
	end

	--副本关闭标志
	local leaveFlag = LuaFnGetCopySceneData_Param( sceneId, 4 )
	if leaveFlag == 1 then														--如果副本已经被置成关闭状态,则杀怪无效
		return
	end

	local monstercount = LuaFnGetCopySceneData_Param( sceneId, 7 )
	monstercount = monstercount - 1
	LuaFnSetCopySceneData_Param( sceneId, 7, monstercount )						--剩余弟子to� 鸬 数量
	SetMissionByIndex( sceneId, selfId, misIndex, x600025_g_Param_killcount, x600025_g_MonsterCount - monstercount )	--已杀死to� 鸬 怪物数量,仅供客户端使用

	local strText

	if monstercount > 0 then
		strText = format( "C騨 l読 %d 甬 t�", monstercount )
		x600025_NotifyFailTips( sceneId, selfId, strText )
	else
		--设置Nhi甿 v� ho鄋 th鄋h标志
		LuaFnSetCopySceneData_Param( sceneId, 4, 1 )

		strText = format( "Ho鄋 t nhi甿 v�, trong v騨g %d gi鈟 n鎍 s� 疬a 皙n ch� ra v鄌", x600025_g_CloseTick * x600025_g_TickTime )
		x600025_NotifyFailTips( sceneId, selfId, strText )

		--将任务to� 鸬 第1号数据设置为1,表示完成to� 鸬 任务
		SetMissionByIndex( sceneId, selfId, misIndex, x600025_g_IsMissionOkFail, 1 )	--设置任务数据
	end
end

--**********************************
--进入区域事件
--**********************************
function x600025_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x600025_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--副本场景定时器事件
--**********************************
function x600025_OnCopySceneTimer( sceneId, nowTime )

	--副本时钟读取及设置
	local TickCount = LuaFnGetCopySceneData_Param( sceneId, 2 )						--取 餴琺已经执行to� 鸬 定时次数
	TickCount = TickCount + 1
	LuaFnSetCopySceneData_Param( sceneId, 2, TickCount )							--设置新to� 鸬 定时器调用次数

	--副本关闭标志
	local leaveFlag = LuaFnGetCopySceneData_Param( sceneId, 4 )

	local membercount = LuaFnGetCopyScene_HumanCount( sceneId )
	local mems = {}
	local i

	for i=0, membercount-1 do
		mems[i] = LuaFnGetCopyScene_HumanObjId( sceneId, i )
	end

	if leaveFlag == 1 then															--C 离开
		--离开倒计时间to� 鸬 读取和设置
		local leaveTickCount = LuaFnGetCopySceneData_Param( sceneId, 5 )
		leaveTickCount = leaveTickCount + 1
		LuaFnSetCopySceneData_Param( sceneId, 5, leaveTickCount )

		if leaveTickCount >= x600025_g_CloseTick then										--倒计时间到,大家都出去吧
			local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )			--取 餴琺副本入口场景号

			--将当前副本场景里to� 鸬 所有人传送回原来进入时候to� 鸬 场景
			for i=0, membercount-1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					NewWorld( sceneId, mems[i], oldsceneId, x600025_g_Back_X, x600025_g_Back_Z )
				end
			end
		else
			--通知当前副本场景里to� 鸬 所有人,场景关闭倒计时间
			local strText = format( "C醕 h� s� r秈 kh鰅 n絠 n鄖 trong v騨g %d gi鈟 n鎍", ( x600025_g_CloseTick - leaveTickCount ) * x600025_g_TickTime )

			for i=0, membercount-1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					x600025_NotifyFailTips( sceneId, mems[i], strText )
				end
			end
		end
	end
end

function x600025_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
