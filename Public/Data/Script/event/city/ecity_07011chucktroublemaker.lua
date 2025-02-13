--副本任务
--指 餴琺本派弟子

--************************************************************************
--MisDescBegin

--脚本号
x600037_g_ScriptId = 600037

--任务号
x600037_g_MissionId = 1112

--父任务号
x600037_g_UpMissionId = 1111

--衅ng c nhi甿 v� 
x600037_g_MissionLevel = 10000

--任务归类
x600037_g_MissionKind = 50

--喧ng否喧ngTinh英任务
x600037_g_IfMissionElite = 0

--********下面几项喧ng动态显示to� 鸬 内容,用于T読 任务列表中动态显示任务情况******
--角色Mission变量� 餴琺�
x600037_g_IsMissionOkFail			=0	--0 Nhi甿 v� ho鄋 th鄋h标记[值不能变]
x600037_g_MissionParam_SubId		=1	--1 子任务脚本号存放位置[值不能变]
x600037_g_MissionParam_KillNumber	=2	--2 C 消灭to� 鸬 怪物数量
x600037_g_Param_sceneid				=3	--3号: 当前副本任务to� 鸬 场景号
x600037_g_Param_killcount			=4	--4号: 杀死任务怪to� 鸬 数量
--6号: 未用
--7号: 未用

--**********************************以上喧ng动态****************************

--任务文本描述
x600037_g_MissionName = "Xu 馥u l� di畁 c鵱g m鱥 ng叨i"
x600037_g_MissionInfo = ""													--任务描述
x600037_g_MissionTarget = "    衭眎 餴 ng叨i sinh chuy畁 g鈟 s�. "								--M鴆 ti陁 nhi甿 v�

x600037_g_Parameter_Kill_CountRandom = { { id = 300470, numNeeded = 2, numKilled = 4 } }

-- 通用Th鄋h ph� 任务脚本
x600037_g_CityMissionScript = 600001
x600037_g_ConstructionScript = 600035
x600037_g_TransScript = 400900

--任务奖励

--MisDescEnd
--************************************************************************

--副本名称
x600037_g_CopySceneName = "Th� t"

x600037_g_CopySceneType = FUBEN_SHIJI2	--副本类型,定义T読 ScriptGlobal.lua里面

x600037_g_CopySceneMap = "shiji_2.nav"
x600037_g_Exit = "shiji_2_area.ini"
x600037_g_LimitMembers = 1				--可以进副本to� 鸬 最小队伍人数
x600037_g_TickTime = 5					--回调脚本to� 鸬 时钟时间(单位:  gi鈟/次)
x600037_g_LimitTotalHoldTime = 360		--副本可以存活to� 鸬 时间(单位: 次数),如果此时间到了,则任务将会th b読
x600037_g_LimitTimeSuccess = 500		--副本时间限制(单位: 次数),如果此时间到了,Nhi甿 v� ho鄋 th鄋h
x600037_g_CloseTick = 3					--副本关闭前倒计时(单位: 次数)
x600037_g_NoUserTime = 300				--副本中没有人后可以继续保存to� 鸬 时间(单位:  gi鈟)
x600037_g_DeadTrans = 0					--死亡转移模式,0: 死亡后还可以继续T読 副本,1: 死亡后被强制移出副本
x600037_g_MonsterCount = 10				--弟子数量
x600037_g_Fuben_X = 43					--进入副本to� 鸬 位置X
x600037_g_Fuben_Z = 45					--进入副本to� 鸬 位置Z

x600037_g_MonsterGroupId = 1			--普通怪
x600037_g_BossGroupId = 2				--boss怪

--**********************************
--任务入口函数
--**********************************
function x600037_OnDefaultEvent( sceneId, selfId, targetId )
	--只有接了此任务才能走进来.Nhi甿 v� ho鄋 th鄋h时会自动删除,也不会走到这里
	if IsHaveMission( sceneId, selfId, x600037_g_MissionId ) > 0 then
		x600037_AcceptEnterCopyScene( sceneId, selfId )
	end
end

--**********************************
--列举事件
--**********************************
function x600037_OnEnumerate( sceneId, selfId, targetId )
	TAddText( sceneId, x600037_g_MissionName )
	x600037_AskEnterCopyScene( sceneId, selfId )
end

