--副本任务
--木人

--************************************************************************
--MisDescBegin

--脚本号
x225901_g_ScriptId = 225901

--副本名称
x225901_g_CopySceneName="C痗 鸶a"

--任务号
x225901_g_MissionId = 1086

--目标NPC
x225901_g_Name = ""

--喧ng否喧ngTinh英任务
x225901_g_IfMissionElite = 1

--任务归类
x225901_g_MissionKind = 25

--衅ng c nhi甿 v� 
x225901_g_MissionLevel = 10000

--********下面几项喧ng动态显示to� 鸬 内容,用于T読 任务列表中动态显示任务情况******
--循环任务to� 鸬 数据索引,里面存着已做to� 鸬 环数 MD_MURENXIANG_HUAN
--g_MissionRound =
--**********************************以上喧ng动态****************************

--任务文本描述
x225901_g_MissionName="C痗 鸶a"
x225901_g_MissionInfo="Gi猼 h猼 to鄋 b� qu醝 v, 1 con c鹡g kh鬾g tha!"  --任务描述
x225901_g_MissionTarget="Gi猼 h猼 to鄋 b� qu醝 v. "	--M鴆 ti陁 nhi甿 v�
x225901_g_ContinueInfo="C醕 h� ph鋓 ti猵 t鴆 c� gg nh�!"	--未Ho鄋 t nhi甿 v鴗o� 鸬 npc对话
x225901_g_MissionComplete="C醡 絥. "	--Ho鄋 t nhi甿 v鴑pc说话to� 鸬 话
x225901_g_Parameter_Kill_CountRandom = { { id = 1700082, numNeeded = 6, numKilled = 4 } }

--任务奖励

--MisDescEnd
--************************************************************************

--角色Mission变量� 餴琺�
x225901_g_Param_huan		=0	--0号: 已经完成to� 鸬 环数,T読 接收任务时候赋值
x225901_g_Param_ok			=1	--1号: 当前任务喧ng否完成(0未完成；1完成)
x225901_g_Param_sceneid		=2	--2号: 当前副本任务to� 鸬 场景号
x225901_g_Param_teamid		=3	--3号: 接副本任务时候to� 鸬 队伍号
x225901_g_Param_killcount	=4	--4号: 杀死任务怪to� 鸬 数量
x225901_g_Param_time		=5	--5号: 完成副本所用时间(单位:  gi鈟)
--6号: 未用
--7号: 未用

x225901_g_CopySceneType=FUBEN_GUDI	--副本类型,定义T読 ScriptGlobal.lua里面
x225901_g_LimitMembers=1			--可以进副本to� 鸬 最小队伍人数
x225901_g_TickTime=5				--回调脚本to� 鸬 时钟时间(单位:  gi鈟/次)
x225901_g_LimitTotalHoldTime=360	--副本可以存活to� 鸬 时间(单位: 次数),如果此时间到了,则任务将会th b読
x225901_g_LimitTimeSuccess=500		--副本时间限制(单位: 次数),如果此时间到了,任务完成
x225901_g_CloseTick=6				--副本关闭前倒计时(单位: 次数)
x225901_g_NoUserTime=300			--副本中没有人后可以继续保存to� 鸬 时间(单位:  gi鈟)
x225901_g_DeadTrans=0				--死亡转移模式,0: 死亡后还可以继续T読 副本,1: 死亡后被强制移出副本
x225901_g_Fuben_X=42				--进入副本to� 鸬 位置X
x225901_g_Fuben_Z=47				--进入副本to� 鸬 位置Z
x225901_g_Back_X=61				--源场景位置X
x225901_g_Back_Z=69					--源场景位置Z
x225901_g_TotalNeedKill=10			--C 杀死怪物数量

