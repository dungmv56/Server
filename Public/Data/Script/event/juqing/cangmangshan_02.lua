-- 天时不如地利
-- 去苍茫山战场探索皇太叔御帐、楚王大营、苍茫山左山道,苍茫山右山道.

--MisDescBegin
--脚本号
x200031_g_ScriptId = 200031

--任务号
x200031_g_MissionId = 27

x200031_g_Name=""

--前续任务
x200031_g_PreMissionId = 26

--任务归类
x200031_g_MissionKind = 52

--衅ng c nhi甿 v� 
x200031_g_MissionLevel = 50

--喧ng否喧ngTinh英任务
x200031_g_IfMissionElite = 0

--任务名
x200031_g_MissionName="Thi阯 th秈 kh鬾g bg 鸶a l㱮"
x200031_g_MissionInfo="#{Mis_juqing_0027}"
x200031_g_MissionTarget="#{Mis_juqing_Tar_0027}"
x200031_g_MissionComplete="  C� trong tay t靚h b醥 n鄖, ch鷑g ta ch� c� th� ch� 瘙i qu鈔 ph鋘 lo課 ph誱 sai l"
x200031_g_MissionContinue="  Ng呓i 疸 th錷 d� ng鈔 kh� ri阯g Ho鄋g Th醝 Th鷆, 鹫i doanh S� V呓ng, 疬秐g n鷌 Th呓ng Mang b阯 tr醝, 疬秐g n鷌 Th呓ng Mang b阯 ph鋓 ch遖?"

x200031_g_MoneyBonus=16200
x200031_g_exp=19920

x200031_g_RadioItemBonus={{id=10414009 ,num=1},{id=10414010,num=1},{id=10414011,num=1},{id=10414012,num=1}}

x200031_g_Custom	= { {id="秀 l鴆 so醫 S� V呓ng 鹫i doanh",num=1}
										 ,{id="秀 l鴆 so醫 ng鈔 kh� ri阯g c黙 Ho鄋g Th醝Th鷆",num=1} 
										 ,{id="秀 l鴆 so醫 疬秐g ph韆 恤ng n鷌 Th呓ng Mang",num=1} 
										 ,{id="秀 l鴆 so醫 疬秐g ph韆 T鈟 n鷌 Th呓ng Mang",num=1} }

--MisDescEnd
--**********************************
--任务入口函数
--**********************************
function x200031_OnDefaultEvent( sceneId, selfId, targetId )
	--如果玩家完成过C醝 n鄖 任务
	if (IsMissionHaveDone(sceneId,selfId,x200031_g_MissionId) > 0 ) then
		return
	elseif( IsHaveMission(sceneId,selfId,x200031_g_MissionId) > 0)  then
		--x200031_OnContinue( sceneId, selfId, targetId )
 		local done = x200031_CheckSubmit( sceneId, selfId )
 		
		BeginEvent(sceneId)
			AddText(sceneId,x200031_g_MissionName);
			AddText(sceneId,x200031_g_MissionContinue);
		EndEvent(sceneId)
 		
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x200031_g_ScriptId,x200031_g_MissionId,done)

	--Th鯽 m鉵任务接收条件
	elseif x200031_CheckAccept(sceneId,selfId) > 0 then
		--if GetName(sceneId,targetId) ~= x200031_g_Name then
			--发送任务Ti猵 th毕允総o� 鸬 信息
			local  PlayerName=GetName(sceneId,selfId)	
			BeginEvent(sceneId)
				AddText(sceneId,x200031_g_MissionName)
				AddText(sceneId,x200031_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}#r")
				AddText(sceneId,x200031_g_MissionTarget)
				AddText(sceneId,"#{M_SHOUHUO}#r") -- 你将 餴琺到
				for i, item in x200031_g_RadioItemBonus do
					AddRadioItemBonus( sceneId, item.id, item.num )
				end
				AddMoneyBonus( sceneId, x200031_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x200031_g_ScriptId,x200031_g_MissionId)
		--end
	end
end

