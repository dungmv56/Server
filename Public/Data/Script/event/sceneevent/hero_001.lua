-- 212128
-- 英雄不怕远征难

--MisDescBegin
--脚本号
x212128_g_ScriptId = 212128

--Ti猵 th挝馧PC属性
x212128_g_Position_X=222
x212128_g_Position_Z=102
x212128_g_SceneID=2
x212128_g_AccomplishNPC_Name="Th Qu醫"

--任务号
x212128_g_MissionId = 250

--目标NPC
x212128_g_Name	="Th Qu醫"

--任务归类
x212128_g_MissionKind = 55

--衅ng c nhi甿 v� 
x212128_g_MissionLevel = 75

--喧ng否喧ngTinh英任务
x212128_g_IfMissionElite = 0

--任务名
x212128_g_MissionName="Anh h鵱g kh鬾g s� vi璶 chinh kh�"
x212128_g_MissionInfo="#{Mis_75_desc_001}"
x212128_g_MissionTarget="    T靘 Th Qu醫 � th鄋h 姓i L� #{_INFOAIM222,103,2, Th Qu醫}. "
--x212128_g_MissionContinue="  生命如果能够重来m祎 次,蝝祎 嵩趺囱≡衲�?既然真实和虚幻无从分辨,为何不听从心Linhto� 鸬 召唤做出抉择呢."
x212128_g_MissionComplete="  绪c 疬㧟 h猼 s醕h tr阯 thi阯 h�, 餴 h猼 5 ch鈛 4 b� l� s� theo 饀眎 c黙 鸲i ta. T� x遖 皙n nay ch� c� ng叨i tri th裞 m緄 tr� th鄋h anh h鵱g."

x212128_g_MoneyBonus=5000
x212128_g_exp=50000

x212128_g_Custom	= { {id="秀 t靘 th Th Qu醫",num=1} }
x212128_g_IsMissionOkFail = 0

