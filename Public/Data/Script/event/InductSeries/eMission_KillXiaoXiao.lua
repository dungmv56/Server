--创建人[ QUFEI 2008-04-30 10:27 UPDATE BugID 34167 ]
--解决流失率引导任务事件脚本
--宵小引导任务1_江湖宵小

--MisDescBegin
--脚本号
x500607_g_ScriptId	= 500607

--目标任务NPC属性
x500607_g_Position_X=160.2399
x500607_g_Position_Z=134.1486
x500607_g_SceneID=0
x500607_g_AccomplishNPC_Name="Ch鈛 Thi阯 S�"

--前续任务号
x500607_g_PreMissionId	=	416
--任务号
x500607_g_MissionId			= 417
--下m祎 c醝任务to� 鸬 ID
x500607_g_MissionIdNext	= 418
--下m祎 c醝任务to� 鸬 ScriptId
x500607_g_NextScriptId	= 500608
--L頽h M鴆 ti陁 nhi甿 v鵗読 场景
x500607_g_AcceptNPC_SceneID	=	0
--L頽h 任务npc
x500607_g_Name 					= "L Ph皀"
--任务归类
x500607_g_MissionKind			= 11
--衅ng c nhi甿 v� 
x500607_g_MissionLevel		= 35
--喧ng否喧ngTinh英任务
x500607_g_IfMissionElite	= 0
--任务喧ng否已经完成
x500607_g_IsMissionOkFail	= 0		--任务参数to� 鸬 第0位

--任务文本描述
x500607_g_MissionName			= "姓o Ch韈h Giang h�"
--任务描述
x500607_g_MissionInfo			= "#{YD_20080421_57}"
--M鴆 ti陁 nhi甿 v�
x500607_g_MissionTarget		= "#{YD_20080421_56}"
--未Ho鄋 t nhi甿 v鴗o� 鸬 npc对话
x500607_g_ContinueInfo		= "#{YD_20080421_190}"
--Ho鄋 t nhi甿 v鴑pc说to� 鸬 话
x500607_g_MissionComplete	= "#{YD_20080421_58}"
--可以完成to� 鸬 环数
x500607_g_MaxRound	= 1
--控制脚本
x500607_g_ControlScript		= 001066

-- 任务完成情况,内容动态刷新,占用任务参数to� 鸬 第1位
x500607_g_Custom	= { {id="秀 gi猼 ch猼 醕 b�",num=1} }
--MisDescEnd

--任务喧ng否完成
x500607_g_Mission_IsComplete = 0		--任务参数to� 鸬 第0位
--喧ng否杀怪to� 鸬 标记
x500607_g_RecordIdx 				 = 1		--任务参数to� 鸬 第1位
--任务脚本号记录
x500607_g_MissScriptID_Idx	 = 2		--任务参数to� 鸬 第2位
--任务发布NPC标记
x500607_g_AcceptNPC_Idx			 = 3		--任务参数to� 鸬 第3位 1.L誧 D呓ngNPC

x500607_g_AcceptMission_IDX		= 757	--接收任务索引
x500607_g_CompleteMission_IDX	= 758	--提交任务索引

--所拥有to� 鸬 事件ID列表
x500607_g_EventList	= {}

x500607_g_PlayerSlow_LVL					 = 35		-- Ti猵 th挝駎o� 鸬 最低等c

--奖励
x500607_g_MoneyBonus					=	11122
x500607_g_ExpBonus						= 44490
x500607_g_ItemBonus_List 	 	  = { id=30505701,num=1 }

--副本场景ID_门派
x500607_g_TargetSceneId				= {130, 132, 131, 133, 136, 137, 134, 138, 135}
--怪物名称
x500607_g_MonsterName					=	"羉 B�"
--要求to� 鸬 杀怪数量
x500607_g_KillMonsterCnt			=	1

