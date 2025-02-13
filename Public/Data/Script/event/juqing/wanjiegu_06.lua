
-- 再T読 副本内完成杀怪任务

--************************************************************************
--MisDescBegin
--脚本号
x200006_g_ScriptId = 200006

--副本名称
x200006_g_CopySceneName="V課 Ki猵 C痗"

--任务号
x200006_g_MissionId = 6

--前续任务
x200006_g_PreMissionId = 5

--目标NPC
x200006_g_Name = "衞鄋 Ch韓h Thu"

--喧ng否喧ngTinh英任务
x200006_g_IfMissionElite = 1

--衅ng c nhi甿 v� 
x200006_g_MissionLevel = 20

--任务归类
x200006_g_MissionKind = 51

--任务文本描述
x200006_g_MissionName="姓i chi猲 V課 Ki猵 C痗"
x200006_g_MissionInfo="#{Mis_juqing_0006}"
x200006_g_MissionTarget="#{Mis_juqing_Tar_0006}"	--M鴆 ti陁 nhi甿 v�
x200006_g_MissionComplete="  L鄊 t痶 l, 衞鄋 Di阯 Kh醤h kh鬾g c� 3 ng叨i n鄖 t呓ng tr�, kh� c� th� t読 V課 Ki猰 C痗 g鈟 s� n鎍. "	--Ho鄋 t nhi甿 v鴑pc说话to� 鸬 话
x200006_g_MissionContinue="  Ng呓i 疸 疳nh b読 Di畃 Nh� N呓ng, Nh誧 L鉶 Tam v� V鈔 Trung H誧 ch遖? "

x200006_g_MoneyBonus=10800
x200006_g_exp=18000

x200006_g_RadioItemBonus={{id=10422001 ,num=1},{id=10422002,num=1},{id=10422003,num=1}}

x200006_g_Custom	= { {id="秀 chi猲 thg Di畃 Nh� N呓ng",num=1},{id="秀 chi猲 thg Nh誧 L鉶 Tam",num=1},{id="秀 chi猲 thg V鈔 Trung H誧",num=1} }

--MisDescEnd
--************************************************************************

--**********************************
--任务入口函数
--**********************************
function x200006_OnDefaultEvent( sceneId, selfId, targetId )	-- 餴琺击该任务后执行此脚本
	--如果已接此任务
	if IsHaveMission(sceneId,selfId,x200006_g_MissionId) > 0 then
		--发送任务需求to� 鸬 信息
		BeginEvent(sceneId)
			AddText(sceneId,x200006_g_MissionName)
			AddText(sceneId,x200006_g_MissionContinue)
			--AddMoneyBonus( sceneId, x200006_g_MoneyBonus )
		EndEvent( )
		bDone = x200006_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x200006_g_ScriptId,x200006_g_MissionId,bDone)
    --Th鯽 m鉵任务接收条件
  elseif x200006_CheckAccept(sceneId,selfId) > 0 then
		--发送任务Ti猵 th毕允総o� 鸬 信息
		BeginEvent(sceneId)
			AddText(sceneId,x200006_g_MissionName)
			AddText(sceneId,x200006_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}#r")
			AddText(sceneId,x200006_g_MissionTarget)
			AddText(sceneId,"#{M_SHOUHUO}#r")
			AddMoneyBonus( sceneId, x200006_g_MoneyBonus )
			for i, item in x200006_g_RadioItemBonus do
				AddRadioItemBonus( sceneId, item.id, item.num )
			end
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x200006_g_ScriptId,x200006_g_MissionId)
  end

end

--**********************************
--列举事件
--**********************************
function x200006_OnEnumerate( sceneId, selfId, targetId )

  --如果玩家完成过C醝 n鄖 任务
  if IsMissionHaveDone(sceneId,selfId,x200006_g_MissionId) > 0 then
		return
	end
    --如果已接此任务
	if IsHaveMission(sceneId,selfId,x200006_g_MissionId) > 0 then
		AddNumText(sceneId,x200006_g_ScriptId,x200006_g_MissionName,2,-1);
		--Th鯽 m鉵任务接收条件
	elseif x200006_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x200006_g_ScriptId,x200006_g_MissionName,1,-1);
	end

