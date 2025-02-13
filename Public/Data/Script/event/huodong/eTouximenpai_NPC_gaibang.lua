--副本任务
--牧场
--

--************************************************************************
--MisDescBegin
--脚本号
x808032_g_ScriptId	= 808032
--副本名称
x808032_g_CopySceneName	= "C醝 Bang T眓g 朽"
--任务号
x808032_g_MissionId			= 1250
--上m祎 c醝任务to� 鸬 ID
x808032_g_MissionIdPre	= 0
--目标NPC
x808032_g_Name					= "嗅nh l閚 m鬾 ph醝"
--喧ng否喧ngTinh英任务
x808032_g_IfMissionElite= 1
--衅ng c nhi甿 v� 
x808032_g_MissionLevel	= 10000
--任务归类
x808032_g_MissionKind		= 1
--任务文本描述
x808032_g_MissionName			= "嗅nh l閚 m鬾 ph醝"
--任务描述
x808032_g_MissionInfo			= "  "
--M鴆 ti陁 nhi甿 v�
x808032_g_MissionTarget		= "  Gi猼 h猼 qu醝 v li玭 c� th� ho鄋 t nhi甿 v�"
--未Ho鄋 t nhi甿 v鴗o� 鸬 npc对话
x808032_g_ContinueInfo		= "  "
--Ho鄋 t nhi甿 v鴑pc说话to� 鸬 话
x808032_g_MissionComplete	= "  "

--********下面几项喧ng动态显示to� 鸬 内容,用于T読 任务列表中动态显示任务情况******
--循环任务to� 鸬 数据索引,里面存着已做to� 鸬 环数 MD_SHUILAO_HUAN
--任务喧ng否已经完成
--**********************************以上喧ng动态****************************
--角色Mission变量� 餴琺�
x808032_g_Param_IsMissionOkFail	= 0						--0号: 当前任务喧ng否完成(0未完成；1完成)
x808032_g_Param_killmonstercount	= 1					--1号: 杀死任务小怪to� 鸬 数量
x808032_g_Param_killbosscount	= 2							--2号: 杀死任务boss怪to� 鸬 数量
x808032_g_Param_sceneid		= 3									--3号: 当前副本任务to� 鸬 场景号
x808032_g_Param_teamid		= 4									--4号: 接副本任务时候to� 鸬 队伍号
x808032_g_Param_time			= 5									--5号: 完成副本所用时间(单位:  gi鈟)
																							--6号: 具体副本事件脚本占用
																							--7号: 具体副本事件脚本占用
--MisDescEnd
--************************************************************************

x808032_g_CopySceneType			= FUBEN_GAIBANG1	--副本类型,定义T読 ScriptGlobal.lua里面
x808032_g_LimitMembers			= 1		--可以进副本to� 鸬 最小队伍人数
x808032_g_TickTime					= 5		--回调脚本to� 鸬 时钟时间(单位:  gi鈟/次)
x808032_g_LimitTotalHoldTime= 360	--副本可以存活to� 鸬 时间(单位: 次数),如果此时间到了,则任务将会th b読
x808032_g_LimitTimeSuccess	= 500	--副本时间限制(单位: 次数),如果此时间到了,任务完成
x808032_g_CloseTick					= 6		--副本关闭前倒计时(单位: 次数)
x808032_g_NoUserTime				= 300	--副本中没有人后可以继续保存to� 鸬 时间(单位:  gi鈟)
x808032_g_Fuben_X						= 92	--进入副本to� 鸬 位置X
x808032_g_Fuben_Z						= 153	--进入副本to� 鸬 位置Z
x808032_g_Back_X						= 92	--源场景位置X
x808032_g_Back_Z						= 153	--源场景位置Z
x808032_g_Totalkillmonstercount	= 30	--C 杀死monster数量
x808032_g_Totalkillbosscount	= 1	--C 杀死Boss数量

--副本数据索引对照
x808032_g_keySD					= {}
x808032_g_keySD["typ"]	= 0		--设置副本类型
x808032_g_keySD["spt"]	= 1		--设置副本场景事件脚本号
x808032_g_keySD["tim"]	= 2		--设置定时器调用次数
x808032_g_keySD["scn"]	= 3		--设置副本入口场景号, 初始化
x808032_g_keySD["cls"]	= 4		--设置副本关闭标志, 0开放,1关闭
x808032_g_keySD["dwn"]	= 5		--设置离开倒计时次数
x808032_g_keySD["tem"]	= 6		--保存队伍号
x808032_g_keySD["x"]	= 7			--人物T読 入口场景中to� 鸬 x位置
x808032_g_keySD["z"]	= 8			--人物T読 入口场景中to� 鸬 z位置
x808032_g_keySD["killedmonsternum"]	= 9		--杀死喽罗to� 鸬 数量
x808032_g_keySD["killedbossnum"]	= 10		--杀死Bossto� 鸬 数量
x808032_g_keySD["mp"]	= 11		--记录当前副本to� 鸬  门派

--接取任务to� 鸬 最低等c
x808032_g_minLevel			= 20
--C 配置小怪物
x808032_g_typMonster		= 749	--水鬼探子
--门派id
x808032_g_MenPaiID		= MP_GAIBANG

x808032_g_NianNum = 5
x808032_g_NianPos = {
											{x=83  ,y=140 },
											{x=69  ,y=119 },
											{x=76  ,y=99  },
											{x=46  ,y=120 },
											{x=39  ,y=110 },
										}
