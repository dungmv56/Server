--飘渺峰 B b靚h 鹫o nh鈔AI

--F	【暗雷】对自己用m祎 c醝空技能....再给玩家加c醝结Th鷆 H嗷峄氐鹘疟総o� 鸬 buff....回调时让BOSS给其周围人加伤寒buff并喊话....
--G 【Tinh算】给自己用m祎 c醝加buffto� 鸬 技能....
--H 【烟花】对自己用m祎 c醝空技能....再给玩家加c醝结Th鷆 H嗷峄氐鹘疟総o� 鸬 buff....回调时喊话....
--I	【朋友】Tr醕 B Ph鄊死时给自己用m祎 c醝加buffto� 鸬 技能....


--全程都带有免疫制定技能to� 鸬 buff....
--每隔30 gi鈟对随机玩家随机使用FH....
--每隔45 gi鈟对自己使用G....
--死亡或脱离Cu礳 chi猲 时给所有玩家清除FHto� 鸬 buff....
--死亡时寻找B b靚h 鹫o nh鈔....设置其C 使用狂暴技能....
--死亡时发现B b靚h 鹫o nh鈔已经死了....则创建另m祎 c醝BOSS....


--脚本号
x402268_g_ScriptId	= 402268

--副本逻辑脚本号....
x402268_g_FuBenScriptId = 402263

--免疫Buff....
x402268_Buff_MianYi1	= 10472	--免疫m祎 些负面效果....
x402268_Buff_MianYi2	= 10471	--免疫普通隐身....

--技能....
x402268_SkillID_F		= 1037
x402268_BuffID_F1		= 10255
x402268_BuffID_F2		= 10256
x402268_SkillID_G		= 1038
x402268_SkillID_H		= 1037
x402268_BuffID_H		= 10260
x402268_SkillID_I		= 1036
x402268_BuffID_I1		= 10253
x402268_BuffID_I2		= 10254

x402268_SkillCD_FH	=	30000
x402268_SkillCD_G		=	45000


x402268_MyName			= "B b靚h 鹫o nh鈔"	--自己to� 鸬 T阯....
x402268_BrotherName = "Tr醕 B Ph鄊"		-- huynh 甬to� 鸬 T阯....


--AI Index....
x402268_IDX_KuangBaoMode	= 1	--狂暴模式....0未狂暴 1C 进入狂暴 2已经进入狂暴
x402268_IDX_CD_SkillFH		= 2	--FH技能to� 鸬 CD....
x402268_IDX_CD_SkillG			= 3	--G技能to� 鸬 CD....
x402268_IDX_CD_Talk				= 4	--FH技能喊话to� 鸬 CD....

x402268_IDX_CombatFlag 		= 1	--喧ng否处于Cu礳 chi猲 状态to� 鸬 标志....


--**********************************
--初始化....
--**********************************
function x402268_OnInit(sceneId, selfId)
	--重置AI....
	x402268_ResetMyAI( sceneId, selfId )
end


--**********************************
--心跳....
--**********************************
function x402268_OnHeartBeat(sceneId, selfId, nTick)

	--检测喧ng不喧ng死了....
	if LuaFnIsCharacterLiving(sceneId, selfId) ~= 1 then
		return
	end

	--检测喧ng否不T読 Cu礳 chi猲 状态....
	if 0 == MonsterAI_GetBoolParamByIndex( sceneId, selfId, x402268_IDX_CombatFlag ) then
		return
	end

	--FH技能心跳....
	if 1 == x402268_TickSkillFH( sceneId, selfId, nTick ) then
		return
	end

	--G技能心跳....
	if 1 == x402268_TickSkillG( sceneId, selfId, nTick ) then
		return
	end

	--I技能心跳....
	if 1 == x402268_TickSkillI( sceneId, selfId, nTick ) then
		return
	end

end


--**********************************
--进入Cu礳 chi猲 ....
--**********************************
function x402268_OnEnterCombat(sceneId, selfId, enmeyId)

	--加初始buff....
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x402268_Buff_MianYi1, 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x402268_Buff_MianYi2, 0 )

	--重置AI....
	x402268_ResetMyAI( sceneId, selfId )

	--设置进入Cu礳 chi猲 状态....
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x402268_IDX_CombatFlag, 1 )

end


