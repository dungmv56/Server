--飘渺峰 不平道人AI

--F	【暗雷】对自己用一个空技能....再给玩家加个结束后会回调脚本的buff....回调时让BOSS给其周围人加伤寒buff并喊话....
--G 【精算】给自己用一个加buff的技能....
--H 【烟花】对自己用一个空技能....再给玩家加个结束后会回调脚本的buff....回调时喊话....
--I	【朋友】卓不凡死时给自己用一个加buff的技能....


--全程都带有免疫制定技能的buff....
--每隔30秒对随机玩家随机使用FH....
--每隔45秒对自己使用G....
--死亡或脱离战斗时给所有玩家清除FH的buff....
--死亡时寻找不平道人....设置其需要使用狂暴技能....
--死亡时发现不平道人已经死了....则创建另一个BOSS....


--脚本号
x893066_g_ScriptId	= 893066

--副本逻辑脚本号....
x893066_g_FuBenScriptId = 893063
x893066_MyName			= "T V"	--自己的名字....

--免疫Buff....
x893066_Buff_MianYi1	= 10472	--免疫一些负面效果....
x893066_Buff_MianYi2	= 10471	--免疫普通隐身....

--技能....
x893066_SkillID_F		= 1631
x893066_BuffID_F1		= 22443
x893066_BuffID_F2		= 22444
x893066_BuffID_F3		= 22445
x893066_SkillID_G		= 1632
x893066_SkillID_G_SpecObj		= 161
x893066_SkillID_H		= 1630
x893066_BuffID_H		= 22405
x893066_SkillID_I		= 1036
x893066_BuffID_I1		= 10253
x893066_BuffID_I2		= 10254

x893066_SkillCD_FH	=	20000
x893066_SkillCD_G		=	10000


x893066_BrotherName = "Tr醕 B Ph鄊"		--兄弟的名字....


--AI Index....
x893066_IDX_KuangBaoMode	= 1	--狂暴模式....0未狂暴 1需要进入狂暴 2已经进入狂暴
x893066_IDX_CD_SkillFH		= 2	--FH技能的CD....
x893066_IDX_CD_SkillG			= 3	--G技能的CD....
x893066_IDX_CD_Talk				= 4	--FH技能喊话的CD....

x893066_IDX_CombatFlag 		= 1	--是否处于战斗状态的标志....


--**********************************
--初始化....
--**********************************
function x893066_OnInit(sceneId, selfId)
	--重置AI....
	x893066_ResetMyAI( sceneId, selfId )
end


--**********************************
--心跳....
--**********************************
function x893066_OnHeartBeat(sceneId, selfId, nTick)

	--检测是不是死了....
	if LuaFnIsCharacterLiving(sceneId, selfId) ~= 1 then
		return
	end

	--检测是否不在战斗状态....
	if 0 == MonsterAI_GetBoolParamByIndex( sceneId, selfId, x893066_IDX_CombatFlag ) then
		return
	end

	--FH技能心跳....
	if 1 == x893066_TickSkillFH( sceneId, selfId, nTick ) then
		return
	end

	--G技能心跳....
	if 1 == x893066_TickSkillG( sceneId, selfId, nTick ) then
		return
	end

	--I技能心跳....
	if 1 == x893066_TickSkillI( sceneId, selfId, nTick ) then
		return
	end

end


--**********************************
--进入战斗....
--**********************************
function x893066_OnEnterCombat(sceneId, selfId, enmeyId)

	--加初始buff....
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x893066_Buff_MianYi1, 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x893066_Buff_MianYi2, 0 )

	--重置AI....
	x893066_ResetMyAI( sceneId, selfId )

	--设置进入战斗状态....
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x893066_IDX_CombatFlag, 1 )

end


--**********************************
--离开战斗....
--**********************************
function x893066_OnLeaveCombat(sceneId, selfId)

	--重置AI....
	x893066_ResetMyAI( sceneId, selfId )

	--删除自己....
	LuaFnDeleteMonster( sceneId, selfId )
	--创建对话NPC....
	local MstId = CallScriptFunction( x893066_g_FuBenScriptId, "CreateBOSS", sceneId, "TaoQin_NPC", -1, -1 )
	SetUnitReputationID( sceneId, MstId, MstId, 0 )
end


--**********************************
--杀死敌人....
--**********************************
function x893066_OnKillCharacter(sceneId, selfId, targetId)

end


