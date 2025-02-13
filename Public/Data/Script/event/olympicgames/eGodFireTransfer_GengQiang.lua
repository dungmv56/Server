--创建人[ QUFEI 2008-04-18 10:27 UPDATE BugID 34369 ]
--新圣火传递活动副本任务之更强事件脚本
--本活动每天M� ra 三次,每c醝玩家每天只能参加m祎 次

--MisDescBegin
--脚本号
x808104_g_ScriptId	= 808104

--Ti猵 th挝馧PC属性
x808104_g_Position_X=242.5412
x808104_g_Position_Z=73.5041
x808104_g_SceneID=18
x808104_g_AccomplishNPC_Name="Ch鈛 V� U�"

--当前任务号
x808104_g_MissionId			= 1010
--下m祎 c醝任务to� 鸬 ID
x808104_g_MissionIdNext	= 1011
--M鴆 ti陁 nhi甿 v鴑pc
x808104_g_Name 					= "Ch鈛 V� U�"
--任务归类
x808104_g_MissionKind			= 13
--衅ng c nhi甿 v� 
x808104_g_MissionLevel		= 10
--喧ng否喧ngTinh英任务
x808104_g_IfMissionElite	= 0
--任务喧ng否已经完成
x808104_g_IsMissionOkFail	= 0		--任务参数to� 鸬 第0位

--任务文本描述
x808104_g_MissionName			= "Th醤h h鯽 truy玭 l読 c鄋g m課h"
--任务描述
x808104_g_MissionInfo			= "#{XSHCD_20080418_035}"
--M鴆 ti陁 nhi甿 v�
x808104_g_MissionTarget		= "#{XSHCD_20080418_051}"
--未Ho鄋 t nhi甿 v鴗o� 鸬 npc对话
x808104_g_ContinueInfo		= "#{XSHCD_20080418_036}"
--Ho鄋 t nhi甿 v鴑pc说to� 鸬 话
x808104_g_MissionComplete	= "#{XSHCD_20080418_037}"
--每次活动可以完成to� 鸬 次数
x808104_g_MaxRound	= 3
--控制脚本
x808104_g_ControlScript		= 001066

-- 任务完成情况,内容动态刷新,占用任务参数to� 鸬 第1,2位
x808104_g_Custom	= { {id="秀 疳nh b読 T鷆 C",num=5}, {id="秀 疳nh b読 Ti瑄 T� T�",num=1} }
--MisDescEnd

--任务喧ng否完成
x808104_g_Mission_IsComplete = 0		--任务参数to� 鸬 第0位
--击败足球to� 鸬 标记
x808104_g_KillBallIdx				 = 1		--任务参数to� 鸬 第1位
--击败小齐齐to� 鸬 标记
x808104_g_KillSunMMIdx 			 = 2		--任务参数to� 鸬 第2位

x808104_g_CompleteGengQiang_IDX	=	775	--圣火传递更强提交任务索引
x808104_g_MissionInfo_IDX				= 776	--更强副本任务� 餴琺魉饕�

--所拥有to� 鸬 事件ID列表
x808104_g_EventList	= {}

x808104_g_Impact_Accept_Mission 	 = 47		-- Ti猵 th挝袷眛o� 鸬 特效ID
x808104_g_Impact_Transport_Mission = 113 	-- 运输状态特效
x808104_g_Impact_GodOfFireMan_Mission  = 5942 -- 圣火传递男变身特效
x808104_g_Impact_GodOfFireGirl_Mission = 5943 -- 圣火传递女变身特效
x808104_g_Impact_DelGodOfFire_Mission  = 5944 -- 删除圣火特效to� 鸬 特效
x808104_g_PlayerSlow_LVL					 = 10		-- Ti猵 th挝駎o� 鸬 最低等c

x808104_g_Mission_StepNum					 = 7		-- 本任务T読 任务链to� 鸬 第几步

x808104_g_ItemId = { id=40004447,num=1 }	-- 任务物品

-- 圣火活动时间
x808104_g_Activity_Day						 = { dstart=504,  dend=510 }
x808104_g_Activity_Time						 = { tstart=1945, tend=2245 }

