--副本任务
--杀死建设工地寻衅头领

--************************************************************************
--MisDescBegin

--脚本号
x600039_g_ScriptId = 600039

--任务号
x600039_g_MissionId = 1111

--目标NPC
x600039_g_Name = "Tr竛h V� Danh"

--衅ng c nhi甿 v� 
x600039_g_MissionLevel = 10000

--任务归类
x600039_g_MissionKind = 50

--喧ng否喧ngTinh英任务
x600039_g_IfMissionElite = 0

--********下面几项喧ng动态显示to� 鸬 内容,用于T読 任务列表中动态显示任务情况******
--角色Mission变量� 餴琺�

x600039_g_IsMissionOkFail			=0	--0 Nhi甿 v� ho鄋 th鄋h标记
x600039_g_MissionParam_SubId		=1	--1 子任务脚本号存放位置
x600039_g_Param_sceneid				=2	--2 当前副本任务to� 鸬 场景号
x600039_g_MissionParam_BossIndex	=3	--3 某 Boss to� 鸬 T阯索引
x600039_g_Param_Killed				=4	--4 已杀死to� 鸬 数量
x600039_g_Param_Needed				=5	--5 需杀死to� 鸬 数量

--循环任务to� 鸬 数据索引,里面存着已做to� 鸬 环数
x600039_g_MissionRound = 59
--**********************************以上喧ng动态****************************

--任务文本描述
x600039_g_MissionName = "X鈟 d駈g nhi甿 v�"
x600039_g_MissionInfo = ""													--任务描述
x600039_g_MissionTarget = "    T靘 疬㧟 %s m� giang h� x遪g l� th� l頽h v� l� t阯 c 馥u c黙 b鱪 g鈟 s� 鸢ng th秈 gi猼 ch猼 h."				--M鴆 ti陁 nhi甿 v�
x600039_g_ContinueInfo = "    Nhi甿 v� c黙 c醕 h� v鏽 ch遖 ho鄋 th鄋h �?"						--未Ho鄋 t nhi甿 v鴗o� 鸬 npc对话
x600039_g_SubmitInfo = "    S� t靚h ti猲 tri琻 nh� th� n鄌 r癷?"								--完成未提交时to� 鸬 npc对话
x600039_g_MissionComplete = "    R t痶 r t痶, ti猲 鸬 x鈟 d駈g l読 t錸g nhanh r癷. "			--Ho鄋 t nhi甿 v鴑pc说话to� 鸬 话

x600039_g_Parameter_Kill_CountRandom = { { id = 300471, numNeeded = 5, numKilled = 4 } }

x600039_g_StrForePart = 3

x600039_g_StrList = {
	[0 ] = "",
	[1 ] = "Ti瑄 Th醝 Tu�",
	[2 ] = "H鄋 Th醝 Tu�",
	[3 ] = "Ho誸 Th醝 Tu�",
	[4 ] = "B畁h Th醝 Tu�",
	[5 ] = "衋ng Tr馽 Th醝 tu�",
	[6 ] = "Thanh Di畁 Th醝 Tu�",
	[7 ] = "Huy猼 Th� Th醝 Tu�",
	[8 ] = "B醫 Di畁 Th醝 Tu�",
	[9 ] = "羉 Th� Di阭 La",
	[10] = "Ti瑄 Di阭 La",
	[11] = "H鄋 Di阭 La",
	[12] = "Ho誸 Di阭 La",
	[13] = "B畁h Di阭 La",
	[14] = "C豼 啸u Di阭 La",
	[15] = "Kim Nh鉵 Di阭 La",
	[16] = "Kim ch叻ng Di阭 La",
	[17] = "Thi猼 Quy玭 B� V呓ng",
	[18] = "B醫 B� V呓ng",
	[19] = "B畁h B� V呓ng",
	[20] = "Ti瑄 B� V呓ng",
	[21] = "Tr読 B� V呓ng",
	[22] = "Ho誸 B� V呓ng",
}

