-- 200093 
-- 送信任务 

--MisDescBegin

--脚本号
x200093_g_ScriptId = 200093

--任务号
x200093_g_MissionId = 26

--前续任务
x200093_g_PreMissionId = 25

--Ti猵 th挝馧PC属性
x200093_g_Position_X=128
x200093_g_Position_Z=50
x200093_g_SceneID=18
x200093_g_AccomplishNPC_Name="Gia Lu M誧 Ca"

--目标NPC
x200093_g_Name	="Ti陁 Phong"

--任务归类
x200093_g_MissionKind = 52

--衅ng c nhi甿 v� 
x200093_g_MissionLevel = 50

--喧ng否喧ngTinh英任务
x200093_g_IfMissionElite = 0

--任务名
x200093_g_MissionName="T緄 n鷌 Th呓ng Mang"
x200093_g_MissionInfo="#{Mis_juqing_0026}"
x200093_g_MissionTarget="#{Mis_juqing_Tar_0026}"
x200093_g_MissionComplete="  $N, ng鱪 gi� n鄌 th眎 ng呓i t緄 疴y? 喧ng l� nh� ca ca ph鋓 kh鬾g?"

x200093_g_MoneyBonus=23400
x200093_g_exp=31920

x200093_g_Custom	= { {id="秀 t靘 疬㧟 Ti陁 Phong",num=1} }
x200093_g_IsMissionOkFail = 0

--MisDescEnd
--**********************************
--任务入口函数
--**********************************
function x200093_OnDefaultEvent( sceneId, selfId, targetId )
	
	--如果玩家完成过C醝 n鄖 任务
	if (IsMissionHaveDone(sceneId,selfId,x200093_g_MissionId) > 0 ) then
		return
	elseif( IsHaveMission(sceneId,selfId,x200093_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x200093_g_Name then
			x200093_OnContinue( sceneId, selfId, targetId )
		end
	
	--Th鯽 m鉵任务接收条件
	elseif x200093_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x200093_g_Name then
			--发送任务Ti猵 th毕允総o� 鸬 信息
			local  PlayerName=GetName(sceneId,selfId)	
			BeginEvent(sceneId)
				AddText(sceneId,x200093_g_MissionName)
				AddText(sceneId,x200093_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}#r")
				AddText(sceneId,x200093_g_MissionTarget)
				AddText(sceneId,"#{M_SHOUHUO}#r")
				AddMoneyBonus( sceneId, x200093_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x200093_g_ScriptId,x200093_g_MissionId)
		end
	end
end

--**********************************
--列举事件
--**********************************
function x200093_OnEnumerate( sceneId, selfId, targetId )

	--如果玩家完成过C醝 n鄖 任务
	if IsMissionHaveDone(sceneId,selfId,x200093_g_MissionId) > 0 then
		return 
	--如果已接此任务
	elseif IsHaveMission(sceneId,selfId,x200093_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x200093_g_Name then
			AddNumText(sceneId, x200093_g_ScriptId,x200093_g_MissionName,2,-1);
		end
	--Th鯽 m鉵任务接收条件
	elseif x200093_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x200093_g_Name then
			AddNumText(sceneId,x200093_g_ScriptId,x200093_g_MissionName,1,-1);
		end
	end

end

--**********************************
--检测Ti猵 th跫�
--**********************************
function x200093_CheckAccept( sceneId, selfId )
	-- 1,检测玩家喧ng不喧ng已经做过
	if (IsMissionHaveDone(sceneId,selfId,x200093_g_MissionId) > 0 ) then
		return 0
	end
		
	-- 等c检测
	if GetLevel( sceneId, selfId ) < x200093_g_MissionLevel then
		return 0
	end
	
	-- 前续任务to� 鸬 完成情况
	if IsMissionHaveDone(sceneId,selfId,x200093_g_PreMissionId) < 1  then
		return 0
	end
	
	return 1	
end

--**********************************
--Ti猵 th�
--**********************************
function x200093_OnAccept( sceneId, selfId, targetId )
	if x200093_CheckAccept(sceneId, selfId) < 1   then
		return 0
	end
	
	-- C 网玩家身上丢m祎 c醝物品
	BeginAddItem( sceneId )
		AddItem( sceneId, 40001007, 1 )
	local ret = EndAddItem( sceneId, selfId )

	if ret <= 0 then 
		--提示不能接任务了
		Msg2Player(  sceneId, selfId,"#Yh鄋h Trang nhi甿 v�#W c黙 c醕 h� 疸 馥y", MSG2PLAYER_PARA )
	else
		--加入任务到玩家列表
		local ret = AddMission( sceneId,selfId, x200093_g_MissionId, x200093_g_ScriptId, 0, 0, 0 )
		if ret <= 0 then
			Msg2Player(  sceneId, selfId,"#YNh k� nhi甿 v� c黙 c醕 h� 疸 馥y" , MSG2PLAYER_PARA )
			return
		end
		AddItemListToHuman(sceneId,selfId)
		Msg2Player(  sceneId, selfId,"#YNh nhi甿 v�#W: T緄 n鷌 Th呓ng Mang xa",MSG2PLAYER_PARA )

		local misIndex = GetMissionIndexByID(sceneId,selfId,x200093_g_MissionId)
		SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
		SetMissionByIndex( sceneId, selfId, misIndex, 1, 1)
	end

end

--**********************************
--放弃
--**********************************
function x200093_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应to� 鸬 任务
  DelMission( sceneId, selfId, x200093_g_MissionId )
	DelItem( sceneId, selfId, 40001007, 1 )	
--	CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x200093_g_SignPost.tip )
end

--**********************************
--继续
--**********************************
function x200093_OnContinue( sceneId, selfId, targetId )
	--提交任务时to� 鸬 � 餴琺餍畔�
    BeginEvent(sceneId)
		AddText(sceneId,x200093_g_MissionName)
		AddText(sceneId,x200093_g_MissionComplete)
		AddMoneyBonus( sceneId, x200093_g_MoneyBonus )
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x200093_g_ScriptId,x200093_g_MissionId)
end

--**********************************
--检测喧ng否可以提交
--**********************************
function x200093_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x200093_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--提交
--**********************************
function x200093_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x200093_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		--添加任务奖励
		DelItem( sceneId, selfId, 40001007, 1 )	
		AddMoney(sceneId,selfId,x200093_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId,x200093_g_exp)
		DelMission( sceneId,selfId,  x200093_g_MissionId )
		--设置任务已经被完成过
		MissionCom( sceneId,selfId,  x200093_g_MissionId )
		Msg2Player(  sceneId, selfId,"#YHo鄋 t nhi甿 v�#W: T緄 n鷌 Th呓ng Mang xa",MSG2PLAYER_PARA )
		-- 调用后续任务
		CallScriptFunction((200031), "OnDefaultEvent",sceneId, selfId, targetId )
		
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x200093_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--进入区域事件
--**********************************
function x200093_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x200093_OnItemChanged( sceneId, selfId, itemdataId )
end
