--帮战副本
--旗台NPC交互脚本

--脚本号
x402301_g_ScriptId	= 402301

--帮战副本脚本
x402301_g_BangzhanScriptId	= 402047

--大旗存T読 时间
x402301_g_FlagTime	= 10*60

x402301_g_OpenFlagSelfIDIndex = 10						--当前正T読 操作旗台to� 鸬 selfidT読 32c醝副本数据中to� 鸬 索引
x402301_g_OpenFlagStartTime = 11							--当前正T読 操作旗台to� 鸬 开始时间T読 32c醝副本数据中to� 鸬 索引
x402301_g_FlagRemainedTime = 12								--旗帜升起以后to� 鸬 剩余时间T読 32c醝副本数据中to� 鸬 索引

x402301_g_GuildPoint_GetFlag = 4							--积分规则索引,表GuildWarPoint.txtto� 鸬 ID

--帮战数据索引,对应程序中to� 鸬  enum GUILDWAR_INT_ARRAY
x402301_g_A_FlagNumIndex = 16									--A帮占领大旗次数T読 帮战数组中to� 鸬 索引
x402301_g_B_FlagNumIndex = 17									--B帮占领大旗次数T読 帮战数组中to� 鸬 索引

--c醝人积分数据索引,对应程序enum GUILDWAR_INT_INDEX
x402301_g_Human_FlagIndex = 3									--c醝人占领大旗次数索引


--阵营NPC
x402301_g_A_FlagName = "Vi阭 Ho鄋g chi猲 k�"
x402301_g_A_FlagID = 13332
x402301_g_A_FlagPosX = 115.9615
x402301_g_A_FlagPosZ = 130.9660

x402301_g_B_FlagName = "Xi V遳 chi猲 k�"
x402301_g_B_FlagID = 13323
x402301_g_B_FlagPosX = 115.9615
x402301_g_B_FlagPosZ = 130.9660

--**********************************
--特殊交互:条件判断
--**********************************
function x402301_OnActivateConditionCheck( sceneId, selfId, activatorId )
	--喧ng否喧ng副本
	local sceneType = LuaFnGetSceneType( sceneId )
	if sceneType ~= 1 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{BHXZ_081103_78}")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,activatorId)
		return 0
	end

	--喧ng否喧ng所C to� 鸬 副本
	local fubentype = LuaFnGetCopySceneData_Param( sceneId, 0 )
	if fubentype ~= FUBEN_BANGZHAN then
		BeginEvent(sceneId)
			AddText(sceneId,"#{BHXZ_081103_78}")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,activatorId)
		return 0
	end
	
	--喧ng否开始记分
	if LuaFnGetCopySceneData_Param( sceneId, 7 ) == 0 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{BHXZ_081103_79}")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,activatorId)
		return 0
	end
	
	--旗台上 秀 mu痭 d鈔g l阯 旗帜
	local RemainedTime = LuaFnGetCopySceneData_Param( sceneId, x402301_g_FlagRemainedTime )
	if RemainedTime > 0 then
		local minute = floor(RemainedTime / 60)
		local second = mod(RemainedTime, 60)
		
		BeginEvent(sceneId)
			if minute == 0 then
				AddText(sceneId,"#{BHXZ_081103_80}"..second.."#{BHXZ_081103_81}")
			else
				AddText(sceneId,"#{BHXZ_081103_80}"..minute.." ph鷗 "..second.."#{BHXZ_081103_81}")
			end
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,activatorId)
		return 0
	end
	
	--无敌状态无法祭旗...隐身可以祭旗
	if LuaFnIsUnbreakable(sceneId,activatorId) ~= 0 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{BHXZ_081103_124}")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,activatorId)
		return 0
	end
	
	local totalguildid = LuaFnGetCopySceneData_Param( sceneId, 6 )					-- 取 餴琺保存to� 鸬 帮派ID合体
	local Aguildid = floor(totalguildid / 10000)
	local Bguildid = mod(totalguildid, 10000)
	local guildid = GetHumanGuildID(sceneId, activatorId)
	
	if guildid ~= Aguildid and guildid ~= Bguildid then
		BeginEvent(sceneId)
			AddText(sceneId,"Ng呓i kh鬾g c� Bang h礽.")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,activatorId)
		return 0
	end
	
	local OpenFlagSelfId = LuaFnGetCopySceneData_Param( sceneId, x402301_g_OpenFlagSelfIDIndex )
	local OpenFlagStartTime = LuaFnGetCopySceneData_Param( sceneId, x402301_g_OpenFlagStartTime )
	local NowTime = LuaFnGetCurrentTime()
	
	if OpenFlagSelfId ~= 0 then --有人正T読 引导祭旗
		if OpenFlagSelfId == activatorId then --自己
			return 1
		else --不喧ng自己
			if (NowTime - OpenFlagStartTime) <= 180 then --喧ng否超时
				BeginEvent(sceneId)
					AddText(sceneId,GetName(sceneId, OpenFlagSelfId).."#{BHXZ_081103_65}")
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,activatorId)
				return 0
			end
		end
	end
	
	LuaFnSetCopySceneData_Param( sceneId, x402301_g_OpenFlagSelfIDIndex, activatorId )	-- 当前正T読 操作旗台to� 鸬 selfid
	LuaFnSetCopySceneData_Param( sceneId, x402301_g_OpenFlagStartTime, NowTime )	-- 当前正T読 操作旗台to� 鸬 开始时间
	
	return 1

