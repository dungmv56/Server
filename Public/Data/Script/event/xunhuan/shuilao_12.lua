--副本任务
--水牢
--10c醝犯人头目,各统领5只小怪

--************************************************************************
--MisDescBegin
--脚本号
x232002_g_ScriptId	= 232002
--副本名称
x232002_g_CopySceneName	= "Thu� lao"
--任务号
x232002_g_MissionId			= 1213
--上m祎 c醝任务to� 鸬 ID
x232002_g_MissionIdPre	= 1212
--目标NPC
x232002_g_Name					= "H� Di阯 Kh醤h"
--喧ng否喧ngTinh英任务
x232002_g_IfMissionElite= 1
--衅ng c nhi甿 v� 
x232002_g_MissionLevel	= 10000
--任务归类
x232002_g_MissionKind		= 1
--任务文本描述
x232002_g_MissionName			= "Thu� lao"
--任务描述
x232002_g_MissionInfo			= "#{event_xunhuan_0006}"
--M鴆 ti陁 nhi甿 v�
x232002_g_MissionTarget		= "  H� Di阯 Kh醤h � t読 Th醝 H� #{_INFOAIM67,77,4,H� Di阯 Kh醤h} y陁 c c醕 h� gi猼 10 t阯 ph誱 nh鈔 馥u m鴆 v� 50 con ti瑄 qu醝."
--未Ho鄋 t nhi甿 v鴗o� 鸬 npc对话
x232002_g_ContinueInfo		= "  C� ph鋓 ng呓i 疸 gi猼 ch猼 10 t阯 馥u m鴆 ph誱 nh鈔 hung h鉵 v� nhi玼 ti瑄 qu醝 v?"
--Ho鄋 t nhi甿 v鴑pc说话to� 鸬 话
x232002_g_MissionComplete	= "  R痶 cu礳 Thu� lao 疸 疬㧟 gi� v鎛g, sau n鄖 ch鷑g ta tuy畉 鸠i kh鬾g 疬㧟 l� l�"
--任务奖励
x232002_g_MoneyBonus			= 1000
--********下面几项喧ng动态显示to� 鸬 内容,用于T読 任务列表中动态显示任务情况******
--循环任务to� 鸬 数据索引,里面存着已做to� 鸬 环数 MD_SHUILAO_HUAN
--任务喧ng否已经完成
--MissionRound =
--**********************************以上喧ng动态****************************
--角色Mission变量� 餴琺�
x232002_g_IsMissionOkFail	= 0	--0号: 当前任务喧ng否完成(0未完成；1完成)
x232002_g_MissionRound		= 5	--Define MD_BAIMASI_HUAN from ScriptGlobal.lua
x232002_g_DemandKill			= { {id=367,num=60} }
x232002_g_Param_killcount	= 1	--1号: 杀死任务怪to� 鸬 数量
x232002_g_Param_sceneid		= 2	--2号: 当前副本任务to� 鸬 场景号
x232002_g_Param_teamid		= 3	--3号: 接副本任务时候to� 鸬 队伍号
x232002_g_Param_time			= 4	--4号: 完成副本所用时间(单位:  gi鈟)
--6号: 具体副本事件脚本占用
--7号: 具体副本事件脚本占用
--MisDescEnd
--************************************************************************

x232002_g_CopySceneType			= FUBEN_SHUILAO	--副本类型,定义T読 ScriptGlobal.lua里面
x232002_g_LimitMembers			= 1		--可以进副本to� 鸬 最小队伍人数
x232002_g_TickTime					= 5		--回调脚本to� 鸬 时钟时间(单位:  gi鈟/次)
x232002_g_LimitTotalHoldTime= 360	--副本可以存活to� 鸬 时间(单位: 次数),如果此时间到了,则任务将会th b読
x232002_g_CloseTick					= 6		--副本关闭前倒计时(单位: 次数)
x232002_g_NoUserTime				= 300	--副本中没有人后可以继续保存to� 鸬 时间(单位:  gi鈟)
x232002_g_Fuben_X						= 95	--进入副本to� 鸬 位置X
x232002_g_Fuben_Z						= 89	--进入副本to� 鸬 位置Z
x232002_g_Back_X						= 52	--源场景位置X
x232002_g_Back_Z						= 96	--源场景位置Z
x232002_g_NeedMonsterGroupID= 1		--C 杀死to� 鸬 Bossto� 鸬 GroupID
x232002_g_TotalNeedKillBoss	= 60	--C 杀死Boss数量

--副本数据索引对照
x232002_g_keySD					=
{
	["typ"]	= 0,	--设置副本类型
	["spt"]	= 1,	--设置副本场景事件脚本号
	["tim"]	= 2,	--设置定时器调用次数
	["scn"]	= 3,	--设置副本入口场景号, 初始化
	["cls"]	= 4,	--设置副本关闭标志, 0开放,1关闭
	["dwn"]	= 5,	--设置离开倒计时次数
	["tem"]	= 6,	--保存队伍号
	["kil"]	= 7,	--杀死Bossto� 鸬 数量
	["lev"]	= 8,	--怪物自适应等c
}

