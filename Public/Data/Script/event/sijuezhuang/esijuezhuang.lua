--缥缈峰副本....   ____、飞翔 By：403413393 修复

--脚本号
x893063_g_ScriptId = 893063

x893063_g_CopySceneType = FUBEN_SIJUEZHUANG	--副本类型，定义在ScriptGlobal.lua里面

x893063_g_TickTime		= 1				--回调脚本的时钟时间（单位：秒/次）
x893063_g_NoUserTime	= 10			--副本中没有人后可以继续保存的时间（单位：秒）
x893063_g_Fuben_X			= 100			--进入副本的位置X
x893063_g_Fuben_Z			= 114			--进入副本的位置Z
x893063_g_FuBenTime		= 3*60*60	--副本关闭时间....
x893063_g_LimitMembers = 3

--BOSS表....
x893063_g_BOSSList =
{
	["MinMo_NPC"]				= { DataID=14100, Title="", posX=96, posY=79, Dir=0, BaseAI=3, AIScript=0, ScriptID=893070 },
	["MinMo_BOSS"]				= { DataID=14106, Title="", posX=96, posY=79, Dir=0, BaseAI=27, AIScript=0, ScriptID=893064 },

	["QinYun_NPC"]		= { DataID=14100, Title="", posX=83, posY=23, Dir=0, BaseAI=3, AIScript=0, ScriptID=893071 },
	["QinYun_BOSS"]		= { DataID=14132, Title="", posX=83, posY=23, Dir=0, BaseAI=27, AIScript=0, ScriptID=893065 },
	["JiangShi_BOSS"]			= { DataID=14138, Title="", posX=0, posY=0, Dir=0, BaseAI=28, AIScript=0, ScriptID=-1 },

	["TaoQin_NPC"]				= { DataID=14100, Title="", posX=36, posY=87, Dir=11, BaseAI=3, AIScript=0, ScriptID=893072 },
	["TaoQinLoss_NPC"]		= { DataID=14100, Title="", posX=22, posY=16, Dir=0, BaseAI=3, AIScript=0, ScriptID=893075 },
	["TaoQin_BOSS"]			= { DataID=14125, Title="", posX=36, posY=87, Dir=11, BaseAI=27, AIScript=0, ScriptID=893066 },

	["YaoBoDang_BOSS"]		= { DataID=42130, Title="", posX=129, posY=108, Dir=0, BaseAI=27, AIScript=0, ScriptID=893067 },
	["SiMaLing_BOSS"]	= { DataID=42131, Title="", posX=131, posY=109, Dir=0, BaseAI=27, AIScript=0, ScriptID=893068 },

	["YouDanZhi_BOSS"]		= { DataID=42132, Title="", posX=129, posY=126, Dir=0, BaseAI=0, AIScript=0, ScriptID=893074 },

	["LiFan_NPC"]				= { DataID=14100, Title="", posX=22, posY=16, Dir=27, BaseAI=3, AIScript=0, ScriptID=893075 },

	["PangQi_BOSS"]		= { DataID=14145, Title="", posX=22, posY=16, Dir=27, BaseAI=27, AIScript=0, ScriptID=893069 },

	["Panqinqin_NPC"]				= { DataID=60, Title="", posX=101, posY=111, Dir=0, BaseAI=3, AIScript=0, ScriptID=893080 },
	["Zhong_NPC"]				= { DataID=14119, Title="Chu鬾g L緉", posX=100, posY=82, Dir=0, BaseAI=3, AIScript=0, ScriptID=893081 },
	["HuiYinFan_BOSS"]			= { DataID=14126, Title="", posX=0, posY=0, Dir=0, BaseAI=3, AIScript=0, ScriptID=-1 },
	["Jin_BOSS"]			= { DataID=14147, Title="", posX=0, posY=0, Dir=0, BaseAI=27, AIScript=0, ScriptID=-1 },
	["Mu_BOSS"]			= { DataID=14148, Title="", posX=0, posY=0, Dir=0, BaseAI=27, AIScript=0, ScriptID=-1 },
	["Shui_BOSS"]			= { DataID=14149, Title="", posX=0, posY=0, Dir=0, BaseAI=27, AIScript=0, ScriptID=-1 },
	["Huo_BOSS"]			= { DataID=14140, Title="", posX=0, posY=0, Dir=0, BaseAI=27, AIScript=0, ScriptID=-1 },
	["Tu_BOSS"]			= { DataID=14150, Title="", posX=0, posY=0, Dir=0, BaseAI=27, AIScript=0, ScriptID=-1 },

}

