--剧情任务
--万劫谷,夜间

-- T読 华赫艮to� 鸬 帮助下进入万劫谷,T読 万劫谷中找人打听衞鄋 D駎o� 鸬 消息.
-- 队长可以带自己to� 鸬 小队去完成C醝 n鄖 任务,只要队长有C醝 n鄖 任务就可以,
-- 械i vi阯 只能独自进入副本,单独完成C醝 n鄖 任务

--************************************************************************
--MisDescBegin
--脚本号
x200001_g_ScriptId = 200001

--MisDescEnd
--************************************************************************

--副本名称
x200001_g_CopySceneName = "V課 Ki猵 C痗"

x200001_g_CopySceneType = FUBEN_JUQING	--副本类型,定义T読 ScriptGlobal.lua里面

x200001_g_CopySceneMap = "wanjie_1.nav"
x200001_g_Exit = "wanjie_1.ini"
x200001_g_LimitMembers = 1				--可以进副本to� 鸬 最小队伍人数
x200001_g_TickTime = 5					--回调脚本to� 鸬 时钟时间(单位:  gi鈟/次)
x200001_g_LimitTotalHoldTime = 360		--副本可以存活to� 鸬 时间(单位: 次数),如果此时间到了,则任务将会th b読
x200001_g_LimitTimeSuccess = 500		--副本时间限制(单位: 次数),如果此时间到了,任务完成
x200001_g_CloseTick = 3					--副本关闭前倒计时(单位: 次数)
x200001_g_NoUserTime = 300				--副本中没有人后可以继续保存to� 鸬 时间(单位:  gi鈟)
x200001_g_DeadTrans = 0					--死亡转移模式,0: 死亡后还可以继续T読 副本,1: 死亡后被强制移出副本
x200001_g_Fuben_X = 108					--进入副本to� 鸬 位置X
x200001_g_Fuben_Z = 115					--进入副本to� 鸬 位置Z
x200001_g_Back_X = 66					--源场景位置X
x200001_g_Back_Z = 56					--源场景位置Z

--**********************************
--任务入口函数
--**********************************
function x200001_OnDefaultEvent( sceneId, selfId, targetId )
	-- 根据玩家to� 鸬 情况,将玩家送到不同to� 鸬 副本
	x200001_MakeCopyScene(sceneId, selfId)
end

--**********************************
--列举事件
--**********************************
function x200001_OnEnumerate( sceneId, selfId, targetId )
	-- 0,如果玩家已经有4任务,就不能T読 进入C醝 n鄖 副本
	if IsHaveMission( sceneId, selfId, 4 ) > 0 then
		return 0
	end
	if IsMissionHaveDone(sceneId, selfId, 4) > 0   then
		return 0
	end

	-- 1,拥有任务号为2to� 鸬 任务,
	if IsHaveMission( sceneId, selfId, 2 ) > 0 then
		AddNumText( sceneId, x200001_g_ScriptId, "H銀 疬a ta t緄 V課 Ki猵 C痗 (痍m)", 10 ,-1  )
		return 0
	end

	-- 2,只要玩家有3任务,就能进入
	if IsHaveMission( sceneId, selfId, 3 ) > 0 then
		AddNumText( sceneId, x200001_g_ScriptId, "H銀 疬a ta t緄 V課 Ki猵 C痗 (痍m)", 10 ,-1  )
		return 0
	end
	
	-- 3,如果玩家完成了2,没有3,也能进入
	if IsMissionHaveDone(sceneId, selfId, 2) > 0   then
		if IsHaveMission( sceneId, selfId, 3 ) < 1 then
			AddNumText( sceneId, x200001_g_ScriptId, "H銀 疬a ta t緄 V課 Ki猵 C痗 (痍m)", 10 ,-1  )
			return 0
		end
	end
	
	-- 4,如果玩家完成了3,但喧ng没有4,也喧ng可以进入
	if IsMissionHaveDone(sceneId, selfId, 3) > 0   then
		if IsHaveMission( sceneId, selfId, 4 ) < 1 then
			AddNumText( sceneId, x200001_g_ScriptId, "H銀 疬a ta t緄 V課 Ki猵 C痗 (痍m)", 10 ,-1  )
			return 0
		end
	end
end

--**********************************
--检测Ti猵 th跫�
--**********************************
function x200001_CheckAccept( sceneId, selfId )
	
end

--**********************************
--询问玩家喧ng否要进入副本
--**********************************
function x200001_AskEnterCopyScene( sceneId, selfId )
	
end

--**********************************
--Ti猵 th�
--**********************************
function x200001_OnAccept( sceneId, selfId, targetId )
	
end

--**********************************
--玩家同意进入副本
--**********************************
function x200001_AcceptEnterCopyScene( sceneId, selfId )
	