end

--**********************************
--检测Ti猵 th跫�
--**********************************
function x200006_CheckAccept( sceneId, selfId )
	
	--C 4c才能接
	if GetLevel( sceneId, selfId ) < 20 then
		return 0
	end
	
	if IsMissionHaveDone(sceneId,selfId,x200006_g_PreMissionId) < 1 then
		return 0
	end
	
	return 1
end

--**********************************
--Ti猵 th�
--**********************************
function x200006_OnAccept( sceneId, selfId )
	--加入任务到玩家列表
	local ret = AddMission( sceneId,selfId, x200006_g_MissionId, x200006_g_ScriptId, 0, 0, 0 )
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#YNh k� nhi甿 v� c黙 c醕 h� 疸 馥y" , MSG2PLAYER_PARA )
		return
	end

	local misIndex = GetMissionIndexByID(sceneId,selfId,x200006_g_MissionId)			-- 餴琺到任务to� 鸬 序列号
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)						--根据序列号把任务变量to� 鸬 第0位置0
	SetMissionByIndex(sceneId,selfId,misIndex,1,0)						--根据序列号把任务变量to� 鸬 第1位置0
	Msg2Player(  sceneId, selfId,"#YNh nhi甿 v�#W: 姓i chi猲 V課 Ki猵 C痗",MSG2PLAYER_PARA )
	--CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, x200006_g_SignPost.x, x200006_g_SignPost.z, x200006_g_SignPost.tip )
	
	--接任务后,把相关to� 鸬 怪设置为可以Cu礳 chi猲 
	-- C 遍历所有to� 鸬 怪,改变他们to� 鸬 阵营
	local nMonsterNum = GetMonsterCount(sceneId)
	
	local ii = 0
	local bHaveMonster = 0
	for ii=0, nMonsterNum-1 do
		local nMonsterId = GetMonsterObjID(sceneId,ii)
		
		if GetName(sceneId, nMonsterId)  == "Di畃 Nh� N呓ng"  then
			SetUnitReputationID(sceneId, selfId, nMonsterId, 29)
		elseif GetName(sceneId, nMonsterId)  == "Nh誧 L鉶 Tam"  then
			SetUnitReputationID(sceneId, selfId, nMonsterId, 29)
		elseif GetName(sceneId, nMonsterId)  == "V鈔 Trung H誧"  then
			SetUnitReputationID(sceneId, selfId, nMonsterId, 29)
		end
	end

	SetMissionEvent(sceneId, selfId, x200006_g_MissionId, 0)

end

--**********************************
--放弃
--**********************************
function x200006_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应to� 鸬 任务
  DelMission( sceneId, selfId, x200006_g_MissionId )
--	CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x200006_g_SignPost.tip )
end


--**********************************
--继续
--**********************************
function x200006_OnContinue( sceneId, selfId, targetId )
	--提交任务时to� 鸬 � 餴琺餍畔�
    BeginEvent(sceneId)
		AddText(sceneId,x200006_g_MissionName)
		AddText(sceneId,x200006_g_MissionComplete)
		AddMoneyBonus( sceneId, x200006_g_MoneyBonus )
		for i, item in x200006_g_RadioItemBonus do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x200006_g_ScriptId,x200006_g_MissionId)
end

--**********************************
--检测喧ng否可以提交
--**********************************
function x200006_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x200006_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	misIndex = GetMissionIndexByID(sceneId,selfId,x200006_g_MissionId)
	
	local Kill1 = GetMissionParam(sceneId,selfId,misIndex,0)
	local Kill2 = GetMissionParam(sceneId,selfId,misIndex,1)
	local Kill3 = GetMissionParam(sceneId,selfId,misIndex,2)

	if Kill1~=1 			then
		return 0
	elseif Kill2~=1 	then
		return 0
	elseif Kill3~=1   then
		return 0
	end

	return 1