--**********************************
--询问玩家喧ng否要进入副本
--**********************************
function x600037_AskEnterCopyScene( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x600037_g_MissionId ) <= 0 then	-- 没有任务
		return
	end

	local PlayerGender = GetSex( sceneId, selfId )
	local rank

	if PlayerGender == 0 then
		rank = "N� hi畃"
	elseif PlayerGender == 1 then
		rank = " c醕 h�"
	else
		rank = " c醕 h� "
	end

	local missionInfo = format( "    M唼n 鸢 th� kh鬾g c� g� kh�, ch� c� 餴玼 c� ng叨i mu痭 g鈟 phi玭 h� cho ta, c nh�" .. rank .. "Xu 馥u l� di畁 h� ta" )

	TAddText( sceneId, missionInfo )
	TAddNumText( sceneId, x600037_g_ScriptId, "进入市集", 10, 1, x600037_g_ScriptId )
end

--**********************************
--玩家同意进入副本
--**********************************
function x600037_AcceptEnterCopyScene( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x600037_g_MissionId ) > 0 then					--有任务才可以走这里
		local misIndex = GetMissionIndexByID( sceneId, selfId, x600037_g_MissionId )
		local copysceneid = GetMissionParam( sceneId, selfId, misIndex, x600037_g_Param_sceneid )

		if copysceneid >= 0 then												--进过副本
			--将自己传送到副本场景
			if IsCanEnterCopyScene( copysceneid, GetHumanGUID( sceneId, selfId ) ) == 1 then
				NewWorld( sceneId, selfId, copysceneid, x600037_g_Fuben_X, x600037_g_Fuben_Z )
				return
			end
		end

		SetMissionByIndex( sceneId, selfId, misIndex, x600037_g_IsMissionOkFail, 0 )	--将任务to� 鸬 第0号数据设置为0,表示未完成to� 鸬 任务
		SetMissionByIndex( sceneId, selfId, misIndex, x600037_g_Param_sceneid, -1 )		--将任务to� 鸬 第2号数据设置为-1, 用于保存副本to� 鸬 场景号
		x600037_MakeCopyScene( sceneId, selfId )
	end
end

--**********************************
--创建副本
--**********************************
function x600037_MakeCopyScene( sceneId, selfId )
	local mylevel = GetLevel( sceneId, selfId )

	local leaderguid = LuaFnObjId2Guid( sceneId, selfId )
	LuaFnSetSceneLoad_Map( sceneId, x600037_g_CopySceneMap )						--地图喧ng必须选取to� 鸬 ,而且必须T読 Config/SceneInfo.ini里配置好
	LuaFnSetCopySceneData_TeamLeader( sceneId, leaderguid )
	LuaFnSetCopySceneData_NoUserCloseTime( sceneId, x600037_g_NoUserTime * 1000 )
	LuaFnSetCopySceneData_Timer( sceneId, x600037_g_TickTime * 1000 )
	LuaFnSetCopySceneData_Param( sceneId, 0, x600037_g_CopySceneType )				--设置副本数据,这里将0号索引to� 鸬 数据设置为999,用于表示副本号999(数字自定义)
	LuaFnSetCopySceneData_Param( sceneId, 1, x600037_g_ScriptId )					--将1号数据设置为副本场景事件脚本号
	LuaFnSetCopySceneData_Param( sceneId, 2, 0 )							--设置定时器调用次数
	LuaFnSetCopySceneData_Param( sceneId, 3, -1 )							--设置副本入口场景号, 初始化
	LuaFnSetCopySceneData_Param( sceneId, 4, 0 )							--设置副本关闭标志, 0开放,1关闭
	LuaFnSetCopySceneData_Param( sceneId, 5, 0 )							--设置离开倒计时次数
	LuaFnSetCopySceneData_Param( sceneId, 6, x600037_g_MonsterCount )				--剩余怪物to� 鸬 数量

	local x, z = LuaFnGetWorldPos( sceneId, selfId )
	LuaFnSetCopySceneData_Param( sceneId, 7, x )							--玩家出来时候to� 鸬 位置
	LuaFnSetCopySceneData_Param( sceneId, 8, z )							--玩家出来时候to� 鸬 位置

  local PlayerMaxLevel = GetHumanMaxLevelLimit()
	local iniLevel
	if mylevel < 10 then
		iniLevel = 10
	elseif mylevel < PlayerMaxLevel then
		iniLevel = floor( mylevel/10 ) * 10
	else
		iniLevel = PlayerMaxLevel
	end

	LuaFnSetSceneLoad_Area( sceneId, x600037_g_Exit )
	LuaFnSetSceneLoad_Monster( sceneId, "shiji_2_monster_" .. iniLevel .. ".ini" )

	LuaFnSetCopySceneData_Param(sceneId, CopyScene_LevelGap, mylevel - iniLevel) --c别差,CopyScene_LevelGap T読  scene.lua 中赋值

	local bRetSceneID = LuaFnCreateCopyScene( sceneId )						--初始化完成后调用创建副本函数
	if bRetSceneID > 0 then
		x600037_NotifyFailTips( sceneId, selfId, "D竎h chuy琻 th鄋h c鬾g!" )
	else
		x600037_NotifyFailTips( sceneId, selfId, "S� l唼ng b鋘 sao 疸 皙n gi緄 h課, 皤 ngh� l醫 n鎍 th� l読!" )
	end