-- 5月10号后to� 鸬 活动M� ra 时间,每周五
x808104_g_Activity_DayTime				 = 5

-- 奖励Kinh nghi甿和金钱(与等c有关)
x808104_g_MoneyBonus_Param1				 = 30 
x808104_g_MoneyBonus_Param2				 = 320
x808104_g_ExpBonus_Param1				 	 = 160
x808104_g_ExpBonus_Param2				 	 = 500

--**********************************
--任务入口函数
--**********************************
-- 餴琺击该任务后执行此脚本
function x808104_OnDefaultEvent( sceneId, selfId, targetId )

	--判断该npc喧ng否喧ng对应任务to� 鸬 npc
	if LuaFnGetName( sceneId, targetId ) ~= x808104_g_Name then
		x808104_NotifyTip( sceneId, selfId, "Nh nhi甿 v� th b読" )					
		return 0
	end
			
	local	key	= GetNumText()
	if key == x808104_g_CompleteGengQiang_IDX then		
		-- 如果已经接了任务圣火传递更强
		if IsHaveMission( sceneId, selfId, x808104_g_MissionId ) > 0 then
												
			--发送任务需求to� 鸬 信息
			BeginEvent(sceneId)
				AddText(sceneId, x808104_g_MissionName)
				AddText(sceneId, x808104_g_ContinueInfo)			
			EndEvent( )
			
			local bDone = x808104_CheckSubmit( sceneId, selfId, targetId )				
			DispatchMissionDemandInfo(sceneId, selfId, targetId, x808104_g_ScriptId, x808104_g_MissionId, bDone)
			
		else			
			x808104_TalkInfo( sceneId, selfId, targetId, "#{XSHCD_20080418_081}" )
			return 0
		end

	elseif key == x808104_g_MissionInfo_IDX then
		x808104_TalkInfo( sceneId, selfId, targetId, "#{XSHCD_20080418_007}" )		
		return 0

	else
		x808104_NotifyTip( sceneId, selfId, "Nh nhi甿 v� th b読" )					
		return 0
	end

end

--**********************************
--列举事件
--**********************************
function x808104_OnEnumerate( sceneId, selfId, targetId )
	
	--判断该npc喧ng否喧ng对应任务to� 鸬 npc
	if LuaFnGetName( sceneId, targetId ) ~= x808104_g_Name
		 or sceneId ~= x808104_g_SceneID then
		return 0
	end

	if IsHaveMission( sceneId, selfId, x808104_g_MissionId ) > 0 then
		local misIndex = GetMissionIndexByID(sceneId,selfId,x808104_g_MissionId)

		-- 检测任务喧ng否完成	
		if GetMissionParam(sceneId, selfId, misIndex, x808104_g_Mission_IsComplete) > 0 then
			AddNumText( sceneId, x808104_g_ScriptId, "Ta 疸 ho鄋 th鄋h: Th醤h h鯽 truy玭 l読 c鄋g m課h", 7, x808104_g_CompleteGengQiang_IDX )
			-- AddNumText( sceneId, x808104_g_ScriptId, "圣火传递更强介绍", 11, x808104_g_MissionInfo_IDX )
		end
	end

end

