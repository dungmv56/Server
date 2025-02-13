--002937

-- 杀星副本
-- 如意小子临时制作

--************************************************************************
--MisDescBegin
--脚本号
x002937_g_ScriptId = 002937
x002937_g_Name = "枯荣大师"


--MisDescEnd
--************************************************************************
x002937_TIME_2000_01_03_ = 946828868

x002937_g_SceneData_1 = 8   -- 记录副本刷怪到第几批

x002937_g_SceneData_3 = 9	-- 
x002937_g_SceneData_4 = 10	-- 
x002937_g_SceneData_5 = 11	-- 
x002937_g_SceneData_6 = 12	-- 

--x002937_g_SceneData_7 = 13	-- 玩家等级

x002937_g_SD_Monster_1 	 = 14			-- 暂未使用
x002937_g_SD_Monster_1_T = 15			-- 暂未使用


--x002937_g_SD_Monster_2 	 = 16
--x002937_g_SD_Monster_2_T = 17
--x002937_g_SD_Monster_3 	 = 18
--x002937_g_SD_Monster_3_T = 19

--x002937_g_KillMonsCount_Qincheng = 20
--x002937_g_KillMonsCount_Qinjia 	 = 21
--x002937_g_KillMonsCount_Lama		 = 22

-- 关闭副本to� 鸬 时间记录
x002937_g_CloseTime = 25

-- 副本th b読to� 鸬 标记
x002937_g_MissionLost = 26

-- 控制H� th痭g提示to� 鸬 时间
x002937_g_SystemTipsTime = 28

--副本名称
x002937_g_CopySceneName = "生死擂台"
x002937_g_CopySceneType = FUBEN_DAZHAN_SSLT	--副本类型,定义T読 ScriptGlobal.lua里面
x002937_g_CopySceneMap = "shengsileitai.nav"
x002937_g_LimitMembers = 1				--可以进副本to� 鸬 最小队伍人数
x002937_g_TickTime = 1						--回调脚本to� 鸬 时钟时间(单位:  gi鈟/次)
x002937_g_DayTime = 3						--m祎 天内可以进入副本to� 鸬 次数
x002937_g_LimitTotalHoldTime = 360--副本可以存活to� 鸬 时间(单位: 次数),如果此时间到了,则任务将会th b読
x002937_g_LimitTimeSuccess = 500	--副本时间限制(单位: 次数),如果此时间到了,任务完成
x002937_g_CloseTick = 3						--副本关闭前倒计时(单位: 次数)
x002937_g_NoUserTime = 300				--副本中没有人后可以继续保存to� 鸬 时间(单位:  gi鈟)
x002937_g_DeadTrans = 0						--死亡转移模式,0: 死亡后还可以继续T読 副本,1: 死亡后被强制移出副本
x002937_g_Fuben_X = 15						--进入副本to� 鸬 位置X
x002937_g_Fuben_Z = 33						--进入副本to� 鸬 位置Z
x002937_g_Back_X = 253							--源场景位置X
x002937_g_Back_Z = 178						--源场景位置Z
x002937_g_Back_SceneId = 2				--源场景Id

