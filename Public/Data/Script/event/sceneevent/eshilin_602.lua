--Th誧h L鈓 
--MisDescBegin
--脚本号
x212103_g_ScriptId = 212103

--任务号
x212103_g_MissionId = 602

--M鴆 ti陁 nhi甿 v鴑pc
x212103_g_Name	="Vi阯 Nguy畉 Th鬾 Th鬾 Tr叻ng Tr竛h Huy玭" 

--任务归类
x212103_g_MissionKind = 37

--衅ng c nhi甿 v� 
x212103_g_MissionLevel = 55

--喧ng否喧ngTinh英任务
x212103_g_IfMissionElite = 0

--******下面几项喧ng动态显示to� 鸬 内容,用于T読 任务列表中动态显示任务情况******
--任务喧ng否已经完成
x212103_g_IsMissionOkFail = 0		--变量to� 鸬 第0位

--******以上喧ng动态*****

--任务文本描述
x212103_g_MissionName="V鵱g 黏t tuy畉 v鱪g"
x212103_g_MissionInfo="#{Lua_Shilin_001}"
x212103_g_MissionTarget="Nghe c鈛 chuy畁 Tr竛h Huy玭 k� #{_INFOAIM182,163,26, Tr竛h Huy玭}."
x212103_g_ContinueInfo="....."
x212103_g_MissionComplete="Chuy畁 c黙 ta 疸 k� xong, ng呓i h銀 suy ngh� 餴"

x212103_g_MoneyBonus=21000
x212103_g_Exp = 6000

--MisDescEnd
--**********************************
--任务入口函数
--**********************************
function x212103_OnDefaultEvent( sceneId, selfId, targetId )
	--如果已接此任务
	if IsHaveMission(sceneId,selfId,x212103_g_MissionId) > 0 then
		--发送任务需求to� 鸬 信息
		BeginEvent(sceneId)
			AddText(sceneId,x212103_g_MissionName)
			AddText(sceneId,x212103_g_ContinueInfo)
		EndEvent()
		bDone = x212103_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x212103_g_ScriptId,x212103_g_MissionId,bDone)
		--Th鯽 m鉵任务接收条件
	elseif x212103_CheckAccept(sceneId,selfId) > 0 then
		--发送任务Ti猵 th毕允総o� 鸬 信息
		BeginEvent(sceneId)
			AddText(sceneId,x212103_g_MissionName)
			AddText(sceneId,x212103_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}")
			AddText(sceneId,x212103_g_MissionTarget)
			AddMoneyBonus( sceneId, x212103_g_MoneyBonus )
		
		EndEvent()
		DispatchMissionInfo(sceneId,selfId,targetId,x212103_g_ScriptId,x212103_g_MissionId)
	end
end

--**********************************
--列举事件
--**********************************
function x212103_OnEnumerate( sceneId, selfId, targetId )
	--如果玩家完成过C醝 n鄖 任务
	if IsMissionHaveDone(sceneId,selfId,x212103_g_MissionId) > 0 then
		return 
	end

	--如果已接此任务
	if IsHaveMission(sceneId,selfId,x212103_g_MissionId) > 0 then
		AddNumText(sceneId, x212103_g_ScriptId, x212103_g_MissionName, 2, -1);
		--Th鯽 m鉵任务接收条件
	elseif x212103_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId, x212103_g_ScriptId, x212103_g_MissionName, 1, -1);
	end
end

--**********************************
--检测Ti猵 th跫�
--**********************************
function x212103_CheckAccept( sceneId, selfId )
	-- 如果玩家做过C醝 n鄖 任务,不能再做
	if IsMissionHaveDone(sceneId,selfId,x212103_g_MissionId) > 0 then
		return 0
	end
	--C 1c才能接
	if GetLevel( sceneId, selfId ) >= x212103_g_MissionLevel then
		return 1
	else
		return 0
	end
end

--**********************************
--Ti猵 th�
--**********************************
function x212103_OnAccept( sceneId, selfId )
	-- 如果玩家做过C醝 n鄖 任务,不能再做
	if IsMissionHaveDone(sceneId,selfId,x212103_g_MissionId) > 0 then
		return 
	end

	-- 加入任务到玩家列表
	local ret = AddMission( sceneId,selfId, x212103_g_MissionId, x212103_g_ScriptId, 1, 0, 0 )

	-- C 考虑玩家喧ng不喧ng能够Ti猵 th紺醝 n鄖 任务
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#YNh k� nhi甿 v� c黙 c醕 h� 疸 馥y" , MSG2PLAYER_PARA )
		return
	end

	-- 玩家已经接到了C醝 n鄖 任务
	misIndex = GetMissionIndexByID(sceneId,selfId,x212103_g_MissionId)		-- 餴琺到任务to� 鸬 序列号
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)	--根据序列号把任务变量to� 鸬 第0位置0 (任务完成情况)
	
	-- 消息通知客户端
	Msg2Player(  sceneId, selfId,"#YTi猵 nh#W ".. x212103_g_MissionName, MSG2PLAYER_PARA )
	BeginEvent(sceneId)
		strText = "#YTi猵 nh#W " .. x212103_g_MissionName
		AddText(sceneId,strText);
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
end

--**********************************
--放弃
--**********************************
function x212103_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应to� 鸬 任务
	DelMission( sceneId, selfId, x212103_g_MissionId )
end

--**********************************
--继续
--**********************************
function x212103_OnContinue( sceneId, selfId, targetId )
	--提交任务时to� 鸬 � 餴琺餍畔�
	BeginEvent(sceneId)
		AddText(sceneId,x212103_g_MissionName)
		AddText(sceneId,x212103_g_MissionComplete)
		AddMoneyBonus( sceneId, x212103_g_MoneyBonus )
				
    EndEvent( )
	DispatchMissionContinueInfo(sceneId,selfId,targetId,x212103_g_ScriptId,x212103_g_MissionId)
end

--**********************************
--检测喧ng否可以提交
--**********************************
function x212103_CheckSubmit( sceneId, selfId )
	local misIndex = GetMissionIndexByID(sceneId,selfId,x212103_g_MissionId)
	local bComplete = GetMissionParam(sceneId, selfId, misIndex, 0)	
	if bComplete > 0 then
		return 1
	else
		return 0
	end
end

--**********************************
--提交
--**********************************
function x212103_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	-- 安全性检测
	-- 1、检测玩家喧ng不喧ng有C醝 n鄖 任务
	if IsHaveMission(sceneId,selfId,x212103_g_MissionId) <= 0 then
		return
	end
	-- 2、其他检测
	if x212103_CheckSubmit( sceneId, selfId )  <= 0  then
		return
	end

	--添加任务奖励
	AddMoney(sceneId, selfId, x212103_g_MoneyBonus )
	AddExp(sceneId, selfId, x212103_g_Exp)
	DelMission( sceneId, selfId, x212103_g_MissionId )
	--设置任务已经被完成过
	MissionCom( sceneId,selfId, x212103_g_MissionId )
	
	-- 消息通知客户端
	
	
end

--**********************************
--杀死怪物或玩家
--**********************************
function x212103_OnKillObject( sceneId, selfId, objdataId ,objId)

end

--**********************************
--进入区域事件
--**********************************
function x212103_OnEnterArea( sceneId, selfId, zoneId )

end

--**********************************
--道具改变
--**********************************
function x212103_OnItemChanged( sceneId, selfId, itemdataId )

end