--**********************************
--检测Ti猵 th跫�,也供子任务调用
--**********************************
function x808104_CheckAccept( sceneId, selfId, targetId )
	
	--检测玩家喧ng否符合Ti猵 th挝駎o� 鸬 条件
	--判断该npc喧ng否喧ng对应任务to� 鸬 npc
	if LuaFnGetName( sceneId, targetId ) ~= x808104_g_Name then
		x808104_NotifyTip( sceneId, selfId, "Nh nhi甿 v� th b読" )					
		return 0
	end
	
	--检测活动喧ng否过期
	if x808104_CheckHuoDongTime() <= 0 then
		x808104_TalkInfo( sceneId, selfId, targetId, "#{XSHCD_20080418_069}" )
		return 0
	end
	
	--检测等c
	if LuaFnGetLevel( sceneId, selfId ) < x808104_g_PlayerSlow_LVL then		
		x808104_TalkInfo( sceneId, selfId, targetId, "#{XSHCD_20080418_064}" )
		return 0
	end

	--检测运输状态驻留效果
	if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x808104_g_Impact_Transport_Mission) ~= 0
		 or LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x808104_g_Impact_DelGodOfFire_Mission) ~= 0 then
		x808104_TalkInfo( sceneId, selfId, targetId, "#{GodFire_Info_014}" )
		return 0
	end

	--已经接过则不符合条件
	if IsHaveMission( sceneId, selfId, x808104_g_MissionId ) > 0 then
		x808104_TalkInfo( sceneId, selfId, targetId, "#{XSHCD_20080418_067}" )
		return 0
	end

	--检测玩家参加本次活动任务链第几步
	local	nStepNum = GetMissionData( sceneId, selfId, MD_GODOFFIRE_COMPLETE_STEPNUM )
	if nStepNum ~= x808104_g_Mission_StepNum then
		x808104_TalkInfo( sceneId, selfId, targetId, "#{XSHCD_20080418_066}" )
		return 0
	end

	--检测喧ng否处于双人骑乘状态
	if LuaFnGetDRideFlag(sceneId, selfId) ~= 0  then
		x808104_TalkInfo( sceneId, selfId, targetId, "#{ResultText_117}" )
		return 0
	end
	
	return 1
end

--**********************************
--Ti猵 th�,仅供子任务调用设置公共参数
--**********************************
function x808104_OnAccept( sceneId, selfId, targetId, scriptId )
	
	--判断该npc喧ng否喧ng对应任务to� 鸬 npc
 	if LuaFnGetName( sceneId, targetId ) ~= x808104_g_Name then
 		x808104_NotifyTip( sceneId, selfId, "Nh nhi甿 v� th b読" )					
		return 0
	end

	if x808104_CheckAccept( sceneId, selfId, targetId )<=0 then
		return 0
	end

	if LuaFnGetTaskItemBagSpace( sceneId, selfId ) < x808104_g_ItemId.num then
		x808104_NotifyTip( sceneId, selfId, "#{QX_20071129_027}" )		
		return 0
	end

	BeginAddItem(sceneId)
	AddItem(sceneId,x808104_g_ItemId.id, x808104_g_ItemId.num)
	local canAdd = EndAddItem(sceneId,selfId)						
	if canAdd > 0 then
		--加入任务到玩家列表
		local bAdd = AddMission( sceneId, selfId, x808104_g_MissionId, x808104_g_ScriptId, 0, 0, 0 )
		if bAdd >= 1 then				
			AddItemListToHuman(sceneId,selfId)
			
			-- 餴琺到任务to� 鸬 序列号
			local	misIndex		= GetMissionIndexByID( sceneId, selfId, x808104_g_MissionId )
			
			--根据序列号把任务变量to� 鸬 第0位置0 (任务完成情况)
			SetMissionByIndex( sceneId, selfId, misIndex, x808104_g_Mission_IsComplete, 0 )

			SetMissionByIndex( sceneId, selfId, misIndex, x808104_g_KillBallIdx, 0 )		
			SetMissionByIndex( sceneId, selfId, misIndex, x808104_g_KillSunMMIdx, 0 )

			-- LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x808104_g_Impact_Transport_Mission, 0 )
			-- LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x808104_g_Impact_DelGodOfFire_Mission, 0 )

			BeginEvent(sceneId)
				AddText(sceneId,x808104_g_MissionName)
				AddText(sceneId,x808104_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}#r")
				AddText(sceneId,"#{XSHCD_20080418_051}")				
				AddText(sceneId,"#{XSHCD_20080418_007}")				
			EndEvent( )					
			DispatchEventList(sceneId, selfId, targetId)
			
			-- LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x808104_g_Impact_Accept_Mission, 0 )
		end
	end

	return 1

end

