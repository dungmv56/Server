--调入宝藏--单人副本
--

--************************************************************************
--MisDescBegin

--脚本号
x229021_g_ScriptId = 229021

--副本名称
x229021_g_CopySceneName="Kho b醬"

--任务号
x229021_g_MissionId = 702

--上m祎 c醝任务to� 鸬 ID
x229021_g_MissionIdPre = 701

--喧ng否喧ngTinh英任务
x229021_g_IfMissionElite = 1

--任务归类
x229021_g_MissionKind = 13

--衅ng c nhi甿 v� 
x229021_g_MissionLevel = 7

--********下面几项喧ng动态显示to� 鸬 内容,用于T読 任务列表中动态显示任务情况******
--循环任务to� 鸬 数据索引,里面存着已做to� 鸬 环数 MD_MURENXIANG_HUAN
--g_MissionRound = 9
--**********************************以上喧ng动态****************************

--任务文本描述
x229021_g_MissionName=""
x229021_g_MissionInfo=""  --任务描述
x229021_g_MissionTarget=""	--M鴆 ti陁 nhi甿 v�
x229021_g_ContinueInfo=""	--未Ho鄋 t nhi甿 v鴗o� 鸬 npc对话
x229021_g_MissionComplete=""	--Ho鄋 t nhi甿 v鴑pc说话to� 鸬 话

--任务奖励
x229021_g_MoneyBonus=1

--MisDescEnd
--************************************************************************

--角色Mission变量� 餴琺�
x229021_g_Param_huan		=0	--0号: 已经完成to� 鸬 环数,T読 接收任务时候赋值
x229021_g_Param_ok			=1	--1号: 当前任务喧ng否完成(0未完成；1完成)
x229021_g_Param_sceneid		=2	--2号: 当前副本任务to� 鸬 场景号
x229021_g_Param_guid		=3	--3号: 接副本任务时候to� 鸬 玩家GUID
x229021_g_Param_killcount	=4	--4号: 杀死任务怪to� 鸬 数量
x229021_g_Param_time		=5	--5号: 完成副本所用时间(单位:  gi鈟)
--6号: 未用
--7号: 未用

x229021_g_CopySceneType=FUBEN_BAOZANG	--副本类型,定义T読 ScriptGlobal.lua里面
x229021_g_LimitMembers=3			--可以进副本to� 鸬 最小队伍人数
x229021_g_TickTime=5				--回调脚本to� 鸬 时钟时间(单位:  gi鈟/次)
x229021_g_LimitTotalHoldTime=36000	--副本可以存活to� 鸬 时间(单位: 次数),如果此时间到了,则任务将会th b読
x229021_g_LimitTimeSuccess=50000		--副本时间限制(单位: 次数),如果此时间到了,任务完成
x229021_g_CloseTick=210				--副本关闭前倒计时(单位: 次数)
x229021_g_NoUserTime=300			--副本中没有人后可以继续保存to� 鸬 时间(单位:  gi鈟)
x229021_g_DeadTrans=0				--死亡转移模式,0: 死亡后还可以继续T読 副本,1: 死亡后被强制移出副本
x229021_g_Fuben_X=23				--进入副本to� 鸬 位置X
x229021_g_Fuben_Z=23				--进入副本to� 鸬 位置Z
x229021_g_Back_X=160				--源场景位置X
x229021_g_Back_Z=150				--源场景位置Z
x229021_g_TotalNeedKill=1000			--C 杀死怪物数量
x229021_g_MissionIdPre=701			--C 提前拥有to� 鸬 任务
x229021_g_CopySceneTotalTime=6000

--**********************************
--任务入口函数
--**********************************
function x229021_OnDefaultEvent( sceneId, selfId, targetId )
end

--**********************************
--列举事件
--**********************************
function x229021_OnEnumerate( sceneId, selfId, targetId )
end

--**********************************
--检测队伍Ti猵 th跫�
--**********************************
function x229021_CheckTeamLeader( sceneId, selfId )
end

--**********************************
--检测Ti猵 th跫�
--**********************************
function x229021_CheckAccept( sceneId, selfId )
	--if IsHaveMission(sceneId,selfId,x229021_g_MissionIdPre) > 0 then
		return 1
	--end
end