--**********************************
--列举事件
--**********************************
function x200031_OnEnumerate( sceneId, selfId, targetId )

	--如果玩家完成过C醝 n鄖 任务
	if IsMissionHaveDone(sceneId,selfId,x200031_g_MissionId) > 0 then
		return 
	--如果已接此任务
	elseif IsHaveMission(sceneId,selfId,x200031_g_MissionId) > 0 then
		AddNumText(sceneId, x200031_g_ScriptId,x200031_g_MissionName,2,-1);
	--Th鯽 m鉵任务接收条件
	elseif x200031_CheckAccept(sceneId,selfId) > 0 then
		--if GetName(sceneId,targetId) ~= x200031_g_Name then
			AddNumText(sceneId,x200031_g_ScriptId,x200031_g_MissionName,1,-1);
		--end
	end
end

--**********************************
--检测Ti猵 th跫�
--**********************************
function x200031_CheckAccept( sceneId, selfId )
	-- 1,检测玩家喧ng不喧ng已经做过
	if (IsMissionHaveDone(sceneId,selfId,x200031_g_MissionId) > 0 ) then
		return 0
	end
		
	-- 等c检测
	if GetLevel( sceneId, selfId ) < x200031_g_MissionLevel then
		return 0
	end
	
	-- 前续任务to� 鸬 完成情况
	if IsMissionHaveDone(sceneId,selfId,x200031_g_PreMissionId) < 1  then
		return 0
	end
	
	return 1	
end

--**********************************
--Ti猵 th�
--**********************************
function x200031_OnAccept( sceneId, selfId )
	if x200031_CheckAccept(sceneId, selfId) < 1   then
		return 0
	end
	
	--加入任务到玩家列表
	local ret = AddMission( sceneId,selfId, x200031_g_MissionId, x200031_g_ScriptId, 0, 0, 0 )
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#YNh k� nhi甿 v� c黙 c醕 h� 疸 馥y" , MSG2PLAYER_PARA )
		return
	end
	Msg2Player( sceneId, selfId,"#YNh nhi甿 v�#W: Thi阯 th秈 kh鬾g bg 鸶a l㱮",MSG2PLAYER_PARA )
	
	-- 通知关系进入区域
	-- 0 KillObj, 1 EnterArea, 2 ItemChanged, 3 PetChanged, 4 LockedTarget
	SetMissionEvent(sceneId, selfId, x200031_g_MissionId, 1)
	
	-- 使用任务to� 鸬 前4位来记录探索to� 鸬 4c醝区域
	local misIndex = GetMissionIndexByID(sceneId,selfId,x200031_g_MissionId)			-- 餴琺到任务to� 鸬 序列号
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)
	SetMissionByIndex(sceneId,selfId,misIndex,1,0)
	SetMissionByIndex(sceneId,selfId,misIndex,2,0)
	SetMissionByIndex(sceneId,selfId,misIndex,3,0)
	
end

--**********************************
--放弃
--**********************************
function x200031_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应to� 鸬 任务
  DelMission( sceneId, selfId, x200031_g_MissionId )
--	CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x200031_g_SignPost.tip )
end

--**********************************
--继续
--**********************************
function x200031_OnContinue( sceneId, selfId, targetId )
	--提交任务时to� 鸬 � 餴琺餍畔�
    BeginEvent(sceneId)
		AddText(sceneId,x200031_g_MissionName)
		AddText(sceneId,x200031_g_MissionComplete)
		AddMoneyBonus( sceneId, x200031_g_MoneyBonus )
		for i, item in x200031_g_RadioItemBonus do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x200031_g_ScriptId,x200031_g_MissionId)
end

--**********************************
--检测喧ng否可以提交
--**********************************
function x200031_CheckSubmit( sceneId, selfId )

	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x200031_g_MissionId )
	if bRet ~= 1 then
		return 0
	end
	
	-- 查询4c醝值喧ng不喧ng都值为1了
	local misIndex = GetMissionIndexByID(sceneId,selfId,x200031_g_MissionId)			-- 餴琺到任务to� 鸬 序列号
	if GetMissionParam(sceneId, selfId, misIndex, 0) < 1 then
		return 0
	end
	if GetMissionParam(sceneId, selfId, misIndex, 1) < 1 then
		return 0
	end
	if GetMissionParam(sceneId, selfId, misIndex, 2) < 1 then
		return 0
	end
	if GetMissionParam(sceneId, selfId, misIndex, 3) < 1 then
		return 0
	end

	return 1
