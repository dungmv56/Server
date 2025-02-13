-- 连环副本任务
-- 竹林

--************************************************************************
--MisDescBegin

-- 脚本号
x050101_g_ScriptId = 050101

-- 任务号
x050101_g_MissionId = 1261					-- 1260 - 1269

-- 上m祎 c醝任务to� 鸬  ID
-- g_MissionIdPre = 1260

-- M鴆 ti陁 nhi甿 v� NPC
x050101_g_Name = "Hoa Ki猰 膎h"

--任务归类
x050101_g_MissionKind = 8

--衅ng c nhi甿 v� 
x050101_g_MissionLevel = 10000

-- 任务文本描述
x050101_g_MissionName = "Tr� h読"
x050101_g_MissionInfo = "    "														-- 任务描述
x050101_g_MissionTarget = "    "..x050101_g_Name.." � T� Ch鈛 #{_INFOAIM251,108,1, "..x050101_g_Name.."} y陁 c c醕 h� gi猼 ch猼 80 con D� H鵱g v� H皀g H鵱g V呓ng.#r    #{FQSH_090206_01}"						-- M鴆 ti陁 nhi甿 v�
x050101_g_ContinueInfo = "    C醕 c醕 h� 疸 chu b� r癷 m秈 皙n Tr鷆 L鈓 ti陁 di畉 H皀g H鵱g V呓ng!"					-- 未Ho鄋 t nhi甿 v鴗o� 鸬 npc对话
x050101_g_SubmitInfo = "    Nhi甿 v� l鄊 th� n鄌 r癷?"										-- 提交时to� 鸬 答复
x050101_g_MissionComplete = "    C醕 c醕 h� 疸 gi猼 ch猼 H皀g B醥 V呓ng r癷, th� theo 疸 tho� thu ta s� cho c醕 c醕 h� bi猼 lai lich c黙 l畁h b鄆. C醕 c醕 h� mang b裞 th� n鄖 giao cho #{_INFOAIM62,162,1, Ti玭 Ho鄋h V鹽, huynh  t� s� hi瑄 m鱥 vi甤."	--Ho鄋 t nhi甿 v鴑pc说to� 鸬 话

x050101_g_IsMissionOkFail = 0														-- 0 号: 当前任务喧ng否完成(0未完成；1完成；2th b読)
x050101_g_DemandKill = { { id = 4120, num = 1 }, { id = 4110, num = 80 } }			-- 1 ~ 2 号,怪物信息
x050101_g_Param_sceneid = 3															-- 3 号: 当前副本任务to� 鸬 场景号

-- 任务奖励

--MisDescEnd
--************************************************************************

x050101_g_DemandKillGroup = { 2, 1 }		-- 1 ~ 2 号怪物对应to� 鸬  GroupID 号,与 x050101_g_DemandKill m祎 m祎 对应
x050101_g_BossGroup = 2						-- Boss Group ID
x050101_g_Token = 40004315					-- 令牌号
x050101_g_Mail = 40004316					-- 书信

x050101_g_NumText_Main = 1					-- 接任务to� 鸬 选项
x050101_g_NumText_EnterCopyScene = 2		-- 要求进入副本to� 鸬 选项

x050101_g_CopySceneMap = "zhulin.nav"
x050101_g_CopySceneArea = "zhulin_area.ini"
x050101_g_CopySceneMonsterIni = "zhulin_monster_%d.ini"

x050101_g_CopySceneType = FUBEN_ZHULIN		-- 副本类型,定义T読 ScriptGlobal.lua里面
x050101_g_LimitMembers = 1					-- 可以进副本to� 鸬 最小队伍人数
x050101_g_LevelLimit = 30					-- 可以进入副本to� 鸬 最低c别
x050101_g_TickTime = 5						-- 回调脚本to� 鸬 时钟时间(单位:  gi鈟/次)
x050101_g_LimitTotalHoldTime = 360			-- 副本可以存活to� 鸬 时间(单位: 次数),如果此时间到了,则任务将会th b読
x050101_g_CloseTick = 6						-- 副本关闭前倒计时(单位: 次数)
x050101_g_NoUserTime = 30					-- 副本中没有人后可以继续保存to� 鸬 时间(单位:  gi鈟)

x050101_g_Fuben_X = 97
x050101_g_Fuben_Z = 113
x050101_g_Back_X = 250
x050101_g_Back_Z = 107

x050101_g_Fuben_Relive_X = 97
x050101_g_Fuben_Relive_Z = 113

-- 广播消息
x050101_g_BroadcastMsg = {
	"#Y"..x050101_g_Name .. ": #W#{_INFOUSR$N}#cff99cc 鹫i hi畃 th l� m課h, m祎 quy玭 疸 疳nh b﹑ #{_BOSS46}#cff99cc 疸 c� #{_INFOUSR$N}#cff99cc 鹫i hi畃 �, t阯 tr祄 n鄌 d醡 ngang ng唼c?",
	"#Y"..x050101_g_Name .. ": #W#{_INFOUSR$N}#cff99cc 鹫i hi畃 th l� kh�, qu閠 s誧h r譶g tr鷆 T� Ch鈛. M祎 tr gi醤g xu痭g 疸 鸲i, kh鬾g c� #{_BOSS46}#cff99cc kh鬾g d﹑ n眎",
	"#Y"..x050101_g_Name .. ": #W#{_INFOUSR$N}#cff99cc 鹫i hi畃 th l� l㱮 h読, danh ti猲g ngh頰 hi畃 l遳 danh ng鄋 鸲i. V� c鬾g c鄋g kh鬾g ph鋓 n骾, ph鄊 l� #{_BOSS46} #cff99cc皤u v� 馥u h猼"
}