--**********************************
--任务入口函数
--**********************************
function x225901_OnDefaultEvent( sceneId, selfId, targetId )
	if( IsHaveMission(sceneId,selfId,x225901_g_MissionId) > 0)  then	--如果玩家已经接了C醝 n鄖 任务
		misIndex = GetMissionIndexByID(sceneId,selfId,x225901_g_MissionId)
		bDone = x225901_CheckSubmit( sceneId, selfId )
		if bDone==0 then						--任务未完成
			BeginEvent(sceneId)
				AddText(sceneId,"Nhi甿 v� th b読, xin v裻 b� 瓞 nh nhi甿 v� m緄");
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		elseif bDone==1 then					--任务已经完成
			BeginEvent(sceneId)
				AddText(sceneId,x225901_g_MissionName)
				AddText(sceneId,x225901_g_MissionComplete)
			EndEvent( )
			DispatchMissionDemandInfo(sceneId,selfId,targetId,x225901_g_ScriptId,x225901_g_MissionId,bDone)
		end
   elseif x225901_CheckAccept(sceneId,selfId) > 0 then		--没有任务,Th鯽 m鉵任务接收条件
		--发送任务Ti猵 th毕允総o� 鸬 信息
		BeginEvent(sceneId)
			AddText(sceneId,x225901_g_MissionName)
			AddText(sceneId,x225901_g_MissionInfo)
			AddText(sceneId,"M鴆 ti陁 nhi甿 v�: ")
			AddText(sceneId,x225901_g_MissionTarget)
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x225901_g_ScriptId,x225901_g_MissionId)
				
   end
end

--**********************************
--列举事件
--**********************************
function x225901_OnEnumerate( sceneId, selfId, targetId )
	--如果已接此任务
	if IsHaveMission(sceneId,selfId,x225901_g_MissionId) > 0 then
		AddNumText(sceneId, x225901_g_ScriptId,x225901_g_MissionName);
	--Th鯽 m鉵任务接收条件
  else
		local ret = CallScriptFunction(229000, "IsFubenMission",sceneId, selfId, targetId)
			if ret > 0 then
				AddNumText(sceneId,x225901_g_ScriptId,x225901_g_MissionName,10,0);
			end

    end
end
--**********************************
--检测Ti猵 th跫�
--**********************************
function x225901_CheckAccept( sceneId, selfId )
	if GetMissionCount( sceneId, selfId) >= 20 then	--队友身上任务数量喧ng否达到上限20c醝
		BeginEvent(sceneId)
			AddText(sceneId,"Nhi甿 v� ghi ch閜 c黙 c醕 h� 疸 馥y");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return 0
	elseif IsHaveMission(sceneId,selfId,x225901_g_MissionId)>0 then
		--队友喧ng否已经接过此任务或者另外m祎 c醝任务
		BeginEvent(sceneId)
			AddText(sceneId,"C醕 h� 疸 nh 疬㧟 nhi甿 v� n鄖");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return 0
	end

	return	1
end

--**********************************
--Ti猵 th�
--**********************************
function x225901_OnAccept( sceneId, selfId, targetId )
	if( IsHaveMission(sceneId,selfId,x225901_g_MissionId) > 0)  then	--已经有任务to� 鸬 
		misIndex = GetMissionIndexByID(sceneId,selfId,x225901_g_MissionId)
		copysceneid = GetMissionParam( sceneId, selfId, misIndex, x225901_g_Param_sceneid)
		saveteamid = GetMissionParam( sceneId, selfId, misIndex, x225901_g_Param_teamid)
		
		if copysceneid > 0 then --进过副本
			BeginEvent(sceneId)
				AddText(sceneId,"Nhi甿 v� th b読, xin v裻 b� 瓞 nh nhi甿 v� m緄");
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return 0
		end
	else
		--加入任务到玩家列表
		if x225901_CheckAccept(sceneId,selfId) <= 0 then	--判断接收条件
			return 0
		end

		--给每c醝队伍成员加入任务
		AddMission( sceneId, selfId, x225901_g_MissionId, x225901_g_ScriptId, 1, 0, 0 )

		misIndex = GetMissionIndexByID( sceneId, selfId, x225901_g_MissionId )

		--将任务to� 鸬 第1号数据设置为0,表示未完成to� 鸬 任务
		SetMissionByIndex(sceneId,selfId,misIndex,x225901_g_Param_ok,0)

		--将任务to� 鸬 第2号数据设置为-1, 用于保存副本to� 鸬 场景号
		SetMissionByIndex(sceneId, selfId, misIndex,x225901_g_Param_sceneid,-1)

		SetMissionByIndex(sceneId, selfId,misIndex,6,10)
		
		x225901_MakeCopyScene( sceneId, selfId) ;
	end
	CallScriptFunction(229000, "SetFubenMissionSucc", sceneId, selfId, targetId)
end

