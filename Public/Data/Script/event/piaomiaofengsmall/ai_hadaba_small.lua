--飘渺峰 C醦 姓i B酇I

--A 【哪里走】给自己用m祎 c醝空技能....所有非Thi猽 L鈓玩家加定身buff....
--B 【悬枢之痛】给自己加不能移动双倍攻击buff....
--C 【气海之痛】给自己加受到伤害加倍buff....
--D 【丝竹空之痛】给自己加被玩家挑衅to� 鸬 buff....
--E 【疯狂】给自己加m祎 击致命buff....

--全程都带有免疫制定技能to� 鸬 buff....
--20 gi鈟后开始使用A技能....冷却20 gi鈟....
--25 gi鈟后开始循环释放BCD技能....冷却分别喧ng20..20..30....
--5 ph鷗后进入狂暴模式....停止使用ABCD....清除ABCDto� 鸬 buff....使用E技能....

--脚本号
x402277_g_ScriptId	= 402277

--副本逻辑脚本号....
x402277_g_FuBenScriptId = 402276

--buff....
x402277_Buff_MianYi1	= 10472	--免疫m祎 些负面效果....
x402277_Buff_MianYi2	= 10471	--免疫普通隐身....
x402277_Skill_A			=	1024
x402277_Buff_A			= 10230
x402277_Skill_B			=	1025
x402277_Buff_B			= 10231
x402277_Skill_C			=	1026
x402277_Buff_C			= 10232
x402277_Skill_D			=	1027
x402277_Buff_D			= 10233
x402277_Buff_E1			= 10234
x402277_Buff_E2			= 10235

--技能释放时间表....
x402277_UseSkillList =
{
	{ 20,  "A" },
	{ 25,  "B" },
	{ 40,  "A" },
	{ 45,  "C" },
	{ 60,  "A" },
	{ 65,  "D" },
	{ 80,  "A" },
	{ 95,  "B" },
	{ 100, "A" },
	{ 115, "C" },
	{ 120, "A" },
	{ 135, "D" },
	{ 140, "A" },
	{ 160, "A" },
	{ 165, "B" },
	{ 180, "A" },
	{ 185, "C" },
	{ 200, "A" },
	{ 205, "D" },
	{ 220, "A" },
	{ 235, "B" },
	{ 240, "A" },
	{ 255, "C" },
	{ 260, "A" },
	{ 275, "D" },
	{ 280, "A" },
	{ 300, "E" }
}


--AI Index....
x402277_IDX_CombatTime		= 1	--进入Cu礳 chi猲 to� 鸬 计时器....用于记录已经进入Cu礳 chi猲 多长时间了....
x402277_IDX_UseSkillIndex	= 2	--接下来该使用技能表中to� 鸬 第几c醝技能....

x402277_IDX_CombatFlag 			= 1	--喧ng否处于Cu礳 chi猲 状态to� 鸬 标志....
x402277_IDX_IsKuangBaoMode	= 2	--喧ng否处于狂暴模式to� 鸬 标志....


--**********************************
--初始化....
--**********************************
function x402277_OnInit(sceneId, selfId)
	--重置AI....
	x402277_ResetMyAI( sceneId, selfId )
end