--**********************************
--任务入口函数
--**********************************
-- 餴琺击该任务后执行此脚本
function x500607_OnDefaultEvent( sceneId, selfId, targetId )

	local	key	= GetNumText()	
	if key == x500607_g_AcceptMission_IDX then
		--判断该npc喧ng否喧ng对应任务to� 鸬 npc
		if LuaFnGetName( sceneId, targetId ) ~= x500607_g_Name then
			x500607_NotifyTip( sceneId, selfId, "Nh nhi甿 v� th b読" )					
			return 0
		end
		-- 任务喧ng否已满
		if IsMissionFull( sceneId, selfId ) == 1 then
			x500607_NotifyTip( sceneId, selfId, "#{QIANXUN_INFO_23}" )
			return 0
		end
		
		-- 检测任务Ti猵 th跫�
		if x500607_CheckAccept( sceneId, selfId, targetId )<=0 then
			return 0
		end

		-- 进入Ti猵 th挝窠缑�			
		x500607_AcceptMission( sceneId, selfId, targetId )				
	
	elseif key == x500607_g_CompleteMission_IDX then
		--判断该npc喧ng否喧ng对应任务to� 鸬 npc
		if LuaFnGetName( sceneId, targetId ) ~= x500607_g_AccomplishNPC_Name then
			x500607_NotifyTip( sceneId, selfId, "Tr� nhi甿 v� th b読" )					
			return 0
		end
		-- 如果已经接了任务
		if IsHaveMission( sceneId, selfId, x500607_g_MissionId) > 0 then
												
			--发送任务需求to� 鸬 信息
			BeginEvent(sceneId)
				AddText(sceneId, x500607_g_MissionName)
				AddText(sceneId, x500607_g_ContinueInfo)			
			EndEvent( )
			
			local bDone = x500607_CheckSubmit( sceneId, selfId, targetId )				
			DispatchMissionDemandInfo(sceneId, selfId, targetId, x500607_g_ScriptId, x500607_g_MissionId, bDone)
			
		else			
			x500607_TalkInfo( sceneId, selfId, targetId, "#{YD_20080421_178}" )
			return 0
		end
	else
		x500607_NotifyTip( sceneId, selfId, "Nh nhi甿 v� th b読" )					
		return 0
	end

end

--**********************************
--列举事件
--**********************************
function x500607_OnEnumerate( sceneId, selfId, targetId )

	if LuaFnGetName( sceneId, targetId ) == x500607_g_Name
		 and sceneId == x500607_g_AcceptNPC_SceneID then
		if IsHaveMission( sceneId, selfId, x500607_g_MissionId ) <= 0 then
			if IsMissionHaveDone( sceneId, selfId, x500607_g_PreMissionId ) > 0
				 and IsMissionHaveDone( sceneId, selfId, x500607_g_MissionId ) <= 0 then
				AddNumText( sceneId, x500607_g_ScriptId, x500607_g_MissionName, 1, x500607_g_AcceptMission_IDX )
			end
		end
	elseif LuaFnGetName( sceneId, targetId ) == x500607_g_AccomplishNPC_Name
				 and sceneId == x500607_g_SceneID then
	
		if IsHaveMission( sceneId, selfId, x500607_g_MissionId ) > 0 then
			AddNumText( sceneId, x500607_g_ScriptId, x500607_g_MissionName, 2, x500607_g_CompleteMission_IDX )
		end
	else
		return 0
	end

end

