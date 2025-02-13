--道具: 帮贡牌30900050
--脚本号 300070

x300070_g_scriptId = 300070

x300070_g_TakeTimes = 1											-- 每天最多使用次数

--**********************************
--事件交互入口
--**********************************
function x300070_OnDefaultEvent( sceneId, selfId, bagIndex )

	local BangPaiID = GetBagItemParam(sceneId, selfId, bagIndex, 4, 2) --帮派ID
	local value = GetBagItemParam(sceneId, selfId, bagIndex, 8, 2) --帮贡数值
	local roleBangPaiID = GetHumanGuildID(sceneId, selfId)
	
	--PrintStr("BangPaiID "..BangPaiID.." value "..value.." roleBangPaiID "..roleBangPaiID)
	
	--帮派ID喧ng否相同
	if roleBangPaiID ~= BangPaiID then
		BeginEvent(sceneId)
			AddText(sceneId,"#{BGCH_8829_06}")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId, selfId)
		
		return
	end
	
	--m祎 天只能使用 x300070_g_TakeTimes 次
	local DayTimes, oldDate, nowDate, takenTimes

	DayTimes = GetMissionData( sceneId, selfId, MD_BANGGONGPAI_DAYTIME )
	oldDate = mod( DayTimes, 100000 )
	takenTimes = floor( DayTimes/100000 )

	nowDate = GetDayTime()
	if nowDate ~= oldDate then
		takenTimes = 0
		SetMissionData( sceneId, selfId, MD_BANGGONGPAI_DAYTIME, nowDate )
	end

	if takenTimes >= x300070_g_TakeTimes then
		BeginEvent(sceneId)
			AddText(sceneId,"#{BGCH_8922_31}")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId, selfId)
		
		return 0
	end
	
	if EraseItem(sceneId, selfId, bagIndex) > 0 then
	
		CityChangeAttr(sceneId, selfId, GUILD_CONTRIB_POINT, value)
	
		BeginEvent(sceneId)
			AddText(sceneId,"#{BGCH_8829_04}"..value.."#{BGCH_8829_12}")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		
		--m祎 天只能使用 x300070_g_TakeTimes 次
		DayTimes = GetMissionData( sceneId, selfId, MD_BANGGONGPAI_DAYTIME )
		takenTimes = floor( DayTimes/100000 )
		DayTimes = (takenTimes+1)*100000 + GetDayTime()
		SetMissionData( sceneId, selfId, MD_BANGGONGPAI_DAYTIME, DayTimes )
	end
	
end

--**********************************
--C醝 n鄖 物品to� 鸬 使用过程喧ng否类似于技能: 
--H� th痭g会T読 执行开始时检测C醝 n鄖 函数to� 鸬 Tr� v�,如果Tr� v玹h b読则忽略后面to� 鸬 类似技能to� 鸬 执行.
--Tr� v�1: 技能类似to� 鸬 物品,可以继续类似技能to� 鸬 执行；Tr� v�0: 忽略后面to� 鸬 操作.
--**********************************
function x300070_IsSkillLikeScript( sceneId, selfId)
	return 0; --C醝 n鄖 脚本C 动作支持
end