--**********************************
--放弃
--**********************************
function x225901_OnAbandon( sceneId, selfId )

	misIndex = GetMissionIndexByID(sceneId,selfId,x225901_g_MissionId)
	local copyscene = GetMissionParam( sceneId, selfId, misIndex, x225901_g_Param_sceneid)

	--删除玩家任务列表中对应to� 鸬 任务
    DelMission( sceneId, selfId, x225901_g_MissionId )

	if sceneId==copyscene then --如果T読 副本里删除任务,则直接传送回
		--BeginEvent(sceneId)
		--	AddText(sceneId,"任务th b読!");
		--EndEvent(sceneId)
		--DispatchMissionTips(sceneId,selfId)

		oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3) ;--取 餴琺副本入口场景号

		NewWorld( sceneId, selfId, oldsceneId, x225901_g_Back_X, x225901_g_Back_Z )
	end
end

--**********************************
--创建副本
--**********************************
function x225901_MakeCopyScene( sceneId, selfId, nearmembercount )

	local mylevel = GetLevel(sceneId, selfId)

	leaderguid=LuaFnObjId2Guid(sceneId,selfId)
	LuaFnSetSceneLoad_Map(sceneId, "gudi.nav"); --地图喧ng必须选取to� 鸬 ,而且必须T読 Config/SceneInfo.ini里配置好
	LuaFnSetCopySceneData_TeamLeader(sceneId, leaderguid);
	LuaFnSetCopySceneData_NoUserCloseTime(sceneId, x225901_g_NoUserTime*1000);
	LuaFnSetCopySceneData_Timer(sceneId, x225901_g_TickTime*1000);
	LuaFnSetCopySceneData_Param(sceneId, 0, x225901_g_CopySceneType);--设置副本数据,这里将0号索引to� 鸬 数据设置为999,用于表示副本号999(数字自定义)
	LuaFnSetCopySceneData_Param(sceneId, 1, x225901_g_ScriptId);--将1号数据设置为副本场景事件脚本号
	LuaFnSetCopySceneData_Param(sceneId, 2, 0);--设置定时器调用次数
	LuaFnSetCopySceneData_Param(sceneId, 3, -1);--设置副本入口场景号, 初始化
	LuaFnSetCopySceneData_Param(sceneId, 4, 0);--设置副本关闭标志, 0开放,1关闭
	LuaFnSetCopySceneData_Param(sceneId, 5, 0);--设置离开倒计时次数
	LuaFnSetCopySceneData_Param(sceneId, 6, GetTeamId(sceneId,selfId)); --保存队伍号
	LuaFnSetCopySceneData_Param(sceneId, 7, 0) ;--杀死Bossto� 鸬 数量

	--Nhi甿 v� s� m鬾....去别to� 鸬 门派to� 鸬 副本任务....40c(含)以上to� 鸬 玩家使用Kinh nghi甿高to� 鸬 怪....
	local isMoreExpFuben = 0
	local iniLevel
	for i, v in MENPAI_SHIMEN_MISID do
		if IsHaveMission(sceneId,selfId,v) > 0 then
			local	misIndex = GetMissionIndexByID(sceneId,selfId,v)
			local missionType = GetMissionParam(sceneId, selfId, misIndex, 1)
			if missionType == 8 and mylevel >= 40 then
				isMoreExpFuben = 1
			end
		end
	end

  local PlayerMaxLevel = GetHumanMaxLevelLimit()
	if isMoreExpFuben == 0 then
		if mylevel < 10 then
			iniLevel = 10
		elseif mylevel < PlayerMaxLevel then
			iniLevel = floor( mylevel/10 ) * 10
		else
			iniLevel = PlayerMaxLevel
		end
		LuaFnSetSceneLoad_Monster( sceneId, "gudi_monster_" .. iniLevel .. ".ini" )
	else
		if mylevel < 50 then
			iniLevel = 40
		elseif mylevel < PlayerMaxLevel then
			iniLevel = floor( mylevel/10 ) * 10
		else
			iniLevel = PlayerMaxLevel
		end
		LuaFnSetSceneLoad_Monster( sceneId, "gudi_20monster_" .. iniLevel .. ".ini" )
	end

	LuaFnSetCopySceneData_Param(sceneId, CopyScene_LevelGap, mylevel - iniLevel) --c别差,CopyScene_LevelGap T読  scene.lua 中赋值

	local bRetSceneID = LuaFnCreateCopyScene(sceneId); --初始化完成后调用创建副本函数
	BeginEvent(sceneId)
		if bRetSceneID>0 then
			AddText(sceneId,"D竎h chuy琻 th鄋h c鬾g!");
		else
			AddText(sceneId,"S� l唼ng b鋘 sao 疸 皙n gi緄 h課, 皤 ngh� l醫 n鎍 th� l読!");
		end
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)