--x808032_g_NianShou = {12200,12201,12202,12203,12204,12205,12206,12207,12208,12209,12210,12211}
--**********************************
--任务入口函数
--**********************************
function x808032_OnDefaultEvent( sceneId, selfId, targetId )

	x808032_OnAccept( sceneId, selfId, targetId )


end

--**********************************
--列举事件
--**********************************
function x808032_OnEnumerate( sceneId, selfId, targetId )

	local	MenPaiID	=	GetMenPai(sceneId, selfId)
	if(MenPaiID ~= x808032_g_MenPaiID) then
		x808032_NotifyTip( sceneId, selfId, "Ta t緄 Thi猽 L鈓 瓞 h鰅 t礽, ng呓i kh鬾g ph鋓 l� 甬 t� c黙 Thi猽 L鈓, mau mau tr醤h ra" )
		return
	end

	local	lev	= GetLevel( sceneId, selfId )
	if lev < x808032_g_minLevel then
	  x808032_NotifyTip( sceneId, selfId, "衅ng c c黙 ng呓i qu� th, c� b鋘 kh鬾g l鱰 v鄌 m ta. 玄i sau khi 鹫t c 20, h銀 t緄 t靘 ta" )
		return
	end

	if LuaFnHasTeam( sceneId, selfId ) == 0 then
		x808032_NotifyTip( sceneId, selfId, "Ng呓i mu痭 t緄 th� ta, nh遪g c� b鋘 ta kh鬾g mu痭 鸬ng th� v緄 ng呓i" )
		return
	end
	--PrintNum(3)

	if GetTeamSize( sceneId, selfId ) < x808032_g_LimitMembers then
	  x808032_NotifyTip( sceneId, selfId, "Mu痭 th� th醕h ta ch� 韙 c鹡g ph鋓 t緄 "..x808032_g_LimitMembers.." ng叨i. C� t� ng叨i th� n鄖, qu� coi th叨ng ta" )
	  return
	end
	--PrintNum(4)

	if LuaFnIsTeamLeader( sceneId, selfId ) == 0 then
		x808032_NotifyTip( sceneId, selfId, "Mu痭 th� th醕h ta? G鱥 nh髆 tr叻ng c黙 c醕 ng呓i ra 疴y" )
		return
	end
	--PrintNum(5)

	-- 取 餴琺玩家附近to� 鸬 队友数量(包括自己)
	local nearteammembercount = GetNearTeamCount( sceneId, selfId )
	if nearteammembercount ~= LuaFnGetTeamSize( sceneId, selfId ) then
		x808032_NotifyTip( sceneId, selfId, "Trong 鸬i ng� c黙 c醕 h� c� th鄋h vi阯 kh鬾g � ph� c, xin h銀 t trung r癷 皙n t靘 ta 疬a v鄌 ho誸 鸬ng." )
		return
	end

	local namenum = 0;
	local notifyString = "Trong 鸬i ng� c黙 c醕 h� c� th鄋h vi阯 (";
	for i=0, nearteammembercount-1  do
		local nPlayerId = GetNearTeamMember(sceneId,selfId, i)
		local	lev	= GetLevel( sceneId, nPlayerId )
		local	nam	= GetName( sceneId, nPlayerId )
		
		if(lev<x808032_g_minLevel) then
			notifyString = notifyString..nam.." ";
			namenum = 1;
		end
	end
	notifyString = notifyString..") 鹌ng c kh鬾g 瘘.";	
	if(namenum>0) then
		x808032_NotifyTip( sceneId, selfId, notifyString )
		return
	end

	BeginEvent( sceneId )
		AddText( sceneId, "N猽 c醕 ng呓i 疸 kh鬾g s� ch猼, ta c鹡g kh鬾g c thi猼 ph鋓 l遳 t靚h. L� o kia, 瓞 ta cho c醕 ng呓i n猰 m鵬 l㱮 h読" )
		AddNumText( sceneId, x808032_g_ScriptId, "L� n鄌 ta l読 s� ng呓i.." ,10 ,0)
  EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

end

