--任务链副本

--MisDescBegin
--脚本号
x229023_g_scriptId = 229023

x229023_g_MissionId = 1202
--以上喧ng动态**************************************************************
--MisDescEnd

--角色Mission变量� 餴琺�
x229023_g_Param_huan		=0	--0号: 已经完成to� 鸬 环数,T読 接收任务时候赋值
x229023_g_Param_ok			=1	--1号: 当前任务喧ng否完成(0未完成；1完成)
x229023_g_Param_sceneid		=2	--2号: 当前副本任务to� 鸬 场景号
x229023_g_Param_guid		=3	--3号: 接副本任务时候to� 鸬 玩家GUID
x229023_g_Param_killcount	=4	--4号: 杀死任务怪to� 鸬 数量
x229023_g_Param_time		=5	--5号: 完成副本所用时间(单位:  gi鈟)
--6号: 未用
--7号: 未用

x229023_g_CopySceneType=FUBEN_RENWULIAN	--副本类型,定义T読 ScriptGlobal.lua里面
x229023_g_LimitMembers=3			--可以进副本to� 鸬 最小队伍人数
x229023_g_TickTime=5				--回调脚本to� 鸬 时钟时间(单位:  gi鈟/次)
x229023_g_LimitTotalHoldTime=36000	--副本可以存活to� 鸬 时间(单位: 次数),如果此时间到了,则任务将会th b読
x229023_g_LimitTimeSuccess=50000		--副本时间限制(单位: 次数),如果此时间到了,任务完成
x229023_g_CloseTick=210				--副本关闭前倒计时(单位: 次数)
x229023_g_NoUserTime=300			--副本中没有人后可以继续保存to� 鸬 时间(单位:  gi鈟)
x229023_g_DeadTrans=0				--死亡转移模式,0: 死亡后还可以继续T読 副本,1: 死亡后被强制移出副本
x229023_g_Fuben_X=23				--进入副本to� 鸬 位置X
x229023_g_Fuben_Z=23				--进入副本to� 鸬 位置Z
x229023_g_Back_X=160				--源场景位置X
x229023_g_Back_Z=150				--源场景位置Z
x229023_g_TotalNeedKill=1000			--C 杀死怪物数量
x229023_g_MissionIdPre=701			--C 提前拥有to� 鸬 任务
x229023_g_CopySceneTotalTime=6000


x229023_g_TitleOfMonster = {"Gia 餴nh","Ti瑄 th� v�","Ti瑄 l鈛 la","Ti瑄 nh�","Bang hung","T鵼 t鵱g","挟 t�","Ti瑄 h� v�","M鬾 nh鈔","Gia t呔ng"}
x229023_g_TitleOfBoss = {"姓i ch� qu鋘","Th� v� b鋙 v�","姓i h� ph醦","T眓g qu鋘","B鋙 ti陁 c m祎","姓i 甬 t�","T� h� ph醦","H鎢 h� ph醦","S� gia d誽 v�","Gi醥 馥u 疬㧟 tr鱪g d鴑g"}

x229023_g_NameOfMonster = {
				{part1="Tr呓ng", part2="Ti瑄 nh�"},
				{part1="Tri畊", part2="Ti瑄 tam"},
				{part1="Tr", part2="Ti瑄 t�"},
				{part1="V呓ng", part2="Ti瑄 ng�"},
				{part1="L�", part2="Ti瑄 th"},
				{part1="T鬾", part2="X� nhi"},
				{part1="Ch鈛", part2="衖nh nhi"},
				{part1="Ng�", part2="則 Nhi"},
				{part1="Ph鵱g", part2="Gi醦 Nhi"},
				{part1="D呓ng", part2="Tam nhi"},
}