--接取任务to� 鸬 最低等c
x232002_g_minLevel			= 20
--C 配置小怪物
x232002_g_namMonster		= "Ph誱 nh鈔 b靚h th叨ng"
x232002_g_typMonster		= --普通犯人10~100c
	{ 2490, 2491, 2492, 2493, 2494,
		2495, 2496, 2497, 2498, 2499 }

--1/20to� 鸬 几率给于宝石奖励
x232002_g_gemList				= { 50101001, 50101002, 50111001, 50111002 }
x232002_g_gemRate				= 20
					
x232002_g_IsMissionOkFailPre	= 0	--0号: 平定任务喧ng否完成(0未完成；1完成)

x232002_g_MaxSameIPNum = 3
--**********************************
--任务入口函数
--**********************************
function x232002_OnDefaultEvent( sceneId, selfId, targetId )

	--判断该npc喧ng否喧ng对应任务to� 鸬 npc
	if LuaFnGetName( sceneId, targetId ) ~= x232002_g_Name then
		return
	end

	--如果玩家已经接了C醝 n鄖 任务
	if IsHaveMission( sceneId, selfId, x232002_g_MissionId ) > 0 then

		local	misIndex	= GetMissionIndexByID( sceneId, selfId, x232002_g_MissionId )
		local	bDone			= x232002_CheckSubmit( sceneId, selfId )
		--任务未完成
		if bDone == 0 then
			BeginEvent( sceneId )
				AddText( sceneId, x232002_g_MissionName )
				AddText( sceneId, "  Chu b� xong ch遖?" )
			EndEvent()
			DispatchMissionInfo( sceneId, selfId, targetId, x232002_g_ScriptId, x232002_g_MissionId )
		--任务已经完成
		elseif bDone == 1 then
			BeginEvent( sceneId )
				AddText( sceneId, x232002_g_MissionName )
				AddText( sceneId, x232002_g_ContinueInfo )
				AddMoneyBonus( sceneId, x232002_g_MoneyBonus )
			EndEvent( )
			DispatchMissionDemandInfo( sceneId, selfId, targetId, x232002_g_ScriptId, x232002_g_MissionId, bDone )
		end

	else

		--发送任务Ti猵 th毕允総o� 鸬 信息
		BeginEvent( sceneId )
			AddText( sceneId, x232002_g_MissionName )
			AddText( sceneId, x232002_g_MissionInfo )
			AddText( sceneId, "#{M_MUBIAO}" )
			AddText( sceneId, x232002_g_MissionTarget )
			AddText( sceneId, " " )
			AddMoneyBonus( sceneId, x232002_g_MoneyBonus )
		EndEvent( )
		DispatchMissionInfo( sceneId, selfId, targetId, x232002_g_ScriptId, x232002_g_MissionId )

	end

end

--**********************************
--列举事件
--**********************************
function x232002_OnEnumerate( sceneId, selfId, targetId )

	if IsHaveMission( sceneId, selfId, x232002_g_MissionIdPre ) == 0 then
		x232002_MsgBox( sceneId, selfId, targetId, "  Huynh 甬 H� Di阯 B醥 c黙 ta 疸 t緄 T� Ch鈛 c製 binh r癷, ng呓i c� g kh鬾g?" )
		return
	else
		if IsHaveMission( sceneId, selfId, x232002_g_MissionId ) == 1 then
			local	misIndex		= GetMissionIndexByID( sceneId, selfId, x232002_g_MissionId )
			local	misIndexPre	= GetMissionIndexByID( sceneId, selfId, x232002_g_MissionIdPre )
			if GetMissionParam( sceneId, selfId, misIndex, x232002_g_IsMissionOkFail ) == 1
				and GetMissionParam( sceneId, selfId, misIndexPre, x232002_g_IsMissionOkFailPre ) == 1 then
					x232002_MsgBox( sceneId, selfId, targetId, "  Ng呓i c� th� quay v� T� Ch鈛 t靘 huynh 甬 H� Di阯 B醥 c黙 ta l頽h tg th叻ng!" )
					return
			end
			if GetMissionParam( sceneId, selfId, misIndex, x232002_g_IsMissionOkFail ) ~= 1
				and GetMissionParam( sceneId, selfId, misIndexPre, x232002_g_IsMissionOkFailPre ) == 2 then
					x232002_MsgBox( sceneId, selfId, targetId, "  R ti猚, nhi甿 v� b靚h 鸶nh c黙 ng呓i 疸 th b読" )
					return
			end
		end
	end

	AddNumText( sceneId, x232002_g_ScriptId, x232002_g_MissionName, 4, -1 )

end

