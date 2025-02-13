--杀怪任务
--小木人巷
--小木人巷杀木人任务
--MisDescBegin
--脚本号
x210231_g_ScriptId  = 210231

--上m祎 c醝任务to� 鸬 ID
x210231_g_MissionIdPre = 710

--任务号
x210231_g_MissionId = 711

--目标NPC
x210231_g_Name	="Ho鄋g Mi T錸g"

--任务归类
x210231_g_MissionKind = 13

--衅ng c nhi甿 v� 
x210231_g_MissionLevel = 9

--喧ng否喧ngTinh英任务
x210231_g_IfMissionElite = 0

--下面几项喧ng动态显示to� 鸬 内容,用于T読 任务列表中动态显示任务情况**********************
--任务喧ng否已经完成
x210231_g_IsMissionOkFail = 0		--变量to� 鸬 第0位

--任务C 杀死to� 鸬 怪
x210231_g_DemandKill ={{id=703,num=5}}		--变量第1位

--以上喧ng动态**************************************************************

--任务文本描述
x210231_g_MissionName="Ti瑄 M礳 Nh鈔 H課g"
x210231_g_MissionInfo="  Th� ch�, Ti瑄 M礳 Nh鈔 H課g tuy s醤h kh鬾g bg Thi猽 L鈓 M礳 Nh鈔 H課g, nh遪g qu醝 v � b阯 trong ki陁 d鹡g d� th叨ng. Xin th� ch� l鷆 tu luy畁 d痗 to鄋 s裞. #rTh� ch� ch� c gi猼 ch猼 5 con M礳 啸u Nh鈔, l tu luy畁 n鄖 疸 ho鄋 th鄋h r癷. 1 l ch遖 疳nh h猼 c鹡g kh鬾g sao, th� ch� c� th� quay ra r癷 v鄌 l読 Ti瑄 M礳 Nh鈔 H課g, 皙n khi n鄌 ho鄋 th鄋h th� th鬷. " --任务描述
x210231_g_MissionTarget="� #G Ti瑄 M礳 Nh鈔 H課g#W gi猼 ch猼 5 con#R M礳 啸u Nh鈔#W, sau 痼 quay v� g #RHo鄋g Mi T錸g #W#{_INFOAIM275,49,2, Ho鄋g Mi T錸g}."	--M鴆 ti陁 nhi甿 v�
x210231_g_ContinueInfo="C醕 h� 疸 gi猼 ch猼 5 con M礳 啸u Nh鈔 ch遖?"	--未Ho鄋 t nhi甿 v鴗o� 鸬 npc对话
x210231_g_MissionComplete="  Qu� tr靚h tu luy畁 c黙 th� ch� r th鄋h c鬾g. Kh鬾g g 1 l鷆, v� c鬾g c黙 th� ch� 疸 tinh ti猲 kh鬾g 韙. "	--Ho鄋 t nhi甿 v鴑pc说话to� 鸬 话
x210231_g_SignPost = {x = 275, z = 50, tip = "Ho鄋g Mi T錸g"}
--任务奖励
x210231_g_MoneyBonus=200
--x210231_g_ItemBonus={{id=40002108,num=1},{id=30101001,num=5}}

x210231_g_DemandTrueKill ={{name="M礳 啸u Nh鈔",num=5}}

--MisDescEnd
--**********************************
--任务入口函数
--**********************************
function x210231_OnDefaultEvent( sceneId, selfId, targetId )	-- 餴琺击该任务后执行此脚本
	--如果玩家完成过C醝 n鄖 任务(实际上如果完成了任务这里就不会显示,但喧ng再检测m祎 次比较安全)
    --if IsMissionHaveDone(sceneId,selfId,x210231_g_MissionId) > 0 then
	--	return
	--end
	--如果已接此任务
	if IsHaveMission(sceneId,selfId,x210231_g_MissionId) > 0 then
		--发送任务需求to� 鸬 信息
		BeginEvent(sceneId)
			AddText(sceneId,x210231_g_MissionName)
			AddText(sceneId,x210231_g_ContinueInfo)
			--for i, item in g_DemandItem do
			--	AddItemDemand( sceneId, item.id, item.num )
			--end
			AddMoneyBonus( sceneId, x210231_g_MoneyBonus )
		EndEvent( )
		bDone = x210231_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x210231_g_ScriptId ,x210231_g_MissionId,bDone)
    --Th鯽 m鉵任务接收条件
    elseif x210231_CheckAccept(sceneId,selfId) > 0 then
			--发送任务Ti猵 th毕允総o� 鸬 信息
			BeginEvent(sceneId)
				AddText(sceneId,x210231_g_MissionName)
				AddText(sceneId,x210231_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}")
				AddText(sceneId,x210231_g_MissionTarget)
				--for i, item in x210231_g_ItemBonus do
				--	AddItemBonus( sceneId, item.id, item.num )
				--end
				AddMoneyBonus( sceneId, x210231_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x210231_g_ScriptId ,x210231_g_MissionId)
    end
end