end

--**********************************
--创建副本
--**********************************
function x200001_MakeCopyScene( sceneId, selfId )

	leaderguid=LuaFnObjId2Guid(sceneId,selfId)
	LuaFnSetSceneLoad_Map(sceneId, "wanjie_1.nav"); --地图喧ng必须选取to� 鸬 ,而且必须T読 Config/SceneInfo.ini里配置好
	LuaFnSetCopySceneData_TeamLeader(sceneId, leaderguid);
	LuaFnSetCopySceneData_NoUserCloseTime(sceneId, x200001_g_NoUserTime*1000);
	LuaFnSetCopySceneData_Timer(sceneId, x200001_g_TickTime*1000);
	LuaFnSetCopySceneData_Param(sceneId, 0, x200001_g_CopySceneType);--设置副本数据,这里将0号索引to� 鸬 数据设置为999,用于表示副本号999(数字自定义)
	LuaFnSetCopySceneData_Param(sceneId, 1, x200001_g_ScriptId);--将1号数据设置为副本场景事件脚本号
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

	--设置场景中to� 鸬 各种Npc和区域
	LuaFnSetSceneLoad_Area( sceneId, "wanjie_1_area.ini" )
	LuaFnSetSceneLoad_Monster( sceneId, "wanjie_1_monster.ini" )

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
function x200001_OnCopySceneReady( sceneId, destsceneId )

	--进入副本to� 鸬 规则
	-- 1,如果C醝 n鄖 文件没有组队,就传送C醝 n鄖 文件自己进入副本
	-- 2, 如果玩家有队伍,但喧ng玩家不喧ng队长,就传送自己进入副本
	-- 3,如果玩家有队伍,并且C醝 n鄖 晚间喧ng队长,就传送自己和附近队友m祎 起进去

	LuaFnSetCopySceneData_Param(destsceneId, 3, sceneId) --设置副本入口场景号
	leaderguid  = LuaFnGetCopySceneData_TeamLeader(destsceneId)
	leaderObjId = LuaFnGuid2ObjId(sceneId,leaderguid)

	if LuaFnIsCanDoScriptLogic( sceneId, leaderObjId ) ~= 1 then			-- 处于无法执行逻辑to� 鸬 状态
		return
	end
	
	-- 检测玩家喧ng不喧ng有队伍
	if LuaFnHasTeam( sceneId, leaderObjId ) == 0  then   -- 没有队伍
		NewWorld( sceneId, leaderObjId, destsceneId, x200001_g_Fuben_X, x200001_g_Fuben_Z) ;
	else
		if IsCaptain(sceneId, leaderObjId) == 0  then
			NewWorld( sceneId, leaderObjId, destsceneId, x200001_g_Fuben_X, x200001_g_Fuben_Z) ;
		else
			local	nearteammembercount = GetNearTeamCount( sceneId, leaderObjId) 
			local mems = {}
			for	i=0,nearteammembercount-1 do
				mems[i] = GetNearTeamMember(sceneId, leaderObjId, i)
				
				NewWorld( sceneId, mems[i], destsceneId, x200001_g_Fuben_X, x200001_g_Fuben_Z) ;
			end
		end		
	end

end

--**********************************
--有玩家进入副本事件
--**********************************
function x200001_OnPlayerEnter( sceneId, selfId )
	
end

--**********************************
--有玩家T読 副本中死亡事件
--**********************************
function x200001_OnHumanDie( sceneId, selfId, killerId )
	
end

--**********************************
--放弃
--**********************************
function x200001_OnAbandon( sceneId, selfId )
	
end

--**********************************
-- 回城,只有Th鄋h ph� 任务副本可以调用此接口
--**********************************
function x200001_BackToCity( sceneId, selfId )
	
end

--**********************************
--继续
--**********************************
function x200001_OnContinue( sceneId, selfId, targetId )
	
end	

--**********************************
--检测喧ng否可以提交
--**********************************
function x200001_CheckSubmit( sceneId, selfId, selectRadioId )
	
end

--**********************************
--提交
--**********************************
function x200001_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	
end

--**********************************
--杀死怪物或玩家
--**********************************
function x200001_OnKillObject( sceneId, selfId, objdataId, objId )

end

--**********************************
--进入区域事件
--**********************************
function x200001_OnEnterZone( sceneId, selfId, zoneId )
	
end

--**********************************
--道具改变
--**********************************
function x200001_OnItemChanged( sceneId, selfId, itemdataId )
	
end

