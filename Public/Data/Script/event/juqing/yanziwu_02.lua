-- 独战双雄   T読 副本中杀怪,夺取东西

--************************************************************************
--MisDescBegin
--脚本号
x200012_g_ScriptId = 200012

--副本名称
x200012_g_CopySceneName="Y猲 T� �"

--任务号
x200012_g_MissionId = 11

--前续任务号
x200012_g_PreMissionId = 10

--目标NPC
x200012_g_Name = "V呓ng Ng� Y阯"

--喧ng否喧ngTinh英任务
x200012_g_IfMissionElite = 1

--衅ng c nhi甿 v� 
x200012_g_MissionLevel = 30

--任务归类
x200012_g_MissionKind = 48

--任务文本描述
x200012_g_MissionName="械c chi猲 song h鵱g"
x200012_g_MissionInfo="#{Mis_juqing_0011}"
x200012_g_MissionTarget="#{Mis_juqing_Tar_0011}"	--M鴆 ti陁 nhi甿 v�
x200012_g_MissionComplete="  T痶 qu� r癷, nh鎛g ng叨i b l呓ng nh 鸶nh s� khi猵 s� m� b� ch誽, ch鷑g ta an to鄋 r癷. "	--Ho鄋 t nhi甿 v鴑pc说话to� 鸬 话
x200012_g_MissionContinue="  Ng呓i 疸 疳nh b読 疬㧟 T� M� L鈓 v� 朽o B醕h 羞絥g, 疸 疬㧟 L鬷 C鬾g Oanh v� Ng� H� 衞課 M鬾 衋o ch遖?"

x200012_g_MoneyBonus=8100
x200012_g_exp=9600

x200012_g_RadioItemBonus={{id=10415001 ,num=1},{id=10415002,num=1},{id=10415003,num=1}}

x200012_g_DemandItem={{id=40001002,num=1},{id=40001003,num=1}}		--从背包中计算

--MisDescEnd
--************************************************************************

--**********************************
--任务入口函数
--**********************************
function x200012_OnDefaultEvent( sceneId, selfId, targetId )	-- 餴琺击该任务后执行此脚本
	--如果已接此任务
	if IsHaveMission(sceneId,selfId,x200012_g_MissionId) > 0 then
		--发送任务需求to� 鸬 信息
		BeginEvent(sceneId)
			AddText(sceneId,x200012_g_MissionName)
			AddText(sceneId,x200012_g_MissionContinue)
			AddMoneyBonus( sceneId, x200012_g_MoneyBonus )
		EndEvent( )
		bDone = x200012_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x200012_g_ScriptId,x200012_g_MissionId,bDone)
    --Th鯽 m鉵任务接收条件
  elseif x200012_CheckAccept(sceneId,selfId) > 0 then
		--发送任务Ti猵 th毕允総o� 鸬 信息
		BeginEvent(sceneId)
			AddText(sceneId,x200012_g_MissionName)
			AddText(sceneId,x200012_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}#r")
			AddText(sceneId,x200012_g_MissionTarget)
			AddText(sceneId,"#{M_SHOUHUO}#r")
			AddMoneyBonus( sceneId, x200012_g_MoneyBonus )
			for i, item in x200012_g_RadioItemBonus do
				AddRadioItemBonus( sceneId, item.id, item.num )
			end
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x200012_g_ScriptId,x200012_g_MissionId)
  end

end

--**********************************
--列举事件
--**********************************
function x200012_OnEnumerate( sceneId, selfId, targetId )

  --如果玩家完成过C醝 n鄖 任务
  if IsMissionHaveDone(sceneId,selfId,x200012_g_MissionId) > 0 then
		return
	end
    --如果已接此任务
	if IsHaveMission(sceneId,selfId,x200012_g_MissionId) > 0 then
		AddNumText(sceneId,x200012_g_ScriptId,x200012_g_MissionName,2,-1);
		--Th鯽 m鉵任务接收条件
	elseif x200012_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x200012_g_ScriptId,x200012_g_MissionName,1,-1);
	end

end

--**********************************
--检测Ti猵 th跫�
--**********************************
function x200012_CheckAccept( sceneId, selfId )
	--C 4c才能接
	if GetLevel( sceneId, selfId ) < 30 then
		return 0
	end
	
	if IsMissionHaveDone(sceneId,selfId,x200012_g_PreMissionId) < 1 then
		return 0
	end
	
	return 1
