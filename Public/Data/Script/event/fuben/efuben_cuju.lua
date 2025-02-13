-- 402040 
-- 蹴鞠副本

--************************************************************************

--脚本号
x402040_g_ScriptId = 402040

x402040_TIME_2000_01_03_ = 946828868

--************************************************************************

--副本名称
x402040_g_CopySceneName = "M鐄 餫n uy琻"

x402040_g_CopySceneType = FUBEN_CUJU	--副本类型,定义T読 ScriptGlobal.lua里面

x402040_g_CopySceneMap = "cuju.nav"
x402040_g_Exit = "cuju.ini"
x402040_g_LimitMembers = 3				--可以进副本to� 鸬 最小队伍人数
x402040_g_TickTime = 1						--回调脚本to� 鸬 时钟时间(单位:  gi鈟/次)
x402040_g_LimitTotalHoldTime = 360--副本可以存活to� 鸬 时间(单位: 次数),如果此时间到了,则任务将会th b読
x402040_g_LimitTimeSuccess = 500	--副本时间限制(单位: 次数),如果此时间到了,任务完成
x402040_g_CloseTick = 3						--副本关闭前倒计时(单位: 次数)
x402040_g_NoUserTime = 300				--副本中没有人后可以继续保存to� 鸬 时间(单位:  gi鈟)
x402040_g_DeadTrans = 0						--死亡转移模式,0: 死亡后还可以继续T読 副本,1: 死亡后被强制移出副本
x402040_g_Fuben_X = 38						--进入副本to� 鸬 位置X
x402040_g_Fuben_Z = 32						--进入副本to� 鸬 位置Z
x402040_g_Back_X = 203							--源场景位置X
x402040_g_Back_Z = 56							--源场景位置Z
x402040_g_Back_SceneId = 0				--源场景Id

x402040_g_BossPoint={x=61, z=57}

x402040_g_MonsterPoint=
{
	{x=41,z=32},{x=46,z=32},{x=51,z=32},{x=56,z=32},{x=61,z=32},{x=66,z=32},
	{x=71,z=32},{x=76,z=32},{x=81,z=32},{x=86,z=32},{x=86,z=37},{x=86,z=42},
	{x=86,z=47},{x=86,z=52},{x=86,z=57},{x=86,z=62},{x=86,z=67},{x=86,z=72},
	{x=86,z=77},{x=86,z=82},{x=86,z=87},{x=86,z=92},{x=86,z=97},{x=86,z=102},
	{x=81,z=102},{x=76,z=102},{x=71,z=102},{x=66,z=102},{x=61,z=102},{x=56,z=102},
	{x=51,z=102},{x=46,z=102},{x=41,z=102},{x=41,z=97},{x=41,z=92},{x=41,z=87},
	{x=41,z=82},{x=41,z=77},{x=41,z=72},{x=41,z=67},{x=41,z=62},{x=41,z=57},
	{x=41,z=52},{x=41,z=47},{x=41,z=42},{x=41,z=37},{x=46,z=37},{x=51,z=37},
	{x=56,z=37},{x=61,z=37},{x=66,z=37},{x=71,z=37},{x=76,z=37},{x=81,z=37},
	{x=81,z=42},{x=81,z=47},{x=81,z=52},{x=81,z=57},{x=81,z=62},{x=81,z=67},
	{x=81,z=72},{x=81,z=77},{x=81,z=82},{x=81,z=87},{x=81,z=92},{x=81,z=97},
	{x=76,z=97},{x=71,z=97},{x=66,z=97},{x=61,z=97},{x=56,z=97},{x=51,z=97},
	{x=46,z=97},{x=46,z=92},{x=46,z=87},{x=46,z=82},{x=46,z=77},{x=46,z=72},
	{x=46,z=67},{x=46,z=62},{x=46,z=57},{x=46,z=52},{x=46,z=47},{x=46,z=42},
	{x=51,z=42},{x=56,z=42},{x=61,z=42},{x=66,z=42},{x=71,z=42},{x=76,z=42},
	{x=76,z=47},{x=76,z=52},{x=76,z=57},{x=76,z=62},{x=76,z=67},{x=76,z=72},
	{x=76,z=77},{x=76,z=82},{x=76,z=87},{x=76,z=92},{x=71,z=92},{x=66,z=92},
	{x=61,z=92},{x=56,z=92},{x=51,z=92},{x=51,z=87},{x=51,z=82},{x=51,z=77},
	{x=51,z=72},{x=51,z=67},{x=51,z=62},{x=51,z=57},{x=51,z=52},{x=51,z=47},
	{x=56,z=47},{x=61,z=47},{x=66,z=47},{x=71,z=47},{x=71,z=52},{x=71,z=57},
	{x=71,z=62},{x=71,z=67},{x=71,z=72},{x=71,z=77},{x=71,z=82},{x=71,z=87},
	{x=66,z=87},{x=61,z=87},{x=56,z=87},{x=56,z=82},{x=56,z=77},{x=56,z=72},
	{x=56,z=67},{x=56,z=62},{x=56,z=57},{x=56,z=52},{x=61,z=52},{x=66,z=52},
	{x=66,z=57},{x=66,z=62},{x=66,z=67},{x=66,z=72},{x=66,z=77},{x=66,z=82},
	{x=61,z=82},{x=61,z=77},{x=61,z=72},{x=61,z=67},{x=61,z=62},
}

