-- 连环副本任务
-- 黄金之链

--************************************************************************
--MisDescBegin

-- 脚本号
x050220_g_ScriptId = 050220

---- 任务号
x050220_g_MissionId = 1256					--1256 黄金之链--1257 玄佛珠--1258 熔岩之地

---- 上m祎 c醝任务to� 鸬  ID
---- g_MissionIdPre = 1260

---- M鴆 ti陁 nhi甿 v� NPC
x050220_g_Name = "H� Duy畉"

--任务归类
x050220_g_MissionKind = 8

--衅ng c nhi甿 v� 
x050220_g_MissionLevel = 10000

-- 任务文本描述
x050220_g_MissionName = "Ho鄋 Kim Chi Li阯"
x050220_g_MissionInfo = "    "														-- 任务描述
x050220_g_MissionTarget = "    #{LLFBM_80918_1}"						-- M鴆 ti陁 nhi甿 v�
--x050220_g_ContinueInfo = "    你们准备好了就请前去竹林消灭红熊王!"					-- 未Ho鄋 t nhi甿 v鴗o� 鸬 npc对话
x050220_g_SubmitInfo = "#{LLFB_80816_19}"										-- 提交时to� 鸬 答复
x050220_g_MissionComplete = "#{LLFB_80902_1}"	--Ho鄋 t nhi甿 v鴑pc说to� 鸬 话

x050220_g_IsMissionOkFail = 0														-- 0号索引: 当前任务喧ng否完成(0未完成；1完成；2th b読)
x050220_g_IsSmallMonster = 1														-- 1 号索引: 杀玄雷坡土匪to� 鸬 数量
x050220_g_IsBossNiuQu = 2																-- 2 号索引: 杀Ng遳 Kh鷆to� 鸬 数量
x050220_g_IsBossNiuQi = 3																-- 3 号索引: 杀Ng遳 K蟭o� 鸬 数量
x050220_g_IsBossWang = 4																-- 4 号索引: 杀V呓ng Di阭to� 鸬 数量
x050220_g_IsFindGoods = 5																-- 5 号索引: 喧ng否找到黄金之链
x050220_g_Param_sceneid = 6															-- 6号索引: 当前任务数据to� 鸬 6位置设置为场景ID

-- 任务完成情况,内容动态刷新,从任务参数to� 鸬 第1位开始
x050220_g_Custom	= { {id="秀 gi猼 ch猼 #r  Huy玭 L鬷 Pha th� ph�",num=60},{id="  Ng遳 Kh鷆",num=1},{id="  Ng遳 K�",num=1},{id="  V呓ng Di阭",num=1},{id="秀 t靘 th:#r  Ho鄋g kim chi li阯",num=1} }

--MisDescEnd
--************************************************************************

x050220_g_huangjinzhilian = 40004453	--黄金之链
x050220_g_heyuanxin = 40004460	--何悦to� 鸬 信

x050220_g_SmallMonster = "Huy玭 L鬷 Pha th� ph�"			--小怪
x050220_g_NiuQu = "Ng遳 Kh鷆"							--Ng遳 Kh鷆
x050220_g_NiuQi = "Ng遳 K�"							--Ng遳 K�
x050220_g_BossWang = "V呓ng Di阭"					-- boss V呓ng Di阭

SmallMonsterIDTbl = {13000,13001,13002,13003,13004,13005,13006,13007,13008,13009}			--小怪
NiuQuIDTbl = {13020,13021,13022,13023,13024,13025,13026,13027,13028,13029}							--Ng遳 Kh鷆
NiuQiIDTbl = {13040,13041,13042,13043,13044,13045,13046,13047,13048,13049}							--Ng遳 K�
BossWangIDTbl = {13060,13061,13062,13063,13064,13065,13066,13067,13068,13069}					-- bossV呓ng Di阭

x050220_g_SmallMonsterAPos = { --A地小怪坐标
{124,	201},{128,	201},{136,	201},{142,	201},{148,	197},
{148,	193},{148,	189},{148,	186},{148,	181},{143,	174},
{138,	174},{132,	174},{126,	174},{159,	183},{159,	189}}

x050220_g_SmallMonsterBPos = { --B地小怪坐标
{55,	85},{64,	85},{75,	85},{86,	84},{97,	84},
{107,	84},{107,	70},{97,	71},{85,	69},{74,	68},
{64,	68},{55,	68},{53,	56},{75,	57},{85,	58},
{56,	45},{75,	46},{85,	46},{61,	37},{66,	37}}

x050220_g_SmallMonsterCPos = { --C地小怪坐标
{165,	43},{171,	43},{168,	45},{166,	49},{172,	49},
{157,	61},{164,	61},{160,	64},{157,	68},{164,	67},
{176,	60},{182,	61},{179,	63},{176,	66},{182,	66},
{173,	79},{178,	81},{175,	82},{171,	84},{177,	86},
{197,	68},{205,	70},{200,	72},{196,	74},{204,	76}
}

x050220_g_NumText_Main = 1					-- 接任务to� 鸬 选项
x050220_g_NumText_EnterCopyScene = 2		-- 要求进入副本to� 鸬 选项

x050220_g_CopySceneMap = "xuanmuchang.nav"
x050220_g_CopySceneArea = "xuanmuchang_area.ini"
x050220_g_CopySceneMonsterIni = "xuanmuchang_monster.ini"

x050220_g_CopySceneType = FUBEN_HUANGJINZHILIAN		-- 副本类型,定义T読 ScriptGlobal.lua里面
x050220_g_LimitMembers = 1					-- 可以进副本to� 鸬 最小队伍人数
--x050220_g_LevelLimit = 30					-- 可以进入副本to� 鸬 最低c别
x050220_g_TickTime = 5						-- 回调脚本to� 鸬 时钟时间(单位:  gi鈟/次)
x050220_g_LimitTotalHoldTime = 360			-- 副本可以存活to� 鸬 时间(单位: 次数),如果此时间到了,则任务将会th b読
x050220_g_CloseTick = 6						-- 副本关闭前倒计时(单位: 次数)
x050220_g_NoUserTime = 30					-- 副本中没有人后可以继续保存to� 鸬 时间(单位:  gi鈟)

x050220_g_Fuben_X = 38
x050220_g_Fuben_Z = 220
x050220_g_Back_X = 295
x050220_g_Back_Z = 68

