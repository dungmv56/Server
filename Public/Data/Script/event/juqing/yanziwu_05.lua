-- 指 餴琺群豪戏   燕子坞大战,^_^,Tinh彩部分哦 

--************************************************************************
--MisDescBegin
--脚本号
x200015_g_ScriptId = 200015

--副本名称
x200015_g_CopySceneName="Y猲 T� �"

--任务号
x200015_g_MissionId = 14

--任务号
x200015_g_PreMissionId = 13

--目标NPC
x200015_g_Name = "V呓ng Ng� Y阯"

--喧ng否喧ngTinh英任务
x200015_g_IfMissionElite = 1

--衅ng c nhi甿 v� 
x200015_g_MissionLevel = 30

--任务归类
x200015_g_MissionKind = 48

--任务文本描述
x200015_g_MissionName="Ch� 衖琺 Qu H鄌"
x200015_g_MissionInfo="#{Mis_juqing_0014}"
x200015_g_MissionTarget="#{Mis_juqing_Tar_0014}"	--M鴆 ti陁 nhi甿 v�
x200015_g_MissionComplete="  $N, 絥 c製 m課g c黙 c醕 h�, t読 h� nh 鸶nh s� b醥 疳p. Nh遪g m�, t読 h� thi畁 gi� th鈔 tr鷑g k竎h 鸬c... kh鬾g bi猼 l鄊 sao 瓞 c� c� h礽 b醥 疳p..."	--Ho鄋 t nhi甿 v鴑pc说话to� 鸬 话
x200015_g_MissionContinue="  Ng呓i 疸 gi鷓 衞鄋 c鬾g t� 疳nh lui c醕 v� s� T鈟 H� sao?"

x200015_g_MoneyBonus=21600
x200015_g_exp=22000

x200015_g_RadioItemBonus={{id=10423005,num=1},{id=10423006,num=1},{id=10423007,num=1}}

x200015_g_Custom	= { {id="Ch� 衖琺 Qu H鄌",num=1} }

--MisDescEnd
--************************************************************************

--**********************************
--任务入口函数
--**********************************
function x200015_OnDefaultEvent( sceneId, selfId, targetId )	-- 餴琺击该任务后执行此脚本
	--如果已接此任务
	if IsHaveMission(sceneId,selfId,x200015_g_MissionId) > 0 then
		--发送任务需求to� 鸬 信息
		BeginEvent(sceneId)
			AddText(sceneId,x200015_g_MissionName)
			AddText(sceneId,x200015_g_MissionContinue)
			--AddMoneyBonus( sceneId, x200015_g_MoneyBonus )
		EndEvent( )
		bDone = x200015_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x200015_g_ScriptId,x200015_g_MissionId,bDone)
    --Th鯽 m鉵任务接收条件
  elseif x200015_CheckAccept(sceneId,selfId) > 0 then
		--发送任务Ti猵 th毕允総o� 鸬 信息
		BeginEvent(sceneId)
			AddText(sceneId,x200015_g_MissionName)
			AddText(sceneId,x200015_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}#r")
			AddText(sceneId,x200015_g_MissionTarget)
			AddText(sceneId,"#{M_SHOUHUO}#r")
			AddMoneyBonus( sceneId, x200015_g_MoneyBonus )
			for i, item in x200015_g_RadioItemBonus do
				AddRadioItemBonus( sceneId, item.id, item.num )
			end
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x200015_g_ScriptId,x200015_g_MissionId)
  end

end

--**********************************
--列举事件
--**********************************
function x200015_OnEnumerate( sceneId, selfId, targetId )

  --如果玩家完成过C醝 n鄖 任务
  if IsMissionHaveDone(sceneId,selfId,x200015_g_MissionId) > 0 then
		return
	end
    --如果已接此任务
	if IsHaveMission(sceneId,selfId,x200015_g_MissionId) > 0 then
		AddNumText(sceneId,x200015_g_ScriptId,x200015_g_MissionName,2,-1);
		--Th鯽 m鉵任务接收条件
	elseif x200015_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x200015_g_ScriptId,x200015_g_MissionName,1,-1);
	end