end

--**********************************
--Ti猵 th�
--**********************************
function x200012_OnAccept( sceneId, selfId )
	--加入任务到玩家列表
	local ret = AddMission( sceneId,selfId, x200012_g_MissionId, x200012_g_ScriptId, 0, 0, 0 )
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#YNh k� nhi甿 v� c黙 c醕 h� 疸 馥y" , MSG2PLAYER_PARA )
		return
	end

	misIndex = GetMissionIndexByID(sceneId,selfId,x200012_g_MissionId)			-- 餴琺到任务to� 鸬 序列号
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)						--根据序列号把任务变量to� 鸬 第0位置0
	SetMissionByIndex(sceneId,selfId,misIndex,1,0)						--根据序列号把任务变量to� 鸬 第1位置0
	Msg2Player(  sceneId, selfId,"#YNh nhi甿 v�#W: 械c chi猲 song h鵱g",MSG2PLAYER_PARA )
	--CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, x200012_g_SignPost.x, x200012_g_SignPost.z, x200012_g_SignPost.tip )
	
	--接任务后,把相关to� 鸬 怪设置为可以Cu礳 chi猲 
	-- C 遍历所有to� 鸬 怪,改变他们to� 鸬 阵营
	local nMonsterNum = GetMonsterCount(sceneId)
	
	local ii = 0
	local bHaveMonster = 0
	for ii=0, nMonsterNum-1 do
		local nMonsterId = GetMonsterObjID(sceneId,ii)
		
		if GetName(sceneId, nMonsterId)  == "T� M� L鈓"  then
			SetUnitReputationID(sceneId, selfId, nMonsterId, 29)
		elseif GetName(sceneId, nMonsterId)  == "Di陁 B� 羞絥g"  then
			SetUnitReputationID(sceneId, selfId, nMonsterId, 29)
		end
	end
	
	SetMissionEvent(sceneId, selfId, x200012_g_MissionId, 0)
	SetMissionEvent(sceneId, selfId, x200012_g_MissionId, 2)

end

--**********************************
--放弃
--**********************************
function x200012_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应to� 鸬 任务
  DelMission( sceneId, selfId, x200012_g_MissionId )
	--CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x200012_g_SignPost.tip )
	DelItem( sceneId, selfId, 40001002, 1 )	
	DelItem( sceneId, selfId, 40001003, 1 )	
end

--**********************************
--继续
--**********************************
function x200012_OnContinue( sceneId, selfId, targetId )
	--提交任务时to� 鸬 � 餴琺餍畔�
    BeginEvent(sceneId)
		AddText(sceneId,x200012_g_MissionName)
		AddText(sceneId,x200012_g_MissionComplete)
		AddMoneyBonus( sceneId, x200012_g_MoneyBonus )
		for i, item in x200012_g_RadioItemBonus do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x200012_g_ScriptId,x200012_g_MissionId)
end

--**********************************
--检测喧ng否可以提交
--**********************************
function x200012_CheckSubmit( sceneId, selfId )
	-- 看玩家身上喧ng不喧ng有这两c醝物品
	if  1 > GetItemCount( sceneId, selfId, 40001002 )    then
		return 0
	end
	if  1 > GetItemCount( sceneId, selfId, 40001003 )    then
		return 0
	end
	
	return 1
end

--**********************************
--提交
--**********************************
function x200012_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	if x200012_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then

  	BeginAddItem(sceneId)
		for i, item in x200012_g_RadioItemBonus do
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
		--删除道具
		DelItem( sceneId, selfId, 40001002, 1 )
		DelItem( sceneId, selfId, 40001003, 1 )
		AddItemListToHuman(sceneId,selfId)

		--添加任务奖励
		AddMoney(sceneId,selfId, x200012_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId, x200012_g_exp)

		DelMission( sceneId, selfId, x200012_g_MissionId )
		MissionCom( sceneId, selfId, x200012_g_MissionId )
		Msg2Player(  sceneId, selfId,"#YHo鄋 t nhi甿 v�#W: 械c chi猲 song h鵱g",MSG2PLAYER_PARA )
		-- 调用后续任务
		CallScriptFunction((200013), "OnDefaultEvent",sceneId, selfId, targetId )
	end
	