end

--**********************************
--继续
--**********************************
function x225901_OnContinue( sceneId, selfId, targetId )

	misIndex = GetMissionIndexByID(sceneId,selfId,x225901_g_MissionId)
	if	GetMissionParam( sceneId, selfId, misIndex, x225901_g_Param_sceneid)>=1	then
		DispatchMissionContinueInfo(sceneId, selfId, targetId, x225901_g_ScriptId, x225901_g_MissionId)
	end

end

--**********************************
--检测喧ng否可以提交
--**********************************
function x225901_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x225901_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

--判断任务喧ng否已经完成
	misIndex = GetMissionIndexByID(sceneId,selfId,x225901_g_MissionId)
	if	GetMissionParam( sceneId, selfId, misIndex, x225901_g_Param_ok)>=1 then
		return	1
	else
		return	0
	end
end

--**********************************
--提交
--**********************************
function x225901_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x225901_CheckSubmit( sceneId, selfId, selectRadioId )>0 then		--已经Ho鄋 t nhi甿 v�
		--设置任务已经被完成过
		DelMission( sceneId,selfId,  x225901_g_MissionId )

		CallScriptFunction(229000, "SetFubenMissionSucc", sceneId, selfId, targetId)		
		
		BeginEvent(sceneId)
			strText = "#{MPFB_081023_24}"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x225901_OnKillObject( sceneId, selfId, objdataId ,objId )

	--喧ng否喧ng副本
	sceneType = LuaFnGetSceneType(sceneId) ;
	if sceneType~=1 then
		return
	end
	--喧ng否喧ng所C to� 鸬 副本
	fubentype = LuaFnGetCopySceneData_Param(sceneId,0)
	if fubentype~=x225901_g_CopySceneType then
		return
	end
	--副本关闭标志
	leaveFlag = LuaFnGetCopySceneData_Param(sceneId, 4) ;
	if 	leaveFlag==1 then --如果副本已经被置成关闭状态,则杀怪无效
		return
	end

	--取 餴琺当前场景里to� 鸬 人数
	num = LuaFnGetCopyScene_HumanCount(sceneId)

	killednumber = LuaFnGetCopySceneData_Param(sceneId, 7) ;--杀死怪to� 鸬 数量
	killednumber = killednumber+1
	LuaFnSetCopySceneData_Param(sceneId, 7, killednumber) ;--设置杀死怪to� 鸬 数量

	if killednumber<x225901_g_TotalNeedKill then

		BeginEvent(sceneId)
			strText = format("秀 gi猼 ch猼 qu醝 v: %d/%d", killednumber, x225901_g_TotalNeedKill )
			AddText(sceneId,strText);
		EndEvent(sceneId)

		for i=0,num-1 do
			humanObjId = LuaFnGetCopyScene_HumanObjId(sceneId,i)--取 餴琺当前场景里人to� 鸬 objId
			DispatchMissionTips(sceneId,humanObjId)

			misIndex = GetMissionIndexByID(sceneId,humanObjId,x225901_g_MissionId) --取 餴琺任务数据索引值
			local killedcount = GetMissionParam( sceneId, humanObjId, misIndex, x225901_g_Param_killcount) --取 餴琺已经杀了to� 鸬 怪物数
			killedcount = killedcount +1 ;
			SetMissionByIndex(sceneId,humanObjId,misIndex,x225901_g_Param_killcount,killedcount) --设置任务数据
		end
	elseif killednumber>=x225901_g_TotalNeedKill then
		--设置任务完成标志
		LuaFnSetCopySceneData_Param(sceneId, 4, 1)

		--取 餴琺已经执行to� 鸬 定时次数
		TickCount = LuaFnGetCopySceneData_Param(sceneId, 2) ;

		for i=0,num-1 do
			humanObjId = LuaFnGetCopyScene_HumanObjId(sceneId,i)	--取 餴琺当前场景里人to� 鸬 objId
			misIndex = GetMissionIndexByID(sceneId,humanObjId,x225901_g_MissionId)--取 餴琺任务数据索引值

			local killedcount = GetMissionParam( sceneId, humanObjId, misIndex, x225901_g_Param_killcount) --取 餴琺已经杀了to� 鸬 怪物数
			killedcount = killedcount +1 ;
			SetMissionByIndex(sceneId,humanObjId,misIndex,x225901_g_Param_killcount,killedcount) --设置任务数据

			--将任务to� 鸬 第1号数据设置为1,表示完成to� 鸬 任务
			SetMissionByIndex(sceneId,humanObjId,misIndex,x225901_g_Param_ok,1)--设置任务数据
			--完成副本所用时间
			SetMissionByIndex(sceneId,humanObjId,misIndex,x225901_g_Param_time,TickCount*x225901_g_TickTime)--设置任务数据

			BeginEvent(sceneId)
				AddText(sceneId,"Nhi甿 v� ho鄋 th鄋h, c醕 h� 疬㧟 chuy琻 t緄 v� tr� v鄌 c豠");
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,humanObjId)
			
			DelMission( sceneId, humanObjId, x225901_g_MissionId )
			--local oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3) ;--取 餴琺副本入口场景号
			--NewWorld( sceneId, humanObjId, oldsceneId, x225901_g_Back_X, x225901_g_Back_Z )
			
		end
	end