end

--**********************************
--检测Ti猵 th跫�
--**********************************
function x200015_CheckAccept( sceneId, selfId )
	-- 玩家C 先完成前续任务
  if IsMissionHaveDone(sceneId,selfId,x200015_g_PreMissionId) < 1 then
		return 0
	end
	
	if LuaFnGetCopySceneData_Param(sceneId, 25) == 1  then
		return 0
	end	
	
	--C 4c才能接
	if GetLevel( sceneId, selfId ) >= 30 then
		return 1
	else
		return 0
	end
end

--**********************************
--Ti猵 th�
--**********************************
function x200015_OnAccept( sceneId, selfId )
	--加入任务到玩家列表
	local ret = AddMission( sceneId,selfId, x200015_g_MissionId, x200015_g_ScriptId, 0, 0, 0 )
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#YNh k� nhi甿 v� c黙 c醕 h� 疸 馥y" , MSG2PLAYER_PARA )
		return
	end

	local misIndex = GetMissionIndexByID(sceneId,selfId,x200015_g_MissionId)			-- 餴琺到任务to� 鸬 序列号
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)						--根据序列号把任务变量to� 鸬 第0位置0
	SetMissionByIndex(sceneId,selfId,misIndex,1,0)						--根据序列号把任务变量to� 鸬 第1位置0
	SetMissionByIndex(sceneId,selfId,misIndex,2,0)						--根据序列号把任务变量to� 鸬 第1位置0
	SetMissionByIndex(sceneId,selfId,misIndex,3,0)						--根据序列号把任务变量to� 鸬 第1位置0
	SetMissionByIndex(sceneId,selfId,misIndex,4,0)						--根据序列号把任务变量to� 鸬 第1位置0
	SetMissionByIndex(sceneId,selfId,misIndex,5,0)						--根据序列号把任务变量to� 鸬 第1位置0
	Msg2Player(  sceneId, selfId,"#YNh nhi甿 v�#W: Ch� 衖琺 Qu H鄌",MSG2PLAYER_PARA )

	SetMissionEvent(sceneId, selfId, x200015_g_MissionId, 0)
	
	LuaFnSetCopySceneData_Param(sceneId, 10, 1)
	LuaFnSetCopySceneData_Param(sceneId, 11, LuaFnGetCurrentTime())
	LuaFnSetCopySceneData_Param(sceneId, 12, LuaFnGetCurrentTime())

	-- 餴琺名m祎 旦开始,就不能再来m祎 次了
	
	LuaFnSetCopySceneData_Param(sceneId, 25, 1)
end

--**********************************
--定时事件
--**********************************
function x200015_OnTimer(sceneId,selfId)

end

--**********************************
--放弃
--**********************************
function x200015_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应to� 鸬 任务
  DelMission( sceneId, selfId, x200015_g_MissionId )
--	CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x200015_g_SignPost.tip )
end

--**********************************
--继续
--**********************************
function x200015_OnContinue( sceneId, selfId, targetId )
	--提交任务时to� 鸬 � 餴琺餍畔�
	BeginEvent(sceneId)
		AddText(sceneId,x200015_g_MissionName)
		AddText(sceneId,x200015_g_MissionComplete)
		AddMoneyBonus( sceneId, x200015_g_MoneyBonus )
		for i, item in x200015_g_RadioItemBonus do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
	EndEvent( )
	DispatchMissionContinueInfo(sceneId,selfId,targetId,x200015_g_ScriptId,x200015_g_MissionId)
end