--**********************************
--任务入口函数
--**********************************
function x002937_OnDefaultEvent( sceneId, selfId, targetId )
	
	if GetNumText() == 1   then
		BeginEvent(sceneId)
			--AddText(sceneId,"#{yanziwu_info}");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	if GetName(sceneId, targetId) ~= x002937_g_Name  then
		return
	end

	-- 根据玩家to� 鸬 情况,将玩家送到不同to� 鸬 副本
	-- 2,检测玩家喧ng不喧ng组队了
	if GetTeamSize(sceneId,selfId) < 1  then
		BeginEvent(sceneId)
			AddText(sceneId,"#BKhi陁 chi猲杀星");
			AddText(sceneId,"  此战凶险异常,不足3人我可不敢让你们进入.");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	-- 3,检测玩家喧ng不喧ng队长
	if GetTeamLeader(sceneId,selfId) ~= selfId    then
		BeginEvent(sceneId)
			AddText(sceneId,"#BKhi陁 chi猲杀星");
			AddText(sceneId,"  你必须喧ng队长才行.");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	-- 4,检测喧ng不喧ng人都到位了
	if GetTeamSize(sceneId,selfId) ~= GetNearTeamCount(sceneId,selfId)  then
		BeginEvent(sceneId)
			AddText(sceneId,"#BKhi陁 chi猲杀星");
			AddText(sceneId,"  还有械i vi阯 不T読 附近.");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--5,检测队伍里头to� 鸬 每c醝玩家喧ng不喧ng都到60级了
	local nPlayerNum = GetNearTeamCount(sceneId,selfId)

	for i=0, nPlayerNum-1  do
		local nPlayerId = GetNearTeamMember(sceneId,selfId, i)
		
		if GetLevel(sceneId,nPlayerId) < 60  then
			BeginEvent(sceneId)
				AddText(sceneId,"#BKhi陁 chi猲杀星");
				AddText(sceneId,"  此战凶险异常,不足60级我可不敢让你们进入.");
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			
			return
		end
	end

	-- 每天只能3次
	--MD_SSLT_TIMES		=	244  -- 每天进入Khi陁 chi猲生死擂台to� 鸬 次数
	--MD_PRE_SSLT_TIME	=	245  -- 上m祎 次去Khi陁 chi猲生死擂台to� 鸬 时间

	local strName = {}
	strName[1] = ""
	strName[2] = ""
	strName[3] = ""
	strName[4] = ""
	strName[5] = ""
	strName[6] = ""

	local nPlayerNum = GetNearTeamCount(sceneId,selfId)
	local bOk = 1
	for i=0, nPlayerNum-1  do
		local nPlayerId = GetNearTeamMember(sceneId,selfId, i)
		
		local nTimes = GetMissionData(sceneId,nPlayerId, MD_SSLT_TIMES) 
		local nPreTime = GetMissionData(sceneId,nPlayerId, MD_PRE_SSLT_TIME)
		local nCurTime = LuaFnGetCurrentTime()
		if (nCurTime - nPreTime  >= 3600*24)  or
			 (floor((nCurTime-x002937_TIME_2000_01_03_)/(3600*24)) ~= floor((nPreTime-x002937_TIME_2000_01_03_)/(3600*24)))   then
			nTimes = 0
			nPreTime = nCurTime
			SetMissionData(sceneId, nPlayerId, MD_SSLT_TIMES, nTimes)
			SetMissionData(sceneId, nPlayerId, MD_PRE_SSLT_TIME, nPreTime)
		end
		
		if nTimes >= x002937_g_DayTime then
			bOk = 0
			strName[i+1] = GetName(sceneId, nPlayerId)
		end
		
	end
	local nCount = 0

	if bOk == 0  then
		local szAllName = ""
		for i=1, 6  do
			if strName[i] ~= ""  then
				if nCount == 0  then
					szAllName = strName[i]
				else
					szAllName = szAllName .. "、" .. strName[i]
				end
				nCount = nCount+1
			end
		end
		BeginEvent(sceneId)
			AddText(sceneId,"#BKhi陁 chi猲杀星");
			AddText(sceneId,"  C黙 ng呓i 队伍中" .. szAllName .. "今天已经参加过3次Khi陁 chi猲杀星战役.");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	
	end
	
	-- 所有to� 鸬 检测通过,
	x002937_MakeCopyScene(sceneId, selfId)
	
end

--**********************************
--列举事件
--**********************************
function x002937_OnEnumerate( sceneId, selfId, targetId )
	-- 最好T読 这里做m祎 c醝T阯判定
	if GetName(sceneId, targetId) == x002937_g_Name  then
		AddNumText( sceneId, x002937_g_ScriptId, "Khi陁 chi猲杀星",10 ,-1  )
		AddNumText( sceneId, x002937_g_ScriptId, "关于Khi陁 chi猲杀星",8 ,1  )
	end
end

--**********************************
--检测Ti猵 th跫�
--**********************************
function x002937_CheckAccept( sceneId, selfId )
	
end

--**********************************
--询问玩家喧ng否要进入副本
--**********************************
function x002937_AskEnterCopyScene( sceneId, selfId )
	
end

--**********************************
--Ti猵 th�
--**********************************
function x002937_OnAccept( sceneId, selfId, targetId )
	
end