--MisDescEnd
--**********************************
--任务入口函数
--**********************************
function x212128_OnDefaultEvent( sceneId, selfId, targetId )
	--如果玩家完成过C醝 n鄖 任务
	if (IsMissionHaveDone(sceneId,selfId,x212128_g_MissionId) > 0 ) then
		return
	elseif( IsHaveMission(sceneId,selfId,x212128_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x212128_g_Name then
			x212128_OnContinue( sceneId, selfId, targetId )
		end
	
	--Th鯽 m鉵任务接收条件
	elseif x212128_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x212128_g_Name then
			--发送任务Ti猵 th毕允総o� 鸬 信息
			local  PlayerName=GetName(sceneId,selfId)	
			BeginEvent(sceneId)
				AddText(sceneId,x212128_g_MissionName)
				AddText(sceneId,x212128_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}#r")
				AddText(sceneId,x212128_g_MissionTarget)
				AddText(sceneId,"#{M_SHOUHUO}#r")
				AddMoneyBonus( sceneId, x212128_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x212128_g_ScriptId,x212128_g_MissionId)
		end
	end
end

--**********************************
--列举事件
--**********************************
function x212128_OnEnumerate( sceneId, selfId, targetId )

	--如果玩家完成过C醝 n鄖 任务
	if IsMissionHaveDone(sceneId,selfId,x212128_g_MissionId) > 0 then
		return 
	--如果已接此任务
	elseif IsHaveMission(sceneId,selfId,x212128_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x212128_g_Name then
			AddNumText(sceneId, x212128_g_ScriptId,x212128_g_MissionName,2,-1);
		end
	--Th鯽 m鉵任务接收条件
	elseif x212128_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x212128_g_Name then
			AddNumText(sceneId,x212128_g_ScriptId,x212128_g_MissionName,1,-1);
		end
	end

end

--**********************************
--检测Ti猵 th跫�
--**********************************
function x212128_CheckAccept( sceneId, selfId )
	-- 1,检测玩家喧ng不喧ng已经做过
	if (IsMissionHaveDone(sceneId,selfId,x212128_g_MissionId) > 0 ) then
		return 0
	end
		
	-- 等c检测
	if GetLevel(sceneId, selfId) < 10 then
		return 0
	end
	
	return 1
end

--**********************************
--检测Ti猵 th跫�
--**********************************
function x212128_CheckAcceptEx( sceneId, selfId )
	-- 1,检测玩家喧ng不喧ng已经做过
	if (IsMissionHaveDone(sceneId,selfId,x212128_g_MissionId) > 0 ) then
		return 0
	end
		
	-- 等c检测
	if GetLevel(sceneId, selfId) < x212128_g_MissionLevel then
		return 0
	end
	
	return 1
end

--**********************************
--Ti猵 th�
--**********************************
function x212128_OnAccept( sceneId, selfId, targetId )
	if x212128_CheckAcceptEx(sceneId, selfId) < 1   then
		BeginEvent(sceneId)
			AddText( sceneId, "  Nhi甿 v� n鄖 y陁 c 鹌ng c nh鈔 v 鹫t c 75, v� 6 lo読 t鈓 ph醦 皤u 鹫t c 70 m緄 c� th� ti猵 nh." )
	  EndEvent(sceneId)
  	DispatchMissionTips(sceneId,selfId)
		return
	end

	-- 检查玩家to� 鸬 心法喧ng不喧ng达到了要求(前六种衅ng c t鈓 ph醦 大于等于30c)
	
	if CallScriptFunction( 212120, "CheckAllXinfaLevel", sceneId, selfId, 70 ) == 0  then
   	BeginEvent(sceneId)
			local strText = format("Nhi甿 v� n鄖 y陁 c 6 lo読 t鈓 ph醦 皤u 鹫t c 70.")
			AddText(sceneId, strText)
	  EndEvent(sceneId)
  	DispatchMissionTips(sceneId,selfId)
		return
	end
	
	-- C 网玩家身上丢m祎 c醝物品
	--加入任务到玩家列表
	local ret = AddMission(sceneId,selfId, x212128_g_MissionId, x212128_g_ScriptId, 0, 0, 0)
	if ret <= 0 then
		local strText = format("#YDanh s醕h nhi甿 v�#W: c黙 c醕 h� 疸 馥y r癷")
		Msg2Player(sceneId, selfId, strText, MSG2PLAYER_PARA)
   	BeginEvent(sceneId)
			AddText(sceneId, strText)
	  EndEvent(sceneId)
  	DispatchMissionTips(sceneId,selfId)
		return
	end
	local strText = format("#Y Ti猵 nh nhi甿 v�: Anh h鵱g kh鬾g ng読 gian tru鈔.")
	Msg2Player(sceneId, selfId, strText,MSG2PLAYER_PARA)
 	BeginEvent(sceneId)
		AddText(sceneId, strText)
  EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)

	local misIndex = GetMissionIndexByID(sceneId,selfId,x212128_g_MissionId)
	SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
	SetMissionByIndex( sceneId, selfId, misIndex, 1, 1)
	
end

--**********************************
--放弃
--**********************************
function x212128_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应to� 鸬 任务
  DelMission( sceneId, selfId, x212128_g_MissionId )
end

--**********************************
--继续
--**********************************
function x212128_OnContinue( sceneId, selfId, targetId )
	--提交任务时to� 鸬 � 餴琺餍畔�
  BeginEvent(sceneId)
	AddText(sceneId,x212128_g_MissionName)
	AddText(sceneId,x212128_g_MissionComplete)
	AddMoneyBonus( sceneId, x212128_g_MoneyBonus )
  EndEvent( )
  DispatchMissionContinueInfo(sceneId,selfId,targetId,x212128_g_ScriptId,x212128_g_MissionId)
end

--**********************************
--检测喧ng否可以提交
--**********************************
function x212128_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x212128_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--提交
--**********************************
function x212128_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x212128_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		--添加任务奖励
		AddMoney(sceneId,selfId, x212128_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId, x212128_g_exp)
		DelMission( sceneId, selfId, x212128_g_MissionId )
		MissionCom( sceneId, selfId, x212128_g_MissionId )
		Msg2Player( sceneId, selfId,"#Y Ho鄋 th鄋h nhi甿 v�: Anh h鵱g kh鬾g ng読 gian tru鈔",MSG2PLAYER_PARA )
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x212128_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--进入区域事件
--**********************************
function x212128_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x212128_OnItemChanged( sceneId, selfId, itemdataId )
end