x050220_g_TakeTimes = 10											-- 每天最多L頽h 次数
--**********************************
-- 任务入口函数
--**********************************
function x050220_OnDefaultEvent( sceneId, selfId, targetId )	--  餴琺击该任务后执行此脚本
	if GetName( sceneId, targetId ) ~= x050220_g_Name then		-- 判断该npc喧ng否喧ng对应任务to� 鸬 npc
		return
	end

	local numText = GetNumText()

	if IsHaveMission( sceneId, selfId, x050220_g_MissionId ) == 0 then
		if numText == x050220_g_NumText_Main then
			if x050220_CheckAccept( sceneId, selfId, targetId ) > 0 then
				--发送任务Ti猵 th毕允総o� 鸬 信息
				BeginEvent( sceneId )
					AddText( sceneId, "#{LLFB_80816_2}" )
				EndEvent( )
				DispatchMissionInfo( sceneId, selfId, targetId, x050220_g_ScriptId, x050220_g_MissionId )
			end
		end
	else
		if numText == x050220_g_NumText_Main then
			local bDone = x050220_CheckSubmit( sceneId, selfId )

			BeginEvent( sceneId )
				--AddText( sceneId, x050220_g_MissionName )
	
				if bDone == 1 then
					AddText( sceneId, x050220_g_SubmitInfo )
				else
						AddText( sceneId, "#{LLFB_80816_8}" )
						AddNumText( sceneId, x050220_g_ScriptId, "Ti猲 v鄌 Huy玭 L鬷 Pha", 10, x050220_g_NumText_EnterCopyScene )
						EndEvent( sceneId )
					DispatchEventList( sceneId, selfId, targetId )
					return
				end
			EndEvent( )
			--DispatchMissionDemandInfo( sceneId, selfId, targetId, x050220_g_ScriptId, x050220_g_MissionId, bDone )
			DispatchMissionContinueInfo( sceneId, selfId, targetId, x050220_g_ScriptId, x050220_g_MissionId )
		elseif numText == x050220_g_NumText_EnterCopyScene then
			x050220_AcceptEnterCopyScene( sceneId, selfId, targetId )
		end
	end
end

--**********************************
-- 不能有其他to� 鸬 任务,没有Tr� v� 0,有Tr� v� 1
--**********************************
function x050220_CheckConflictMission( sceneId, selfId )
	local missionId = 0

	for missionId = 1256+1, 1258 do
		if IsHaveMission( sceneId, selfId, missionId ) > 0 then
			return 1
		end
	end

	return 0
end

