--创建人[ QUFEI 2008-04-18 10:27 UPDATE BugID 34369 ]
--新圣火传递活动之闪耀to� 鸬 圣火事件脚本
--本活动每天M� ra 三次,每c醝玩家每天只能参加m祎 次

--MisDescBegin
--脚本号
x808097_g_ScriptId	= 808097

--Ti猵 th挝馧PC属性
x808097_g_Position_X=255.9010
x808097_g_Position_Z=126.7257
x808097_g_SceneID=2
x808097_g_AccomplishNPC_Name="Th鈔 T靚h"

--任务号
x808097_g_MissionId			= 1003
--下m祎 c醝任务to� 鸬 ID
x808097_g_MissionIdNext	= 1004
--M鴆 ti陁 nhi甿 v鵗読 场景
x808097_g_AcceptNPC_SceneID	=	30
--M鴆 ti陁 nhi甿 v鴑pc
x808097_g_Name 					= "T� Phi"
--任务归类
x808097_g_MissionKind			= 13
--衅ng c nhi甿 v� 
x808097_g_MissionLevel		= 10
--喧ng否喧ngTinh英任务
x808097_g_IfMissionElite	= 0
--任务喧ng否已经完成
x808097_g_IsMissionOkFail	= 0		--任务参数to� 鸬 第0位

--任务文本描述
x808097_g_MissionName			= "Thi琺 di畊  th醤h h鯽"
--任务描述
x808097_g_MissionInfo			= "#{XSHCD_20080418_014}"
--M鴆 ti陁 nhi甿 v�
x808097_g_MissionTarget		= "#{XSHCD_20080418_044}"
--未Ho鄋 t nhi甿 v鴗o� 鸬 npc对话
x808097_g_ContinueInfo		= "#{XSHCD_20080418_015}"
--Ho鄋 t nhi甿 v鴑pc说to� 鸬 话
x808097_g_MissionComplete	= "#{XSHCD_20080418_016}"
--每次活动可以完成to� 鸬 次数
x808097_g_MaxRound	= 3
--控制脚本
x808097_g_ControlScript		= 001066

-- 任务完成情况,内容动态刷新,占用任务参数to� 鸬 第1位
x808097_g_Custom	= { {id="秀 餰m Th醤h H鯽 giao cho 姓i L� Th鈔 T靚h",num=1} }
--MisDescEnd

--任务喧ng否完成
x808097_g_Mission_IsComplete = 0		--任务参数to� 鸬 第0位
--圣火交给尚鷑g閠o� 鸬 标记
x808097_g_RecordIdx 				 = 1		--任务参数to� 鸬 第1位
--任务脚本号记录
x808097_g_MissScriptID_Idx	 = 2		--任务参数to� 鸬 第2位
--任务发布NPC标记
x808097_g_AcceptNPC_Idx			 = 3		--任务参数to� 鸬 第3位 3.姓i L齆PC


x808097_g_AcceptMission_IDX		= 765	--闪耀to� 鸬 圣火接收任务索引
x808097_g_CompleteMission_IDX	= 766	--闪耀to� 鸬 圣火提交任务索引
x808097_g_MissionInfo_IDX			= 767	--任务� 餴琺魉饕�

--所拥有to� 鸬 事件ID列表
x808097_g_EventList	= {}

x808097_g_Impact_Accept_Mission 	 = 47		-- Ti猵 th挝袷眛o� 鸬 特效ID
x808097_g_Impact_Transport_Mission = 113 	-- 运输状态特效
x808097_g_Impact_GodOfFireMan_Mission  = 5942 -- 圣火传递男变身特效
x808097_g_Impact_GodOfFireGirl_Mission = 5943 -- 圣火传递女变身特效
x808097_g_Impact_DelGodOfFire_Mission  = 5944 -- 删除圣火特效to� 鸬 特效
x808097_g_PlayerSlow_LVL					 = 10		-- Ti猵 th挝駎o� 鸬 最低等c

x808097_g_Mission_StepNum					 = 1		-- 本任务T読 任务链to� 鸬 第几步

x808097_g_ItemId = { id=40004447,num=1 }	-- 任务物品

-- 圣火活动时间
x808097_g_Activity_Day						 = { dstart=504,  dend=510 }
x808097_g_Activity_Time						 = { tstart=1945, tend=2245 }