end

--**********************************
--提交
--**********************************
function x200031_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x200031_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		
		-- 
  	BeginAddItem(sceneId)
		for i, item in x200031_g_RadioItemBonus do
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

		--添加任务奖励
		AddMoney(sceneId,selfId, x200031_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId, x200031_g_exp)

		DelMission( sceneId,selfId,  x200031_g_MissionId )
		--设置任务已经被完成过
		MissionCom( sceneId,selfId,  x200031_g_MissionId )
		Msg2Player(  sceneId, selfId,"#YHo鄋 t nhi甿 v�#W: Thi阯 th秈 kh鬾g bg 鸶a l㱮",MSG2PLAYER_PARA )
		
		-- 设置剧情步骤1
		LuaFnSetCopySceneData_Param(sceneId, 8, 1)
		LuaFnSetCopySceneData_Param(sceneId, 10, 0)
		LuaFnSetCopySceneData_Param(sceneId, 20, selfId)
	end
end

--**********************************
--定时事件
--**********************************
function x200031_OnTimer(sceneId,selfId)
end

--**********************************
--杀死怪物或玩家
--**********************************
function x200031_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--进入区域事件
--**********************************
function x200031_OnEnterArea( sceneId, selfId, zoneId )
	
	local misIndex = GetMissionIndexByID(sceneId,selfId,x200031_g_MissionId)			-- 餴琺到任务to� 鸬 序列号
	
	if zoneId == 0 and
		 LuaFnGetCopySceneData_Param(sceneId, 0) == FUBEN_JUQING_CANGMANGSHAN then
		if GetMissionParam(sceneId, selfId, misIndex, 0) == 0 then
			BeginEvent(sceneId)
				AddText(sceneId, "秀 l鴆 so醫 S� V呓ng 姓i Doanh: 1/1")
	  	EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			
			SetMissionByIndex(sceneId,selfId,misIndex,0,1)
		end
		
	elseif zoneId == 1 and
	 	 LuaFnGetCopySceneData_Param(sceneId, 0) == FUBEN_JUQING_CANGMANGSHAN then
		if GetMissionParam(sceneId, selfId, misIndex, 1) == 0 then
			BeginEvent(sceneId)
				AddText(sceneId, "秀 l鴆 so醫 ng鈔 kh� ri阯g c黙 Ho鄋g Th醝 Th鷆: 1/1")
	  	EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			
			SetMissionByIndex(sceneId,selfId,misIndex,1,1)
		end
		
	elseif zoneId == 2 and
		 LuaFnGetCopySceneData_Param(sceneId, 0) == FUBEN_JUQING_CANGMANGSHAN then
		if GetMissionParam(sceneId, selfId, misIndex, 2) == 0 then
			BeginEvent(sceneId)
				AddText(sceneId, "秀 l鴆 so醫 疬秐g ph韆 恤ng n鷌 Th呓ng Mang: 1/1")
	  	EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			
			SetMissionByIndex(sceneId,selfId,misIndex,2,1)
		end
		
	elseif zoneId == 3 and
		 LuaFnGetCopySceneData_Param(sceneId, 0) == FUBEN_JUQING_CANGMANGSHAN then
		if GetMissionParam(sceneId, selfId, misIndex, 3) == 0 then
			BeginEvent(sceneId)
				AddText(sceneId, "秀 l鴆 so醫 疬秐g ph韆 T鈟 n鷌 Th呓ng Mang: 1/1")
	  	EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			
			SetMissionByIndex(sceneId,selfId,misIndex,3,1)
		end
		
	end

end

--**********************************
--道具改变
--**********************************
function x200031_OnItemChanged( sceneId, selfId, itemdataId )
end