-- 通用Th鄋h ph� 任务脚本
x600039_g_CityMissionScript = 600001
x600039_g_ConstructionScript = 600035

--任务奖励

--MisDescEnd
--************************************************************************

--副本名称
x600039_g_CopySceneName = "C鬾g 鸶a"

x600039_g_CopySceneType = FUBEN_GONGDI	--副本类型,定义T読 ScriptGlobal.lua里面

x600039_g_CopySceneMap = "gongdi.nav"
x600039_g_Exit = "gongdi_area.ini"

x600039_g_MonsterCount = 10				--怪物数量

x600039_g_TickTime = 5					--回调脚本to� 鸬 时钟时间(单位:  gi鈟/次)
x600039_g_CloseTick = 3					--副本关闭前倒计时(单位: 次数)
x600039_g_NoUserTime = 120				--副本中没有人后可以继续保存to� 鸬 时间(单位:  gi鈟)

x600039_g_BossGroupId = 51				--boss怪
x600039_g_Fuben_X = 32					--进入副本to� 鸬 位置X
x600039_g_Fuben_Z = 50					--进入副本to� 鸬 位置Z
x600039_g_Back_X = 100					--源场景位置X
x600039_g_Back_Z = 57					--源场景位置Z

--**********************************
--任务入口函数
--**********************************
function x600039_OnDefaultEvent( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x600039_g_Name then		--判断该npc喧ng否喧ng对应任务to� 鸬 npc
		return
	end

	--如果已接此任务
	if IsHaveMission( sceneId, selfId, x600039_g_MissionId ) > 0 then
		local bDone = x600039_CheckSubmit( sceneId, selfId )
		local strText

		if bDone == 1 then
			strText = x600039_g_SubmitInfo
		else
			strText = x600039_g_ContinueInfo
		end

		local misIndex = GetMissionIndexByID( sceneId, selfId, x600039_g_MissionId )

		if bDone == 0 then				--任务未完成
			if GetNumText() == 1 then	-- 这里喧ng 餴琺击进入副本
				x600039_AcceptEnterCopyScene( sceneId, selfId )
				return
			end

			BeginEvent( sceneId )		-- 显示任务接取界面
				AddText( sceneId, x600039_g_MissionName )
				x600039_AskEnterCopyScene( sceneId, selfId )
			EndEvent( )
			DispatchEventList( sceneId, selfId, targetId )
			return
		end

		BeginEvent( sceneId )
			AddText( sceneId, x600039_g_MissionName )
			AddText( sceneId, strText )
		EndEvent( )
		DispatchMissionDemandInfo( sceneId, selfId, targetId, x600039_g_ScriptId, x600039_g_MissionId, bDone )

	--Th鯽 m鉵任务接收条件
	elseif x600039_CheckAccept( sceneId, selfId ) > 0 then
		x600039_OnAccept( sceneId, selfId, targetId )
	end
end

--**********************************
--列举事件
--**********************************
function x600039_OnEnumerate( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x600039_g_Name then		--判断该npc喧ng否喧ng对应任务to� 鸬 npc
		return
	end

   --如果已接此任务
	if IsHaveMission( sceneId, selfId, x600039_g_MissionId ) > 0 then
		AddNumText( sceneId, x600039_g_ScriptId, x600039_g_MissionName,3,-1 )
	end
end

--**********************************
--检测Ti猵 th跫�
--**********************************
function x600039_CheckAccept( sceneId, selfId )
	local ret = CallScriptFunction( x600039_g_ConstructionScript, "CheckAccept", sceneId, selfId )
	return ret
end

--**********************************
--询问玩家喧ng否要进入副本
--**********************************
function x600039_AskEnterCopyScene( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x600039_g_MissionId ) <= 0 then	-- 没有任务
		return
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x600039_g_MissionId )
	local BossIndex = GetMissionParam( sceneId, selfId, misIndex, x600039_g_MissionParam_BossIndex )
	local missionInfo = format( "    C醕 h� 皙n 瘊ng l鷆 qu�, th秈 gian g 疴y hi畁 tr叨ng x鈟 d駈g th叨ng xuy阯 c� m祎 疳m ng叨i t靘 c� g鈟 chuy畁, k� c 馥u 疳m giang h� x遪g l� %s, nhi甿 v� c黙 c醕 h� l� ph鋓 gi鋓 quy猼 k� c 馥u %s, c醕 h� ph鋓 c� l阯.",
		x600039_g_StrList[BossIndex], GetName( sceneId, selfId ) )

	AddText( sceneId, missionInfo )

	AddNumText( sceneId, x600039_g_ScriptId, "V鄌 c鬾g tr叨ng", 10, 1 )
end

--**********************************
--Ti猵 th�
--**********************************
function x600039_OnAccept( sceneId, selfId, targetId )
	if IsHaveMission( sceneId, selfId, x600039_g_MissionId ) == 0 then					--没有任务才可以走这里
		if GetLevel( sceneId, selfId ) < 10 then
			CallScriptFunction( x600039_g_CityMissionScript, "NotifyFailTips", sceneId, selfId, "Kh鬾g 瘘 鹌ng c" )
			return
		end

		--加入任务到玩家列表
		AddMission( sceneId, selfId, x600039_g_MissionId, x600039_g_ScriptId, 1, 0, 0 )	-- kill、area、item
		if IsHaveMission( sceneId, selfId, x600039_g_MissionId ) <= 0 then
			return
		end

		CallScriptFunction( x600039_g_ConstructionScript, "OnAccept", sceneId, selfId, targetId, x600039_g_ScriptId )
		local misIndex = GetMissionIndexByID( sceneId, selfId, x600039_g_MissionId )

		--PrintStr( "The count of x600039_g_StrList should be 22, the actual value is " .. getn(x600039_g_StrList) )
		-- 随机m祎 c醝门派
		local BossIndex = random( getn(x600039_g_StrList) )

		SetMissionByIndex( sceneId, selfId, misIndex, x600039_g_MissionParam_BossIndex, BossIndex )
		SetMissionByIndex( sceneId, selfId, misIndex, x600039_g_Param_Needed, x600039_g_MonsterCount )		-- 仅供客户端使用

		--显示内容告诉玩家已经Ti猵 th巳挝�
		BeginEvent( sceneId )
			AddText( sceneId, x600039_g_MissionName )
			x600039_AskEnterCopyScene( sceneId, selfId )
			AddText( sceneId, "#rC醕 h� 疸 nh " .. x600039_g_MissionName )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
end

--**********************************
--玩家同意进入副本
--**********************************
function x600039_AcceptEnterCopyScene( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x600039_g_MissionId ) > 0 then					--有任务才可以走这里
		local misIndex = GetMissionIndexByID( sceneId, selfId, x600039_g_MissionId )
		--local copysceneid = GetMissionParam( sceneId, selfId, misIndex, x600039_g_Param_sceneid )

		--if copysceneid >= 0 and GetMissionParam( sceneId, selfId, misIndex, x600039_g_IsMissionOkFail ) == 0 then												--进过副本
		--	--将自己传送到副本场景
		--	if IsCanEnterCopyScene( copysceneid, GetHumanGUID( sceneId, selfId ) ) == 1 then
		--		NewWorld( sceneId, selfId, copysceneid, x600039_g_Fuben_X, x600039_g_Fuben_Z )
		--		return
		--	end
		--end

		SetMissionByIndex( sceneId, selfId, misIndex, x600039_g_IsMissionOkFail, 0 )	--将任务to� 鸬 第0号数据设置为0,表示未完成to� 鸬 任务
		SetMissionByIndex( sceneId, selfId, misIndex, x600039_g_Param_sceneid, -1 )		--将任务to� 鸬 第2号数据设置为-1, 用于保存副本to� 鸬 场景号
		x600039_MakeCopyScene( sceneId, selfId )
	end
end

--**********************************
--创建副本
--**********************************
function x600039_MakeCopyScene( sceneId, selfId )
	local mylevel = GetLevel( sceneId, selfId )

	local leaderguid = LuaFnObjId2Guid( sceneId, selfId )
	LuaFnSetSceneLoad_Map( sceneId, x600039_g_CopySceneMap )						--地图喧ng必须选取to� 鸬 ,而且必须T読 Config/SceneInfo.ini里配置好
	LuaFnSetCopySceneData_TeamLeader( sceneId, leaderguid )
	LuaFnSetCopySceneData_NoUserCloseTime( sceneId, x600039_g_NoUserTime * 1000 )
	LuaFnSetCopySceneData_Timer( sceneId, x600039_g_TickTime * 1000 )
	LuaFnSetCopySceneData_Param( sceneId, 0, x600039_g_CopySceneType )				--设置副本数据,这里将0号索引to� 鸬 数据设置为999,用于表示副本号999(数字自定义)
	LuaFnSetCopySceneData_Param( sceneId, 1, x600039_g_ScriptId )					--将1号数据设置为副本场景事件脚本号
	LuaFnSetCopySceneData_Param( sceneId, 2, 0 )							--设置定时器调用次数
	LuaFnSetCopySceneData_Param( sceneId, 3, -1 )							--设置副本入口场景号, 初始化
	LuaFnSetCopySceneData_Param( sceneId, 4, 0 )							--设置副本关闭标志, 0开放,1关闭
	LuaFnSetCopySceneData_Param( sceneId, 5, 0 )							--设置离开倒计时次数
	LuaFnSetCopySceneData_Param( sceneId, 6, 0 )							--喧ng否秀 gi猼 ch猼 了boss
	LuaFnSetCopySceneData_Param( sceneId, 7, x600039_g_MonsterCount )				--剩余弟子to� 鸬 数量

 local PlayerMaxLevel = GetHumanMaxLevelLimit() --modi:lby20071127
 
	local iniLevel
	if mylevel < 10 then
		iniLevel = 10
	elseif mylevel < PlayerMaxLevel then
		iniLevel = floor( mylevel/10 ) * 10
	else
		iniLevel = PlayerMaxLevel
	end

	LuaFnSetSceneLoad_Area( sceneId, x600039_g_Exit )
	LuaFnSetSceneLoad_Monster( sceneId, "gongdi_monster_" .. iniLevel .. ".ini" )

	LuaFnSetCopySceneData_Param(sceneId, CopyScene_LevelGap, mylevel - iniLevel) --c别差,CopyScene_LevelGap T読  scene.lua 中赋值

	local bRetSceneID = LuaFnCreateCopyScene( sceneId )						--初始化完成后调用创建副本函数
	if bRetSceneID > 0 then
		x600039_NotifyFailTips( sceneId, selfId, "D竎h chuy琻 th鄋h c鬾g!" )
	else
		x600039_NotifyFailTips( sceneId, selfId, "S� l唼ng b鋘 sao 疸 皙n gi緄 h課, 皤 ngh� l醫 n鎍 th� l読!" )
	end

end

--**********************************
--副本事件
--**********************************
function x600039_OnCopySceneReady( sceneId, destsceneId )
	LuaFnSetCopySceneData_Param( destsceneId, 3, sceneId )					--设置副本入口场景号
	local leaderguid = LuaFnGetCopySceneData_TeamLeader( destsceneId )
	local leaderObjId = LuaFnGuid2ObjId( sceneId, leaderguid )

	if leaderObjId == -1 then
		return
	end

	if LuaFnIsCanDoScriptLogic( sceneId, leaderObjId ) ~= 1 then			-- 处于无法执行逻辑to� 鸬 状态
		return
	end

	if IsHaveMission( sceneId, leaderObjId, x600039_g_MissionId ) > 0 then			--有任务才可以走这里
		local misIndex = GetMissionIndexByID( sceneId, leaderObjId, x600039_g_MissionId )

		--将任务to� 鸬 第2号数据设置为副本to� 鸬 场景号
		SetMissionByIndex( sceneId, leaderObjId, misIndex, x600039_g_Param_sceneid, destsceneId )
		NewWorld( sceneId, leaderObjId, destsceneId, x600039_g_Fuben_X, x600039_g_Fuben_Z )
	end
end

--**********************************
--有玩家进入副本事件
--**********************************
function x600039_OnPlayerEnter( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x600039_g_MissionId ) == 0 then				--如果进入副本前删除任务,则直接传送回
		x600039_NotifyFailTips( sceneId, selfId, "C醕 h� 疸 kh鬾g nh nhi甿 v� n鄖 t� tr呔c" )
		x600039_BackToCity( sceneId, selfId )
		return
	end

	local monstercount = GetMonsterCount( sceneId )
	local monsterId, i
	for i = 0, monstercount - 1 do
		-- 找到 Boss = monsterId
		monsterId = GetMonsterObjID( sceneId, i )
		local GroupID = GetMonsterGroupID( sceneId, monsterId )
		if GroupID == x600039_g_BossGroupId then
			local misIndex = GetMissionIndexByID( sceneId, selfId, x600039_g_MissionId )
			local BossIndex = GetMissionParam( sceneId, selfId, misIndex, x600039_g_MissionParam_BossIndex )
			SetCharacterName( sceneId, monsterId, x600039_g_StrList[BossIndex] )
			break
		end
	end
	
	-- hongyu
	-- T読 玩家进入场景to� 鸬 时候,把玩家to� 鸬 相关任务杀人数设置为 1
	local misIndex = GetMissionIndexByID( sceneId, selfId, x600039_g_MissionId )
	SetMissionByIndex( sceneId, selfId, misIndex, x600039_g_Param_Killed, 0 )	--设置任务数据
	-- end
end

--**********************************
--有玩家T読 副本中死亡事件
--**********************************
function x600039_OnHumanDie( sceneId, selfId, killerId )
end

--**********************************
--放弃
--**********************************
function x600039_OnAbandon( sceneId, selfId )
	local misIndex = GetMissionIndexByID( sceneId, selfId, x600039_g_MissionId )
	local copyscene = GetMissionParam( sceneId, selfId, misIndex, x600039_g_Param_sceneid )

	--删除玩家任务列表中对应to� 鸬 任务
	CallScriptFunction( x600039_g_ConstructionScript, "OnAbandon", sceneId, selfId )

	if sceneId == copyscene then											--如果T読 副本里删除任务,则直接传送回
		x600039_NotifyFailTips( sceneId, selfId, "Nhi甿 v� th b読!" )
		x600039_BackToCity( sceneId, selfId )
	end
end

--**********************************
-- 回城,只有Th鄋h ph� 任务副本可以调用此接口
--**********************************
function x600039_BackToCity( sceneId, selfId )
	local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )					--取 餴琺副本入口场景号
	NewWorld( sceneId, selfId, oldsceneId, x600039_g_Back_X, x600039_g_Back_Z )
