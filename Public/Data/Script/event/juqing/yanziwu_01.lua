-- T読 老顾帮助下进入夜间to� 鸬 Y猲 T� �

--************************************************************************
--MisDescBegin
--脚本号
x200011_g_ScriptId = 200011

--MisDescEnd
--************************************************************************

--副本名称
x200011_g_CopySceneName = "Y猲 T� �"

x200011_g_CopySceneType = FUBEN_JUQING	--副本类型,定义T読 ScriptGlobal.lua里面

x200011_g_CopySceneMap = "yanzi_1.nav"
x200011_g_Exit = "yanzi_1.ini"
x200011_g_LimitMembers = 1				--可以进副本to� 鸬 最小队伍人数
x200011_g_TickTime = 5					--回调脚本to� 鸬 时钟时间(单位:  gi鈟/次)
x200011_g_LimitTotalHoldTime = 360		--副本可以存活to� 鸬 时间(单位: 次数),如果此时间到了,则任务将会th b読
x200011_g_LimitTimeSuccess = 500		--副本时间限制(单位: 次数),如果此时间到了,任务完成
x200011_g_CloseTick = 3					--副本关闭前倒计时(单位: 次数)
x200011_g_NoUserTime = 300				--副本中没有人后可以继续保存to� 鸬 时间(单位:  gi鈟)
x200011_g_DeadTrans = 0					--死亡转移模式,0: 死亡后还可以继续T読 副本,1: 死亡后被强制移出副本
x200011_g_Fuben_X = 108					--进入副本to� 鸬 位置X
x200011_g_Fuben_Z = 104					--进入副本to� 鸬 位置Z
x200011_g_Back_X = 66					--源场景位置X
x200011_g_Back_Z = 56					--源场景位置Z

--**********************************
--任务入口函数
--**********************************
function x200011_OnDefaultEvent( sceneId, selfId, targetId )
	-- 根据玩家to� 鸬 情况,将玩家送到不同to� 鸬 副本
	x200011_MakeCopyScene(sceneId, selfId)
end


--**********************************
--列举事件
--**********************************
function x200011_OnEnumerate( sceneId, selfId, targetId )

	--检查玩家身上喧ng不喧ng有C醝 n鄖 任务
	-- 0,如果玩家完成了12,或者有了13.直接退出
	if IsHaveMission( sceneId, selfId, 13 ) > 0 then
		return 0
	end
	
	if IsHaveMission( sceneId, selfId, 12 ) > 0 then
		return 0
	end
	
	if IsMissionHaveDone(sceneId, selfId, 12) > 0   then
		return 0
	end
	
	-- 1,玩家有10C醝 n鄖 任务可以进入
	if IsHaveMission( sceneId, selfId, 10 ) > 0 then
		AddNumText( sceneId, x200011_g_ScriptId, "H銀 疬a ta t緄 Y猲 T� � (痍m)", 10 ,-1  )
		return 0
	end
	
	-- 2,玩家有11C醝 n鄖 任务,可以进入
	if IsHaveMission( sceneId, selfId, 11 ) > 0 then
		AddNumText( sceneId, x200011_g_ScriptId, "H銀 疬a ta t緄 Y猲 T� � (痍m)", 10 ,-1  )
		return 0
	end
	
	-- 3,玩家完成10,没有11,12,可以进入
	if IsMissionHaveDone(sceneId, selfId, 10) > 0   then
		if IsHaveMission(sceneId, selfId, 11) < 1   then
			AddNumText( sceneId, x200011_g_ScriptId, "H銀 疬a ta t緄 Y猲 T� � (痍m)", 10 ,-1  )
			return 0
		end
		if IsHaveMission(sceneId, selfId, 12) < 1   then
			AddNumText( sceneId, x200011_g_ScriptId, "H銀 疬a ta t緄 Y猲 T� � (痍m)", 10 ,-1  )
			return 0
		end
	end

end

--**********************************
--检测Ti猵 th跫�
--**********************************
function x200011_CheckAccept( sceneId, selfId )
	
end

--**********************************
--询问玩家喧ng否要进入副本
--**********************************
function x200011_AskEnterCopyScene( sceneId, selfId )
	
end

--**********************************
--Ti猵 th�
--**********************************
function x200011_OnAccept( sceneId, selfId, targetId )
	
end

--**********************************
--玩家同意进入副本
--**********************************
function x200011_AcceptEnterCopyScene( sceneId, selfId )
	
end

