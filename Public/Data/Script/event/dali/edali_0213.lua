--杀怪任务
--匡扶正义
--新手村杀Th鴆 姓o B誧h Vi阯任务
--MisDescBegin
--脚本号
x210213_g_ScriptId = 210213

--Ti猵 th挝馧PC属性
x210213_g_Position_X=160.0895
x210213_g_Position_Z=156.9309
x210213_g_SceneID=2
x210213_g_AccomplishNPC_Name="Tri畊 Thi阯 S�"

--上m祎 c醝任务to� 鸬 ID
--g_MissionIdPre =

--任务号
x210213_g_MissionId = 453

--目标NPC
x210213_g_Name	="Tri畊 Thi阯 S�"

--任务归类
x210213_g_MissionKind = 13

--衅ng c nhi甿 v� 
x210213_g_MissionLevel = 4

--喧ng否喧ngTinh英任务
x210213_g_IfMissionElite = 0

--下面几项喧ng动态显示to� 鸬 内容,用于T読 任务列表中动态显示任务情况**********************

--任务C 杀死to� 鸬 怪
x210213_g_DemandKill ={{id=719,num=8}}		--变量第1位

--以上喧ng动态**************************************************************

--任务文本描述
x210213_g_MissionName="L 馥u gi猼 qu醝 v"
x210213_g_MissionInfo="#{event_dali_0018}"
x210213_g_MissionTarget="#{event_dali_0019}"
x210213_g_ContinueInfo="C醕 h� 疸 gi猼 ch猼 8 con #RTh鴆 姓o B誧h Vi阯#W ch遖?"
x210213_g_MissionComplete="  L鄊 r t痶, b鈟 gi� #RTh鴆 姓o B誧h Vi阯#W � #G邪i Th誧h Than#W c鹡g kh鬾g d醡 t鵼 ti畁 t k韈h b� t醤h r癷"
x210213_g_SignPost = {x = 160, z = 156, tip = "Tri畊 Thi阯 S�"}
--任务奖励
x210213_g_MoneyBonus=200
x210213_g_ItemBonus={{id=40002108,num=1},{id=30101001,num=5}}

x210213_g_DemandTrueKill ={{name="Th鴆 姓o B誧h Vi阯",num=8}}
x210213_g_IsMissionOkFail = 1		--变量to� 鸬 第0位

--MisDescEnd
--**********************************
--任务入口函数
--**********************************
function x210213_OnDefaultEvent( sceneId, selfId, targetId )	-- 餴琺击该任务后执行此脚本
	--如果玩家完成过C醝 n鄖 任务(实际上如果完成了任务这里就不会显示,但喧ng再检测m祎 次比较安全)
    --if IsMissionHaveDone(sceneId,selfId,x210213_g_MissionId) > 0 then
	--	return
	--end
	--如果已接此任务
	if IsHaveMission(sceneId,selfId,x210213_g_MissionId) > 0 then
		--发送任务需求to� 鸬 信息
		BeginEvent(sceneId)
			AddText(sceneId,x210213_g_MissionName)
			AddText(sceneId,x210213_g_ContinueInfo)
			--for i, item in g_DemandItem do
			--	AddItemDemand( sceneId, item.id, item.num )
			--end
			AddMoneyBonus( sceneId, x210213_g_MoneyBonus )
		EndEvent( )
		bDone = x210213_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x210213_g_ScriptId,x210213_g_MissionId,bDone)
    --Th鯽 m鉵任务接收条件
    elseif x210213_CheckAccept(sceneId,selfId) > 0 then
			--发送任务Ti猵 th毕允総o� 鸬 信息
			BeginEvent(sceneId)
				AddText(sceneId,x210213_g_MissionName)
				AddText(sceneId,x210213_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}")
				AddText(sceneId,x210213_g_MissionTarget)
				for i, item in x210213_g_ItemBonus do
					AddItemBonus( sceneId, item.id, item.num )
				end
				AddMoneyBonus( sceneId, x210213_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x210213_g_ScriptId,x210213_g_MissionId)
    end
end

--**********************************
--列举事件
--**********************************
function x210213_OnEnumerate( sceneId, selfId, targetId )
    --如果玩家完成过C醝 n鄖 任务
    if IsMissionHaveDone(sceneId,selfId,x210213_g_MissionId) > 0 then
    	return
	end
    --如果已接此任务
    if IsHaveMission(sceneId,selfId,x210213_g_MissionId) > 0 then
		AddNumText(sceneId,x210213_g_ScriptId,x210213_g_MissionName,2,-1);
		--Th鯽 m鉵任务接收条件
	elseif x210213_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x210213_g_ScriptId,x210213_g_MissionName,1,-1);
	end
end

--**********************************
--检测Ti猵 th跫�
--**********************************
function x210213_CheckAccept( sceneId, selfId )
	--C 4c才能接
	if GetLevel( sceneId, selfId ) >= 4 then
		return 1
	else
		return 0
	end