end

--**********************************
--继续
--**********************************
function x600039_OnContinue( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, x600039_g_MissionName )
		AddText( sceneId, x600039_g_MissionComplete )
	EndEvent( )
	DispatchMissionContinueInfo( sceneId, selfId, targetId, x600039_g_ScriptId, x600039_g_MissionId )
end

--**********************************
--检测喧ng否可以提交
--**********************************
function x600039_CheckSubmit( sceneId, selfId, selectRadioId )
	--判断任务喧ng否已经完成
	local ret = CallScriptFunction( x600039_g_ConstructionScript, "CheckSubmit", sceneId, selfId )
	return ret
end

--**********************************
--提交
--**********************************
function x600039_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if GetName( sceneId, targetId ) ~= x600039_g_Name then		--判断该npc喧ng否喧ng对应任务to� 鸬 npc
		return
	end

	if x600039_CheckSubmit( sceneId, selfId ) == 1 then
		CallScriptFunction( x600039_g_ConstructionScript, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x600039_OnKillObject( sceneId, selfId, objdataId, objId )
	if IsHaveMission( sceneId, selfId, x600039_g_MissionId ) == 0 then
		return
	end

	--喧ng否喧ng副本
	local sceneType = LuaFnGetSceneType( sceneId )
	if sceneType ~= 1 then
		return
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x600039_g_MissionId )

	--喧ng否喧ng所C to� 鸬 副本
	local fubentype = LuaFnGetCopySceneData_Param( sceneId, 0 )
	if fubentype ~= x600039_g_CopySceneType then
		return
	end

	--副本关闭标志
	local leaveFlag = LuaFnGetCopySceneData_Param( sceneId, 4 )
	if leaveFlag == 1 then														--如果副本已经被置成关闭状态,则杀怪无效
		return
	end

	local monstercount = GetMissionParam( sceneId, selfId, misIndex, x600039_g_Param_Killed )
	monstercount = monstercount + 1
	SetMissionByIndex( sceneId, selfId, misIndex, x600039_g_Param_Killed, monstercount )	--设置任务数据

	local strText = format( "秀 gi猼 ch猼 t阯 g鈟 s�: %d/%d", monstercount, x600039_g_MonsterCount )
	x600039_NotifyFailTips( sceneId, selfId, strText )

	if monstercount >= x600039_g_MonsterCount then
		LuaFnSetCopySceneData_Param( sceneId, 4, 1 )

		strText = format( "Ho鄋 t nhi甿 v�, trong v騨g %d gi鈟 n鎍 s� 疬a 皙n ch� ra v鄌", x600039_g_CloseTick * x600039_g_TickTime )

		--将任务to� 鸬 第1号数据设置为1,表示完成to� 鸬 任务
		SetMissionByIndex( sceneId, selfId, misIndex, x600039_g_IsMissionOkFail, 1 )	--设置任务数据

		x600039_NotifyFailTips( sceneId, selfId, strText )
	end
