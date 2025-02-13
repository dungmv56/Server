--x212117_g_ScriptId = 212117
-- 尽 餴琺人事

-- 交5G买本书,

--MisDescBegin

--脚本号
x212117_g_ScriptId = 212117

--Ti猵 th挝馧PC属性
x212117_g_Position_X=217
x212117_g_Position_Z=255
x212117_g_SceneID=2
x212117_g_AccomplishNPC_Name="V呓ng Thi玼"

--任务号
x212117_g_MissionId = 923

--前续任务
x212117_g_PreMissionId = 922

--目标NPC
x212117_g_Name	="V呓ng Thi玼"

--任务归类
x212117_g_MissionKind = 26

--衅ng c nhi甿 v� 
x212117_g_MissionLevel = 20

--喧ng否喧ngTinh英任务
x212117_g_IfMissionElite = 0

--任务名
x212117_g_MissionName="T 餴琺 nh鈔 s�"
x212117_g_MissionInfo="#{emei_skill_mis_06}"
x212117_g_MissionTarget="  Mang n祊 #G5 v鄋g#W giao cho th鄋h 姓i L� Tu V錸 朽i#W cho #RV呓ng Thi玼 #W#{_INFOAIM217,255,2, V呓ng Thi玼}."
x212117_g_MissionContinue="  C醕 h� quy猼 鸶nh h鱟 Kim ch鈓 鸬 ki猵 sao?"
x212117_g_MissionComplete="#{emei_skill_mis_07}"

x212117_g_MoneyBonus=2000
x212117_g_exp=1000

--x212117_g_Custom	= { {id="",num=1} }
x212117_g_IsMissionOkFail = 0

--MisDescEnd
--**********************************
--任务入口函数
--**********************************
function x212117_OnDefaultEvent( sceneId, selfId, targetId )
	
	--如果玩家完成过C醝 n鄖 任务
	if (IsMissionHaveDone(sceneId,selfId,x212117_g_MissionId) > 0 ) then
		return
	elseif( IsHaveMission(sceneId,selfId,x212117_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x212117_g_Name then
			x212117_OnContinue( sceneId, selfId, targetId )
		end
	
	--Th鯽 m鉵任务接收条件
	elseif x212117_CheckAccept(sceneId,selfId) > 0 then
		--发送任务Ti猵 th毕允総o� 鸬 信息
		BeginEvent(sceneId)
			AddText(sceneId,x212117_g_MissionName)
			AddText(sceneId,x212117_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}#r")
			AddText(sceneId,x212117_g_MissionTarget)
			AddText(sceneId,"#{M_SHOUHUO}#r")
			AddMoneyBonus( sceneId, x212117_g_MoneyBonus )
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x212117_g_ScriptId,x212117_g_MissionId)
	end
end

--**********************************
--列举事件
--**********************************
function x212117_OnEnumerate( sceneId, selfId, targetId )
	--如果玩家完成过C醝 n鄖 任务
	if IsMissionHaveDone(sceneId,selfId,x212117_g_MissionId) > 0 then
		return 
	--如果已接此任务
	elseif IsHaveMission(sceneId,selfId,x212117_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x212117_g_Name then
			AddNumText(sceneId, x212117_g_ScriptId,x212117_g_MissionName,2,-1);
		end
	--Th鯽 m鉵任务接收条件
	elseif x212117_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x212117_g_ScriptId,x212117_g_MissionName,1,-1);
	end

end

--**********************************
--检测Ti猵 th跫�
--**********************************
function x212117_CheckAccept( sceneId, selfId )
	-- 1,检测玩家喧ng不喧ng已经做过
	if (IsMissionHaveDone(sceneId,selfId,x212117_g_MissionId) > 0 ) then
		return 0
	end
		
	-- 等c检测
	if GetLevel( sceneId, selfId ) < x212117_g_MissionLevel then
		return 0
	end
	
	-- 前续任务to� 鸬 完成情况
	if IsMissionHaveDone(sceneId,selfId,x212117_g_PreMissionId) < 1  then
		return 0
	end
	return 1
end

--**********************************
--Ti猵 th�
--**********************************
function x212117_OnAccept( sceneId, selfId, targetId )
	if x212117_CheckAccept(sceneId, selfId) < 1   then
		return 0
	end
	
	--加入任务到玩家列表
	local ret = AddMission( sceneId,selfId, x212117_g_MissionId, x212117_g_ScriptId, 0, 0, 0 )
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#YNh k� nhi甿 v� c黙 c醕 h� 疸 馥y" , MSG2PLAYER_PARA )
		return
	end
	Msg2Player(  sceneId, selfId,"#YNh nhi甿 v�: t 餴琺 nh鈔 s�",MSG2PLAYER_PARA )
	
	local misIndex = GetMissionIndexByID(sceneId,selfId,x212117_g_MissionId)
	SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
	SetMissionByIndex( sceneId, selfId, misIndex, 1, 1)
end

--**********************************
--放弃
--**********************************
function x212117_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应to� 鸬 任务
  DelMission( sceneId, selfId, x212117_g_MissionId )
end

--**********************************
--继续
--**********************************
function x212117_OnContinue( sceneId, selfId, targetId )
	--提交任务时to� 鸬 � 餴琺餍畔�
    BeginEvent(sceneId)
		AddText(sceneId,x212117_g_MissionName)
		AddText(sceneId,x212117_g_MissionComplete)
		AddMoneyBonus( sceneId, x212117_g_MoneyBonus )
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x212117_g_ScriptId,x212117_g_MissionId)
end