x893063_g_FightBOSSList =
{
	[1] = x893063_g_BOSSList["MinMo_BOSS"].DataID,
	[2] = x893063_g_BOSSList["QinYun_BOSS"].DataID,
	[3] = x893063_g_BOSSList["TaoQin_BOSS"].DataID,
	[4] = x893063_g_BOSSList["YaoBoDang_BOSS"].DataID,
	[5] = x893063_g_BOSSList["SiMaLing_BOSS"].DataID,
	[6] = x893063_g_BOSSList["PangQi_BOSS"].DataID
}

--是否可以挑战某个BOSS的标记列表....
x893063_g_BattleFlagTbl = 
{
	["MinMo"]			= 8,	--是否可以挑战哈大霸...
	["QinYun"]	= 9,	--是否可以挑战桑土公....
	["TaoQin"]			= 10,	--是否可以挑战乌老大....
	["ShuangZi"]		= 11,	--是否可以挑战双子....
	["PangQi"]		= 12,	--是否可以挑战李秋水....
}

--场景变量索引....是否可以挑战某个BOSS的标记....
-- 0=不能挑战 1=可以挑战 2=已经挑战过了
x893063_g_IDX_BattleFlag_MinMo			= 8
x893063_g_IDX_BattleFlag_QinYun	= 9
x893063_g_IDX_BattleFlag_TaoQin		= 10
x893063_g_IDX_BattleFlag_Shuangzi		= 11
x893063_g_IDX_BattleFlag_PangQi	= 12

x893063_g_IDX_FuBenOpenTime		= 13	--副本建立的时间....
x893063_g_IDX_FuBenLifeStep		= 14	--副本生命期的step....(包括建立NPC....关闭倒计时提示....)

--场景变量索引....通用的缥缈峰计时器....主要用于激活BOSS战斗....
x893063_g_IDX_SJZTimerStep			= 15
x893063_g_IDX_SJZTimerScriptID	= 16

--场景变量索引....乌老大死亡的计时器....用于处理死亡逻辑....
x893063_g_IDX_TaoQinDieStep				= 17
x893063_g_IDX_TaoQinDieScriptID		= 18
x893063_g_IDX_TaoQinDiePosX				=	19
x893063_g_IDX_TaoQinDiePosY				=	20


--**********************************
--任务入口函数....
--**********************************
function x893063_OnDefaultEvent( sceneId, selfId, targetId )

	--检测是否可以进入副本....
	local ret, msg = x893063_CheckCanEnter( sceneId, selfId, targetId )
	if 1 ~= ret then
		BeginEvent(sceneId)
			AddText(sceneId,msg)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--关闭NPC对话窗口....
	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)

	x893063_MakeCopyScene( sceneId, selfId )
	local	nam	= LuaFnGetName( sceneId, selfId )
	BroadMsgByChatPipe( sceneId, selfId, "#gffff00"..nam.."#gff00f0 c鵱g t� 鸬i 疸 ti猲 v鄌 T� Tuy畉 Trang, chu b� ti陁 di畉 t阯 c鵱g hung c馽 醕 B鄋g X�, kh絠 l読 鈔 o醤 T� Tuy畉 Trang n錷 n鄌...", 4 )

end

--**********************************
--列举事件
--**********************************
function x893063_OnEnumerate( sceneId, selfId, targetId )

	AddNumText( sceneId, x893063_g_ScriptId, "#cFF0000耼 o醤 T� Tuy畉 Trang", 10, 1 )

end