--**********************************
--检测Ti猵 th跫�
--**********************************
function x808032_CheckAccept( sceneId, selfId )
	local	MenPaiID	=	GetMenPai(sceneId, selfId)
	if(MenPaiID ~= x808032_g_MenPaiID) then
		x808032_NotifyTip( sceneId, selfId, "Ta t緄 Thi猽 L鈓 瓞 h鰅 t礽, ng呓i kh鬾g ph鋓 l� 甬 t� c黙 Thi猽 L鈓, mau mau tr醤h ra" )
		return 0;
	end

	local	lev	= GetLevel( sceneId, selfId )
	if lev < x808032_g_minLevel then
	  x808032_NotifyTip( sceneId, selfId, "衅ng c c黙 ng呓i qu� th, c� b鋘 kh鬾g l鱰 v鄌 m ta. 玄i sau khi 鹫t c 20, h銀 t緄 t靘 ta" )
		return 0
	end

	if LuaFnHasTeam( sceneId, selfId ) == 0 then
		x808032_NotifyTip( sceneId, selfId, "Ng呓i mu痭 t緄 th� ta, nh遪g c� b鋘 ta kh鬾g mu痭 鸬ng th� v緄 ng呓i" )
		return 0
	end
	--PrintNum(3)

	if GetTeamSize( sceneId, selfId ) < x808032_g_LimitMembers then
	  x808032_NotifyTip( sceneId, selfId, "Mu痭 th� th醕h ta ch� 韙 c鹡g ph鋓 t緄 "..x808032_g_LimitMembers.." ng叨i. C� t� ng叨i th� n鄖, qu� coi th叨ng ta" )
	  return 0
	end
	--PrintNum(4)

	if LuaFnIsTeamLeader( sceneId, selfId ) == 0 then
		x808032_NotifyTip( sceneId, selfId, "Mu痭 th� th醕h ta? G鱥 nh髆 tr叻ng c黙 c醕 ng呓i ra 疴y" )
		return 0
	end
	--PrintNum(5)

	-- 取 餴琺玩家附近to� 鸬 队友数量(包括自己)
	local nearteammembercount = GetNearTeamCount( sceneId, selfId )
	if nearteammembercount ~= LuaFnGetTeamSize( sceneId, selfId ) then
		x808032_NotifyTip( sceneId, selfId, "Trong 鸬i ng� c黙 c醕 h� c� th鄋h vi阯 kh鬾g � ph� c, xin h銀 t trung r癷 皙n t靘 ta 疬a v鄌 ho誸 鸬ng." )
		return 0
	end
	
	local namenum = 0;
	local notifyString = "Trong 鸬i ng� c黙 c醕 h� c� th鄋h vi阯 (";
	for i=0, nearteammembercount-1  do
		local nPlayerId = GetNearTeamMember(sceneId,selfId, i)
		local	lev	= GetLevel( sceneId, nPlayerId )
		local	nam	= GetName( sceneId, nPlayerId )
		
		if(lev<x808032_g_minLevel) then
			notifyString = notifyString..nam.." ";
			namenum = 1;
		end
	end
	notifyString = notifyString..") 鹌ng c kh鬾g 瘘.";	
	if(namenum>0) then
		x808032_NotifyTip( sceneId, selfId, notifyString )
		return 0
	end
	return 1
end

--**********************************
--Ti猵 th�
--**********************************
function x808032_OnAccept( sceneId, selfId, targetId )
	if x808032_CheckAccept( sceneId, selfId ) == 0 then
		return
	end
	local teamid = GetTeamId( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x808032_g_MissionId ) > 0 then
		local misIndex = GetMissionIndexByID( sceneId, selfId, x808032_g_MissionId )
		local copysceneid = GetMissionParam( sceneId, selfId, misIndex, x808032_g_Param_sceneid )
		local saveteamid = GetMissionParam( sceneId, selfId, misIndex, x808032_g_Param_teamid )
		--进过副本
		if copysceneid >= 0 and teamid == saveteamid then
			--将自己传送到副本场景
			if IsCanEnterCopyScene( copysceneid, GetHumanGUID( sceneId, selfId ) ) == 1 then
				NewWorld( sceneId, selfId, copysceneid, x808032_g_Fuben_X, x808032_g_Fuben_Z )
			else
				x808032_NotifyTip( sceneId, selfId, "Nhi甿 v� th b読, h銀 b� 餴 v� nh l読" )
				SetMissionByIndex( sceneId, selfId, misIndex, x808032_g_Param_IsMissionOkFail, 2 )
				DelMission(sceneId, selfId, x808032_g_MissionId);
			end
			return
		end
	end

	--加入任务到玩家列表
	--取 餴琺玩家附近to� 鸬 队友数量(包括自己)
	local numMem	= GetNearTeamCount( sceneId, selfId )
	local member
	local i
	local misIndex
	for i=0, numMem-1 do
		member = GetNearTeamMember( sceneId, selfId, i );
		if IsMissionFull(sceneId, member) == 1 then
			BeginEvent(sceneId)
				AddText(sceneId, "Trong 鸬i ng� c� ng叨i nhi甿 v� 疸 馥y!");
			EndEvent()
			DispatchMissionTips(sceneId, selfId);
			return
		end
	end
	for	i=0, numMem-1 do
		member = GetNearTeamMember( sceneId, selfId, i )

		if IsHaveMission( sceneId, member, x808032_g_MissionId ) > 0 then
			--删掉先
			DelMission( sceneId, member, x808032_g_MissionId);
		end


		--给每c醝队伍成员加入任务
		AddMission( sceneId, member, x808032_g_MissionId, x808032_g_ScriptId, 1, 0, 0 )

		misIndex = GetMissionIndexByID( sceneId, member, x808032_g_MissionId )
		--将任务to� 鸬 第0号数据设置为0,表示未完成to� 鸬 任务
		SetMissionByIndex( sceneId, member, misIndex, x808032_g_Param_IsMissionOkFail, 0 )
		--将任务to� 鸬 第2号数据设置为-1, 用于保存副本to� 鸬 场景号
		SetMissionByIndex( sceneId, member, misIndex, x808032_g_Param_sceneid, -1 )
		--将任务to� 鸬 第3号数据队伍号
		SetMissionByIndex( sceneId, member, misIndex, x808032_g_Param_teamid, teamid )
	end
	x808032_MakeCopyScene( sceneId, selfId, numMem )
	LuaFnDeleteMonster( sceneId, targetId)
end

