-- 输赢成败谁人算 200042


-- 再T読 副本内完成杀怪任务

--************************************************************************
--MisDescBegin
--脚本号
x200042_g_ScriptId = 200042

--副本名称
x200042_g_CopySceneName="N鷌 L鬷 C�"

--任务号
x200042_g_MissionId = 35

--前续任务
x200042_g_PreMissionId = 34

--目标NPC
x200042_g_Name = "T� Tinh H� "

--喧ng否喧ngTinh英任务
x200042_g_IfMissionElite = 1

--衅ng c nhi甿 v� 
x200042_g_MissionLevel = 60

--任务归类
x200042_g_MissionKind = 53

--任务文本描述
x200042_g_MissionName="Thua thg th鄋h b読 ai bi猼 疬㧟"
x200042_g_MissionInfo="#{Mis_juqing_0035}"
x200042_g_MissionTarget="#{Mis_juqing_Tar_0035}"	--M鴆 ti陁 nhi甿 v�
x200042_g_MissionComplete="  Th kh鬾g ng� ti瑄 h騛 th唼ng n鄖 c� th� gi鋓 疬㧟 v醤 c� Tr鈔 Long! Tinh T鷆 H鋓 c鋗 k韈h b t. 衖nh Xu鈔 Thu ch遖 th� xem th叨ng, � 疴y c� m祎 n豠 c鬾g lao c黙 c醕 h�. "	--Ho鄋 t nhi甿 v鴑pc说话to� 鸬 话
x200042_g_MissionContinue="  Th kh鬾g ng�, kh鬾g ng�... b鄋 c� n鄖 l読 餴 th鄋h th� n鄖.."

x200042_g_MoneyBonus=21600
x200042_g_exp=24000

x200042_g_RadioItemBonus={{id=10414013 ,num=1},{id=10414014,num=1},{id=10414015,num=1}}

x200042_g_Custom	= { {id="秀 b鋙 h� H� Tr鷆",num=1} }
x200042_g_IsMissionOkFail = 0

--MisDescEnd
--************************************************************************

--**********************************
--任务入口函数
--**********************************
function x200042_OnDefaultEvent( sceneId, selfId, targetId )	-- 餴琺击该任务后执行此脚本
	--如果已接此任务
	if IsHaveMission(sceneId,selfId,x200042_g_MissionId) > 0 then
		--发送任务需求to� 鸬 信息
		BeginEvent(sceneId)
			AddText(sceneId,x200042_g_MissionName)
			AddText(sceneId,x200042_g_MissionContinue)
			--AddMoneyBonus( sceneId, x200042_g_MoneyBonus )
		EndEvent( )
		bDone = x200042_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x200042_g_ScriptId,x200042_g_MissionId,bDone)
    --Th鯽 m鉵任务接收条件
  elseif x200042_CheckAccept(sceneId,selfId) > 0 then
		--发送任务Ti猵 th毕允総o� 鸬 信息
		BeginEvent(sceneId)
			AddText(sceneId,x200042_g_MissionName)
			AddText(sceneId,x200042_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}#r")
			AddText(sceneId,x200042_g_MissionTarget)
			AddText(sceneId,"#{M_SHOUHUO}#r")
			AddMoneyBonus( sceneId, x200042_g_MoneyBonus )
			for i, item in x200042_g_RadioItemBonus do
				AddRadioItemBonus( sceneId, item.id, item.num )
			end
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x200042_g_ScriptId,x200042_g_MissionId)
  end

end

--**********************************
--列举事件
--**********************************
function x200042_OnEnumerate( sceneId, selfId, targetId )

  --如果玩家完成过C醝 n鄖 任务
  if IsMissionHaveDone(sceneId,selfId,x200042_g_MissionId) > 0 then
		return
	end
  
  --如果已接此任务
	if IsHaveMission(sceneId,selfId,x200042_g_MissionId) > 0 then
		AddNumText(sceneId,x200042_g_ScriptId,x200042_g_MissionName,2,-1);
	--Th鯽 m鉵任务接收条件
	elseif x200042_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x200042_g_ScriptId,x200042_g_MissionName,1,-1);
	end

end

--**********************************
--检测Ti猵 th跫�
--**********************************
function x200042_CheckAccept( sceneId, selfId )
	
	--C 60c才能接
	if GetLevel( sceneId, selfId ) < 60 then
		return 0
	end
	
	if IsMissionHaveDone(sceneId,selfId,x200042_g_PreMissionId) < 1 then
		return 0
	end
	
	return 1