--**********************************
--检测Ti猵 th跫�
--**********************************
function x232002_CheckAccept( sceneId, selfId, targetId )

	if LuaFnGetLevel( sceneId, selfId ) < x232002_g_minLevel then
		x232002_NotifyTip( sceneId, selfId, "衅ng c c黙 c醕 h� qu� th, ph誱 nh鈔 kh� l㱮 h読" )
		x232002_NotifyTip( sceneId, selfId, "V鏽 瘙i ng呓i 皙n"..x232002_g_minLevel.."Sau khi th錸g c t緄 t靘 ta" )
		return 0
	end

	if LuaFnHasTeam( sceneId, selfId ) == 0 then
		x232002_NotifyTip( sceneId, selfId, "L唼ng ph誱 nh鈔 trong Thu� lao r 痿ng, ng呓i 鸾n th鈔 th� l馽 m鰊g" )
		x232002_NotifyTip( sceneId, selfId, "Hay l� g鱥 th阭 v鄆 tr� th� t緄 gi鷓" )
		return 0
	end

	if LuaFnIsTeamLeader( sceneId, selfId ) == 0 then
		x232002_NotifyTip( sceneId, selfId, "Ng呓i kh鬾g ph鋓 l� nh髆 tr叻ng" )
		x232002_NotifyTip( sceneId, selfId, "Ch� c� nh髆 tr叻ng m緄 c� th� quy猼 鸶nh ti猵 nh 鼀 th醕 c黙 ta hay kh鬾g" )
		return 0
	end

	--取 餴琺玩家附近to� 鸬 队友数量(包括自己)
	local	numMem	= GetNearTeamCount( sceneId, selfId )
	if numMem ~= LuaFnGetTeamSize( sceneId, selfId ) then
		x232002_NotifyTip( sceneId, selfId, "Ng呓i c� nh髆 vi阯 kh鬾g � g 疴y" )
		return 0
	end

	if numMem < x232002_g_LimitMembers then
		x232002_NotifyTip( sceneId, selfId, "L唼ng ph誱 nh鈔 trong Thu� lao r 痿ng" )
		x232002_NotifyTip( sceneId, selfId, "Ch� 韙 c醕 ng呓i c鹡g c c� "..x232002_g_LimitMembers.." ta m緄 y阯 t鈓 瓞 c醕 ng呓i 餴" )
		return 0
	end

	--检测小队中喧ng否有人任务记录已满, 队友喧ng否已经接过此任务
	local member
	local i
	local misIndex
	--增加IP判断
	local hostIp=""
	local IPList={}
	for	i=0, numMem-1 do
		member = GetNearTeamMember( sceneId, selfId, i )

		if IsHaveMission( sceneId, member, x232002_g_MissionIdPre ) <= 0 then
			x232002_NotifyTip( sceneId, selfId, "Trong nh髆 c� ng叨i ch遖 nh nhi甿 v� Thu� lao" )
			return 0
		end

		misIndex = GetMissionIndexByID( sceneId, member, x232002_g_MissionIdPre )
		if GetMissionParam( sceneId, member, misIndex, 6 ) ~= 1 then
			x232002_NotifyTip( sceneId, selfId, "Trong nh髆 c� ng叨i 疸 nh nhi甿 v� b靚h 鸶nh" )
			return 0
		end
		
		if GetMissionParam( sceneId, member, misIndex, x232002_g_IsMissionOkFailPre ) == 1 then
			x232002_NotifyTip( sceneId, selfId, "Trong nh髆 c� ng叨i 疸 ho鄋 t nhi甿 v� b靚h 鸶nh" )
			x232002_MsgBox( sceneId, selfId, targetId, "  V� c鵱g c鋗 t� c醕 h� 疸 gi鷓 ta b靚h 鸶nh 疳m ph鋘 lo課 Thu� lao, xin quay v� T� Ch鈛 t靘 huynh 甬 H� Di阯 B醥 c黙 ta l頽h tg th叻ng. Ch鷗 qu� m鱪 t� th鄋h �" )
			return 0
		end

		if GetMissionParam( sceneId, member, misIndex, x232002_g_IsMissionOkFail ) == 1 then
			x232002_NotifyTip( sceneId, selfId, "Trong nh髆 c� ng叨i 疸 Ho鄋 t nhi甿 v� n鄖" )
			return 0
		end

		--队友身上任务数量喧ng否达到上限20c醝
		if GetMissionCount( sceneId, member ) >= 20 then
			x232002_NotifyTip( sceneId, selfId, "Ghi ch閜 nhi甿 v� c黙 ng叨i trong 鸬i ng� 疸 馥y" )
			return 0
		end

		if IsHaveMission( sceneId, member, x232002_g_MissionId ) > 0 then
			--队友喧ng否已经接过此任务或者另外m祎 c醝任务
			x232002_NotifyTip( sceneId, selfId, "Trong 鸬i 疸 c� ng叨i nh nhi甿 v� n鄖" )
			return 0
		end
		
		hostIp = GetHostIP(sceneId, member)
		IPList[i]=hostIp
		
	end
	local sameIPNum = 1
	for	i=0, numMem-1 do
		local nTemp = 1
		for j=0,numMem-1 do
			if IPList[i] == IPList[j] and i ~= j then
				nTemp = nTemp + 1
			end
		end
		if sameIPNum < nTemp then
			sameIPNum = nTemp
		end			
	end

	if sameIPNum >= x232002_g_MaxSameIPNum then
		--x232002_NotifyTip( sceneId, selfId, "#{SLIP_090714_1}" )
		x232002_MsgBox( sceneId, selfId, targetId, "#{SLIP_090714_1}" )
		return 0
	end

	return 1
