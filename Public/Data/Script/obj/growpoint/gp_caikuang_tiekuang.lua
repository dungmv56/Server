--生长 餴琺
--对应生活技能: 采矿	采矿技能to� 鸬 编号7
--铁矿
--脚本号710002
--铁矿石1	0.6		2	0.3		3	0.1		黄宝石1%
--以20%概率 餴琺到副产品20103014,20103026,20103038,20103050 中to� 鸬 m祎 种,数量1	0.6		2	0.3		3	0.1
--等c1

--每次打开必定 鹫t 疬㧟to� 鸬 产品
x710002_g_MainItemId = 20103002
--可能 餴琺到to� 鸬 产品
x710002_g_SubItemId = 50113001
--副产品
x710002_g_Byproduct = {20103014,20103026,20103038,20103050}
--C 技能Id
x710002_g_AbilityId = 7
--C 技能等c
x710002_g_AbilityLevel = 2


--生成函数开始************************************************************************
--每c醝ItemBox中最多10c醝物品
function 		x710002_OnCreate(sceneId,growPointType,x,y)
	--放入ItemBox同时放入m祎 c醝物品
	targetId  = ItemBoxEnterScene(x,y,growPointType,sceneId,QUALITY_MUST_BE_CHANGE,1,x710002_g_MainItemId)	--每c醝生长 餴琺最少能 餴琺到m祎 c醝物品,这里直接放入itembox中m祎 c醝
	-- 鹫t 疬㧟1~100to� 鸬 随机数,用来放入主产品和副产品以及次要产品(宝石)
	--主产品1~60不放,61~90放1c醝,91~100放2c醝
	--副产品1~12放1c醝,13~18放2c醝,19~20放3c醝
	--次要产品(宝石)1放1c醝
	local ItemCount = random(1,100)
	if ItemCount >= 61 and ItemCount <= 90 then
		AddItemToBox(sceneId,targetId,QUALITY_MUST_BE_CHANGE,1,x710002_g_MainItemId)
	elseif ItemCount >= 91 and ItemCount <= 100 then
		AddItemToBox(sceneId,targetId,QUALITY_MUST_BE_CHANGE,2,x710002_g_MainItemId,x710002_g_MainItemId)
	end
	--放入次要产品
	if ItemCount == 1 then
		AddItemToBox(sceneId,targetId,QUALITY_MUST_BE_CHANGE,1,x710002_g_SubItemId)
	end
	--放入副产品
	if ItemCount >= 51 and ItemCount <= 70 then
		local ByproductId = random(1,4)
		if ItemCount >= 51 and ItemCount <= 62 then
			AddItemToBox(sceneId,targetId,QUALITY_MUST_BE_CHANGE,1,x710002_g_Byproduct[ByproductId])
		elseif ItemCount >= 63 and ItemCount <= 68 then
			AddItemToBox(sceneId,targetId,QUALITY_MUST_BE_CHANGE,2,x710002_g_Byproduct[ByproductId],x710002_g_Byproduct[ByproductId])
		elseif ItemCount >= 69 and ItemCount <= 70 then
			AddItemToBox(sceneId,targetId,QUALITY_MUST_BE_CHANGE,3,x710002_g_Byproduct[ByproductId],x710002_g_Byproduct[ByproductId],x710002_g_Byproduct[ByproductId])
		end
	end
end
--生成函数结束**********************************************************************


--打开前函数开始&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
function	 x710002_OnOpen(sceneId,selfId,targetId)
--Tr� v嘈�
-- 0 表示打开成功
	ABilityID		=	GetItemBoxRequireAbilityID(sceneId,targetId)
	AbilityLevel = QueryHumanAbilityLevel(sceneId,selfId,ABilityID)
	res = x710002_OpenCheck(sceneId,selfId,ABilityID,AbilityLevel)
	return res
end
--打开前函数结束&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&


--回收函数开始########################################################################
function	 x710002_OnRecycle(sceneId,selfId,targetId)
	-- 增加熟练度
	ABilityID	=	GetItemBoxRequireAbilityID(sceneId,targetId)
	CallScriptFunction(ABILITYLOGIC_ID, "GainExperience", sceneId, selfId, ABilityID, x710002_g_AbilityLevel)
	--Tr� v�1,生长 餴琺回收
	return 1
end
--回收函数结束########################################################################



--打开后函数开始@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
function	x710002_OnProcOver( sceneId, selfId, targetId )
	local ABilityID = GetItemBoxRequireAbilityID( sceneId, targetId )
	CallScriptFunction( ABILITYLOGIC_ID, "EnergyCostCaiJi", sceneId, selfId, ABilityID, x710002_g_AbilityLevel )
	return 0
end
--打开后函数结束@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
function	x710002_OpenCheck(sceneId,selfId,AbilityId,AbilityLevel)
	--检查生活技能等c
	if AbilityLevel<x710002_g_AbilityLevel then
		return OR_NO_LEVEL
	end
	--检查Tinh力
	if GetHumanEnergy(sceneId,selfId)< (floor(x710002_g_AbilityLevel * 1.5 +2) * 2) then
		return OR_NOT_ENOUGH_ENERGY
	end
	return OR_OK
end
