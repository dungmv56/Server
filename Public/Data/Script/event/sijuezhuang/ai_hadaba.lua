--飘渺峰 李秋水AI

--A 【小无相功】给自己用个空技能....再给随机给一个玩家失明....
--B 【剑舞】给自己用一个空技能....接下来15s内依次给全副本玩家加伤害值逐渐加大的伤害buff....
--C 【洒脱】给自己用一个清buff的技能....
--D 【冰爆】给自己用个空技能....再给随机给玩家脚下放个陷阱....
--E 【狂暴】给自己加疯狂的buff....不再使用其他技能....

--全程都带有免疫制定技能的buff....
--战斗开始同时每隔10秒用A技能....
--当HP降为66%和33%时分别使用B技能....B技能的持续时间内....其它技能CD到了不使用....
--每隔20秒用C技能....
--每隔20秒用D技能....


--脚本号
x893064_g_ScriptId	= 893064

--副本逻辑脚本号....
x893064_g_FuBenScriptId = 893063


--免疫特定技能buff....
x893064_Buff_MianYi1	= 10472	--免疫一些负面效果....
x893064_Buff_MianYi2	= 10471	--免疫普通隐身....

--A神来之笔....
x893064_SkillA_ID			= 1628
x893064_SkillA_Buff		=	22214
x893064_SkillA_CD			= 10000

--B剑舞....
x893064_SkillB_SkillIDTbl = { 1043, 1044, 1045, 1046, 1047, 1048 }
x893064_SkillB_WeatherTbl = { 11, 12, 13, 14, 15, 16 }
x893064_SkillB_TalkTbl =
{
	"#{PMF_20080530_10}",
	"#{PMF_20080530_11}",
	"#{PMF_20080530_12}",
	"#{PMF_20080530_13}",
	"#{PMF_20080530_14}",
	"#{PMF_20080530_15}"
}

x893064_SkillB_Text =
{
	"#{SJZTS_80917_5}",
	"#{SJZTS_80917_3}",
	"#{SJZTS_80917_6}",
	"#{SJZTS_80917_1}",
	"#{SJZTS_80917_2}",
	"#{SJZTS_80917_4}"
}

x893064_SkillB_BuffIDTbl =
{
	[1] = {10280,10281,10282,10283,10284,10285,10286,10287,10288,10289,10290,10291,10292,10293,10294},
	[2] = {10295,10296,10297,10298,10299,10300,10301,10302,10303,10304,10305,10306,10307,10308,10309},
	[3] = {10310,10311,10312,10313,10314,10315,10316,10317,10318,10319,10320,10321,10322,10323,10324},
	[4] = {10325,10326,10327,10328,10329,10330,10331,10332,10333,10334,10335,10336,10337,10338,10339},
	[5] = {10340,10341,10342,10343,10344,10345,10346,10347,10348,10349,10350,10351,10352,10353,10354},
	[6] = {10355,10356,10357,10358,10359,10360,10361,10362,10363,10364,10365,10366,10367,10368,10369}
}

--C洒脱....
x893064_SkillC_ID		= 1049
x893064_SkillC_CD		= 20000

--D冰爆....
x893064_SkillD_ID		= 1627
x893064_SkillD_CD		= 20000
x893064_SkillD_SpecObj = 156

--E狂暴....
x893064_SkillE_ID			= 1626
x893064_SkillE_Buff		=	22214
x893064_SkillE_CD			= 10000
x893064_SkillE_Buff1	= 10234
x893064_SkillE_Buff2	= 10235
--开始进入狂暴状态的时间....
x893064_EnterKuangBaoTime	= 5*60*1000


--AI Index....
x893064_IDX_StopWatch						= 1	--秒表....
x893064_IDX_SkillA_CD						= 2	--A技能的CD时间....
x893064_IDX_SkillB_HPStep				= 3	--血量级别....
x893064_IDX_SkillB_Step					= 4	--B技能的Step....0=未发动 15=buff1 14=buff2 …… 1=buff15
x893064_IDX_SkillB_Type					= 5	--当前正在使用哪种类型的剑舞....
x893064_IDX_SkillC_CD						= 6	--C技能的CD时间....
x893064_IDX_SkillD_CD						= 7	--C技能的CD时间....
x893064_IDX_KuangBaoTimer				= 8	--狂暴的计时器....


x893064_IDX_CombatFlag 			= 1	--是否处于战斗状态的标志....
x893064_IDX_IsKuangBaoMode	= 2	--是否处于狂暴模式的标志....


--**********************************
--初始化....
--**********************************
function x893064_OnInit(sceneId, selfId)
	--重置AI....
	x893064_ResetMyAI( sceneId, selfId )