end

--**********************************
--杀死怪物或玩家
--**********************************
function x200012_OnKillObject( sceneId, selfId, objdataId ,objId)

	-- 如果杀了“T� M� L鈓”或者“Di陁 B� 羞絥g”就往掉落包里头加对应to� 鸬 东西
	if GetName(sceneId,objId) == "T� M� L鈓"	  then
		local num = GetMonsterOwnerCount(sceneId,objId)--取 餴琺C醝 n鄖 怪物死后拥有分配权to� 鸬 人数
		for j=0,num-1 do
			local humanObjId = GetMonsterOwnerID(sceneId,objId,j)--取 餴琺拥有分配权to� 鸬 人to� 鸬 objId
			if IsHaveMission(sceneId,humanObjId,x200012_g_MissionId) > 0 then	--如果C醝 n鄖 人拥有任务	
				AddMonsterDropItem(sceneId,objId,humanObjId,40001002)    --给C醝 n鄖 人任务道具(道具会出现T読 尸体包里)
				
				-- 喊话,然后Npc消失
				--BroadMsgByChatPipe(sceneId,selfId,"#{JQ_DB_0004}",0)
				CallScriptFunction((200060), "Duibai",sceneId, "挟 t� ph醝 Thanh Th鄋h", "Y猲 T� �", "#{JQ_DB_0004}" )

				-- 消失 挟 t� ph醝 Thanh Th鄋h	
				local nMonsterNum = GetMonsterCount(sceneId)
				local ii = 0
				local bHaveMonster = 0
				for ii=0, nMonsterNum-1 do
					local nMonsterId = GetMonsterObjID(sceneId,ii)
					if GetName(sceneId, nMonsterId)  == "挟 t� ph醝 Thanh Th鄋h"  then
						-- 删除 挟 t� ph醝 Thanh Th鄋h
						LuaFnDeleteMonster(sceneId, nMonsterId)
					end
				end				
			end
		end
	end

	if GetName(sceneId,objId) == "Di陁 B� 羞絥g"	  then
		local num = GetMonsterOwnerCount(sceneId,objId)--取 餴琺C醝 n鄖 怪物死后拥有分配权to� 鸬 人数
		for j=0,num-1 do
			local humanObjId = GetMonsterOwnerID(sceneId,objId,j)--取 餴琺拥有分配权to� 鸬 人to� 鸬 objId
			if IsHaveMission(sceneId,humanObjId,x200012_g_MissionId) > 0 then	--如果C醝 n鄖 人拥有任务	
				AddMonsterDropItem(sceneId,objId,humanObjId,40001003)    --给C醝 n鄖 人任务道具(道具会出现T読 尸体包里)
				-- 喊话,然后Npc消失
				--BroadMsgByChatPipe(sceneId,selfId,"#{JQ_DB_0003}",0)
				CallScriptFunction((200060), "Duibai",sceneId, "挟 t� T Gia Tr読", "Y猲 T� �", "#{JQ_DB_0003}" )
				
				-- 消失 挟 t� T Gia Tr読	
				local nMonsterNum = GetMonsterCount(sceneId)
				local ii = 0
				local bHaveMonster = 0
				for ii=0, nMonsterNum-1 do
					local nMonsterId = GetMonsterObjID(sceneId,ii)
					if GetName(sceneId, nMonsterId)  == "挟 t� T Gia Tr読"  then
						-- 删除 挟 t� T Gia Tr読
						LuaFnDeleteMonster(sceneId, nMonsterId)
					end
				end				
			end
		end
	end
end

--**********************************
--进入区域事件
--**********************************
function x200012_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x200012_OnItemChanged( sceneId, selfId, itemdataId )

	if itemdataId == 40001002    then
	 	BeginEvent(sceneId)
			AddText(sceneId, "秀 鹫t 疬㧟 L鬷 C鬾g Oanh: 1/1")
	  EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		
	end
	
	if itemdataId == 40001003    then
	 	BeginEvent(sceneId)
			AddText(sceneId, "秀 鹫t 疬㧟 Ng� H� 衞課 M鬾 衋o: 1/1")
	  EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		
	end
end