--**********************************
-- 列举事件
--**********************************
function x050220_OnEnumerate( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x050220_g_Name then		--判断该npc喧ng否喧ng对应任务to� 鸬 npc
		return
	end

	-- 不能有其他to� 鸬 任务
	if x050220_CheckConflictMission( sceneId, selfId ) == 1 then
		return
	end

	AddNumText( sceneId, x050220_g_ScriptId, x050220_g_MissionName, 4, x050220_g_NumText_Main )
end

--**********************************
-- 检测Ti猵 th跫�
--**********************************
function x050220_CheckAccept( sceneId, selfId, targetId )
	-- 已经接过则不符合条件
	if IsHaveMission( sceneId, selfId, x050220_g_MissionId ) > 0 then
		return 0
	end

	-- 不能有其他to� 鸬 任务
	if x050220_CheckConflictMission( sceneId, selfId ) == 1 then
		return 0
	end
	
	-- m祎 天只能领 x050220_g_TakeTimes 次
	local DayTimes, oldDate, nowDate, takenTimes

	DayTimes = GetMissionData( sceneId, selfId, MD_XINSANHUAN_1_DAYTIME )
	oldDate = mod( DayTimes, 100000 )
	takenTimes = floor( DayTimes/100000 )

	nowDate = GetDayTime()
	if nowDate ~= oldDate then
		takenTimes = 0
		SetMissionData( sceneId, selfId, MD_XINSANHUAN_1_DAYTIME, nowDate )
	end

	--5次
	if takenTimes >= x050220_g_TakeTimes then
		x050220_NotifyFailBox( sceneId, selfId, targetId, "#{LLFB_80816_3}" )
		return 0
	end

	-- 检测玩家喧ng否符合刚放弃任务
	local iTime = GetMissionData( sceneId, selfId, MD_XINSANHUAN_1_LAST )			-- 上m祎 次放弃任务to� 鸬 时间(单位: m祎 刻钟)
	--begin modified by zhangguoxin 090208
	--local CurTime = GetHourTime()												-- 当前时间(单位: m祎 刻钟)
	local CurTime = GetQuarterTime()												-- 当前时间(单位: m祎 刻钟)
	--end modified by zhangguoxin 090208

	if iTime+1  >= CurTime then
		x050220_NotifyFailBox( sceneId, selfId, targetId, "#{LLFB_80816_4}" )
		return 0
	end
	
	-- 等c达到75
	if GetLevel(sceneId, selfId) < 75 then
		x050220_NotifyFailBox( sceneId, selfId, targetId, "#{LLFB_80816_5}" )
		return 0
	end

	-- 所有心法达到45
	if x050220_CheckAllXinfaLevel(sceneId, selfId, 45) == 0  then
		x050220_NotifyFailBox( sceneId, selfId, targetId, "#{LLFB_80816_5}" )
		return 0
	end

	-- 身上任务数量喧ng否达到上限20c醝
	if GetMissionCount( sceneId, selfId ) >= 20 then						
		x050220_NotifyFailBox( sceneId, selfId, targetId, "#{LLFB_80816_6}" )
		return 0
	end

	return 1
end

--**********************************
--Ti猵 th�
--**********************************
function x050220_OnAccept( sceneId, selfId, targetId )
	-- 加入任务到玩家列表
	AddMission( sceneId, selfId, x050220_g_MissionId, x050220_g_ScriptId, 1, 0, 0 )			-- kill、area、item
	if IsHaveMission( sceneId, selfId, x050220_g_MissionId ) <= 0 then
		return
	end
	
	--C 扣除m祎 次中间任务物品黄金之链
	local num = LuaFnGetAvailableItemCount( sceneId, selfId, x050220_g_huangjinzhilian )
	if num > 0 then
		LuaFnDelAvailableItem( sceneId, selfId, x050220_g_huangjinzhilian, num )
	end
	
	-- m祎 天只能领 x050220_g_TakeTimes 次
	local DayTimes = GetMissionData( sceneId, selfId, MD_XINSANHUAN_1_DAYTIME )
	local takenTimes = floor( DayTimes/100000 )
	DayTimes = (takenTimes+1)*100000 + GetDayTime()
	SetMissionData( sceneId, selfId, MD_XINSANHUAN_1_DAYTIME, DayTimes )

--	SetMissionEvent( sceneId, selfId, x050220_g_MissionId, 4 ) -- 注册 OnLockedTarget 事件

	local misIndex = GetMissionIndexByID( sceneId, selfId, x050220_g_MissionId )

	SetMissionByIndex( sceneId, selfId, misIndex, x050220_g_IsMissionOkFail, 0 )	-- 任务完成情况置为未完成
	SetMissionByIndex( sceneId, selfId, misIndex, x050220_g_IsSmallMonster, 0 )
	SetMissionByIndex( sceneId, selfId, misIndex, x050220_g_IsBossNiuQu, 0 )
	SetMissionByIndex( sceneId, selfId, misIndex, x050220_g_IsBossNiuQi, 0 )
	SetMissionByIndex( sceneId, selfId, misIndex, x050220_g_IsBossWang, 0 )
	SetMissionByIndex( sceneId, selfId, misIndex, x050220_g_IsFindGoods, 0 )
	SetMissionByIndex( sceneId, selfId, misIndex, x050220_g_Param_sceneid, -1 )		-- 副本号置为 -1

	--显示内容告诉玩家已经Ti猵 th巳挝�
	BeginEvent( sceneId )
		AddText( sceneId, "#{LLFB_80816_8}" )
		AddNumText( sceneId, x050220_g_ScriptId, "Ti猲 v鄌 Huy玭 L鬷 Pha", 10, x050220_g_NumText_EnterCopyScene )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
-- 请求进入副本场景
--**********************************
function x050220_AcceptEnterCopyScene( sceneId, selfId, targetId )
	if IsHaveMission( sceneId, selfId, x050220_g_MissionId ) > 0 then					-- 有任务才可以走这里
		local misIndex = GetMissionIndexByID( sceneId, selfId, x050220_g_MissionId )
		local copysceneid = GetMissionParam( sceneId, selfId, misIndex, x050220_g_Param_sceneid )
		if copysceneid >= 0 then												-- 进过副本
		-- 将自己传送到副本场景
			if GetMissionParam( sceneId, selfId, misIndex, x050220_g_IsMissionOkFail ) == 2 then
				x050220_NotifyFailBox( sceneId, selfId, targetId, "#{LLFB_80816_7}" )
			elseif IsCanEnterCopyScene( copysceneid, GetHumanGUID( sceneId, selfId ) ) == 1 then
				NewWorld( sceneId, selfId, copysceneid, x050220_g_Fuben_X, x050220_g_Fuben_Z )
			else
				x050220_NotifyFailBox( sceneId, selfId, targetId, "#{LLFB_80816_7}" )
			end
			return
		end

		if LuaFnHasTeam( sceneId, selfId ) == 0 then
			x050220_NotifyFailBox( sceneId, selfId, targetId, "#{LLFB_80816_9}" )
			return
		end

		if LuaFnIsTeamLeader( sceneId, selfId ) == 0 then
			x050220_NotifyFailBox( sceneId, selfId, targetId, "#{LLFB_80816_10}" )
			return
		end
		
		local teamMemberCount = GetTeamMemberCount(sceneId, selfId);
		local nearMemberCount = GetNearTeamCount(sceneId, selfId);
		if not nearMemberCount or nearMemberCount < x050220_g_LimitMembers then
			x050220_NotifyFailBox( sceneId, selfId, targetId, "#{LLFB_80816_11}" )
			return
		end

		if not teamMemberCount or teamMemberCount ~= nearMemberCount then
			x050220_NotifyFailBox( sceneId, selfId, targetId, "#{LLFB_80816_12}" )
			return
		end
		
		local outmessage = "#{FB0}"
		local issatisfy = 1 --喧ng否Th鯽 m鉵条件
		local memberID = 0
		local isAccept = 0 --喧ng否有人已经接了任务
		local Acceptmessage = "" --已经接了任务to� 鸬 提示与其他公共提示不同
		for	i = 0, nearMemberCount - 1 do
			memberID = GetNearTeamMember( sceneId, selfId, i )
			outmessage = outmessage.."#r#BTh鄋h vi阯  "..GetName(sceneId, memberID)
			if GetLevel(sceneId, memberID) >= 75 then
				outmessage = outmessage.."#{FB1}"
			else
				outmessage = outmessage.."#{FB2}"
				issatisfy = 0
			end
			
			if x050220_CheckAllXinfaLevel(sceneId, memberID, 45) == 1 then
				outmessage = outmessage.."#{FB3}"
			else
				outmessage = outmessage.."#{FB4}"
				issatisfy = 0
			end
			
			if IsHaveMission( sceneId, memberID, x050220_g_MissionId ) > 0 then --喧ng否有任务
				local misIndex = GetMissionIndexByID( sceneId, memberID, x050220_g_MissionId )

			 	if GetMissionParam( sceneId, memberID, misIndex, x050220_g_IsMissionOkFail ) == 0 then --喧ng否喧ngth b読to� 鸬 任务
			 		if GetMissionParam( sceneId, memberID, misIndex, x050220_g_Param_sceneid ) == -1 then --喧ng否喧ng已接to� 鸬 任务
						outmessage = outmessage.."#{FB5}"
					else
						outmessage = outmessage.."#{FB6}"
						issatisfy = 0
						
						if isAccept == 0 then
							Acceptmessage = "#G"..GetName(sceneId, memberID)
						else
							Acceptmessage = Acceptmessage.."#W,#G"..GetName(sceneId, memberID)
						end
						isAccept = 1
					end
				else
					outmessage = outmessage.."#{FB6}"
					issatisfy = 0
				end
			else
				outmessage = outmessage.."#{FB6}"
				issatisfy = 0
			end
		end

		if isAccept == 1 then
			Acceptmessage = "#{FB7}"..Acceptmessage.."#{FB8}"
			x050220_NotifyFailBox( sceneId, selfId, targetId, Acceptmessage)
			return
		end
		
		if issatisfy == 0 then
			x050220_NotifyFailBox( sceneId, selfId, targetId, outmessage)
			return
		end
		
		--计算副本中怪to� 鸬 等c....
		local mylevel = 0
		local memId
		local tempMemlevel = 0
		local level0 = 0
		local level1 = 0
	
		for	i = 0, nearMemberCount - 1 do
			memId = GetNearTeamMember(sceneId, selfId, i)
			tempMemlevel = GetLevel(sceneId, memId)
			level0 = level0 + (tempMemlevel ^ 4 )
			level1 = level1 + (tempMemlevel ^ 3 )
		end
	
		if level1 == 0 then
			mylevel = 0
		else
			mylevel = level0/level1
		end
	
		if nearMemberCount == -1 then
			mylevel = GetLevel(sceneId, selfId)
		end
	
		--计算等c段....
		local PlayerMaxLevel = GetHumanMaxLevelLimit()
		local iniLevel
		if mylevel < 10 then
			iniLevel = 1
		elseif mylevel < PlayerMaxLevel then
			iniLevel = floor((mylevel-75)/5) + 1
			if iniLevel < 0 then
				iniLevel = 1
			elseif iniLevel > 10 then
				iniLevel = 10
			end
		else
			iniLevel = 10
		end
	
		local smallmonsterId = SmallMonsterIDTbl[1]
		if SmallMonsterIDTbl[iniLevel] then
			smallmonsterId = SmallMonsterIDTbl[iniLevel]
		end
		
		local NiuquId = NiuQuIDTbl[1]
		if NiuQuIDTbl[iniLevel] then
			NiuquId = NiuQuIDTbl[iniLevel]
		end
		
		local NiuqiId = NiuQiIDTbl[1]
		if NiuQiIDTbl[iniLevel] then
			NiuqiId = NiuQiIDTbl[iniLevel]
		end
		
		local BossWangID = BossWangIDTbl[1]
		if BossWangIDTbl[iniLevel] then
			BossWangID = BossWangIDTbl[iniLevel]
		end
		
		--PrintStr("smallmonsterId"..smallmonsterId.." NiuquId"..NiuquId.." NiuqiId"..NiuqiId.." BossWangID"..BossWangID.." mylevel"..mylevel.." iniLevel"..iniLevel)

		local leaderguid = LuaFnObjId2Guid( sceneId, selfId )
		LuaFnSetSceneLoad_Map( sceneId, x050220_g_CopySceneMap )						-- 地图喧ng必须选取to� 鸬 ,而且必须T読 Config/SceneInfo.ini里配置好
		LuaFnSetCopySceneData_TeamLeader( sceneId, leaderguid )
		LuaFnSetCopySceneData_NoUserCloseTime( sceneId, x050220_g_NoUserTime * 1000 )
		LuaFnSetCopySceneData_Timer( sceneId, x050220_g_TickTime * 1000 )
		LuaFnSetCopySceneData_Param( sceneId, 0, x050220_g_CopySceneType )				-- 设置副本数据,这里将0号索引to� 鸬 数据设置为999,用于表示副本号999(数字自定义)
		LuaFnSetCopySceneData_Param( sceneId, 1, x050220_g_ScriptId )					-- 将1号数据设置为副本场景事件脚本号
		LuaFnSetCopySceneData_Param( sceneId, 2, 0 )							-- 设置定时器调用次数
		LuaFnSetCopySceneData_Param( sceneId, 3, -1 )							-- 设置副本入口场景号, 初始化
		LuaFnSetCopySceneData_Param( sceneId, 4, 0 )							-- 设置副本关闭标志, 0开放,1关闭
		LuaFnSetCopySceneData_Param( sceneId, 5, 0 )							-- 设置离开倒计时次数
		LuaFnSetCopySceneData_Param( sceneId, 6, GetTeamId( sceneId, selfId ) )	-- 保存队伍号
		LuaFnSetCopySceneData_Param( sceneId, 7, 0 )							-- 杀小怪to� 鸬 数量
		LuaFnSetCopySceneData_Param( sceneId, 8, 0 )							-- 喧ng否杀死牛区
		LuaFnSetCopySceneData_Param( sceneId, 9, 0 )							-- 喧ng否杀死Ng遳 K�
		LuaFnSetCopySceneData_Param( sceneId, 10, 0 )							-- 喧ng否刷出了boss王
		LuaFnSetCopySceneData_Param( sceneId, 11, 0 )							-- 如果要提醒to� 鸬 话,上次提醒时间(因为每2分提醒m祎 次,C 记录m祎 c醝上次提醒时间)
		LuaFnSetCopySceneData_Param( sceneId, 12, smallmonsterId )-- 
		LuaFnSetCopySceneData_Param( sceneId, 13, NiuquId )				-- 
		LuaFnSetCopySceneData_Param( sceneId, 14, NiuqiId )				-- 
		LuaFnSetCopySceneData_Param( sceneId, 15, BossWangID )		-- 
		LuaFnSetCopySceneData_Param( sceneId, 16, mylevel )			-- 

		LuaFnSetSceneLoad_Area( sceneId, x050220_g_CopySceneArea )

		LuaFnSetSceneLoad_Monster( sceneId, x050220_g_CopySceneMonsterIni )

		local bRetSceneID = LuaFnCreateCopyScene( sceneId )						-- 初始化完成后调用创建副本函数
		if bRetSceneID > 0 then
			x050220_NotifyFailTips( sceneId, selfId, "D竎h chuy琻 th鄋h c鬾g!" )
			AuditXinSanHuanCreateFuben( sceneId, selfId, 1 )
		else
			x050220_NotifyFailTips( sceneId, selfId, "S� l唼ng b鋘 sao 疸 皙n gi緄 h課, 皤 ngh� l醫 n鎍 th� l読!" )
		end
	end
end

--**********************************
--副本事件
--**********************************
function x050220_OnCopySceneReady( sceneId, destsceneId )
	LuaFnSetCopySceneData_Param( destsceneId, 3, sceneId )				-- 设置副本入口场景号
	local leaderguid = LuaFnGetCopySceneData_TeamLeader( destsceneId )
	local leaderObjId = LuaFnGuid2ObjId( sceneId, leaderguid )

	if leaderObjId == -1 then											-- 找不到该玩家
		return
	end

	if LuaFnIsCanDoScriptLogic( sceneId, leaderObjId ) ~= 1 then		-- 处于无法执行逻辑to� 鸬 状态
		return
	end

	--取 餴琺玩家附近to� 鸬 队友数量(包括自己)
	local i, nearMemberCount, member
	local members = {}
	local validmembercount = 0

	nearMemberCount = GetNearTeamCount( sceneId, leaderObjId )
	for i = 0, nearMemberCount - 1 do
		member = GetNearTeamMember( sceneId, leaderObjId, i )
		if IsHaveMission( sceneId, member, x050220_g_MissionId ) > 0 then		-- 有任务
			validmembercount = validmembercount + 1
			members[validmembercount] = member
		end
	end

	local misIndex
	for i = 1, validmembercount do
		if IsHaveMission( sceneId, members[i], x050220_g_MissionId ) > 0 then
			misIndex = GetMissionIndexByID( sceneId, members[i], x050220_g_MissionId )

			if LuaFnIsCanDoScriptLogic( sceneId, members[i] ) == 1 then			-- 处于可以执行逻辑to� 鸬 状态
				--将任务to� 鸬 第1号数据设置为副本to� 鸬 场景号
				SetMissionByIndex( sceneId, members[i], misIndex, x050220_g_Param_sceneid, destsceneId )
		--		SetMissionEvent( sceneId, members[i], x050220_g_MissionId, 0 )			-- 关心杀怪事件
				NewWorld( sceneId, members[i], destsceneId, x050220_g_Fuben_X, x050220_g_Fuben_Z )
			end
		end
	end
end

--**********************************
--有玩家进入副本事件
--**********************************
function x050220_OnPlayerEnter( sceneId, selfId )
end

--**********************************
--obj死亡
--**********************************
function x050220_OnDie( sceneId, objId, selfId )--C醝 n鄖 selfId可能喧ng宠物
	local objType = GetCharacterType( sceneId, selfId )
	if objType == 3 then --如果喧ng宠物to� 鸬 话,把C醝 n鄖 ID设置成主人ID
		selfId = GetPetCreator( sceneId, selfId )
	end
	
	if selfId == -1 then
		return
	end

	--if IsHaveMission( sceneId, selfId, x050220_g_MissionId ) <= 0 then
	--	return
	--end
	
	--喧ng否喧ng副本
	local sceneType = LuaFnGetSceneType( sceneId )
	if sceneType ~= 1 then
		return
	end

	--喧ng否喧ng所C to� 鸬 副本
	local fubentype = LuaFnGetCopySceneData_Param( sceneId, 0 )
	if fubentype ~= x050220_g_CopySceneType then
		return
	end

	--副本关闭标志
	local leaveFlag = LuaFnGetCopySceneData_Param( sceneId, 4 )
	if leaveFlag == 1 then														-- 如果副本已经被置成关闭状态,则杀怪无效
		return
	end

	--取 餴琺当前场景里to� 鸬 人数
	local num = LuaFnGetCopyScene_HumanCount( sceneId )
	local mems = {}
	
	for i = 0, num - 1 do
		mems[i] = LuaFnGetCopyScene_HumanObjId( sceneId, i )
	end

	--取 餴琺杀死怪物to� 鸬 name
	local szName = GetName( sceneId, objId )
	if szName == x050220_g_SmallMonster then--小怪Group
		local KilledMonsterNum = LuaFnGetCopySceneData_Param( sceneId, 7 )
		KilledMonsterNum = KilledMonsterNum + 1
		
		local misIndex = 0
		for i = 0, num - 1 do
			if LuaFnIsObjValid( sceneId, mems[i] ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, mems[i] ) == 1 then						-- 不T読 场景to� 鸬 不做此操作
				x050220_NotifyFailTips( sceneId, mems[i], "秀 gi猼 "..szName..": "..KilledMonsterNum.."/60" )
				misIndex = GetMissionIndexByID( sceneId, mems[i], x050220_g_MissionId )
				SetMissionByIndex( sceneId, mems[i], misIndex, x050220_g_IsSmallMonster, KilledMonsterNum )
			end
		end
		
		LuaFnSetCopySceneData_Param( sceneId, 7, KilledMonsterNum ) --设置杀小怪数量
	elseif szName == x050220_g_NiuQu then--Ng遳 Kh鷆
		LuaFnSetCopySceneData_Param( sceneId, 8, 1 ) --设置Ng遳 Kh鷆标志
		
		local misIndex = 0
		for i = 0, num - 1 do
			if LuaFnIsObjValid( sceneId, mems[i] ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, mems[i] ) == 1 then						-- 不T読 场景to� 鸬 不做此操作
				x050220_NotifyFailTips( sceneId, mems[i], "秀 gi猼 "..szName..": 1/1" )
				misIndex = GetMissionIndexByID( sceneId, mems[i], x050220_g_MissionId )
				SetMissionByIndex( sceneId, mems[i], misIndex, x050220_g_IsBossNiuQu, 1 )
			end
		end
		
		local otherflag = LuaFnGetCopySceneData_Param( sceneId, 9 ) --取 餴琺另m祎 c醝boss标志
		local nMonsterNum = GetMonsterCount(sceneId)

		if otherflag == 0 then --另m祎 c醝boss没有死
			for i=0, nMonsterNum-1 do
				local MonsterId = GetMonsterObjID(sceneId,i)
				LuaFnSendSpecificImpactToUnit(sceneId,MonsterId,MonsterId,MonsterId,5960,0)
				if GetName( sceneId, MonsterId ) == x050220_g_NiuQi then
					--CallScriptFunction((200060), "Paopao",sceneId, x050220_g_NiuQi, "玄雷坡", "大哥, huynh 甬替你报仇!")
					MonsterTalk(sceneId,MonsterId,"Huy玭 L鬷 S叨n N鷌", "姓i ca, ti瑄 甬 b醥 th� cho huynh!")
				end
			end
		else
			for i=0, nMonsterNum-1 do
				local MonsterId = GetMonsterObjID(sceneId,i)
				LuaFnCancelSpecificImpact(sceneId,MonsterId,5959)
				LuaFnCancelSpecificImpact(sceneId,MonsterId,5960)
			end
		end
	elseif szName == x050220_g_NiuQi then--Ng遳 K�
		LuaFnSetCopySceneData_Param( sceneId, 9, 1 ) --设置Ng遳 K媳曛�
		
		local misIndex = 0
		for i = 0, num - 1 do
			if LuaFnIsObjValid( sceneId, mems[i] ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, mems[i] ) == 1 then						-- 不T読 场景to� 鸬 不做此操作
				x050220_NotifyFailTips( sceneId, mems[i], "秀 gi猼 "..szName..": 1/1" )
				misIndex = GetMissionIndexByID( sceneId, mems[i], x050220_g_MissionId )
				SetMissionByIndex( sceneId, mems[i], misIndex, x050220_g_IsBossNiuQi, 1 )
			end
		end
		
		local otherflag = LuaFnGetCopySceneData_Param( sceneId, 8 ) --取 餴琺另m祎 c醝boss标志
		local nMonsterNum = GetMonsterCount(sceneId)

		if otherflag == 0 then --另m祎 c醝boss没有死
			for i=0, nMonsterNum-1 do
				local MonsterId = GetMonsterObjID(sceneId,i)
				LuaFnSendSpecificImpactToUnit(sceneId,MonsterId,MonsterId,MonsterId,5960,0)
				if GetName( sceneId, MonsterId ) == x050220_g_NiuQu then
					--CallScriptFunction((200060), "Paopao",sceneId, x050220_g_NiuQu, "玄雷坡", " huynh 甬,大哥替你报仇!")
					MonsterTalk(sceneId,MonsterId,"Huy玭 L鬷 S叨n N鷌", " Huynh 甬, 鹫i ca b醥 th� cho ng呓i!")
				end
			end
		else
			for i=0, nMonsterNum-1 do
				local MonsterId = GetMonsterObjID(sceneId,i)
				LuaFnCancelSpecificImpact(sceneId,MonsterId,5959)
				LuaFnCancelSpecificImpact(sceneId,MonsterId,5960)
			end
		end
	elseif szName == x050220_g_BossWang then-- bossV呓ng Di阭
		local misIndex = 0
		
		for i = 0, num - 1 do
			if LuaFnIsObjValid( sceneId, mems[i] ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, mems[i] ) == 1 then						-- 不T読 场景to� 鸬 不做此操作
				x050220_NotifyFailTips( sceneId, mems[i], "秀 gi猼 "..szName..": 1/1" )
				misIndex = GetMissionIndexByID( sceneId, mems[i], x050220_g_MissionId )
				SetMissionByIndex( sceneId, mems[i], misIndex, x050220_g_IsBossWang, 1 )
				AddMonsterDropItem( sceneId, objId, mems[i], x050220_g_huangjinzhilian )
			end
		end
		
		local BroadcastMsg = "#{LLFB_80816_17}#W#{_INFOUSR$N}#{LLFB_80816_18}"
		BroadcastMsg = gsub( BroadcastMsg, "%$N", GetName( sceneId, selfId ) )
		BroadMsgByChatPipe( sceneId, selfId, BroadcastMsg, 4 )
		LuaFnSetCopySceneData_Param( sceneId, 4, 1 )--设置离开场景
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x050220_OnKillObject( sceneId, selfId, objdataId, objId )						-- 参数意思: 场景号、玩家objId、怪物表位置号、怪物objId
end

--**********************************
--有玩家T読 副本中死亡事件
--**********************************
function x050220_OnHumanDie( sceneId, selfId, killerId )
end

--**********************************
--离开副本
--**********************************
function x050220_Exit( sceneId, selfId )
	local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )				-- 取 餴琺副本入口场景号
	NewWorld( sceneId, selfId, oldsceneId, x050220_g_Back_X, x050220_g_Back_Z )