x050101_g_TakeTimes = 10											-- 每天最多L頽h 次数
--**********************************
-- 任务入口函数
--**********************************
function x050101_OnDefaultEvent( sceneId, selfId, targetId )	--  餴琺击该任务后执行此脚本
	if GetName( sceneId, targetId ) ~= x050101_g_Name then		-- 判断该npc喧ng否喧ng对应任务to� 鸬 npc
		return
	end

	local numText = GetNumText()

	if IsHaveMission( sceneId, selfId, x050101_g_MissionId ) == 0 then
		if numText == x050101_g_NumText_Main then
			if x050101_CheckAccept( sceneId, selfId ) > 0 then
				--发送任务Ti猵 th毕允総o� 鸬 信息
				BeginEvent( sceneId )
					AddText( sceneId, x050101_g_MissionName )
					AddText( sceneId, "    Kh� l, Ta qu� th馽 c� th� n骾 cho ng呓i bi猼 lai l竎h c黙 t l畁h b鄆 n鄖, nh遪g tr呔c 痼, ng呓i ph鋓 gi鷓 ta m祎 chuy畁" )
					AddText( sceneId, "    Trong r譶g tr鷆 ngo鄆 th鄋h T� Ch鈛 c� 1疣n g hoang, ch鷑g v痭 r ngoan, nh遪g t� khi c� 1 con g 瘀 l阯 l鄊 th� l頽h, ch鷑g tr� n阯 hung d�, g 疴y li阯 t鴆 t c鬾g v鄌 th鬾. Nh遪g tri玼 痨nh kh鬾g h� g豬 qu鈔 l韓h t緄 鸠i ph� l� 醕 t錸g n鄖. 鞋 tr醤h cho l� 醕 t錸g kh鬾g l鄊 h読 t緄 d鈔 l鄋g, ta mu痭 nhanh ch髇g t靘 c醕h di畉 tr� con g 瘀 疳ng ch猼 kia" )
					AddText( sceneId, "    N猽 ng呓i c� th� gi鷓 ta gi猼 疬㧟 con g 瘀, ta s� k� cho ng呓i ngay v� lai l竎h t l畁h b鄆 n鄖" )
					AddText( sceneId, "#{M_MUBIAO}" )
					AddText( sceneId, x050101_g_MissionTarget )
				EndEvent( )
				DispatchMissionInfo( sceneId, selfId, targetId, x050101_g_ScriptId, x050101_g_MissionId )
			end
		end
	else
		if numText == x050101_g_NumText_Main then
			local bDone = x050101_CheckSubmit( sceneId, selfId )

			BeginEvent( sceneId )
				AddText( sceneId, x050101_g_MissionName )

				if bDone == 1 then
					AddText( sceneId, x050101_g_SubmitInfo )
				else
					AddText( sceneId, x050101_g_ContinueInfo )
					x050101_AskEnterCopyScene( sceneId, selfId, targetId )
					DispatchEventList( sceneId, selfId, targetId )
					return
				end
			EndEvent( )
			DispatchMissionDemandInfo( sceneId, selfId, targetId, x050101_g_ScriptId, x050101_g_MissionId, bDone )
		elseif numText == x050101_g_NumText_EnterCopyScene then
			x050101_AcceptEnterCopyScene( sceneId, selfId, targetId )
		end
	end
end

--**********************************
-- 不能有其他to� 鸬 任务,没有Tr� v� 0,有Tr� v� 1
--**********************************
function x050101_CheckConflictMission( sceneId, selfId )
	local missionId = 0

	for missionId = 1260, x050101_g_MissionId - 1 do
		if IsHaveMission( sceneId, selfId, missionId ) > 0 then
			return 1
		end
	end

	for missionId = x050101_g_MissionId + 1, 1269 do
		if IsHaveMission( sceneId, selfId, missionId ) > 0 then
			return 1
		end
	end

	return 0
end