--**********************************
--检测喧ng否可以提交
--**********************************
function x212117_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x212117_g_MissionId )
	if bRet ~= 1 then
		return 0
	end
	
	if GetMoney(sceneId, selfId) < 50000   then
		return 2
	end

	return 1
end

--**********************************
--提交
--**********************************
function x212117_OnSubmit( sceneId, selfId, targetId, selectRadioId )

	if x212117_CheckSubmit( sceneId, selfId, selectRadioId ) == 2 then
    BeginEvent(sceneId)
			AddText(sceneId,"C醕 h� kh鬾g c� 瘘 ti玭 m 瓞 ho鄋 th鄋h nhi甿 v� n鄖.")
    EndEvent( )
    DispatchMissionTips(sceneId,selfId)
		return
	end
	
	if x212117_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		-- 扣除玩家5c醝G
		if CostMoney(sceneId, selfId, 50000)  == 1  then
			--添加任务奖励
			AddMoney(sceneId,selfId,x212117_g_MoneyBonus );
			LuaFnAddExp( sceneId, selfId,x212117_g_exp)
			
			-- 检测玩家喧ng不喧ng峨眉派to� 鸬 弟子
			--PrintNum(GetMenPai(sceneId, selfId))
			if GetMenPai(sceneId, selfId) == 4  then
				-- 给玩家增加423号技能
				AddSkill(sceneId, selfId, 423)
		    BeginEvent(sceneId)
					AddText(sceneId,"C醕 h� 疸 h鱟 疬㧟 k� n錸g Kim ch鈔 鸬 ki猵.")
		    EndEvent( )
		    DispatchMissionTips(sceneId,selfId)
			end
			
			DelMission( sceneId,selfId,  x212117_g_MissionId )
			--设置任务已经被完成过
			MissionCom( sceneId,selfId,  x212117_g_MissionId )
			Msg2Player(  sceneId, selfId,"#YHo鄋 th鄋h nhi甿 v�: t 餴琺 nh鈔 s�",MSG2PLAYER_PARA )
			
			-- 调用后续任务
			CallScriptFunction((200087), "OnDefaultEvent",sceneId, selfId, targetId )
		
		else
	    BeginEvent(sceneId)
				AddText(sceneId,"Kh tr� ti玭 m c� sai s髏.")
	    EndEvent( )
	    DispatchMissionTips(sceneId,selfId)
			return
		end
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x212117_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--进入区域事件
--**********************************
function x212117_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x212117_OnItemChanged( sceneId, selfId, itemdataId )
	
end


function x212117_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end