x229023_g_NameOfBoss = {
				{part1="聈 D呓ng", part2="Xu鈔", part3="Khi猽"},
				{part1="衞an m礳", part2="Ch鈔", part3="B�"},
				{part1="T� M�", part2="T", part3="H�"},
				{part1="L鴆 Phi", part2="Th鄋h", part3="M�"},
				{part1="恤ng qu醕h", part2="L鈓", part3="Li畉"},
				{part1="Nam D�", part2="Gi�", part3="M鉵h"},
				{part1="V� v錸", part2="Kim", part3="Ki猰"},
				{part1="M� Dung", part2="Thanh", part3="H課"},
				{part1="H� H", part2="B錸g", part3="D鹡g"},
				{part1="Ho鄋g Ph�", part2="Minh", part3="Qu鋘g"},
}

x229023_g_MonsterPosList = {
				BossPos = {id=1880, x=28, z=30},
				MonsterPos = {
											{id=1890, x=29, z=24},
											{id=1890, x=36, z=28},
											{id=1890, x=34, z=36},
											{id=1890, x=25, z=36},
											{id=1890, x=22, z=27},
										 }
}

--///////////////////////////////////////////////////////
--喧ng否要求杀to� 鸬 怪
--///////////////////////////////////////////////////////
function x229023_IsMonsterOfDemanded(sceneId, humanObjId, dataId)
	--PrintStr("IsMonsterOfDemanded...")
	if IsHaveMission(sceneId, humanObjId, x229023_g_MissionId) > 0 then
		local fubenNpcId = LuaFnGetCopySceneData_Param(sceneId, 14)
		local misIndex = GetMissionIndexByID(sceneId,humanObjId,x229023_g_MissionId)
		local demandNpcId = GetMissionParam(sceneId, humanObjId, misIndex, 5)
		if fubenNpcId == demandNpcId then
	local monsterLevel = LuaFnGetCopySceneData_Param(sceneId, 9)
	if dataId == x229023_g_MonsterPosList.BossPos.id + floor(monsterLevel/10) then
		return 1
	end
	
	local monsterCount = getn(x229023_g_MonsterPosList.MonsterPos)
	for i=1, monsterCount do
		if x229023_g_MonsterPosList.MonsterPos[i].id + floor(monsterLevel/10) == dataId then
			return 1
		end	
	end
		end --endif
	end --endif
	return 0
end

function x229023_CreateTitleAndName_Monster()			
	
	--设置monsterto� 鸬 称号
	local ct = getn(x229023_g_TitleOfMonster)
	local ret = random(ct)
	local strTitle = x229023_g_TitleOfMonster[ret]
	--设置monsterto� 鸬 name
	ct = getn(x229023_g_NameOfMonster)
	ret = random(ct)
	local part1 = x229023_g_NameOfMonster[ret].part1
	ret = random(ct)
	local part2 = x229023_g_NameOfMonster[ret].part2
	ret = random(ct)
	local strName = format("%s%s", part1, part2)
	
	return strTitle, strName

end

function x229023_CreateTitleAndName_Boss(sceneId)
	local npcId = LuaFnGetCopySceneData_Param(sceneId, 14)
	local _, npcName = GetNpcInfoByNpcId(sceneId,npcId)
	--设置monsterto� 鸬 称号
	local ct = getn(x229023_g_TitleOfBoss)
	local ret = random(ct)
	local strTitle = x229023_g_TitleOfBoss[ret]
	strTitle = npcName .. " 许ch " .. strTitle
	--设置monsterto� 鸬 name
	ct = getn(x229023_g_NameOfBoss)
	ret = random(ct)
	local part1 = x229023_g_NameOfBoss[ret].part1
	ret = random(ct)
	local part2 = x229023_g_NameOfBoss[ret].part2
	ret = random(ct)
	local part3 = x229023_g_NameOfBoss[ret].part3
	local strName = format("%s%s%s", part1, part2, part3)
	
	return strTitle, strName

end


