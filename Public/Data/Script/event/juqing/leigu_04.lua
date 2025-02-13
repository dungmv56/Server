-- 择日再战 200043

-- 副本内送信到副本外,(同m祎 c醝NPC)

--************************************************************************
--MisDescBegin
--脚本号
x200043_g_ScriptId = 200043

--任务号
x200043_g_MissionId = 36

--前续任务号
x200043_g_PreMissionId = 35

--M鴆 ti陁 nhi甿 v鳱PC属性
x200043_g_Position_X=125
x200043_g_Position_Z=144
x200043_g_SceneID=14
x200043_g_AccomplishNPC_Name="T� Tinh H�"

--目标NPC
x200043_g_Name = "T� Tinh H�"

--喧ng否喧ngTinh英任务
x200043_g_IfMissionElite = 1

--衅ng c nhi甿 v� 
x200043_g_MissionLevel = 60

--任务归类
x200043_g_MissionKind = 53

--任务文本描述
x200043_g_MissionName="Ch鱪 ng鄖 t醝 chi猲"
x200043_g_MissionInfo="#{Mis_juqing_0036}"
x200043_g_MissionTarget="#{Mis_juqing_Tar_0036}"	--M鴆 ti陁 nhi甿 v�
x200043_g_MissionComplete="  C醕 h� r痶 cu礳 疸 皙n r癷, h銀 mau 餴 chu b� 餴, tr chi猲 v緄 衖nh Xu鈔 Thu l n鄖, Hung hi琺 v� b�"	--Ho鄋 t nhi甿 v鴑pc说话to� 鸬 话

x200043_g_MoneyBonus=8100
x200043_g_exp=8000

x200043_g_Custom	= { {id="秀 t靘 疬㧟 T� Tinh H�",num=1} }

--MisDescEnd
--************************************************************************

--**********************************
--任务入口函数
--**********************************
function x200043_OnDefaultEvent( sceneId, selfId, targetId )
	--如果玩家完成过C醝 n鄖 任务
	if (IsMissionHaveDone(sceneId,selfId,x200043_g_MissionId) > 0 ) then
		return
	elseif( IsHaveMission(sceneId,selfId,x200043_g_MissionId) > 0)  then
		-- 检测喧ng不喧ngT読 副本,再检测喧ng不喧ng,如果喧ng就可以直Ho鄋 t nhi甿 v�,^_^
		local sceneType = LuaFnGetSceneType(sceneId) 
		if sceneType ~= 1 then --场景类型不喧ng副本
			-- 检测下T阯,安全 餴琺 餴琺
			if GetName(sceneId, targetId) == x200043_g_Name  then
		    BeginEvent(sceneId)
				AddText(sceneId,x200043_g_MissionName)
				AddText(sceneId,x200043_g_MissionComplete)
				AddMoneyBonus( sceneId, x200043_g_MoneyBonus )
		    EndEvent()
		    DispatchMissionContinueInfo(sceneId,selfId,targetId,x200043_g_ScriptId,x200043_g_MissionId)
			end
		end
	
	--Th鯽 m鉵任务接收条件
	elseif x200043_CheckAccept(sceneId,selfId) > 0 then
		--发送任务Ti猵 th毕允総o� 鸬 信息
		BeginEvent(sceneId)
			AddText(sceneId,x200043_g_MissionName)
			AddText(sceneId,x200043_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}#r")
			AddText(sceneId,x200043_g_MissionTarget)
			AddText(sceneId,"#{M_SHOUHUO}#r")
			AddMoneyBonus( sceneId, x200043_g_MoneyBonus )
		EndEvent()
		DispatchMissionInfo(sceneId,selfId,targetId,x200043_g_ScriptId,x200043_g_MissionId)
	end
end

