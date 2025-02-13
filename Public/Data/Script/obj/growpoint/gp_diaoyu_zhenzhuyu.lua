--生长 餴琺
--对应生活技能: 钓鱼	钓鱼技能to� 鸬 编号9
--珍珠鱼
--脚本号712023
--珍珠鱼100%
--等c1

--每次打开必定 鹫t 疬㧟to� 鸬 产品
x712023_g_MainItemId = 20102023
--可能 餴琺到to� 鸬 产品
--g_SubItemId = 20304005
--C 技能Id
x712023_g_AbilityId = 9
--C 技能等c
x712023_g_AbilityLevel = 11


function 	x712023_OnCreate(sceneId,growPointType,x,y)
	ItemCount = 0-- 物品数量
	ItemBoxId = ItemBoxEnterScene(x,y,growPointType,sceneId,QUALITY_MUST_BE_CHANGE,ItemCount)	--函数调用
end

function	 x712023_OnOpen(sceneId,selfId,targetId)
	--检查钓鱼技能等c
	AbilityId		=	GetItemBoxRequireAbilityID(sceneId,targetId)
	AbilityLevel = QueryHumanAbilityLevel(sceneId,selfId,AbilityId)
	if AbilityLevel<x712023_g_AbilityLevel then
		return OR_NO_LEVEL
	end

	-- 鹫t 疬㧟随机数,设置m祎 次钓到鱼to� 鸬 时间
	x712023_g_FishTime = random(80000)+20000	-- 鹫t 疬㧟m祎 c醝20-100 gi鈟之间to� 鸬 随机数
	--x712023_g_FishTime = random(8000)+2000	-- 鹫t 疬㧟m祎 c醝2-10 gi鈟之间to� 鸬 随机数
	SetAbilityOperaTime(sceneId,selfId,x712023_g_FishTime)	--设置m祎 次钓到鱼to� 鸬 时间
	--SetAbilityOperaRobotTime(sceneId, selfId,g_totaltime)	--把累计时间付给...
	
	return OR_OK

end

function	x712023_OnProcOver(sceneId,selfId,targetId)
   
	ret_1 = TryRecieveItem(sceneId,selfId,x712023_g_MainItemId,QUALITY_MUST_BE_CHANGE)
	if ret_1 > 0 then					-->0表示物品成功放入背包中
		Msg2Player(sceneId,selfId,"你钓到m祎 条珍珠鱼.",MSG2PLAYER_PARA)
		-- 增加熟练度
		ABilityID	=	GetItemBoxRequireAbilityID(sceneId,targetId)
		CallScriptFunction(ABILITYLOGIC_ID, "GainExperience", sceneId, selfId, ABilityID, x712023_g_AbilityLevel)
	elseif ret_1 == -1 then
		Msg2Player(sceneId,selfId,"背包已满",MSG2PLAYER_PARA)
	end
	return 0
end