end

--**********************************
--Ti猵 th�
--**********************************
function x232002_OnAccept( sceneId, selfId, targetId )

	local teamid = GetTeamId( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x232002_g_MissionId ) > 0 then
		local misIndex 		= GetMissionIndexByID( sceneId, selfId, x232002_g_MissionId )
		local misIndexPre	= GetMissionIndexByID( sceneId, selfId, x232002_g_MissionIdPre )
		local copysceneid	= GetMissionParam( sceneId, selfId, misIndex, x232002_g_Param_sceneid )
		local saveteamid	= GetMissionParam( sceneId, selfId, misIndex, x232002_g_Param_teamid )
		--进过副本
		if copysceneid >= 0 and teamid == saveteamid then
			--将自己传送到副本场景
			if IsCanEnterCopyScene( copysceneid, GetHumanGUID( sceneId, selfId ) ) == 1 then
				NewWorld( sceneId, selfId, copysceneid, x232002_g_Fuben_X, x232002_g_Fuben_Z )
			else
				x232002_NotifyTip( sceneId, selfId, "Nhi甿 v� th b読, h銀 b� 餴 v� nh l読" )
				SetMissionByIndex( sceneId, selfId, misIndex, x232002_g_IsMissionOkFail, 2 )
				SetMissionByIndex( sceneId, selfId, misIndexPre, x232002_g_IsMissionOkFailPre, 2 )
			end
			return
		end
	end

	--判断接收条件
	if x232002_CheckAccept( sceneId, selfId, targetId ) == 0 then
		return
	end

	--加入任务到玩家列表
	--取 餴琺玩家附近to� 鸬 队友数量(包括自己)
	local numMem	= GetNearTeamCount( sceneId, selfId )
	local member
	local i
	local misIndex
	for	i=0, numMem-1 do
		member = GetNearTeamMember( sceneId, selfId, i )
		--给每c醝队伍成员加入任务
		AddMission( sceneId, member, x232002_g_MissionId, x232002_g_ScriptId, 1, 0, 0 )

		misIndex = GetMissionIndexByID( sceneId, member, x232002_g_MissionId )
		--将任务to� 鸬 第0号数据设置为0,表示未完成to� 鸬 任务
		SetMissionByIndex( sceneId, member, misIndex, x232002_g_IsMissionOkFail, 0 )
		--将任务to� 鸬 第2号数据设置为-1, 用于保存副本to� 鸬 场景号
		SetMissionByIndex( sceneId, member, misIndex, x232002_g_Param_sceneid, -1 )
		--将任务to� 鸬 第3号数据队伍号
		SetMissionByIndex( sceneId, member, misIndex, x232002_g_Param_teamid, teamid )
		
		misIndexPre = GetMissionIndexByID( sceneId, member, x232002_g_MissionIdPre )
		SetMissionByIndex( sceneId, member, misIndexPre, x232002_g_IsMissionOkFailPre, 1 )
	end

	x232002_MakeCopyScene( sceneId, selfId, numMem )
end

--**********************************
--放弃
--**********************************
function x232002_OnAbandon( sceneId, selfId )

	local misIndex		= GetMissionIndexByID( sceneId, selfId, x232002_g_MissionId )
	local copyscene		= GetMissionParam( sceneId, selfId, misIndex, x232002_g_Param_sceneid )

	x232002_NotifyTip( sceneId, selfId, "Nhi甿 v� th b読!" )
	x232002_MissionFailExe( sceneId, selfId )

	--如果T読 副本里删除任务,则直接传送回
	if sceneId == copyscene then
		--取 餴琺副本入口场景号
		local	oldsceneId	= LuaFnGetCopySceneData_Param( sceneId, 3 )
		NewWorld( sceneId, selfId, oldsceneId, x232002_g_Back_X, x232002_g_Back_Z )
	end

end