--**********************************
--创建副本
--**********************************
function x229023_MakeCopyScene( sceneId, selfId, nearmembercount )
	--PrintStr("MakeCopyScene .. ")
	--local mems = {}
	local mylevel = GetLevel(sceneId, selfId)
	--local i

	--for	i=0, nearmembercount-1 do
	--	mems[i] = GetNearTeamMember( sceneId, selfId, i )
	--	mylevel = mylevel + GetLevel( sceneId, mems[i] )
	--end

	--mylevel = mylevel/nearmembercount
	local round = GetMissionData(sceneId,selfId,MD_RENWULIAN_HUAN)

	local leaderguid = LuaFnObjId2Guid( sceneId, selfId )
	LuaFnSetSceneLoad_Map( sceneId, "shiji.nav" )						--地图喧ng必须选取to� 鸬 ,而且必须T読 Config/SceneInfo.ini里配置好
	LuaFnSetCopySceneData_TeamLeader( sceneId, leaderguid )
	LuaFnSetCopySceneData_NoUserCloseTime( sceneId, x229023_g_NoUserTime * 1000 )
	LuaFnSetCopySceneData_Timer( sceneId, x229023_g_TickTime * 1000 )
	LuaFnSetCopySceneData_Param( sceneId, 0, x229023_g_CopySceneType )				--设置副本数据,这里将0号索引to� 鸬 数据设置为999,用于表示副本号999(数字自定义)
	LuaFnSetCopySceneData_Param( sceneId, 1, x229023_g_scriptId )					--将1号数据设置为副本场景事件脚本号
	LuaFnSetCopySceneData_Param( sceneId, 2, 0 )							--设置定时器调用次数
	LuaFnSetCopySceneData_Param( sceneId, 3, -1 )							--设置副本入口场景号, 初始化
	LuaFnSetCopySceneData_Param( sceneId, 4, 0 )							--设置副本关闭标志, 0开放,1关闭
	LuaFnSetCopySceneData_Param( sceneId, 5, 0 )							--设置离开倒计时次数
	LuaFnSetCopySceneData_Param( sceneId, 6, GetTeamId( sceneId, selfId ) )	--保存队伍号
	LuaFnSetCopySceneData_Param( sceneId, 7, 0 )							--reserve0
	LuaFnSetCopySceneData_Param( sceneId, 8, nearmembercount)	--要创建to� 鸬 monster数量
	LuaFnSetCopySceneData_Param( sceneId, 9, mylevel )				--怪物应该设置to� 鸬 等c
	LuaFnSetCopySceneData_Param( sceneId, 10, round )				--怪物应该设置to� 鸬 等c

	if IsHaveMission(sceneId,selfId,1202) > 0 then
		local misIndex = GetMissionIndexByID(sceneId,selfId,1202)
		local missionType = GetMissionParam(sceneId, selfId, misIndex, 1)
		if missionType == 3 then
			local npcId = GetMissionParam(sceneId, selfId, misIndex, 5)
			local _, npcName, _, x, z, _, sId, _ = GetNpcInfoByNpcId(sceneId,npcId)
			
			LuaFnSetCopySceneData_Param( sceneId, 11, sId )	
			LuaFnSetCopySceneData_Param( sceneId, 12, x )	
			LuaFnSetCopySceneData_Param( sceneId, 13, z )	
			LuaFnSetCopySceneData_Param( sceneId, 14, npcId )	
		end
	end

	LuaFnSetSceneLoad_Monster( sceneId, "shiji_monster.ini" )

	local bRetSceneID = LuaFnCreateCopyScene( sceneId )						--初始化完成后调用创建副本函数
	BeginEvent(sceneId)
	if bRetSceneID > 0 then
			AddText( sceneId, "D竎h chuy琻 th鄋h c鬾g!" )
	else
			AddText( sceneId, "S� l唼ng b鋘 sao 疸 皙n gi緄 h課, 皤 ngh� l醫 n鎍 th� l読!" )
	end
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	
end

--**********************************
--杀死怪物或玩家
--**********************************
function x229023_OnKillObject( sceneId, selfId, objdataId ,objId )
end