--**********************************
--放弃
--**********************************
function x808032_OnAbandon( sceneId, selfId )
	--不T読 场景to� 鸬 不做此操作
	if LuaFnIsObjValid( sceneId, selfId ) ~= 1 then
		return
	end

	--处于无法执行逻辑to� 鸬 状态
	if LuaFnIsCanDoScriptLogic( sceneId, selfId ) ~= 1 then
		return
	end

	--不喧ngT読 副本中直接删除任务
	local misIndex = GetMissionIndexByID( sceneId, selfId, x808032_g_MissionId )
	local copysceneid = GetMissionParam( sceneId, selfId, misIndex, x808032_g_Param_sceneid )

	if(copysceneid ~= sceneId) then
		DelMission( sceneId, selfId, x808032_g_MissionId )
		return
	end

	local leaderguid = LuaFnGetCopySceneData_TeamLeader( sceneId )
	local leaderObjId = LuaFnGuid2ObjId( sceneId, leaderguid )

	--找不到该玩家
	if leaderObjId == -1 then
		DelMission( sceneId, selfId, x808032_g_MissionId )
		return
	end

	--此时m祎 定T読 副本中,可以 鹫t 疬㧟入口场景号
	local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, x808032_g_keySD["scn"] )	--取 餴琺副本入口场景号
	if(selfId == leaderObjId) then
		--队长放弃,全部传出副本
		LuaFnSetCopySceneData_Param( sceneId, x808032_g_keySD["cls"], 1 )
		local membercount = LuaFnGetCopyScene_HumanCount( sceneId )
		local mems = {}
		local i
		for	i=0, membercount-1 do
			mems[i] = LuaFnGetCopyScene_HumanObjId( sceneId, i )
		end
		--将当前副本场景里to� 鸬 所有人传送回原来进入时候to� 鸬 场景
		for	i=0, membercount-1 do
			if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
				DelMission( sceneId, mems[i], x808032_g_MissionId )
				x = LuaFnGetCopySceneData_Param( sceneId, x808032_g_keySD["x"] )
				z = LuaFnGetCopySceneData_Param( sceneId, x808032_g_keySD["z"] )
				NewWorld( sceneId, mems[i], oldsceneId, x, z )
			end
		end
	else
	--自己不喧ng队长只喧ng自己放弃,只把自己传出副本
		DelMission( sceneId, selfId, x808032_g_MissionId )
		x = LuaFnGetCopySceneData_Param( sceneId, x808032_g_keySD["x"] )
		z = LuaFnGetCopySceneData_Param( sceneId, x808032_g_keySD["z"] )
		NewWorld( sceneId, selfId, oldsceneId, x, z )
	end

end

--**********************************
--创建副本
--**********************************
function x808032_MakeCopyScene( sceneId, selfId, nearmembercount )

	local mems = {}
	local mylevel = 0
	local i

-- 	PrintStr("sdlf")

	local member, mylevel, numerator, denominator = 0, 0, 0, 0

	for	i = 0, nearmembercount - 1 do
		member = GetNearTeamMember( sceneId, selfId, i )
		numerator = numerator + GetLevel( sceneId, member ) ^ 4
		denominator = denominator + GetLevel( sceneId, member ) ^ 3
		mems[i] = member
	end

	if denominator <= 0 then
		mylevel = 0
	else
		mylevel = numerator / denominator
	end

	local PlayerMaxLevel = GetHumanMaxLevelLimit()
	local iniLevel
	if mylevel < 10 then
		iniLevel = 10
	elseif mylevel < PlayerMaxLevel then
		iniLevel = floor( mylevel/10 ) * 10
	else
		iniLevel = PlayerMaxLevel
	end

	local leaderguid = LuaFnObjId2Guid( sceneId, selfId )
	--地图喧ng必须选取to� 鸬 ,而且必须T読 Config/SceneInfo.ini里配置好
	LuaFnSetSceneLoad_Map( sceneId, "gaibang_1.nav" )
	LuaFnSetCopySceneData_TeamLeader( sceneId, leaderguid )
	LuaFnSetCopySceneData_NoUserCloseTime( sceneId, x808032_g_NoUserTime * 1000 )
	LuaFnSetCopySceneData_Timer( sceneId, x808032_g_TickTime * 1000 )
	LuaFnSetCopySceneData_Param( sceneId, x808032_g_keySD["typ"], x808032_g_CopySceneType )
	LuaFnSetCopySceneData_Param( sceneId, x808032_g_keySD["spt"], x808032_g_ScriptId )
	LuaFnSetCopySceneData_Param( sceneId, x808032_g_keySD["tim"], 0 )
	LuaFnSetCopySceneData_Param( sceneId, x808032_g_keySD["scn"], -1 )
	LuaFnSetCopySceneData_Param( sceneId, x808032_g_keySD["cls"], 0 )
	LuaFnSetCopySceneData_Param( sceneId, x808032_g_keySD["dwn"], 0 )
	LuaFnSetCopySceneData_Param( sceneId, x808032_g_keySD["tem"], GetTeamId( sceneId, selfId ) )
	LuaFnSetCopySceneData_Param( sceneId, x808032_g_keySD["killedmonsternum"], 0 )
	LuaFnSetCopySceneData_Param( sceneId, x808032_g_keySD["killedbossnum"], 0 )
	LuaFnSetCopySceneData_Param( sceneId, x808032_g_keySD["mp"], MP_GAIBANG )

	local x,z = GetWorldPos( sceneId, selfId )