end


--**********************************
--心跳....
--**********************************
function x893064_OnHeartBeat(sceneId, selfId, nTick)

	--检测是不是死了....
	if LuaFnIsCharacterLiving(sceneId, selfId) ~= 1 then
		return
	end

	--检测是否不在战斗状态....
	if 0 == MonsterAI_GetBoolParamByIndex( sceneId, selfId, x893064_IDX_CombatFlag ) then
		return
	end

	--狂暴状态不需要走逻辑....
	if 1 == MonsterAI_GetBoolParamByIndex( sceneId, selfId, x893064_IDX_IsKuangBaoMode ) then
		return
	end

	--A技能心跳....
	if 1 == x893064_TickSkillA( sceneId, selfId, nTick ) then
		return
	end

	--B技能心跳....
	if 1 == x893064_TickSkillB( sceneId, selfId, nTick ) then
		return
	end

	--C技能心跳....
	if 1 == x893064_TickSkillC( sceneId, selfId, nTick ) then
		return
	end

	--D技能心跳....
	if 1 == x893064_TickSkillD( sceneId, selfId, nTick ) then
		return
	end

	--E技能心跳....
	if 1 == x893064_TickSkillE( sceneId, selfId, nTick ) then
		return
	end

	--秒表心跳....
	x893064_TickStopWatch( sceneId, selfId, nTick )

end


--**********************************
--进入战斗....
--**********************************
function x893064_OnEnterCombat(sceneId, selfId, enmeyId)

	--加初始buff....
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x893064_Buff_MianYi1, 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x893064_Buff_MianYi2, 0 )

	--重置AI....
	x893064_ResetMyAI( sceneId, selfId )

	--设置进入战斗状态....
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x893064_IDX_CombatFlag, 1 )

end


--**********************************
--离开战斗....
--**********************************
function x893064_OnLeaveCombat(sceneId, selfId)

	--重置AI....
	x893064_ResetMyAI( sceneId, selfId )

	--删除自己....
	LuaFnDeleteMonster( sceneId, selfId )
	--创建对话NPC....
	local MstId = CallScriptFunction( x893064_g_FuBenScriptId, "CreateBOSS", sceneId, "MinMo_NPC", -1, -1 )
	SetUnitReputationID( sceneId, MstId, MstId, 0 )
end


--**********************************
--杀死敌人....
--**********************************
function x893064_OnKillCharacter(sceneId, selfId, targetId)

end


--**********************************
--死亡....
--**********************************
function x893064_OnDie( sceneId, selfId, killerId )

	--重置AI....
	x893064_ResetMyAI( sceneId, selfId )

	--设置已经挑战过哈大霸....
	CallScriptFunction( x893064_g_FuBenScriptId, "SetBossBattleFlag", sceneId, "MinMo", 2 )

	--如果还没有挑战过桑土公则可以挑战桑土公....
	if 2 ~= CallScriptFunction( x893064_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "QinYun" ) then
		CallScriptFunction( x893064_g_FuBenScriptId, "SetBossBattleFlag", sceneId, "QinYun", 1 )
	end
		
	-- zchw 全球公告
	local	playerName	= GetName( sceneId, killerId )
	
	--杀死怪物的是宠物则获取其主人的名字....
	local playerID = killerId
	local objType = GetCharacterType( sceneId, killerId )
	if objType == 3 then
		playerID = GetPetCreator( sceneId, killerId )
		playerName = GetName( sceneId, playerID )
	end
	
	--如果玩家组队了则获取队长的名字....
	local leaderID = GetTeamLeader( sceneId, playerID )
	if leaderID ~= -1 then
		playerName = GetName( sceneId, leaderID )
	end
	
	if playerName ~= nil then
		str = format("#{_INFOUSR%s} d鏽 d 鸬i ng� 疳nh b読 #GT� Tuy畉 Trang - M鏽 M", playerName); --乌老大
		AddGlobalCountNews( sceneId, str )
	end
	
end


--**********************************
--重置AI....
--**********************************
function x893064_ResetMyAI( sceneId, selfId )

	--重置参数....
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x893064_IDX_StopWatch, 0 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x893064_IDX_SkillA_CD, 0 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x893064_IDX_SkillB_HPStep, 0 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x893064_IDX_SkillB_Step, 0 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x893064_IDX_SkillB_Type, 1 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x893064_IDX_SkillC_CD, x893064_SkillC_CD )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x893064_IDX_SkillD_CD, x893064_SkillD_CD )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x893064_IDX_KuangBaoTimer, 0 )

	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x893064_IDX_CombatFlag, 0 )
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x893064_IDX_IsKuangBaoMode, 0 )

end

