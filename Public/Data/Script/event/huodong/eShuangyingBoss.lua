
-- 创建人: 		褚少微
-- 创建时间: 	2008.6.3
-- 功能描述: 	极品装备放出,T読 Th鷆 H� C� Tr每十 ph鷗刷出霜影BOSS

-- scriptID = 808040

-- PrintStr("808040")

-- 脚本ID
x808040_g_ScriptId	= 808040


-- C 刷出to� 鸬 霜影BOSSto� 鸬 数据表....
-- Th鷆 H� C� Tr随机� gi鈟⑿�,每隔10 ph鷗刷出1只,刷新 餴琺共有4c醝 要BOSS死亡才会刷新,活着不刷新
-- 具体坐标为:  餴琺1(31,38), 餴琺2(32,256), 餴琺3(279,119), 餴琺4(31,145)
x808040_g_BossData = {

	-- ID						BOSSto� 鸬  monster id
	-- PosX					坐标
	-- PosY					坐标
	-- BaseAI				BOSSto� 鸬 BaseAI....
	-- ExtAIScript	BOSSto� 鸬 扩展AI....
	-- ScriptID			BOSSto� 鸬 脚本ID....

	{ ID=11392, PosX=31,  PosY=38, BaseAI=0, ExtAIScript=0, ScriptID=0 },
	{ ID=11392, PosX=32,  PosY=256, BaseAI=0, ExtAIScript=0, ScriptID=0 },
	{ ID=11392, PosX=279,  PosY=119, BaseAI=0, ExtAIScript=0, ScriptID=0 },
	{ ID=11392, PosX=31,  PosY=145, BaseAI=0, ExtAIScript=0, ScriptID=0 },
}

-- 场景ID,Th鷆 H� C� Trto� 鸬 场景ID为420
x808040_g_SceneID = 420	
	



--**********************************
--脚本入口函数
--**********************************
function x808040_OnDefaultEvent( sceneId, actId, iNoticeType, param2, param3, param4, param5 )

	--PrintStr("x808040_OnDefaultEvent")
	
	--M� ra 活动.... 间隔十 ph鷗,测试调成20 gi鈟即可. 十 ph鷗: 600*1000
	StartOneActivity( sceneId, actId, 600*1000, iNoticeType )
	
end

--**********************************
--心跳函数
--**********************************
function x808040_OnTimer( sceneId, actId, uTime )

	--PrintStr("x808040_OnTimer")
	
	local currHour = GetHour()
	--PrintStr("x808040_OnTimer::currHour:"..currHour)
	-- 0 餴琺到2� gi鈟⒐�
	if currHour >= 0 and currHour < 2 then
		-- 如果场景中没有霜影BOSS,则刷出m祎 c醝来.
		x808040_CreateABoss()
	end
	-- 10 餴琺到24� gi鈟⒐�
	if currHour >= 10 and currHour < 24 then
		-- 如果场景中没有霜影BOSS,则刷出m祎 c醝来.
		x808040_CreateABoss()
	end


	--检测活动喧ng否过期
	if CheckActiviyValidity( sceneId, actId ) == 0 then
		StopOneActivity( sceneId, actId )
	end

end

function x808040_CreateABoss()

	--遍历场景中所有to� 鸬 怪....更新BOSS重建状态....
	local NeedCreate = 1
	local nMonsterNum = GetMonsterCount(x808040_g_SceneID)
	
	--PrintStr("nMonsterNum:"..nMonsterNum)
	
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(x808040_g_SceneID,i)
		local MosDataID = GetMonsterDataID( x808040_g_SceneID, MonsterId )
		if MosDataID == 11392 then
			-- 褚少微,2008.6.26.当场景内存T読 多c醝怪物时 会刷新出两c醝霜影BOSS(当场景中还有比霜影ID值更大to� 鸬 怪).
			NeedCreate = 0
			break
		else
			NeedCreate = 1
		end
	end

	-- PrintStr("NeedCreate:"..NeedCreate)
	
	-- 场景中没有霜影BOSS,则刷出m祎 c醝.
	if NeedCreate == 1 then 
	
		local BossData = x808040_g_BossData[1]
		
		-- 随机刷怪to� 鸬 位置,共4c醝.
		local rand = random(4)
		--PrintStr("Create Boss Pos:"..rand)

		if rand == 1 then
			BossData			= x808040_g_BossData[1]
		elseif rand == 2 then
			BossData			= x808040_g_BossData[2]
		elseif rand == 3 then
			BossData			= x808040_g_BossData[3]
		else
			BossData			= x808040_g_BossData[4]
		end
		
		-- 刷出霜影BOSS
		LuaFnCreateMonster(x808040_g_SceneID, BossData.ID, BossData.PosX, BossData.PosY, BossData.BaseAI, BossData.ExtAIScript, BossData.ScriptID )
	end
end

-- 统计消灭霜影BOSS...
function x808040_OnPlayerPickUpItemFromShangyingBoss( sceneId, selfId, itemId, bagidx )
	-- PrintStr("OnPlayerPickUpItemFromShangyingBoss")
	if itemId == 20310101 or itemId == 20310102 then
		AuditJipinZhuangbei(sceneId, selfId, itemId)
	end
end

function x808040_IsNeedMonster()

	--遍历场景中所有to� 鸬 怪....更新BOSS重建状态....
	local NeedCreate = 0
	local nMonsterNum = GetMonsterCount(x808040_g_SceneID)
	
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(x808040_g_SceneID,i)
		local MosDataID = GetMonsterDataID( x808040_g_SceneID, MonsterId )
		if MosDataID == 11392 then
			-- 褚少微,2008.6.26.当场景内存T読 多c醝怪物时 会刷新出两c醝霜影BOSS(当场景中还有比霜影ID值更大to� 鸬 怪).
			NeedCreate = 0
			break
		else
			NeedCreate = 1
		end
	end
	--PrintStr("NeedCreate:"..NeedCreate)
	return NeedCreate
	
end

function x808040_TestMonster()
	if x808040_IsNeedMonster() == 0 then
		PrintStr("Have a Monster in the scene")
	else
		PrintStr("There is no Monster in the scene")
	end
end


--x808040_TestMonster()
--x808040_OnDefaultEvent(420, 166, 0, 0, 0, 0, 0)
--x808040_IsHaveMonster()
--x808040_CreateABoss()
