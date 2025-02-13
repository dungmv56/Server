-- 200035 四面楚歌

--耶律洪基 让玩家和 对话, T読 Ho鄋 t nhi甿 v鴗o� 鸬 时候,会有剧情(对话剧情)
--运筹帷幄  回苍茫山找耶律洪基,把耶律余睹to� 鸬 作战计划告诉他.

--************************************************************************
--MisDescBegin
--脚本号
x200035_g_ScriptId = 200035

--任务号
x200035_g_MissionId = 30

--前续任务号
x200035_g_PreMissionId = 29

--目标NPC
x200035_g_Name = "Ti陁 Phong"

--喧ng否喧ngTinh英任务
x200035_g_IfMissionElite = 1

--衅ng c nhi甿 v� 
x200035_g_MissionLevel = 50

--任务归类
x200035_g_MissionKind = 52

--任务文本描述
x200035_g_MissionName="T� Di畁 S� Ca"
x200035_g_MissionInfo="#{Mis_juqing_0030}"
x200035_g_MissionTarget="#{Mis_juqing_Tar_0030}"	--M鴆 ti陁 nhi甿 v�
x200035_g_MissionComplete="  Ra kh鰅? Kh鬾g th� n鄌! T読 h� kh鬾g 餴 疬㧟 n鎍, l鷆 t読 h� v� ngh頰 huynh k猼 b醝 kim lang, v� 疸 th� rg, c� ph鷆 c鵱g h叻ng, c� h鱝 c鵱g chia, trong l鷆 nguy c th h鱝 kh鬾g gi鷓, Ki玼 Phong t鬷 疴y nh quy猼 kh鬾g l鄊. "	--Ho鄋 t nhi甿 v鴑pc说话to� 鸬 话

x200035_g_MoneyBonus=1800
x200035_g_exp=1200

x200035_g_Custom	= { {id="秀 t靘 疬㧟 Ti陁 Phong",num=1} }
--MisDescEnd
--************************************************************************

--**********************************
--任务入口函数
--**********************************
function x200035_OnDefaultEvent( sceneId, selfId, targetId )
	--如果玩家完成过C醝 n鄖 任务
	if (IsMissionHaveDone(sceneId,selfId,x200035_g_MissionId) > 0 ) then
		return
	elseif( IsHaveMission(sceneId,selfId,x200035_g_MissionId) > 0)  then
		-- 检测喧ng不喧ngT読 副本,再检测喧ng不喧ng,如果喧ng就可以直Ho鄋 t nhi甿 v�,^_^
		local sceneType = LuaFnGetSceneType(sceneId) 
		if sceneType == 1 then --场景类型喧ng副本
			-- 检测下T阯,安全 餴琺 餴琺
			if GetName(sceneId, targetId) == x200035_g_Name  then
		    BeginEvent(sceneId)
				AddText(sceneId,x200035_g_MissionName)
				AddText(sceneId,x200035_g_MissionComplete)
				AddMoneyBonus( sceneId, x200035_g_MoneyBonus )
		    EndEvent( )
		    DispatchMissionContinueInfo(sceneId,selfId,targetId,x200035_g_ScriptId,x200035_g_MissionId)
			end
		end
	
	--Th鯽 m鉵任务接收条件
	elseif x200035_CheckAccept(sceneId, selfId, targetId) > 0 then
		--发送任务Ti猵 th毕允総o� 鸬 信息
		BeginEvent(sceneId)
		AddText(sceneId,x200035_g_MissionName)
		AddText(sceneId,x200035_g_MissionInfo)
		AddText(sceneId,"#{M_MUBIAO}#r")
		AddText(sceneId,x200035_g_MissionTarget)
		AddText(sceneId,"#{M_SHOUHUO}#r")
		AddMoneyBonus( sceneId, x200035_g_MoneyBonus )
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x200035_g_ScriptId,x200035_g_MissionId)
	end
end