--**********************************
--检测Ti猵 th跫�,也供子任务调用
--**********************************
function x500607_CheckAccept( sceneId, selfId, targetId )
	
	--检测玩家喧ng否符合Ti猵 th挝駎o� 鸬 条件
	--判断该npc喧ng否喧ng对应任务to� 鸬 npc
	if LuaFnGetName( sceneId, targetId ) ~= x500607_g_Name then
		x500607_NotifyTip( sceneId, selfId, "Nh nhi甿 v� th b読" )					
		return 0
	end

	--检测等c
	if LuaFnGetLevel( sceneId, selfId ) < x500607_g_PlayerSlow_LVL then
		local nStr = format( "#{YD_20080421_175}%d#{YD_20080421_176}", x500607_g_PlayerSlow_LVL )
		x500607_TalkInfo( sceneId, selfId, targetId, nStr )
		return 0
	end

	--已经接过则不符合条件
	if IsHaveMission( sceneId, selfId, x500607_g_MissionId ) > 0 then
		x500607_TalkInfo( sceneId, selfId, targetId, "#{XSHCD_20080418_067}" )
		return 0
	end
	if IsMissionHaveDone( sceneId, selfId, x500607_g_MissionId ) > 0 then
		return 0
	end

	--检测前续任务
	if IsMissionHaveDone( sceneId, selfId, x500607_g_PreMissionId ) <= 0 then
		x500607_TalkInfo( sceneId, selfId, targetId, "#{YD_20080421_177}" )
		return 0
	end
	
	return 1
end

--**********************************
--Ti猵 th�,仅供子任务调用设置公共参数
--**********************************
function x500607_OnAccept( sceneId, selfId, targetId, scriptId )
	
	--判断该npc喧ng否喧ng对应任务to� 鸬 npc
 	if LuaFnGetName( sceneId, targetId ) ~= x500607_g_Name then
 		x500607_NotifyTip( sceneId, selfId, "Nh nhi甿 v� th b読" )					
		return 0
	end

	if x500607_CheckAccept( sceneId, selfId, targetId )<=0 then
		return 0
	end

	--加入任务到玩家列表
	local bAdd = AddMission( sceneId, selfId, x500607_g_MissionId, x500607_g_ScriptId, 1, 0, 0 )
	if bAdd >= 1 then

		-- 餴琺到任务to� 鸬 序列号
		local	misIndex		= GetMissionIndexByID( sceneId, selfId, x500607_g_MissionId )
		
		--根据序列号把任务变量to� 鸬 第0位置0 (任务完成情况)
		SetMissionByIndex( sceneId, selfId, misIndex, x500607_g_Mission_IsComplete, 0 )
		SetMissionByIndex( sceneId, selfId, misIndex, x500607_g_RecordIdx, 0 )
		--根据序列号把任务变量to� 鸬 第2位置为任务脚本号
		SetMissionByIndex( sceneId, selfId, misIndex, x500607_g_MissScriptID_Idx, scriptId )		
		SetMissionByIndex(sceneId, selfId, misIndex, x500607_g_AcceptNPC_Idx, 1)
		
		local strText = "#{YD_20080421_229}" .. x500607_g_MissionName
		Msg2Player( sceneId, selfId, strText, MSG2PLAYER_PARA )

	end

	return 1

end

--**********************************
--放弃,仅供子任务调用
--**********************************
function x500607_OnAbandon( sceneId, selfId )

  if IsHaveMission( sceneId, selfId, x500607_g_MissionId ) > 0 then
	 	DelMission( sceneId, selfId, x500607_g_MissionId )
	end
	
	return 0

end

--**********************************
--继续
--**********************************
function x500607_OnContinue( sceneId, selfId, targetId )
	
	--判断该npc喧ng否喧ng对应任务to� 鸬 npc
	if LuaFnGetName( sceneId, targetId ) ~= x500607_g_AccomplishNPC_Name then
		x500607_NotifyTip( sceneId, selfId, "Tr� nhi甿 v� th b読" )					
		return 0
	end

	-- 检查任务喧ng否完成
	if x500607_CheckSubmit( sceneId, selfId, targetId ) ~= 1 then			
		return 0
	end
	
	BeginEvent(sceneId)
		AddText(sceneId,x500607_g_MissionName)
		AddText( sceneId, x500607_g_MissionComplete )				
	EndEvent( )
	DispatchMissionContinueInfo(sceneId,selfId,targetId,x500607_g_ScriptId,x500607_g_MissionId)
	
end