--	PrintStr("  "..x..z.." ")

	LuaFnSetCopySceneData_Param( sceneId, x808032_g_keySD["x"], x808032_g_Back_X )
	LuaFnSetCopySceneData_Param( sceneId, x808032_g_keySD["z"], x808032_g_Back_Z )

	LuaFnSetSceneLoad_Monster( sceneId, "gaibang_1_monster_" .. iniLevel .. ".ini" )
	LuaFnSetCopySceneData_Param(sceneId, CopyScene_LevelGap, mylevel - iniLevel) --c别差,CopyScene_LevelGap T読  scene.lua 中赋值
  LuaFnSetCopySceneData_Param(sceneId, 13, mylevel)
  
	local bRetSceneID = LuaFnCreateCopyScene( sceneId )						--初始化完成后调用创建副本函数
	if bRetSceneID > 0 then
		x808032_NotifyTip( sceneId, selfId, "D竎h chuy琻 th鄋h c鬾g!" )
	else
		x808032_NotifyTip( sceneId, selfId, "S� l唼ng b鋘 sao 疸 皙n gi緄 h課, 皤 ngh� l醫 n鎍 th� l読!" )

		--删除玩家任务列表中对应to� 鸬 任务
		for	i=0, nearmembercount-1 do
			DelMission( sceneId, mems[i], x808032_g_MissionId )
		end
	end

end

--**********************************
--继续
--**********************************
function x808032_OnContinue( sceneId, selfId, targetId )

end

--**********************************
--检测喧ng否可以提交
--**********************************
function x808032_CheckSubmit( sceneId, selfId, selectRadioId )


end

--**********************************
--提交
--**********************************
function x808032_OnSubmit( sceneId, selfId, targetId, selectRadioId )

end