end

--**********************************
--继续
--**********************************
function x050220_OnContinue( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, x050220_g_MissionName )
		AddText( sceneId, "T痶 ti猵 t鴆" )
	EndEvent( )
	DispatchMissionContinueInfo( sceneId, selfId, targetId, x050220_g_ScriptId, x050220_g_MissionId )
end

--**********************************
--放弃
--**********************************
function x050220_OnAbandon( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x050220_g_MissionId ) == 0 then
		return
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x050220_g_MissionId )
	local copyscene = GetMissionParam( sceneId, selfId, misIndex, x050220_g_Param_sceneid )

	-- 设置放弃连环任务to� 鸬 时间
	--begin modified by zhangguoxin 090208
	--local CurTime = GetHourTime()											-- 当前时间
	local CurTime = GetQuarterTime()											-- 当前时间
	--end modified by zhangguoxin 090208
	SetMissionData( sceneId, selfId, MD_XINSANHUAN_1_LAST, CurTime )

	--删除玩家任务列表中对应to� 鸬 任务
	DelMission( sceneId, selfId, x050220_g_MissionId )
	
	--C 扣除m祎 次中间任务物品黄金之链
	local num = LuaFnGetAvailableItemCount( sceneId, selfId, x050220_g_huangjinzhilian )
	if num > 0 then
		LuaFnDelAvailableItem( sceneId, selfId, x050220_g_huangjinzhilian, num )
	end
	
	--喧ng否喧ng所C to� 鸬 副本
	local fubentype = LuaFnGetCopySceneData_Param( sceneId, 0 )

	if sceneId == copyscene and fubentype == x050220_g_CopySceneType then											-- 如果T読 副本里删除任务,则直接传送回
		x050220_NotifyFailTips( sceneId, selfId, "Nhi甿 v� th b読!" )
		local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )		-- 取 餴琺副本入口场景号
		NewWorld( sceneId, selfId, oldsceneId, x050220_g_Back_X, x050220_g_Back_Z )
	end