x402040_g_NianShouPoint = 
{
	{x=40,z=100},{x=40,z=92},{x=40,z=84},{x=40,z=76},{x=40,z=68},
	{x=40,z=60},{x=40,z=52}, {x=64,z=30},{x=50,z=30},{x=78,z=30},
	{x=90,z=100},{x=90,z=92},{x=90,z=84},{x=90,z=76},{x=90,z=68},
	{x=90,z=60},{x=90,z=52},{x=60,z=103},{x=50,z=103},{x=78,z=103},
	
}

-- 足球,不会主动攻击		
-- Ho鄋g S T鷆 C
x402040_g_SmallMonsterId_1={3680,3681,3682,3683,3684,3685,3686,3687,3688,3689,33680,33681,33682,33683,33684,33685,33686,33687,33688,33689}
-- H皀g S T鷆 C
x402040_g_SmallMonsterId_2={3690,3691,3692,3693,3694,3695,3696,3697,3698,3699,33690,33691,33692,33693,33694,33695,33696,33697,33698,33699}
-- Lam S T鷆 C
x402040_g_SmallMonsterId_3={3700,3701,3702,3703,3704,3705,3706,3707,3708,3709,33700,33701,33702,33703,33704,33705,33706,33707,33708,33709}

-- 变身后to� 鸬 主动怪 Hoa S T鷆 C
x402040_g_MiddleMonsterId={3710,3711,3712,3713,3714,3715,3716,3717,3718,3719,33710,33711,33712,33713,33714,33715,33716,33717,33718,33719}

-- BOSS怪 T鬾 M� M� (蹴鞠十三妹)
x402040_g_BossMonsterId={3720,3721,3722,3723,3724,3725,3726,3727,3728,3729,33720,33721,33722,33723,33724,33725,33726,33727,33728,33729}

--年兽
x402040_g_NianShouID  = {12200,12201,12202,12203,12204,12205,12206,12207,12208,12209,12210,12211}
--喧ng否创建to� 鸬 次数
x402040_paramonce  = 14

-- 记录杀怪数量to� 鸬 副本变量
x402040_g_KillNum = 20

-- 大足球
x402040_g_BigFootBall = {9160,9170,9180,9190,39160,39170,39180,39190}