--**********************************
--副本事件
--**********************************
function x229023_OnCopySceneReady( sceneId, destsceneId )
	LuaFnSetCopySceneData_Param( destsceneId, 3, sceneId )							--设置副本入口场景号
	local leaderguid = LuaFnGetCopySceneData_TeamLeader( destsceneId )
	local leaderObjId = LuaFnGuid2ObjId( sceneId, leaderguid )

	--取 餴琺玩家附近to� 鸬 队友数量(包括自己)
	local misIndex
	local nearteammembercount = GetNearTeamCount( sceneId, leaderObjId )
	if nearteammembercount > 0 then
	local member
	for	i=0, nearteammembercount-1 do
		member = GetNearTeamMember( sceneId, leaderObjId, i )
		misIndex = GetMissionIndexByID( sceneId, member, x229023_g_MissionId )

		NewWorld( sceneId, member, destsceneId, x229023_g_Fuben_X, x229023_g_Fuben_Z )
	end
	else
			NewWorld( sceneId, leaderObjId, destsceneId, x229023_g_Fuben_X, x229023_g_Fuben_Z )
	end
end

--**********************************
--有玩家进入副本事件
--**********************************
function x229023_OnPlayerEnter( sceneId, selfId )
	--设� gi鈟劳龊蟾椿� 餴琺位置
	SetPlayerDefaultReliveInfo( sceneId, selfId, "%10", -1, "0", 2, x229023_g_Fuben_X, x229023_g_Fuben_Z );
end

--**********************************
--有玩家T読 副本中死亡事件
--**********************************
function x229023_OnHumanDie( sceneId, selfId, killerId )
	if x229023_g_DeadTrans==1 then --死亡后C 被强制踢出场景
		local oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3) ;--取 餴琺副本入口场景号
		local sId = LuaFnGetCopySceneData_Param(sceneId, 11)
		local x = LuaFnGetCopySceneData_Param(sceneId, 12)
		local z = LuaFnGetCopySceneData_Param(sceneId, 13)
		
		NewWorld( sceneId, selfId, sId, x, z )
	end
end

--**********************************
--副本场景定时器事件
--**********************************
function x229023_OnCopySceneTimer( sceneId, nowTime )
	local leaderguid  = LuaFnGetCopySceneData_TeamLeader(sceneId) ;	
	local leaderObjId = LuaFnGuid2ObjId(sceneId,leaderguid);
	if leaderObjId == -1 then
		return
	end
	--副本时钟读取及设置
	local TickCount = LuaFnGetCopySceneData_Param(sceneId, 2) ;--取 餴琺已经执行to� 鸬 定时次数
	
	--////////////////////////////////////////////////////////////////////
	if TickCount == 0 then
		x229023_CreateMonster(sceneId) --如果喧ng第m祎 c醝时钟则创建相应to� 鸬 monster
	end
	--////////////////////////////////////////////////////////////////////
	TickCount = TickCount+1 ;
	LuaFnSetCopySceneData_Param(sceneId, 2, TickCount);--设置新to� 鸬 定时器调用次数
		
	--副本关闭标志
	local leaveFlag = LuaFnGetCopySceneData_Param(sceneId, 4) ;
	
	--离开倒计时间to� 鸬 读取和设置
	local leaveTickCount = LuaFnGetCopySceneData_Param(sceneId, 5) ;
	local leaveTickCount = leaveTickCount+1 ;
	LuaFnSetCopySceneData_Param(sceneId, 5, leaveTickCount) ;
	
	--===============================================================
	--检测任务喧ng否完成
	local misIndex = GetMissionIndexByID(sceneId,leaderObjId,1202)
	local missionType = GetMissionParam(sceneId, leaderObjId, misIndex, 1)
	if (missionType == 3 or missionType == 4) then
		if GetMissionParam(sceneId, leaderObjId, misIndex, 0) == 1 then
			--副本Cu礳 chi猲 胜利,分配Kinh nghi甿
			local exp = CallScriptFunction(229022, "GetExpBonus", sceneId, leaderObjId)
			--PrintStr("exp=" .. exp)
			local humancount = LuaFnGetCopyScene_HumanCount( sceneId )
			humancount = humancount-1
			--PrintStr("nearhumancount=" .. nearhumancount)
			local sId = LuaFnGetCopySceneData_Param(sceneId, 11)
			local x = LuaFnGetCopySceneData_Param(sceneId, 12)
			local z = LuaFnGetCopySceneData_Param(sceneId, 13)
			if humancount > 0 then
				exp = exp / humancount
				local member
				for	i=0, humancount-1 do
					member = LuaFnGetCopyScene_HumanObjId( sceneId, i )
					if member ~= leaderObjId then
						AddExp(sceneId, member, exp)
						Msg2Player(  sceneId, member, "C醕 h� tr譶g ph誸 醕 nh鈔 t誳 ph呔c cho giang h�, nh 疬㧟" .. exp .. "Ph th叻ng kinh nghi甿", MSG2PLAYER_PARA )
						--将队友传出副本
						NewWorld( sceneId, member, sId, x, z )
					end
				end
			end
			--将自己传出副本
			NewWorld(sceneId, leaderObjId, sId, x, z)
			return
		end	
	end
	--===============================================================
		
	if leaveTickCount == x229023_g_CloseTick then --倒计时间到,大家都出去吧
	
		local oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3) ;--取 餴琺副本入口场景号
		
		--将当前副本场景里to� 鸬 所有人传送回原来进入时候to� 鸬 场景
		local membercount = LuaFnGetCopyScene_HumanCount(sceneId)
		local mems = {}
		for	i=0,membercount-1 do
			mems[i] = LuaFnGetCopyScene_HumanObjId(sceneId,i)
			local sId = LuaFnGetCopySceneData_Param(sceneId, 11)
			local x = LuaFnGetCopySceneData_Param(sceneId, 12)
			local z = LuaFnGetCopySceneData_Param(sceneId, 13)
			--print( sceneId, mems[i], sId, x, z )
			NewWorld( sceneId, mems[i], sId, x, z )
		end
		
	elseif leaveTickCount>x229023_g_CloseTick-4 then
	
		local oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3) ;--取 餴琺副本入口场景号

		--通知当前副本场景里to� 鸬 所有人,场景关闭倒计时间
		local membercount = LuaFnGetCopyScene_HumanCount(sceneId)
		local mems = {}
		for	i=0,membercount-1 do
			mems[i] = LuaFnGetCopyScene_HumanObjId(sceneId,i)
  			BeginEvent(sceneId)
  				local strText = format("C醕 h� s� r秈 kh鰅 疴y sau %d gi鈟!", (x229023_g_CloseTick-leaveTickCount)*x229023_g_TickTime )
  				AddText(sceneId,strText);
  			EndEvent(sceneId)
  			DispatchMissionTips(sceneId,mems[i])
		end
	elseif TickCount == x229023_g_CopySceneTotalTime then
		--设置副本关闭标志
		LuaFnSetCopySceneData_Param(sceneId, 4, 1) ;

	end