--**********************************
--杀死怪物或玩家
--**********************************
function x808032_OnKillObject( sceneId, selfId, objdataId, objId )

	--喧ng否喧ng副本
	local sceneType = LuaFnGetSceneType( sceneId )
	if sceneType ~= 1 then
		return
	end

	--喧ng否喧ng所C to� 鸬 副本
	local fubentype = LuaFnGetCopySceneData_Param( sceneId, 0 )
	if fubentype ~= x808032_g_CopySceneType then
		return
	end

	--副本关闭标志
	local leaveFlag = LuaFnGetCopySceneData_Param( sceneId, 4 )
	--如果副本已经被置成关闭状态,则杀怪无效
	if leaveFlag == 1 then
		return
	end

	--取 餴琺当前场景里to� 鸬 人数
	local num = LuaFnGetCopyScene_HumanCount( sceneId )

	--取 餴琺杀死怪物to� 鸬 GroupID,用于判断喧ng否喧ng所C 杀掉to� 鸬 Boss
	local GroupID = GetMonsterGroupID( sceneId, objId )

	local killedmonsternumber = LuaFnGetCopySceneData_Param( sceneId, x808032_g_keySD["killedmonsternum"] )			--杀死monsterto� 鸬 数量
	local killedbossnumber = LuaFnGetCopySceneData_Param( sceneId, x808032_g_keySD["killedbossnum"] )			--杀死bossto� 鸬 数量

	local MonsterName = GetName(sceneId, objId)
	local	isBoss

	if(MonsterName == "L鈛 La")then
		killedmonsternumber = killedmonsternumber + 1
		LuaFnSetCopySceneData_Param( sceneId, x808032_g_keySD["killedmonsternum"], killedmonsternumber )					--设置杀死monsterto� 鸬 数量
		isBoss = 0

		if killedmonsternumber ==  x808032_g_Totalkillmonstercount then

			local	Selflev	= GetLevel( sceneId, selfId )
			local PlayerMaxLevel = GetHumanMaxLevelLimit()
			local monsterLevel=0
			if Selflev < 10 then
				monsterLevel = 0
			elseif Selflev < 110 then
				monsterLevel = floor( Selflev/10 ) + 3670 - 1
			elseif Selflev < PlayerMaxLevel then
				monsterLevel = floor( Selflev/10 ) + 33670 - 11
			else
				monsterLevel = 9
			end
			local tmpMonsterId = LuaFnCreateMonster( sceneId, monsterLevel, 59, 66, 14, 138, -1 )
			local tmpsMessage = format("Th 疳ng gh閠, nh靚 th ch鷑g ta s 疳nh b ng� th鄋h c鬾g, t� nhi阯 l読 nh� th�, 鹱ng tr醕h ta kh鬾g kh醕h kh�")
			MonsterTalk(sceneId, tmpMonsterId, x808032_g_CopySceneName, tmpsMessage)
			local szName = GetName(sceneId, tmpMonsterId)
			if szName == "羉 B�"   then
				SetCharacterTitle(sceneId, tmpMonsterId, "“书山有路”")
			end
		end

	elseif ( MonsterName == "羉 B�" ) then
		killedbossnumber = killedbossnumber + 1
		LuaFnSetCopySceneData_Param( sceneId, x808032_g_keySD["killedbossnum"], killedbossnumber )					--设置杀死bossto� 鸬 数量
		isBoss = 1
	end



	-------------------------------------------------------------------------------
	local membercount = LuaFnGetCopyScene_HumanCount(sceneId);
	local memId
	local teamLeaderName;
	local firstMemName;
	local firstMemId;

	teamLeaderName = ""
	for	i = 0, membercount - 1 do
		memId = LuaFnGetCopyScene_HumanObjId(sceneId, i);
		if LuaFnIsObjValid( sceneId, memId ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, memId ) == 1 then
			local teamLeaderFlag = LuaFnIsTeamLeader(sceneId, memId);
			if teamLeaderFlag and teamLeaderFlag == 1 then
				teamLeaderName = LuaFnGetName(sceneId, memId);
				break;
			end
		end
	end

	if isBoss==1 and teamLeaderName ~= "" then
		local message;
		local randMessage = random(3);

		if randMessage == 1 then
			message = format("#B#{_INFOUSR%s}#{TouXi_00}#G#{MP_gaibang}#{TouXi_01}", teamLeaderName );
		elseif randMessage == 2 then
			message = format("#G#{MP_gaibang}#{TouXi_02}#{_INFOUSR%s}#{TouXi_03}#B#{_INFOUSR%s}#{TouXi_04}", teamLeaderName, teamLeaderName );
		else
			message = format("#{TouXi_05}#G#{MP_gaibang}#{TouXi_06}#{_INFOUSR%s}#{TouXi_07}", teamLeaderName );
		end

		BroadMsgByChatPipe(sceneId, selfId, message, 4);
	end
	-------------------------------------------------------------------------------



	local i
	local misIndex
	local humanObjId
	local	mppoint

	if (killedmonsternumber < x808032_g_Totalkillmonstercount ) or (killedbossnumber < x808032_g_Totalkillbosscount )then
		local strText = format( "秀 gi猼 ch猼 b鱪 L鈛 la: %d/%d 疸 gi猼 ch猼 b鱪 羉 B�: %d/%d" , killedmonsternumber, x808032_g_Totalkillmonstercount, killedbossnumber, x808032_g_Totalkillbosscount )
		for i=0, num-1 do
			humanObjId = LuaFnGetCopyScene_HumanObjId( sceneId, i )				--取 餴琺当前场景里人to� 鸬 objId
		if LuaFnIsObjValid( sceneId, humanObjId ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, humanObjId ) == 1 then				--不T読 场景to� 鸬 不做此操作
				x808032_NotifyTip( sceneId, humanObjId, strText )

				local	MenPaiID	=	GetMenPai(sceneId, humanObjId)
				if(MenPaiID == x808032_g_MenPaiID) then
					if isBoss == 0 then
						mppoint = GetHumanMenpaiPoint(sceneId, humanObjId)
						mppoint = mppoint+1
						SetHumanMenpaiPoint(sceneId, humanObjId, mppoint)
					else
						mppoint = GetHumanMenpaiPoint(sceneId, humanObjId)
						mppoint = mppoint+5
						SetHumanMenpaiPoint(sceneId, humanObjId, mppoint)
					end
				end

				misIndex = GetMissionIndexByID( sceneId, humanObjId, x808032_g_MissionId )					--取 餴琺任务数据索引值
				SetMissionByIndex( sceneId, humanObjId, misIndex, x808032_g_Param_killmonstercount, killedmonsternumber )	--设置任务数据
				SetMissionByIndex( sceneId, humanObjId, misIndex, x808032_g_Param_killbosscount, killedbossnumber )	--设置任务数据
			end
		end
	else

		--设置任务完成标志
		LuaFnSetCopySceneData_Param( sceneId, x808032_g_keySD["cls"], 1 )

		--取 餴琺已经执行to� 鸬 定时次数
		local TickCount = LuaFnGetCopySceneData_Param( sceneId, 2 )
		local strText = format( "秀 gi猼 ch猼 b鱪 L鈛 la: %d/%d 疸 gi猼 ch猼 b鱪 羉 B�: %d/%d", x808032_g_Totalkillmonstercount, x808032_g_Totalkillmonstercount, x808032_g_Totalkillbosscount, x808032_g_Totalkillbosscount)
		local strText2 = format( "Nhi甿 v� ho鄋 th鄋h, sau %d gi鈟 s� chuy琻 t緄 v� tr� v鄌 c豠", x808032_g_CloseTick * x808032_g_TickTime )

		for i=0, num-1 do
			humanObjId = LuaFnGetCopyScene_HumanObjId( sceneId, i )									--取 餴琺当前场景里人to� 鸬 objId

			if LuaFnIsObjValid( sceneId, humanObjId ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, humanObjId ) == 1 then				--不T読 场景to� 鸬 不做此操作
				misIndex = GetMissionIndexByID( sceneId, humanObjId, x808032_g_MissionId)					--取 餴琺任务数据索引值

				SetMissionByIndex( sceneId, humanObjId, misIndex, x808032_g_Param_killmonstercount, killedmonsternumber )	--设置任务数据
				SetMissionByIndex( sceneId, humanObjId, misIndex, x808032_g_Param_killbosscount, killedbossnumber )	--设置任务数据

				--将任务to� 鸬 第1号数据设置为1,表示完成to� 鸬 任务
				SetMissionByIndex( sceneId, humanObjId, misIndex, x808032_g_Param_IsMissionOkFail, 1 )					--设置任务数据
				--完成副本所用时间
				SetMissionByIndex( sceneId, humanObjId, misIndex, x808032_g_Param_time, TickCount * x808032_g_TickTime )	--设置任务数据

				x808032_NotifyTip( sceneId, humanObjId, strText )
				x808032_NotifyTip( sceneId, humanObjId, strText2 )

				local	MenPaiID	=	GetMenPai(sceneId, humanObjId)
				if(MenPaiID == x808032_g_MenPaiID) then
					if isBoss == 0 then
						mppoint = GetHumanMenpaiPoint(sceneId, humanObjId)
						mppoint = mppoint+1
						SetHumanMenpaiPoint(sceneId, humanObjId, mppoint)
					else
						mppoint = GetHumanMenpaiPoint(sceneId, humanObjId)
						mppoint = mppoint+5
						SetHumanMenpaiPoint(sceneId, humanObjId, mppoint)
					end
				end

			end
		end
	end
end

