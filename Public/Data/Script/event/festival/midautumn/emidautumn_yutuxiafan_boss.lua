--玉兔下凡启动和种boss脚本脚本

--脚本号
x050058_g_ScriptId	= 050058

--C 刷出to� 鸬 玉兔boss数据
x050058_g_BossData = {
	-- ID						BOSSto� 鸬  monster id
	-- AIType				BOSSto� 鸬 AIType....
	-- AIScriptID	BOSSto� 鸬 AIScriptID....
	ID = 890, AIType = 0, AIScriptID = 210, scriptID = 050058, name = "淘气玉兔"
}

x050058_g_begintime = 20080914      --活动开始时间
x050058_g_endtime = 20080928        --活动结束时间

--刷出玉兔to� 鸬 随机坐标
x050058_g_BossPosData = {   
  --posX 随机 餴琺to� 鸬 X坐标 
  --posY 随机 餴琺to� 鸬 Y坐标 
  	{posX = 238, posZ = 63},
  	{posX = 193, posZ = 74},
 	{posX = 150, posZ = 74},
  	{posX = 127, posZ = 91},
  	{posX = 48, posZ = 65},
  	{posX = 177, posZ = 100},
}

x050058_gBossPosNum = 6          --与上面对应,随机坐标to� 鸬 c醝数
x050058_g_activity_id = 183        --本活动id,与ActivityNotice.txt中id号对应,不可乱改

--设置参数,标记boss状况:0表示boss活着呢,不用管他；0---31之间,表示已经死了boss,正T読 计数,到30 ph鷗时再种m祎 c醝；32表示时间到了,种怪,种怪后复0位
x050058_g_activityParam_bossstate = 0

--**********************************
--脚本入口函数
--**********************************
function x050058_OnDefaultEvent( sceneId, actId, iNoticeType, param2, param3, param4, param5 )

	if x050058_IsActivityOpen(sceneId) ~= 1 then
		return
	end
	--参数� 餴琺�: 场景ID,活动ID,时间间隔,公告类型(可以不传,默认普通公告类型),M� ra 活动,m祎  ph鷗进行m祎 次心跳
	StartOneActivity( sceneId, actId, floor(60*1000), iNoticeType )
	--种m祎 c醝怪
	SetActivityParam(sceneId, x050058_g_activity_id, x050058_g_activityParam_bossstate, 0)
	x050058_SetBossInRandomPos(sceneId)
	
end

--**********************************
--心跳函数
--**********************************
function x050058_OnTimer( sceneId, actId, uTime )

	--检测活动喧ng否过期
	if CheckActiviyValidity( sceneId, actId ) == 0 then
		StopOneActivity( sceneId, actId )
	end
	
	if x050058_IsActivityOpen(sceneId) ~= 1 then
		return
	end

	local nBossState = GetActivityParam(sceneId, actId, x050058_g_activityParam_bossstate)
	
	if nBossState > 0 and nBossState < 32 then
		nBossState = nBossState + 1
		SetActivityParam(sceneId, x050058_g_activity_id, x050058_g_activityParam_bossstate, nBossState)
	elseif nBossState >= 32 then
		SetActivityParam(sceneId, x050058_g_activity_id, x050058_g_activityParam_bossstate, 0)
		x050058_SetBossInRandomPos(sceneId)
	end
end


--**********************************
--场景中杀了怪
--**********************************
function x050058_OnDie(sceneId, selfId, killerId)						-- 场景ID, 被杀to� 鸬 ObjId, 杀手ObjId
	local szName = GetName(sceneId, selfId)
	if szName == x050058_g_BossData.name then
		SetActivityParam(sceneId, x050058_g_activity_id, x050058_g_activityParam_bossstate, 1)        --有m祎 c醝boss死了
	end
end

--T読 给定随机 餴琺种m祎 c醝兔子boss
function x050058_SetBossInRandomPos(sceneId)
	local objId
	local nPosRand = random( x050058_gBossPosNum )
	objId = LuaFnCreateMonster( sceneId, x050058_g_BossData.ID, x050058_g_BossPosData[nPosRand].posX, x050058_g_BossPosData[nPosRand].posZ, x050058_g_BossData.AIType, x050058_g_BossData.AIScriptID , x050058_g_BossData.scriptID )
end

--判断喧ng否活动时间 2008-08-14--------2008-08-28
--Tr� v�: 
--0: 不喧ng活动时间
--1: 喧ng活动时间
function x050058_IsActivityOpen(sceneId)
	local nDay = GetTime2Day(sceneId)
	local bRet = 0
	
	if nDay >= x050058_g_begintime and nDay <= x050058_g_endtime then
		bRet = 1
	else 
		bRet = 0
	end
	
	return bRet	
end
