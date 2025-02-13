--人之初--把m祎 件衣服 疬a cho 小乞丐
--段延庆
--MisDescBegin
--脚本号
x210227_g_ScriptId = 210227

--任务号
x210227_g_MissionId = 707

--上m祎 c醝任务to� 鸬 ID
x210227_g_MissionIdPre = 706

--目标NPC
x210227_g_Name	="衞鄋 Di阯 Kh醤h"

--任务归类
x210227_g_MissionKind = 13

--衅ng c nhi甿 v� 
x210227_g_MissionLevel = 8

--喧ng否喧ngTinh英任务
x210227_g_IfMissionElite = 0

--下面几项喧ng动态显示to� 鸬 内容,用于T読 任务列表中动态显示任务情况**********************
--任务喧ng否已经完成
x210227_g_IsMissionOkFail = 0		--变量to� 鸬 第0位

--以上喧ng动态**************************************************************

--任务文本描述
x210227_g_MissionName="Tg b� y"
x210227_g_MissionInfo="#{event_dali_0038}"
x210227_g_MissionTarget="#{event_dali_0039}"
x210227_g_ContinueInfo="   [C醕 h� 疸 餰m #Yb� y#W cho #Rti瑄 kh c醝#W ch遖?]"
x210227_g_MissionComplete="   [Ch�, xem ra con ng叨i tr� tu眎 c醕 h� th kh鬾g 鸾n gi鋘. ]"
x210227_g_SignPost = {x = 199, z = 256, tip = "Ti瑄 Kh C醝"}
x210227_g_Custom	= { {id="羞a b� y cho ti瑄 kh c醝",num=1} }
--任务奖励
x210227_g_MoneyBonus=100
--g_ItemBonus={{id=40002108,num=1}}

--MisDescEnd
--**********************************
--任务入口函数
--**********************************
function x210227_OnDefaultEvent( sceneId, selfId, targetId )	-- 餴琺击该任务后执行此脚本
	--如果玩家完成过C醝 n鄖 任务(实际上如果完成了任务这里就不会显示,但喧ng再检测m祎 次比较安全)
    --if IsMissionHaveDone(sceneId,selfId,x210227_g_MissionId) > 0 then
	--	return
	--end
	--如果已接此任务
	if IsHaveMission(sceneId,selfId,x210227_g_MissionId) > 0 then
		--发送任务需求to� 鸬 信息
		BeginEvent(sceneId)
			AddText(sceneId,x210227_g_MissionName)
			AddText(sceneId,x210227_g_ContinueInfo)
			--for i, item in g_DemandItem do
			--	AddItemDemand( sceneId, item.id, item.num )
			--end
			AddMoneyBonus( sceneId, x210227_g_MoneyBonus )
		EndEvent()
		bDone = x210227_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x210227_g_ScriptId,x210227_g_MissionId,bDone)		
    --Th鯽 m鉵任务接收条件
    elseif x210227_CheckAccept(sceneId,selfId) > 0 then
		--发送任务Ti猵 th毕允総o� 鸬 信息
		BeginEvent(sceneId)
			AddText(sceneId,x210227_g_MissionName)
			AddText(sceneId,x210227_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}")
			AddText(sceneId,x210227_g_MissionTarget)
			--for i, item in g_ItemBonus do
			--	AddItemBonus( sceneId, item.id, item.num )
			--end
			--for i, item in g_RadioItemBonus do
			--	AddRadioItemBonus( sceneId, item.id, item.num )
			--end
			AddMoneyBonus( sceneId, x210227_g_MoneyBonus )
			EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x210227_g_ScriptId,x210227_g_MissionId)
    end
end

--**********************************
--列举事件
--**********************************
function x210227_OnEnumerate( sceneId, selfId, targetId )
    --如果玩糾祎 刮赐瓿缮蟤祎 c醝任务
    if 	IsMissionHaveDone(sceneId,selfId,x210227_g_MissionIdPre) <= 0 then
    	return
    end
    --如果玩家完成过C醝 n鄖 任务
    if IsMissionHaveDone(sceneId,selfId,x210227_g_MissionId) > 0 then
    	return 
	end
    --如果已接此任务
    if IsHaveMission(sceneId,selfId,x210227_g_MissionId) > 0 then
		AddNumText(sceneId,x210227_g_ScriptId,x210227_g_MissionName,2,-1);
		--Th鯽 m鉵任务接收条件
	elseif x210227_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x210227_g_ScriptId,x210227_g_MissionName,1,-1);
	end