end

--**********************************
--进入区域事件
--**********************************
function x225901_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x225901_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--副本事件
--**********************************
function x225901_OnCopySceneReady( sceneId, destsceneId )

	LuaFnSetCopySceneData_Param(destsceneId, 3, sceneId);--设置副本入口场景号
	leaderguid  = LuaFnGetCopySceneData_TeamLeader(destsceneId) ;
	leaderObjId = LuaFnGuid2ObjId(sceneId,leaderguid);

	misIndex = GetMissionIndexByID(sceneId,leaderObjId,x225901_g_MissionId)

	--将任务to� 鸬 第2号数据设置为副本to� 鸬 场景号
	SetMissionByIndex(sceneId,leaderObjId,misIndex,x225901_g_Param_sceneid,destsceneId)

	NewWorld( sceneId, leaderObjId, destsceneId, x225901_g_Fuben_X, x225901_g_Fuben_Z) ;
end

--**********************************
--有玩家进入副本事件
--**********************************
function x225901_OnPlayerEnter( sceneId, selfId )
	--设� gi鈟劳龊蟾椿� 餴琺位置
	SetPlayerDefaultReliveInfo( sceneId, selfId, "%10", -1, "0", sceneId, x225901_g_Fuben_X, x225901_g_Fuben_Z );
end

--**********************************
--有玩家T読 副本中死亡事件
--**********************************
function x225901_OnHumanDie( sceneId, selfId, killerId )
	if x225901_g_DeadTrans==1 then --死亡后C 被强制踢出场景

		misIndex = GetMissionIndexByID(sceneId,selfId,x225901_g_MissionId)--取 餴琺任务数据索引值

		--将任务to� 鸬 第1号数据设置为1,表示完成to� 鸬 任务
		SetMissionByIndex(sceneId,selfId,misIndex,x225901_g_Param_ok,1)--设置任务数据

		--副本时钟读取及设置
		local TickCount = LuaFnGetCopySceneData_Param(sceneId, 2) ;--取 餴琺已经执行to� 鸬 定时次数

		--完成副本所用时间
		SetMissionByIndex(sceneId,selfId,misIndex,x225901_g_Param_time,TickCount*x225901_g_TickTime)--设置任务数据

		oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3) ;--取 餴琺副本入口场景号
		NewWorld( sceneId, selfId, oldsceneId, x225901_g_Back_X, x225901_g_Back_Z )
	end
end