end

--**********************************
--副本场景定时器事件
--**********************************
function x050220_OnCopySceneTimer( sceneId, nowTime )
	--副本时钟读取及设置
	local TickCount = LuaFnGetCopySceneData_Param( sceneId, 2 )						-- 取 餴琺已经执行to� 鸬 定时次数
	TickCount = TickCount + 1
	LuaFnSetCopySceneData_Param( sceneId, 2, TickCount )							-- 设置新to� 鸬 定时器调用次数

	--副本关闭标志
	local leaveFlag = LuaFnGetCopySceneData_Param( sceneId, 4 )

	local membercount = LuaFnGetCopyScene_HumanCount( sceneId )
	local mems = {}
	local i

	for i = 0, membercount - 1 do
		mems[i] = LuaFnGetCopyScene_HumanObjId( sceneId, i )
	end

--	local LevelGap = LuaFnGetCopySceneData_Param( sceneId, CopyScene_LevelGap )

	if leaveFlag == 1 then															-- C 离开
		--离开倒计时间to� 鸬 读取和设置
		local leaveTickCount = LuaFnGetCopySceneData_Param( sceneId, 5 )
		leaveTickCount = leaveTickCount + 1
		LuaFnSetCopySceneData_Param( sceneId, 5, leaveTickCount )

		if leaveTickCount >= x050220_g_CloseTick then										-- 倒计时间到,大家都出去吧
			--将当前副本场景里to� 鸬 所有人传送回原来进入时候to� 鸬 场景
			for i=0, membercount-1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, mems[i] ) == 1 then
					x050220_Exit( sceneId, mems[i] )
				end
			end
		else
			--通知当前副本场景里to� 鸬 所有人,场景关闭倒计时间
			local strText = format( "R秈 kh鰅 hi畁 tr叨ng sau %d gi鈟", ( x050220_g_CloseTick - leaveTickCount ) * x050220_g_TickTime )

			for i=0, membercount-1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, mems[i] ) == 1 then
					x050220_NotifyFailTips( sceneId, mems[i], strText )
				end
			end
		end
	elseif TickCount == x050220_g_LimitTotalHoldTime then									-- 副本总时间限制到了
		--此处设置副本任务有时间限制to� 鸬 情况,当时间到后处理...
		local misIndex = 0
		for	i = 0, membercount - 1 do
			if LuaFnIsObjValid( sceneId, mems[i] ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, mems[i] ) == 1 then
				x050220_NotifyFailTips( sceneId, mems[i], "秀 h猼 th秈 gian, r秈 c鋘h...." )
				if IsHaveMission( sceneId, mems[i], x050220_g_MissionId ) > 0 then
					misIndex = GetMissionIndexByID( sceneId, mems[i], x050220_g_MissionId )
					if GetMissionParam( sceneId, mems[i], misIndex, x050220_g_IsMissionOkFail ) ~= 1 then
						SetMissionByIndex( sceneId, mems[i], misIndex, x050220_g_IsMissionOkFail, 2 )	-- 如果没有完成就设置为th b読
					end
				end
				x050220_Exit( sceneId, mems[i] )
			end
		end
		--设置副本关闭标志
		LuaFnSetCopySceneData_Param( sceneId, 4, 1 )
	elseif TickCount == 1 then									--开始to� 鸬 时候耍怪.地 餴琺A会有15c醝小怪和BOSS1Ng遳 Kh鷆,地 餴琺B会有20c醝小怪和BOSS2Ng遳 K�,地 餴琺C会有25c醝小怪.
	
		local smallmonsterId = LuaFnGetCopySceneData_Param( sceneId, 12 )
		local NiuquId = LuaFnGetCopySceneData_Param( sceneId, 13 )
		local NiuqiId = LuaFnGetCopySceneData_Param( sceneId, 14 )
		local mylevel = LuaFnGetCopySceneData_Param( sceneId, 16 )
		
		for i = 1, getn( x050220_g_SmallMonsterAPos ) do
			if x050220_g_SmallMonsterAPos[i] then
				monsterID = LuaFnCreateMonster( sceneId, smallmonsterId, x050220_g_SmallMonsterAPos[i][1], x050220_g_SmallMonsterAPos[i][2], 14, -1, 050220 )
				SetLevel( sceneId, monsterID, mylevel )
				SetCharacterName( sceneId, monsterID, x050220_g_SmallMonster )
				LuaFnSendSpecificImpactToUnit(sceneId,monsterID,monsterID,monsterID,5959,0)
			end
		end
		
		for i = 1, getn( x050220_g_SmallMonsterBPos ) do
			if x050220_g_SmallMonsterBPos[i] then
				monsterID = LuaFnCreateMonster( sceneId, smallmonsterId, x050220_g_SmallMonsterBPos[i][1], x050220_g_SmallMonsterBPos[i][2], 14, -1, 050220 )
				SetLevel( sceneId, monsterID, mylevel )
				SetCharacterName( sceneId, monsterID, x050220_g_SmallMonster )
				LuaFnSendSpecificImpactToUnit(sceneId,monsterID,monsterID,monsterID,5959,0)
			end
		end
		
		for i = 1, getn( x050220_g_SmallMonsterCPos ) do
			if x050220_g_SmallMonsterCPos[i] then
				monsterID = LuaFnCreateMonster( sceneId, smallmonsterId, x050220_g_SmallMonsterCPos[i][1], x050220_g_SmallMonsterCPos[i][2], 14, -1, 050220 )
				SetLevel( sceneId, monsterID, mylevel )
				SetCharacterName( sceneId, monsterID, x050220_g_SmallMonster )
				LuaFnSendSpecificImpactToUnit(sceneId,monsterID,monsterID,monsterID,5959,0)
			end
		end
		
		monsterID = LuaFnCreateMonster( sceneId, NiuquId, 168, 184, 14, -1, 050220 )
		SetLevel( sceneId, monsterID, mylevel+2 ) --等c比m祎 般小怪高2c
		SetCharacterName( sceneId, monsterID, x050220_g_NiuQu )
		
		monsterID = LuaFnCreateMonster( sceneId, NiuqiId, 65, 34, 14, -1, 050220 )
		SetLevel( sceneId, monsterID, mylevel+2 )--等c比m祎 般小怪高2c
		SetCharacterName( sceneId, monsterID, x050220_g_NiuQi )
	else
		--定时检查队伍成员to� 鸬 队伍号,如果不符合,则踢出副本
		local oldteamid = LuaFnGetCopySceneData_Param( sceneId, 6 )					-- 取 餴琺保存to� 鸬 队伍号
		local oldsceneId

		for	i = 0, membercount - 1 do
			if LuaFnIsObjValid( sceneId, mems[i] ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, mems[i] ) == 1 and oldteamid ~= GetTeamId( sceneId, mems[i] ) then
				x050220_NotifyFailTips( sceneId, mems[i], "B課 kh鬾g c騨 trong 鸬i ng�, r秈 c鋘h..." )
				x050220_Exit( sceneId, mems[i] )
			end
		end
		
		local monsternum = LuaFnGetCopySceneData_Param( sceneId, 7 )				-- 杀小怪to� 鸬 数量
		local iskillNiuQu = LuaFnGetCopySceneData_Param( sceneId, 8 )				-- 喧ng否杀死牛区
		local iskillNiuQi = LuaFnGetCopySceneData_Param( sceneId, 9 )				-- 喧ng否杀死Ng遳 K�
		local isBossWang = LuaFnGetCopySceneData_Param( sceneId, 10 )				-- 喧ng否刷出了boss王
		local NotifyTime = LuaFnGetCopySceneData_Param( sceneId, 11 )				-- 如果要提醒to� 鸬 话,上次提醒时间(因为每2分提醒m祎 次,C 记录m祎 c醝上次提醒时间)
		
		--每2 ph鷗提示m祎 次,单数计时
		local isPreNotify = 0
		if mod( TickCount*x050220_g_TickTime, 60 ) == 0 and mod( TickCount*x050220_g_TickTime+60, 120 ) == 0 then
			isPreNotify = 1
			for	i = 0, membercount - 1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, mems[i] ) == 1 then
					local Minute = floor( (360 - TickCount)*x050220_g_TickTime/60 )
					x050220_NotifyFailTips( sceneId, mems[i], "Th秈 gian c騨 l読 "..Minute.." ph鷗." )
				end
			end	
		end

		--小于15 ph鷗to� 鸬 时候,先杀干净了所有怪,C 每2分提醒m祎 次boss王出现时间
		if TickCount < 180 and monsternum >= 60 and iskillNiuQu == 1 and iskillNiuQi == 1 then
			if NotifyTime == 0 then --首次提醒
				for	i = 0, membercount - 1 do
					if LuaFnIsObjValid( sceneId, mems[i] ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, mems[i] ) == 1 then
						local Minute = 0
						if 180 - TickCount < 12 then--小于1 ph鷗按1 ph鷗提示
							Minute = 1
						else
							Minute = floor( (180 - TickCount)*x050220_g_TickTime/60 )
						end
						x050220_NotifyFailTips( sceneId, mems[i], "#{LLFB_80819_3}"..Minute.."#{LLFB_80819_4}" )
					end
				end
				LuaFnSetCopySceneData_Param( sceneId, 11, TickCount )
