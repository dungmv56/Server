--副本任务
--保护帮派驻地
--

--************************************************************************
--MisDescBegin
--脚本号
x805042_g_ScriptId	= 805042
--副本名称
x805042_g_CopySceneName	= "B鋙 h� bang h礽 tr� 鸶a"
--任务号
x805042_g_MissionId			= 1120
--上m祎 c醝任务to� 鸬 ID
x805042_g_MissionIdPre	= 0
--目标NPC
x805042_g_Name					= "B鋙 h� bang h礽 tr� 鸶a"
--喧ng否喧ngTinh英任务
x805042_g_IfMissionElite= 0
--衅ng c nhi甿 v� 
x805042_g_MissionLevel	= 10000
--任务归类
x805042_g_MissionKind		= 1
--任务文本描述
x805042_g_MissionName			= "B鋙 h� bang h礽 tr� 鸶a"
--任务描述
x805042_g_MissionInfo			= "  "
--M鴆 ti陁 nhi甿 v�
x805042_g_MissionTarget		= "  Gi猼 ch猼 to鄋 b� qu醝 v c� th� ho鄋 th鄋h nhi甿 v�."
--未Ho鄋 t nhi甿 v鴗o� 鸬 npc对话
x805042_g_ContinueInfo		= "  "
--Ho鄋 t nhi甿 v鴑pc说话to� 鸬 话
x805042_g_MissionComplete	= "  "


--**********************************以上喧ng动态****************************
--角色Mission变量� 餴琺�
x805042_g_Param_IsMissionOkFail	= 0						--0号: 当前任务喧ng否完成(0未完成；1完成)
x805042_g_Param_killmonstercount	= 1					--1号: 杀死任务小怪to� 鸬 数量
x805042_g_Param_killbosscount	= 2							--2号: 杀死任务boss怪to� 鸬 数量
x805042_g_Param_sceneid		= 3									--3号: 当前副本任务to� 鸬 场景号
x805042_g_Param_teamid		= 4									--4号: 接副本任务时候to� 鸬 队伍号
x805042_g_Param_time			= 5									--5号: 完成副本所用时间(单位:  gi鈟)
																							--6号: 具体副本事件脚本占用
																							--7号: 具体副本事件脚本占用
--MisDescEnd
--************************************************************************

x805042_g_CopySceneType			= FUBEN_PROTECTGUILD	--副本类型,定义T読 ScriptGlobal.lua里面
x805042_g_LimitMembers			= 3		--可以进副本to� 鸬 最小队伍人数
x805042_g_TickTime					= 5		--回调脚本to� 鸬 时钟时间(单位:  gi鈟/次)
x805042_g_LimitTotalHoldTime= 360	--副本可以存活to� 鸬 时间(单位: 次数),如果此时间到了,则任务将会th b読
x805042_g_LimitTimeSuccess	= 500	--副本时间限制(单位: 次数),如果此时间到了,Nhi甿 v� ho鄋 th鄋h
x805042_g_CloseTick					= 7		--副本关闭前倒计时(单位: 次数) zchw 3-->7
x805042_g_NoUserTime				= 300	--副本中没有人后可以继续保存to� 鸬 时间(单位:  gi鈟)
x805042_g_Fuben_X						= 99	--进入副本to� 鸬 位置X
x805042_g_Fuben_Z						= 152	--进入副本to� 鸬 位置Z
x805042_g_Back_X						= 99	--源场景位置X
x805042_g_Back_Z						= 152	--源场景位置Z
x805042_g_Totalkillmonstercount	= 30	--C 杀死monster数量
x805042_g_Totalkillbosscount	= 1	--C 杀死Boss数量

x805042_g_StartTick				=	3	--任务开始时间
x805042_g_CurrentStage			=	0	--当前所处to� 鸬 阶段	0--15 gi鈟开始阶段  1--8 ph鷗清理小怪阶段 2--Boss阶段
x805042_g_FirstStage			=	183	--第m祎 阶段,15 ph鷗限制
x805042_g_FirstStage_msg		=	{4,9,15,21,27,33,39,45,51,57,63,69,75,81,87,93,99,105,111,117,123,129,135,141,147,153,159,165,171,175,177,178,179,180,181,182,}	--第m祎 阶段,剩余时间提示