end

--**********************************
--副本事件
--**********************************
function x600037_OnCopySceneReady( sceneId, destsceneId )
	LuaFnSetCopySceneData_Param( destsceneId, 3, sceneId )					--设置副本入口场景号
	local leaderguid = LuaFnGetCopySceneData_TeamLeader( destsceneId )
	local leaderObjId = LuaFnGuid2ObjId( sceneId, leaderguid )

	if leaderObjId == -1 then
		return
	end

	if LuaFnIsCanDoScriptLogic( sceneId, leaderObjId ) ~= 1 then			-- 处于无法执行逻辑to� 鸬 状态
		return
	end

	if IsHaveMission( sceneId, leaderObjId, x600037_g_MissionId ) > 0 then			--有任务才可以走这里
		local misIndex = GetMissionIndexByID( sceneId, leaderObjId, x600037_g_MissionId )

		--将任务to� 鸬 第3号数据设置为副本to� 鸬 场景号
		SetMissionByIndex( sceneId, leaderObjId, misIndex, x600037_g_Param_sceneid, destsceneId )
		NewWorld( sceneId, leaderObjId, destsceneId, x600037_g_Fuben_X, x600037_g_Fuben_Z )
	end
end

--**********************************
--有玩家进入副本事件
--**********************************
function x600037_OnPlayerEnter( sceneId, selfId )
end

--**********************************
--有玩家T読 副本中死亡事件
--**********************************
function x600037_OnHumanDie( sceneId, selfId, killerId )
end

--**********************************
--放弃
--**********************************
function x600037_OnAbandon( sceneId, selfId )
	local misIndex = GetMissionIndexByID( sceneId, selfId, x600037_g_MissionId )
	local copyscene = GetMissionParam( sceneId, selfId, misIndex, x600037_g_Param_sceneid )

	if IsHaveMission( sceneId, selfId, x600037_g_UpMissionId ) > 0 then				--父任务设置成th b読
		misIndex = GetMissionIndexByID( sceneId, selfId, x600037_g_UpMissionId )
		SetMissionByIndex( sceneId, selfId, misIndex, x600037_g_IsMissionOkFail, 2 )
		ResetMissionEvent( sceneId, selfId, x600037_g_UpMissionId, 4 )
	end

	--删除玩家任务列表中对应to� 鸬 任务
	DelMission( sceneId, selfId, x600037_g_MissionId )

	if sceneId == copyscene then											--如果T読 副本里删除任务,则直接传送回
		x600037_NotifyFailTips( sceneId, selfId, "Nhi甿 v� th b読!" )
		x600037_BackToCity( sceneId, selfId )
	end
end

--**********************************
-- 回城,只有Th鄋h ph� 任务副本可以调用此接口
--**********************************
function x600037_BackToCity( sceneId, selfId )
	local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )			--取 餴琺副本入口场景号
	local x = LuaFnGetCopySceneData_Param( sceneId, 7 )
	local z = LuaFnGetCopySceneData_Param( sceneId, 8 )
	CallScriptFunction( x600037_g_TransScript, "TransferFunc", sceneId, selfId, oldsceneId, x, z )
end