--**********************************
--检测是否可以进入此副本....
--**********************************
function x893063_CheckCanEnter( sceneId, selfId, targetId )

	--是否有队伍....
	if LuaFnHasTeam(sceneId,selfId) ~= 1 then
		return 0, "#{PMF_20080521_02}"
	end

	--是不是队长....
	if GetTeamLeader(sceneId,selfId) ~= selfId then
		return 0, "#{PMF_20080521_03}"
	end

	--人数是否够....
	if GetTeamSize(sceneId,selfId) < 1 then
		return 0, "#{PMF_20080521_04}"
	end

	--是否都在附近....
	local NearTeamSize = GetNearTeamCount(sceneId,selfId)
	if GetTeamSize(sceneId,selfId) ~= NearTeamSize then
		return 0, "#{PMF_20080521_05}"
	end

	local Humanlist = {}
	local nHumanNum = 0

	--是否有人不够90级....
	for i=0, NearTeamSize-1 do
		local PlayerId = GetNearTeamMember( sceneId, selfId, i )
		if GetLevel( sceneId, PlayerId ) < 70 then
			Humanlist[nHumanNum] = GetName( sceneId, PlayerId )
			nHumanNum = nHumanNum + 1
		end
	end
	
	--队伍达到人数要求?
 	local teamSize = GetTeamSize(sceneId, selfId);
 	if teamSize < x893063_g_LimitMembers then
		return 0, "#{LLXB_8815_12}";		
 	end

	if nHumanNum > 0 then

		local msg = "Trong 鸬i ng� "
		for i=0, nHumanNum-2 do
			msg = msg .. Humanlist[i] .. ", "
		end
		msg = msg .. Humanlist[nHumanNum-1] .. " c 鸬 kh鬾g 瘘, kh鬾g th� ti猲 v鄌."
		return 0, msg

	end


	--是否有人今天做过3次了....
	nHumanNum = 0
	local CurDayTime = GetDayTime()
	for i=0, NearTeamSize-1 do

		local PlayerId = GetNearTeamMember( sceneId, selfId, i )
		local lastTime = GetMissionData( sceneId, PlayerId, MD_SPRING07DENGMI_DAYTIME )
		local lastDayTime = floor( lastTime / 100 )
		local lastDayCount = mod( lastTime, 100 )
	
		if CurDayTime > lastDayTime then
			lastDayTime = CurDayTime
			lastDayCount = 0
		end

		if lastDayCount >= 90 then
			Humanlist[nHumanNum] = GetName( sceneId, PlayerId )
			nHumanNum = nHumanNum + 1
		end

	end

	if nHumanNum > 0 then

		local msg = ""
		for i=0, nHumanNum-2 do
			msg = msg .. Humanlist[i] .. ", "
		end
		msg = msg .. Humanlist[nHumanNum-1] .. " ng鄖 h鬽 nay 疸 tham gia ph� b鋘 3 l r癷."
		return 0, msg

	end

	return 1

end

--**********************************
--创建副本....
--**********************************
function x893063_MakeCopyScene( sceneId, selfId )

	local x = 0
	local z = 0
	x,z = LuaFnGetWorldPos(sceneId,selfId)
	leaderguid=LuaFnObjId2Guid(sceneId,selfId)

	LuaFnSetSceneLoad_Map(sceneId, "sijuezhuang.nav")
	LuaFnSetCopySceneData_TeamLeader(sceneId, leaderguid)
	LuaFnSetCopySceneData_NoUserCloseTime(sceneId, x893063_g_NoUserTime*1000)
	LuaFnSetCopySceneData_Timer(sceneId, x893063_g_TickTime*1000)
	LuaFnSetCopySceneData_Param(sceneId, 0, x893063_g_CopySceneType)
	LuaFnSetCopySceneData_Param(sceneId, 1, x893063_g_ScriptId)
	LuaFnSetCopySceneData_Param(sceneId, 2, 0)
	LuaFnSetCopySceneData_Param(sceneId, 3, sceneId)
	LuaFnSetCopySceneData_Param(sceneId, 4, x)
	LuaFnSetCopySceneData_Param(sceneId, 5, z)
	LuaFnSetCopySceneData_Param(sceneId, 6, GetTeamId(sceneId,selfId))
	LuaFnSetCopySceneData_Param(sceneId, 7, 0)

	for i=8, 31 do
		LuaFnSetCopySceneData_Param(sceneId, i, 0)
	end

	LuaFnSetCopySceneData_Param( sceneId, x893063_g_IDX_BattleFlag_MinMo, 0 )
	LuaFnSetCopySceneData_Param( sceneId, x893063_g_IDX_BattleFlag_QinYun, 0 )
	LuaFnSetCopySceneData_Param( sceneId, x893063_g_IDX_BattleFlag_TaoQin, 0 )
	LuaFnSetCopySceneData_Param( sceneId, x893063_g_IDX_BattleFlag_Shuangzi, 0 )
	LuaFnSetCopySceneData_Param( sceneId, x893063_g_IDX_BattleFlag_PangQi, 0 )

	LuaFnSetCopySceneData_Param( sceneId, x893063_g_IDX_FuBenOpenTime, LuaFnGetCurrentTime() )
	LuaFnSetCopySceneData_Param( sceneId, x893063_g_IDX_FuBenLifeStep, 0 )

	LuaFnSetCopySceneData_Param( sceneId, x893063_g_IDX_SJZTimerStep, 0 )
	LuaFnSetCopySceneData_Param( sceneId, x893063_g_IDX_SJZTimerScriptID, -1 )

	LuaFnSetCopySceneData_Param( sceneId, x893063_g_IDX_TaoQinDieStep, 0 )
	LuaFnSetCopySceneData_Param( sceneId, x893063_g_IDX_TaoQinDieScriptID, -1 )
	LuaFnSetCopySceneData_Param( sceneId, x893063_g_IDX_TaoQinDiePosX, 0 )
	LuaFnSetCopySceneData_Param( sceneId, x893063_g_IDX_TaoQinDiePosY, 0 )

	LuaFnSetSceneLoad_Area( sceneId, "sijuezhuang_area.ini" )
	LuaFnSetSceneLoad_Monster( sceneId, "sijuezhuang_monster.ini" )

	local bRetSceneID = LuaFnCreateCopyScene(sceneId)
	BeginEvent(sceneId)
		if bRetSceneID>0 then
			AddText(sceneId,"D竎h chuy琻 th鄋h c鬾g");
		else
			AddText(sceneId,"S� l唼ng b鋘 sao 疸 qu� t鋓, h銀 瘙i m祎 ch鷗.");
		end
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)

