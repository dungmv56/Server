-- 单人副本

-- 国防任务 刺杀贪官
--MisDescBegin
-- 脚本号
x600034_g_ScriptId = 600034

--任务号
x600034_g_MissionId = 1109

--M鴆 ti陁 nhi甿 v鴑pc
x600034_g_Name = "V� 姓i Uy"

--任务归类
x600034_g_MissionKind = 50

--衅ng c nhi甿 v� 
x600034_g_MissionLevel = 10000

--喧ng否喧ngTinh英任务
x600034_g_IfMissionElite = 0

--下面几项喧ng动态显示to� 鸬 内容,用于T読 任务列表中动态显示任务情况**********************
x600034_g_IsMissionOkFail = 0							-- Nhi甿 v� ho鄋 th鄋h标记

--以上喧ng动态**************************************************************

--任务变量第m祎 位用来存储随机 餴琺到to� 鸬 脚本号
--任务文本描述
x600034_g_MissionName = "羗 s醫 tham quan"
x600034_g_MissionInfo = ""													--任务描述
x600034_g_MissionTarget = "    Quan tham %s%s hi畁 t醕 %s, l鉶 醦 b裞 b醕h t韓h, ti猲g o醤 h th鋗 thi猼, ta 疸 an b鄆 %n hi瑄 r� 疬㧟 t靚h b醥, nhi甿 v� h鄋h x� l鉶 giao cho ng呓i 黏y. "	--M鴆 ti陁 nhi甿 v�
x600034_g_ContinueInfo = "    Nhi甿 v� c黙 c醕 h� v鏽 ch遖 ho鄋 th鄋h �?"						--未Ho鄋 t nhi甿 v鴗o� 鸬 npc对话
x600034_g_MissionComplete = "    L鄊 t痶 l, r t痶 r t痶. "						--Ho鄋 t nhi甿 v鴑pc说话to� 鸬 话
x600034_g_MissionRound = 79

-- 通用Th鄋h ph� 任务脚本
x600034_g_CityMissionScript = 600001
x600034_g_MilitaryScript = 600030

x600034_g_StrForePart=4

x600034_g_StrList = {[0]="L�",
										 [1]="Tri畊",
										 [2]="Ch鈛",
										 [3]="H鄋",
										 [4]="校ng",
										 [5]="Li阭",
										 [6]="Khi猼",
										 [7]="Ch韓h",
										 [8]="C",
										 [9]="V錸",
										 [10]="Th� lang",
										 [11]="Trung th� th� lang",
										 [12]="Khu m vi畁 s�",
										 [13]="Khu m vi畁 ph� s�",
										 [14]="Ng� s� trung th譨",
								  	 [15]="Ng� s� 鹫i phu",
								  	 [16]="H駏 gi醤 ngh� 鹫i phu",
								  	 [17]="T� gi醤 ngh� 鹫i phu",
								  	 [18]="Trung th� s� nh鈔",
										 }

--MisDescEnd

x600034_g_Pos = {{x=10,z=11},{x=31,z=13},{x=52,z=11},
								 {x=31,z=27},{x=14,z=34},{x=48,z=34},
								 {x=31,z=40},{x=14,z=49},{x=31,z=45},
								 {x=50,z=49}}

--副本名称
x600034_g_CopySceneName = "Nha M鬾"
x600034_g_CopySceneType = FUBEN_GUOFANG	--副本类型,定义T読 ScriptGlobal.lua里面
x600034_g_CopySceneMap = "yamen.nav"
x600034_g_LimitMembers = 1					--可以进副本to� 鸬 最小队伍人数
x600034_g_TickTime = 5							--回调脚本to� 鸬 时钟时间(单位:  gi鈟/次)
x600034_g_LimitTotalHoldTime = 480	--副本可以存活to� 鸬 时间(单位: 次数),如果此时间到了,则任务将会th b読
x600034_g_LimitTimeSuccess = 500		--副本时间限制(单位: 次数),如果此时间到了,Nhi甿 v� ho鄋 th鄋h
x600034_g_CloseTick = 3							--副本关闭前倒计时(单位: 次数)
x600034_g_NoUserTime = 10						--副本中没有人后可以继续保存to� 鸬 时间(单位:  gi鈟)
x600034_g_DeadTrans = 0							--死亡转移模式,0: 死亡后还可以继续T読 副本,1: 死亡后被强制移出副本
x600034_g_Fuben_X = 50							--进入副本to� 鸬 位置X
x600034_g_Fuben_Z = 10							--进入副本to� 鸬 位置Z
x600034_g_Back_X = 47								--源场景位置X
x600034_g_Back_Z = 92								--源场景位置Z
x600034_g_NeedMonsterGroupID = 1		--Boss to� 鸬 组号
x600034_g_TotalNeedKillBoss = 11		--C 杀死Boss数量