--**********************************
--玩家同意进入副本
--**********************************
function x002937_AcceptEnterCopyScene( sceneId, selfId )
	
end

--**********************************
--创建副本
--**********************************
function x002937_MakeCopyScene( sceneId, selfId )
	
	-- 使用械i vi阯 to� 鸬 等级来算出怪物to� 鸬 等级
	local param0 = 4;
	local param1 = 3;

	--最终结果
	local mylevel = 0;

	--临时变量
	local memId;
	local tempMemlevel = 0;
	local level0 = 0;
	local level1 = 0;
	local i;
	
	local nearmembercount = GetNearTeamCount(sceneId,selfId)
	for	i = 0, nearmembercount - 1 do
		memId = GetNearTeamMember(sceneId, selfId, i);
		tempMemlevel = GetLevel(sceneId, memId);
		level0 = level0 + (tempMemlevel ^ param0);
		level1 = level1 + (tempMemlevel ^ param1);
	end
	
	if level1 == 0 then
		mylevel = 0
	else
		mylevel = level0/level1;
	end
	
	if nearmembercount == -1  then  --没有队伍
		mylevel = GetLevel(sceneId, selfId)
	end
	
	leaderguid=LuaFnObjId2Guid(sceneId,selfId)
	LuaFnSetSceneLoad_Map(sceneId, "shengsileitai.nav"); --地图喧ng必须选取to� 鸬 ,而且必须T読 Config/SceneInfo.ini里配置好
	LuaFnSetCopySceneData_TeamLeader(sceneId, leaderguid);
	LuaFnSetCopySceneData_NoUserCloseTime(sceneId, x002937_g_NoUserTime*1000);
	LuaFnSetCopySceneData_Timer(sceneId, x002937_g_TickTime*1000);
	LuaFnSetCopySceneData_Param(sceneId, 0, x002937_g_CopySceneType);--设置副本数据,这里将0号索引to� 鸬 数据设置为999,用于表示副本号999(数字自定义)
	LuaFnSetCopySceneData_Param(sceneId, 1, x002937_g_ScriptId);--将1号数据设置为副本场景事件脚本号
	LuaFnSetCopySceneData_Param(sceneId, 2, 0);		--设置定时器调用次数
	LuaFnSetCopySceneData_Param(sceneId, 3, -1);	--设置副本入口场景号, 初始化
	LuaFnSetCopySceneData_Param(sceneId, 4, 0);		--设置副本关闭标志, 0开放,1关闭
	LuaFnSetCopySceneData_Param(sceneId, 5, 0);		--设置离开倒计时次数
	LuaFnSetCopySceneData_Param(sceneId, 6, GetTeamId(sceneId,selfId)); --保存队伍号
	LuaFnSetCopySceneData_Param(sceneId, 7, 0) ;	--杀死Bossto� 鸬 数量
	
	-- 剧情用到to� 鸬 变量清空
	for i=8, 31 do
		LuaFnSetCopySceneData_Param(sceneId, i, 0)
	end
	
	local iniLevel;
	if mylevel < 10 then
		iniLevel = 1;
	elseif mylevel < 100 then
		iniLevel = floor(mylevel/10);
	else
		iniLevel = 10;
	end

	-- 使用第13位,记录怪物实际to� 鸬 等级
	LuaFnSetCopySceneData_Param(sceneId, x002937_g_SceneData_7, mylevel)
	
	--设置场景中to� 鸬 各种Npc和区域
	LuaFnSetSceneLoad_Area( sceneId, "shengsileitai_area.ini" )
	LuaFnSetSceneLoad_Monster( sceneId, "shengsileitai_monster.ini" )

	local bRetSceneID = LuaFnCreateCopyScene(sceneId); --初始化完成后调用创建副本函数
	BeginEvent(sceneId)
		if bRetSceneID>0 then
			AddText(sceneId,"副本创建成功!");
		else
			AddText(sceneId,"副本数量已达上限,请稍后再试!");
		end
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	
end