--**********************************
--放弃,仅供子任务调用
--**********************************
function x808104_OnAbandon( sceneId, selfId )
  
  --删除玩家任务列表中对应to� 鸬 任务,物品和驻留效果
  if HaveItem(sceneId, selfId, x808104_g_ItemId.id) > 0 then
  	if LuaFnGetAvailableItemCount(sceneId, selfId, x808104_g_ItemId.id) >= x808104_g_ItemId.num then
  		DelItem( sceneId, selfId, x808104_g_ItemId.id, LuaFnGetAvailableItemCount(sceneId, selfId, x808104_g_ItemId.id) )
  	else
	  	x808104_NotifyTip( sceneId, selfId, "V ph hi畁 t読 kh鬾g th� d鵱g ho 疸 b� kho�!" )			
			return 0
  	end
  end

  if IsHaveMission( sceneId, selfId, x808104_g_MissionId ) > 0 then
	 	DelMission( sceneId, selfId, x808104_g_MissionId )
	end
	
	return 0

end

--**********************************
--继续
--**********************************
function x808104_OnContinue( sceneId, selfId, targetId )
	
	--判断该npc喧ng否喧ng对应任务to� 鸬 npc
	if LuaFnGetName( sceneId, targetId ) ~= x808104_g_AccomplishNPC_Name then
		x808104_NotifyTip( sceneId, selfId, "Nh nhi甿 v� th b読" )					
		return 0
	end

	-- 检查任务喧ng否完成
	if x808104_CheckSubmit( sceneId, selfId, targetId ) ~= 1 then			
		return 0
	end
	
	BeginEvent(sceneId)
		AddText(sceneId,x808104_g_MissionName)
		AddText( sceneId, x808104_g_MissionComplete )				
	EndEvent( )
	DispatchMissionContinueInfo(sceneId,selfId,targetId,x808104_g_ScriptId,x808104_g_MissionId)
	
end

--**********************************
--检测喧ng否可以提交
--**********************************
function x808104_CheckSubmit( sceneId, selfId, targetId )

	--判断该npc喧ng否喧ng对应任务to� 鸬 npc
	if LuaFnGetName( sceneId, targetId ) ~= x808104_g_AccomplishNPC_Name then
		x808104_NotifyTip( sceneId, selfId, "Tr� nhi甿 v� th b読" )					
		return 0
	end

	if IsHaveMission( sceneId, selfId, x808104_g_MissionId ) <= 0 then
		x808104_TalkInfo( sceneId, selfId, targetId, "#{XSHCD_20080418_081}" )
		return 0
	end

	local misIndex = GetMissionIndexByID(sceneId,selfId,x808104_g_MissionId)

	-- 检测任务喧ng否完成	
	if GetMissionParam(sceneId, selfId, misIndex, x808104_g_Mission_IsComplete) > 0 then
		return 1
	end
	
	return 0
	
end

--**********************************
--提交,仅供子任务调用
--**********************************
function x808104_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	
	--判断该npc喧ng否喧ng对应任务to� 鸬 npc
	if LuaFnGetName( sceneId, targetId ) ~= x808104_g_AccomplishNPC_Name then
		x808104_NotifyTip( sceneId, selfId, "Tr� nhi甿 v� th b読" )					
		return 0
	end

  -- 检查任务喧ng否完成
	if x808104_CheckSubmit( sceneId, selfId, targetId ) ~= 1 then
		x808104_NotifyTip( sceneId, selfId, "Tr� nhi甿 v� th b読" )				
		return 0
	end
	
	local strText = ""

	local playerlvl = LuaFnGetLevel( sceneId, selfId )
	local nExpNum = x808104_g_ExpBonus_Param1*playerlvl+x808104_g_ExpBonus_Param2
	local nMoneyNum = x808104_g_MoneyBonus_Param1*playerlvl+x808104_g_MoneyBonus_Param2

	nExpNum = floor(nExpNum)
	nMoneyNum = floor(nMoneyNum)
	LuaFnAddExp( sceneId, selfId, nExpNum )
	AddMoney( sceneId, selfId, nMoneyNum )
	-- x808104_TalkInfo( sceneId, selfId, targetId, strText )
	
	-- 活动顺利完成
	x808104_NotifyTip( sceneId, selfId, "#{XSHCD_20080418_092}" )

	x808104_DelMissionInfo( sceneId, selfId )

end

function x808104_OnKillObject( sceneId, selfId, objdataId ,objId)--参数意思: 场景号、玩家objId、怪物表位置号、怪物
end

--**********************************
--进入区域事件
--**********************************
function x808104_OnEnterArea( sceneId, selfId, zoneId )	
end