end

--**********************************
--副本事件....
--**********************************
function x893063_OnCopySceneReady( sceneId, destsceneId )

	--进入副本的规则
	-- 1，如果这个玩家没有组队，就传送这个玩家自己进入副本
	-- 2, 如果玩家有队伍，但是玩家不是队长，就传送自己进入副本
	-- 3，如果玩家有队伍，并且这个玩家是队长，就传送自己和附近队友一起进去

	LuaFnSetCopySceneData_Param(destsceneId, 3, sceneId) --设置副本入口场景号
	leaderguid  = LuaFnGetCopySceneData_TeamLeader(destsceneId)
	leaderObjId = LuaFnGuid2ObjId(sceneId,leaderguid)

	if LuaFnIsCanDoScriptLogic( sceneId, leaderObjId ) ~= 1 then
		return
	end

	local	nearteammembercount = GetNearTeamCount( sceneId, leaderObjId) 
	local CurDayTime = GetDayTime()
	for	i=0,nearteammembercount-1 do

		local PlayerId = GetNearTeamMember( sceneId, selfId, i )
		local lastTime = GetMissionData( sceneId, PlayerId, MD_SPRING07DENGMI_DAYTIME )
		local lastDayTime = floor( lastTime / 100 )
		local lastDayCount = mod( lastTime, 100 )

		if CurDayTime > lastDayTime then
			lastDayTime = CurDayTime
			lastDayCount = 0
		end

		if lastDayCount >= 3 then
			BeginEvent( sceneId )
				AddText( sceneId, "C醕 h� h鬽 nay 疸 tham gia ph� b鋘 3 l r癷, mai h銀 quay l読!" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
		return
		end
	end


	--统计创建副本次数....
	--AuditSJZCreateFuben( sceneId, leaderObjId )

	if LuaFnHasTeam( sceneId, leaderObjId ) == 0  then
		NewWorld( sceneId, leaderObjId, destsceneId, x893063_g_Fuben_X, x893063_g_Fuben_Z) ;
	else
		local	nearteammembercount = GetNearTeamCount( sceneId, leaderObjId) 
		local mems = {}
		for	i=0,nearteammembercount-1 do
			mems[i] = GetNearTeamMember(sceneId, leaderObjId, i)
			NewWorld( sceneId, mems[i], destsceneId, x893063_g_Fuben_X, x893063_g_Fuben_Z)
		end
	end

end

--**********************************
--副本场景定时器事件....
--**********************************
function x893063_OnCopySceneTimer( sceneId, nowTime )

	x893063_TickFubenLife( sceneId, nowTime )

	x893063_TickSJZTimer( sceneId, nowTime )

	x893063_TickTaoQinDieTimer( sceneId, nowTime )

	x893063_TickJianWuArea( sceneId, nowTime )

end

--**********************************
--有玩家进入副本事件....
--**********************************
function x893063_OnPlayerEnter( sceneId, selfId )

	--设置死亡事件....
	SetPlayerDefaultReliveInfo( sceneId, selfId, "%10", -1, "0", sceneId, x893063_g_Fuben_X, x893063_g_Fuben_Z )

	--设置挑战过一次缥缈峰....
	local lastTime = GetMissionData( sceneId, selfId, MD_SPRING07DENGMI_DAYTIME )
	local lastDayTime = floor( lastTime / 100 )
	local lastDayCount = mod( lastTime, 100 )
	local CurDayTime = GetDayTime()

	if CurDayTime > lastDayTime then
		lastDayTime = CurDayTime
		lastDayCount = 0
	end

	lastDayCount = lastDayCount + 1
	lastTime = lastDayTime * 100 + lastDayCount
	SetMissionData( sceneId, selfId, MD_SPRING07DENGMI_DAYTIME, lastTime )

end

--**********************************
--有玩家在副本中死亡事件....
--**********************************
function x893063_OnHumanDie( sceneId, selfId, killerId )
	
end

--**********************************
--提示所有副本内玩家....
--**********************************
function x893063_TipAllHuman( sceneId, Str )

	local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanNum-1  do
		local PlayerId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid( sceneId, PlayerId ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, PlayerId ) == 1 then
			BeginEvent(sceneId)
				AddText(sceneId, Str)
			EndEvent(sceneId)
			DispatchMissionTips(sceneId, PlayerId)
		end
	end

end

--**********************************
--Tick副本生命期....
--**********************************
function x893063_TickFubenLife( sceneId, nowTime )

	local openTime = LuaFnGetCopySceneData_Param( sceneId, x893063_g_IDX_FuBenOpenTime )
	local leftTime = openTime + x893063_g_FuBenTime - LuaFnGetCurrentTime()
	local lifeStep = LuaFnGetCopySceneData_Param( sceneId, x893063_g_IDX_FuBenLifeStep )

	if lifeStep == 15 then

		LuaFnSetCopySceneData_Param( sceneId, x893063_g_IDX_FuBenLifeStep, 16 )

		local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
		local oldSceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )
		local oldX = LuaFnGetCopySceneData_Param( sceneId, 4 )
		local oldZ = LuaFnGetCopySceneData_Param( sceneId, 5 )
		for i=0, nHumanNum-1  do
			local PlayerId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
			if LuaFnIsObjValid( sceneId, PlayerId ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, PlayerId ) == 1 then
				NewWorld( sceneId, PlayerId, oldSceneId, oldX, oldZ )
			end
		end

		return

	end

	if lifeStep == 14 then
		LuaFnSetCopySceneData_Param( sceneId, x893063_g_IDX_FuBenLifeStep, 15 )
		x893063_TipAllHuman( sceneId, "C醕 h� s� r秈 kh鰅 疴y sau 1 gi鈟!" )
		return
	end

	if lifeStep == 13 then
		LuaFnSetCopySceneData_Param( sceneId, x893063_g_IDX_FuBenLifeStep, 14 )
		x893063_TipAllHuman( sceneId, "C醕 h� s� r秈 kh鰅 疴y sau 2 gi鈟!" )
		return
	end

	if lifeStep == 12 then
		LuaFnSetCopySceneData_Param( sceneId, x893063_g_IDX_FuBenLifeStep, 13 )
		x893063_TipAllHuman( sceneId, "C醕 h� s� r秈 kh鰅 疴y sau 3 gi鈟!" )
		return
	end

	if lifeStep == 11 then
		LuaFnSetCopySceneData_Param( sceneId, x893063_g_IDX_FuBenLifeStep, 12 )
		x893063_TipAllHuman( sceneId, "C醕 h� s� r秈 kh鰅 疴y sau 4 gi鈟!" )
		return
	end

	if lifeStep == 10 then
		LuaFnSetCopySceneData_Param( sceneId, x893063_g_IDX_FuBenLifeStep, 11 )
		x893063_TipAllHuman( sceneId, "C醕 h� s� r秈 kh鰅 疴y sau 5 gi鈟!" )
		return
	end

	if leftTime <= 10 and lifeStep == 9 then
		LuaFnSetCopySceneData_Param( sceneId, x893063_g_IDX_FuBenLifeStep, 10 )
		x893063_TipAllHuman( sceneId, "C醕 h� s� r秈 kh鰅 疴y sau 10 gi鈟!" )
		return
	end

	if leftTime <= 30 and lifeStep == 8 then
		LuaFnSetCopySceneData_Param( sceneId, x893063_g_IDX_FuBenLifeStep, 9 )
		x893063_TipAllHuman( sceneId, "C醕 h� s� r秈 kh鰅 疴y sau 30 gi鈟!" )
		return
	end

	if leftTime <= 60 and lifeStep == 7 then
		LuaFnSetCopySceneData_Param( sceneId, x893063_g_IDX_FuBenLifeStep, 8 )
		x893063_TipAllHuman( sceneId, "C醕 h� s� r秈 kh鰅 疴y sau 1 ph鷗!" )
		return
	end

	if leftTime <= 120 and lifeStep == 6 then
		LuaFnSetCopySceneData_Param( sceneId, x893063_g_IDX_FuBenLifeStep, 7 )
		x893063_TipAllHuman( sceneId, "C醕 h� s� r秈 kh鰅 疴y sau 2 ph鷗!" )
		return
	end

	if leftTime <= 180 and lifeStep == 5 then
		LuaFnSetCopySceneData_Param( sceneId, x893063_g_IDX_FuBenLifeStep, 6 )
		x893063_TipAllHuman( sceneId, "C醕 h� s� r秈 kh鰅 疴y sau 3 ph鷗!" )
		return
	end

	if leftTime <= 300 and lifeStep == 4 then
		LuaFnSetCopySceneData_Param( sceneId, x893063_g_IDX_FuBenLifeStep, 5 )
		x893063_TipAllHuman( sceneId, "C醕 h� s� r秈 kh鰅 疴y sau 5 ph鷗!" )
		return
	end

	if leftTime <= 900 and lifeStep == 3 then
		LuaFnSetCopySceneData_Param( sceneId, x893063_g_IDX_FuBenLifeStep, 4 )
		x893063_TipAllHuman( sceneId, "C醕 h� s� r秈 kh鰅 疴y sau 15 ph鷗!" )
		return
	end

	if leftTime <= 1800 and lifeStep == 2 then
		LuaFnSetCopySceneData_Param( sceneId, x893063_g_IDX_FuBenLifeStep, 3 )
		x893063_TipAllHuman( sceneId, "C醕 h� s� r秈 kh鰅 疴y sau 30 ph鷗!" )
		return
	end

	if leftTime <= 3600 and lifeStep == 1 then
		LuaFnSetCopySceneData_Param( sceneId, x893063_g_IDX_FuBenLifeStep, 2 )
		x893063_TipAllHuman( sceneId, "C醕 h� s� r秈 kh鰅 疴y sau 60 ph鷗!" )
		return
	end

	--初始化副本内的NPC....
	if lifeStep == 0 then

		local MstId = x893063_CreateBOSS( sceneId, "MinMo_NPC", -1, -1 )
		SetUnitReputationID( sceneId, MstId, MstId, 0 )

		MstId = x893063_CreateBOSS( sceneId, "QinYun_NPC", -1, -1 )
		SetUnitReputationID( sceneId, MstId, MstId, 0 )

		MstId = x893063_CreateBOSS( sceneId, "TaoQin_NPC", -1, -1 )
		SetUnitReputationID( sceneId, MstId, MstId, 0 )

		MstId = x893063_CreateBOSS( sceneId, "LiFan_NPC", -1, -1 )
		SetUnitReputationID( sceneId, MstId, MstId, 0 )

		MstId = x893063_CreateBOSS( sceneId, "Panqinqin_NPC", -1, -1 )
		SetUnitReputationID( sceneId, MstId, MstId, 0 )

		MstId = x893063_CreateBOSS( sceneId, "Zhong_NPC", -1, -1 )
		SetUnitReputationID( sceneId, MstId, MstId, 0 )

		LuaFnSetCopySceneData_Param( sceneId, x893063_g_IDX_FuBenLifeStep, 1 )

		return
	end