--**********************************
--副本事件
--**********************************
function x002937_OnCopySceneReady( sceneId, destsceneId )

	--进入副本to� 鸬 规则
	-- 1,如果C醝 n鄖 文件没有组队,就传送C醝 n鄖 玩家自己进入副本
	-- 2, 如果玩家有队伍,但喧ng玩家不喧ng队长,就传送自己进入副本
	-- 3,如果玩家有队伍,并且C醝 n鄖 玩家喧ng队长,就传送自己和附近队友m祎 起进去

	LuaFnSetCopySceneData_Param(destsceneId, 3, sceneId) --设置副本入口场景号
	leaderguid  = LuaFnGetCopySceneData_TeamLeader(destsceneId)
	leaderObjId = LuaFnGuid2ObjId(sceneId,leaderguid)
	
	if LuaFnIsCanDoScriptLogic( sceneId, leaderObjId ) ~= 1 then			-- 处于无法执行逻辑to� 鸬 状态
		return
	end
	
	-- 检测玩家喧ng不喧ng有队伍
	if LuaFnHasTeam( sceneId, leaderObjId ) == 0  then   -- 没有队伍
		x002937_GotoScene(sceneId, leaderObjId, destsceneId)
	else
		if IsCaptain(sceneId, leaderObjId) == 0  then
			x002937_GotoScene(sceneId, leaderObjId, destsceneId)
		else
			local	nearteammembercount = GetNearTeamCount( sceneId, leaderObjId) 
			local mems = {}
			for	i=0,nearteammembercount-1 do
				mems[i] = GetNearTeamMember(sceneId, leaderObjId, i)
				x002937_GotoScene(sceneId, mems[i], destsceneId)
			end
		end
	end

end

function x002937_GotoScene(sceneId, ObjId, destsceneId)
	NewWorld( sceneId, ObjId, destsceneId, x002937_g_Fuben_X, x002937_g_Fuben_Z) ;
end


--**********************************
--有玩家进入副本事件
--**********************************
function x002937_OnPlayerEnter( sceneId, selfId )
	-- 3,设� gi鈟劳鍪录�
	
	-- 设置玩家to� 鸬 阵营为 109
	SetUnitCampID(sceneId, selfId, selfId, 109)
	SetPlayerDefaultReliveInfo( sceneId, selfId, "%10", -1, "0", sceneId, x002937_g_Fuben_X, x002937_g_Fuben_Z )
	
	local nTimes = GetMissionData(sceneId,selfId, MD_SSLT_TIMES) 
	local nPreTime = GetMissionData(sceneId,selfId, MD_PRE_SSLT_TIME)
	local nCurTime = LuaFnGetCurrentTime()
	
	SetMissionData(sceneId, selfId, MD_SSLT_TIMES, nTimes+1) 
	SetMissionData(sceneId, selfId, MD_PRE_SSLT_TIME, nCurTime)
	
end

--**********************************
--有玩家T読 副本中死亡事件
--**********************************
function x002937_OnHumanDie( sceneId, selfId, killerId )
	
end

--**********************************
--放弃
--**********************************
function x002937_OnAbandon( sceneId, selfId )
	
end

--**********************************
--继续
--**********************************
function x002937_OnContinue( sceneId, selfId, targetId )
	
end	

--**********************************
--检测喧ng否可以提交
--**********************************
function x002937_CheckSubmit( sceneId, selfId, selectRadioId )
	
end

--**********************************
--提交
--**********************************
function x002937_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	
end

--**********************************
--杀死怪物或玩家
--**********************************
function x002937_OnDie( sceneId, objId, killerId )
	
end

--**********************************
--提示所有副本内玩家
--**********************************
function x002937_TipAllHuman( sceneId, Str )
	--  鹫t 疬㧟场景里头to� 鸬 所有人
	local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
	
	-- 没有人to� 鸬 场景,什么都不做
	if nHumanNum < 1 then
		return
	end
	
	for i=0, nHumanNum-1  do
		local PlayerId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		BeginEvent(sceneId)
			AddText(sceneId, Str)
		EndEvent(sceneId)
		DispatchMissionTips(sceneId, PlayerId)
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x002937_OnKillObject( sceneId, selfId, objdataId, objId )
	
end

--**********************************
--进入区域事件
--**********************************
function x002937_OnEnterZone( sceneId, selfId, zoneId )
	
end

--**********************************
--道具改变
--**********************************
function x002937_OnItemChanged( sceneId, selfId, itemdataId )
	
end