-- 5月10号后to� 鸬 活动M� ra 时间,每周五
x808097_g_Activity_DayTime				 = 5

-- 奖励Kinh nghi甿和金钱(与等c有关)
x808097_g_MoneyBonus_Param1				 = 30 
x808097_g_MoneyBonus_Param2				 = 320
x808097_g_ExpBonus_Param1				 	 = 160
x808097_g_ExpBonus_Param2				 	 = 500

--**********************************
--任务入口函数
--**********************************
-- 餴琺击该任务后执行此脚本
function x808097_OnDefaultEvent( sceneId, selfId, targetId )

	local	key	= GetNumText()	
	if key == x808097_g_AcceptMission_IDX then
		--判断该npc喧ng否喧ng对应任务to� 鸬 npc
		if LuaFnGetName( sceneId, targetId ) ~= x808097_g_Name then
			x808097_NotifyTip( sceneId, selfId, "Nh nhi甿 v� th b読" )					
			return 0
		end
		-- 任务喧ng否已满
		if IsMissionFull( sceneId, selfId ) == 1 then
			x808097_NotifyTip( sceneId, selfId, "#{QIANXUN_INFO_23}" )
			return 0
		end
		
		-- 检测任务Ti猵 th跫�
		if x808097_CheckAccept( sceneId, selfId, targetId )<=0 then
			return 0
		end

		-- 进入Ti猵 th挝窠缑�			
		x808097_AcceptMission( sceneId, selfId, targetId )				
	
	elseif key == x808097_g_CompleteMission_IDX then
		--判断该npc喧ng否喧ng对应任务to� 鸬 npc
		if LuaFnGetName( sceneId, targetId ) ~= x808097_g_AccomplishNPC_Name then
			x808097_NotifyTip( sceneId, selfId, "Tr� nhi甿 v� th b読!" )					
			return 0
		end
		-- 如果已经接了任务闪耀to� 鸬 圣火
		if IsHaveMission( sceneId, selfId, x808097_g_MissionId) > 0 then
												
			--发送任务需求to� 鸬 信息
			BeginEvent(sceneId)
				AddText(sceneId, x808097_g_MissionName)
				AddText(sceneId, x808097_g_ContinueInfo)			
			EndEvent( )
			
			local bDone = x808097_CheckSubmit( sceneId, selfId, targetId )				
			DispatchMissionDemandInfo(sceneId, selfId, targetId, x808097_g_ScriptId, x808097_g_MissionId, bDone)
			
		else			
			x808097_TalkInfo( sceneId, selfId, targetId, "#{XSHCD_20080418_074}" )
			return 0
		end
	elseif key == x808097_g_MissionInfo_IDX then
		--判断该npc喧ng否喧ng对应任务to� 鸬 npc
		if LuaFnGetName( sceneId, targetId ) ~= x808097_g_Name then
			x808097_NotifyTip( sceneId, selfId, "Nh nhi甿 v� th b読" )					
			return 0
		end
		x808097_TalkInfo( sceneId, selfId, targetId, "#{XSHCD_20080418_007}" )		
		return 0

	else
		x808097_NotifyTip( sceneId, selfId, "Nh nhi甿 v� th b読" )					
		return 0
	end

end

--**********************************
--列举事件
--**********************************
function x808097_OnEnumerate( sceneId, selfId, targetId )

	if LuaFnGetName( sceneId, targetId ) == x808097_g_Name
		 and sceneId == x808097_g_AcceptNPC_SceneID then
		 if IsHaveMission( sceneId, selfId, x808097_g_MissionId ) <= 0 then
		 		local	nStepNum = GetMissionData( sceneId, selfId, MD_GODOFFIRE_COMPLETE_STEPNUM )
				if nStepNum == x808097_g_Mission_StepNum then
					AddNumText( sceneId, x808097_g_ScriptId, "Ta mu痭 tham gia: Thi琺 di畊 Th醤h H鯽", 7, x808097_g_AcceptMission_IDX )
				end
		 end
		-- AddNumText( sceneId, x808097_g_ScriptId, "闪耀to� 鸬 圣火介绍", 11, x808097_g_MissionInfo_IDX )
	elseif LuaFnGetName( sceneId, targetId ) == x808097_g_AccomplishNPC_Name
				 and sceneId == x808097_g_SceneID then
	
		if IsHaveMission( sceneId, selfId, x808097_g_MissionId ) > 0 then
			local misIndex = GetMissionIndexByID(sceneId,selfId,x808097_g_MissionId)

			-- 检测任务喧ng否完成	
			if GetMissionParam(sceneId, selfId, misIndex, x808097_g_Mission_IsComplete) <= 0 then
				SetMissionByIndex( sceneId, selfId, misIndex, x808097_g_Mission_IsComplete, 1 )
				SetMissionByIndex( sceneId, selfId, misIndex, x808097_g_RecordIdx, 1 )
				x808097_NotifyTip( sceneId, selfId, "#{XSHCD_20080418_101}" )
				x808097_TalkInfo( sceneId, selfId, targetId, "#{XSHCD_20080418_098}" )
				return 0
			else
				AddNumText( sceneId, x808097_g_ScriptId, "Ta mu痭 ho鄋 th鄋h: Thi琺 di畊 Th醤h H鯽", 7, x808097_g_CompleteMission_IDX )
			end
		end
	else
		return 0
	end