end

--**********************************
--检测Ti猵 th跫�
--**********************************
function x210227_CheckAccept( sceneId, selfId )
	--C 8c才能接
	if GetLevel( sceneId, selfId ) >= 8 then
		return 1
	else
		return 0
	end
end

--**********************************
--Ti猵 th�
--**********************************
function x210227_OnAccept( sceneId, selfId )
	--加入任务到玩家列表
	AddMission( sceneId,selfId, x210227_g_MissionId, x210227_g_ScriptId, 1, 0, 0 )		--添加任务
	misIndex = GetMissionIndexByID(sceneId,selfId,x210227_g_MissionId)			-- 餴琺到任务to� 鸬 序列号
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)						--根据序列号把任务变量to� 鸬 第0位置0
	SetMissionByIndex(sceneId,selfId,misIndex,1,0)						--根据序列号把任务变量to� 鸬 第1位置0
	Msg2Player(  sceneId, selfId,"#YNh nhi甿 v�#W: Tg b� y",MSG2PLAYER_PARA )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, x210227_g_SignPost.x, x210227_g_SignPost.z, x210227_g_SignPost.tip )
end

--**********************************
--放弃
--**********************************
function x210227_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应to� 鸬 任务
    DelMission( sceneId, selfId, x210227_g_MissionId )
	CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x210227_g_SignPost.tip )
end

--**********************************
--继续
--**********************************
function x210227_OnContinue( sceneId, selfId, targetId )
	--提交任务时to� 鸬 � 餴琺餍畔�
    BeginEvent(sceneId)
		AddText(sceneId,x210227_g_MissionName)
		AddText(sceneId,x210227_g_MissionComplete)
		AddMoneyBonus( sceneId, x210227_g_MoneyBonus )
		--for i, item in g_ItemBonus do
		--	AddItemBonus( sceneId, item.id, item.num )
		--end
		--for i, item in g_RadioItemBonus do
		--	AddRadioItemBonus( sceneId, item.id, item.num )
		--end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x210227_g_ScriptId,x210227_g_MissionId)
end

--**********************************
--检测喧ng否可以提交
--**********************************
function x210227_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x210227_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	misIndex = GetMissionIndexByID(sceneId,selfId,x210227_g_MissionId)
    num = GetMissionParam(sceneId,selfId,misIndex,0)
    if num == 1 then
		return 1
	end
	return 0
end

--**********************************
--提交
--**********************************
function x210227_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	if x210227_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
    	--BeginAddItem(sceneId)
		--	for i, item in g_ItemBonus do
		--		AddItem( sceneId,item.id, item.num )
		--	end
		--ret = EndAddItem(sceneId,selfId)
		--添加任务奖励
		--if ret > 0 then
		--else
		--任务奖励没有加成功
		--	BeginEvent(sceneId)
		--		strText = "背包已满,无法Ho鄋 t nhi甿 v�"
		--		AddText(sceneId,strText);
		--	EndEvent(sceneId)
		--	DispatchMissionTips(sceneId,selfId)
		--end
		AddMoney(sceneId,selfId,x210227_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId, 500)
		--扣除任务物品
		--for i, item in g_DemandItem do
		--	DelItem( sceneId, selfId, item.id, item.num )
		--end
		ret = DelMission( sceneId, selfId, x210227_g_MissionId )
		if ret > 0 then
			MissionCom( sceneId, selfId, x210227_g_MissionId )
			--AddItemListToHuman(sceneId,selfId)
			Msg2Player(  sceneId, selfId,"#YHo鄋 t nhi甿 v�#W: Tg b� y",MSG2PLAYER_PARA )
			CallScriptFunction( 210228, "OnDefaultEvent",sceneId, selfId, targetId)
		end
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x210227_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--进入区域事件
--**********************************
function x210227_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x210227_OnItemChanged( sceneId, selfId, itemdataId )
end