--			elseif TickCount - NotifyTime >= 24 then --后面to� 鸬 提醒
--				for	i = 0, membercount - 1 do
--					if LuaFnIsObjValid( sceneId, mems[i] ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, mems[i] ) == 1 then
--						local Minute = 0
--						if 180 - TickCount < 12 then--小于1 ph鷗按1 ph鷗提示
--							Minute = 1
--						else
--							Minute = floor( (180 - TickCount)*x050220_g_TickTime/60 )
--						end
--						x050220_NotifyFailTips( sceneId, mems[i], "#{LLFB_80819_3}"..Minute.."#{LLFB_80819_4}" )
--					end
--				end
--				LuaFnSetCopySceneData_Param( sceneId, 11, TickCount )
			end
		--大于等于15 ph鷗以后C 判断所有怪喧ng否杀干净,杀干净如果没有出boss王就刷出来
		elseif TickCount >= 180 and monsternum >= 60 and iskillNiuQu == 1 and iskillNiuQi == 1 and isBossWang == 0 then
			local BossWangId = LuaFnGetCopySceneData_Param( sceneId, 15 )
			local mylevel = LuaFnGetCopySceneData_Param( sceneId, 16 )
		
			monsterID = LuaFnCreateMonster( sceneId, BossWangId, 200, 48, 14, 262, 050220 )
			SetLevel( sceneId, monsterID, mylevel+3 )--等c比m祎 般小怪高3c
			SetCharacterName( sceneId, monsterID, x050220_g_BossWang )
			MonsterTalk(sceneId,monsterID,"Huy玭 L鬷 S叨n N鷌","K� n鄌 d醡 x鬾g v鄌 n絠 疴y h銀 s莕 s鄋g nh l c醝 ch猼 餴!")
			
			LuaFnSetCopySceneData_Param( sceneId, 10, 1 )
		end
		
	end