end

--**********************************
--检测Ti猵 th跫�,也供子任务调用
--**********************************
function x808097_CheckAccept( sceneId, selfId, targetId )
	
	--检测玩家喧ng否符合Ti猵 th挝駎o� 鸬 条件
	--判断该npc喧ng否喧ng对应任务to� 鸬 npc
	if LuaFnGetName( sceneId, targetId ) ~= x808097_g_Name then
		x808097_NotifyTip( sceneId, selfId, "Nh nhi甿 v� th b読" )					
		return 0
	end
	
	--检测活动喧ng否过期
	if x808097_CheckHuoDongTime() <= 0 then
		x808097_TalkInfo( sceneId, selfId, targetId, "#{XSHCD_20080418_069}" )
		return 0
	end
	
	--检测等c
	if LuaFnGetLevel( sceneId, selfId ) < x808097_g_PlayerSlow_LVL then		
		x808097_TalkInfo( sceneId, selfId, targetId, "#{XSHCD_20080418_064}" )
		return 0
	end

	--检测运输状态驻留效果
	if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x808097_g_Impact_Transport_Mission) ~= 0
		 or LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x808097_g_Impact_DelGodOfFire_Mission) ~= 0 then
		x808097_TalkInfo( sceneId, selfId, targetId, "#{GodFire_Info_014}" )
		return 0
	end

	--已经接过则不符合条件
	if IsHaveMission( sceneId, selfId, x808097_g_MissionId ) > 0 then
		x808097_TalkInfo( sceneId, selfId, targetId, "#{XSHCD_20080418_067}" )
		return 0
	end

	--检测玩家参加本次活动任务链第几步
	local	nStepNum = GetMissionData( sceneId, selfId, MD_GODOFFIRE_COMPLETE_STEPNUM )
	if nStepNum ~= x808097_g_Mission_StepNum then
		x808097_TalkInfo( sceneId, selfId, targetId, "#{XSHCD_20080418_066}" )
		return 0
	end

	--检测喧ng否处于双人骑乘状态
	if LuaFnGetDRideFlag(sceneId, selfId) ~= 0  then
		x808097_TalkInfo( sceneId, selfId, targetId, "#{ResultText_117}" )
		return 0
	end
	
	return 1
end