end

--**********************************
--Tick缥缈峰计时器....
--**********************************
function x893063_TickSJZTimer( sceneId, nowTime )

	local step = LuaFnGetCopySceneData_Param( sceneId, x893063_g_IDX_SJZTimerStep )
	if step <= 0 then
		return
	end
	local scriptID = LuaFnGetCopySceneData_Param( sceneId, x893063_g_IDX_SJZTimerScriptID )

	--回调指定脚本的OnTimer....
	CallScriptFunction( scriptID, "OnSJZTimer", sceneId, step )

	--如果已经走完所有step则关闭计时器....
	step = step - 1
	if step <= 0 then
		LuaFnSetCopySceneData_Param( sceneId, x893063_g_IDX_SJZTimerStep, 0 )
		LuaFnSetCopySceneData_Param( sceneId, x893063_g_IDX_SJZTimerScriptID, -1 )
	else
		LuaFnSetCopySceneData_Param( sceneId, x893063_g_IDX_SJZTimerStep, step )
	end

end

--**********************************
--开启缥缈峰计时器....
--**********************************
function x893063_OpenSJZTimer( sceneId, allstep, ScriptID )

	LuaFnSetCopySceneData_Param( sceneId, x893063_g_IDX_SJZTimerStep, allstep )
	LuaFnSetCopySceneData_Param( sceneId, x893063_g_IDX_SJZTimerScriptID, ScriptID )