--**********************************
-- 列举事件
--**********************************
function x050101_OnEnumerate( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x050101_g_Name then		--判断该npc喧ng否喧ng对应任务to� 鸬 npc
		return
	end

	-- 不能有其他to� 鸬 任务
	if x050101_CheckConflictMission( sceneId, selfId ) == 1 then
		return
	end

	AddNumText( sceneId, x050101_g_ScriptId, x050101_g_MissionName, 4, x050101_g_NumText_Main )
end

-- 没有令牌如何处理?不显示条目(不显示to� 鸬 后果可能喧ng让某些玩家不知道这里有任务)还喧ng给出提示?
--**********************************
-- 检测Ti猵 th跫�
--**********************************
function x050101_CheckAccept( sceneId, selfId )
	-- 已经接过则不符合条件
	if IsHaveMission( sceneId, selfId, x050101_g_MissionId ) > 0 then
		return 0
	end

	-- 不能有其他to� 鸬 任务
	if x050101_CheckConflictMission( sceneId, selfId ) == 1 then
		return 0
	end

	-- 检测玩家喧ng否符合刚放弃任务
	local iTime = GetMissionData( sceneId, selfId, MD_ROUNDMISSION2 )			-- 上m祎 次放弃任务to� 鸬 时间(单位: m祎 刻钟)
	--begin modified by zhangguoxin 090207
	--local CurTime = GetHourTime()												-- 当前时间(单位: m祎 刻钟)
	local CurTime = GetQuarterTime()												-- 当前时间(单位: m祎 刻钟)
	--end modified by zhangguoxin 090207

	if iTime+1  >= CurTime then
		x050101_NotifyFailTips( sceneId, selfId, "Sau khi t� b� nhi甿 v� 30 ph鷗, m緄 c� th� nh l n鎍." )
		return 0
	end

	-- 如果没有: C “余毒to� 鸬 令牌”
	if LuaFnGetAvailableItemCount( sceneId, selfId, x050101_g_Token ) < 1 then
		x050101_NotifyFailTips( sceneId, selfId, "C c� #{_ITEM" .. x050101_g_Token .."}" )
		return 0
	end

	-- m祎 天只能领 x050101_g_TakeTimes 次
	local DayTimes, oldDate, nowDate, takenTimes

	DayTimes = GetMissionData( sceneId, selfId, MD_ROUNDMISSION2_TIMES )
	oldDate = mod( DayTimes, 100000 )
	takenTimes = floor( DayTimes/100000 )

	nowDate = GetDayTime()
	if nowDate ~= oldDate then
		takenTimes = 0
	end

	if takenTimes >= x050101_g_TakeTimes then
		x050101_NotifyFailTips( sceneId, selfId, "S� l nh nhi甿 v� c黙 c醕 h� h鬽 nay 疸 v唼t qu�" .. x050101_g_TakeTimes .. " l, xin ng鄖 mai quay l読 nh" )
		return 0
	else
		DayTimes = nowDate + takenTimes * 100000
		SetMissionData( sceneId, selfId, MD_ROUNDMISSION2_TIMES, DayTimes )
	end

	return 1
end

--**********************************
-- 请求进入副本场景
--**********************************
function x050101_AskEnterCopyScene( sceneId, selfId, targetId )
	AddNumText( sceneId, x050101_g_ScriptId, "Th苙g ti猲 r譶g tr鷆", 10, x050101_g_NumText_EnterCopyScene )
end

--**********************************
--Ti猵 th�
--**********************************
function x050101_OnAccept( sceneId, selfId, targetId )
	if IsHaveMission( sceneId, selfId, x050101_g_MissionId ) == 0 then					-- 没有任务才可以走这里
		if GetMissionCount( sceneId, selfId ) >= 20 then						-- 身上任务数量喧ng否达到上限20c醝
			x050101_NotifyFailBox( sceneId, selfId, targetId, "    Nhi甿 v� ghi ch閜 疸 馥y, kh鬾g th� nh th阭 nhi甿 v�" )
			return
		end

		if GetLevel( sceneId, selfId ) < x050101_g_LevelLimit then
			x050101_NotifyFailBox( sceneId, selfId, targetId, "    衅ng c c黙 ng呓i qu� th, nhi甿 v� n鄖 鸠i v緄 ng呓i qu� nguy hi琺, h銀 luy畁 t tr呔c khi t緄" )
			return
		end

		-- 不能有其他to� 鸬 任务
		if x050101_CheckConflictMission( sceneId, selfId ) == 1 then
			return
		end

		-- 如果玩家身上具有m祎 块以上to� 鸬 道具”余毒to� 鸬 令牌”, c� th� � 此Ti猵 th氯挝瘛俺Α�,接任务to� 鸬 同时消耗m祎 c醝令牌”余毒to� 鸬 令牌”.
		if LuaFnDelAvailableItem( sceneId, selfId, x050101_g_Token, 1 ) == 0 then
			-- 否则显示: C “余毒to� 鸬 令牌”
			x050101_NotifyFailBox( sceneId, selfId, targetId, "C c� #{_ITEM" .. x050101_g_Token .."}" )
			return
		end

		-- 加入任务到玩家列表
		AddMission( sceneId, selfId, x050101_g_MissionId, x050101_g_ScriptId, 1, 0, 0 )			-- kill、area、item
		if IsHaveMission( sceneId, selfId, x050101_g_MissionId ) <= 0 then
			return
		end

		-- m祎 天只能领 x050101_g_TakeTimes 次
		local DayTimes

		DayTimes = GetMissionData( sceneId, selfId, MD_ROUNDMISSION2_TIMES )
		DayTimes = DayTimes + 100000
		SetMissionData( sceneId, selfId, MD_ROUNDMISSION2_TIMES, DayTimes )

--		SetMissionEvent( sceneId, selfId, x050101_g_MissionId, 4 ) -- 注册 OnLockedTarget 事件

		local misIndex = GetMissionIndexByID( sceneId, selfId, x050101_g_MissionId )

		SetMissionByIndex( sceneId, selfId, misIndex, x050101_g_IsMissionOkFail, 0 )	-- 任务完成情况置为未完成
		SetMissionByIndex( sceneId, selfId, misIndex, x050101_g_Param_sceneid, -1 )		-- 副本号置为 -1

		--显示内容告诉玩家已经Ti猵 th巳挝�
		BeginEvent( sceneId )
			AddText( sceneId, x050101_g_MissionName )
			AddText( sceneId, x050101_g_ContinueInfo )
			AddText( sceneId, "#r    C醕 h� 疸 nh " .. x050101_g_MissionName )

			x050101_AskEnterCopyScene( sceneId, selfId, targetId )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
end

--**********************************
-- 请求进入副本场景
--**********************************
function x050101_AcceptEnterCopyScene( sceneId, selfId, targetId )
	if IsHaveMission( sceneId, selfId, x050101_g_MissionId ) > 0 then					-- 有任务才可以走这里
		local misIndex = GetMissionIndexByID( sceneId, selfId, x050101_g_MissionId )
		local copysceneid = GetMissionParam( sceneId, selfId, misIndex, x050101_g_Param_sceneid )
		if copysceneid >= 0 then												-- 进过副本
			-- 将自己传送到副本场景
			if IsCanEnterCopyScene( copysceneid, GetHumanGUID( sceneId, selfId ) ) == 1 then
				NewWorld( sceneId, selfId, copysceneid, x050101_g_Fuben_X, x050101_g_Fuben_Z )
			else
				x050101_NotifyFailBox( sceneId, selfId, targetId, "    R ti猚, nhi甿 v� c黙 ng呓i 疸 th b読" )
			end

			return
		end

		if LuaFnHasTeam( sceneId, selfId ) == 0 then
			x050101_NotifyFailBox( sceneId, selfId, targetId, "    M祎 m靚h ng呓i th馽 l馽 m鰊g, h銀 g鱥 th阭 m ng叨i t緄 gi鷓 餴" )
			return
		end

		if LuaFnIsTeamLeader( sceneId, selfId ) == 0 then
			x050101_NotifyFailBox( sceneId, selfId, targetId, "    Ng呓i kh鬾g ph鋓 l� 鸬i tr叻ng, ch� c� 鸬i tr叻ng m緄 c� th� quy猼 鸶nh nh u� th醕 c黙 ta hay kh鬾g" )
			return
		end
		
		--bug27726,2007.11.15 by alan,因为sceneMemberCount不m祎 定准确,改用附近械i vi阯 数与队伍人数to� 鸬 比较判断
		--并不再提示具体不T読 附近to� 鸬 械i vi阯 名称
				
		local teamMemberCount = GetTeamMemberCount(sceneId, selfId);	
		local nearMemberCount = GetNearTeamCount(sceneId, selfId);		
		if not teamMemberCount or not nearMemberCount or teamMemberCount ~= nearMemberCount then
			x050101_NotifyFailBox( sceneId, selfId, targetId, "    C醕 h� c� nh髆 vi阯 kh鬾g � g 疴y" )
			return
		end
		
		--bug27726 end

		-- 取 餴琺玩家附近to� 鸬 队友数量(包括自己)
		--local teamMemberCount = GetTeamMemberCount(sceneId, selfId);
		--local sceneMemberCount = GetTeamSceneMemberCount(sceneId, selfId);
		--if not teamMemberCount or not sceneMemberCount or teamMemberCount ~= sceneMemberCount + 1 then
		--	x050101_NotifyFailBox( sceneId, selfId, targetId, "    你还有械i vi阯 不T読 附近." )
		--	return
		--end
		
		--local nearMemberCount = GetNearTeamCount(sceneId, selfId)
		--if nearMemberCount ~= sceneMemberCount + 1 then
		--	local strOutmsg = "Trong 鸬i ng� c� th鄋h vi阯 (";
		--	local checkNearCount = 0;
		--	for	i = 0, sceneMemberCount - 1 do
		--		local sceneMemId = LuaFnGetTeamSceneMember(sceneId, selfId, i);
		--		if sceneMemId and sceneMemId >= 0 then
		--			local findFlag = 0;
		--			for	j = 0, nearMemberCount - 1 do
		--				local nearMemId = GetNearTeamMember(sceneId, selfId, j);
		--				if nearMemId and nearMemId == sceneMemId then
		--					findFlag = 1;
		--					break;
		--				end
		--			end
					
		--			if findFlag == 0 then
		--				memName = GetName(sceneId, sceneMemId);
		--				if checkNearCount == 0 then
		--					strOutmsg = strOutmsg..memName;
		--				else
		--					strOutmsg = strOutmsg.."、"..memName;
		--				end
		--				checkNearCount = checkNearCount + 1;
		--			end
		--		end
		--	end
		--	if checkNearCount  > 0 then
		--		strOutmsg = strOutmsg..")不T読 附近,请集合后再找我进入活动.";
		--		x050101_NotifyFailBox( sceneId, selfId, targetId, strOutmsg)
		--	end
		--	return 
		--end
		
		if nearMemberCount < x050101_g_LimitMembers then
			x050101_NotifyFailBox( sceneId, selfId, targetId, "    Trong r譶g tr鷆 g d� r nhi玼 韙 nh c醕 ng呓i ph鋓 c� "..x050101_g_LimitMembers.." ng叨i 鸢ng h鄋h, ta m緄 y阯 t鈓 瓞 c醕 ng呓i 餴" )
			return
		end

		-- 检测小队中喧ng否有人任务记录已满, 队友喧ng否已经接过此任务
		local member, mylevel, numerator, denominator = 0, 0, 0, 0
		local outNotAcceptMissionStr = "B課 c� th鄋h vi阯 trong nh髆 (";
		local notAcceptMissionCount = 0;
		local outDoingMissionStr = "B課 c� th鄋h vi阯 trong nh髆 (";
		local doingMissionCount = 0;
		for	i = 0, nearMemberCount - 1 do
			member = GetNearTeamMember( sceneId, selfId, i )

			if IsHaveMission( sceneId, member, x050101_g_MissionId ) <= 0 then
				if notAcceptMissionCount == 0 then
					outNotAcceptMissionStr = outNotAcceptMissionStr..GetName(sceneId, member);
				else
					outNotAcceptMissionStr = outNotAcceptMissionStr..", "..GetName(sceneId, member);
				end
				notAcceptMissionCount = notAcceptMissionCount + 1;
			end

			if notAcceptMissionCount == 0 then
				misIndex = GetMissionIndexByID( sceneId, member, x050101_g_MissionId )
				if GetMissionParam( sceneId, member, misIndex, x050101_g_Param_sceneid ) >= 0 then
					if doingMissionCount == 0 then
						outDoingMissionStr = outDoingMissionStr..GetName(sceneId, member);
					else
						outDoingMissionStr = outDoingMissionStr..", "..GetName(sceneId, member);
					end
					doingMissionCount = doingMissionCount + 1;
				end
			end

			numerator = numerator + GetLevel( sceneId, member ) ^ 4
			denominator = denominator + GetLevel( sceneId, member ) ^ 3
		end
		
		if notAcceptMissionCount > 0 then
			outNotAcceptMissionStr = outNotAcceptMissionStr..") ch遖 nh nhi甿 v� n鄖";
			x050101_NotifyFailBox( sceneId, selfId, targetId, outNotAcceptMissionStr);
			return
		end
		
		if doingMissionCount > 0 then
			outDoingMissionStr = outDoingMissionStr..") 疸 ho 餫ng l鄊 nhi甿 v�.";
			x050101_NotifyFailBox( sceneId, selfId, targetId, outDoingMissionStr);
			return
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
		LuaFnSetSceneLoad_Map( sceneId, x050101_g_CopySceneMap )						-- 地图喧ng必须选取to� 鸬 ,而且必须T読 Config/SceneInfo.ini里配置好
		LuaFnSetCopySceneData_TeamLeader( sceneId, leaderguid )
		LuaFnSetCopySceneData_NoUserCloseTime( sceneId, x050101_g_NoUserTime * 1000 )
		LuaFnSetCopySceneData_Timer( sceneId, x050101_g_TickTime * 1000 )
		LuaFnSetCopySceneData_Param( sceneId, 0, x050101_g_CopySceneType )				-- 设置副本数据,这里将0号索引to� 鸬 数据设置为999,用于表示副本号999(数字自定义)
		LuaFnSetCopySceneData_Param( sceneId, 1, x050101_g_ScriptId )					-- 将1号数据设置为副本场景事件脚本号
		LuaFnSetCopySceneData_Param( sceneId, 2, 0 )							-- 设置定时器调用次数
		LuaFnSetCopySceneData_Param( sceneId, 3, -1 )							-- 设置副本入口场景号, 初始化
		LuaFnSetCopySceneData_Param( sceneId, 4, 0 )							-- 设置副本关闭标志, 0开放,1关闭
		LuaFnSetCopySceneData_Param( sceneId, 5, 0 )							-- 设置离开倒计时次数
		LuaFnSetCopySceneData_Param( sceneId, 6, GetTeamId( sceneId, selfId ) )	-- 保存队伍号
		LuaFnSetCopySceneData_Param( sceneId, 7, 0 )							-- 杀死Boss1to� 鸬 数量
		LuaFnSetCopySceneData_Param( sceneId, 8, 0 )							-- 杀死Boss2to� 鸬 数量
		LuaFnSetCopySceneData_Param( sceneId, 9, 0 )							-- 杀死Boss3to� 鸬 数量
		LuaFnSetCopySceneData_Param( sceneId, 10, 0 )							-- 杀死Boss4to� 鸬 数量
		LuaFnSetCopySceneData_Param( sceneId, 11, 0 )							-- 杀死Boss5to� 鸬 数量
		LuaFnSetCopySceneData_Param( sceneId, 12, 0 )							-- 喧ng否杀死红熊王
		LuaFnSetCopySceneData_Param( sceneId, 13, iniLevel / 10 )				-- 存储玩家们to� 鸬 c别档次
		LuaFnSetCopySceneData_Param( sceneId, 14, 0 )							-- 红熊王喧ng否已经加血

		LuaFnSetSceneLoad_Area( sceneId, x050101_g_CopySceneArea )

		local monsterINI = format( x050101_g_CopySceneMonsterIni, iniLevel )
		LuaFnSetSceneLoad_Monster( sceneId, monsterINI )

		LuaFnSetCopySceneData_Param(sceneId, CopyScene_LevelGap, mylevel - iniLevel) -- c别差,CopyScene_LevelGap T読  scene.lua 中赋值

		local bRetSceneID = LuaFnCreateCopyScene( sceneId )						-- 初始化完成后调用创建副本函数
		if bRetSceneID > 0 then
			x050101_NotifyFailTips( sceneId, selfId, "D竎h chuy琻 th鄋h c鬾g!" )
		else
			x050101_NotifyFailTips( sceneId, selfId, "S� l唼ng b鋘 sao 疸 皙n gi緄 h課, 皤 ngh� l醫 n鎍 th� l読!" )
		end
	end
end

--**********************************
--副本事件
--**********************************
function x050101_OnCopySceneReady( sceneId, destsceneId )
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
		if IsHaveMission( sceneId, member, x050101_g_MissionId ) > 0 then		-- 有任务
			validmembercount = validmembercount + 1
			members[validmembercount] = member
		end
	end

	if validmembercount < x050101_g_LimitMembers then
		x050101_NotifyFailTips( sceneId, leaderObjId, "    Trong r譶g tr鷆 g d� r nhi玼, 韙 nh c醕 ng呓i ph鋓 c� "..x050101_g_LimitMembers.." ng叨i 鸢ng h鄋h, ta m緄 y阯 t鈓 瓞 c醕 ng呓i 餴, trong nh髆 c c� "..x050101_g_LimitMembers.." nh鈔 v 韙 nh t� c 30 tr� l阯)" )
		return
	end

	local misIndex
	for i = 1, validmembercount do
		misIndex = GetMissionIndexByID( sceneId, members[i], x050101_g_MissionId )

		if LuaFnIsCanDoScriptLogic( sceneId, members[i] ) == 1 then			-- 处于可以执行逻辑to� 鸬 状态
			--将任务to� 鸬 第1号数据设置为副本to� 鸬 场景号
			SetMissionByIndex( sceneId, members[i], misIndex, x050101_g_Param_sceneid, destsceneId )
	--		SetMissionEvent( sceneId, members[i], x050101_g_MissionId, 0 )			-- 关心杀怪事件
			NewWorld( sceneId, members[i], destsceneId, x050101_g_Fuben_X, x050101_g_Fuben_Z )
		end
	end
end

--**********************************
--有玩家进入副本事件
--**********************************
function x050101_OnPlayerEnter( sceneId, selfId )
	SetPlayerDefaultReliveInfo( sceneId, selfId, "%10", -1, "0", sceneId, x050101_g_Fuben_Relive_X, x050101_g_Fuben_Relive_Z )
end

--**********************************
--杀死怪物或玩家
--**********************************
function x050101_OnKillObject( sceneId, selfId, objdataId, objId )						-- 参数意思: 场景号、玩家objId、怪物表位置号、怪物objId
	if IsHaveMission( sceneId, selfId, x050101_g_MissionId ) == 0 then
		return
	end

	--喧ng否喧ng副本
	local sceneType = LuaFnGetSceneType( sceneId )
	if sceneType ~= 1 then
		return
	end

	--喧ng否喧ng所C to� 鸬 副本
	local fubentype = LuaFnGetCopySceneData_Param( sceneId, 0 )
	if fubentype ~= x050101_g_CopySceneType then
		return
	end

	--副本关闭标志
	local leaveFlag = LuaFnGetCopySceneData_Param( sceneId, 4 )
	if leaveFlag == 1 then														-- 如果副本已经被置成关闭状态,则杀怪无效
		return
	end

	--取 餴琺杀死怪物to� 鸬 GroupID
	local GroupID = GetMonsterGroupID( sceneId, objId )
	if GroupID == x050101_g_BossGroup then
		LuaFnSetCopySceneData_Param( sceneId, 12, 1 )							-- 喧ng否杀死红熊王

		local monstercount = GetMonsterCount( sceneId )
		local bossId
		for i = 0, monstercount - 1 do
			bossId = GetMonsterObjID( sceneId, i )
			-- 设置成非主动攻击
			-- 基础 AI 变为 1
			SetNPCAIType( sceneId, bossId, 1 )
			-- 扩展 AI 变为 0
			SetAIScriptID( sceneId, bossId, 0 )
			-- 然后开始发呆
			NpcToIdle( sceneId, bossId )
		end

		local BroadcastMsg = x050101_g_BroadcastMsg[ random( getn(x050101_g_BroadcastMsg) ) ]
		BroadcastMsg = gsub( BroadcastMsg, "%$N", GetName( sceneId, selfId ) )
		BroadMsgByChatPipe( sceneId, selfId, BroadcastMsg, 4 )

	end

	local killedMonsterIndex, killedCount = 0, 0
	for i = 1, getn( x050101_g_DemandKillGroup ) do
		if GroupID == x050101_g_DemandKillGroup[i] then
			killedMonsterIndex = i
			killedCount = LuaFnGetCopySceneData_Param( sceneId, 7 + i - 1 ) + 1
			LuaFnSetCopySceneData_Param( sceneId, 7 + i - 1, killedCount )		-- 杀死Bossito� 鸬 数量
			break
		end
	end

	if killedMonsterIndex == 0 then													-- 杀死了m祎 c醝不相关怪
		return
	end

	local maxKilledCount = x050101_g_DemandKill[killedMonsterIndex].num

	--取 餴琺当前场景里to� 鸬 人数
	local num = LuaFnGetCopyScene_HumanCount( sceneId )
	local mems = {}
	local misIndex
	local strText = format( "秀 gi猼 %s: %d/%d", GetName( sceneId, objId ), killedCount, maxKilledCount )
	for i = 0, num - 1 do
		mems[i + 1] = LuaFnGetCopyScene_HumanObjId( sceneId, i )					-- 取 餴琺当前场景里人to� 鸬 objId

		if LuaFnIsObjValid( sceneId, mems[i + 1] ) == 1 then						-- 不T読 场景to� 鸬 不做此操作
			x050101_NotifyFailTips( sceneId, mems[i + 1], strText )
			Msg2Player( sceneId, mems[i + 1], strText, MSG2PLAYER_PARA )
			misIndex = GetMissionIndexByID( sceneId, mems[i + 1], x050101_g_MissionId )
			SetMissionByIndex( sceneId, mems[i + 1], misIndex, killedMonsterIndex, killedCount )	-- 刷新杀怪数量
		end
	end

	local leaveFlag = 1
	for i = 1, getn( x050101_g_DemandKillGroup ) do
		if LuaFnGetCopySceneData_Param( sceneId, 7 + i - 1 ) < x050101_g_DemandKill[i].num then
			leaveFlag = 0
			break
		end
	end

	-- 杀死所有怪则离开场景
	if leaveFlag == 1 then
		local misIndex
		LuaFnSetCopySceneData_Param( sceneId, 4, 1 )

		for i = 1, num do
			if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then						-- 不T読 场景to� 鸬 不做此操作
				x050101_NotifyFailTips( sceneId, mems[i], "M鴆 ti陁 nhi甿 v� 疸 ho鄋 th鄋h, s r秈 kh鰅 ph� b鋘..." )
				misIndex = GetMissionIndexByID( sceneId, mems[i], x050101_g_MissionId )
				SetMissionByIndex( sceneId, mems[i], misIndex, x050101_g_IsMissionOkFail, 1 )	-- 任务完成
			end
		end
	end
end

--**********************************
--有玩家T読 副本中死亡事件
--**********************************
function x050101_OnHumanDie( sceneId, selfId, killerId )
	-- 任何m祎 c醝玩家死亡都会导致红熊王生命全满
--	if LuaFnGetCopySceneData_Param( sceneId, 12 ) == 1 then								-- 熊王死了就不判断了
--		return
--	end
--
--	local monstercount = GetMonsterCount( sceneId )
--	local monsterId, GroupID
--
--	for i = 0, monstercount - 1 do
--		monsterId = GetMonsterObjID( sceneId, i )
--		GroupID = GetMonsterGroupID( sceneId, monsterId )
--
--		if GroupID == x050101_g_BossGroup then
--			RestoreHp( sceneId, monsterId )
--			break
--		end
--	end
end

--**********************************
--离开副本
--**********************************
function x050101_Exit( sceneId, selfId )
	local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )				-- 取 餴琺副本入口场景号
	NewWorld( sceneId, selfId, oldsceneId, x050101_g_Back_X, x050101_g_Back_Z )