--**********************************
--创建副本
--**********************************
function x200011_MakeCopyScene( sceneId, selfId )

	leaderguid=LuaFnObjId2Guid(sceneId,selfId)
	LuaFnSetSceneLoad_Map(sceneId, "yanzi_1.nav"); --地图喧ng必须选取to� 鸬 ,而且必须T読 Config/SceneInfo.ini里配置好
	LuaFnSetCopySceneData_TeamLeader(sceneId, leaderguid);
	LuaFnSetCopySceneData_NoUserCloseTime(sceneId, x200011_g_NoUserTime*1000);
	LuaFnSetCopySceneData_Timer(sceneId, x200011_g_TickTime*1000);
	LuaFnSetCopySceneData_Param(sceneId, 0, x200011_g_CopySceneType);--设置副本数据,这里将0号索引to� 鸬 数据设置为999,用于表示副本号999(数字自定义)
	LuaFnSetCopySceneData_Param(sceneId, 1, x200011_g_ScriptId);--将1号数据设置为副本场景事件脚本号
	LuaFnSetCopySceneData_Param(sceneId, 2, 0);--设置定时器调用次数
	LuaFnSetCopySceneData_Param(sceneId, 3, -1);--设置副本入口场景号, 初始化
	LuaFnSetCopySceneData_Param(sceneId, 4, 0);--设置副本关闭标志, 0开放,1关闭
	LuaFnSetCopySceneData_Param(sceneId, 5, 0);--设置离开倒计时次数
	LuaFnSetCopySceneData_Param(sceneId, 6, GetTeamId(sceneId,selfId)); --保存队伍号
	LuaFnSetCopySceneData_Param(sceneId, 7, 0) ;--杀死Bossto� 鸬 数量

	-- 剧情用到to� 鸬 变量清空
	for i=8, 31 do
		LuaFnSetCopySceneData_Param(sceneId, i, 0)
	end

	LuaFnSetSceneLoad_Area( sceneId, "yanzi_1_area.ini" )
	LuaFnSetSceneLoad_Monster( sceneId, "yanzi_1_monster.ini" )

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
--副本事件
--**********************************
function x200011_OnCopySceneReady( sceneId, destsceneId )

	--进入副本to� 鸬 规则
	-- 1,如果C醝 n鄖 文件没有组队,就传送C醝 n鄖 文件自己进入副本
	-- 2, 如果玩家有队伍,但喧ng玩家不喧ng队长,就传送自己进入副本
	-- 3,如果玩家有队伍,并且C醝 n鄖 晚间喧ng队长,就传送自己和附近队友m祎 起进去

	LuaFnSetCopySceneData_Param(destsceneId, 3, sceneId);--设置副本入口场景号
	leaderguid  = LuaFnGetCopySceneData_TeamLeader(destsceneId) ;	
	leaderObjId = LuaFnGuid2ObjId(sceneId,leaderguid);
	
	if LuaFnIsCanDoScriptLogic( sceneId, leaderObjId ) ~= 1 then			-- 处于无法执行逻辑to� 鸬 状态
		return
	end

	-- 检测玩家喧ng不喧ng有队伍
	if LuaFnHasTeam( sceneId, leaderObjId ) == 0  then   -- 没有队伍
		NewWorld( sceneId, leaderObjId, destsceneId, x200011_g_Fuben_X, x200011_g_Fuben_Z) ;
	else
		if IsCaptain(sceneId, leaderObjId) == 0  then
			NewWorld( sceneId, leaderObjId, destsceneId, x200011_g_Fuben_X, x200011_g_Fuben_Z) ;
		else
			local	nearteammembercount = GetNearTeamCount( sceneId, leaderObjId) 
			local mems = {}
			for	i=0,nearteammembercount-1 do
				mems[i] = GetNearTeamMember(sceneId, leaderObjId, i)
				NewWorld( sceneId, mems[i], destsceneId, x200011_g_Fuben_X, x200011_g_Fuben_Z) ;
			end
		end		
	end

end

--**********************************
--有玩家进入副本事件
--**********************************
function x200011_OnPlayerEnter( sceneId, selfId )
	
end

--**********************************
--有玩家T読 副本中死亡事件
--**********************************
function x200011_OnHumanDie( sceneId, selfId, killerId )
	
end

--**********************************
--放弃
--**********************************
function x200011_OnAbandon( sceneId, selfId )
	
end

--**********************************
-- 回城,只有Th鄋h ph� 任务副本可以调用此接口
--**********************************
function x200011_BackToCity( sceneId, selfId )
	
end

--**********************************
--继续
--**********************************
function x200011_OnContinue( sceneId, selfId, targetId )
	
end	

--**********************************
--检测喧ng否可以提交
--**********************************
function x200011_CheckSubmit( sceneId, selfId, selectRadioId )
	
end

--**********************************
--提交
--**********************************
function x200011_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	
end

--**********************************
--杀死怪物或玩家
--**********************************
function x200011_OnKillObject( sceneId, selfId, objdataId, objId )

end

--**********************************
--进入区域事件
--**********************************
function x200011_OnEnterZone( sceneId, selfId, zoneId )
	
end

--**********************************
--道具改变
--**********************************
function x200011_OnItemChanged( sceneId, selfId, itemdataId )
	
end

--**********************************
--副本场景定时器事件
--**********************************
function x200011_OnCopySceneTimer( sceneId, nowTime )
	
end