--**********************************
--列举事件
--**********************************
function x210231_OnEnumerate( sceneId, selfId, targetId )
    --如果玩糾祎 刮赐瓿缮蟤祎 c醝任务
    if 	IsMissionHaveDone(sceneId,selfId,x210231_g_MissionIdPre) <= 0 then
    	return
    end
    --如果玩家完成过C醝 n鄖 任务
    if IsMissionHaveDone(sceneId,selfId,x210231_g_MissionId) > 0 then
    	return
	end
    --如果已接此任务
    if IsHaveMission(sceneId,selfId,x210231_g_MissionId) > 0 then
		AddNumText(sceneId,x210231_g_ScriptId ,x210231_g_MissionName,2,-1);
		--Th鯽 m鉵任务接收条件
	elseif x210231_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x210231_g_ScriptId ,x210231_g_MissionName,1,-1);
	end
end

--**********************************
--检测Ti猵 th跫�
--**********************************
function x210231_CheckAccept( sceneId, selfId )
	--C 9c才能接
	if GetLevel( sceneId, selfId ) >= 9 then
		return 1
	else
		return 0
	end
end

--**********************************
--Ti猵 th�
--**********************************
function x210231_OnAccept( sceneId, selfId )
	--加入任务到玩家列表
	AddMission( sceneId,selfId, x210231_g_MissionId, x210231_g_ScriptId , 1, 0, 0 )		--添加任务
	misIndex = GetMissionIndexByID(sceneId,selfId,x210231_g_MissionId)			-- 餴琺到任务to� 鸬 序列号
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)						--根据序列号把任务变量to� 鸬 第0位置0
	SetMissionByIndex(sceneId,selfId,misIndex,1,0)						--根据序列号把任务变量to� 鸬 第1位置0
	Msg2Player(  sceneId, selfId,"#YNh nhi甿 v�#W: Ti瑄 M礳 Nh鈔 H課g",MSG2PLAYER_PARA )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, x210231_g_SignPost.x, x210231_g_SignPost.z, x210231_g_SignPost.tip )
end

--**********************************
--放弃
--**********************************
function x210231_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应to� 鸬 任务
    DelMission( sceneId, selfId, x210231_g_MissionId )
	CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x210231_g_SignPost.tip )
end

--**********************************
--继续
--**********************************
function x210231_OnContinue( sceneId, selfId, targetId )
	--提交任务时to� 鸬 � 餴琺餍畔�
    BeginEvent(sceneId)
		AddText(sceneId,x210231_g_MissionName)
		AddText(sceneId,x210231_g_MissionComplete)
		AddMoneyBonus( sceneId, x210231_g_MoneyBonus )
		--for i, item in x210231_g_ItemBonus do
		--	AddItemBonus( sceneId, item.id, item.num )
		--end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x210231_g_ScriptId ,x210231_g_MissionId)
end

--**********************************
--检测喧ng否可以提交
--**********************************
function x210231_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x210231_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	misIndex = GetMissionIndexByID(sceneId,selfId,x210231_g_MissionId)
    num = GetMissionParam(sceneId,selfId,misIndex,1)
    if num == x210231_g_DemandTrueKill[1].num then
			return 1
		end
	return 0
end

--**********************************
--提交
--**********************************
function x210231_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	if x210231_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		ret = 1
		--添加任务奖励
		if ret > 0 then
			AddMoney(sceneId,selfId,x210231_g_MoneyBonus );
			LuaFnAddExp( sceneId, selfId,1620)
			--扣除任务物品
			--for i, item in g_DemandItem do
			--	DelItem( sceneId, selfId, item.id, item.num )
			--end
			ret = DelMission( sceneId, selfId, x210231_g_MissionId )
			if ret > 0 then
				MissionCom( sceneId, selfId, x210231_g_MissionId )
				--AddItemListToHuman(sceneId,selfId)
				Msg2Player(  sceneId, selfId,"#YHo鄋 t nhi甿 v�#W: Ti瑄 M礳 Nh鈔 H課g",MSG2PLAYER_PARA )
				CallScriptFunction( 210232, "OnDefaultEvent",sceneId, selfId, targetId)
			end
		else
		--任务奖励没有加成功
			BeginEvent(sceneId)
				strText = "Kh鬾g th� Ho鄋 t nhi甿 v�"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x210231_OnKillObject( sceneId, selfId, objdataId ,objId)
	
	if GetName(sceneId,objId) == x210231_g_DemandTrueKill[1].name	  then
		--  鹫t 疬㧟所有人
		local num = GetMonsterOwnerCount(sceneId,objId)
		for j=0,num-1  do
			local humanObjId = GetMonsterOwnerID(sceneId,objId,j)
			
			-- 看有没有C醝 n鄖 任务
			if IsHaveMission(sceneId, humanObjId, x210231_g_MissionId) > 0 then
				local misIndex = GetMissionIndexByID(sceneId,humanObjId,x210231_g_MissionId)
				local nNum = GetMissionParam(sceneId,humanObjId,misIndex,1)

	 			if nNum < x210231_g_DemandTrueKill[1].num then
	 				if nNum == x210231_g_DemandTrueKill[1].num - 1 then
	 					SetMissionByIndex(sceneId,humanObjId,misIndex,0,1)
	 				end
	 				
			    SetMissionByIndex(sceneId,humanObjId,misIndex,1,nNum+1)
			  	BeginEvent(sceneId)
					strText = format("秀 gi猼 疬㧟 %d/5 M礳 啸u Nh鈔", GetMissionParam(sceneId,humanObjId,misIndex,1) )
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
function x210231_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x210231_OnItemChanged( sceneId, selfId, itemdataId )
end