--**********************************
--心跳....
--**********************************
function x402277_OnHeartBeat(sceneId, selfId, nTick)

	--检测喧ng不喧ng死了....
	if LuaFnIsCharacterLiving(sceneId, selfId) ~= 1 then
		return
	end

	--检测喧ng否不T読 Cu礳 chi猲 状态....
	if 0 == MonsterAI_GetBoolParamByIndex( sceneId, selfId, x402277_IDX_CombatFlag ) then
		return
	end

	--狂暴状态不C 走逻辑....
	if 1 == MonsterAI_GetBoolParamByIndex( sceneId, selfId, x402277_IDX_IsKuangBaoMode ) then
		return
	end

	--==================================
	--根据节目单释放技能....
	--==================================

	-- 鹫t 疬㧟Cu礳 chi猲 时间和已经执行到技能表中to� 鸬 第几项....
	local CombatTime = MonsterAI_GetIntParamByIndex( sceneId, selfId, x402277_IDX_CombatTime )
	local NextSkillIndex = MonsterAI_GetIntParamByIndex( sceneId, selfId, x402277_IDX_UseSkillIndex )
	--累加进入Cu礳 chi猲 to� 鸬 时间....
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x402277_IDX_CombatTime, CombatTime + nTick )

	--如果已经执行完整张技能表则不使用技能....
	if NextSkillIndex < 1 or NextSkillIndex > getn( x402277_UseSkillList ) then
		return
	end

	--如果已经到了用C醝 n鄖 技能to� 鸬 时间则使用技能....
	local SkillData = x402277_UseSkillList[NextSkillIndex]
	if ( CombatTime + nTick ) >= SkillData[1]*1000 then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x402277_IDX_UseSkillIndex, NextSkillIndex+1 )
		x402277_UseMySkill( sceneId, selfId, SkillData[2] )
	end


end


--**********************************
--进入Cu礳 chi猲 ....
--**********************************
function x402277_OnEnterCombat(sceneId, selfId, enmeyId)

	--简单版缥缈峰不C 加初始buff....
	--LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x402277_Buff_MianYi1, 0 )
	--LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x402277_Buff_MianYi2, 0 )

	--重置AI....
	x402277_ResetMyAI( sceneId, selfId )

	--设置进入Cu礳 chi猲 状态....
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x402277_IDX_CombatFlag, 1 )

end


--**********************************
--离开Cu礳 chi猲 ....
--**********************************
function x402277_OnLeaveCombat(sceneId, selfId)

	--重置AI....
	x402277_ResetMyAI( sceneId, selfId )

	--删除自己....
	LuaFnDeleteMonster( sceneId, selfId )

	--创建对话NPC....
	local MstId = CallScriptFunction( x402277_g_FuBenScriptId, "CreateBOSS", sceneId, "HaDaBa_NPC", -1, -1 )
	SetUnitReputationID( sceneId, MstId, MstId, 0 )

end


--**********************************
--杀死敌人....
--**********************************
function x402277_OnKillCharacter(sceneId, selfId, targetId)

end


--**********************************
--死亡....
--**********************************
function x402277_OnDie( sceneId, selfId, killerId )

	--重置AI....
	x402277_ResetMyAI( sceneId, selfId )

	--设置已经Khi陁 chi猲过C醦 姓i B�....
	CallScriptFunction( x402277_g_FuBenScriptId, "SetBossBattleFlag", sceneId, "HaDaBa", 2 )

	--如果还没有Khi陁 chi猲过Tang Th� C鬾g则可以Khi陁 chi猲Tang Th� C鬾g....
	if 2 ~= CallScriptFunction( x402277_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "SangTuGong" ) then
		CallScriptFunction( x402277_g_FuBenScriptId, "SetBossBattleFlag", sceneId, "SangTuGong", 1 )
	end
	-- zchw 全球公告
	local	playerName	= GetName( sceneId, killerId )
	
	--杀死怪物to� 鸬 喧ng宠物詍祎 袢∑渲魅藅o� 鸬 T阯....
	local playerID = killerId
	local objType = GetCharacterType( sceneId, killerId )
	if objType == 3 then
		playerID = GetPetCreator( sceneId, killerId )
		playerName = GetName( sceneId, playerID )
	end
	
	--如果玩家组队了詍祎 袢《映o� 鸬 T阯....
	local leaderID = GetTeamLeader( sceneId, playerID )
	if leaderID ~= -1 then
		playerName = GetName( sceneId, leaderID )
	end
	
	if playerName ~= nil then
		str = format("#{XPM_8724_1}#{_INFOUSR%s}#{XPM_8724_2}", playerName); --C醦 姓i B�
		AddGlobalCountNews( sceneId, str )
	end
	