--**********************************
--死亡....
--**********************************
function x893066_OnDie( sceneId, selfId, killerId )

	--重置AI....
	x893066_ResetMyAI( sceneId, selfId )

	--删除自己....
	SetCharacterDieTime( sceneId, selfId, 3000 )

	--开启乌老大死亡的计时器....
	--local x,z = GetWorldPos( sceneId, selfId )
	--CallScriptFunction( x893066_g_FuBenScriptId, "OpenTaoQinDieTimer", sceneId, 4, x893066_g_ScriptId, x, z )

	--设置已经挑战过乌老大....
	CallScriptFunction( x893066_g_FuBenScriptId, "SetBossBattleFlag", sceneId, "TaoQin", 2 )

	--如果还没有挑战过双子则可以挑战双子....
	if 2 ~= CallScriptFunction( x893066_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "PangQi" )	then
		CallScriptFunction( x893066_g_FuBenScriptId, "SetBossBattleFlag", sceneId, "PangQi", 1 )
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
		str = format("#ccc33ccK� l� thay, #c99ccff#{_INFOUSR%s}#ccc33cc th痭g l頽h 鸬i ng� 疳nh b読 T� Tuy畉 Trang - T V, ch苙g may 瘌ng ph鋓 c� quan, c� ti猲g 疣n tru tr閛 ph醫 ra th r⺪ ng叨i...",playerName); --秦韵
		AddGlobalCountNews( sceneId, str )
	end
	MonsterTalk(sceneId, -1, "T V", "B� b鋙...Thg ng�...C t..." )
	MonsterTalk(sceneId, -1, "T V", "..." )
	MonsterTalk(sceneId, -1, "T V", "...Nh唼c..." )
	MonsterTalk(sceneId, -1, "T V", "...Phi阯...Lai..." )
	MonsterTalk(sceneId, -1, "T V", "...V�...Kh穒..." )
	MonsterTalk(sceneId, -1, "T V", "...C叨ng..." )
	MonsterTalk(sceneId, -1, "T V", "...Li阯...V�..." )
	MonsterTalk(sceneId, -1, "T V", "...B読...Tinh la 疣n...B醤g X�..." )
	MonsterTalk(sceneId, -1, "", "T V ch苙g nh鎛g c� th� d鵱g ti猲g 疣n 瓞 n骾 chuy畁 m� c鬾g phu th� l読 r cao c叨ng, qu� th l㱮 h読. Xem c鈛 h醫 c黙 m� tr呔c khi ch猼 th khi猲 ta 鸨 m� h鬷 l課h. Xem ra m� ta 疸 餺醤 疬㧟 ch鷑g ta 皙n 疴y l� 瓞 t靘 Tinh La 朽n - B鄋g X�..." )
end


--**********************************
--重置AI....
--**********************************
function x893066_ResetMyAI( sceneId, selfId )

	--重置参数....
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x893066_IDX_KuangBaoMode, 0 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x893066_IDX_CD_SkillFH, x893066_SkillCD_FH )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x893066_IDX_CD_SkillG, x893066_SkillCD_G )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x893066_IDX_CD_Talk, 0 )
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x893066_IDX_CombatFlag, 0 )

	--给所有玩家清除FH的buff....
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 then
			LuaFnCancelSpecificImpact( sceneId, nHumanId, x893066_BuffID_F1 )
			LuaFnCancelSpecificImpact( sceneId, nHumanId, x893066_BuffID_H )
		end
	end

end


--**********************************
--FH技能心跳....
--**********************************
function x893066_TickSkillFH( sceneId, selfId, nTick )

	--更新技能CD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x893066_IDX_CD_SkillFH )
	if cd > nTick then

		MonsterAI_SetIntParamByIndex( sceneId, selfId, x893066_IDX_CD_SkillFH, cd-nTick )
		return 0

	else

		MonsterAI_SetIntParamByIndex( sceneId, selfId, x893066_IDX_CD_SkillFH, x893066_SkillCD_FH-(nTick-cd) )

		--随机使用FH....
		if random(100) < 50 then
			return x893066_UseSkillF( sceneId, selfId )
		else
			return x893066_UseSkillH( sceneId, selfId )
		end

	end

end


--**********************************
--G技能心跳....
--**********************************
function x893066_TickSkillG( sceneId, selfId, nTick )

	--更新技能CD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x893066_IDX_CD_SkillG )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x893066_IDX_CD_SkillG, cd-nTick )
		return 0
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x893066_IDX_CD_SkillG, x893066_SkillCD_G-(nTick-cd) )
		return x893066_UseSkillG( sceneId, selfId )
	end

end