--**********************************
--创建副本
--**********************************
function x232002_MakeCopyScene( sceneId, selfId, nearmembercount )

	--指数参数
	local	param0	= 4;
	local	param1	= 3;

	--最终结果
	local	mylevel	= 0;

	--临时变量
	local mems		= {};
	local	tempMemlevel = 0;
	local	level0 = 0;
	local	level1 = 0;
	for	i = 0, nearmembercount - 1 do
		mems[i]	= GetNearTeamMember(sceneId, selfId, i);
		tempMemlevel = GetLevel(sceneId, mems[i]);
		level0	= level0 + (tempMemlevel ^ param0);
		level1	= level1 + (tempMemlevel ^ param1);
	end

	if level1 == 0 then
		mylevel = x232002_g_minLevel;
	else
		mylevel = level0/level1;
	end

	local leaderguid = LuaFnObjId2Guid( sceneId, selfId )
	--地图喧ng必须选取to� 鸬 ,而且必须T読 Config/SceneInfo.ini里配置好
	LuaFnSetSceneLoad_Map( sceneId, "shuilao.nav" )
	LuaFnSetCopySceneData_TeamLeader( sceneId, leaderguid )
	LuaFnSetCopySceneData_NoUserCloseTime( sceneId, x232002_g_NoUserTime * 1000 )
	LuaFnSetCopySceneData_Timer( sceneId, x232002_g_TickTime * 1000 )
	LuaFnSetCopySceneData_Param( sceneId, x232002_g_keySD["typ"], x232002_g_CopySceneType )
	LuaFnSetCopySceneData_Param( sceneId, x232002_g_keySD["spt"], x232002_g_ScriptId )
	LuaFnSetCopySceneData_Param( sceneId, x232002_g_keySD["tim"], 0 )
	LuaFnSetCopySceneData_Param( sceneId, x232002_g_keySD["scn"], -1 )
	LuaFnSetCopySceneData_Param( sceneId, x232002_g_keySD["cls"], 0 )
	LuaFnSetCopySceneData_Param( sceneId, x232002_g_keySD["dwn"], 0 )
	LuaFnSetCopySceneData_Param( sceneId, x232002_g_keySD["tem"], GetTeamId( sceneId, selfId ) )
	LuaFnSetCopySceneData_Param( sceneId, x232002_g_keySD["kil"], 0 )

  local PlayerMaxLevel = GetHumanMaxLevelLimit()
	local iniLevel;
	if mylevel < 10 then
		iniLevel = 10;
	elseif mylevel < PlayerMaxLevel then
		iniLevel = floor(mylevel/10) * 10;
	else
		iniLevel = PlayerMaxLevel;
	end
	LuaFnSetSceneLoad_Monster( sceneId, "shuilao_monster_" .. iniLevel .. ".ini" )
	LuaFnSetCopySceneData_Param( sceneId, CopyScene_LevelGap, mylevel - iniLevel )	--c别差,CopyScene_LevelGap T読  scene.lua 中赋值
	LuaFnSetCopySceneData_Param( sceneId, x232002_g_keySD["lev"], mylevel )

	local bRetSceneID = LuaFnCreateCopyScene( sceneId )	--初始化完成后调用创建副本函数
	if bRetSceneID > 0 then
		x232002_NotifyTip( sceneId, selfId, "D竎h chuy琻 th鄋h c鬾g!" )
	else
		--x232002_NotifyTip( sceneId, selfId, "S� l唼ng b鋘 sao 疸 皙n gi緄 h課, 皤 ngh� l醫 n鎍 th� l読!" )

		--删除玩家任务列表中对应to� 鸬 任务
		for	i=0, nearmembercount-1 do
			x232002_NotifyTip( sceneId, mems[i], "S� l唼ng b鋘 sao 疸 皙n gi緄 h課, 皤 ngh� l醫 n鎍 th� l読!" )
			DelMission( sceneId, mems[i], x232002_g_MissionId )
			
			misIndexPre	= GetMissionIndexByID( sceneId, mems[i], x232002_g_MissionIdPre )
			SetMissionByIndex( sceneId, mems[i], misIndexPre, x232002_g_IsMissionOkFailPre, 0 )
		end
	end

end

--**********************************
--继续
--**********************************
function x232002_OnContinue( sceneId, selfId, targetId )

	local	misIndex	= GetMissionIndexByID( sceneId, selfId, x232002_g_MissionId )
	if GetMissionParam( sceneId, selfId, misIndex, x232002_g_Param_sceneid ) >= 1 then
		BeginEvent( sceneId )
			AddText( sceneId, "  Xin ch鷆 m譶g, ng呓i s� 鹫t 疬㧟 #{_MONEY"..x232002_g_MoneyBonus.."} tg th叻ng!" )
		EndEvent( sceneId )
		DispatchMissionContinueInfo( sceneId, selfId, targetId, x232002_g_ScriptId, x232002_g_MissionId )
	end

end

--**********************************
--检测喧ng否可以提交
--**********************************
function x232002_CheckSubmit( sceneId, selfId, selectRadioId )

	--判断任务喧ng否已经完成
	local	misIndex	= GetMissionIndexByID( sceneId, selfId, x232002_g_MissionId )
	local	ret				= GetMissionParam( sceneId, selfId, misIndex, x232002_g_IsMissionOkFail )
	if ret == 1 then
		return 1
	else
		return 0
	end

end

