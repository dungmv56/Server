-- 212130
-- 天下英雄谁敌手

--MisDescBegin
--脚本号
x212130_g_ScriptId = 212130

--Ti猵 th挝馧PC属性
x212130_g_Position_X=267
x212130_g_Position_Z=116
x212130_g_SceneID=1
x212130_g_AccomplishNPC_Name="V呓ng An Th誧h"

--任务号
x212130_g_MissionId = 252

--目标NPC
x212130_g_Name	="V呓ng An Th誧h"

--任务归类
x212130_g_MissionKind = 55

--衅ng c nhi甿 v� 
x212130_g_MissionLevel = 75

--喧ng否喧ngTinh英任务
x212130_g_IfMissionElite = 0

--任务名
x212130_g_MissionName="Thi阯 h� anh h鵱g ai 鸶ch th�"
x212130_g_MissionInfo="#{Mis_75_desc_003}"
x212130_g_MissionTarget="    T靘 V呓ng An Th誧h � th鄋h T� Ch鈛 #{_INFOAIM267,116,1, V呓ng An Th誧h}. "
--x212130_g_MissionContinue="  生命如果能够重来m祎 次,蝝祎 嵩趺囱≡衲�?既然真实和虚幻无从分辨,为何不听从心Linhto� 鸬 召唤做出抉择呢."
x212130_g_MissionComplete="  D鈔 gi鄒 n呔c m課h, b醕h t韓h an c� l誧 nghi畃 l� t鈓 nguy畁 c� 鸲i ta, so v緄 餴玼 n鄖 th� s� vinh hoa c黙 b鋘 th鈔 c� 疳ng l� g� ch�!"

x212130_g_MoneyBonus=5000
x212130_g_exp=50000

x212130_g_Custom	= { {id="秀 t靘 th V呓ng An Th誧h",num=1} }
x212130_g_IsMissionOkFail = 0


--MisDescEnd
--**********************************
--任务入口函数
--**********************************
function x212130_OnDefaultEvent( sceneId, selfId, targetId )
	--如果玩家完成过C醝 n鄖 任务
	if (IsMissionHaveDone(sceneId,selfId,x212130_g_MissionId) > 0 ) then
		return
	elseif( IsHaveMission(sceneId,selfId,x212130_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x212130_g_Name then
			x212130_OnContinue( sceneId, selfId, targetId )
		end
	
	--Th鯽 m鉵任务接收条件
	elseif x212130_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x212130_g_Name then
			--发送任务Ti猵 th毕允総o� 鸬 信息
			local  PlayerName=GetName(sceneId,selfId)	
			BeginEvent(sceneId)
				AddText(sceneId,x212130_g_MissionName)
				AddText(sceneId,x212130_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}#r")
				AddText(sceneId,x212130_g_MissionTarget)
				AddText(sceneId,"#{M_SHOUHUO}#r")
				AddMoneyBonus( sceneId, x212130_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x212130_g_ScriptId,x212130_g_MissionId)
		end
	end
end

--**********************************
--列举事件
--**********************************
function x212130_OnEnumerate( sceneId, selfId, targetId )

	--如果玩家完成过C醝 n鄖 任务
	if IsMissionHaveDone(sceneId,selfId,x212130_g_MissionId) > 0 then
		return 
	--如果已接此任务
	elseif IsHaveMission(sceneId,selfId,x212130_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x212130_g_Name then
			AddNumText(sceneId, x212130_g_ScriptId,x212130_g_MissionName,2,-1);
		end
	--Th鯽 m鉵任务接收条件
	elseif x212130_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x212130_g_Name then
			AddNumText(sceneId,x212130_g_ScriptId,x212130_g_MissionName,1,-1);
		end
	end

end

--**********************************
--检测Ti猵 th跫�
--**********************************
function x212130_CheckAccept( sceneId, selfId )
	-- 1,检测玩家喧ng不喧ng已经做过
	if (IsMissionHaveDone(sceneId,selfId,x212130_g_MissionId) > 0 ) then
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
function x212130_CheckAcceptEx( sceneId, selfId )
	-- 1,检测玩家喧ng不喧ng已经做过
	if (IsMissionHaveDone(sceneId,selfId,x212130_g_MissionId) > 0 ) then
		return 0
	end
		
	-- 等c检测
	if GetLevel(sceneId, selfId) < x212130_g_MissionLevel then
		return 0
	end
	return 1
end


--**********************************
--Ti猵 th�
--**********************************
function x212130_OnAccept( sceneId, selfId, targetId )
--PrintNum(1)
	if x212130_CheckAcceptEx(sceneId, selfId) < 1   then
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
	local ret = AddMission(sceneId,selfId, x212130_g_MissionId, x212130_g_ScriptId, 0, 0, 0)
	if ret <= 0 then
		local strText = format("#YDanh s醕h nhi甿 v�#W: c黙 c醕 h� 疸 馥y r癷")
		Msg2Player(sceneId, selfId, strText, MSG2PLAYER_PARA)
   	BeginEvent(sceneId)
			AddText(sceneId, strText)
	  EndEvent(sceneId)
  	DispatchMissionTips(sceneId,selfId)
		return
	end
	local strText = format("#Y Ti猵 nh nhi甿 v�: Anh h鵱g thi阯 h� ai l� 鸶ch th�.")
	Msg2Player(sceneId, selfId, strText,MSG2PLAYER_PARA)
 	BeginEvent(sceneId)
		AddText(sceneId, strText)
  EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)

	local misIndex = GetMissionIndexByID(sceneId,selfId,x212130_g_MissionId)
	SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
	SetMissionByIndex( sceneId, selfId, misIndex, 1, 1)
	
end

--**********************************
--放弃
--**********************************
function x212130_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应to� 鸬 任务
  DelMission( sceneId, selfId, x212130_g_MissionId )
end

--**********************************
--继续
--**********************************
function x212130_OnContinue( sceneId, selfId, targetId )
	--提交任务时to� 鸬 � 餴琺餍畔�
  BeginEvent(sceneId)
	AddText(sceneId,x212130_g_MissionName)
	AddText(sceneId,x212130_g_MissionComplete)
	AddMoneyBonus( sceneId, x212130_g_MoneyBonus )
  EndEvent( )
  DispatchMissionContinueInfo(sceneId,selfId,targetId,x212130_g_ScriptId,x212130_g_MissionId)
end

--**********************************
--检测喧ng否可以提交
--**********************************
function x212130_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x212130_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--提交
--**********************************
function x212130_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x212130_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		--添加任务奖励
		AddMoney(sceneId,selfId, x212130_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId, x212130_g_exp)
		DelMission( sceneId, selfId, x212130_g_MissionId )
		MissionCom( sceneId, selfId, x212130_g_MissionId )
		Msg2Player( sceneId, selfId,"#Y Ho鄋 th鄋h nhi甿 v�: Anh h鵱g thi阯 h� ai l� 鸶ch th�",MSG2PLAYER_PARA )
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x212130_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--进入区域事件
--**********************************
function x212130_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x212130_OnItemChanged( sceneId, selfId, itemdataId )
end