end

--**********************************
--检测喧ng否可以提交
--**********************************
function x050220_CheckSubmit( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x050220_g_MissionId ) <= 0 then
		return 0
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x050220_g_MissionId )				--  餴琺到任务to� 鸬 序列号
	if GetMissionParam( sceneId, selfId, misIndex, x050220_g_IsMissionOkFail ) ~= 1 then
		return 0
	end
	
	if LuaFnGetAvailableItemCount( sceneId, selfId, x050220_g_huangjinzhilian ) < 1 then
		return 0
	end

	return 1
end

--**********************************
--提交
--**********************************
function x050220_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if GetName( sceneId, targetId ) ~= x050220_g_Name then		--判断该npc喧ng否喧ng对应任务to� 鸬 npc
		return
	end

	if x050220_CheckSubmit( sceneId, selfId ) == 1 then
		x050220_NotifyFailBox( sceneId, selfId, targetId, x050220_g_MissionComplete )
		if LuaFnDelAvailableItem( sceneId, selfId, x050220_g_huangjinzhilian, 1 ) > 0 then
			BeginAddItem( sceneId )
			AddItem( sceneId, x050220_g_heyuanxin, 1 )
			local ret = EndAddItem( sceneId, selfId )

			if ret > 0 then
				AddItemListToHuman(sceneId, selfId)
				
				DelMission( sceneId, selfId, x050220_g_MissionId )
				-- 任务籱祎 疃臣�
				LuaFnAuditQuest(sceneId, selfId, "Nhi甿 v� li阯 ho鄋 L鈛 Lan, Ho鄋 Kim Chi Li阯")
			else
				x050220_NotifyFailTips( sceneId, selfId, "Tay n鋓 c黙 b課 疸 馥y.")
			end
		end
	end