--**********************************
--道具改变
--**********************************
function x808104_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--接任务后显示to� 鸬 界面
--**********************************
function x808104_AcceptDialog(sceneId, selfId, rand, g_Dialog, targetId )

	BeginEvent( sceneId )
		AddText( sceneId, g_Dialog )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

end

--**********************************
--交任务后显示to� 鸬 界面
--**********************************
function x808104_SubmitDialog( sceneId, selfId, rand )
end

--**********************************
--醒目提示
--**********************************
function x808104_NotifyTip( sceneId, selfId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end

--**********************************
--与NPC对话
--**********************************
function x808104_TalkInfo( sceneId, selfId, targetId, msg )

	BeginEvent(sceneId)
		AddText( sceneId, msg )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end

--**********************************
--取 餴琺本事件to� 鸬 MissionId,用于obj文件中对话情景to� 鸬 判断
--**********************************
function x808104_GetEventMissionId( sceneId, selfId )	
	return x808104_g_MissionId
end

function x808104_AcceptMission( sceneId, selfId, targetId )
	
	--判断该npc喧ng否喧ng对应任务to� 鸬 npc
	if LuaFnGetName( sceneId, targetId ) ~= x808104_g_Name then
		x808104_NotifyTip( sceneId, selfId, "Nh nhi甿 v� th b読" )
		return 0
	end

	local  PlayerName=GetName(sceneId,selfId)		
	
	--发送任务Ti猵 th毕允総o� 鸬 信息
	BeginEvent(sceneId)
		AddText(sceneId,x808104_g_MissionName)
		AddText( sceneId, x808104_g_MissionInfo )
		AddText(sceneId,"#{M_MUBIAO}")
		AddText(sceneId,"#{XSHCD_20080418_051}")
		AddText(sceneId,"#{M_SHOUHUO}")
		AddText(sceneId,"#{XSHCD_20080418_096}")
		
	EndEvent( )
	DispatchMissionInfo(sceneId,selfId,targetId,x808104_g_ScriptId,x808104_g_MissionId)	

end

--/////////////////////////////////////////////////////////////////////////////////////////////////////
--获取具体itemto� 鸬 详细信息
function x808104_GetItemDetailInfo(itemId)
	return 0
end	

--**********************************
--检测活动时间
--**********************************
function x808104_CheckHuoDongTime()

	local nMonth = GetTodayMonth()+1
	local nDate	 = GetTodayDate()
	local nHour	 = GetHour()
	local nMinute = GetMinute()
	local nThisDay = GetTodayWeek()
	local curDateTime = nMonth*100+nDate
  local curHourTime = nHour*100+nMinute
  
  if curHourTime >= x808104_g_Activity_Time.tstart and curHourTime <= x808104_g_Activity_Time.tend then
  	if curDateTime >= x808104_g_Activity_Day.dstart and curDateTime <= x808104_g_Activity_Day.dend then
  		return 1
 		elseif curDateTime > x808104_g_Activity_Day.dend and nThisDay == x808104_g_Activity_DayTime then
  		return 1
  	end
  end


	return 0

end

--**********************************
--道具使用
--**********************************
function x808104_OnUseItem( sceneId, selfId, bagIndex )	
end

--**********************************
--死亡事件
--**********************************
function x808104_OnDie( sceneId, selfId, killerId )
end

--**********************************
--删除活动信息
--删除玩家任务列表中对应to� 鸬 任务,物品和驻留效果
--**********************************
function x808104_DelMissionInfo( sceneId, selfId )

  if HaveItem(sceneId, selfId, x808104_g_ItemId.id) > 0 then
  	if LuaFnGetAvailableItemCount(sceneId, selfId, x808104_g_ItemId.id) >= x808104_g_ItemId.num then
  		DelItem( sceneId, selfId, x808104_g_ItemId.id, LuaFnGetAvailableItemCount(sceneId, selfId, x808104_g_ItemId.id) )  	
  	end
  end

  if IsHaveMission( sceneId, selfId, x808104_g_MissionId ) > 0 then
	 	DelMission( sceneId, selfId, x808104_g_MissionId )
	end
	
	return 0

end