--副本数据索引对照
x805042_g_keySD					= {}
x805042_g_keySD["typ"]			= 0		--设置副本类型
x805042_g_keySD["spt"]			= 1		--设置副本场景事件脚本号
x805042_g_keySD["tim"]			= 2		--设置定时器调用次数
x805042_g_keySD["currStage"]	= 3		--设置定时器调用次数
x805042_g_keySD["scn"]			= 4		--设置副本入口场景号, 初始化
x805042_g_keySD["cls"]			= 5		--设置副本关闭标志, 0开放,1关闭
x805042_g_keySD["dwn"]			= 6		--设置离开倒计时次数
x805042_g_keySD["tem"]			= 7		--保存队伍号
x805042_g_keySD["x"]			= 8			--人物T読 入口场景中to� 鸬 x位置
x805042_g_keySD["z"]			= 9			--人物T読 入口场景中to� 鸬 z位置
x805042_g_keySD["killMonsterNum"]	= 10		--杀死怪物数量
x805042_g_keySD["genMonsterNum"]	= 11			--生成怪物数量
x805042_g_keySD["playerLevel"]	= 12		--记录当前副本to� 鸬 c别

--接取任务to� 鸬 最低等c
x805042_g_minLevel			= 85

--怪物列表
x805042_g_monster_list = {
	[1]={
			StageId=1,
			MonsterList={
				{mType=9626,	x=74, 	z=90,	aiType=25,	aiScript=-1,	scriptId=805044, deltLevel=0	},
				{mType=9621,	x=72, 	z=90,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				{mType=9621,	x=76, 	z=90,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				{mType=9621,	x=74, 	z=92,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				
				{mType=9626,	x=50, 	z=97,	aiType=25,	aiScript=-1,	scriptId=805044, deltLevel=0	},
				{mType=9621,	x=48, 	z=97,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				{mType=9621,	x=52, 	z=97,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				{mType=9621,	x=50, 	z=95,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				
				{mType=9626,	x=46, 	z=91,	aiType=25,	aiScript=-1,	scriptId=805044, deltLevel=0	},
				{mType=9621,	x=47, 	z=93,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				{mType=9621,	x=47, 	z=89,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				{mType=9621,	x=49, 	z=91,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				
				{mType=9626,	x=45, 	z=72,	aiType=25,	aiScript=-1,	scriptId=805044, deltLevel=0	},
				{mType=9621,	x=47, 	z=72,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				{mType=9621,	x=45, 	z=70,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				{mType=9621,	x=45, 	z=74,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				
				{mType=9626,	x=44, 	z=59,	aiType=25,	aiScript=-1,	scriptId=805044, deltLevel=0	},
				{mType=9621,	x=46, 	z=59,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				{mType=9621,	x=44, 	z=57,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				{mType=9621,	x=44, 	z=61,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				
				{mType=9626,	x=44, 	z=47,	aiType=25,	aiScript=-1,	scriptId=805044, deltLevel=0	},
				{mType=9621,	x=42, 	z=47,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				{mType=9621,	x=46, 	z=47,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				{mType=9621,	x=44, 	z=49,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				
				{mType=9626,	x=64, 	z=55,	aiType=25,	aiScript=-1,	scriptId=805044, deltLevel=0	},
				{mType=9621,	x=62, 	z=55,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				{mType=9621,	x=66, 	z=55,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				{mType=9621,	x=64, 	z=57,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				
				{mType=9626,	x=134, 	z=50,	aiType=25,	aiScript=-1,	scriptId=805044, deltLevel=0	},
				{mType=9621,	x=132, 	z=50,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				{mType=9621,	x=136, 	z=50,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				{mType=9621,	x=134, 	z=52,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				
				{mType=9626,	x=149, 	z=44,	aiType=25,	aiScript=-1,	scriptId=805044, deltLevel=0	},
				{mType=9621,	x=147, 	z=44,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				{mType=9621,	x=151, 	z=44,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				{mType=9621,	x=149, 	z=46,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				
				{mType=9626,	x=148, 	z=56,	aiType=25,	aiScript=-1,	scriptId=805044, deltLevel=0	},
				{mType=9621,	x=146, 	z=56,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				{mType=9621,	x=148, 	z=54,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				{mType=9621,	x=148, 	z=58,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				
				{mType=9626,	x=147, 	z=96,	aiType=25,	aiScript=-1,	scriptId=805044, deltLevel=0	},
				{mType=9621,	x=145, 	z=96,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				{mType=9621,	x=147, 	z=94,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				{mType=9621,	x=147, 	z=98,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				
				{mType=9626,	x=128, 	z=98,	aiType=25,	aiScript=-1,	scriptId=805044, deltLevel=0	},
				{mType=9621,	x=126, 	z=98,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				{mType=9621,	x=130, 	z=98,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
				{mType=9621,	x=128, 	z=100,	aiType=25,	aiScript=-1,	scriptId=805046, deltLevel=-1	},
			}
		},
	[2]={
			StageId=2,
			MonsterList={
				{mType=9631,	x=99,	z=54,	aiType=25,	aiScript=-1,	scriptId=805045 , deltLevel=1	},
			}
		},
}


--**********************************
--任务入口函数
--**********************************
function x805042_OnDefaultEvent( sceneId, selfId, targetId )
	
	if GetNumText() == 1 then
		if x805042_CheckEnter( sceneId, selfId, targetId ) ~= 1  then
			return
		end
	
		if (x805042_OnAccept( sceneId, selfId ) == 1) then
			LuaFnDeleteMonster( sceneId, targetId)
		end
	elseif GetNumText() == 2 then
		
		if GetName( sceneId, targetId ) == "S絥 Qu�" then
			x805042_MsgBox( sceneId, selfId, targetId, "#{bhbpzd_20080522_002}" )
		elseif GetName( sceneId, targetId ) == "S絥 Y陁" then
			x805042_MsgBox( sceneId, selfId, targetId, "#{bhbpzd_20080522_001}" )
		end
		
	end

end



function x805042_CheckEnter( sceneId, selfId, targetId )

	if LuaFnHasTeam( sceneId, selfId ) == 0 then
		x805042_MsgBox_With_Help( sceneId, selfId, targetId, "S絥 th 疸 mu痭 鸠i n鄖 bang h礽 th鄋h th� kh鬾g th� nh竛 疬㧟 n鎍, ph鋓 ph醫 uy ! Ng呓i m祎 ng叨i 疸 ngh� 皙n khi陁 chi猲 s絥 th sao, r kh鬾g bi猼 l唼ng s裞!" )
		return 0
	end
	
	local nPlayerNum = GetNearTeamCount(sceneId,selfId)
	for i=0, nPlayerNum-1  do
		local nPlayerId = GetNearTeamMember(sceneId,selfId, i)
		if GetLevel(sceneId,nPlayerId) < x805042_g_minLevel  then
			x805042_MsgBox_With_Help( sceneId, selfId, targetId, "S絥 th 疸 mu痭 鸠i n鄖 bang h礽 th鄋h th� kh鬾g th� nh竛 疬㧟 n鎍, ph鋓 ph醫 uy ! C醕 ng呓i v鏽 l� 皤u 鹫t t緄 85 c l読 皙n khi陁 chi猲 c叨ng 鹫i  s絥 th 餴!" )
			return 0
		end
	end


	if GetTeamSize( sceneId, selfId ) < x805042_g_LimitMembers then
	  x805042_MsgBox_With_Help( sceneId, selfId, targetId, "S絥 th 疸 mu痭 鸠i n鄖 bang h礽 th鄋h th� kh鬾g th� nh竛 疬㧟 n鎍, ph鋓 ph醫 uy ! C醕 ng呓i mu痭 khi陁 chi猲 ta 韙 nh c鹡g mu痭 皙n ba ng叨i, n猽 kh鬾g s絥 th l� khinh th叨ng cho c鵱g c醕 ng呓i 鸬ng th�!" )
	  return 0
	end


	if LuaFnIsTeamLeader( sceneId, selfId ) == 0 then
		x805042_MsgBox_With_Help( sceneId, selfId, targetId, "S絥 th 疸 mu痭 鸠i n鄖 bang h礽 th鄋h th� kh鬾g th� nh竛 疬㧟 n鎍, ph鋓 ph醫 uy ! Mu痭 khi陁 chi猲 ta? G鱥 c醕 ng呓i  鸬i tr叻ng 皙n 疴y 餴!" )
		return 0
	end


	-- 取 餴琺玩家附近to� 鸬 队友数量(包括自己)
	local nearteammembercount = GetNearTeamCount( sceneId, selfId )
	if nearteammembercount ~= LuaFnGetTeamSize( sceneId, selfId ) then
		x805042_MsgBox_With_Help( sceneId, selfId, targetId, "S絥 th 疸 mu痭 鸠i n鄖 bang h礽 th鄋h th� kh鬾g th� nh竛 疬㧟 n鎍, ph鋓 ph醫 uy ! Mu痭 khi陁 chi猲 ta? V鏽 l� ch� c醕 ng呓i  m鱥 ng叨i 皙n 痿ng 瘘 餴!" )
		return 0
	end
	
	return 1
	
end

--**********************************
--列举事件
--**********************************
function x805042_OnEnumerate( sceneId, selfId, targetId )

	if x805042_CheckEnter( sceneId, selfId, targetId ) ~= 1  then
		return
	end

	BeginEvent( sceneId )
		AddText( sceneId, "S絥 th 疸 mu痭 鸠i n鄖 bang h礽 th鄋h th� kh鬾g th� nh竛 疬㧟 n鎍, ph鋓 ph醫 uy ! Kh鬾g bi猼 s痭g ch猼  ph鄊 nh鈔 a, n猰 th� s絥 l馽 l唼ng c黙 th 餴!" )
		AddNumText( sceneId, x805042_g_ScriptId, "Khi陁 chi猲 S絥 Th" ,10 ,1)
		AddNumText( sceneId, x805042_g_ScriptId, "V� b鋙 h� bang h礽" ,11 ,2)
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

end

--**********************************
--检测Ti猵 th跫�
--**********************************
function x805042_CheckAccept( sceneId, selfId )

	return 1
end

--**********************************
--Ti猵 th�
--**********************************
function x805042_OnAccept( sceneId, selfId )
	local numMem	= GetNearTeamCount( sceneId, selfId )	
	return x805042_MakeCopyScene( sceneId, selfId, numMem )
end

--**********************************
--放弃
--**********************************
function x805042_OnAbandon( sceneId, selfId )

end

--**********************************
--创建副本
--**********************************
function x805042_MakeCopyScene( sceneId, selfId, nearmembercount )

	local mems = {}
	local mylevel = 0
	local i

	local member, mylevel, numerator, denominator = 0, 0, 0, 0

	for	i = 0, nearmembercount - 1 do
		member = GetNearTeamMember( sceneId, selfId, i )
		numerator = numerator + GetLevel( sceneId, member ) ^ 4
		denominator = denominator + GetLevel( sceneId, member ) ^ 3
		mems[i] = member
	end

	if denominator <= 0 then
		mylevel = 0
	else
		mylevel = numerator / denominator
	end

	local PlayerMaxLevel = GetHumanMaxLevelLimit()
	local iniLevel
	if mylevel < 10 then
		iniLevel = 10
	elseif mylevel < PlayerMaxLevel then
		iniLevel = floor( mylevel/10 ) * 10
	else
		iniLevel = PlayerMaxLevel
	end

	local leaderguid = LuaFnObjId2Guid( sceneId, selfId )
	--地图喧ng必须选取to� 鸬 ,而且必须T読 Config/SceneInfo.ini里配置好
	LuaFnSetSceneLoad_Map( sceneId, "protectguild.nav" )
	LuaFnSetCopySceneData_TeamLeader( sceneId, leaderguid )
	LuaFnSetCopySceneData_NoUserCloseTime( sceneId, x805042_g_NoUserTime * 1000 )
	LuaFnSetCopySceneData_Timer( sceneId, x805042_g_TickTime * 1000 )
	LuaFnSetCopySceneData_Param( sceneId, x805042_g_keySD["typ"], x805042_g_CopySceneType )
	LuaFnSetCopySceneData_Param( sceneId, x805042_g_keySD["spt"], x805042_g_ScriptId )
	LuaFnSetCopySceneData_Param( sceneId, x805042_g_keySD["tim"], 0 )
	LuaFnSetCopySceneData_Param( sceneId, x805042_g_keySD["currStage"], 0 )
	LuaFnSetCopySceneData_Param( sceneId, x805042_g_keySD["scn"], -1 )
	LuaFnSetCopySceneData_Param( sceneId, x805042_g_keySD["cls"], 0 )
	LuaFnSetCopySceneData_Param( sceneId, x805042_g_keySD["dwn"], 0 )
	LuaFnSetCopySceneData_Param( sceneId, x805042_g_keySD["tem"], GetTeamId( sceneId, selfId ) )
	LuaFnSetCopySceneData_Param( sceneId, x805042_g_keySD["playerLevel"], mylevel)
	LuaFnSetCopySceneData_Param( sceneId, x805042_g_keySD["killMonsterNum"] , 0)	
	LuaFnSetCopySceneData_Param( sceneId, x805042_g_keySD["genMonsterNum"] , 0)	

	local x,z = GetWorldPos( sceneId, selfId )

	LuaFnSetCopySceneData_Param( sceneId, x805042_g_keySD["x"], x805042_g_Back_X )
	LuaFnSetCopySceneData_Param( sceneId, x805042_g_keySD["z"], x805042_g_Back_Z )

	LuaFnSetSceneLoad_Monster( sceneId, "protectguild_monster.ini" )

	LuaFnSetCopySceneData_Param(sceneId, CopyScene_LevelGap, mylevel - iniLevel) --c别差,CopyScene_LevelGap T読  scene.lua 中赋值

	local bRetSceneID = LuaFnCreateCopyScene( sceneId )						--初始化完成后调用创建副本函数
	if bRetSceneID > 0 then
		x805042_NotifyTip( sceneId, selfId, "D竎h chuy琻 th鄋h c鬾g" )
		return 1
	else
		x805042_NotifyTip( sceneId, selfId, "B鋘 sao s� l唼ng 疸 鹫t th唼ng h課, th飊h ch� m祎 ch鷗 th� l読!" )
		return 0
	end

end

--**********************************
--继续
--**********************************
function x805042_OnContinue( sceneId, selfId, targetId )

end

--**********************************
--检测喧ng否可以提交
--**********************************
function x805042_CheckSubmit( sceneId, selfId, selectRadioId )


end

--**********************************
--提交
--**********************************
function x805042_OnSubmit( sceneId, selfId, targetId, selectRadioId )

end

--**********************************
--杀死怪物或玩家
--**********************************
function x805042_OnKillObject( sceneId, selfId, objdataId, objId )

end



--**********************************
--进入区域事件
--**********************************
function x805042_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x805042_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--副本事件
--**********************************
function x805042_OnCopySceneReady( sceneId, destsceneId )
	--设置Th鄋h ph� 副本特殊数据
	LuaFnSetSceneCopySceneCityData(sceneId, destsceneId )
	LuaFnSetIsCityCopyScene( destsceneId, 1)

	--设置副本入口场景号
	LuaFnSetCopySceneData_Param( destsceneId, x805042_g_keySD["scn"], sceneId )
	local leaderguid = LuaFnGetCopySceneData_TeamLeader( destsceneId )
	local leaderObjId = LuaFnGuid2ObjId( sceneId, leaderguid )

	--找不到该玩家
	if leaderObjId == -1 then
		return
	end

	--处于无法执行逻辑to� 鸬 状态
	if LuaFnIsCanDoScriptLogic( sceneId, leaderObjId ) ~= 1 then
		return
	end

	--取 餴琺玩家附近to� 鸬 队友数量(包括自己)
	local numMem	= GetNearTeamCount( sceneId, leaderObjId )
	local member
	
	--活动统计
	LuaFnAuditQuest(sceneId, leaderObjId, x805042_g_MissionName.."-"..x805042_g_CopySceneName)

	local cityName = LuaFnCityGetNameBySceneId( sceneId )
	local strLog = format("CopyScene Start  SceneId=%d, CityName=%s", sceneId, cityName )
	AuditProtectGuild( sceneId, strLog)

	for	i=0, numMem-1 do
		member = GetNearTeamMember( sceneId, leaderObjId, i )

		if LuaFnIsCanDoScriptLogic( sceneId, member ) == 1 then			-- 处于可以执行逻辑to� 鸬 状态

			NewWorld( sceneId, member, destsceneId, x805042_g_Fuben_X, x805042_g_Fuben_Z )
			
			local strLog = format("Player Enter CopyScene  SceneId=%d, CityName=%s, PlayerGuid=%x", sceneId, cityName, LuaFnGetGUID(sceneId, member)  )
			AuditProtectGuild( sceneId, strLog)
			
			--活动统计
			LuaFnAuditQuest(sceneId, member, x805042_g_MissionName.."-"..x805042_g_CopySceneName)
		end
	end
	
end

--**********************************
--有玩家进入副本事件
--**********************************
function x805042_OnPlayerEnter( sceneId, selfId )
	--设� gi鈟劳龊蟾椿� 餴琺位置
	SetPlayerDefaultReliveInfo( sceneId, selfId, "%10", -1, "0", sceneId, x805042_g_Fuben_X, x805042_g_Fuben_Z )

end

--**********************************
--有玩家T読 副本中死亡事件
--**********************************
function x805042_OnHumanDie( sceneId, selfId, killerId )
--	x = LuaFnGetCopySceneData_Param( sceneId, x805042_g_keySD["x"] )
--	z = LuaFnGetCopySceneData_Param( sceneId, x805042_g_keySD["z"] )
--	NewWorld( sceneId, selfId, oldsceneId, x, z )

	SetPlayerDefaultReliveInfo( sceneId, selfId, "%10", -1, "0", sceneId, x805042_g_Fuben_X, x805042_g_Fuben_Z )
end

--**********************************
--副本场景定时器事件
--**********************************
function x805042_OnCopySceneTimer( sceneId, nowTime )

	--副本时钟读取及设置
	--取 餴琺已经执行to� 鸬 定时次数
	local TickCount = LuaFnGetCopySceneData_Param( sceneId, x805042_g_keySD["tim"] )
	TickCount = TickCount + 1
	--设置新to� 鸬 定时器调用次数
	LuaFnSetCopySceneData_Param( sceneId, x805042_g_keySD["tim"], TickCount )
	
	x805042_g_CurrentStage = LuaFnGetCopySceneData_Param( sceneId, x805042_g_keySD["currStage"] )

	--副本关闭标志
	local leaveFlag = LuaFnGetCopySceneData_Param( sceneId, x805042_g_keySD["cls"] )

	local membercount = LuaFnGetCopyScene_HumanCount( sceneId )
	local mems = {}
	local i

	if membercount==0 and leaveFlag~=1 then
		LuaFnSetCopySceneData_Param( sceneId, x805042_g_keySD["cls"], 1 )
		return
	end

	for	i=0, membercount-1 do
		mems[i] = LuaFnGetCopyScene_HumanObjId( sceneId, i )
	end

	--C 离开
	if leaveFlag == 1 then
		--离开倒计时间to� 鸬 读取和设置
		local leaveTickCount = LuaFnGetCopySceneData_Param( sceneId, x805042_g_keySD["dwn"] )
		leaveTickCount = leaveTickCount + 1
		LuaFnSetCopySceneData_Param( sceneId, x805042_g_keySD["dwn"], leaveTickCount )

		if leaveTickCount >= x805042_g_CloseTick then										--倒计时间到,大家都出去吧
			local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, x805042_g_keySD["scn"] )	--取 餴琺副本入口场景号

			--将当前副本场景里to� 鸬 所有人传送回原来进入时候to� 鸬 场景
			for	i=0, membercount-1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					x = LuaFnGetCopySceneData_Param( sceneId, x805042_g_keySD["x"] )
					z = LuaFnGetCopySceneData_Param( sceneId, x805042_g_keySD["z"] )
					NewWorld( sceneId, mems[i], oldsceneId, x, z )
				end
			end

		elseif leaveTickCount < x805042_g_CloseTick then
			--通知当前副本场景里to� 鸬 所有人,场景关闭倒计时间
			local strText = format( "Ho鄋 t nhi甿 v�, trong v騨g %d gi鈟 n鎍 s� r秈 kh鰅.", (x805042_g_CloseTick-leaveTickCount) * x805042_g_TickTime )

			x805042_TipAllHuman( sceneId,  strText)
		end
	end
	
	
	if x805042_g_CurrentStage == 0 then
		local strText = "";
		
		if TickCount >= x805042_g_StartTick then
			x805042_g_CurrentStage = 1
			LuaFnSetCopySceneData_Param( sceneId, x805042_g_keySD["currStage"] , x805042_g_CurrentStage)
			
			--生成怪物
			x805042_GenObj( sceneId, 1 )
			
			strText = "Cu礳 chi猲 b 馥u!";
			
			x805042_TipAllHuman( sceneId,  strText)
			x805042_TipAllHuman( sceneId,  "Gi猼 ch猼 S絥 Qu� trong v騨g 15 ph鷗")
			
		else
			strText = format("Sau %ds cu礳 chi猲 b 馥u!", (x805042_g_StartTick - TickCount) * x805042_g_TickTime);
			x805042_TipAllHuman( sceneId,  strText)
		end
	end
	
	if x805042_g_CurrentStage == 1 then
		
		local killNum = LuaFnGetCopySceneData_Param( sceneId, x805042_g_keySD["killMonsterNum"] )	
		local genNum = LuaFnGetCopySceneData_Param( sceneId, x805042_g_keySD["genMonsterNum"] )	
		
		if killNum == genNum then
			x805042_g_CurrentStage = 2
			LuaFnSetCopySceneData_Param( sceneId, x805042_g_keySD["currStage"] , x805042_g_CurrentStage)
			
			--生成怪物
			x805042_GenObj( sceneId, 2 )
		
				
			return
		end
		
		if TickCount >= x805042_g_FirstStage then
			--此处设置副本任务有时间限制to� 鸬 情况,当时间到后处理...
			x805042_TipAllHuman( sceneId,  "Nhi甿 v� th b読!")
	
			--设置副本关闭标志
			LuaFnSetCopySceneData_Param( sceneId, x805042_g_keySD["cls"], 1 )
		end
		
		local msgTick = 0
		for msgTick = 1, getn(x805042_g_FirstStage_msg) do
			if TickCount == x805042_g_FirstStage_msg[msgTick] then
				local tickMsg = format("Gi猼 ch猼 t c� S絥 Qu�, c騨 th譨 th秈 gian %d gi鈟", (x805042_g_FirstStage-TickCount)*x805042_g_TickTime)
				x805042_TipAllHuman( sceneId,  tickMsg)
				break
			end
		end
	end
	
	if x805042_g_CurrentStage == 2 then
		local killNum = LuaFnGetCopySceneData_Param( sceneId, x805042_g_keySD["killMonsterNum"] )	
		local genNum = LuaFnGetCopySceneData_Param( sceneId, x805042_g_keySD["genMonsterNum"] )	
		
		if killNum == genNum then
			--设置副本关闭标志
			LuaFnSetCopySceneData_Param( sceneId, x805042_g_keySD["cls"], 1 )
		end
	end
	
	local killNum = LuaFnGetCopySceneData_Param( sceneId, x805042_g_keySD["killMonsterNum"] )	
	local genNum = LuaFnGetCopySceneData_Param( sceneId, x805042_g_keySD["genMonsterNum"] )	
	--x805042_TipAllHuman(sceneId, killNum.." / "..genNum )
end


function x805042_GenObj( sceneId, stageid )
	if x805042_g_monster_list[stageid] == nil then
		return
	end
	
    local IndexList = x805042_g_monster_list[stageid].MonsterList
    local IndexListSize = getn( IndexList )
    
    local i=1
    local str
    for i=1, IndexListSize do        
		local MonsterId = x805042_CreateNpc( sceneId, IndexList[i].mType, IndexList[i].x, IndexList[i].z, IndexList[i].aiType, IndexList[i].aiScript, IndexList[i].scriptId, IndexList[i].deltLevel )
    end
end


--**********************************
-- 通用创建怪物函数
--**********************************
function x805042_CreateNpc(sceneId, NpcId, x, y, Ai, AiFile, Script, deltLevel)
	local PlayerLevel = LuaFnGetCopySceneData_Param( sceneId, x805042_g_keySD["playerLevel"])
	local ModifyLevel = 0
	
	--PrintStr("  "..PlayerLevel.." "..x.." "..y.." ")
	
	if PlayerLevel > 80   then
		ModifyLevel = 1
	end
	if PlayerLevel > 90   then
		ModifyLevel = 2
	end
	if PlayerLevel > 100   then         
		ModifyLevel = 3
	end
	if PlayerLevel > 110   then         
		ModifyLevel = 4
	end
	if PlayerLevel > 120   then         
		ModifyLevel = 5
	end
	if PlayerLevel > 130   then         
		ModifyLevel = 6
	end
	if PlayerLevel > 140   then         
		ModifyLevel = 7
	end
	local nNpcId = NpcId + ModifyLevel-1
	local nMonsterId = LuaFnCreateMonster(sceneId, nNpcId, x, y, Ai, AiFile, Script)
	SetLevel(sceneId, nMonsterId, PlayerLevel + deltLevel)
	
	-- 看有没有设置称号,有就加称号
	--x805042_SetNpcTitle(sceneId, nMonsterId)
	local strNpcName = GetName(sceneId, nMonsterId )
	if (strNpcName == "姓i S絥 Qu�") or (strNpcName == "S絥 Th") then
			SetCharacterTitle(sceneId, nMonsterId, "Th誧h 馥u qu醝 nh鈔")
	end
	
	return nMonsterId
end


--**********************************
--醒目提示
--**********************************
function x805042_NotifyTip( sceneId, selfId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end

--**********************************
--对话窗口信息提示
--**********************************
function x805042_MsgBox( sceneId, selfId, targetId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

end

function x805042_MsgBox_With_Help( sceneId, selfId, targetId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
		AddNumText( sceneId, x805042_g_ScriptId, "V� b鋙 h� bang h礽" ,11 ,2)
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

end

--**********************************
--提示所有副本内玩家
--**********************************
function x805042_TipAllHuman( sceneId, Str )
	--  鹫t 疬㧟场景里头to� 鸬 所有人
	local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
	
	-- 没有人to� 鸬 场景,什么都不做
	if nHumanNum < 1 then
		return
	end
	
	for i=0, nHumanNum-1  do
		local PlayerId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		
		if LuaFnIsObjValid( sceneId, PlayerId ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, PlayerId ) == 1 then
			BeginEvent(sceneId)
				AddText(sceneId, Str)
			EndEvent(sceneId)
			DispatchMissionTips(sceneId, PlayerId)
		end
	end
end


--玩家进入m祎 c醝 area 时触发
function x805042_OnEnterArea( sceneId, selfId )
	local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, x805042_g_keySD["scn"] )	--取 餴琺副本入口场景号
	local x = LuaFnGetCopySceneData_Param( sceneId, x805042_g_keySD["x"] )
	local z = LuaFnGetCopySceneData_Param( sceneId, x805042_g_keySD["z"] )

	NewWorld( sceneId, selfId, oldsceneId, x, z )
end

--玩家T読 m祎 c醝 area 呆了m祎 段时间没走则定时触发
function x805042_OnTimer( sceneId, selfId )

end

--玩家离开m祎 c醝 area 时触发
function x805042_OnLeaveArea( sceneId, selfId )
	
end

--拾取物品
function x805042_OnPlayerPickUpItem( sceneId, selfId, itemId, bagidx )


end