--**********************************
--副本场景定时器事件
--**********************************
function x200001_OnCopySceneTimer( sceneId, nowTime )
--PrintNum(111)
	local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
	
	-- 没有人to� 鸬 场景,什么都不做
	if nHumanNum < 1 then
		return
	end
	
	local selfId = LuaFnGetCopyScene_HumanObjId(sceneId,0)
	local nStep1 = LuaFnGetCopySceneData_Param(sceneId, 8) --控制说话
	local nTime  = LuaFnGetCopySceneData_Param(sceneId, 9)	--时间
	-- paopao 
	local nStep2 = LuaFnGetCopySceneData_Param(sceneId, 10) --控制说过话
	
	-- 微笑之旅 护送完成后 
	if nStep1==1 then

		if nStep2==0    	then
			CallScriptFunction((200060), "Paopao",sceneId, "Chung Linh ", "V課 Ki猵 C痗", "#{JQ_PaoPao_66}")
			LuaFnSetCopySceneData_Param(sceneId, 10, 1)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)

		elseif nStep2==1  then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 10, 2)
			end

		elseif nStep2==2    	then
			CallScriptFunction((200060), "Paopao",sceneId, "Chung Linh ", "V課 Ki猵 C痗", "#{JQ_PaoPao_67}")
			LuaFnSetCopySceneData_Param(sceneId, 10, 3)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)
			
		end
	end

	local nJuqingStep = LuaFnGetCopySceneData_Param(sceneId, 11)
	local targetId = LuaFnGetCopySceneData_Param(sceneId, 12)
	if nJuqingStep == 1  then
		LuaFnSetCopySceneData_Param(sceneId, 11, 2)
		for i=0, 	nHumanNum-1  do
			local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId,i)
			
			-- 调用接任务to� 鸬 语句
			CallScriptFunction((200003), "OnDefaultEvent",sceneId, nHumanId, targetId )
		end
		LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)

		-- T読 这里添加m祎 些NPCto� 鸬 paopao,使 餴琺剧情看上去更加衔接m祎 些
		CallScriptFunction((200060), "Paopao",sceneId, "Chung Linh ", "V課 Ki猵 C痗", "#{juqing_start_001}")
		LuaFnSetCopySceneData_Param(sceneId, 11, 3)
		
		--elseif nJuqingStep == 2  then

	elseif nJuqingStep == 3  then
		
		-- T読 这里添加m祎 些NPCto� 鸬 paopao,使 餴琺剧情看上去更加衔接m祎 些
		CallScriptFunction((200060), "Paopao",sceneId, "Chung Linh ", "V課 Ki猵 C痗", "#{juqing_start_002}")
		LuaFnSetCopySceneData_Param(sceneId, 11, 4)

	elseif nJuqingStep == 4  then
		
		-- T読 这里添加m祎 些NPCto� 鸬 paopao,使 餴琺剧情看上去更加衔接m祎 些
		CallScriptFunction((200060), "Paopao",sceneId, "Chung Linh ", "V課 Ki猵 C痗", "#{juqing_start_003}")
		LuaFnSetCopySceneData_Param(sceneId, 11, 5)
		
	elseif nJuqingStep == 5  then
		-- 调整Npc属性,阵营
		SetUnitReputationID(sceneId, selfId, targetId, 0)
		SetMonsterFightWithNpcFlag(sceneId, targetId, 1)

		SetPatrolId(sceneId, targetId, 0)
		LuaFnSetCopySceneData_Param(sceneId, 11, 6)
		
	elseif nJuqingStep == 6  then  --检测护送对象喧ng不喧ng到了
		local targetX, targetZ = GetWorldPos(sceneId, targetId)
		local patrolPathIndex = 0
		local x, z = GetLastPatrolPoint(sceneId, patrolPathIndex)
		local distance2 = floor(sqrt((targetX-x)*(targetX-x)+(targetZ-z)*(targetZ-z)))
		if distance2 <= 1 then
			LuaFnSetCopySceneData_Param(sceneId, 11, 7)
			
			-- 通知副本内to� 鸬 所有人,剧情完成
			for i=0, 	nHumanNum-1  do
				local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId,i)
			  BeginEvent(sceneId)
			  	AddText(sceneId, "Ho鄋 th鄋h t靚h ti猼\"Vi Ti猽 Chi L鎈"")
			  EndEvent()
			  DispatchMissionTips(sceneId, nHumanId)
			  
			  -- 给有C醝 n鄖 任务to� 鸬 人加上完成标志
			  if IsHaveMission(sceneId, nHumanId, 3) > 0 then
					local misIndex = GetMissionIndexByID(sceneId,nHumanId,3)
					SetMissionByIndex( sceneId, nHumanId, misIndex, 0, 1)
					SetMissionByIndex( sceneId, nHumanId, misIndex, 1, 1)
			  end
			end
			LuaFnSetCopySceneData_Param(sceneId, 8, 1)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)
		end
	end
end