--**********************************
--进入区域事件
--**********************************
function x808032_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x808032_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--副本事件
--**********************************
function x808032_OnCopySceneReady( sceneId, destsceneId )

	--设置副本入口场景号
	LuaFnSetCopySceneData_Param( destsceneId, x808032_g_keySD["scn"], sceneId )
	local leaderguid = LuaFnGetCopySceneData_TeamLeader( destsceneId )
	local leaderObjId = LuaFnGuid2ObjId( sceneId, leaderguid )

	--找不到该玩家
	if leaderObjId == -1 then
		return
	end

	--处于无法执行逻辑to� 鸬 状态
	if LuaFnIsCanDoScriptLogic( sceneId, leaderObjId ) ~= 1 then
		return
	end

	--取 餴琺玩家附近to� 鸬 队友数量(包括自己)
	local numMem	= GetNearTeamCount( sceneId, leaderObjId )
	local member
	local misIndex

	misIndex = GetMissionIndexByID( sceneId, leaderObjId, x808032_g_MissionId )
	SetMissionByIndex( sceneId, leaderObjId, misIndex, x808032_g_Param_sceneid, destsceneId )
	NewWorld( sceneId, leaderObjId, destsceneId, x808032_g_Fuben_X, x808032_g_Fuben_Z )
	
	--活动统计
	LuaFnAuditQuest(sceneId, leaderObjId, x808032_g_MissionName.."-"..x808032_g_CopySceneName)

	for	i=0, numMem-1 do
		member = GetNearTeamMember( sceneId, leaderObjId, i )

		if LuaFnIsCanDoScriptLogic( sceneId, member ) == 1 then			-- 处于可以执行逻辑to� 鸬 状态
			if IsHaveMission( sceneId, member, x808032_g_MissionId ) > 0 then
				misIndex = GetMissionIndexByID( sceneId, member, x808032_g_MissionId )

				--将任务to� 鸬 第2号数据设置为副本to� 鸬 场景号
				SetMissionByIndex( sceneId, member, misIndex, x808032_g_Param_sceneid, destsceneId )

				NewWorld( sceneId, member, destsceneId, x808032_g_Fuben_X, x808032_g_Fuben_Z )
				
				--活动统计
				LuaFnAuditQuest(sceneId, member, x808032_g_MissionName.."-"..x808032_g_CopySceneName)
	
			else
				x808032_NotifyTip( sceneId, member, "C醕 h� 疸 kh鬾g nh nhi甿 v� n鄖 t� tr呔c" )
			end
		end
	end
end

--**********************************
--有玩家进入副本事件
--**********************************
function x808032_OnPlayerEnter( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x808032_g_MissionId ) == 0 then				--如果进入副本前删除任务,则直接传送回
		x808032_NotifyTip( sceneId, selfId, "C醕 h� 疸 kh鬾g nh nhi甿 v� n鄖 t� tr呔c" )
		local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, x808032_g_keySD["scn"] )		--取 餴琺副本入口场景号
		x = LuaFnGetCopySceneData_Param( sceneId, x808032_g_keySD["x"] )
		z = LuaFnGetCopySceneData_Param( sceneId, x808032_g_keySD["z"] )
		NewWorld( sceneId, selfId, oldsceneId, x, z )
		return
	end


	--设� gi鈟劳龊蟾椿� 餴琺位置
	SetPlayerDefaultReliveInfo( sceneId, selfId, "%10", -1, "0", sceneId, x808032_g_Fuben_X, x808032_g_Fuben_Z )

end

--**********************************
--有玩家T読 副本中死亡事件
--**********************************
function x808032_OnHumanDie( sceneId, selfId, killerId )
--	x = LuaFnGetCopySceneData_Param( sceneId, x808032_g_keySD["x"] )
--	z = LuaFnGetCopySceneData_Param( sceneId, x808032_g_keySD["z"] )
--	NewWorld( sceneId, selfId, oldsceneId, x, z )
end

--**********************************
--副本场景定时器事件
--**********************************
function x808032_OnCopySceneTimer( sceneId, nowTime )
	