end

--**********************************
--当前缥缈峰计时器是否激活....
--**********************************
function x893063_IsSJZTimerRunning( sceneId )

	local step = LuaFnGetCopySceneData_Param( sceneId, x893063_g_IDX_SJZTimerStep )
	if step > 0 then
		return 1
	else
		return 0
	end

end

--**********************************
--Tick乌老大死亡计时器....
--**********************************
function x893063_TickTaoQinDieTimer( sceneId, nowTime )

	local step = LuaFnGetCopySceneData_Param( sceneId, x893063_g_IDX_TaoQinDieStep )
	if step <= 0 then
		return
	end

	local scriptID = LuaFnGetCopySceneData_Param( sceneId, x893063_g_IDX_TaoQinDieScriptID )
	local posX = LuaFnGetCopySceneData_Param( sceneId, x893063_g_IDX_TaoQinDiePosX )
	local posY = LuaFnGetCopySceneData_Param( sceneId, x893063_g_IDX_TaoQinDiePosY )

	--回调指定脚本的OnTimer....
	CallScriptFunction( scriptID, "OnMinMoDieTimer", sceneId, step, posX, posY )

	--如果已经走完所有step则关闭计时器....
	step = step - 1
	if step <= 0 then
		LuaFnSetCopySceneData_Param( sceneId, x893063_g_IDX_TaoQinDieStep, 0 )
		LuaFnSetCopySceneData_Param( sceneId, x893063_g_IDX_TaoQinDieScriptID, -1 )
		LuaFnSetCopySceneData_Param( sceneId, x893063_g_IDX_TaoQinDiePosX, 0 )
		LuaFnSetCopySceneData_Param( sceneId, x893063_g_IDX_TaoQinDiePosY, 0 )
	else
		LuaFnSetCopySceneData_Param( sceneId, x893063_g_IDX_TaoQinDieStep, step )
	end