--**********************************
--检测喧ng否可以提交
--**********************************
function x200015_CheckSubmit( sceneId, selfId )
	
	local misIndex = GetMissionIndexByID(sceneId,selfId,x200015_g_MissionId)

	local Kill1 = GetMissionParam(sceneId,selfId,misIndex,0)
	local Kill2 = GetMissionParam(sceneId,selfId,misIndex,1)
	local Kill3 = GetMissionParam(sceneId,selfId,misIndex,2)
	local Kill4 = GetMissionParam(sceneId,selfId,misIndex,3)
	local Kill5 = GetMissionParam(sceneId,selfId,misIndex,4)

	if Kill1~=1 			then
		return 0
	elseif Kill2~=1 	then
		return 0
	elseif Kill3~=1   then
		return 0
	elseif Kill4~=1   then
		return 0
	elseif Kill5~=1   then
		return 0
	end

	return 1
end

--**********************************
--提交
--**********************************
function x200015_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	if x200015_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then

  	BeginAddItem(sceneId)
		for i, item in x200015_g_RadioItemBonus do
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
		AddMoney(sceneId,selfId, x200015_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId, x200015_g_exp)

		DelMission( sceneId, selfId, x200015_g_MissionId )
		MissionCom( sceneId, selfId, x200015_g_MissionId )
		Msg2Player( sceneId, selfId, "#YHo鄋 t nhi甿 v�#W: Ch� 衖琺 Qu H鄌", MSG2PLAYER_PARA )
		
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x200015_OnKillObject( sceneId, selfId, objdataId ,objId)

	local misIndex = -1
	local szMonsterName = GetName(sceneId,objId)
	if szMonsterName == "Ho鄋g H� T�"	  then
		-- 取 餴琺C醝 n鄖 怪物死后拥有分配权to� 鸬 人数
		local num = GetMonsterOwnerCount(sceneId,objId)
		for j=0,num-1  do
			-- 取 餴琺拥有分配权to� 鸬 人to� 鸬 objId
			local humanObjId = GetMonsterOwnerID(sceneId,objId,j)
			-- 看C醝 n鄖 人喧ng不喧ng有C醝 n鄖 任务
			if IsHaveMission(sceneId, humanObjId, x200015_g_MissionId) > 0 then
				misIndex = GetMissionIndexByID(sceneId,selfId,x200015_g_MissionId)
				SetMissionByIndex(sceneId,humanObjId,misIndex,1,1)
				BeginEvent(sceneId)
				AddText(sceneId,"秀 gi猼 ch猼 Ho鄋g H� T�: 1/1");
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,humanObjId)
			end
		end

	elseif szMonsterName == "Kh鬷 B鄌 Kh醕h"	  then
		-- 取 餴琺C醝 n鄖 怪物死后拥有分配权to� 鸬 人数
		local num = GetMonsterOwnerCount(sceneId,objId)
		for j=0,num-1  do
			-- 取 餴琺拥有分配权to� 鸬 人to� 鸬 objId
			local humanObjId = GetMonsterOwnerID(sceneId,objId,j)
			-- 看C醝 n鄖 人喧ng不喧ng有C醝 n鄖 任务
			if IsHaveMission(sceneId, humanObjId, x200015_g_MissionId) > 0 then
				misIndex = GetMissionIndexByID(sceneId,selfId,x200015_g_MissionId)
				SetMissionByIndex(sceneId,humanObjId,misIndex,2,1)
				BeginEvent(sceneId)
				AddText(sceneId,"秀 gi猼 ch猼 Kh鬷 B鄌 Kh醕h: 1/1");
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,humanObjId)
			end
		end

	elseif szMonsterName == "挟 t� H� Tr鋙 m鬾"	  then
		-- 取 餴琺C醝 n鄖 怪物死后拥有分配权to� 鸬 人数
		local num = GetMonsterOwnerCount(sceneId,objId)
		for j=0,num-1  do
			-- 取 餴琺拥有分配权to� 鸬 人to� 鸬 objId
			local humanObjId = GetMonsterOwnerID(sceneId,objId,j)
			-- 看C醝 n鄖 人喧ng不喧ng有C醝 n鄖 任务
			if IsHaveMission(sceneId, humanObjId, x200015_g_MissionId) > 0 then
				misIndex = GetMissionIndexByID(sceneId,selfId,x200015_g_MissionId)
				SetMissionByIndex(sceneId,humanObjId,misIndex,3,1)
				BeginEvent(sceneId)
				AddText(sceneId,"秀 gi猼 ch猼 H� Tr鋙 M鬾 挟 T�: 1/1");
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,humanObjId)
			end
		end

	elseif szMonsterName == "C� nhi璵 v� s�"	  then
		-- 取 餴琺C醝 n鄖 怪物死后拥有分配权to� 鸬 人数
		local num = GetMonsterOwnerCount(sceneId,objId)
		for j=0,num-1  do
			-- 取 餴琺拥有分配权to� 鸬 人to� 鸬 objId
			local humanObjId = GetMonsterOwnerID(sceneId,objId,j)
			-- 看C醝 n鄖 人喧ng不喧ng有C醝 n鄖 任务
			if IsHaveMission(sceneId, humanObjId, x200015_g_MissionId) > 0 then
				misIndex = GetMissionIndexByID(sceneId,selfId,x200015_g_MissionId)
				SetMissionByIndex(sceneId,humanObjId,misIndex,4,1)
				BeginEvent(sceneId)
				AddText(sceneId,"秀 gi猼 ch猼 C� Nhi阭 V� S�: 1/1");
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,humanObjId)
			end
		end

	elseif szMonsterName == "Su Gi醕 Cao Th�"	  then
		-- 取 餴琺C醝 n鄖 怪物死后拥有分配权to� 鸬 人数
		local num = GetMonsterOwnerCount(sceneId,objId)
		for j=0,num-1  do
			-- 取 餴琺拥有分配权to� 鸬 人to� 鸬 objId
			local humanObjId = GetMonsterOwnerID(sceneId,objId,j)
			-- 看C醝 n鄖 人喧ng不喧ng有C醝 n鄖 任务
			if IsHaveMission(sceneId, humanObjId, x200015_g_MissionId) > 0 then
				misIndex = GetMissionIndexByID(sceneId,selfId,x200015_g_MissionId)
				SetMissionByIndex(sceneId,humanObjId,misIndex,5,1)
				BeginEvent(sceneId)
				AddText(sceneId,"秀 gi猼 ch猼 Su Gi醕 Cao Th�: 1/1");
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,humanObjId)
			end
		end
		
	else
		return
		
	end
	
	-- 检测如果C 杀to� 鸬 人都杀了后,给c醝完成标志
	local Kill1 = GetMissionParam(sceneId,selfId,misIndex,5)
	local Kill2 = GetMissionParam(sceneId,selfId,misIndex,1)
	local Kill3 = GetMissionParam(sceneId,selfId,misIndex,2)
	local Kill4 = GetMissionParam(sceneId,selfId,misIndex,3)
	local Kill5 = GetMissionParam(sceneId,selfId,misIndex,4)
	
	if Kill1==1 and Kill2==1 and Kill3==1 and Kill4==1 and Kill5==1 then
		--BroadMsgByChatPipe(sceneId,selfId,"#{JQ_DB_0010}",0)
		CallScriptFunction((200060), "Duibai",sceneId, "V� S� T鈟 h�", "Y猲 T� �", "#{JQ_DB_0010}" )
		
		SetMissionByIndex(sceneId,selfId,misIndex,0,1)
		
	end
	
end

--**********************************
--进入区域事件
--**********************************
function x200015_OnEnterArea( sceneId, selfId, zoneId )
	
end

--**********************************
--道具改变
--**********************************
function x200015_OnItemChanged( sceneId, selfId, itemdataId )
	
end