--**********************************
--提交
--**********************************
function x232002_OnSubmit( sceneId, selfId, targetId, selectRadioId )

	--判断该npc喧ng否喧ng对应任务to� 鸬 npc
	if LuaFnGetName( sceneId, targetId ) ~= x232002_g_Name then
		return
	end

	--已经Ho鄋 t nhi甿 v�
	if x232002_CheckSubmit( sceneId, selfId, selectRadioId ) > 0 then
		--取 餴琺总共做过to� 鸬 环数
		--local iHuan	= GetMissionData( sceneId, selfId, 10 )

		--任务奖励
		AddMoney( sceneId, selfId, x232002_g_MoneyBonus )
		nSeed	= random( getn( x232002_g_gemList ) )
		sName	= GetName( sceneId, selfId )
		if random( x232002_g_gemRate ) == 1 then
			nPos		= LuaFnTryRecieveItem( sceneId, selfId, x232002_g_gemList[ nSeed ], 1 )
			if nPos ~= -1 then
				sTran	= GetBagItemTransfer( sceneId, selfId, nPos )
				if random( 2 ) == 1 then
					AddGlobalCountNews( sceneId, "#{_INFOUSR"..sName.."} v� c� c鬾g b靚h 鸶nh 疳m ph鋘 lo課 Thu� lao, 疬㧟 穑c bi畉 tg th叻ng #{_INFOMSG"..sTran.."} 1 vi阯" )
				else
					AddGlobalCountNews( sceneId, "#{_INFOUSR"..sName.."} sau khi b靚h 鸶nh Thu� lao, trong g骳 Thu� lao ph醫 hi畁 th 1 vi阯 #{_INFOMSG"..sTran.."}" )
				end
			end
		end

		BeginEvent( sceneId )
			AddText( sceneId, x232002_g_MissionComplete )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		--设置任务已经被完成过
		DelMission( sceneId, selfId, x232002_g_MissionId )
		-- 餴琺到任务to� 鸬 序列号
		local	misIndexPre	= GetMissionIndexByID( sceneId, selfId, x232002_g_MissionIdPre )
		--根据序列号把任务变量to� 鸬 第1位置1 (任务完成情况)
		SetMissionByIndex( sceneId, selfId, misIndexPre, x232002_g_IsMissionOkFailPre, 1 )
	end

end

--**********************************
--杀死怪物或玩家
--**********************************
function x232002_OnKillObject( sceneId, selfId, objdataId, objId )

	--喧ng否喧ng副本
	local sceneType = LuaFnGetSceneType( sceneId )
	if sceneType ~= 1 then
		return
	end

	--喧ng否喧ng所C to� 鸬 副本
	local fubentype = LuaFnGetCopySceneData_Param( sceneId, 0 )
	if fubentype ~= x232002_g_CopySceneType then
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
	--不喧ng所C to� 鸬 Boss
	if GetMonsterNamebyDataId( objdataId ) ~= x232002_g_namMonster and GroupID ~= x232002_g_NeedMonsterGroupID then
		return
	end

	local killedbossnumber = LuaFnGetCopySceneData_Param( sceneId, 7 )			--杀死Bossto� 鸬 数量
	killedbossnumber = killedbossnumber + 1
	LuaFnSetCopySceneData_Param( sceneId, 7, killedbossnumber )					--设置杀死Bossto� 鸬 数量

	local i
	local misIndex
	local humanObjId
	--local killedcount

	if killedbossnumber < x232002_g_TotalNeedKillBoss then

		local strText = format( "秀 gi猼 t礽 ph誱: %d/%d", killedbossnumber, x232002_g_TotalNeedKillBoss )

		for i=0, num-1 do
			humanObjId = LuaFnGetCopyScene_HumanObjId( sceneId, i )				--取 餴琺当前场景里人to� 鸬 objId

			if LuaFnIsObjValid( sceneId, humanObjId ) == 1 then					--不T読 场景to� 鸬 不做此操作
				x232002_NotifyTip( sceneId, humanObjId, strText )

				misIndex = GetMissionIndexByID( sceneId, humanObjId, x232002_g_MissionId )					--取 餴琺任务数据索引值
				--killedcount = GetMissionParam( sceneId, humanObjId, misIndex, x232002_g_Param_killcount )	--取 餴琺已经杀了to� 鸬 怪物数
				--killedcount = killedcount + 1
				SetMissionByIndex( sceneId, humanObjId, misIndex, x232002_g_Param_killcount, killedbossnumber )	--设置任务数据
			end
		end
	elseif killedbossnumber >= x232002_g_TotalNeedKillBoss then
		--设置任务完成标志
		LuaFnSetCopySceneData_Param( sceneId, 4, 1 )

		--取 餴琺已经执行to� 鸬 定时次数
		local TickCount = LuaFnGetCopySceneData_Param( sceneId, 2 )
		local strText = format( "秀 gi猼 t礽 ph誱: %d/%d", x232002_g_TotalNeedKillBoss, x232002_g_TotalNeedKillBoss )
		local strText2 = format( "Nhi甿 v� ho鄋 th鄋h, sau %d gi鈟 s� chuy琻 t緄 v� tr� v鄌 c豠", x232002_g_CloseTick * x232002_g_TickTime )

		for i=0, num-1 do
			humanObjId = LuaFnGetCopyScene_HumanObjId( sceneId, i )									--取 餴琺当前场景里人to� 鸬 objId

			if LuaFnIsObjValid( sceneId, humanObjId ) == 1 then										--不T読 场景to� 鸬 不做此操作
				misIndex = GetMissionIndexByID( sceneId, humanObjId, x232002_g_MissionId)					--取 餴琺任务数据索引值

				--killedcount = GetMissionParam( sceneId, humanObjId, misIndex, x232002_g_Param_killcount )	--取 餴琺已经杀了to� 鸬 怪物数
				--killedcount = killedcount + 1
				SetMissionByIndex( sceneId, humanObjId, misIndex, x232002_g_Param_killcount, x232002_g_TotalNeedKillBoss )	--设置任务数据

				--将任务to� 鸬 第1号数据设置为1,表示完成to� 鸬 任务
				SetMissionByIndex( sceneId, humanObjId, misIndex, x232002_g_IsMissionOkFail, 1 )					--设置任务数据
				--完成副本所用时间
				SetMissionByIndex( sceneId, humanObjId, misIndex, x232002_g_Param_time, TickCount * x232002_g_TickTime )	--设置任务数据

				x232002_NotifyTip( sceneId, humanObjId, strText )
				x232002_NotifyTip( sceneId, humanObjId, strText2 )
			end
		end
	end