--**********************************
--Ti猵 th�,仅供子任务调用设置公共参数
--**********************************
function x808097_OnAccept( sceneId, selfId, targetId, scriptId )
	
	--判断该npc喧ng否喧ng对应任务to� 鸬 npc
 	if LuaFnGetName( sceneId, targetId ) ~= x808097_g_Name then
 		x808097_NotifyTip( sceneId, selfId, "Nh nhi甿 v� th b読" )					
		return 0
	end

	if x808097_CheckAccept( sceneId, selfId, targetId )<=0 then
		return 0
	end

	if LuaFnGetTaskItemBagSpace( sceneId, selfId ) < x808097_g_ItemId.num then
		x808097_NotifyTip( sceneId, selfId, "#{QX_20071129_027}" )		
		return 0
	end

	BeginAddItem(sceneId)
	AddItem(sceneId,x808097_g_ItemId.id, x808097_g_ItemId.num)
	local canAdd = EndAddItem(sceneId,selfId)						
	if canAdd > 0 then
		--加入任务到玩家列表
		local bAdd = AddMission( sceneId, selfId, x808097_g_MissionId, x808097_g_ScriptId, 0, 0, 0 )
		if bAdd >= 1 then				
			AddItemListToHuman(sceneId,selfId)
			
			-- 餴琺到任务to� 鸬 序列号
			local	misIndex		= GetMissionIndexByID( sceneId, selfId, x808097_g_MissionId )
			
			--根据序列号把任务变量to� 鸬 第0位置0 (任务完成情况)
			SetMissionByIndex( sceneId, selfId, misIndex, x808097_g_Mission_IsComplete, 0 )
			SetMissionByIndex( sceneId, selfId, misIndex, x808097_g_RecordIdx, 0 )
			--根据序列号把任务变量to� 鸬 第2位置为任务脚本号
			SetMissionByIndex( sceneId, selfId, misIndex, x808097_g_MissScriptID_Idx, scriptId )		
			SetMissionByIndex(sceneId, selfId, misIndex, x808097_g_AcceptNPC_Idx, 3)

			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x808097_g_Impact_Transport_Mission, 0 )
			
			-- 根据性别给变身Buffer
			if GetSex( sceneId, selfId ) == 1 then
				LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x808097_g_Impact_GodOfFireMan_Mission, 0 )
			else
				LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x808097_g_Impact_GodOfFireGirl_Mission, 0 )
			end
			
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x808097_g_Impact_DelGodOfFire_Mission, 0 )

			BeginEvent(sceneId)
				AddText(sceneId,x808097_g_MissionName)
				AddText(sceneId,x808097_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}#r")
				AddText(sceneId,"#{XSHCD_20080418_044}")				
				AddText(sceneId,"#{XSHCD_20080418_007}")				
			EndEvent( )					
			DispatchEventList(sceneId, selfId, targetId)
			
			-- LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x808097_g_Impact_Accept_Mission, 0 )
		end
	end

	return 1

end

--**********************************
--放弃,仅供子任务调用
--**********************************
function x808097_OnAbandon( sceneId, selfId )
  
  --删除玩家任务列表中对应to� 鸬 任务,物品和驻留效果
  if HaveItem(sceneId, selfId, x808097_g_ItemId.id) > 0 then
  	if LuaFnGetAvailableItemCount(sceneId, selfId, x808097_g_ItemId.id) >= x808097_g_ItemId.num then
  		DelItem( sceneId, selfId, x808097_g_ItemId.id, LuaFnGetAvailableItemCount(sceneId, selfId, x808097_g_ItemId.id) )
  	else
	  	x808097_NotifyTip( sceneId, selfId, "V ph hi畁 t読 kh鬾g th� d鵱g!" )			
			return 0
  	end
  end

  if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x808097_g_Impact_Transport_Mission) ~= 0 then
  	-- 如果玩家正T読 漕运或跑商就不清除运输Buff
  	if IsHaveMission( sceneId, selfId, 4021 ) <= 0
  		 and GetItemCount(sceneId, selfId, 40002000) <= 0 then  	
  		LuaFnCancelSpecificImpact( sceneId, selfId, x808097_g_Impact_Transport_Mission )
  	end
  end
  
  if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x808097_g_Impact_GodOfFireMan_Mission) ~= 0 then
  	LuaFnCancelSpecificImpact( sceneId, selfId, x808097_g_Impact_GodOfFireMan_Mission )
  end
  
  if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x808097_g_Impact_GodOfFireGirl_Mission) ~= 0 then
  	LuaFnCancelSpecificImpact( sceneId, selfId, x808097_g_Impact_GodOfFireGirl_Mission )
  end
  
  if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x808097_g_Impact_DelGodOfFire_Mission) ~= 0 then
  	LuaFnCancelSpecificImpact( sceneId, selfId, x808097_g_Impact_DelGodOfFire_Mission )
  end
  
  if IsHaveMission( sceneId, selfId, x808097_g_MissionId ) > 0 then
	 	DelMission( sceneId, selfId, x808097_g_MissionId )
	end
	
	return 0

end