end

--**********************************
--继续
--**********************************
function x050101_OnContinue( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, x050101_g_MissionName )
		AddText( sceneId, x050101_g_MissionComplete )
	EndEvent( )
	DispatchMissionContinueInfo( sceneId, selfId, targetId, x050101_g_ScriptId, x050101_g_MissionId )
end

--**********************************
--放弃
--**********************************
function x050101_OnAbandon( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x050101_g_MissionId ) == 0 then
		return
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x050101_g_MissionId )
	local copyscene = GetMissionParam( sceneId, selfId, misIndex, x050101_g_Param_sceneid )

	-- 设置放弃连环任务to� 鸬 时间
	--begin modified by zhangguoxin 090207
	--local CurTime = GetHourTime()											-- 当前时间
	local CurTime = GetQuarterTime()											-- 当前时间
	--begin modified by zhangguoxin 090207
	SetMissionData( sceneId, selfId, MD_ROUNDMISSION2, CurTime )

	--删除玩家任务列表中对应to� 鸬 任务
	DelMission( sceneId, selfId, x050101_g_MissionId )
	
	--喧ng否喧ng所C to� 鸬 副本
	local fubentype = LuaFnGetCopySceneData_Param( sceneId, 0 )

	if sceneId == copyscene and fubentype == x050101_g_CopySceneType then											-- 如果T読 副本里删除任务,则直接传送回
		x050101_NotifyFailTips( sceneId, selfId, "Nhi甿 v� th b読!" )
		local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )		-- 取 餴琺副本入口场景号
		NewWorld( sceneId, selfId, oldsceneId, x050101_g_Back_X, x050101_g_Back_Z )
	end