end


--**********************************
--重置AI....
--**********************************
function x402277_ResetMyAI( sceneId, selfId )

	--重置参数....
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x402277_IDX_CombatTime, 0 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x402277_IDX_UseSkillIndex, 1 )

	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x402277_IDX_IsKuangBaoMode, 0 )
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x402277_IDX_CombatFlag, 0 )

	--清除buff....
	LuaFnCancelSpecificImpact( sceneId, selfId, x402277_Buff_B )
	LuaFnCancelSpecificImpact( sceneId, selfId, x402277_Buff_C )
	LuaFnCancelSpecificImpact( sceneId, selfId, x402277_Buff_D )
	LuaFnCancelSpecificImpact( sceneId, selfId, x402277_Buff_E1 )
	LuaFnCancelSpecificImpact( sceneId, selfId, x402277_Buff_E2 )

end


--**********************************
--BOSS使用技能....
--**********************************
function x402277_UseMySkill( sceneId, selfId, skill )

	if skill == "A" then

		x402277_SkillA_NaLiZou( sceneId, selfId )

	elseif skill == "B" then

		MonsterTalk(sceneId, -1, "", "#{PMF_20080530_06}" )
		local x,z = GetWorldPos( sceneId, selfId )
		LuaFnUnitUseSkill( sceneId, selfId, x402277_Skill_B, selfId, x, z, 0, 0 )
		LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x402277_Buff_B, 2000 )

	elseif skill == "C" then

		MonsterTalk(sceneId, -1, "", "#{PMF_20080530_07}" )
		local x,z = GetWorldPos( sceneId, selfId )
		LuaFnUnitUseSkill( sceneId, selfId, x402277_Skill_C, selfId, x, z, 0, 0 )
		LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x402277_Buff_C, 0 )

	elseif skill == "D" then

		local enemyId = GetMonsterCurEnemy( sceneId, selfId )
		if enemyId > 0 then
			if GetCharacterType( sceneId, enemyId ) == 3 then
				enemyId = GetPetCreator( sceneId, enemyId )
			end
			MonsterTalk(sceneId, -1, "", "#{PMF_20080530_08}" )
			local x,z = GetWorldPos( sceneId, selfId )
			LuaFnUnitUseSkill( sceneId, selfId, x402277_Skill_D, selfId, x, z, 0, 0 )
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, enemyId, selfId, x402277_Buff_D, 0 )
		end

	elseif skill == "E" then

		MonsterAI_SetBoolParamByIndex( sceneId, selfId, x402277_IDX_IsKuangBaoMode, 1 )
		x402277_SkillE_KuangBao( sceneId, selfId )

	end

end


--**********************************
--哪里走技能....对非Thi猽 L鈓玩家加buff....
--**********************************
function x402277_SkillA_NaLiZou( sceneId, selfId )

	MonsterTalk(sceneId, -1, "", "#{PMF_20080530_09}" )

	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1 do

		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 and LuaFnIsCharacterLiving(sceneId, nHumanId) == 1 then
			if GetMenPai(sceneId,nHumanId) ~= MP_SHAOLIN then
				LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, nHumanId, x402277_Buff_A, 0 )
				local x,z = GetWorldPos( sceneId, selfId )
				LuaFnUnitUseSkill( sceneId, selfId, x402277_Skill_A, selfId, x, z, 0, 0 )
			end
		end

	end

end


--**********************************
--狂暴技能....
--**********************************
function x402277_SkillE_KuangBao( sceneId, selfId )

	--Hu� b鯞CDto� 鸬 buff....
	LuaFnCancelSpecificImpact( sceneId, selfId, x402277_Buff_B )
	LuaFnCancelSpecificImpact( sceneId, selfId, x402277_Buff_C )
	LuaFnCancelSpecificImpact( sceneId, selfId, x402277_Buff_D )

	--加狂暴buff....
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x402277_Buff_E1, 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x402277_Buff_E2, 0 )

end