--**********************************
--离开Cu礳 chi猲 ....
--**********************************
function x402268_OnLeaveCombat(sceneId, selfId)

	--重置AI....
	x402268_ResetMyAI( sceneId, selfId )

	--遍历场景里所有to� 鸬 怪....寻找 huynh 甬并将其删除....
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if x402268_BrotherName == GetName( sceneId, MonsterId ) then
			LuaFnDeleteMonster( sceneId, MonsterId )
		end
	end

	--删除自己....
	LuaFnDeleteMonster( sceneId, selfId )

end


--**********************************
--杀死敌人....
--**********************************
function x402268_OnKillCharacter(sceneId, selfId, targetId)

end


--**********************************
--死亡....
--**********************************
function x402268_OnDie( sceneId, selfId, killerId )

	--重置AI....
	x402268_ResetMyAI( sceneId, selfId )

	local bFind = 0

	--遍历场景里所有to� 鸬 怪....寻找 huynh 甬....给其设置C 使用狂暴技能....
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if x402268_BrotherName == GetName( sceneId, MonsterId ) and LuaFnIsCharacterLiving(sceneId, MonsterId) == 1 then
			bFind = 1
			MonsterAI_SetIntParamByIndex( sceneId, MonsterId, x402268_IDX_KuangBaoMode, 1 )
		end
	end

	--如果没找到 huynh 甬则� 餴琺骶褪Ｗ约簃祎 c醝了....
	if 0 == bFind then
		--创建端木元....
		local MstId = CallScriptFunction( x402268_g_FuBenScriptId, "CreateBOSS", sceneId, "DuanMuYuan_BOSS", -1, -1 )
		LuaFnNpcChat(sceneId, MstId, 0, "#{PMF_20080521_18}")
		--设置已经Khi陁 chi猲过双子....
		CallScriptFunction( x402268_g_FuBenScriptId, "SetBossBattleFlag", sceneId, "ShuangZi", 2 )
	end

end


--**********************************
--重置AI....
--**********************************
function x402268_ResetMyAI( sceneId, selfId )

	--重置参数....
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x402268_IDX_KuangBaoMode, 0 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x402268_IDX_CD_SkillFH, x402268_SkillCD_FH )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x402268_IDX_CD_SkillG, x402268_SkillCD_G )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x402268_IDX_CD_Talk, 0 )
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x402268_IDX_CombatFlag, 0 )

	--给所有玩家清除FHto� 鸬 buff....
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 then
			LuaFnCancelSpecificImpact( sceneId, nHumanId, x402268_BuffID_F1 )
			LuaFnCancelSpecificImpact( sceneId, nHumanId, x402268_BuffID_H )
		end
	end

end


--**********************************
--FH技能心跳....
--**********************************
function x402268_TickSkillFH( sceneId, selfId, nTick )

	--更新技能CD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x402268_IDX_CD_SkillFH )
	if cd > nTick then

		MonsterAI_SetIntParamByIndex( sceneId, selfId, x402268_IDX_CD_SkillFH, cd-nTick )
		return 0

	else

		MonsterAI_SetIntParamByIndex( sceneId, selfId, x402268_IDX_CD_SkillFH, x402268_SkillCD_FH-(nTick-cd) )

		--随机使用FH....
		if random(100) < 50 then
			return x402268_UseSkillF( sceneId, selfId )
		else
			return x402268_UseSkillH( sceneId, selfId )
		end

	end

end


--**********************************
--G技能心跳....
--**********************************
function x402268_TickSkillG( sceneId, selfId, nTick )

	--更新技能CD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x402268_IDX_CD_SkillG )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x402268_IDX_CD_SkillG, cd-nTick )
		return 0
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x402268_IDX_CD_SkillG, x402268_SkillCD_G-(nTick-cd) )
		return x402268_UseSkillG( sceneId, selfId )
	end

end


--**********************************
--I技能心跳....
--**********************************
function x402268_TickSkillI( sceneId, selfId, nTick )

	-- 鹫t 疬㧟当前狂暴mode....
	local CurMode = MonsterAI_GetIntParamByIndex( sceneId, selfId, x402268_IDX_KuangBaoMode )

	if CurMode == 0 or CurMode == 2 then

		--如果不C 狂暴或者已经狂暴了则Tr� v�....
		return 0

	elseif CurMode == 1 then

		--如果C 狂暴则使用狂暴技能....
		local ret =  x402268_UseSkillI( sceneId, selfId )
		if ret == 1 then
			MonsterAI_SetIntParamByIndex( sceneId, selfId, x402268_IDX_KuangBaoMode, 2 )
			return 1
		else
			return 0
		end

	end

end