--**********************************
--继续
--**********************************
function x808097_OnContinue( sceneId, selfId, targetId )
	
	--判断该npc喧ng否喧ng对应任务to� 鸬 npc
	if LuaFnGetName( sceneId, targetId ) ~= x808097_g_AccomplishNPC_Name then
		x808097_NotifyTip( sceneId, selfId, "Tr� nhi甿 v� th b読!" )					
		return 0
	end

	-- 检查任务喧ng否完成
	if x808097_CheckSubmit( sceneId, selfId, targetId ) ~= 1 then			
		return 0
	end
	
	BeginEvent(sceneId)
		AddText(sceneId,x808097_g_MissionName)
		AddText( sceneId, x808097_g_MissionComplete )				
	EndEvent( )
	DispatchMissionContinueInfo(sceneId,selfId,targetId,x808097_g_ScriptId,x808097_g_MissionId)
	
end

--**********************************
--检测喧ng否可以提交
--**********************************
function x808097_CheckSubmit( sceneId, selfId, targetId )

	--判断该npc喧ng否喧ng对应任务to� 鸬 npc
	if LuaFnGetName( sceneId, targetId ) ~= x808097_g_AccomplishNPC_Name then
		x808097_NotifyTip( sceneId, selfId, "Tr� nhi甿 v� th b読!" )					
		return 0
	end

	if IsHaveMission( sceneId, selfId, x808097_g_MissionId ) <= 0 then
		x808097_TalkInfo( sceneId, selfId, targetId, "#{XSHCD_20080418_074}" )
		return 0
	end

	local misIndex = GetMissionIndexByID(sceneId,selfId,x808097_g_MissionId)

	-- 检测任务喧ng否完成	
	if GetMissionParam(sceneId, selfId, misIndex, x808097_g_Mission_IsComplete) > 0 then
		return 1
	end
	
	return 0
	
end

--**********************************
--提交,仅供子任务调用
--**********************************
function x808097_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	
	--判断该npc喧ng否喧ng对应任务to� 鸬 npc
	if LuaFnGetName( sceneId, targetId ) ~= x808097_g_AccomplishNPC_Name then
		x808097_NotifyTip( sceneId, selfId, "Tr� nhi甿 v� th b読!" )					
		return 0
	end

  -- 检查任务喧ng否完成
	if x808097_CheckSubmit( sceneId, selfId, targetId ) ~= 1 then
		x808097_NotifyTip( sceneId, selfId, "Tr� nhi甿 v� th b読!" )				
		return 0
	end
	
	local strText = ""

	local playerlvl = LuaFnGetLevel( sceneId, selfId )
	local nExpNum = x808097_g_ExpBonus_Param1*playerlvl+x808097_g_ExpBonus_Param2
	local nMoneyNum = x808097_g_MoneyBonus_Param1*playerlvl+x808097_g_MoneyBonus_Param2

	nExpNum = floor(nExpNum)
	nMoneyNum = floor(nMoneyNum)
	LuaFnAddExp( sceneId, selfId, nExpNum )
	AddMoney( sceneId, selfId, nMoneyNum )
	-- x808097_TalkInfo( sceneId, selfId, targetId, strText )
	
	-- 活动顺利完成
	x808097_NotifyTip( sceneId, selfId, "#{XSHCD_20080418_085}" )

	x808097_DelMissionInfo( sceneId, selfId )
	
	-- 圣火任务第二步完成
	SetMissionData( sceneId, selfId, MD_GODOFFIRE_COMPLETE_STEPNUM, 2 )

end

--**********************************
--杀死怪物或玩家
--**********************************
function x808097_OnKillObject( sceneId, selfId, objdataId ,objId)--参数意思: 场景号、玩家objId、怪物表位置号、怪物
end

--**********************************
--进入区域事件
--**********************************
function x808097_OnEnterArea( sceneId, selfId, zoneId )	
end

--**********************************
--道具改变
--**********************************
function x808097_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--接任务后显示to� 鸬 界面
--**********************************
function x808097_AcceptDialog(sceneId, selfId, rand, g_Dialog, targetId )

	BeginEvent( sceneId )
		AddText( sceneId, g_Dialog )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

end

--**********************************
--交任务后显示to� 鸬 界面
--**********************************
function x808097_SubmitDialog( sceneId, selfId, rand )
end