--**********************************
--列举事件
--**********************************
function x200035_OnEnumerate( sceneId, selfId, targetId )

	--如果玩家完成过C醝 n鄖 任务
	if IsMissionHaveDone(sceneId,selfId,x200035_g_MissionId) > 0 then
		return 
	--如果已接此任务
	elseif IsHaveMission(sceneId,selfId,x200035_g_MissionId) > 0 then
		--C T読 副本才可以
		if GetName(sceneId, targetId) == x200035_g_Name    then
			AddNumText(sceneId, x200035_g_ScriptId,x200035_g_MissionName,2,-1);
		end
		
	--Th鯽 m鉵任务接收条件
	elseif x200035_CheckAccept(sceneId,selfId,targetId) > 0 then	
		AddNumText(sceneId,x200035_g_ScriptId,x200035_g_MissionName,1,-1);
	end

end

--**********************************
--检测Ti猵 th跫�
--**********************************
function x200035_CheckAccept( sceneId, selfId, targetId )
	--判定条件
	--1,前续任务完成
	if IsMissionHaveDone(sceneId,selfId,x200035_g_PreMissionId) < 1 then
		return 0
	end
	if IsMissionHaveDone(sceneId,selfId,x200035_g_MissionId) > 0  then
		return 0
	end
	
	--2,等c达到50
	if GetLevel(sceneId, selfId) < x200035_g_MissionLevel   then
		return 0
	end
	
	--检测喧ng不喧ng皇帝
	if GetName(sceneId, targetId) ~= "Gia Lu H皀g C� "    then
		return 0
	end
	
	return 1
end


--**********************************
--Ti猵 th�
--**********************************
function x200035_OnAccept( sceneId, selfId, targetId )

	if x200035_CheckAccept(sceneId, selfId, targetId) ~= 1   then
		return 0
	end
	
	--加入任务到玩家列表
	local ret = AddMission( sceneId,selfId, x200035_g_MissionId, x200035_g_ScriptId, 0, 0, 0 )
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#YNh k� nhi甿 v� c黙 c醕 h� 疸 馥y" , MSG2PLAYER_PARA )
		return
	end
	Msg2Player(  sceneId, selfId,"#YNh nhi甿 v�#W: T� Di畁 S� Ca",MSG2PLAYER_PARA )

	-- 这里有喊话to� 鸬 剧情,C 添加
	local misIndex = GetMissionIndexByID(sceneId,selfId,x200035_g_MissionId)
	SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)

end

--**********************************
--放弃
--**********************************
function x200035_OnAbandon( sceneId, selfId )
  DelMission( sceneId, selfId, x200035_g_MissionId )
end

--**********************************
--继续
--**********************************
function x200035_OnContinue( sceneId, selfId, targetId )
	
end	

--**********************************
--检测喧ng否可以提交
--**********************************
function x200035_CheckSubmit( sceneId, selfId, selectRadioId )
	
end

--**********************************
--提交
--**********************************
function x200035_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	-- 可以提交to� 鸬 条件判定
	-- 1,有C醝 n鄖 任务,
	if( IsHaveMission(sceneId,selfId,x200035_g_MissionId) > 0)  then
		AddMoney(sceneId,selfId,x200035_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId,x200035_g_exp)
		DelMission( sceneId,selfId,  x200035_g_MissionId )
		--设置任务已经被完成过
		MissionCom( sceneId,selfId,  x200035_g_MissionId )
		Msg2Player(  sceneId, selfId,"#YHo鄋 t nhi甿 v�#W: T� Di畁 S� Ca",MSG2PLAYER_PARA )
		
		-- 第m祎 段剧情,楚王喊话后,按照路线走.
		if LuaFnGetCopySceneData_Param(sceneId, 8) < 1  then
			LuaFnSetCopySceneData_Param(sceneId, 8, 1)
			LuaFnSetCopySceneData_Param(sceneId, 10, 1)
		end
		
	end
end

--**********************************
--定时事件
--**********************************
function x200035_OnTimer(sceneId,selfId)

end

--**********************************
--杀死怪物或玩家
--**********************************
function x200035_OnKillObject( sceneId, selfId, objdataId, objId )

end

--**********************************
--进入区域事件
--**********************************
function x200035_OnEnterZone( sceneId, selfId, zoneId )
	
end

--**********************************
--道具改变
--**********************************
function x200035_OnItemChanged( sceneId, selfId, itemdataId )
	
end