--**********************************
--使用F技能....
--**********************************
function x402268_UseSkillF( sceneId, selfId )

	--副本中有效to� 鸬 玩家to� 鸬 列表....
	local PlayerList = {}

	--将有效to� 鸬 人加入列表....
	local numPlayer = 0
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 and LuaFnIsCharacterLiving(sceneId, nHumanId) == 1 then
			PlayerList[numPlayer+1] = nHumanId
			numPlayer = numPlayer + 1
		end
	end

	--随机挑选m祎 c醝玩家....
	if numPlayer <= 0 then
		return 0
	end
	local PlayerId = PlayerList[ random(numPlayer) ]

	--对自己使用空技能....
	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x402268_SkillID_F, selfId, x, z, 0, 1 )

	--给玩家加结Th鷆 H嗷氐鹘疟総o� 鸬 buff....
	LuaFnSendSpecificImpactToUnit( sceneId, PlayerId, PlayerId, PlayerId, x402268_BuffID_F1, 0 )

	return 1

end


--**********************************
--使用G技能....
--**********************************
function x402268_UseSkillG( sceneId, selfId )

	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x402268_SkillID_G, selfId, x, z, 0, 1 )
	MonsterTalk( sceneId, -1, "", "#{PMF_20080530_01}" )
	return 1

end


--**********************************
--使用H技能....
--**********************************
function x402268_UseSkillH( sceneId, selfId )

	--副本中有效to� 鸬 玩家to� 鸬 列表....
	local PlayerList = {}

	--将有效to� 鸬 人加入列表....
	local numPlayer = 0
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 and LuaFnIsCharacterLiving(sceneId, nHumanId) == 1 then
			PlayerList[numPlayer+1] = nHumanId
			numPlayer = numPlayer + 1
		end
	end

	--随机挑选m祎 c醝玩家....
	if numPlayer <= 0 then
		return 0
	end
	local PlayerId = PlayerList[ random(numPlayer) ]

	--对自己使用空技能....
	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x402268_SkillID_H, selfId, x, z, 0, 1 )

	--给玩家加结Th鷆 H嗷氐鹘疟総o� 鸬 buff....
	LuaFnSendSpecificImpactToUnit( sceneId, PlayerId, PlayerId, PlayerId, x402268_BuffID_H, 0 )

	return 1

end


--**********************************
--使用I技能....
--**********************************
function x402268_UseSkillI( sceneId, selfId )

	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x402268_BuffID_I1, 5000 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x402268_BuffID_I2, 5000 )

	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x402268_SkillID_I, selfId, x, z, 0, 1 )

	MonsterTalk( sceneId, -1, "", "#{PMF_20080530_02}" )

	return 1

end


--**********************************
--暗雷和烟花to� 鸬 buff结束to� 鸬 时簃祎 氐鞅窘涌�....
--**********************************
function x402268_OnImpactFadeOut( sceneId, selfId, impactId )

	--寻找BOSS....
	local bossId = -1
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if x402268_MyName == GetName( sceneId, MonsterId ) then
			bossId = MonsterId
		end
	end

	--没找到则Tr� v�....
	if bossId == -1 then
		return
	end

	--如果喧ng烟花to� 鸬 buff则让BOSS喊话....
	if impactId == x402268_BuffID_H then
		MonsterTalk( sceneId, -1, "", "#{PMF_20080530_03}"..GetName( sceneId, selfId ).."#{PMF_20080530_04}" )
		return
	end

	--如果喧ng暗雷to� 鸬 buff....则让BOSS给附近to� 鸬 玩家加m祎 c醝伤害to� 鸬 buff并喊话....
	if impactId == x402268_BuffID_F1 then

		MonsterTalk( sceneId, -1, "", "#{PMF_20080530_03}"..GetName( sceneId, selfId ).."#{PMF_20080530_05}" )

		local x = 0
		local z = 0
		local xx = 0
		local zz = 0
		x,z = GetWorldPos( sceneId,selfId )
		local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
		for i=0, nHumanNum-1  do
			local PlayerId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
			if LuaFnIsObjValid(sceneId, PlayerId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, PlayerId) == 1 and LuaFnIsCharacterLiving(sceneId, PlayerId) == 1 and PlayerId ~= selfId then
				xx,zz = GetWorldPos(sceneId,PlayerId)
				if (x-xx)*(x-xx) + (z-zz)*(z-zz) < 8*8 then
					LuaFnSendSpecificImpactToUnit( sceneId, bossId, bossId, PlayerId, x402268_BuffID_F2, 0 )
				end
			end
		end

		return

	end

end