--**********************************
--任务入口函数
--**********************************
function x402040_OnDefaultEvent( sceneId, selfId, targetId )
	if GetNumText() == 1  then
		BeginEvent(sceneId)
			AddText(sceneId,"#BV� tr 黏u T鷆 C");
			AddText(sceneId,"#{CUDS_20071010}");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	-- 2,检测玩家喧ng不喧ng组队了
	if LuaFnHasTeam(sceneId,selfId) ~= 1  then
		BeginEvent(sceneId)
			AddText(sceneId,"#BHo鄋h t鋙 M 衋n Uy琻");
			AddText(sceneId,"  Mu痭 th� th醕h ta ch� 韙 c鹡g ph鋓 t緄 3 ng叨i. C� t� ng叨i th� n鄖, qu� coi th叨ng ta");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	-- 3,检测玩家队伍人数
	if GetTeamSize(sceneId,selfId) < x402040_g_LimitMembers then
		BeginEvent(sceneId)
			AddText(sceneId,"#BHo鄋h t鋙 M 衋n Uy琻");
			AddText(sceneId,"  Mu痭 th� th醕h ta ch� 韙 c鹡g ph鋓 t緄 3 ng叨i. C� t� ng叨i th� n鄖, qu� coi th叨ng ta");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	-- 4,检测玩家喧ng不喧ng队长
	if GetTeamLeader(sceneId,selfId) ~= selfId    then
		BeginEvent(sceneId)
			AddText(sceneId,"#BHo鄋h t鋙 M 衋n Uy琻");
			AddText(sceneId,"  Mu痭 th� th醕h ta? G鱥 nh髆 tr叻ng c黙 c醕 ng呓i ra 疴y");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
		
	end
	
	-- 5,检测喧ng不喧ng人都到位了
	if GetTeamSize(sceneId,selfId) ~= GetNearTeamCount(sceneId,selfId)  then
		BeginEvent(sceneId)
			AddText(sceneId,"#BHo鄋h t鋙 M 衋n Uy琻");
			AddText(sceneId,"  械i h鎢 c黙 ng呓i kh鬾g � g 疴y");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--  鹫t 疬㧟附近所有玩家数
	local nearteammembercount = GetNearTeamCount(sceneId, selfId)
	
	-- 6,检测玩家械i vi阯 里头有没有杀气过重to� 鸬 
	for	i=0, nearteammembercount-1    do
		local memId = GetNearTeamMember(sceneId, selfId, i)
		local pk_value = LuaFnGetHumanPKValue( sceneId, memId )
		if pk_value and pk_value > 0 then
			BeginEvent(sceneId)
				AddText(sceneId,"#BHo鄋h t鋙 M 衋n Uy琻");
				AddText(sceneId,"  Trong 鸬i c� ng叨i s醫 kh� qu� ng kh鬾g th韈h h䅟 ti猲 v鄌.");
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			
			return
		end
	end

	-- 7,玩家等c不能低于30c
	for	i=0, nearteammembercount-1    do
		local memId = GetNearTeamMember(sceneId, selfId, i)
		local level = GetLevel( sceneId, memId )
		if level < 30   then
			BeginEvent(sceneId)
				AddText(sceneId,"#BHo鄋h t鋙 M 衋n Uy琻");
				AddText(sceneId,"  Trong nh髆 c黙 ng呓i c� ng叨i c� 鹌ng c kh鬾g 瘘 c 30!");
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
	end
	
	-- 8,检测喧ng不喧ng有人已经参加过蹴鞠活动
	for	i=0, nearteammembercount-1    do
		local memId = GetNearTeamMember(sceneId, selfId, i)
		local time = GetMissionData(sceneId, memId, MD_CUJU_PRE_TIME)
		local nCurTime = LuaFnGetCurrentTime()
		-- 看上次参加to� 鸬 时间喧ng不喧ng和现T読 有12c醝小时以上to� 鸬 CD
		if nCurTime-time < 60*60*4   then
			BeginEvent(sceneId)
				AddText(sceneId,"#BHo鄋h t鋙 M 衋n Uy琻");
				AddText(sceneId,"  凶ng cho l� ta 醤h m l� chuy阯 m鬾 l 皙n xem m� n� d� nh靚 . C醝 kia ai! Ng呓i kh鬾g ph鋓 m緄 v譨 疸 mu痭 t緄 tham gia qu� tr 黏u  sao?#G th飊h qu� 4 gi� l読 皙n 餴!!");
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
	end
	
	-- 9,每c醝械i vi阯 都C 前6种心法达到30c
	for	i=0, nearteammembercount-1    do
		local memId = GetNearTeamMember(sceneId, selfId, i)
		if x402040_CheckAllXinfaLevel(sceneId, memId, 30) == 0  then
			BeginEvent(sceneId)
				AddText(sceneId,"#BHo鄋h t鋙 M 衋n Uy琻");
				AddText(sceneId,"  C黙 ng呓i 鸬i ng� trung c� 鸬i vi阯  t鈓 ph醦 c b kh鬾g 瘘 30 c, n鄖 kh� n錸g kh鬾g th� th韈h 裯g m鐄 鸾n c� tay 鹫i t醝  k竎h li畉 chi猲 黏u.");
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
	end
	
	-- 10,Th鯽 m鉵所有条件了
	local str = "Ta ch韓h th裞 tuy阯 b� " .. GetName(sceneId,selfId) .. " C鵱g 鸬i ng� 疸 mu痭 c� th� ch韓h th裞 v鄌 b鄋, tham gia m祎 th醤g m祎 l  qu閠 ngang m鐄 鸾n c� tay x鷆 c鷆 鹫i t醝!#r" .. GetName(sceneId,selfId) .. "#W, ch鷆 ng呓i may m."
	BeginEvent(sceneId)
		AddText(sceneId,"#BHo鄋h t鋙 M 衋n Uy琻")
		AddText(sceneId, str)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

	x402040_MakeCopyScene(sceneId, selfId)
end

--**********************************
--列举事件
--**********************************
function x402040_OnEnumerate( sceneId, selfId, targetId )
	AddNumText( sceneId, x402040_g_ScriptId, "Li阯 quan h礽 thi T鷆 C",11 ,1  )
	AddNumText( sceneId, x402040_g_ScriptId, "Thi阯 long T鷆 C",10 ,-1  )
end

--**********************************
--检测Ti猵 th跫�
--**********************************
function x402040_CheckAccept( sceneId, selfId )
	
end

--**********************************
--询问玩家喧ng否要进入副本
--**********************************
function x402040_AskEnterCopyScene( sceneId, selfId )
	
end

--**********************************
--Ti猵 th�
--**********************************
function x402040_OnAccept( sceneId, selfId, targetId )
	
end

--**********************************
--玩家同意进入副本
--**********************************
function x402040_AcceptEnterCopyScene( sceneId, selfId )
	
end