--	local once = LuaFnGetCopySceneData_Param( sceneId, 16 )
--
--	if (once == 0) then
--		LuaFnSetCopySceneData_Param(sceneId, 16, 1)
--		local mylevel = LuaFnGetCopySceneData_Param( sceneId, 13 )
--		
--		local PlayerMaxLevel = GetHumanMaxLevelLimit()
--		local iniLevel;
--		if mylevel < 10 then
--			iniLevel = 10;
--		elseif mylevel < PlayerMaxLevel then
--			iniLevel = floor(mylevel/10) * 10;
--		else
--			iniLevel = PlayerMaxLevel;
--		end
--	 
--		local iNianShouIdx = iniLevel / 10
--	
--		for i=1,x808032_g_NianNum do
--			local objId = LuaFnCreateMonster( sceneId, x808032_g_NianShou[iniLevel/10], x808032_g_NianPos[i].x, x808032_g_NianPos[i].y, 1, 272, -1 )
--			SetLevel( sceneId, objId, mylevel )
--			LuaFnSendSpecificImpactToUnit(sceneId, objId, objId, objId, 10472, 0); -- zchw
--		end  
--	end
	
	--副本时钟读取及设置
	--取 餴琺已经执行to� 鸬 定时次数
	local TickCount = LuaFnGetCopySceneData_Param( sceneId, x808032_g_keySD["tim"] )
	TickCount = TickCount + 1
	--设置新to� 鸬 定时器调用次数
	LuaFnSetCopySceneData_Param( sceneId, x808032_g_keySD["tim"], TickCount )

	--副本关闭标志
	local leaveFlag = LuaFnGetCopySceneData_Param( sceneId, x808032_g_keySD["cls"] )

	local membercount = LuaFnGetCopyScene_HumanCount( sceneId )
	local mems = {}
	local i

	if membercount==0 and leaveFlag~=1 then
		LuaFnSetCopySceneData_Param( sceneId, x808032_g_keySD["cls"], 1 )
		return
	end



	for	i=0, membercount-1 do
		mems[i] = LuaFnGetCopyScene_HumanObjId( sceneId, i )
	end

	--C 离开
	if leaveFlag == 1 then
		--离开倒计时间to� 鸬 读取和设置
		local leaveTickCount = LuaFnGetCopySceneData_Param( sceneId, x808032_g_keySD["dwn"] )
		leaveTickCount = leaveTickCount + 1
		LuaFnSetCopySceneData_Param( sceneId, x808032_g_keySD["dwn"], leaveTickCount )

		if leaveTickCount == x808032_g_CloseTick then										--倒计时间到,大家都出去吧
			local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, x808032_g_keySD["scn"] )	--取 餴琺副本入口场景号

			--将当前副本场景里to� 鸬 所有人传送回原来进入时候to� 鸬 场景
			for	i=0, membercount-1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					DelMission( sceneId, mems[i], x808032_g_MissionId )
					x = LuaFnGetCopySceneData_Param( sceneId, x808032_g_keySD["x"] )
					z = LuaFnGetCopySceneData_Param( sceneId, x808032_g_keySD["z"] )
					NewWorld( sceneId, mems[i], oldsceneId, x, z )
				end
			end

		--	LuaFnSetCopySceneData_Param( sceneId, 7, 0 )

		elseif leaveTickCount < x808032_g_CloseTick then
			--通知当前副本场景里to� 鸬 所有人,场景关闭倒计时间
			local strText = format( "C醕 h� s� r秈 kh鰅 疴y sau %d gi鈟!", (x808032_g_CloseTick-leaveTickCount) * x808032_g_TickTime )

			for	i=0, membercount-1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					x808032_NotifyTip( sceneId, mems[i], strText )
				end
			end
		end
	elseif TickCount == x808032_g_LimitTimeSuccess then
		--此处设置有时间限制to� 鸬 任务完成处理
		local misIndex
		for	i=0, membercount-1 do
			if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then

			DelMission( sceneId, mems[i], x808032_g_MissionId )

				x808032_NotifyTip( sceneId, mems[i], "Th秈 gian ho鄋 t nhi甿 v� 疸 t緄, ho鄋 th鄋h!" )

				--取 餴琺任务数据索引值
				misIndex = GetMissionIndexByID( sceneId, mems[i], x808032_g_MissionId )
				--将任务to� 鸬 第1号数据设置为1,表示完成to� 鸬 任务
				--设置任务数据
				SetMissionByIndex( sceneId, mems[i], misIndex, x808032_g_Param_IsMissionOkFail, 1 )
				--完成副本所用时间
				SetMissionByIndex( sceneId, mems[i], misIndex, x808032_g_Param_time, TickCount * x808032_g_TickTime )	--设置任务数据
			end
		end

		--设置副本关闭标志
		LuaFnSetCopySceneData_Param( sceneId, x808032_g_keySD["cls"], 1 )
	elseif TickCount == x808032_g_LimitTotalHoldTime then						--副本总时间限制到了
		--此处设置副本任务有时间限制to� 鸬 情况,当时间到后处理...
		for	i=0, membercount-1 do
			if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
				DelMission( sceneId, mems[i], x808032_g_MissionId )				--任务th b読,删除之
				x808032_NotifyTip( sceneId, mems[i], "Nhi甿 v� th b読, qu� gi�!" )
			end
		end

		--设置副本关闭标志
		LuaFnSetCopySceneData_Param( sceneId, x808032_g_keySD["cls"], 1 )
	else
		--定时检查队伍成员to� 鸬 队伍号,如果不符合,则踢出副本
		local oldteamid = LuaFnGetCopySceneData_Param( sceneId, x808032_g_keySD["tem"] )		--取 餴琺保存to� 鸬 队伍号
		local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, x808032_g_keySD["scn"] )	--取 餴琺副本入口场景号

		for	i=0, membercount-1 do
			if LuaFnIsObjValid( sceneId, mems[i] ) == 1 and IsHaveMission( sceneId, mems[i], x808032_g_MissionId ) > 0 then
				if oldteamid ~= GetTeamId( sceneId, mems[i] ) then
					DelMission( sceneId, mems[i], x808032_g_MissionId )			--任务th b読,删除之
					x808032_NotifyTip( sceneId, mems[i], "Nhi甿 v� th b読, ng呓i kh鬾g � trong 瘊ng nh髆" )

					x = LuaFnGetCopySceneData_Param( sceneId, x808032_g_keySD["x"] )
					z = LuaFnGetCopySceneData_Param( sceneId, x808032_g_keySD["z"] )
					NewWorld( sceneId, mems[i], oldsceneId, x, z )
				end
			end
		end

	end
end

--**********************************
--醒目提示
--**********************************
function x808032_NotifyTip( sceneId, selfId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end

--**********************************
--对话窗口信息提示
--**********************************
function x808032_MsgBox( sceneId, selfId, targetId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

end

--**********************************
--醒目提示
--**********************************
function x808032_NotifyTip( sceneId, selfId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end