end

--**********************************
--特殊交互:消耗和扣除处理
--**********************************
function x402301_OnActivateDeplete( sceneId, selfId, activatorId )
	return 1
end

--**********************************
--特殊交互:聚气类成功生效处理
--**********************************
function x402301_OnActivateEffectOnce( sceneId, selfId, activatorId )
	--喧ng否喧ng副本
	local sceneType = LuaFnGetSceneType( sceneId )
	if sceneType ~= 1 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{BHXZ_081103_78}")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,activatorId)
		return 1
	end

	--喧ng否喧ng所C to� 鸬 副本
	local fubentype = LuaFnGetCopySceneData_Param( sceneId, 0 )
	if fubentype ~= FUBEN_BANGZHAN then
		BeginEvent(sceneId)
			AddText(sceneId,"#{BHXZ_081103_78}")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,activatorId)
		return 1
	end
	
	local totalguildid = LuaFnGetCopySceneData_Param( sceneId, 6 )					-- 取 餴琺保存to� 鸬 帮派ID合体
	local Aguildid = floor(totalguildid / 10000)
	local Bguildid = mod(totalguildid, 10000)
	local guildid = GetHumanGuildID(sceneId, activatorId)
	
	local membercount = LuaFnGetCopyScene_HumanCount( sceneId )
	local mems = {}
	
	for i = 0, membercount - 1 do
		mems[i] = LuaFnGetCopyScene_HumanObjId( sceneId, i )
	end
	
	--创建大旗NPC,积分
	if guildid == Aguildid then
		local MstId = LuaFnCreateMonster(sceneId, x402301_g_A_FlagID, x402301_g_A_FlagPosX, x402301_g_A_FlagPosZ, 3, 0, -1 )
		SetCharacterName( sceneId, MstId, x402301_g_A_FlagName )
		LuaFnSetCopySceneData_Param( sceneId, x402301_g_FlagRemainedTime, x402301_g_FlagTime )	--旗帜升起以后to� 鸬 剩余时间
		
		local addpoint = GetGuildWarPoint(sceneId, x402301_g_GuildPoint_GetFlag)
		CallScriptFunction( x402301_g_BangzhanScriptId, "AddAGuildPoint", sceneId, activatorId, guildid, addpoint )
		local alreadynum = GetGuildIntNum( sceneId, guildid, x402301_g_A_FlagNumIndex )
		SetGuildIntNum( sceneId, guildid, x402301_g_A_FlagNumIndex, alreadynum+1 )
		--CityChangeAttr( sceneId, activatorId, GUILD_CONTRIB_POINT, 30 ) --增加帮贡
		CallScriptFunction( x402301_g_BangzhanScriptId, "AddHumanGuildArrayInt", sceneId, activatorId, x402301_g_Human_FlagIndex, 1 )
		
		local guid = LuaFnObjId2Guid(sceneId, activatorId)
		local log = format("HumanGuildID=%d,Apply_GuildID=%d,Applied_GuildID=%d", guildid, Aguildid, Bguildid)
		ScriptGlobal_AuditGeneralLog(LUAAUDIT_BANGZHAN_FLAG, guid, log)
		
		local msg = LuaFnGetGuildName(sceneId, activatorId).."#{BHXZ_081103_125}"..GetName(sceneId, activatorId).." 秀 mu痭 d鈔g l阯 "..x402301_g_A_FlagName.."."
		for i=0, membercount-1 do
			if LuaFnIsObjValid( sceneId, mems[i] ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, mems[i] ) == 1 then
				x402301_NotifyFailTips(sceneId, mems[i], msg)
				Msg2Player(sceneId, mems[i], msg, MSG2PLAYER_PARA)
			end
		end
	elseif guildid == Bguildid then
		local MstId = LuaFnCreateMonster(sceneId, x402301_g_B_FlagID, x402301_g_B_FlagPosX, x402301_g_B_FlagPosZ, 3, 0, -1 )
		SetCharacterName( sceneId, MstId, x402301_g_B_FlagName )
		LuaFnSetCopySceneData_Param( sceneId, x402301_g_FlagRemainedTime, x402301_g_FlagTime )	--旗帜升起以后to� 鸬 剩余时间
		
		local addpoint = GetGuildWarPoint(sceneId, x402301_g_GuildPoint_GetFlag)
		CallScriptFunction( x402301_g_BangzhanScriptId, "AddBGuildPoint", sceneId, activatorId, guildid, addpoint )
		local alreadynum = GetGuildIntNum( sceneId, guildid, x402301_g_B_FlagNumIndex )
		SetGuildIntNum( sceneId, guildid, x402301_g_B_FlagNumIndex, alreadynum+1 )
		--CityChangeAttr( sceneId, activatorId, GUILD_CONTRIB_POINT, 30 ) --增加帮贡
		CallScriptFunction( x402301_g_BangzhanScriptId, "AddHumanGuildArrayInt", sceneId, activatorId, x402301_g_Human_FlagIndex, 1 )
		
		local guid = LuaFnObjId2Guid(sceneId, activatorId)
		local log = format("HumanGuildID=%d,Apply_GuildID=%d,Applied_GuildID=%d", guildid, Aguildid, Bguildid)
		ScriptGlobal_AuditGeneralLog(LUAAUDIT_BANGZHAN_FLAG, guid, log)
		
		local msg = LuaFnGetGuildName(sceneId, activatorId).."#{BHXZ_081103_125}"..GetName(sceneId, activatorId).." 秀 mu痭 d鈔g l阯 "..x402301_g_B_FlagName.."."
		for i=0, membercount-1 do
			if LuaFnIsObjValid( sceneId, mems[i] ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, mems[i] ) == 1 then
				x402301_NotifyFailTips(sceneId, mems[i], msg)
				Msg2Player(sceneId, mems[i], msg, MSG2PLAYER_PARA)
			end
		end
	end
	
	LuaFnSetCopySceneData_Param( sceneId, x402301_g_OpenFlagSelfIDIndex, 0 )	-- 当前正T読 操作旗台to� 鸬 selfid
	LuaFnSetCopySceneData_Param( sceneId, x402301_g_OpenFlagStartTime, 0 )	-- 当前正T読 操作旗台to� 鸬 开始时间
	
	return 1
end

--**********************************
--特殊交互:引导类每时间间隔生效处理
--**********************************
function x402301_OnActivateEffectEachTick( sceneId, selfId, activatorId )
	return 1
end

--**********************************
--特殊交互:交互开始时to� 鸬 特殊处理
--**********************************
function x402301_OnActivateActionStart( sceneId, selfId, activatorId )
		return 1
end

--**********************************
--特殊交互:交互撤消时to� 鸬 特殊处理
--**********************************
function x402301_OnActivateCancel( sceneId, selfId, activatorId )
	return 0
end

--**********************************
--特殊交互:交互中断时to� 鸬 特殊处理
--**********************************
function x402301_OnActivateInterrupt( sceneId, selfId, activatorId )
	LuaFnSetCopySceneData_Param( sceneId, x402301_g_OpenFlagSelfIDIndex, 0 )	-- 当前正T読 操作旗台to� 鸬 selfid
	LuaFnSetCopySceneData_Param( sceneId, x402301_g_OpenFlagStartTime, 0 )	-- 当前正T読 操作旗台to� 鸬 开始时间
	
	return 0
end

--**********************************
-- 屏幕中间信息提示
--**********************************
function x402301_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
