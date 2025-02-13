--找人任务
--赵天师寻誱祎 泼忌�
--MisDescBegin
--脚本号
x210230_g_ScriptId = 210230

--Ti猵 th挝馧PC属性
x210230_g_Position_X=275.2234
x210230_g_Position_Z=49.2906
x210230_g_SceneID=2
x210230_g_AccomplishNPC_Name="Ho鄋g Mi T錸g"

--任务号
x210230_g_MissionId = 710

--上m祎 c醝任务to� 鸬 ID
--g_MissionIdPre =

--目标NPC
x210230_g_Name	="Ho鄋g Mi T錸g"

--任务归类
x210230_g_MissionKind = 13

--衅ng c nhi甿 v� 
x210230_g_MissionLevel = 9

--喧ng否喧ngTinh英任务
x210230_g_IfMissionElite = 0

--任务名
x210230_g_MissionName="袖 Ti瑄 M礳 Nh鈔 H課g"
x210230_g_MissionInfo="#{event_dali_0043}"
x210230_g_MissionTarget="衖 #GNi阭 Hoa T� c黙 g骳 恤ng B th鄋h 姓i L�#W t靘 #RHo鄋g Mi T錸g #W#{_INFOAIM275,49,2, Ho鄋g Mi T錸g}. "
x210230_g_MissionComplete="  Th� ch�, ch鷑g ta l読 g m r癷. Xin th� ch� chu b� 馥y 瘘 d唼c ph v� trang b� tu luy畁, r癷 v鄌 #GTi瑄 M礳 Nh鈔 H課g #W"
x210230_g_MoneyBonus=72
x210230_g_SignPost = {x = 275, z = 50, tip = "Ho鄋g Mi T錸g"}

x210230_g_Custom	= { {id="秀 t靘 th Ho鄋g Mi T錸g",num=1} }
x210230_g_IsMissionOkFail = 1		--变量to� 鸬 第0位

--MisDescEnd
--**********************************
--任务入口函数
--**********************************
function x210230_OnDefaultEvent( sceneId, selfId, targetId )
    --如果玩家完成过C醝 n鄖 任务
    if (IsMissionHaveDone(sceneId,selfId,x210230_g_MissionId) > 0 ) then
    	return
	elseif( IsHaveMission(sceneId,selfId,x210230_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x210230_g_Name then
			x210230_OnContinue( sceneId, selfId, targetId )
		end
    --Th鯽 m鉵任务接收条件
    elseif x210230_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x210230_g_Name then
			--发送任务Ti猵 th毕允総o� 鸬 信息
			BeginEvent(sceneId)
				AddText(sceneId,x210230_g_MissionName)
				AddText(sceneId,x210230_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}")
				AddText(sceneId,x210230_g_MissionTarget)
				AddMoneyBonus( sceneId, x210230_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x210230_g_ScriptId,x210230_g_MissionId)
		end
    end
end

--**********************************
--列举事件
--**********************************
function x210230_OnEnumerate( sceneId, selfId, targetId )
    --如果玩糾祎 刮赐瓿缮蟤祎 c醝任务
    --if 	IsMissionHaveDone(sceneId,selfId,g_MissionIdPre) <= 0 then
    --	return
    --end
    --如果玩家完成过C醝 n鄖 任务
    if IsMissionHaveDone(sceneId,selfId,x210230_g_MissionId) > 0 then
    	return
    --如果已接此任务
    elseif IsHaveMission(sceneId,selfId,x210230_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x210230_g_Name then
			AddNumText(sceneId, x210230_g_ScriptId,x210230_g_MissionName,2,-1);
		end
    --Th鯽 m鉵任务接收条件
    elseif x210230_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x210230_g_Name then
			AddNumText(sceneId,x210230_g_ScriptId,x210230_g_MissionName,1,-1);
		end
    end
end

--**********************************
--检测Ti猵 th跫�
--**********************************
function x210230_CheckAccept( sceneId, selfId )
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
function x210230_OnAccept( sceneId, selfId )
	--加入任务到玩家列表
	AddMission( sceneId,selfId, x210230_g_MissionId, x210230_g_ScriptId, 0, 0, 0 )
	Msg2Player(  sceneId, selfId,"#YNh nhi甿 v�#W: 袖 Ti瑄 M礳 Nh鈔 H課g",MSG2PLAYER_PARA )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, x210230_g_SignPost.x, x210230_g_SignPost.z, x210230_g_SignPost.tip )

	-- 设置任务完成标志
	local misIndex = GetMissionIndexByID(sceneId,selfId,x210230_g_MissionId)
	SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
	SetMissionByIndex( sceneId, selfId, misIndex, 1, 1)
end

--**********************************
--放弃
--**********************************
function x210230_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应to� 鸬 任务
  DelMission( sceneId, selfId, x210230_g_MissionId )
	CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x210230_g_SignPost.tip )
end

--**********************************
--继续
--**********************************
function x210230_OnContinue( sceneId, selfId, targetId )
	--提交任务时to� 鸬 � 餴琺餍畔�
    BeginEvent(sceneId)
		AddText(sceneId,x210230_g_MissionName)
		AddText(sceneId,x210230_g_MissionComplete)
		AddMoneyBonus( sceneId, x210230_g_MoneyBonus )
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x210230_g_ScriptId,x210230_g_MissionId)
end

--**********************************
--检测喧ng否可以提交
--**********************************
function x210230_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x210230_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--提交
--**********************************
function x210230_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x210230_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		--添加任务奖励
		AddMoney(sceneId,selfId,x210230_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId,300)
		DelMission( sceneId,selfId,  x210230_g_MissionId )
		--设置任务已经被完成过
		MissionCom( sceneId,selfId,  x210230_g_MissionId )
		Msg2Player(  sceneId, selfId,"#YHo鄋 t nhi甿 v�#W: 袖 Ti瑄 M礳 Nh鈔 H課g",MSG2PLAYER_PARA )
		CallScriptFunction( 210231, "OnDefaultEvent",sceneId, selfId, targetId)
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x210230_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--进入区域事件
--**********************************
function x210230_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x210230_OnItemChanged( sceneId, selfId, itemdataId )
end