--**********************************
--创建副本
--**********************************
function x402040_MakeCopyScene( sceneId, selfId )
	
	-- 使用械i vi阯 to� 鸬 等c来算出怪物to� 鸬 等c
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
	
	local x
	local z
	x,z = LuaFnGetWorldPos(sceneId,selfId)
	
	leaderguid=LuaFnObjId2Guid(sceneId,selfId)
	LuaFnSetSceneLoad_Map(sceneId, x402040_g_CopySceneMap); --地图喧ng必须选取to� 鸬 ,而且必须T読 Config/SceneInfo.ini里配置好
	LuaFnSetCopySceneData_TeamLeader(sceneId, leaderguid);
	LuaFnSetCopySceneData_NoUserCloseTime(sceneId, x402040_g_NoUserTime*1000);
	LuaFnSetCopySceneData_Timer(sceneId, x402040_g_TickTime*1000);
	LuaFnSetCopySceneData_Param(sceneId, 0, x402040_g_CopySceneType);--设置副本数据,这里将0号索引to� 鸬 数据设置为999,用于表示副本号999(数字自定义)
	LuaFnSetCopySceneData_Param(sceneId, 1, x402040_g_ScriptId);--将1号数据设置为副本场景事件脚本号
	LuaFnSetCopySceneData_Param(sceneId, 2, 0);		--设置定时器调用次数
	LuaFnSetCopySceneData_Param(sceneId, 3, sceneId)	--设置副本入口场景号, 初始化
	LuaFnSetCopySceneData_Param(sceneId, 4, x);				--设置副本to� 鸬 入口场景位置x
	LuaFnSetCopySceneData_Param(sceneId, 5, z);				--设置副本to� 鸬 入口场景位置Z
	LuaFnSetCopySceneData_Param(sceneId, 6, GetTeamId(sceneId,selfId)); --保存队伍号
	LuaFnSetCopySceneData_Param(sceneId, 7, 0) ;	--杀死Bossto� 鸬 数量
	
	for i=8, 31 do
		LuaFnSetCopySceneData_Param(sceneId, i, 0)
	end
	
	local PlayerMaxLevel = GetHumanMaxLevelLimit()
	local iniLevel;
	if mylevel < 10 then
		iniLevel = 1;
	elseif mylevel < PlayerMaxLevel then
		iniLevel = floor(mylevel/10);
	else
		iniLevel = PlayerMaxLevel/10;
	end

	-- 使用副本变量8,9,10来保存怪物编号
	LuaFnSetCopySceneData_Param(sceneId, 8, x402040_g_SmallMonsterId_1[iniLevel]) --小怪ID
	LuaFnSetCopySceneData_Param(sceneId, 9, x402040_g_SmallMonsterId_2[iniLevel]) --小怪ID
	LuaFnSetCopySceneData_Param(sceneId,10, x402040_g_SmallMonsterId_3[iniLevel]) --小怪ID

	LuaFnSetCopySceneData_Param(sceneId,11, x402040_g_MiddleMonsterId[iniLevel])--Tinh英ID
	LuaFnSetCopySceneData_Param(sceneId,12, x402040_g_BossMonsterId[iniLevel]) 	--BossID
	
	-- 使用第11位,记录怪物实际to� 鸬 等c
	LuaFnSetCopySceneData_Param(sceneId,13, mylevel)
	LuaFnSetCopySceneData_Param(sceneId,21, iniLevel-1)
	
	--设置场景中to� 鸬 各种Npc和区域
	LuaFnSetSceneLoad_Area( sceneId, "cuju_area.ini" )
	LuaFnSetSceneLoad_Monster( sceneId, "cuju_monster.ini" )

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
function x402040_OnCopySceneReady( sceneId, destsceneId )

	--进入副本to� 鸬 规则
	-- 1,如果C醝 n鄖 玩家没有组队,就传送C醝 n鄖 玩家自己进入副本
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
		NewWorld( sceneId, leaderObjId, destsceneId, x402040_g_Fuben_X, x402040_g_Fuben_Z) ;
	else
		if IsCaptain(sceneId, leaderObjId) == 0  then
			NewWorld( sceneId, leaderObjId, destsceneId, x402040_g_Fuben_X, x402040_g_Fuben_Z) ;
		else
			local	nearteammembercount = GetNearTeamCount( sceneId, leaderObjId) 
			local mems = {}
			for	i=0,nearteammembercount-1 do
				mems[i] = GetNearTeamMember(sceneId, leaderObjId, i)
				NewWorld( sceneId, mems[i], destsceneId, x402040_g_Fuben_X, x402040_g_Fuben_Z) ;
			end
		end		
	end

end

--**********************************
--有玩家进入副本事件
--**********************************
function x402040_OnPlayerEnter( sceneId, selfId )
	
	-- 2,记录时间
	local nPreTime = GetMissionData(sceneId,selfId, MD_CUJU_PRE_TIME)
	local nCurTime = LuaFnGetCurrentTime()

	SetMissionData(sceneId, selfId, MD_CUJU_PRE_TIME, nCurTime)
	
	-- 3,设� gi鈟劳鍪录�
	SetPlayerDefaultReliveInfo( sceneId, selfId, "%50", -1, "0", sceneId, x402040_g_Fuben_X, x402040_g_Fuben_Z )
	
end

--**********************************
--有玩家T読 副本中死亡事件
--**********************************
function x402040_OnHumanDie( sceneId, selfId, killerId )
	
end

--**********************************
--放弃
--**********************************
function x402040_OnAbandon( sceneId, selfId )
	
end

--**********************************
-- 回城,只有Th鄋h ph� 任务副本可以调用此接口
--**********************************
function x402040_BackToCity( sceneId, selfId )
	
end

--**********************************
--继续
--**********************************
function x402040_OnContinue( sceneId, selfId, targetId )
	
end	

--**********************************
--检测喧ng否可以提交
--**********************************
function x402040_CheckSubmit( sceneId, selfId, selectRadioId )
	
end

