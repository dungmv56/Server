-- 缝纫配方脚本 用于使用技能制造物品
-- *******
-- 缝纫 11 c
-- 该脚本有以下三c醝必备功能函数: 
-- x700948_AbilityCheck ——技能使用检查函数
-- x700948_AbilityConsume ——合成结束,进行相关消耗
-- x700948_AbilityProduce ——合成成功,产出产品

--------------------------------------------------------------------------------
-- 以下部分C 改写
--------------------------------------------------------------------------------
--脚本中文名
--2c帽配方 制造物品

-- 脚本号
x700948_g_ScriptId = 700948

-- 生活技能号
x700948_g_AbilityID = ABILITY_FENGREN

-- 该项生活技能to� 鸬 最大c别
x700948_g_AbilityMaxLevel = 12

-- 配方号
x700948_g_RecipeID = 122

-- 配方等c(需求技能to� 鸬 等c)
x700948_g_RecipeLevel = 11

-- 材料表
x700948_g_CaiLiao = {
	{ID = 20105011, Count = 21},
	{ID = 20107015, Count = 23},
	{ID = 20108107, Count = 34},
	{ID = 20308079, Count = 1},
}

-- 产品表
x700948_g_ChanPin = {
	{ID = 10213041, Odds = 2500},
	{ID = 10213042, Odds = 5000},
	{ID = 10213043, Odds = 7500},
	{ID = 10213044, Odds = 10000},
}
--------------------------------------------------------------------------------
-- 以上部分C 改写
--------------------------------------------------------------------------------

----------------------------------------------------------------------------------------
--	技能使用检查函数
----------------------------------------------------------------------------------------
function x700948_AbilityCheck(sceneId, selfId)

	-- 检测背包喧ng不喧ng有空格,没有空格就不能进行
	if LuaFnGetPropertyBagSpace(sceneId, selfId) < 1 then
		return OR_BAG_OUT_OF_SPACE
	end

	-- 检查其他消耗
	VigorValue = x700948_g_RecipeLevel * 2 + 1
	if GetHumanVigor(sceneId, selfId) < VigorValue then
		return OR_NOT_ENOUGH_VIGOR
	end

	-- 检查喧ng否材料足够

	for idx, Mat in x700948_g_CaiLiao do
		nCount = Mat.Count

		ret = LuaFnGetAvailableItemCount(sceneId, selfId, Mat.ID)
		if ret < nCount then
			return OR_STUFF_LACK
		end
	end

	return OR_OK
end

----------------------------------------------------------------------------------------
--	合成结束,进行相关消耗
----------------------------------------------------------------------------------------
function x700948_AbilityConsume(sceneId, selfId)
	-- 首先进行其他消耗
	VigorCost = x700948_g_RecipeLevel * 2 + 1
	VigorValue = GetHumanVigor(sceneId, selfId) - VigorCost
	SetHumanVigor(sceneId, selfId, VigorValue)

	-- 然后进行材料消耗

	for idx, Mat in x700948_g_CaiLiao do
		nCount = Mat.Count

		ret = LuaFnDelAvailableItem(sceneId, selfId, Mat.ID, nCount)
		if ret ~= 1 then
			return 0
		end
	end

	return 1
end

----------------------------------------------------------------------------------------
--	合成成功,产出产品
----------------------------------------------------------------------------------------
function x700948_AbilityProduce(sceneId, selfId)
	AbilityLevel = QueryHumanAbilityLevel(sceneId, selfId, x700948_g_AbilityID)

	-- 随机出m祎 c醝数 [1, 10000]
	rand = random(10000)

	for i, item in x700948_g_ChanPin do
		if item.Odds >= rand then
			Quality = CallScriptFunction( ABILITYLOGIC_ID, "CalcQuality", sceneId, x700948_g_RecipeLevel, AbilityLevel, x700948_g_AbilityMaxLevel,item.ID )

			local pos = LuaFnTryRecieveItem(sceneId, selfId, item.ID, QUALITY_MUST_BE_CHANGE)
			if pos ~= -1 then
				LuaFnSetItemCreator( sceneId, selfId, pos, LuaFnGetName( sceneId, selfId ) )
			else
				return OR_ERROR
			end

			LuaFnAuditAbility( sceneId, selfId, x700948_g_AbilityID, x700948_g_RecipeID, Quality )
			LuaFnSendAbilitySuccessMsg( sceneId, selfId, x700948_g_AbilityID, x700948_g_RecipeID, item.ID )
			return OR_OK
		end
		LuaFnAuditAbility( sceneId, selfId, x700948_g_AbilityID, x700948_g_RecipeID, 0 )
	end

	return OR_ERROR
end