--**********************************
--Ti猵 th�
--**********************************
function x229021_OnAccept( sceneId, selfId )
	local selfguid = LuaFnGetGUID( sceneId, selfId)
	x229021_MakeCopyScene( sceneId, selfId, 0 ) ;
end

--**********************************
--放弃
--**********************************
function x229021_OnAbandon( sceneId, selfId )
end

--**********************************
--创建副本
--**********************************
function x229021_MakeCopyScene( sceneId, selfId, nearmembercount )

	--PrintStr("MakeCopyScene")
	local leaderguid=LuaFnObjId2Guid(sceneId,selfId)
	LuaFnSetSceneLoad_Map(sceneId, "muxue.nav"); --地图喧ng必须选取to� 鸬 ,而且必须T読 Config/SceneInfo.ini里配置好
	LuaFnSetCopySceneData_TeamLeader(sceneId, leaderguid);
	LuaFnSetCopySceneData_NoUserCloseTime(sceneId, x229021_g_NoUserTime*1000);
	LuaFnSetCopySceneData_Timer(sceneId, x229021_g_TickTime*1000);
	LuaFnSetCopySceneData_Param(sceneId, 0, x229021_g_CopySceneType);--设置副本数据,这里将0号索引to� 鸬 数据设置为999,用于表示副本号999(数字自定义)
	LuaFnSetCopySceneData_Param(sceneId, 1, x229021_g_ScriptId);--将1号数据设置为副本场景事件脚本号
	LuaFnSetCopySceneData_Param(sceneId, 2, 0);--设置定时器调用次数
	LuaFnSetCopySceneData_Param(sceneId, 3, -1);--设置副本入口场景号, 初始化
	LuaFnSetCopySceneData_Param(sceneId, 4, 0);--设置副本关闭标志, 0开放,1关闭
	LuaFnSetCopySceneData_Param(sceneId, 5, 0);--设置离开倒计时次数
	LuaFnSetCopySceneData_Param(sceneId, 6, leaderguid); --保存玩家号
	LuaFnSetCopySceneData_Param(sceneId, 7, 0) ;--杀死Bossto� 鸬 数量
	--LuaFnSetSceneLoad_Monster(sceneId, "muxue_monster_10.ini")	--7c木人巷捉宠副本

  local PlayerMaxLevel = GetHumanMaxLevelLimit()
	local iniLevel = 0
	local playerLevel = GetLevel(sceneId, selfId)
	if playerLevel < 10 then
		iniLevel = 10
	elseif playerLevel < PlayerMaxLevel then
		iniLevel = floor( playerLevel/10 ) * 10
	else
		iniLevel = PlayerMaxLevel
	end

	LuaFnSetSceneLoad_Monster( sceneId, "muxue_monster_" .. tostring(iniLevel) .. ".ini" )

	LuaFnSetCopySceneData_Param(sceneId, CopyScene_LevelGap, playerLevel - iniLevel) --c别差,CopyScene_LevelGap T読  scene.lua 中赋值

	local bRetSceneID = LuaFnCreateCopyScene(sceneId); --初始化完成后调用创建副本函数
	BeginEvent(sceneId)
		if bRetSceneID>0 then
			AddText(sceneId,"D竎h chuy琻 th鄋h c鬾g!");
		else
			AddText(sceneId,"X鈟 d駈g ph� b鋘 th b読");
		end
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	
end

--**********************************
--继续
--**********************************
function x229021_OnContinue( sceneId, selfId, targetId )

end

--**********************************
--检测喧ng否可以提交
--**********************************
function x229021_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x229021_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

--判断任务喧ng否已经完成

end

--**********************************
--提交
--**********************************
function x229021_OnSubmit( sceneId, selfId, targetId, selectRadioId )

end

--**********************************
--杀死怪物或玩家
--**********************************
function x229021_OnKillObject( sceneId, selfId, objdataId ,objId )
end

