--剧情任务
--万劫谷,白天
-- 相会T読 万劫谷    从副本外头to� 鸬 段正淳处接任务,到副本里头和段正淳汇合

--************************************************************************
--MisDescBegin
--脚本号
x200002_g_ScriptId = 200002

--任务号
x200002_g_MissionId = 5

--前续任务号
x200002_g_PreMissionId = 4

--目标NPC
x200002_g_Name = "衞鄋 Ch韓h Thu"

--Ti猵 th挝馧PC属性
x200002_g_Position_X=74
x200002_g_Position_Z=50
x200002_g_SceneID=2
x200002_g_AccomplishNPC_Name="Hoa H醕h C"

--喧ng否喧ngTinh英任务
x200002_g_IfMissionElite = 1

--衅ng c nhi甿 v� 
x200002_g_MissionLevel = 20

--任务归类
x200002_g_MissionKind = 51

--任务文本描述
x200002_g_MissionName="G nhau t読 V課 Ki猵 C痗"
x200002_g_MissionInfo="#{Mis_juqing_0005}"
x200002_g_MissionTarget="#{Mis_juqing_Tar_0005}"	--M鴆 ti陁 nhi甿 v�
x200002_g_MissionComplete="  $N, c醕 h� r痶 cu礳 疸 皙n r癷, ch鷑g ta 疸 瘙i c醕 h� 疸 l鈛 r癷. "	--Ho鄋 t nhi甿 v鴑pc说话to� 鸬 话

x200002_g_MoneyBonus=1800
x200002_g_exp=1500

x200002_g_Custom	= { {id="秀 t靘 疬㧟 衞鄋 Ch韓h Thu",num=1} }

--MisDescEnd
--************************************************************************

--**********************************
--任务入口函数
--**********************************
function x200002_OnDefaultEvent( sceneId, selfId, targetId )
	--如果玩家完成过C醝 n鄖 任务
	if (IsMissionHaveDone(sceneId,selfId,x200002_g_MissionId) > 0 ) then
		return
	elseif( IsHaveMission(sceneId,selfId,x200002_g_MissionId) > 0)  then
		-- 检测喧ng不喧ngT読 副本,再检测喧ng不喧ng,如果喧ng就可以直Ho鄋 t nhi甿 v�,^_^
		local sceneType = LuaFnGetSceneType(sceneId) 
		if sceneType == 1 then --场景类型喧ng副本
			-- 检测下T阯,安全 餴琺 餴琺
			if GetName(sceneId, targetId) == x200002_g_Name  then
		    BeginEvent(sceneId)
				AddText(sceneId,x200002_g_MissionName)
				AddText(sceneId,x200002_g_MissionComplete)
				AddMoneyBonus( sceneId, x200002_g_MoneyBonus )
		    EndEvent( )
		    DispatchMissionContinueInfo(sceneId,selfId,targetId,x200002_g_ScriptId,x200002_g_MissionId)
			end
		end
	
	--Th鯽 m鉵任务接收条件
	elseif x200002_CheckAccept(sceneId,selfId) > 0 then
		--发送任务Ti猵 th毕允総o� 鸬 信息
		BeginEvent(sceneId)
			AddText(sceneId,x200002_g_MissionName)
			AddText(sceneId,x200002_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}#r")
			AddText(sceneId,x200002_g_MissionTarget)
			AddText(sceneId,"#{M_SHOUHUO}#r")
			AddMoneyBonus( sceneId, x200002_g_MoneyBonus )
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x200002_g_ScriptId,x200002_g_MissionId)
	end
end

--**********************************
--列举事件
--**********************************
function x200002_OnEnumerate( sceneId, selfId, targetId )
	
	--如果玩家完成过C醝 n鄖 任务
	if IsMissionHaveDone(sceneId,selfId,x200002_g_MissionId) > 0 then
		return 
	--如果已接此任务
	elseif IsHaveMission(sceneId,selfId,x200002_g_MissionId) > 0 then
		--C T読 副本才可以
		local sceneType = LuaFnGetSceneType(sceneId) ;
		if sceneType == 1 then --场景类型喧ng副本
			AddNumText(sceneId, x200002_g_ScriptId,x200002_g_MissionName,2,-1);
		end
		
	--Th鯽 m鉵任务接收条件
	elseif x200002_CheckAccept(sceneId,selfId) > 0 then	
		AddNumText(sceneId,x200002_g_ScriptId,x200002_g_MissionName,1,-1);
	end

end

--**********************************
--检测Ti猵 th跫�
--**********************************
function x200002_CheckAccept( sceneId, selfId )
	--判定条件
	--1,前续任务完成
	if IsMissionHaveDone(sceneId,selfId,x200002_g_PreMissionId) < 1 then
		return 0
	end
	if IsMissionHaveDone(sceneId,selfId,x200002_g_MissionId) > 0  then
		return 0
	end
	
	--2,等c达到20
	if GetLevel(sceneId, selfId) < 20   then
		return 0
	end

	--3,场景不喧ng副本
	local sceneType = LuaFnGetSceneType(sceneId) ;
	if sceneType == 1 then --场景类型喧ng副本
		return 0
	end
	
	return 1
end


--**********************************
--Ti猵 th�
--**********************************
function x200002_OnAccept( sceneId, selfId, targetId )

	if x200002_CheckAccept(sceneId, selfId) < 1   then
		return 0
	end
	
	--加入任务到玩家列表
	local ret = AddMission( sceneId,selfId, x200002_g_MissionId, x200002_g_ScriptId, 0, 0, 0 )
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#YNh k� nhi甿 v� c黙 c醕 h� 疸 馥y" , MSG2PLAYER_PARA )
		return
	end
	Msg2Player(  sceneId, selfId,"#YNh nhi甿 v�#W: G nhau t読 V課 Ki猵 C痗",MSG2PLAYER_PARA )

	local misIndex = GetMissionIndexByID(sceneId,selfId,x200002_g_MissionId)
	SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
end

--**********************************
--放弃
--**********************************
function x200002_OnAbandon( sceneId, selfId )
  DelMission( sceneId, selfId, x200002_g_MissionId )
end

--**********************************
--继续
--**********************************
function x200002_OnContinue( sceneId, selfId, targetId )
	
end	

--**********************************
--检测喧ng否可以提交
--**********************************
function x200002_CheckSubmit( sceneId, selfId, selectRadioId )
	
end

--**********************************
--提交
--**********************************
function x200002_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	-- 可以提交to� 鸬 条件判定
	-- 1,有C醝 n鄖 任务,
	if( IsHaveMission(sceneId,selfId,x200002_g_MissionId) > 0)  then
		AddMoney(sceneId,selfId,x200002_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId,x200002_g_exp)

		DelMission( sceneId, selfId,  x200002_g_MissionId )
		--设置任务已经被完成过
		MissionCom( sceneId, selfId, x200002_g_MissionId )
		Msg2Player( sceneId, selfId, "#YHo鄋 t nhi甿 v�#W: G nhau t読 V課 Ki猵 C痗",MSG2PLAYER_PARA )
		
		-- 调用后续任务
		CallScriptFunction((200006), "OnDefaultEvent",sceneId, selfId, targetId )
		
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x200002_OnKillObject( sceneId, selfId, objdataId, objId )

end

--**********************************
--进入区域事件
--**********************************
function x200002_OnEnterZone( sceneId, selfId, zoneId )
	
end

--**********************************
--道具改变
--**********************************
function x200002_OnItemChanged( sceneId, selfId, itemdataId )
	
end