end

--**********************************
--开启乌老大死亡计时器....
--**********************************
function x893063_OpenTaoQinDieTimer( sceneId, allstep, ScriptID, posX, posY )

	LuaFnSetCopySceneData_Param( sceneId, x893063_g_IDX_TaoQinDieStep, allstep )
	LuaFnSetCopySceneData_Param( sceneId, x893063_g_IDX_TaoQinDieScriptID, ScriptID )
	LuaFnSetCopySceneData_Param( sceneId, x893063_g_IDX_TaoQinDiePosX, posX )
	LuaFnSetCopySceneData_Param( sceneId, x893063_g_IDX_TaoQinDiePosY, posY )

end

--**********************************
--Tick剑舞区域....
--只要玩家站在场景里的6个光柱内....每秒都能获得一个免疫剑舞的buff....
--**********************************
function x893063_TickJianWuArea( sceneId, nowTime )
	local nMonsterNum = GetMonsterCount( sceneId )
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId, i)
		if GetName(sceneId, MonsterId) == "B鄋g X�" then

			local x,z = GetWorldPos( sceneId, MonsterId )
			local buff1 = -1
			local buff2 = -1

			if x>=38 and x<=42 and z>=22 and z<=27 then
				if LuaFnHaveImpactOfSpecificDataIndex(sceneId, MonsterId, 22446) == 1 then
					buff1 = 22446
					buff2 = 22451
                            end
			elseif x>=37 and x<=41 and z>=34 and z<=38 then
				if LuaFnHaveImpactOfSpecificDataIndex(sceneId, MonsterId, 22447) == 1 then
					buff1 = 22447
					buff2 = 22452
                            end
			elseif x>=18 and x<=23 and z>=35 and z<=39 then
				if LuaFnHaveImpactOfSpecificDataIndex(sceneId, MonsterId, 22448) == 1 then
					buff1 = 22448
					buff2 = 22453
                            end
			elseif x>=16 and x<=21 and z>=23 and z<=27 then
				if LuaFnHaveImpactOfSpecificDataIndex(sceneId, MonsterId, 22449) == 1 then
					buff1 = 22449
					buff2 = 22454
                            end
			elseif x>=27 and x<=32 and z>=15 and z<=20 then
				if LuaFnHaveImpactOfSpecificDataIndex(sceneId, MonsterId, 22450) == 1 then
					buff1 = 22450
					buff2 = 22455
                            end
			end

			if buff1 ~= -1 then
				LuaFnCancelSpecificImpact(sceneId, MonsterId, buff1)
				LuaFnSendSpecificImpactToUnit(sceneId, MonsterId, MonsterId, MonsterId, buff2, 0)
			end

		end
	end