end

--**********************************
--进入区域事件
--**********************************
function x232002_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x232002_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--副本事件
--**********************************
function x232002_OnCopySceneReady( sceneId, destsceneId )

	--设置副本入口场景号
	LuaFnSetCopySceneData_Param( destsceneId, 3, sceneId )

	local leaderguid	= LuaFnGetCopySceneData_TeamLeader( destsceneId )
	local leaderObjId	= LuaFnGuid2ObjId( sceneId, leaderguid )
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

	if numMem < x232002_g_LimitMembers then
		x232002_NotifyTip( sceneId, leaderObjId, "Ch� 韙 c醕 ng呓i c鹡g c c� "..x232002_g_LimitMembers.." ta m緄 y阯 t鈓 瓞 c醕 ng呓i 餴" )
		return
	end

	local member
	local misIndex
	for	i=0, numMem-1 do
		member = GetNearTeamMember( sceneId, leaderObjId, i )

		if LuaFnIsCanDoScriptLogic( sceneId, member ) == 1 then			-- 处于可以执行逻辑to� 鸬 状态
			if IsHaveMission( sceneId, member, x232002_g_MissionId ) > 0 then
				misIndex = GetMissionIndexByID( sceneId, member, x232002_g_MissionId )

				--将任务to� 鸬 第2号数据设置为副本to� 鸬 场景号
				SetMissionByIndex( sceneId, member, misIndex, x232002_g_Param_sceneid, destsceneId )

				NewWorld( sceneId, member, destsceneId, x232002_g_Fuben_X, x232002_g_Fuben_Z )
			else
				x232002_NotifyTip( sceneId, member, "C醕 h� 疸 kh鬾g nh nhi甿 v� n鄖 t� tr呔c" )
			end
		end
	end

end

--**********************************
--有玩家进入副本事件
--**********************************
function x232002_OnPlayerEnter( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x232002_g_MissionId ) == 0 then				--如果进入副本前删除任务,则直接传送回
		x232002_NotifyTip( sceneId, selfId, "C醕 h� 疸 kh鬾g nh nhi甿 v� n鄖 t� tr呔c" )
		local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )		--取 餴琺副本入口场景号
		NewWorld( sceneId, selfId, oldsceneId, x232002_g_Back_X, x232002_g_Back_Z )
		return
	end

	--设� gi鈟劳龊蟾椿� 餴琺位置
	SetPlayerDefaultReliveInfo( sceneId, selfId, "%10", -1, "0", sceneId, x232002_g_Fuben_X, x232002_g_Fuben_Z )
end

--**********************************
--有玩家T読 副本中死亡事件
--**********************************
function x232002_OnHumanDie( sceneId, selfId, killerId )
end