end

--**********************************
--Ti猵 th�
--**********************************
function x210213_OnAccept( sceneId, selfId )
	--加入任务到玩家列表
	AddMission( sceneId,selfId, x210213_g_MissionId, x210213_g_ScriptId, 1, 0, 0 )		--添加任务
	misIndex = GetMissionIndexByID(sceneId,selfId,x210213_g_MissionId)			-- 餴琺到任务to� 鸬 序列号
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)						--根据序列号把任务变量to� 鸬 第0位置0
	SetMissionByIndex(sceneId,selfId,misIndex,1,0)						--根据序列号把任务变量to� 鸬 第1位置0
	Msg2Player(  sceneId, selfId,"#YNh nhi甿 v�: 第m祎 次杀怪",MSG2PLAYER_PARA )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, x210213_g_SignPost.x, x210213_g_SignPost.z, x210213_g_SignPost.tip )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, 7, 71, 250, "白猿" )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, 75, 71, 250, "白猿" )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, 76, 71, 250, "白猿" )
end

--**********************************
--放弃
--**********************************
function x210213_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应to� 鸬 任务
    DelMission( sceneId, selfId, x210213_g_MissionId )
	CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x210213_g_SignPost.tip )
end

--**********************************
--继续
--**********************************
function x210213_OnContinue( sceneId, selfId, targetId )
	--提交任务时to� 鸬 � 餴琺餍畔�
    BeginEvent(sceneId)
		AddText(sceneId,x210213_g_MissionName)
		AddText(sceneId,x210213_g_MissionComplete)
		AddMoneyBonus( sceneId, x210213_g_MoneyBonus )
		for i, item in x210213_g_ItemBonus do
			AddItemBonus( sceneId, item.id, item.num )
		end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x210213_g_ScriptId,x210213_g_MissionId)
end

--**********************************
--检测喧ng否可以提交
--**********************************
function x210213_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x210213_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	misIndex = GetMissionIndexByID(sceneId,selfId,x210213_g_MissionId)
    num = GetMissionParam(sceneId,selfId,misIndex,1)
    if num == x210213_g_DemandTrueKill[1].num then
			return 1
		end
	return 0
end

--**********************************
--提交
--**********************************
function x210213_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	if x210213_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
    	BeginAddItem(sceneId)
			for i, item in x210213_g_ItemBonus do
				AddItem( sceneId,item.id, item.num )
			end
		ret = EndAddItem(sceneId,selfId)
		--添加任务奖励
	if ret > 0 then
			AddMoney(sceneId,selfId,x210213_g_MoneyBonus );
			LuaFnAddExp( sceneId, selfId, 1200)
			--扣除任务物品
			--for i, item in g_DemandItem do
			--	DelItem( sceneId, selfId, item.id, item.num )
			--end
		ret = DelMission( sceneId, selfId, x210213_g_MissionId )
		if ret > 0 then
			MissionCom( sceneId, selfId, x210213_g_MissionId )
				AddItemListToHuman(sceneId,selfId)
				Msg2Player(  sceneId, selfId,"#YHo鄋 t nhi甿 v�: 第m祎 次杀怪",MSG2PLAYER_PARA )
			end
		else
		--任务奖励没有加成功
			BeginEvent(sceneId)
				strText = "背包已满,无法Ho鄋 t nhi甿 v�"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x210213_OnKillObject( sceneId, selfId, objdataId ,objId)

	if GetName(sceneId,objId) == x210213_g_DemandTrueKill[1].name	  then
		--  鹫t 疬㧟所有人
		local num = GetMonsterOwnerCount(sceneId,objId)
		for j=0,num-1  do
			local humanObjId = GetMonsterOwnerID(sceneId,objId,j)
			
			-- 看有没有C醝 n鄖 任务
			if IsHaveMission(sceneId, humanObjId, x210213_g_MissionId) > 0 then
				local misIndex = GetMissionIndexByID(sceneId,humanObjId,x210213_g_MissionId)
				local nNum = GetMissionParam(sceneId,humanObjId,misIndex,1)
	 			if nNum < x210213_g_DemandTrueKill[1].num then
	 				if nNum == x210213_g_DemandTrueKill[1].num - 1 then
	 					SetMissionByIndex(sceneId,humanObjId,misIndex,0,1)
	 				end
	 				
			    SetMissionByIndex(sceneId,humanObjId,misIndex,1,nNum+1)
			  	BeginEvent(sceneId)
					strText = format("秀 gi猼 ch猼 %d/8 Th鴆 姓o B誧h Vi阯", GetMissionParam(sceneId,humanObjId,misIndex,1) )
					AddText(sceneId,strText);
			  	EndEvent(sceneId)
			  	DispatchMissionTips(sceneId,humanObjId)
	 			end
			end
		end
	end

end

--**********************************
--进入区域事件
--**********************************
function x210213_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x210213_OnItemChanged( sceneId, selfId, itemdataId )
end