--**********************************
--检测喧ng否可以提交
--**********************************
function x500607_CheckSubmit( sceneId, selfId, targetId )

	--判断该npc喧ng否喧ng对应任务to� 鸬 npc
	if LuaFnGetName( sceneId, targetId ) ~= x500607_g_AccomplishNPC_Name then
		x500607_NotifyTip( sceneId, selfId, "Tr� nhi甿 v� th b読" )					
		return 0
	end

	if IsHaveMission( sceneId, selfId, x500607_g_MissionId ) <= 0 then
		x500607_TalkInfo( sceneId, selfId, targetId, "#{YD_20080421_178}" )
		return 0
	end

	local misIndex = GetMissionIndexByID(sceneId,selfId,x500607_g_MissionId)

	-- 检测任务喧ng否完成	
	if GetMissionParam(sceneId, selfId, misIndex, x500607_g_Mission_IsComplete) > 0 then
		return 1
	end
	
	return 0
	
end

--**********************************
--提交,仅供子任务调用
--**********************************
function x500607_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	
	--判断该npc喧ng否喧ng对应任务to� 鸬 npc
	if LuaFnGetName( sceneId, targetId ) ~= x500607_g_AccomplishNPC_Name then
		x500607_NotifyTip( sceneId, selfId, "Tr� nhi甿 v� th b読" )					
		return 0
	end

  -- 检查任务喧ng否完成
	if x500607_CheckSubmit( sceneId, selfId, targetId ) ~= 1 then
		x500607_NotifyTip( sceneId, selfId, "Tr� nhi甿 v� th b読" )				
		return 0
	end

	AddMoney( sceneId, selfId, x500607_g_MoneyBonus )
	LuaFnAddExp( sceneId, selfId, x500607_g_ExpBonus )

	-- 任务顺利完成
	x500607_NotifyTip( sceneId, selfId, "#{YD_20080421_180}" )

	if IsHaveMission( sceneId, selfId, x500607_g_MissionId ) > 0 then  	
	 	DelMission( sceneId, selfId, x500607_g_MissionId )
	 	-- 设置任务已经被完成过
	 	MissionCom( sceneId, selfId, x500607_g_MissionId )
	 	
	 	local strText = "#Y" .. x500607_g_MissionName .. "#{YD_20080421_230}"
		Msg2Player( sceneId, selfId, strText, MSG2PLAYER_PARA )
	 	
	 	-- 弹出后续任务Ti猵 th缑�
	 	if CallScriptFunction( x500607_g_NextScriptId, "CheckAccept", sceneId, selfId, targetId ) > 0 then
	 		CallScriptFunction( x500607_g_NextScriptId, "AcceptMission", sceneId, selfId, targetId )
	 	end	 	
	end

	-- local nItemId = 0
	-- -- 给予奖励物品
	-- BeginAddItem(sceneId)
	-- AddItem(sceneId,x500607_g_ItemBonus_List.id, x500607_g_ItemBonus_List.num)
	-- local canAdd = EndAddItem(sceneId,selfId)						
	-- if canAdd > 0 then
	-- 	nItemId = x500607_g_ItemBonus_List.id
	-- 	AddItemListToHuman(sceneId,selfId)
	-- end

end