end

--**********************************
--提交
--**********************************
function x200006_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	if x200006_CheckSubmit( sceneId, selfId ) == 1   then
  	BeginAddItem(sceneId)
		for i, item in x200006_g_RadioItemBonus do
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

		AddMoney(sceneId,selfId,x200006_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId,x200006_g_exp)

		DelMission( sceneId, selfId, x200006_g_MissionId )
		MissionCom( sceneId, selfId, x200006_g_MissionId )
		Msg2Player(  sceneId, selfId,"#YHo鄋 t nhi甿 v�#W: 姓i chi猲 V課 Ki猵 C痗",MSG2PLAYER_PARA )
		
		-- 调用后续任务
		CallScriptFunction((200007), "OnDefaultEvent",sceneId, selfId, targetId )
		
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x200006_OnKillObject( sceneId, selfId, objdataId ,objId)

	local misIndex = -1
	if GetName(sceneId,objId) == "Di畃 Nh� N呓ng"	  then
		-- 取 餴琺C醝 n鄖 怪物死后拥有分配权to� 鸬 人数
		local num = GetMonsterOwnerCount(sceneId,objId)
		for j=0,num-1  do
			-- 取 餴琺拥有分配权to� 鸬 人to� 鸬 objId
			local humanObjId = GetMonsterOwnerID(sceneId,objId,j)
			-- 看C醝 n鄖 人喧ng不喧ng有C醝 n鄖 任务
			if IsHaveMission(sceneId, humanObjId, x200006_g_MissionId) > 0 then
				misIndex = GetMissionIndexByID(sceneId,humanObjId,x200006_g_MissionId)
				SetMissionByIndex(sceneId,humanObjId,misIndex,0,1)
				BeginEvent(sceneId)
				AddText(sceneId,"秀 gi猼 ch猼 Di畃 Nh� N呓ng: 1/1");
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,humanObjId)
			end
		end
	end
	if GetName(sceneId,objId) == "Nh誧 L鉶 Tam"	  then
		-- 取 餴琺C醝 n鄖 怪物死后拥有分配权to� 鸬 人数
		local num = GetMonsterOwnerCount(sceneId,objId)
		for j=0,num-1  do
			-- 取 餴琺拥有分配权to� 鸬 人to� 鸬 objId
			local humanObjId = GetMonsterOwnerID(sceneId,objId,j)
			-- 看C醝 n鄖 人喧ng不喧ng有C醝 n鄖 任务
			if IsHaveMission(sceneId, humanObjId, x200006_g_MissionId) > 0 then
				misIndex = GetMissionIndexByID(sceneId,humanObjId,x200006_g_MissionId)
				SetMissionByIndex(sceneId,humanObjId,misIndex,1,1)
				BeginEvent(sceneId)
				AddText(sceneId,"秀 gi猼 ch猼 Nh誧 L鉶 Tam: 1/1");
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,humanObjId)
			end
		end
	end
	if GetName(sceneId,objId) == "V鈔 Trung H誧"	  then
		local num = GetMonsterOwnerCount(sceneId,objId)
		for j=0,num-1  do
			-- 取 餴琺拥有分配权to� 鸬 人to� 鸬 objId
			local humanObjId = GetMonsterOwnerID(sceneId,objId,j)
			-- 看C醝 n鄖 人喧ng不喧ng有C醝 n鄖 任务
			if IsHaveMission(sceneId, humanObjId, x200006_g_MissionId) > 0 then
				misIndex = GetMissionIndexByID(sceneId,humanObjId,x200006_g_MissionId)
				SetMissionByIndex(sceneId,humanObjId,misIndex,2,1)
				BeginEvent(sceneId)
				AddText(sceneId,"秀 gi猼 ch猼 V鈔 Trung H誧: 1/1");
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,humanObjId)
			end
		end
	end
	
end

--**********************************
--进入区域事件
--**********************************
function x200006_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x200006_OnItemChanged( sceneId, selfId, itemdataId )
end