--**********************************
--提交
--**********************************
function x402040_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	
end

--**********************************
--杀死怪物或玩家
--**********************************
function x402040_OnKillObject( sceneId, selfId, objdataId, objId )
	
end

--**********************************
--进入区域事件
--**********************************
function x402040_OnEnterZone( sceneId, selfId, zoneId )
	
end

--**********************************
--道具改变
--**********************************
function x402040_OnItemChanged( sceneId, selfId, itemdataId )
	
end

--**********************************
--副本场景定时器事件
--**********************************
function x402040_OnCopySceneTimer( sceneId, nowTime )
--	local once = LuaFnGetCopySceneData_Param( sceneId, x402040_paramonce )
--
--	if (once == 0) then
--	
--		LuaFnSetCopySceneData_Param(sceneId, x402040_paramonce, 1)
--		--年兽入侵
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
--		for i=1, 20 do
--			local objId = LuaFnCreateMonster( sceneId, x402040_g_NianShouID[iNianShouIdx], x402040_g_NianShouPoint[i].x, x402040_g_NianShouPoint[i].z, 1, 272, -1)
--			SetLevel( sceneId, objId, mylevel )
--			LuaFnSendSpecificImpactToUnit(sceneId, objId, objId, objId, 10472, 0); -- zchw
--		end  
--	end

		local nKillNum = LuaFnGetCopySceneData_Param(sceneId, 20)
		
		--PrintNum(nKillNum)

	-- 计时器主要要按照时间来安排刷怪
	local nPreTime = LuaFnGetCopySceneData_Param(sceneId, 15)
	local nCurTime = LuaFnGetCurrentTime()
	local nStep = LuaFnGetCopySceneData_Param(sceneId, 16)

	local SmallMonsterId_1	= LuaFnGetCopySceneData_Param(sceneId, 8)
	local SmallMonsterId_2	= LuaFnGetCopySceneData_Param(sceneId, 9)
	local SmallMonsterId_3	= LuaFnGetCopySceneData_Param(sceneId,10)
	local MiddleMonsterId	= LuaFnGetCopySceneData_Param(sceneId,11)
	local BossMonsterId		= LuaFnGetCopySceneData_Param(sceneId,12)
	
	local nMonsterLevel = LuaFnGetCopySceneData_Param(sceneId,13)
	
	local nPreBossSpeakTime = LuaFnGetCopySceneData_Param(sceneId,20)
	
	local arrayex = 0;           --扩展100c以上,数组偏移量
	local levelex = 0;           --扩展100c以上,大Hoa S T鷆 C等c偏移量
	if(nMonsterLevel >= 110) then
	   arrayex = 4
	   levelex = 10
	end

	-- 第m祎 次执行计时器	
	if nPreTime == 0 then
		LuaFnSetCopySceneData_Param(sceneId, 15, nCurTime)
		x402040_TipAllHuman( sceneId, "Thi阯 Long T鷆 C s� b 馥u sau 60s .." )
		return
	end
	
	-- 每间隔10 gi鈟提示玩家,“Thi阯 Long T鷆 C s� b 馥u sau AAs ..”
	if nStep==0 and nCurTime-nPreTime>=10  then
		x402040_TipAllHuman( sceneId, "Thi阯 Long T鷆 C s� b 馥u sau 50s .." )
		LuaFnSetCopySceneData_Param(sceneId, 16, nStep+1)
		LuaFnSetCopySceneData_Param(sceneId, 15, nCurTime)
		return
	end
	if nStep==1 and nCurTime-nPreTime>=10  then
		x402040_TipAllHuman( sceneId, "Thi阯 Long T鷆 C s� b 馥u sau 40s .." )
		LuaFnSetCopySceneData_Param(sceneId, 16, nStep+1)
		LuaFnSetCopySceneData_Param(sceneId, 15, nCurTime)
		return
	end
	if nStep==2 and nCurTime-nPreTime>=10  then
		x402040_TipAllHuman( sceneId, "Thi阯 Long T鷆 C s� b 馥u sau 30s .." )
		LuaFnSetCopySceneData_Param(sceneId, 16, nStep+1)
		LuaFnSetCopySceneData_Param(sceneId, 15, nCurTime)
		return
	end
	if nStep==3 and nCurTime-nPreTime>=10  then
		x402040_TipAllHuman( sceneId, "Thi阯 Long T鷆 C s� b 馥u sau 20s .." )
		LuaFnSetCopySceneData_Param(sceneId, 16, nStep+1)
		LuaFnSetCopySceneData_Param(sceneId, 15, nCurTime)
		return
	end
	if nStep==4 and nCurTime-nPreTime>=10  then
		x402040_TipAllHuman( sceneId, "Thi阯 Long T鷆 C s� b 馥u sau 10s .." )
		LuaFnSetCopySceneData_Param(sceneId, 16, nStep+1)
		LuaFnSetCopySceneData_Param(sceneId, 15, nCurTime+5)
		return
	end
	
	local nMonsterNum = GetMonsterCount(sceneId)
	local bHaveMonster = 0
	for ii=0, nMonsterNum-1 do
		local nMonsterId = GetMonsterObjID(sceneId,ii)
		if GetName(sceneId, nMonsterId)== "Ho鄋g S T鷆 C" or 
			 GetName(sceneId, nMonsterId)== "H皀g S T鷆 C" or 
			 GetName(sceneId, nMonsterId)== "Lam S T鷆 C" 		 then
			if nowTime - GetObjCreateTime(sceneId, nMonsterId) > 60000  then
				-- 检测C醝 n鄖 怪to� 鸬 当前血量喧ng不喧ng大于最大血量to� 鸬 1%,
				if GetHp(sceneId,nMonsterId) > 0  then
					-- 删除C醝 n鄖 怪,T読 C醝 n鄖 位置创建m祎 c醝新to� 鸬 怪
					local PosX, PosZ = LuaFnGetWorldPos(sceneId, nMonsterId);
					PosX = floor(PosX);
					PosZ = floor(PosZ);
					
					LuaFnDeleteMonster(sceneId, nMonsterId)
					local nMiddleMonster = LuaFnCreateMonster(sceneId, MiddleMonsterId, PosX, PosZ, 3, 0, 402045);
					
					SetLevel(sceneId, nMiddleMonster, nMonsterLevel)
					SetNPCAIType(sceneId, nMiddleMonster, 0)
					SetCharacterName(sceneId, nMiddleMonster, "Hoa S T鷆 C")
				end
			end	
		end
		
		if GetName(sceneId, nMonsterId)== "Ho鄋g S 姓i T鷆 C" or 
			 GetName(sceneId, nMonsterId)== "H皀g S 姓i T鷆 C" or 
			 GetName(sceneId, nMonsterId)== "Lam S 姓i T鷆 C" 		 then
			if nowTime - GetObjCreateTime(sceneId, nMonsterId) > 60000  then
				-- 检测C醝 n鄖 怪to� 鸬 当前血量喧ng不喧ng大于最大血量to� 鸬 1%,
				if GetHp(sceneId,nMonsterId) > 0  then
					-- 删除C醝 n鄖 怪,T読 C醝 n鄖 位置创建m祎 c醝新to� 鸬 怪
					local PosX, PosZ = LuaFnGetWorldPos(sceneId, nMonsterId);
					PosX = floor(PosX);
					PosZ = floor(PosZ);
					
					LuaFnDeleteMonster(sceneId, nMonsterId)
					local nIniLevel = LuaFnGetCopySceneData_Param(sceneId, 21)
					local nBigBallId =x402040_g_BigFootBall[4 + arrayex]+nIniLevel-levelex
					local nMiddleMonster = LuaFnCreateMonster(sceneId, nBigBallId, PosX, PosZ, 3, 0, 402045);
					
					SetLevel(sceneId, nMiddleMonster, nMonsterLevel)
					SetNPCAIType(sceneId, nMiddleMonster, 0)
					SetCharacterName(sceneId, nMiddleMonster, "Hoa S T鷆 C")
				end
			end	
		end
	end

	if nStep>=5 and nStep<154 and nCurTime-nPreBossSpeakTime>=60 then
		LuaFnSetCopySceneData_Param(sceneId,20,nCurTime)
		
		local nRand = random(6)
		local str = ""
		if nRand == 1  then
			str = "#{_BOSS4}#P:Ch鷑g ta l� ng叨i n痠 nghi畃 T鷆 C Trung Hoa! K� th譨 cao c 鸢ng qu醤  quang vinh truy玭 th痭g!"
		elseif nRand == 2  then
			str = "#{_BOSS4}#P:Mau mau mau, ph鈔 bi阯 l誴! H� 瓞 l誴! Truy玭 trung l誴! 啸u c c鬾g m鬾 l誴!"
		elseif nRand == 3  then
			str = "#{_BOSS4}#P:Hoa S T鷆 C, Ho鄋g S T鷆 C, H皀g S T鷆 C, Lam S T鷆 Ct, t読 疴y m祎 kh linh h皀 chi猰 疬㧟!"
		elseif nRand == 4  then
			str = "#{_BOSS4}#P:啸y tr秈 tinh 鹫i bi瑄  ta t鬾 m� m�  quang vinh truy玭 th痭g! N� kh鬾g ph鋓 m祎 ng叨i! N� kh鬾g ph鋓 m祎 ng叨i!"
		elseif nRand == 5  then
			str = "#{_BOSS4}#P:Ai nha c醕 ng呓i h鋙 b眓 a! Ho鄋g S T鷆 C, ng呓i n骾, ng呓i nh� th� n鄌 t眓g 鹧ng l鄊 cho ng叨i ta gia 疳nh a?"
		else
			str = "#{_BOSS4}#P:Ng呓i l読 疳nh T鷆 C, ng叨i ta s� kh鬾g v緄 ng呓i t痶 l!"
		end
		
		-- T読 场景范围内喊话
		CallScriptFunction((200060), "Duibai",sceneId, "", "M鐄 衋n Uy琻", str)
	end
	
	-- T読 刷第20,50,120c醝足球之前,C 有m祎 些小情节
	if nStep==24 or nStep==54 or nStep==124  then
		local nStep_1 = LuaFnGetCopySceneData_Param(sceneId, 25)
		local nStep_1_T = LuaFnGetCopySceneData_Param(sceneId, 26)
		if nStep_1 == 0  then
			LuaFnSetCopySceneData_Param(sceneId, 25, nStep_1+1)
			LuaFnSetCopySceneData_Param(sceneId, 26, nCurTime)
			
			local str = ""
			if nStep==24 then
				str = "#{_BOSS4}#P:凶ng qu� 稹c � ! Ch� ta thay 鸨i ng叨i! L㱮 h読  c騨 t読 m sau 疴u!"
			elseif nStep==24 then
				str = "#{_BOSS4}#P:Ai c叨i 疳p cu痠 c鵱g! Ai c叨i  t痶 nh! Ta c騨 mu痭 thay 鸨i ng叨i!"
			else
				str = "#{_BOSS4}#P:Ng呓i xong r癷! Ta mu痭 皙n l唼t ta c叨ng 鹫i nh 鸶a c 鸬i l阯 s鈔 kh !"
			end
			CallScriptFunction((200060), "Duibai",sceneId, "", "M鐄 衋n Uy琻", str)
			x402040_TipAllHuman( sceneId, "T鬾 M� M� th飊h c thay 鸨i ng叨i, 30 gi鈟 sau tr 黏u ti猵 t鴆 ti猲 h鄋h." )
			
		elseif nStep_1 == 1  then
			if nCurTime-nStep_1_T >= 10 then
				x402040_TipAllHuman( sceneId, "T鬾 M� M� th飊h c thay 鸨i ng叨i, 20 gi鈟 sau tr 黏u ti猵 t鴆 ti猲 h鄋h." )
				
				LuaFnSetCopySceneData_Param(sceneId, 25, nStep_1+1)
				LuaFnSetCopySceneData_Param(sceneId, 26, nCurTime)
			end
			
		elseif nStep_1 == 2  then
			if nCurTime-nStep_1_T >= 10 then
				x402040_TipAllHuman( sceneId, "T鬾 M� M� th飊h c thay 鸨i ng叨i, 10 gi鈟 sau tr 黏u ti猵 t鴆 ti猲 h鄋h." )
				
				LuaFnSetCopySceneData_Param(sceneId, 25, nStep_1+1)
				LuaFnSetCopySceneData_Param(sceneId, 26, nCurTime)
			end
			
		elseif nStep_1 == 3  then
			if nCurTime-nStep_1_T >= 10 then
				x402040_TipAllHuman( sceneId, "Tr 黏u m祎 l n鎍 b 馥u." )
				
				LuaFnSetCopySceneData_Param(sceneId, 25, nStep_1+1)
				LuaFnSetCopySceneData_Param(sceneId, 26, nCurTime)
				
				-- 刷m祎 c醝大足球
				local nIniLevel = LuaFnGetCopySceneData_Param(sceneId, 21)
				
				local nBigFootballId = 0
				local ran = random(3)
				local szName = ""
				if ran == 1  then
					nBigFootballId  = x402040_g_BigFootBall[1 + arrayex]+nIniLevel-levelex
					szName = "Ho鄋g S 姓i T鷆 C"
				elseif ran == 2  then
					nBigFootballId  = x402040_g_BigFootBall[2 + arrayex]+nIniLevel-levelex
					szName = "H皀g S 姓i T鷆 C"
				else
					nBigFootballId  = x402040_g_BigFootBall[3 + arrayex]+nIniLevel-levelex
					szName = "Lam S 姓i T鷆 C"
				end
				
				local Point = x402040_g_MonsterPoint[nStep-4]
				local nNpc1 = LuaFnCreateMonster(sceneId, nBigFootballId, 
																					Point.x+random(2), 
																					Point.z, 
																					3, 0, 402045)
				SetLevel(sceneId, nNpc1, nMonsterLevel)
				SetCharacterName(sceneId, nNpc1, szName)
			end
			
		elseif nStep_1 == 4  then
			LuaFnSetCopySceneData_Param(sceneId, 25, 0)
			LuaFnSetCopySceneData_Param(sceneId, 26, nCurTime)
			
			LuaFnSetCopySceneData_Param(sceneId, 15, nCurTime)
			LuaFnSetCopySceneData_Param(sceneId, 16, nStep+1)
		end
		
	end

	-- 现按照简单to� 鸬 每10 gi鈟刷m祎 次怪
	if 	(nStep>=5   and nStep<24  and nCurTime-nPreTime >= 15) or
			(nStep>=25  and nStep<54  and nCurTime-nPreTime >= 12) or
			(nStep>=55  and nStep<124 and nCurTime-nPreTime >= 10) or
			(nStep>=125 and nStep<154	and nCurTime-nPreTime >= 5)   then
		
		-- 怪物生成 餴琺
		if nStep == 5  then
			x402040_TipAllHuman( sceneId, "Tr 黏u T鷆 C ch韓h th裞 b 馥u" )
		end
		
		local Point = x402040_g_MonsterPoint[nStep-4]
	
		-- 怪物ID
		local nMonsterId = 0 
		local ran = random(3)
		if ran == 1  then
			nMonsterId = SmallMonsterId_1
		elseif ran == 2  then
			nMonsterId = SmallMonsterId_2
		else
			nMonsterId = SmallMonsterId_3
		end
		
		local nNpc1 = LuaFnCreateMonster(sceneId, nMonsterId, Point.x+random(2), Point.z, 3, 0, 402045)
		SetLevel(sceneId, nNpc1, nMonsterLevel)
		--SetNPCAIType(sceneId, nNpc1, 0)
		
		if ran == 1  then
			SetCharacterName(sceneId, nNpc1, "Ho鄋g S T鷆 C")
		elseif ran == 2  then
			SetCharacterName(sceneId, nNpc1, "H皀g S T鷆 C")
		else
			SetCharacterName(sceneId, nNpc1, "Lam S T鷆 C")
		end
		
		nStep = nStep+1
		LuaFnSetCopySceneData_Param(sceneId, 15, nCurTime)
		LuaFnSetCopySceneData_Param(sceneId, 16, nStep)
	end
		
	if nStep==154 then
		-- 检测喧ng不喧ng所有to� 鸬 小怪都死光,如果死光,10 gi鈟后固定地� gi鈟OSS
		local nMonsterNum = GetMonsterCount(sceneId)
		local bHaveMonster = 0
		for ii=0, nMonsterNum-1 do
			local nMonsterId = GetMonsterObjID(sceneId,ii)
			if GetName(sceneId, nMonsterId)== "Ho鄋g S T鷆 C" then
				bHaveMonster = 1
				break
			end
			if GetName(sceneId, nMonsterId)== "H皀g S T鷆 C" then
				bHaveMonster = 1
				break
			end
			if GetName(sceneId, nMonsterId)== "Lam S T鷆 C" then
				bHaveMonster = 1
				break
			end
			if GetName(sceneId, nMonsterId)== "Hoa S T鷆 C" then
				bHaveMonster = 1
				break
			end
		end

		if bHaveMonster == 0   then
			nStep = nStep+1
			LuaFnSetCopySceneData_Param(sceneId, 15, nCurTime)
			LuaFnSetCopySceneData_Param(sceneId, 16, nStep)
		end
	end
	
	if 	nStep==155 then
		x402040_TipAllHuman( sceneId, "T鬾 M� M� 10 gi鈟 sau s� xu hi畁" )
		LuaFnSetCopySceneData_Param(sceneId, 16, nStep+1)
		LuaFnSetCopySceneData_Param(sceneId, 15, nCurTime)
		return
		
	end
	
	if 	nStep==156 and nCurTime-nPreTime>=10  then
		nStep = nStep+1
		LuaFnSetCopySceneData_Param(sceneId, 15, nCurTime)
		LuaFnSetCopySceneData_Param(sceneId, 16, nStep)
		local nNpc1 = LuaFnCreateMonster(sceneId, BossMonsterId, x402040_g_BossPoint.x, x402040_g_BossPoint.z, 19, 216, 402040)
		SetLevel(sceneId, nNpc1, nMonsterLevel)
		SetNPCAIType(sceneId, nNpc1, 0)
		SetCharacterName(sceneId, nNpc1, "T鬾 M� M�")
		SetCharacterTitle(sceneId, nNpc1, "T鷆 C th tam mu礽")
		
		x402040_TipAllHuman( sceneId, "T鬾 M� M� xu hi畁" )
	end
	