--**********************************
--杀死怪物或玩家
--**********************************
function x500607_OnKillObject( sceneId, selfId, objdataId ,objId)--参数意思: 场景号、玩家objId、怪物表位置号、怪物

	--喧ng否喧ng副本
	local sceneType = LuaFnGetSceneType( sceneId )
	if sceneType ~= 1 then
		return
	end

	local monsterName = GetMonsterNamebyDataId(objdataId)
	local nMempai = LuaFnGetMenPai(sceneId, selfId)
	if nMempai < 0 or nMempai > 8 or monsterName ~= x500607_g_MonsterName then
		return 0
	end
	
	local num = GetMonsterOwnerCount(sceneId,objId)
	for i=0,num-1  do
		-- 取 餴琺拥有分配权to� 鸬 人to� 鸬 objId
		local humanObjId = GetMonsterOwnerID(sceneId,objId,i)
		-- PrintStr("humanObjId=" .. humanObjId)
		-- 看C醝 n鄖 人喧ng不喧ng有C醝 n鄖 任务
		if IsHaveMission(sceneId, humanObjId, x500607_g_MissionId) > 0 then
			-- 先判断喧ng不喧ng已经Th鯽 m鉵了完成标志
			local misIndex = GetMissionIndexByID(sceneId,humanObjId,x500607_g_MissionId)
			if GetMissionParam(sceneId, humanObjId, misIndex, x500607_g_Mission_IsComplete) <=0  then
				local killedCount =	GetMissionParam(sceneId, humanObjId, misIndex, x500607_g_RecordIdx)
				killedCount = killedCount + 1
				SetMissionByIndex(sceneId, humanObjId, misIndex, x500607_g_RecordIdx, killedCount)					
				BeginEvent(sceneId)
					local str = format("秀 gi猼 ch猼 %s%d/%d", x500607_g_MonsterName, killedCount, x500607_g_KillMonsterCnt )						
					AddText(sceneId, str)
				EndEvent(sceneId)
				DispatchMissionTips(sceneId, humanObjId)
				if killedCount >= x500607_g_KillMonsterCnt then
					SetMissionByIndex(sceneId, humanObjId, misIndex, x500607_g_Mission_IsComplete, 1)
				end
			end
		end
	end

end

--**********************************
--进入区域事件
--**********************************
function x500607_OnEnterArea( sceneId, selfId, zoneId )	
end

--**********************************
--道具改变
--**********************************
function x500607_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--接任务后显示to� 鸬 界面
--**********************************
function x500607_AcceptDialog(sceneId, selfId, rand, g_Dialog, targetId )

	BeginEvent( sceneId )
		AddText( sceneId, g_Dialog )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

end

--**********************************
--交任务后显示to� 鸬 界面
--**********************************
function x500607_SubmitDialog( sceneId, selfId, rand )
end

--**********************************
--醒目提示
--**********************************
function x500607_NotifyTip( sceneId, selfId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end

--**********************************
--与NPC对话
--**********************************
function x500607_TalkInfo( sceneId, selfId, targetId, msg )

	BeginEvent(sceneId)
		AddText( sceneId, msg )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end

--**********************************
--取 餴琺本事件to� 鸬 MissionId,用于obj文件中对话情景to� 鸬 判断
--**********************************
function x500607_GetEventMissionId( sceneId, selfId )	
	return x500607_g_MissionId
end

function x500607_AcceptMission( sceneId, selfId, targetId )
	
	--判断该npc喧ng否喧ng对应任务to� 鸬 npc
	if LuaFnGetName( sceneId, targetId ) ~= x500607_g_Name then
		x500607_NotifyTip( sceneId, selfId, "Nh nhi甿 v� th b読" )
		return 0
	end

	local  PlayerName=GetName(sceneId,selfId)		
	
	--发送任务Ti猵 th毕允総o� 鸬 信息
	BeginEvent(sceneId)
		AddText(sceneId,x500607_g_MissionName)
		AddText( sceneId, x500607_g_MissionInfo )
		AddText(sceneId,"#{M_MUBIAO}")
		AddText(sceneId,"#{YD_20080421_56}")
		AddText(sceneId,"#{M_SHOUHUO}")
		AddMoneyBonus( sceneId, x500607_g_MoneyBonus)
		
	EndEvent( )
	DispatchMissionInfo(sceneId,selfId,targetId,x500607_g_ScriptId,x500607_g_MissionId)	

end

--/////////////////////////////////////////////////////////////////////////////////////////////////////
--获取具体itemto� 鸬 详细信息
function x500607_GetItemDetailInfo(itemId)
	return 0
end	

--**********************************
--道具使用
--**********************************
function x500607_OnUseItem( sceneId, selfId, bagIndex )	
end

--**********************************
--死亡事件
--**********************************
function x500607_OnDie( sceneId, selfId, killerId )
end