--**********************************
--列举事件
--**********************************
function x200043_OnEnumerate( sceneId, selfId, targetId )
	
	--如果玩家完成过C醝 n鄖 任务
	if IsMissionHaveDone(sceneId,selfId,x200043_g_MissionId) > 0 then
		return 
	--如果已接此任务
	elseif IsHaveMission(sceneId,selfId,x200043_g_MissionId) > 0 then
		--C T読 副本才可以
		local sceneType = LuaFnGetSceneType(sceneId)
		if sceneType ~= 1 then --场景类型喧ng副本
			AddNumText(sceneId, x200043_g_ScriptId,x200043_g_MissionName,2,-1);
		end
		
	--Th鯽 m鉵任务接收条件
	elseif x200043_CheckAccept(sceneId,selfId) > 0 then	
		AddNumText(sceneId,x200043_g_ScriptId,x200043_g_MissionName,1,-1);
	end

end

--**********************************
--检测Ti猵 th跫�
--**********************************
function x200043_CheckAccept( sceneId, selfId )
	--判定条件
	--1,前续任务完成
	if IsMissionHaveDone(sceneId,selfId,x200043_g_PreMissionId) < 1 then
		return 0
	end
	if IsMissionHaveDone(sceneId,selfId,x200043_g_MissionId) > 0  then
		return 0
	end
	
	--2,等c达到60
	if GetLevel(sceneId, selfId) < 60   then
		return 0
	end

	--3,场景不喧ng副本
	local sceneType = LuaFnGetSceneType(sceneId) ;
	if sceneType == 1 then --场景类型喧ng副本
		return 1
	else 
		return 0
	end
	
	return 1
end


--**********************************
--Ti猵 th�
--**********************************
function x200043_OnAccept( sceneId, selfId, targetId )

	if x200043_CheckAccept(sceneId, selfId) < 1   then
		return 0
	end
	
	--加入任务到玩家列表
	local ret = AddMission( sceneId,selfId, x200043_g_MissionId, x200043_g_ScriptId, 0, 0, 0 )
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#YNh k� nhi甿 v� c黙 c醕 h� 疸 馥y" , MSG2PLAYER_PARA )
		return
	end

	Msg2Player(  sceneId, selfId,"#YNh nhi甿 v�#W: Ch鱪 ng鄖 t醝 chi猲",MSG2PLAYER_PARA )

	local misIndex = GetMissionIndexByID(sceneId,selfId,x200043_g_MissionId)
	SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)

end

--**********************************
--放弃
--**********************************
function x200043_OnAbandon( sceneId, selfId )
  DelMission( sceneId, selfId, x200043_g_MissionId )
end

--**********************************
--继续
--**********************************
function x200043_OnContinue( sceneId, selfId, targetId )
	
end	

--**********************************
--检测喧ng否可以提交
--**********************************
function x200043_CheckSubmit( sceneId, selfId, selectRadioId )
	
end

--**********************************
--提交
--**********************************
function x200043_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	-- 可以提交to� 鸬 条件判定
	-- 1,有C醝 n鄖 任务,
	if( IsHaveMission(sceneId,selfId,x200043_g_MissionId) > 0)  then
		AddMoney(sceneId,selfId,x200043_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId,x200043_g_exp)
		
		DelMission( sceneId,selfId,  x200043_g_MissionId )
		--设置任务已经被完成过
		MissionCom( sceneId,selfId,  x200043_g_MissionId )
		Msg2Player(  sceneId, selfId,"#YHo鄋 t nhi甿 v�#W: Ch鱪 ng鄖 t醝 chi猲",MSG2PLAYER_PARA )

		-- 调用后续任务
		CallScriptFunction((200045), "OnDefaultEvent",sceneId, selfId, targetId )
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x200043_OnKillObject( sceneId, selfId, objdataId, objId )

end

--**********************************
--进入区域事件
--**********************************
function x200043_OnEnterZone( sceneId, selfId, zoneId )
	
end

--**********************************
--道具改变
--**********************************
function x200043_OnItemChanged( sceneId, selfId, itemdataId )
	
end