end

--**********************************
--进入区域事件
--**********************************
function x600039_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x600039_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--副本场景定时器事件
--**********************************
function x600039_OnCopySceneTimer( sceneId, nowTime )

	--副本时钟读取及设置
	local TickCount = LuaFnGetCopySceneData_Param( sceneId, 2 )						--取 餴琺已经执行to� 鸬 定时次数
	TickCount = TickCount + 1
	LuaFnSetCopySceneData_Param( sceneId, 2, TickCount )							--设置新to� 鸬 定时器调用次数

	--副本关闭标志
	local leaveFlag = LuaFnGetCopySceneData_Param( sceneId, 4 )

	local membercount = LuaFnGetCopyScene_HumanCount( sceneId )
	local mems = {}
	local i

	for i=0, membercount-1 do
		mems[i] = LuaFnGetCopyScene_HumanObjId( sceneId, i )
	end

	if leaveFlag == 1 then															--C 离开
		--离开倒计时间to� 鸬 读取和设置
		local leaveTickCount = LuaFnGetCopySceneData_Param( sceneId, 5 )
		leaveTickCount = leaveTickCount + 1
		LuaFnSetCopySceneData_Param( sceneId, 5, leaveTickCount )

		if leaveTickCount >= x600039_g_CloseTick then										--倒计时间到,大家都出去吧
			--将当前副本场景里to� 鸬 所有人传送回原来进入时候to� 鸬 场景
			for i=0, membercount-1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					x600039_BackToCity( sceneId, mems[i] )
				end
			end
		else
			--通知当前副本场景里to� 鸬 所有人,场景关闭倒计时间
			local strText = format( "C醕 h� s� r秈 kh鰅 n絠 n鄖 trong v騨g %d gi鈟 n鎍", ( x600039_g_CloseTick - leaveTickCount ) * x600039_g_TickTime )

			for i=0, membercount-1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					x600039_NotifyFailTips( sceneId, mems[i], strText )
				end
			end
		end
	end
end

function x600039_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