end

--**********************************
--创建指定BOSS....
--**********************************
function x893063_CreateBOSS( sceneId, name, x, y )

	local BOSSData = x893063_g_BOSSList[name]
	if not BOSSData then
		return
	end

	local posX = 0
	local posY = 0
	if x ~= -1 and y ~= -1 then
		posX = x
		posY = y
	else
		posX = BOSSData.posX
		posY = BOSSData.posY
	end

	local MstId = LuaFnCreateMonster( sceneId, BOSSData.DataID, posX, posY, BOSSData.BaseAI, BOSSData.AIScript, BOSSData.ScriptID )
	--SetUnitReputationID(sceneId, selfId, nMonsterId, 29)   --by yaya
	SetUnitCampID(sceneId, MstId, MstId, 110)

	--SetObjDir( sceneId, MstId, BOSSData.Dir )
	SetMonsterFightWithNpcFlag( sceneId, MstId, 0 )
	if BOSSData.Title ~= "" then
		SetCharacterTitle(sceneId, MstId, BOSSData.Title)
	end

	LuaFnSendSpecificImpactToUnit(sceneId, MstId, MstId, MstId, 152, 0)

	--统计创建BOSS....
	--AuditSJZCreateBoss( sceneId, BOSSData.DataID )

	return MstId

end

--**********************************
--删除指定BOSS....
--**********************************
function x893063_DeleteBOSS( sceneId, name )

	local BOSSData = x893063_g_BOSSList[name]
	if not BOSSData then
		return
	end

	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if BOSSData.DataID == GetMonsterDataID( sceneId, MonsterId ) then
			--LuaFnDeleteMonster( sceneId, MonsterId )
			LuaFnSendSpecificImpactToUnit(sceneId, MonsterId, MonsterId, MonsterId, 152, 0)
			SetCharacterDieTime( sceneId, MonsterId, 1000 )
		end
	end

end

--**********************************
--寻找指定BOSS....
--**********************************
function x893063_FindBOSS( sceneId, name )

	local BOSSData = x893063_g_BOSSList[name]
	if not BOSSData then
		return -1
	end

	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if BOSSData.DataID == GetMonsterDataID( sceneId, MonsterId ) then
			return MonsterId
		end
	end

	return -1

end

--**********************************
--检测当前是否已经存在一个BOSS了....
--**********************************
function x893063_CheckHaveBOSS( sceneId )

	local BossList = {}
	local nBossNum = 0

	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if LuaFnIsCharacterLiving(sceneId, MonsterId) == 1 then
			local DataID = GetMonsterDataID( sceneId, MonsterId )
			for j, dataId in x893063_g_FightBOSSList do
				if DataID == dataId then
					BossList[nBossNum] = GetName( sceneId, MonsterId )
					nBossNum = nBossNum + 1
				end
			end
		end
	end

	if nBossNum > 0 then
		local msg = "衋ng c鵱g "
		for i=0, nBossNum-2 do
			msg = msg .. BossList[i] .. ", "
		end
		msg = msg .. BossList[nBossNum-1] .. " huy猼 chi猲 t読 T� Tuy畉 Trang"
		return 1, msg
	end

	return 0, ""

end

--**********************************
--获取是否可以挑战某个BOSS的标记....
--**********************************
function x893063_GetBossBattleFlag( sceneId, bossName )

	local idx = x893063_g_BattleFlagTbl[ bossName ]
	return LuaFnGetCopySceneData_Param( sceneId, idx )

end

--**********************************
--设置是否可以挑战某个BOSS的标记....
--**********************************
function x893063_SetBossBattleFlag( sceneId, bossName, bCan )

	local idx = x893063_g_BattleFlagTbl[ bossName ]
	LuaFnSetCopySceneData_Param( sceneId, idx, bCan )

end