--**********************************
--任务入口函数
--**********************************
function x600034_OnDefaultEvent( sceneId, selfId, targetId )	-- 餴琺击该任务后执行此脚本

	if IsHaveMission( sceneId, selfId, x600034_g_MissionId ) > 0 then
		--  鹫t 疬㧟当前选中to� 鸬 Npcto� 鸬 T阯
		local szCurNpc = GetName(sceneId,targetId)
		
		-- 任务中记录to� 鸬 Npcto� 鸬 T阯
		local misIndex = GetMissionIndexByID(sceneId,selfId,x600034_g_MissionId)
		local nNpcId = GetMissionParam(sceneId, selfId, misIndex, 7)
		
		local szNpcName = ""
		if nNpcId > 0  then
			_,szNpcName = GetNpcInfoByNpcId(sceneId,nNpcId)
			
			if szCurNpc == szNpcName   then  -- 找对人了
				BeginEvent( sceneId )
					AddText( sceneId, "#Y羗 s醫 tham quan#W" )
					AddText( sceneId, "  R t痶 r t痶, gi� ta s� 疬a c醕 h� 皙n nha m鬾 c黙 l鉶, hy v鱪g c醕 h� s� gi鋓 quy猼 鹧t 饀鬷 con s鈛 m鱰 n鄖" )
				EndEvent()
				DispatchEventList( sceneId, selfId, targetId )
				
				-- 设置Nhi甿 v� ho鄋 th鄋h标记
				x600034_AcceptEnterCopyScene( sceneId, selfId )
				return
			end
		end
	end

	if GetName( sceneId, targetId ) ~= x600034_g_Name then		--判断该npc喧ng否喧ng对应任务to� 鸬 npc
		return
	end

	--如果已接此任务
	if IsHaveMission( sceneId, selfId, x600034_g_MissionId ) > 0 then
		--发送任务需求to� 鸬 信息
		BeginEvent( sceneId )
			AddText( sceneId, x600034_g_MissionName )
			AddText( sceneId, x600034_g_ContinueInfo )
		EndEvent( )
		local bDone = x600034_CheckSubmit( sceneId, selfId )
		
		DispatchMissionDemandInfo( sceneId, selfId, targetId, x600034_g_ScriptId, x600034_g_MissionId, bDone )
	--Th鯽 m鉵任务接收条件
	elseif x600034_CheckAccept( sceneId, selfId ) > 0 then
		local nTemp = CallScriptFunction( x600034_g_CityMissionScript, "CanDoMisToDay", sceneId, selfId )
		if nTemp == 1   then
			x600034_OnAccept( sceneId, selfId, targetId )
		end
	end
	
end

