--生长 餴琺
--对应生活技能: 采药	采矿技能to� 鸬 编号8
--枯木春
--脚本号710529
--枯木春1	0.6		2	0.3		3	0.1		莽牯朱蛤出现to� 鸬 概率喧ng0.2		数量1	0.6		2	0.3		3	0.1
--等c1

--每次打开必定 鹫t 疬㧟to� 鸬 产品
x710529_g_MainItemId = 20101030
--可能 餴琺到to� 鸬 产品
x710529_g_SubItemId = 20304016
--C 技能Id
x710529_g_AbilityId = 8
--C 技能等c
x710529_g_AbilityLevel = 12


--生成函数开始************************************************************************
--每c醝ItemBox中最多10c醝物品
function 		x710529_OnCreate(sceneId,growPointType,x,y)
	--放入ItemBox同时放入m祎 c醝物品
	targetId  = ItemBoxEnterScene(x,y,growPointType,sceneId,QUALITY_MUST_BE_CHANGE,1,x710529_g_MainItemId)	--每c醝生长 餴琺最少能 餴琺到m祎 c醝物品,这里直接放入itembox中m祎 c醝
	-- 鹫t 疬㧟1~100to� 鸬 随机数,用来放入主产品和副产品
	--主产品1~60不放,61~90放1c醝,91~100放2c醝
	--副产品1~12放1c醝,13~18放2c醝,19~20放3c醝
	local ItemCount = random(1,100)
	if ItemCount >= 61 and ItemCount <= 90 then
		AddItemToBox(sceneId,targetId,QUALITY_MUST_BE_CHANGE,1,x710529_g_MainItemId)
	elseif ItemCount >= 91 and ItemCount <= 100 then
		AddItemToBox(sceneId,targetId,QUALITY_MUST_BE_CHANGE,2,x710529_g_MainItemId,x710529_g_MainItemId)
	end
	--放入次要产品
	if ItemCount >= 1 and ItemCount <= 12 then
		AddItemToBox(sceneId,targetId,QUALITY_MUST_BE_CHANGE,1,x710529_g_SubItemId)
	elseif ItemCount >= 13 and ItemCount <= 18 then
		AddItemToBox(sceneId,targetId,QUALITY_MUST_BE_CHANGE,2,x710529_g_SubItemId,x710529_g_SubItemId)
	elseif ItemCount >= 19 and ItemCount <= 20 then
		AddItemToBox(sceneId,targetId,QUALITY_MUST_BE_CHANGE,3,x710529_g_SubItemId,x710529_g_SubItemId,x710529_g_SubItemId)
	end
end
--生成函数结束**********************************************************************


--打开前函数开始&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
function	 x710529_OnOpen(sceneId,selfId,targetId)
--Tr� v嘈�
-- 0 表示打开成功
	ABilityID		=	GetItemBoxRequireAbilityID(sceneId,targetId)
	AbilityLevel = QueryHumanAbilityLevel(sceneId,selfId,ABilityID)
	res = x710529_OpenCheck(sceneId,selfId,ABilityID,AbilityLevel)
	return res
	end
--打开前函数结束&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&


--回收函数开始########################################################################
function	 x710529_OnRecycle(sceneId,selfId,targetId)
	-- 增加熟练度
		ABilityID	=	GetItemBoxRequireAbilityID(sceneId,targetId)
	CallScriptFunction(ABILITYLOGIC_ID, "GainExperience", sceneId, selfId, ABilityID, x710529_g_AbilityLevel)
		--Tr� v�1,生长 餴琺回收
		return 1
end
--回收函数结束########################################################################



--打开后函数开始@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
function	x710529_OnProcOver( sceneId, selfId, targetId )
	local ABilityID = GetItemBoxRequireAbilityID( sceneId, targetId )
	CallScriptFunction( ABILITYLOGIC_ID, "EnergyCostCaiJi", sceneId, selfId, ABilityID, x710529_g_AbilityLevel )
	return 0
end
--打开后函数结束@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
function	x710529_OpenCheck(sceneId,selfId,AbilityId,AbilityLevel)
	--检查生活技能等c
	if AbilityLevel<x710529_g_AbilityLevel then
		return OR_NO_LEVEL
	end
	--检查Tinh力
	if GetHumanEnergy(sceneId,selfId)< (floor(x710529_g_AbilityLevel * 1.5 +2) * 2) then
		return OR_NOT_ENOUGH_ENERGY
	end
	return OR_OK
end