--**********************************
--副本场景定时器事件
--**********************************
function x225901_OnCopySceneTimer( sceneId, nowTime )

	--副本时钟读取及设置
	TickCount = LuaFnGetCopySceneData_Param(sceneId, 2) ;--取 餴琺已经执行to� 鸬 定时次数
	TickCount = TickCount+1 ;
	LuaFnSetCopySceneData_Param(sceneId, 2, TickCount);--设置新to� 鸬 定时器调用次数

	--副本关闭标志
	leaveFlag = LuaFnGetCopySceneData_Param(sceneId, 4) ;

	if leaveFlag == 1 then --C 离开

		--离开倒计时间to� 鸬 读取和设置
		leaveTickCount = LuaFnGetCopySceneData_Param(sceneId, 5) ;
		leaveTickCount = leaveTickCount+1 ;
		LuaFnSetCopySceneData_Param(sceneId, 5, leaveTickCount) ;

		if leaveTickCount == x225901_g_CloseTick then --倒计时间到,大家都出去吧

			oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3) ;--取 餴琺副本入口场景号

			--将当前副本场景里to� 鸬 所有人传送回原来进入时候to� 鸬 场景
			local membercount = LuaFnGetCopyScene_HumanCount(sceneId)
			local mems = {}
			for	i=0,membercount-1 do
				mems[i] = LuaFnGetCopyScene_HumanObjId(sceneId,i)
				NewWorld( sceneId, mems[i], oldsceneId, x225901_g_Back_X, x225901_g_Back_Z )
			end

		elseif leaveTickCount<x225901_g_CloseTick then

			oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3) ;--取 餴琺副本入口场景号

			--通知当前副本场景里to� 鸬 所有人,场景关闭倒计时间
			local membercount = LuaFnGetCopyScene_HumanCount(sceneId)
			local mems = {}
			for	i=0,membercount-1 do
				mems[i] = LuaFnGetCopyScene_HumanObjId(sceneId,i)
				if LuaFnIsObjValid(sceneId, mems[i]) == 1 and LuaFnIsCanDoScriptLogic(sceneId, mems[i]) == 1 then
	  			BeginEvent(sceneId)
	  				strText = format("C醕 h� s� r秈 kh鰅 疴y sau %d gi鈟!", (x225901_g_CloseTick-leaveTickCount)*x225901_g_TickTime )
	  				AddText(sceneId,strText);
	  			EndEvent(sceneId)
	  			DispatchMissionTips(sceneId,mems[i])
	  		end
			end
		end
	elseif TickCount == x225901_g_LimitTimeSuccess then
		--此处设置有时间限制to� 鸬 任务完成处理
		local membercount = LuaFnGetCopyScene_HumanCount(sceneId)
		local mems = {}
		for	i=0,membercount-1 do
			mems[i] = LuaFnGetCopyScene_HumanObjId(sceneId,i)
			if LuaFnIsObjValid(sceneId, mems[i]) == 1 and LuaFnIsCanDoScriptLogic(sceneId, mems[i]) == 1 then
  			BeginEvent(sceneId)
  				AddText(sceneId,"Th秈 gian ho鄋 t nhi甿 v� 疸 t緄, ho鄋 th鄋h!");
  			EndEvent(sceneId)
  			DispatchMissionTips(sceneId,mems[i])
  		end

			misIndex = GetMissionIndexByID(sceneId,mems[i],x225901_g_MissionId)--取 餴琺任务数据索引值
			--将任务to� 鸬 第1号数据设置为1,表示完成to� 鸬 任务
			SetMissionByIndex(sceneId,mems[i],misIndex,x225901_g_Param_ok,1)--设置任务数据
			--完成副本所用时间
			SetMissionByIndex(sceneId,mems[i],misIndex,x225901_g_Param_time,TickCount*x225901_g_TickTime)--设置任务数据
		end

		--设置副本关闭标志
		LuaFnSetCopySceneData_Param(sceneId, 4, 1) ;

	elseif TickCount == x225901_g_LimitTotalHoldTime then --副本总时间限制到了
		--此处设置副本任务有时间限制to� 鸬 情况,当时间到后处理...
		local membercount = LuaFnGetCopyScene_HumanCount(sceneId)
		local mems = {}
		for	i=0,membercount-1 do
			mems[i] = LuaFnGetCopyScene_HumanObjId(sceneId,i)
			DelMission( sceneId, mems[i], x225901_g_MissionId );--任务th b読,删除之
			if LuaFnIsObjValid(sceneId, mems[i]) == 1 and LuaFnIsCanDoScriptLogic(sceneId, mems[i]) == 1 then
  			BeginEvent(sceneId)
  				AddText(sceneId,"Nhi甿 v� th b読, qu� gi�!");
  			EndEvent(sceneId)
  			DispatchMissionTips(sceneId,mems[i])
  		end
		end

		--设置副本关闭标志
		LuaFnSetCopySceneData_Param(sceneId, 4, 1) ;

	end
end