--**********************************
--醒目提示
--**********************************
function x808097_NotifyTip( sceneId, selfId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end

--**********************************
--与NPC对话
--**********************************
function x808097_TalkInfo( sceneId, selfId, targetId, msg )

	BeginEvent(sceneId)
		AddText( sceneId, msg )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end

--**********************************
--取 餴琺本事件to� 鸬 MissionId,用于obj文件中对话情景to� 鸬 判断
--**********************************
function x808097_GetEventMissionId( sceneId, selfId )	
	return x808097_g_MissionId
end

function x808097_AcceptMission( sceneId, selfId, targetId )
	
	--判断该npc喧ng否喧ng对应任务to� 鸬 npc
	if LuaFnGetName( sceneId, targetId ) ~= x808097_g_Name then
		x808097_NotifyTip( sceneId, selfId, "Nh nhi甿 v� th b読" )
		return 0
	end

	local  PlayerName=GetName(sceneId,selfId)		
	
	--发送任务Ti猵 th毕允総o� 鸬 信息
	BeginEvent(sceneId)
		AddText(sceneId,x808097_g_MissionName)
		AddText( sceneId, x808097_g_MissionInfo )
		AddText(sceneId,"#{M_MUBIAO}")
		AddText(sceneId,"#{XSHCD_20080418_044}")
		AddText(sceneId,"#{M_SHOUHUO}")
		AddText(sceneId,"#{XSHCD_20080418_096}")
		
	EndEvent( )
	DispatchMissionInfo(sceneId,selfId,targetId,x808097_g_ScriptId,x808097_g_MissionId)	

end

--/////////////////////////////////////////////////////////////////////////////////////////////////////
--获取具体itemto� 鸬 详细信息
function x808097_GetItemDetailInfo(itemId)
	return 0
end	

--**********************************
--检测活动时间
--**********************************
function x808097_CheckHuoDongTime()

	local nMonth = GetTodayMonth()+1
	local nDate	 = GetTodayDate()
	local nHour	 = GetHour()
	local nMinute = GetMinute()
	local nThisDay = GetTodayWeek()
	local curDateTime = nMonth*100+nDate
  local curHourTime = nHour*100+nMinute
  
  if curHourTime >= x808097_g_Activity_Time.tstart and curHourTime <= x808097_g_Activity_Time.tend then
  	if curDateTime >= x808097_g_Activity_Day.dstart and curDateTime <= x808097_g_Activity_Day.dend then
  		return 1
 		elseif curDateTime > x808097_g_Activity_Day.dend and nThisDay == x808097_g_Activity_DayTime then
  		return 1
  	end
  end


	return 0

end

--**********************************
--道具使用
--**********************************
function x808097_OnUseItem( sceneId, selfId, bagIndex )	
end

--**********************************
--死亡事件
--**********************************
function x808097_OnDie( sceneId, selfId, killerId )
end

--**********************************
--删除活动信息
--删除玩家任务列表中对应to� 鸬 任务,物品和驻留效果
--**********************************
function x808097_DelMissionInfo( sceneId, selfId )

  if HaveItem(sceneId, selfId, x808097_g_ItemId.id) > 0 then
  	if LuaFnGetAvailableItemCount(sceneId, selfId, x808097_g_ItemId.id) >= x808097_g_ItemId.num then
  		DelItem( sceneId, selfId, x808097_g_ItemId.id, LuaFnGetAvailableItemCount(sceneId, selfId, x808097_g_ItemId.id) )  	
  	end
  end

  if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x808097_g_Impact_Transport_Mission) ~= 0 then
  	-- 如果玩家正T読 漕运或跑商就不清除运输Buff
  	if IsHaveMission( sceneId, selfId, 4021 ) <= 0
  		 and GetItemCount(sceneId, selfId, 40002000) <= 0 then  	
  		LuaFnCancelSpecificImpact( sceneId, selfId, x808097_g_Impact_Transport_Mission )
  	end
  end
  
  if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x808097_g_Impact_GodOfFireMan_Mission) ~= 0 then
  	LuaFnCancelSpecificImpact( sceneId, selfId, x808097_g_Impact_GodOfFireMan_Mission )
  end
  
  if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x808097_g_Impact_GodOfFireGirl_Mission) ~= 0 then
  	LuaFnCancelSpecificImpact( sceneId, selfId, x808097_g_Impact_GodOfFireGirl_Mission )
  end
  
  if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x808097_g_Impact_DelGodOfFire_Mission) ~= 0 then
  	LuaFnCancelSpecificImpact( sceneId, selfId, x808097_g_Impact_DelGodOfFire_Mission )
  end
  
  if IsHaveMission( sceneId, selfId, x808097_g_MissionId ) > 0 then  	
	 	DelMission( sceneId, selfId, x808097_g_MissionId )
	end
	
	return 0

end