--**********************************
--列举事件
--**********************************
function x600034_OnEnumerate( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x600034_g_Name then		--判断该npc喧ng否喧ng对应任务to� 鸬 npc
		return
	end
   --如果已接此任务
	if IsHaveMission( sceneId, selfId, x600034_g_MissionId ) > 0 then
		AddNumText( sceneId, x600034_g_ScriptId, x600034_g_MissionName, 2 )
	end
end

--**********************************
--Ti猵 th�
--**********************************
function x600034_OnAccept( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x600034_g_Name then		--判断该npc喧ng否喧ng对应任务to� 鸬 npc
		return
	end
	-- 取 餴琺m祎 c醝随机to� 鸬 交任务to� 鸬 人
	local nLevel = GetLevel(sceneId, selfId)
	local nNpcId = 0
	local szNpcName = ""
	local szScene = ""
	local nScene = 0
	local nPosX = 0
	local nPosZ = 0
	local szNpcDesc =""
	local nSex = 0
	
	--从MissionNpc_HashTable.txt中 鹫t 疬㧟Npc内容,
	nNpcId,szNpcName,szScene,nScene,nPosX,nPosZ,szNpcDesc,nSex = GetOneMissionNpc(42)

	--加入任务到玩家列表
	AddMission( sceneId, selfId, x600034_g_MissionId, x600034_g_ScriptId, 1, 0, 0 )	-- kill、area、item
	if IsHaveMission( sceneId, selfId, x600034_g_MissionId ) <= 0 then
		return
	end

	-- 随机出玩家to� 鸬 落脚 餴琺
	local nPos  = random( getn(x600034_g_Pos) )

	-- 随机出玩家to� 鸬 T阯
	local nXing = random( 0, 4 )
	local nMing = random( 5, 9 )
	local nZhi  = random( 10, 18 )

	-- 设置C醝 n鄖 任务C 关注NPC
	SetMissionEvent( sceneId,selfId, x600034_g_MissionId, 4)
	
	-- 记录下随机选中to� 鸬 NpcId
	local misIndex = GetMissionIndexByID(sceneId,selfId,x600034_g_MissionId)
	
	SetMissionByIndex(sceneId, selfId, misIndex, 3, nPos)
	SetMissionByIndex(sceneId, selfId, misIndex, 4, nXing)
	SetMissionByIndex(sceneId, selfId, misIndex, 5, nMing)
	SetMissionByIndex(sceneId, selfId, misIndex, 6, nZhi)
	SetMissionByIndex(sceneId, selfId, misIndex, 7, nNpcId)

	CallScriptFunction( x600034_g_MilitaryScript, "OnAccept", sceneId, selfId, targetId, x600034_g_ScriptId )

	--显示内容告诉玩家已经Ti猵 th巳挝�
	local nTaSex
	if 	nSex == 0  then
		nTaSex = "mu礽  "
	else
		nTaSex = "huynh  "
	end
	
	local missionInfo = "    Tham quan " .. x600034_g_StrList[nXing] .. x600034_g_StrList[nMing] ..  
											" hi畁 � " .. x600034_g_StrList[nZhi] .. ", l鉶 ta h� hi猵 d鈔 l鄋h, ti猲g o醤 than vang l阯 kh n絠, ta 疸 s x猵 "
											 .. szScene .. szNpcName .. " (" .. nPosX .. "," .. nPosZ .. 
											 ") t靘 hi瑄 疬㧟 t靚h b醥 r癷, nhi甿 v� 醡 s醫 l鉶 giao cho c醕 h� 黏y"

	BeginEvent( sceneId )
		AddText( sceneId, "C醕 h� 疸 nh nhi甿 v�: " .. x600034_g_MissionName )
		AddText( sceneId, missionInfo )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--检测Ti猵 th跫�
--**********************************
function x600034_CheckAccept( sceneId, selfId )
	local ret = CallScriptFunction( x600034_g_MilitaryScript, "CheckAccept", sceneId, selfId )
	return ret
end

--**********************************
--检测喧ng否可以提交
--**********************************
function x600034_CheckSubmit( sceneId, selfId )
	local misIndex = GetMissionIndexByID( sceneId, selfId, x600034_g_MissionId )
	if  GetMissionParam(sceneId, selfId, misIndex, x600034_g_IsMissionOkFail) == 1  then
		return 1
	end 
	return 0
end

--**********************************
--放弃任务
--**********************************
function x600034_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应to� 鸬 任务
	CallScriptFunction( x600034_g_MilitaryScript, "OnAbandon", sceneId, selfId )
end

--**********************************
--杀死怪物或玩家
--**********************************
function x600034_OnKillObject( sceneId, selfId, objdataId ,objId )

	local monsterName = GetName(sceneId, objId)
	
	-- 使用任务中记录to� 鸬 来判断喧ng不喧ng杀对了人
	local misIndex = GetMissionIndexByID( sceneId, selfId, x600034_g_MissionId )
	local nXing = GetMissionParam(sceneId, selfId, misIndex, 4)
	local nMing = GetMissionParam(sceneId, selfId, misIndex, 5)
	local szNpcName = x600034_g_StrList[nXing] .. x600034_g_StrList[nMing]

	if monsterName == szNpcName   then
		-- 设置Nhi甿 v� ho鄋 th鄋h标记
		SetMissionByIndex(sceneId, selfId, misIndex, x600034_g_IsMissionOkFail, 1)
		
		x600034_NotifyFailTips( sceneId, selfId, "秀 gi猼 ch猼 " .. monsterName .. ": 1/1"  )
		LuaFnSetCopySceneData_Param( sceneId, 11, 1 )
		LuaFnSetCopySceneData_Param( sceneId, 15, selfId )

	end
end

--**********************************
--继续
--**********************************
function x600034_OnContinue( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, x600034_g_MissionName )
		AddText( sceneId, x600034_g_MissionComplete )
	EndEvent( )
	DispatchMissionContinueInfo( sceneId, selfId, targetId, x600034_g_ScriptId, x600034_g_MissionId )
end

--**********************************
--提交
--**********************************
function x600034_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if GetName( sceneId, targetId ) ~= x600034_g_Name then		--判断该npc喧ng否喧ng对应任务to� 鸬 npc
		return
	end
	
	if x600034_CheckSubmit( sceneId, selfId ) == 1 then
		CallScriptFunction( x600034_g_MilitaryScript, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
	end
end

--**********************************
-- 
--**********************************
function x600034_OnLockedTarget( sceneId, selfId, targetId, missionIndex )

	--判断当前to� 鸬 场景喧ng不喧ng副本,喧ng副本就Tr� v�
	if LuaFnGetSceneType(sceneId) == 1  then
		return
	end

	--  鹫t 疬㧟当前选中to� 鸬 Npcto� 鸬 T阯
	local szCurNpc = GetName(sceneId,targetId)
	
	-- 任务中记录to� 鸬 Npcto� 鸬 T阯
	local misIndex = GetMissionIndexByID(sceneId,selfId,x600034_g_MissionId)
	local nNpcId = GetMissionParam(sceneId, selfId, misIndex, 7)
	
	local szNpcName = ""
	_,szNpcName = GetNpcInfoByNpcId(sceneId,nNpcId)
	
	if GetMissionParam(sceneId, selfId, misIndex, x600034_g_IsMissionOkFail) ~= 1   then
		if szCurNpc == szNpcName   then  -- 找对人了
			TAddNumText(sceneId, x600034_g_ScriptId, "羞a ta 皙n nha m鬾", 10, -1,x600034_g_ScriptId); --[tx42329]
			TDispatchEventList(sceneId, selfId, targetId)
			return 1
		end
		return 0
	end
end

--**********************************
--玩家同意进入副本
--**********************************
function x600034_AcceptEnterCopyScene( sceneId, selfId )

	if IsHaveMission( sceneId, selfId, x600034_g_MissionId ) > 0 then					--有任务才可以走这里
		local misIndex = GetMissionIndexByID( sceneId, selfId, x600034_g_MissionId )
		SetMissionByIndex( sceneId, selfId, misIndex, x600034_g_IsMissionOkFail, 0 )	--将任务to� 鸬 第0号数据设置为0,表示未完成to� 鸬 任务
				
		x600034_MakeCopyScene( sceneId, selfId )		
		
	end
	
end

function x600034_MakeCopyScene( sceneId, selfId )

	local mylevel = GetLevel( sceneId, selfId )

	local nPox_X
	local nPos_Z
	nPox_X = GetHumanWorldX(sceneId,selfId)
	nPos_Z = GetHumanWorldZ(sceneId,selfId)

	local leaderguid = LuaFnObjId2Guid( sceneId, selfId )
	LuaFnSetSceneLoad_Map( sceneId, x600034_g_CopySceneMap )						--地图喧ng必须选取to� 鸬 ,而且必须T読 Config/SceneInfo.ini里配置好
	LuaFnSetCopySceneData_TeamLeader( sceneId, leaderguid )
	LuaFnSetCopySceneData_NoUserCloseTime( sceneId, x600034_g_NoUserTime * 1000 )
	LuaFnSetCopySceneData_Timer( sceneId, x600034_g_TickTime * 1000 )
	LuaFnSetCopySceneData_Param( sceneId, 0, x600034_g_CopySceneType )				--设置副本数据,这里将0号索引to� 鸬 数据设置为999,用于表示副本号999(数字自定义)
	LuaFnSetCopySceneData_Param( sceneId, 1, x600034_g_ScriptId )					--将1号数据设置为副本场景事件脚本号
	LuaFnSetCopySceneData_Param( sceneId, 2, 0 )							--设置定时器调用次数
	LuaFnSetCopySceneData_Param( sceneId, 3, -1 )							--设置副本入口场景号, 初始化
	LuaFnSetCopySceneData_Param( sceneId, 4, 0 )							--设置副本关闭标志, 0开放,1关闭
	LuaFnSetCopySceneData_Param( sceneId, 5, 0 )							--设置离开倒计时次数
	LuaFnSetCopySceneData_Param( sceneId, 6, sceneId )				--保存队伍号
	LuaFnSetCopySceneData_Param( sceneId, 7, nPox_X )					--保存当前场景编号
	LuaFnSetCopySceneData_Param( sceneId, 8, nPos_Z )					--进入to� 鸬 人次

	-- 清空副本变量
	for k=9, 15  do
		LuaFnSetCopySceneData_Param( sceneId, k, 0 )
	end

	local PlayerMaxLevel = GetHumanMaxLevelLimit() --modi:lby20071127
	
	local iniLevel
	if mylevel < 10 then
		iniLevel = 10
	elseif mylevel < PlayerMaxLevel then
		iniLevel = floor( mylevel/10 ) * 10
	else
		iniLevel = PlayerMaxLevel
	end

	LuaFnSetSceneLoad_Area( sceneId, "yamen_area.ini" )
	LuaFnSetSceneLoad_Monster( sceneId, "yamen_monster_" .. tostring(iniLevel) .. ".ini" )
	--LuaFnSetCopySceneData_Param(sceneId, CopyScene_LevelGap, mylevel - iniLevel) --c别差,CopyScene_LevelGap T読  scene.lua 中赋值
	local bRetSceneID = LuaFnCreateCopyScene( sceneId )						--初始化完成后调用创建副本函数
	
	if bRetSceneID > 0 then
		x600034_NotifyFailTips( sceneId, selfId, "D竎h chuy琻 th鄋h c鬾g!" )
	else
		x600034_NotifyFailTips( sceneId, selfId, "S� l唼ng b鋘 sao 疸 皙n gi緄 h課, 皤 ngh� l醫 n鎍 th� l読!" )
	end
end

--**********************************
--副本事件
--**********************************
function x600034_OnCopySceneReady( sceneId, destsceneId )

	LuaFnSetCopySceneData_Param(destsceneId, 3, sceneId) --设置副本入口场景号
	leaderguid  = LuaFnGetCopySceneData_TeamLeader(destsceneId)
	leaderObjId = LuaFnGuid2ObjId(sceneId,leaderguid)

	if LuaFnIsCanDoScriptLogic( sceneId, leaderObjId ) ~= 1 then			-- 处于无法执行逻辑to� 鸬 状态
		return
	end

	if IsHaveMission( sceneId, leaderObjId, x600034_g_MissionId ) > 0 then			--有任务才可以走这里
		local misIndex = GetMissionIndexByID( sceneId, leaderObjId, x600034_g_MissionId )

		--  鹫t 疬㧟进入副本to� 鸬 位置
		local misIndex = GetMissionIndexByID(sceneId,leaderObjId,x600034_g_MissionId)
		local nPos = GetMissionParam(sceneId, leaderObjId, misIndex, 3)
		
		local nFuben_X = x600034_g_Pos[nPos].x
		local nFuben_Z = x600034_g_Pos[nPos].z
		
		NewWorld( sceneId, leaderObjId, destsceneId, nFuben_X, nFuben_Z )

	end
end

--**********************************
--有玩家进入副本事件
--**********************************
function x600034_OnPlayerEnter( sceneId, selfId )
	LuaFnSetCopySceneData_Param( sceneId, 8, LuaFnGetCopySceneData_Param( sceneId, 8 ) + 1 )

	-- C T読 这里整理怪物to� 鸬 m祎 些特 餴琺
	local nMonsterNum = GetMonsterCount(sceneId)
	
	local ii = 0
	local bHaveMonster = 0
	for ii=0, nMonsterNum-1 do
		local nMonsterId = GetMonsterObjID(sceneId,ii)
		
		if GetName(sceneId, nMonsterId)  == "Quan vi阯"  then
		-- 把C醝 n鄖 怪物to� 鸬 T阯设置为C to� 鸬 T阯,呵呵
		local misIndex = GetMissionIndexByID(sceneId,selfId,x600034_g_MissionId)
		local nXing = GetMissionParam(sceneId, selfId, misIndex, 4)
		local nMing = GetMissionParam(sceneId, selfId, misIndex, 5)
		SetCharacterName(sceneId, nMonsterId, x600034_g_StrList[nXing] .. x600034_g_StrList[nMing] )
		end
	end

end

--**********************************
--有玩家T読 副本中死亡事件
--**********************************
function x600034_OnHumanDie( sceneId, selfId, killerId )
	local leaderguid = LuaFnGetCopySceneData_TeamLeader( sceneId )
end

function x600034_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--副本场景定时器事件
--**********************************
function x600034_OnCopySceneTimer( sceneId, nowTime )
	-- 如果玩家完成了任务,就开始倒计时,之后传玩家出去
	if LuaFnGetCopySceneData_Param( sceneId, 12 ) == 3  then
		return
	end
	
	local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
	
	-- 没有人to� 鸬 场景,什么都不做
	if nHumanNum < 1    then
		return
	end
	
	local selfId1 = LuaFnGetCopyScene_HumanObjId(sceneId, 0)
	
	if LuaFnGetCopySceneData_Param( sceneId, 11 ) == 1   then
	
		if LuaFnGetCopySceneData_Param( sceneId, 12 ) == 0  then
			LuaFnSetCopySceneData_Param( sceneId, 12, 1 )
			LuaFnSetCopySceneData_Param( sceneId, 13, nowTime )
			if LuaFnIsObjValid(sceneId, selfId1) == 1 and LuaFnIsCanDoScriptLogic(sceneId, selfId1) == 1 then
				x600034_NotifyFailTips(sceneId, selfId1,"Nhi甿 v� ho鄋 th鄋h, 10 gi鈟 sau c醕 h� s� 疬㧟 疬a ra kh鰅 疴y")
			end
		end
		
		if LuaFnGetCopySceneData_Param( sceneId, 12 ) == 1  then
			if nowTime - LuaFnGetCopySceneData_Param( sceneId, 13 ) > 5000  then
				LuaFnSetCopySceneData_Param( sceneId, 12, 2 )
				if LuaFnIsObjValid(sceneId, selfId1) == 1 and LuaFnIsCanDoScriptLogic(sceneId, selfId1) == 1 then
					x600034_NotifyFailTips(sceneId, selfId1,"5 gi鈟 sau c醕 h� s� 疬㧟 疬a ra kh鰅 疴y")
				end
			end
		end
		
		if LuaFnGetCopySceneData_Param( sceneId, 12 ) == 2  then   
			if nowTime - LuaFnGetCopySceneData_Param( sceneId, 13 ) > 10000  then
				LuaFnSetCopySceneData_Param( sceneId, 12, 3 )
				if LuaFnIsObjValid(sceneId, selfId1) == 1 and LuaFnIsCanDoScriptLogic(sceneId, selfId1) == 1 then
					x600034_BackToCity( sceneId, selfId1 )
				end
			end
		end
		
	end
	
end

--**********************************
-- 回城,只有Th鄋h ph� 任务副本可以调用此接口
--**********************************
function x600034_BackToCity( sceneId, selfId )

	local nMonsterScene = LuaFnGetCopySceneData_Param( sceneId, 6 )
	local nPos_X = LuaFnGetCopySceneData_Param( sceneId, 7 )
	local nPos_Z = LuaFnGetCopySceneData_Param( sceneId, 8 )

	-- 传送玩家到C醝 n鄖 位置去
	CallScriptFunction((400900), "TransferFunc",sceneId, selfId, nMonsterScene, nPos_X, nPos_Z)
end