--**********************************
--A技能心跳....
--**********************************
function x893064_TickSkillA( sceneId, selfId, nTick )

	--更新技能CD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x893064_IDX_SkillA_CD )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x893064_IDX_SkillA_CD, cd-nTick )
		return 0
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x893064_IDX_SkillA_CD, x893064_SkillA_CD-(nTick-cd) )
		return x893064_UseSkillA( sceneId, selfId )
	end

end

--**********************************
--B技能心跳....
--**********************************
function x893064_TickSkillB( sceneId, selfId, nTick )

	local CurPercent = GetHp( sceneId, selfId ) / GetMaxHp( sceneId, selfId )
	local LastStep = MonsterAI_GetIntParamByIndex( sceneId, selfId, x893064_IDX_SkillB_HPStep )
	local CurStep = 0
	if CurPercent >= 1.3333 then
		CurStep = 2
	elseif CurPercent >= 1.6666 then
		CurStep = 1
	end

	if CurStep > LastStep then

		--设置参数....
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x893064_IDX_SkillB_HPStep, CurStep )
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x893064_IDX_SkillB_Step, 15 )
		local JianWuType = random( getn(x893064_SkillB_SkillIDTbl) )
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x893064_IDX_SkillB_Type, JianWuType )

		--喊话....
		MonsterTalk(sceneId, -1, "", x893064_SkillB_TalkTbl[JianWuType] )
		
		MonsterTalk(sceneId, -1, "", x893064_SkillB_Text[JianWuType] )
		--放全场景烟花....
		LuaFnSetSceneWeather(sceneId, x893064_SkillB_WeatherTbl[JianWuType], 15000 )

		--对自己使用空技能....
		local x,z = GetWorldPos( sceneId, selfId )
		LuaFnUnitUseSkill( sceneId, selfId, x893064_SkillB_SkillIDTbl[JianWuType], selfId, x, z, 0, 1 )

		return 1

	end

	return 0

end

--**********************************
--C技能心跳....
--**********************************
function x893064_TickSkillC( sceneId, selfId, nTick )

	--更新技能CD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x893064_IDX_SkillC_CD )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x893064_IDX_SkillC_CD, cd-nTick )
		return 0
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x893064_IDX_SkillC_CD, x893064_SkillC_CD-(nTick-cd) )
		return x893064_UseSkillC( sceneId, selfId )
	end

end

--**********************************
--D技能心跳....
--**********************************
function x893064_TickSkillD( sceneId, selfId, nTick )

	--更新技能CD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x893064_IDX_SkillD_CD )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x893064_IDX_SkillD_CD, cd-nTick )
		return 0
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x893064_IDX_SkillD_CD, x893064_SkillD_CD-(nTick-cd) )
		return x893064_UseSkillD( sceneId, selfId )
	end

end

--**********************************
--E技能心跳....
--**********************************
function x893064_TickSkillE( sceneId, selfId, nTick )

	--如果正在用B技能则先等待....
	if MonsterAI_GetIntParamByIndex( sceneId, selfId, x893064_IDX_SkillB_Step ) > 0 then
		return 0
	end

	--检测是否到了狂暴的时候....
	local kbTime = MonsterAI_GetIntParamByIndex( sceneId, selfId, x893064_IDX_KuangBaoTimer )
	if kbTime < x893064_EnterKuangBaoTime then

		MonsterAI_SetIntParamByIndex( sceneId, selfId, x893064_IDX_KuangBaoTimer, kbTime+nTick )
		return 0

	else

	--副本中有效的玩家的列表....
	local PlayerList = {}

	--将有效的人加入列表....
	local numPlayer = 0
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 and LuaFnIsCharacterLiving(sceneId, nHumanId) == 1 then
			PlayerList[numPlayer+1] = nHumanId
			numPlayer = numPlayer + 1
		end
	end

	--随机挑选一个玩家....
	if numPlayer <= 0 then
		return 0
	end
	local PlayerId = PlayerList[ random(numPlayer) ]

	--对自己使用一个空技能....
	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x893064_SkillE_ID, selfId, x, z, 0, 1 )

	--给玩家加失明buff....
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, PlayerId, x893064_SkillE_Buff, 0 )

	return 1

	end
end