end

--**********************************
-- 对话窗口信息提示
--**********************************
function x050220_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
-- 屏幕中间信息提示
--**********************************
function x050220_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--检测心法喧ng不够接任务
--**********************************
function x050220_CheckAllXinfaLevel(sceneId, selfId, level)
	local nMenpai = GetMenPai(sceneId, selfId)
	if nMenpai<0 or nMenpai>8   then
		return 0
	end
	
	for i=1, 6 do
		local nXinfaLevel = LuaFnGetXinFaLevel(sceneId, selfId, nMenpai*6 + i)
		if nXinfaLevel < level    then
			return 0
		end
	end
	return 1
end

--**********************************
-- 拾取处理 scene.luato� 鸬 x888888_OnPlayerPickupItemFromDropBox调用到这里
--**********************************
function x050220_PickupItem(sceneId, selfId, itemId, bagidx )
	if IsHaveMission( sceneId, selfId, x050220_g_MissionId ) <= 0 then
		return
	end
	
	if itemId ~= x050220_g_huangjinzhilian then
		return
	end
	
	x050220_NotifyFailTips( sceneId, selfId, "秀 t靘 th ho鄋 kim chi li阯 1/1" )
	x050220_NotifyFailTips( sceneId, selfId, "Nhi甿 v� 疸 ho鄋 th鄋h" )
	misIndex = GetMissionIndexByID( sceneId, selfId, x050220_g_MissionId )
	SetMissionByIndex( sceneId, selfId, misIndex, x050220_g_IsFindGoods, 1 )
	SetMissionByIndex( sceneId, selfId, misIndex, x050220_g_IsMissionOkFail, 1 )	-- 任务完成
end