end

function x229023_RefixSomeAttr(sceneId, monsterId, refixRate)
	--怪物to� 鸬 伤害, maxhp, 必杀率修正
	LuaFnSetLifeTimeAttrRefix_MaxHP(sceneId, monsterId, 
			LuaFnGetMaxBaseHp(sceneId, monsterId) * refixRate)
			
	LuaFnSetLifeTimeAttrRefix_CriticalAttack(sceneId, monsterId,
			LuaFnGetBaseCriticalAttack(sceneId, monsterId) * refixRate)

	LuaFnSetLifeTimeAttrRefix_CriticalDefence(sceneId, monsterId,
			LuaFnGetBaseCriticalDefence(sceneId, monsterId) * refixRate)
			
	LuaFnSetLifeTimeAttrRefix_AttackPhysics(sceneId, monsterId, 
			LuaFnGetBaseAttackPhysics(sceneId, monsterId) * refixRate)
	
end

function x229023_CreateMonster(sceneId)
	
	local aifile
	local MonsterId
	local monsterDataId
	
	local demandMonsterCount = LuaFnGetCopySceneData_Param(sceneId, 8)
	local monsterLevel = LuaFnGetCopySceneData_Param(sceneId, 9)
	--根据玩家数量生成相应数量to� 鸬 怪物
	local monsterCount = getn(x229023_g_MonsterPosList.MonsterPos)
	for i=1, demandMonsterCount-1 do
		if i > monsterCount then
			break
		end	
		aifile = random(10)
		monsterDataId= x229023_g_MonsterPosList.MonsterPos[i].id + monsterLevel / 10
		MonsterId = LuaFnCreateMonster(sceneId, monsterDataId, x229023_g_MonsterPosList.MonsterPos[i].x, 
									x229023_g_MonsterPosList.MonsterPos[i].z, 0, aifile, -1)
		SetLevel(sceneId, MonsterId, monsterLevel+3)
	
		SetCharacterDieTime(sceneId, MonsterId, 30*60000)
		--设置怪物to� 鸬 T阯,称号
		local strTitle, strName = x229023_CreateTitleAndName_Monster()
		SetCharacterTitle(sceneId, MonsterId, strTitle)
		SetCharacterName(sceneId, MonsterId, strName)			
				
		local currRound = LuaFnGetCopySceneData_Param(sceneId, 10) ;--取 餴琺任务链to� 鸬 当前环数		
		--1~10环,怪物伤害、怪物必杀率,怪物HP为原值.
		if currRound >= 1 and currRound <= 10 then  
		--11环~20环,三项值*1.1
		elseif currRound >= 1 and currRound <= 10 then
			x229023_RefixSomeAttr(sceneId, MonsterId, 0.4)
		--21环~30环,三项值*1.2
		elseif currRound >= 1 and currRound <= 10 then
			x229023_RefixSomeAttr(sceneId, MonsterId, 0.6)
		--31环~40环,三项值*1.3
		elseif currRound >= 1 and currRound <= 10 then
			x229023_RefixSomeAttr(sceneId, MonsterId, 0.8)
		--41环~50环,三项值*1.4
		elseif currRound >= 1 and currRound <= 10 then
			x229023_RefixSomeAttr(sceneId, MonsterId, 1)
		--51环~60环,三项值*1.5
		elseif currRound >= 1 and currRound <= 10 then
			x229023_RefixSomeAttr(sceneId, MonsterId, 1.2)
		--61环~70环,三项值*1.6
		elseif currRound >= 1 and currRound <= 10 then
			x229023_RefixSomeAttr(sceneId, MonsterId, 1.4)
		--71环~80环,三项值*1.7
		elseif currRound >= 1 and currRound <= 10 then
			x229023_RefixSomeAttr(sceneId, MonsterId, 1.6)
		end
		
	end
		
	aifile = random(10)
	monsterDataId= x229023_g_MonsterPosList.BossPos.id + monsterLevel / 10
	MonsterId = LuaFnCreateMonster(sceneId, monsterDataId, x229023_g_MonsterPosList.BossPos.x, 
								x229023_g_MonsterPosList.BossPos.z, 0, aifile, -1)
	SetLevel(sceneId, MonsterId, monsterLevel+5)
							
	SetCharacterDieTime(sceneId, MonsterId, 30*60000)
	--设置怪物to� 鸬 T阯,称号
	local strTitle, strName = x229023_CreateTitleAndName_Boss(sceneId)
	SetCharacterTitle(sceneId, MonsterId, strTitle)
	SetCharacterName(sceneId, MonsterId, strName)			
	--随机怪物to� 鸬 冰,火,电,毒属性,并设置其数值
	local attr = random(4)
	if attr == 1 then --冰
		LuaFnSetLifeTimeAttrRefix_ResistCold(sceneId, MonsterId, 
				LuaFnGetLifeTimeAttrRefix_ResistCold(sceneId, MonsterId)*0.5 )
	elseif attr == 2 then --火
		LuaFnSetLifeTimeAttrRefix_AttackFire(sceneId, MonsterId, 
				LuaFnGetLifeTimeAttrRefix_ResistFire(sceneId, MonsterId)*0.5 )
	elseif attr == 3 then --电
		LuaFnSetLifeTimeAttrRefix_ResistLight(sceneId, MonsterId, 
				LuaFnGetLifeTimeAttrRefix_ResistLight(sceneId, MonsterId)*0.5 )
	else --毒
		LuaFnSetLifeTimeAttrRefix_ResistPoison(sceneId, MonsterId, 
				LuaFnGetLifeTimeAttrRefix_ResistPoison(sceneId, MonsterId)*0.5 )
	end
		
end