--**********************************
--秒表心跳....
--**********************************
function x893064_TickStopWatch( sceneId, selfId, nTick )

	--限制每秒才会执行一次....
	local time = MonsterAI_GetIntParamByIndex( sceneId, selfId, x893064_IDX_StopWatch )
	if (time + nTick) > 1000 then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x893064_IDX_StopWatch, time+nTick-1000 )
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x893064_IDX_StopWatch, time+nTick )
		return
	end


	-------------------------
	--剑舞技能逻辑....
	-------------------------
	local buffStep = MonsterAI_GetIntParamByIndex( sceneId, selfId, x893064_IDX_SkillB_Step )
	local skillType = MonsterAI_GetIntParamByIndex( sceneId, selfId, x893064_IDX_SkillB_Type )
	if buffStep >= 1 and buffStep <= 15 then

		--寻找符敏仪....
		local bossId = CallScriptFunction( x893064_g_FuBenScriptId, "FindBOSS", sceneId, "FuMinYi_NPC" )
		if bossId <= 0 then
			return 0
		end

		--让符敏仪给玩家加buff....
		local buffTbl = x893064_SkillB_BuffIDTbl[skillType]
		local buffId = buffTbl[16-buffStep]
		local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
		for i=0, nHumanCount-1 do
			local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
			if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 and LuaFnIsCharacterLiving(sceneId, nHumanId) == 1 then
				LuaFnSendSpecificImpactToUnit( sceneId, bossId, bossId, nHumanId, buffId, 0 )
			end
		end

	end

	if buffStep > 0 then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x893064_IDX_SkillB_Step, buffStep-1 )
	end


end

--**********************************
--使用A技能....
--**********************************
function x893064_UseSkillA( sceneId, selfId )

	--如果正在用B技能则跳过....
	if MonsterAI_GetIntParamByIndex( sceneId, selfId, x893064_IDX_SkillB_Step ) > 0 then
		return 0
	end

	--副本中有效的玩家的列表....
	local PlayerList = {}

	--将有效的人加入列表....
	local numPlayer = 0
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 and LuaFnIsCharacterLiving(sceneId, nHumanId) == 1 then
			PlayerList[numPlayer+1] = nHumanId
			numPlayer = numPlayer + 1
		end
	end

	--随机挑选一个玩家....
	if numPlayer <= 0 then
		return 0
	end
	local PlayerId = PlayerList[ random(numPlayer) ]

	--对自己使用一个空技能....
	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x893064_SkillA_ID, selfId, x, z, 0, 1 )

	--给玩家加失明buff....
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, PlayerId, x893064_SkillA_Buff, 0 )

	return 1

end

--**********************************
--使用C技能....
--**********************************
function x893064_UseSkillC( sceneId, selfId )

	--如果正在用B技能则跳过....
	if MonsterAI_GetIntParamByIndex( sceneId, selfId, x893064_IDX_SkillB_Step ) > 0 then
		return 0
	end

	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x893064_SkillC_ID, selfId, x, z, 0, 1 )
	return 1

end

--**********************************
--使用D技能....
--**********************************
function x893064_UseSkillD( sceneId, selfId )

	--如果正在用B技能则跳过....
	if MonsterAI_GetIntParamByIndex( sceneId, selfId, x893064_IDX_SkillB_Step ) > 0 then
		return 0
	end

	CallScriptFunction((200060), "Paopao",sceneId, "M鏽 M", "T� Tuy畉 Trang", "C醕 ng呓i 鹱ng v礽 稹c �, h銀 ngg cao 馥u m� xem thi阯 h� c騨 tr秈 c騨 tr錸g, 疴u d� 瓞 c醕 ng呓i th痭g tr�?" )

	CallScriptFunction((200060), "Paopao",sceneId, "M鏽 M", "T� Tuy畉 Trang","Tr秈 sinh ta t鄆 c醤 瘘 c�, ch� ti猚 gi� 疴y 疸 tan bi猲 h猼 ch� v� l� nh鉯 ranh n鄖..." )
	CallScriptFunction((200060), "Paopao",sceneId, "Phan Tinh Tinh", "T� Tuy畉 Trang","M鱥 ng叨i ch� �, M鏽 M 餫ng th� r nhi玼 c誱 b鐈 xung quanh h, h銀 tr醤h xa..." )

	--副本中有效的玩家的列表....
	local PlayerList = {}

	--将有效的人加入列表....
	local numPlayer = 0
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 and LuaFnIsCharacterLiving(sceneId, nHumanId) == 1 then
			PlayerList[numPlayer+1] = nHumanId
			numPlayer = numPlayer + 1
		end
	end

	--随机挑选一个玩家....
	if numPlayer <= 0 then
		return 0
	end
	local PlayerId = PlayerList[ random(numPlayer) ]

	--使用空技能....
	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x893064_SkillD_ID, selfId, x, z, 0, 1 )

	--在该玩家脚底下放陷阱....
	x,z = GetWorldPos( sceneId, PlayerId )
	CreateSpecialObjByDataIndex(sceneId, selfId, x893064_SkillD_SpecObj, x, z, 0)

	return 1

end