--**********************************
--I技能心跳....
--**********************************
function x893066_TickSkillI( sceneId, selfId, nTick )

	--获得当前狂暴mode....
	local CurMode = MonsterAI_GetIntParamByIndex( sceneId, selfId, x893066_IDX_KuangBaoMode )

	if CurMode == 0 or CurMode == 2 then

		--如果不需要狂暴或者已经狂暴了则返回....
		return 0

	elseif CurMode == 1 then

		--如果需要狂暴则使用狂暴技能....
		local ret =  x893066_UseSkillI( sceneId, selfId )
		if ret == 1 then
			MonsterAI_SetIntParamByIndex( sceneId, selfId, x893066_IDX_KuangBaoMode, 2 )
			return 1
		else
			return 0
		end

	end

end


--**********************************
--使用F技能....
--**********************************
function x893066_UseSkillF( sceneId, selfId )

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

	--对自己使用空技能....
	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x893066_SkillID_F, selfId, x, z, 0, 1 )

	--给玩家加结束后回调脚本的buff....
	LuaFnSendSpecificImpactToUnit( sceneId, PlayerId, PlayerId, PlayerId, x893066_BuffID_F1, 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, PlayerId, PlayerId, PlayerId, x893066_BuffID_F3, 0 )

	return 1

end


--**********************************
--使用G技能....
--**********************************
function x893066_UseSkillG( sceneId, selfId )


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
	LuaFnUnitUseSkill( sceneId, selfId, x893066_x893066_SkillID_G, selfId, x, z, 0, 1 )

	local x,z = GetWorldPos( sceneId, selfId )
	local MstId = CallScriptFunction( x893066_g_FuBenScriptId, "CreateBOSS", sceneId, "HuiYinFan_BOSS", x, z )
	SetCharacterDieTime( sceneId, MstId, 14500 )

	--在该玩家脚底下放陷阱....
	x,z = GetWorldPos( sceneId, PlayerId )
	CreateSpecialObjByDataIndex(sceneId, selfId, x893066_SkillID_G_SpecObj, x, z, 0)

	CallScriptFunction((200060), "Paopao",sceneId, "Phan Tinh Tinh", "T� Tuy畉 Trang", "T V 餫ng ng鄖 c鄋g 穰y nhanh 鸬c t醕 g鋣 疣n, xem ra m� ta 鸶nh tri畊 t H癷 耺 Phi阯 khu猚h 鹫i 鈓 thanh. M鱥 ng叨i ph鋓 ch� � c th!" )
	return 1

end


--**********************************
--使用H技能....
--**********************************
function x893066_UseSkillH( sceneId, selfId )

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

	--对自己使用空技能....
	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x893066_SkillID_H, selfId, x, z, 0, 1 )

	--给玩家加结束后回调脚本的buff....
	LuaFnSendSpecificImpactToUnit( sceneId, PlayerId, PlayerId, PlayerId, x893066_BuffID_H, 0 )

	return 1

end


--**********************************
--使用I技能....
--**********************************
function x893066_UseSkillI( sceneId, selfId )

	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x893066_BuffID_I1, 5000 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x893066_BuffID_I2, 5000 )

	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x893066_SkillID_I, selfId, x, z, 0, 1 )

	MonsterTalk( sceneId, -1, "", "#{PMF_20080530_02}" )

	return 1

end


--**********************************
--暗雷和烟花的buff结束的时候回调本接口....
--**********************************
function x893066_OnImpactFadeOut( sceneId, selfId, impactId )

	--寻找BOSS....
	local bossId = -1
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if x893066_MyName == GetName( sceneId, MonsterId ) then
			bossId = MonsterId
		end
	end

	--没找到则返回....
	if bossId == -1 then
		return
	end

	--如果是烟花的buff则让BOSS喊话....
	if impactId == x893066_BuffID_H then
		MonsterTalk( sceneId, -1, "", "#{PMF_20080530_03}"..GetName( sceneId, selfId ).."#{PMF_20080530_04}" )
		return
	end

	--如果是暗雷的buff....则让BOSS给附近的玩家加一个伤害的buff并喊话....
	if impactId == x893066_BuffID_F1 then

		CallScriptFunction((200060), "Paopao",sceneId, "Phan Tinh Tinh", "T� Tuy畉 Trang", "Ch� � k靉 "..GetName( sceneId, selfId )..", ng呓i 疸 tr鷑g ph鋓 Tr鷆 膎h Di陁 H皀g c黙 T V. Mau r秈 xa 鸬i ng� n猽 kh鬾g s� 鋘h h叻ng t緄 t c� th鄋h vi阯 痼..." )

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
				if (x-xx)*(x-xx) + (z-zz)*(z-zz) < 16*16 then
					LuaFnSendSpecificImpactToUnit( sceneId, bossId, bossId, PlayerId, x893066_BuffID_F2, 0 )
				end
			end
		end

		return

	end

end