--**********************************
--杀死怪物或玩家
--**********************************
function x600037_OnKillObject( sceneId, selfId, objdataId, objId )
	if IsHaveMission( sceneId, selfId, x600037_g_MissionId ) == 0 then
		return
	end

	--喧ng否喧ng副本
	local sceneType = LuaFnGetSceneType( sceneId )
	if sceneType ~= 1 then
		return
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x600037_g_MissionId )

	--喧ng否喧ng所C to� 鸬 副本
	local fubentype = LuaFnGetCopySceneData_Param( sceneId, 0 )
	if fubentype ~= x600037_g_CopySceneType then
		return
	end

	--副本关闭标志
	local leaveFlag = LuaFnGetCopySceneData_Param( sceneId, 4 )
	if leaveFlag == 1 then														--如果副本已经被置成关闭状态,则杀怪无效
		return
	end

	local monstercount = LuaFnGetCopySceneData_Param( sceneId, 6 )
	monstercount = monstercount - 1
	LuaFnSetCopySceneData_Param( sceneId, 6, monstercount )						--剩余弟子to� 鸬 数量
	SetMissionByIndex( sceneId, selfId, misIndex, x600037_g_Param_killcount, x600037_g_MonsterCount - monstercount )	--已杀死to� 鸬 怪物数量,仅供客户端使用

	local strText

	if monstercount > 0 then
		strText = format( "C騨 l読 %d k� g鈟 s�", monstercount )
		x600037_NotifyFailTips( sceneId, selfId, strText )
	else
		--设置Nhi甿 v� ho鄋 th鄋h标志
		LuaFnSetCopySceneData_Param( sceneId, 4, 1 )

		strText = format( "Ho鄋 t nhi甿 v�, trong v騨g %d gi鈟 n鎍 s� 疬a 皙n ch� ra v鄌", x600037_g_CloseTick * x600037_g_TickTime )
		x600037_NotifyFailTips( sceneId, selfId, strText )

		if IsHaveMission( sceneId, selfId, x600037_g_UpMissionId ) > 0 then				--父任务设置新阶段
			misIndex = GetMissionIndexByID( sceneId, selfId, x600037_g_UpMissionId )
			SetMissionByIndex( sceneId, selfId, misIndex, 2, 4 )
		end

		--删除玩家任务列表中对应to� 鸬 任务
		DelMission( sceneId, selfId, x600037_g_MissionId )
	end
end

--**********************************
--进入区域事件
--**********************************
function x600037_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x600037_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--副本场景定时器事件
--**********************************
function x600037_OnCopySceneTimer( sceneId, nowTime )

	--副本时钟读取及设置
	local TickCount = LuaFnGetCopySceneData_Param( sceneId, 2 )						--取 餴琺已经执行to� 鸬 定时次数
	TickCount = TickCount + 1
	LuaFnSetCopySceneData_Param( sceneId, 2, TickCount )							--设置新to� 鸬 定时器调用次数

	-- 将 Boss 加强
	if TickCount == 1 then
		local monstercount = GetMonsterCount( sceneId )
		local monsterId
		for i = 0, monstercount - 1 do
			-- 找到 Boss = monsterId
			monsterId = GetMonsterObjID( sceneId, i )
			local GroupID = GetMonsterGroupID( sceneId, monsterId )
			if GroupID == x600037_g_BossGroupId then
				local maxHP = LuaFnGetMaxBaseHp( sceneId, monsterId )
				maxHP = floor( maxHP * 0.3 )
				maxHP = maxHP + LuaFnGetLifeTimeAttrRefix_MaxHP( sceneId, monsterId )
				LuaFnSetLifeTimeAttrRefix_MaxHP( sceneId, monsterId, maxHP )
				RestoreHp( sceneId, monsterId )
				break
			end
		end
	end

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

		if leaveTickCount >= x600037_g_CloseTick then										--倒计时间到,大家都出去吧
			--将当前副本场景里to� 鸬 所有人传送回原来进入时候to� 鸬 场景
			for i=0, membercount-1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					x600037_BackToCity( sceneId, mems[i] )
				end
			end
		else
			--通知当前副本场景里to� 鸬 所有人,场景关闭倒计时间
			local strText = format( "C醕 h� s� r秈 kh鰅 n絠 n鄖 trong v騨g %d gi鈟 n鎍", ( x600037_g_CloseTick - leaveTickCount ) * x600037_g_TickTime )

			for i=0, membercount-1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					x600037_NotifyFailTips( sceneId, mems[i], strText )
				end
			end
		end
	end
end

function x600037_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