end

--**********************************
--Ti猵 th�
--**********************************
function x200042_OnAccept( sceneId, selfId )
	--加入任务到玩家列表
	local ret = AddMission( sceneId,selfId, x200042_g_MissionId, x200042_g_ScriptId, 0, 0, 0 )
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#YNh k� nhi甿 v� c黙 c醕 h� 疸 馥y" , MSG2PLAYER_PARA )
		return
	end

	local misIndex = GetMissionIndexByID(sceneId,selfId,x200042_g_MissionId)			-- 餴琺到任务to� 鸬 序列号
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)						--根据序列号把任务变量to� 鸬 第0位置0
	Msg2Player(  sceneId, selfId,"#YNh nhi甿 v�#W: Thua thg th鄋h b読 ai bi猼 疬㧟",MSG2PLAYER_PARA )
	--CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, x200042_g_SignPost.x, x200042_g_SignPost.z, x200042_g_SignPost.tip )
	
	-- 接任务 b 馥u剧情,剧情T読 副本to� 鸬 OnTime中完成
	LuaFnSetCopySceneData_Param(sceneId, 8, 2) ;--控制说话
	LuaFnSetCopySceneData_Param(sceneId, 9, LuaFnGetCurrentTime())--时间
	LuaFnSetCopySceneData_Param(sceneId, 10, 1) ;--控制说过话
	LuaFnSetCopySceneData_Param(sceneId, 11, LuaFnGetCurrentTime())--时间
	
end

--**********************************
--定时事件
--**********************************
function x200042_OnTimer(sceneId,selfId)
	
end

--**********************************
--放弃
--**********************************
function x200042_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应to� 鸬 任务
  DelMission( sceneId, selfId, x200042_g_MissionId )
--	CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x200042_g_SignPost.tip )
end


--**********************************
--继续
--**********************************
function x200042_OnContinue( sceneId, selfId, targetId )
	--提交任务时to� 鸬 � 餴琺餍畔�
    BeginEvent(sceneId)
		AddText(sceneId,x200042_g_MissionName)
		AddText(sceneId,x200042_g_MissionComplete)
		AddMoneyBonus( sceneId, x200042_g_MoneyBonus )
		for i, item in x200042_g_RadioItemBonus do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x200042_g_ScriptId,x200042_g_MissionId)
end

--**********************************
--检测喧ng否可以提交
--**********************************
function x200042_CheckSubmit( sceneId, selfId )
	
	local misIndex = GetMissionIndexByID(sceneId,selfId,x200042_g_MissionId)			-- 餴琺到任务to� 鸬 序列号

	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x200042_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	local Kill1 = LuaFnGetCopySceneData_Param(sceneId, 15)
	if Kill1 ~= 1   then
		return 0
	end

	return 1
end

--**********************************
--提交
--**********************************
function x200042_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	if x200042_CheckSubmit(sceneId, selfId) == 1    then
  	BeginAddItem(sceneId)
		for i, item in x200042_g_RadioItemBonus do
			if item.id == selectRadioId then
				AddItem( sceneId,item.id, item.num )
			end
		end
		ret = EndAddItem(sceneId,selfId)
		--添加任务奖励
		if ret < 1 then
			--任务奖励没有加成功
			BeginEvent(sceneId)
				strText = "Kh鬾g th� Ho鄋 t nhi甿 v�"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return
		end
		AddItemListToHuman(sceneId,selfId)

		AddMoney(sceneId,selfId,x200042_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId,x200042_g_exp)

		DelMission( sceneId, selfId, x200042_g_MissionId )
		MissionCom( sceneId, selfId, x200042_g_MissionId )
		Msg2Player(  sceneId, selfId,"#YHo鄋 t nhi甿 v�#W: Thua thg th鄋h b読 ai bi猼 疬㧟",MSG2PLAYER_PARA )

		-- 调用后续任务
		CallScriptFunction((200043), "OnDefaultEvent",sceneId, selfId, targetId )
		if LuaFnGetCopySceneData_Param(sceneId, 8) == 2 then
			LuaFnSetCopySceneData_Param(sceneId, 8, 3)
		end
		
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x200042_OnKillObject( sceneId, selfId, objdataId ,objId)

end

--**********************************
--进入区域事件
--**********************************
function x200042_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x200042_OnItemChanged( sceneId, selfId, itemdataId )
end