--**********************************
--副本事件
--**********************************
function x229021_OnCopySceneReady( sceneId, destsceneId )
	--PrintStr("OnCopySceneReady...")
	LuaFnSetCopySceneData_Param(destsceneId, 3, sceneId);--设置副本入口场景号
	local leaderguid  = LuaFnGetCopySceneData_TeamLeader(destsceneId) ;	
	local leaderObjId = LuaFnGuid2ObjId(sceneId,leaderguid);

	--取 餴琺玩家附近to� 鸬 队友数量(包括自己)
	--local	nearteammembercount = GetNearTeamCount( sceneId, leaderObjId) 
	--PrintNum(nearteammembercount)
	--local mems = {}
	--for	i=0,nearteammembercount-1 do
		--mems[i] = GetNearTeamMember(sceneId, leaderObjId, i)
		--misIndex = GetMissionIndexByID(sceneId,leaderObjId,x229021_g_MissionId)
		
		--将任务to� 鸬 第2号数据设置为副本to� 鸬 场景号
		--SetMissionByIndex(sceneId,leaderObjId,misIndex,x229021_g_Param_sceneid,destsceneId)
	
		--PrintStr("OnCopySceneReady...NewWorld...")			
		NewWorld( sceneId, leaderObjId, destsceneId, x229021_g_Fuben_X, x229021_g_Fuben_Z) ;
	--end
end

--**********************************
--有玩家进入副本事件
--**********************************
function x229021_OnPlayerEnter( sceneId, selfId )
	--设� gi鈟劳龊蟾椿� 餴琺位置
	SetPlayerDefaultReliveInfo( sceneId, selfId, "%10", -1, "0", 2, x229021_g_Fuben_X, x229021_g_Fuben_Z );
end

--**********************************
--有玩家T読 副本中死亡事件
--**********************************
function x229021_OnHumanDie( sceneId, selfId, killerId )
	if x229021_g_DeadTrans==1 then --死亡后C 被强制踢出场景
		local oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3) ;--取 餴琺副本入口场景号
		NewWorld( sceneId, selfId, oldsceneId, x229021_g_Back_X, x229021_g_Back_Z )
	end
end

--**********************************
--副本场景定时器事件
--**********************************
function x229021_OnCopySceneTimer( sceneId, nowTime )
	local leaderguid  = LuaFnGetCopySceneData_TeamLeader(sceneId) ;	
	local leaderObjId = LuaFnGuid2ObjId(sceneId,leaderguid);
	--副本时钟读取及设置
	local TickCount = LuaFnGetCopySceneData_Param(sceneId, 2) ;--取 餴琺已经执行to� 鸬 定时次数
	TickCount = TickCount+1 ;
	LuaFnSetCopySceneData_Param(sceneId, 2, TickCount);--设置新to� 鸬 定时器调用次数
		
	--副本关闭标志
	local leaveFlag = LuaFnGetCopySceneData_Param(sceneId, 4) ;
	
	--离开倒计时间to� 鸬 读取和设置
	local leaveTickCount = LuaFnGetCopySceneData_Param(sceneId, 5) ;
	local leaveTickCount = leaveTickCount+1 ;
	LuaFnSetCopySceneData_Param(sceneId, 5, leaveTickCount) ;
	
	if leaveTickCount == x229021_g_CloseTick then --倒计时间到,大家都出去吧
	
		local oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3) ;--取 餴琺副本入口场景号
		
		--将当前副本场景里to� 鸬 所有人传送回原来进入时候to� 鸬 场景
		local membercount = LuaFnGetCopyScene_HumanCount(sceneId)
		local mems = {}
		for	i=0,membercount-1 do
			mems[i] = LuaFnGetCopyScene_HumanObjId(sceneId,i)
			NewWorld( sceneId, mems[i], oldsceneId, x229021_g_Back_X, x229021_g_Back_Z )
		end
		
	elseif leaveTickCount>x229021_g_CloseTick-4 then
	
		local oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3) ;--取 餴琺副本入口场景号

		--通知当前副本场景里to� 鸬 所有人,场景关闭倒计时间
		local membercount = LuaFnGetCopyScene_HumanCount(sceneId)
		local mems = {}
		for	i=0,membercount-1 do
			mems[i] = LuaFnGetCopyScene_HumanObjId(sceneId,i)
  			BeginEvent(sceneId)
  				local strText = format("C醕 h� s� r秈 kh鰅 疴y sau %d gi鈟!", (x229021_g_CloseTick-leaveTickCount)*x229021_g_TickTime )
  				AddText(sceneId,strText);
  			EndEvent(sceneId)
  			DispatchMissionTips(sceneId,mems[i])
		end
	elseif TickCount == x229021_g_CopySceneTotalTime then
		--设置副本关闭标志
		LuaFnSetCopySceneData_Param(sceneId, 4, 1) ;

	end

end