end

--**********************************
--检测心法喧ng不够接任务
--**********************************
function x402040_OnDie(sceneId, objId, killerId)
	--杀死怪物to� 鸬 喧ng宠物詍祎 袢∑渲魅藅o� 鸬 ID....
	local playerID = killerId
	local objType = GetCharacterType( sceneId, killerId )
	if objType == 3 then
		playerID = GetPetCreator( sceneId, killerId )
	end
		--如果组了队詍祎 袢《映o� 鸬 ID....
	local nLeaderId = GetTeamLeader(sceneId, playerID)
	if nLeaderId < 1   then
		nLeaderId = playerID
	end
	
	local str = ""
	str = format("#PT読 M鐄 衋ng Uy琻, #{_INFOUSR%s}#P th痭g l頽h 鸬i ng� 疳nh b読 #{_BOSS4}#P, 鹫t 疬㧟 m祎 h癷 nh� nh鄋g vui v� 馥m 痨a  鹫i thg!", GetName(sceneId,nLeaderId))
	BroadMsgByChatPipe(sceneId, nLeaderId, str, 4)
	
end

--**********************************
--检测心法喧ng不够接任务
--**********************************
function x402040_CheckAllXinfaLevel(sceneId, selfId, level)
	local nMenpai = GetMenPai(sceneId, selfId)
	if nMenpai<0 or nMenpai>8   then
		return 0
	end
	
	for i=1, 6 do
		local nXinfaLevel = LuaFnGetXinFaLevel(sceneId, selfId, nMenpai*6 + i)
		if nXinfaLevel < level    then
			return 0
		end
	end
	return 1
end

--**********************************
--提示所有副本内玩家
--**********************************
function x402040_TipAllHuman( sceneId, Str )
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