end

--**********************************
--副本场景定时器事件
--**********************************
function x050101_OnCopySceneTimer( sceneId, nowTime )
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

	local LevelGap = LuaFnGetCopySceneData_Param( sceneId, CopyScene_LevelGap )

	if leaveFlag == 1 then															-- C 离开
		--离开倒计时间to� 鸬 读取和设置
		local leaveTickCount = LuaFnGetCopySceneData_Param( sceneId, 5 )
		leaveTickCount = leaveTickCount + 1
		LuaFnSetCopySceneData_Param( sceneId, 5, leaveTickCount )

		if leaveTickCount >= x050101_g_CloseTick then										-- 倒计时间到,大家都出去吧
			--将当前副本场景里to� 鸬 所有人传送回原来进入时候to� 鸬 场景
			for i=0, membercount-1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					x050101_Exit( sceneId, mems[i] )
				end
			end
		else
			--通知当前副本场景里to� 鸬 所有人,场景关闭倒计时间
			local strText = format( "C醕 h� s� r秈 kh鰅 n絠 n鄖 trong v騨g %d gi鈟 n鎍", ( x050101_g_CloseTick - leaveTickCount ) * x050101_g_TickTime )

			for i=0, membercount-1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					x050101_NotifyFailTips( sceneId, mems[i], strText )
				end
			end
		end
	elseif TickCount == x050101_g_LimitTotalHoldTime then									-- 副本总时间限制到了
		--此处设置副本任务有时间限制to� 鸬 情况,当时间到后处理...
		for	i = 0, membercount - 1 do
			if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
				x050101_NotifyFailTips( sceneId, mems[i], "Th秈 gian nhi甿 v� 疸 h猼, r秈 c鋘h..." )
				x050101_Exit( sceneId, mems[i] )
			end
		end

		--设置副本关闭标志
		LuaFnSetCopySceneData_Param( sceneId, 4, 1 )
	else
		--定时检查队伍成员to� 鸬 队伍号,如果不符合,则踢出副本
		local oldteamid = LuaFnGetCopySceneData_Param( sceneId, 6 )					-- 取 餴琺保存to� 鸬 队伍号
		local oldsceneId

		for	i = 0, membercount - 1 do
			if LuaFnIsObjValid( sceneId, mems[i] ) == 1 and oldteamid ~= GetTeamId( sceneId, mems[i] ) then
				x050101_NotifyFailTips( sceneId, mems[i], "Ng呓i kh鬾g � trong 瘊ng 鸬i, r秈 c鋘h..." )
				x050101_Exit( sceneId, mems[i] )
			end
		end

		-- 每 ph鷗提示玩家剩余时间
		if mod( x050101_g_TickTime * TickCount, 60 ) < x050101_g_TickTime and TickCount < x050101_g_LimitTotalHoldTime then
			local str = "C騨 l読 " .. ( x050101_g_LimitTotalHoldTime - TickCount ) * x050101_g_TickTime / 60 .. " Ph鷗..."
			for	i = 0, membercount - 1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					x050101_NotifyFailTips( sceneId, mems[i], str )
				end
			end
		end

		local monstercount = GetMonsterCount( sceneId )
		local bossId, GroupID, bossX, bossZ = -1
		local x, z = GetLastPatrolPoint( sceneId, 0 )
		for i = 0, monstercount - 1 do
			if LuaFnGetCopySceneData_Param( sceneId, 14 ) > 0 then
				break
			end

			bossId = GetMonsterObjID( sceneId, i )
			GroupID = GetMonsterGroupID( sceneId, bossId )

			if GroupID == x050101_g_BossGroup then												-- 判断 Boss 喧ng否逃到指定地 餴琺
				bossX, bossZ = GetWorldPos( sceneId, bossId )
				--	如果逃到了则
				if (x - bossX) * (x - bossX) + (z - bossZ) * (z - bossZ) < 25 then		-- 离终 餴琺不到 5 米
					-- 疯狂逃窜后to� 鸬 发呆喧ng必要to� 鸬 
					NpcToIdle( sceneId, bossId )
					-- 恢复气血
					RestoreHp( sceneId, bossId )
					-- 基础 AI 变为 0
					SetNPCAIType( sceneId, bossId, 0 )
					-- 扩展 AI 变为 129
					SetAIScriptID( sceneId, bossId, 129 )
					-- 删除巡逻路径
					SetPatrolId( sceneId, bossId, -1 )
					LuaFnSetCopySceneData_Param( sceneId, 14, 1 )
				end

				break
			end
		end
	end