--**********************************
--副本场景定时器事件
--**********************************
function x232002_OnCopySceneTimer( sceneId, nowTime )

	--副本时钟读取及设置
	--取 餴琺已经执行to� 鸬 定时次数
	local TickCount	= LuaFnGetCopySceneData_Param( sceneId, x232002_g_keySD["tim"] )
	TickCount = TickCount + 1
	--设置新to� 鸬 定时器调用次数
	LuaFnSetCopySceneData_Param( sceneId, x232002_g_keySD["tim"], TickCount )

	if TickCount == 1 then
		--刚刚M� ra 场景时,T読 每c醝Boss周围刷出数只小怪
		local	iniLevel= LuaFnGetCopySceneData_Param( sceneId, x232002_g_keySD["lev"] )
		x232002_RefreshMonster( sceneId, iniLevel )
	end

	--副本关闭标志
	local leaveFlag = LuaFnGetCopySceneData_Param( sceneId, 4 )

	local membercount = LuaFnGetCopyScene_HumanCount( sceneId )
	local mems = {}
	local i

	for	i=0, membercount-1 do
		mems[i] = LuaFnGetCopyScene_HumanObjId( sceneId, i )
	end

	--C 离开
	if leaveFlag == 1 then
		--离开倒计时间to� 鸬 读取和设置
		local leaveTickCount = LuaFnGetCopySceneData_Param( sceneId, 5 )
		leaveTickCount = leaveTickCount + 1
		LuaFnSetCopySceneData_Param( sceneId, 5, leaveTickCount )

		if leaveTickCount == x232002_g_CloseTick then										--倒计时间到,大家都出去吧
			local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )	--取 餴琺副本入口场景号

			--将当前副本场景里to� 鸬 所有人传送回原来进入时候to� 鸬 场景
			for	i=0, membercount-1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					NewWorld( sceneId, mems[i], oldsceneId, x232002_g_Back_X, x232002_g_Back_Z )
				end
			end
		elseif leaveTickCount < x232002_g_CloseTick then
			--通知当前副本场景里to� 鸬 所有人,场景关闭倒计时间
			local strText = format( "C醕 h� s� r秈 kh鰅 疴y sau %d gi鈟!", (x232002_g_CloseTick-leaveTickCount) * x232002_g_TickTime )

			for	i=0, membercount-1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					x232002_NotifyTip( sceneId, mems[i], strText )
				end
			end
		end
	elseif TickCount == 1 then
		local	CloseMin	= floor( x232002_g_LimitTotalHoldTime * x232002_g_TickTime / 60 )
		if CloseMin > 0 then
			for	i=0, membercount-1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					x232002_NotifyTip( sceneId, mems[i], "Ph� b鋘 hi畁 t読 "..CloseMin.." Ph鷗 sau 痼ng c豠!!" )
				end
			end
		end
	elseif TickCount >= x232002_g_LimitTotalHoldTime then						--副本总时间限制到了
		--此处设置副本任务有时间限制to� 鸬 情况,当时间到后处理...
		for	i=0, membercount-1 do
			if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
				x232002_NotifyTip( sceneId, mems[i], "Nhi甿 v� th b読, qu� gi�!" )
				--任务th b読,删除之
				x232002_MissionFailExe( sceneId, mems[i] )
			end
		end

		--设置副本关闭标志
		LuaFnSetCopySceneData_Param( sceneId, 4, 1 )
	else
		--定时检查队伍成员to� 鸬 队伍号,如果不符合,则踢出副本
		local oldteamid = LuaFnGetCopySceneData_Param( sceneId, 6 )		--取 餴琺保存to� 鸬 队伍号
		local oldsceneId

		for	i=0, membercount-1 do
			if LuaFnIsObjValid( sceneId, mems[i] ) == 1 and IsHaveMission( sceneId, mems[i], x232002_g_MissionId ) > 0 then
				if oldteamid ~= GetTeamId( sceneId, mems[i] ) then
					--任务th b読,删除之
					x232002_NotifyTip( sceneId, mems[i], "Nhi甿 v� th b読, ng呓i kh鬾g � trong 瘊ng nh髆" )
					x232002_MissionFailExe( sceneId, mems[i] )

					oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )	--取 餴琺副本入口场景号
					NewWorld( sceneId, mems[i], oldsceneId, x232002_g_Back_X, x232002_g_Back_Z )
				end
			end
		end

	end
end

--**********************************
--醒目提示
--**********************************
function x232002_NotifyTip( sceneId, selfId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end

--**********************************
--对话窗口信息提示
--**********************************
function x232002_MsgBox( sceneId, selfId, targetId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

end

--**********************************
--T読 每c醝Boss周围刷出数只小怪
--**********************************
function x232002_RefreshMonster( sceneId, iniLevel )

	local	ini		= floor( iniLevel / 10 )
	if ini <= 0 then
		ini	= 1
	elseif ini > 10 then
		ini	= 10
	end
	local	typ		= x232002_g_typMonster[ini]	--怪物编号
	local	nai		= 0													--智能编号
	local	px, py														--场景位置

	--取 餴琺此场景中to� 鸬 怪物数量
	local	numMon= GetMonsterCount( sceneId )
	--怪物to� 鸬 ObjId
	local idMon
	--怪物分布
	local	lstLay	= { {-1,-1}, {1,-1}, {-1,1}, {1,1}, {0,0} }
	for i=0, numMon-1 do
		idMon				= GetMonsterObjID( sceneId, i )
		local	x, y
		x, y				= LuaFnGetWorldPos( sceneId, idMon )
		
		--创建周边小怪
		local	objId
		local	untLay
		for _, untLay in lstLay do
			px	= floor( x ) + untLay[1]
			py	= floor( y ) + untLay[2]
			objId = LuaFnCreateMonster( sceneId, typ, px, py, nai, -1, -1 )
			SetLevel( sceneId, objId, iniLevel )
		end
	end

end

--**********************************
--任务th b読
--**********************************
function x232002_MissionFailExe( sceneId, selfId )

	--删除玩家任务列表中对应to� 鸬 任务
	DelMission( sceneId, selfId, x232002_g_MissionId )
	DelMission( sceneId, selfId, x232002_g_MissionIdPre )

	x232002_NotifyTip( sceneId, selfId, "Nhi甿 v� b� h� th痭g t� 鸬ng x骯" )
	
	-- 餴琺到环数
	local	MissionRound= GetMissionData( sceneId, selfId, MD_BAIMASI_HUAN )
	--环数增加1
	-- SetMissionData( sceneId, selfId, MD_BAIMASI_HUAN, MissionRound + 1 )

end