end

--**********************************
--检测喧ng否可以提交
--**********************************
function x050101_CheckSubmit( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x050101_g_MissionId ) <= 0 then
		return 0
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x050101_g_MissionId )				--  餴琺到任务to� 鸬 序列号
	if GetMissionParam( sceneId, selfId, misIndex, x050101_g_IsMissionOkFail ) ~= 1 then
		return 0
	end

	if LuaFnGetTaskItemBagSpace( sceneId, selfId ) < 1 then
		x050101_NotifyFailTips( sceneId, selfId, "Thi猽 m祎 � v ph nhi甿 v�" )
		return 0
	end

	return 1
end

--**********************************
--提交
--**********************************
function x050101_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if GetName( sceneId, targetId ) ~= x050101_g_Name then		--判断该npc喧ng否喧ng对应任务to� 鸬 npc
		return
	end

	if x050101_CheckSubmit( sceneId, selfId ) == 1 then
		x050101_NotifyFailBox( sceneId, selfId, targetId, x050101_g_MissionComplete )
		TryRecieveItem( sceneId, selfId, x050101_g_Mail, 1 )
		DelMission( sceneId, selfId, x050101_g_MissionId )
		-- 任务籱祎 疃臣�
		LuaFnAuditQuest(sceneId, selfId, "Tr鷆 L鈓")
		local strText = x050101_g_MissionName .. "Nhi甿 v� 疸 ho鄋 th鄋h"
		x050101_NotifyFailTips( sceneId, selfId, strText )
		Msg2Player( sceneId, selfId, strText, MSG2PLAYER_PARA )

		LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 18, 0 )
		CallScriptFunction( SCENE_SCRIPT_ID, "PlaySoundEffect", sceneId, selfId, 66 )
	end
end

--**********************************
-- 对话窗口信息提示
--**********************************
function x050101_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
-- 屏幕中间信息提示
--**********************************
function x050101_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
