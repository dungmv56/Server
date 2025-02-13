--212119
--Long Tuy玭 曾经痴狂少年时

--把翁季之to� 鸬 忏悔信 疬a cho 金山寺to� 鸬 法念.

--MisDescBegin
--脚本号
x212119_g_ScriptId = 212119

--Ti猵 th挝馧PC属性
x212119_g_Position_X=208
x212119_g_Position_Z=62
x212119_g_SceneID=31
x212119_g_AccomplishNPC_Name="Ph醦 Ni甿"

--任务号
x212119_g_MissionId = 929

--目标NPC
x212119_g_Name	="Ph醦 Ni甿"

--任务归类
x212119_g_MissionKind = 42

--衅ng c nhi甿 v� 
x212119_g_MissionLevel = 36

--喧ng否喧ngTinh英任务
x212119_g_IfMissionElite = 0

--任务名
x212119_g_MissionName="Th秈 tu眎 tr� ng鬾g cu皀g"
x212119_g_MissionInfo="#{Mis_30_60_desc_004}"
x212119_g_MissionTarget="    Mang th� h痠 l瞚 c黙 詎g Qu� Chi 皙n Long Tuy玭 Kim S絥 T� giao cho Ph醦 Ni甿 #{_INFOAIM207,63,31, Ph醦 Ni甿}. "
x212119_g_MissionContinue="  N猽 c� th� l鄊 l読 l n鎍, ta s� ch鱪 th� n鄌 疴y ? 秀 bi猼 s� th v� h� 鋙 kh� ph鈔 bi畉, sao kh鬾g l馻 ch鱪 theo ti猲g g鱥 c黙 linh h皀"
x212119_g_MissionComplete="  Tr鋓 qua nh鎛g th錸g tr c黙 cu礳 鸲i, nh鎛g th� c鬾g danh l㱮 l礳 c� 疳ng l� g�, h銀 瓞 n� bay theo l鄋 gi�!"

x212119_g_MoneyBonus=5000
x212119_g_exp=9000

x212119_g_Custom	= { {id="秀 l 疬㧟 th� h痠 l瞚 c黙 詎g Qu� Chi",num=1} }
x212119_g_IsMissionOkFail = 0

x212119_g_MisItemId = 40004418 --翁季之to� 鸬 忏悔信

--MisDescEnd
--**********************************
--任务入口函数
--**********************************
function x212119_OnDefaultEvent( sceneId, selfId, targetId )
	--如果玩家完成过C醝 n鄖 任务
	if (IsMissionHaveDone(sceneId,selfId,x212119_g_MissionId) > 0 ) then
		return
	elseif( IsHaveMission(sceneId,selfId,x212119_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x212119_g_Name then
			--x212119_OnContinue( sceneId, selfId, targetId )
			BeginEvent(sceneId)
				AddText(sceneId,x212119_g_MissionName)
				AddText(sceneId,x212119_g_MissionContinue)
			EndEvent( )
			DispatchMissionDemandInfo(sceneId,selfId,targetId,x212119_g_ScriptId,x212119_g_MissionId,1)		
			
		end
	
	--Th鯽 m鉵任务接收条件
	elseif x212119_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x212119_g_Name then
			--发送任务Ti猵 th毕允総o� 鸬 信息
			local  PlayerName=GetName(sceneId,selfId)	
			BeginEvent(sceneId)
				AddText(sceneId,x212119_g_MissionName)
				AddText(sceneId,x212119_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}#r")
				AddText(sceneId,x212119_g_MissionTarget)
				AddText(sceneId,"#{M_SHOUHUO}#r")
				AddMoneyBonus( sceneId, x212119_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x212119_g_ScriptId,x212119_g_MissionId)
		end
	end
end

--**********************************
--列举事件
--**********************************
function x212119_OnEnumerate( sceneId, selfId, targetId )

	--如果玩家完成过C醝 n鄖 任务
	if IsMissionHaveDone(sceneId,selfId,x212119_g_MissionId) > 0 then
		return 
	--如果已接此任务
	elseif IsHaveMission(sceneId,selfId,x212119_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x212119_g_Name then
			AddNumText(sceneId, x212119_g_ScriptId,x212119_g_MissionName,2,-1);
		end
	--Th鯽 m鉵任务接收条件
	elseif x212119_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x212119_g_Name then
			AddNumText(sceneId,x212119_g_ScriptId,x212119_g_MissionName,1,-1);
		end
	end

end

--**********************************
--检测Ti猵 th跫�
--**********************************
function x212119_CheckAccept( sceneId, selfId )
	-- 1,检测玩家喧ng不喧ng已经做过
	if (IsMissionHaveDone(sceneId,selfId,x212119_g_MissionId) > 0 ) then
		return 0
	end
		
	-- 等c检测
	if GetLevel(sceneId, selfId) < x212119_g_MissionLevel then
		return 0
	end
	
	return 1
end

--**********************************
--Ti猵 th�
--**********************************
function x212119_OnAccept( sceneId, selfId, targetId )
	if x212119_CheckAccept(sceneId, selfId) < 1   then
		return 0
	end

	-- 检查玩家to� 鸬 心法喧ng不喧ng达到了要求(前六种衅ng c t鈓 ph醦 大于等于30c)
	if CallScriptFunction( 212120, "CheckAllXinfaLevel", sceneId, selfId, 35 ) == 0  then
   	BeginEvent(sceneId)
			local strText = format("Nhi甿 v� n鄖 y陁 c 6 lo読 t鈓 ph醦 皤u 鹫t c 35.")
			AddText(sceneId, strText)
	  EndEvent(sceneId)
  	DispatchMissionTips(sceneId,selfId)
		return
	end
	
	-- C 网玩家身上丢m祎 c醝物品
	BeginAddItem( sceneId )
		AddItem( sceneId, x212119_g_MisItemId, 1 )
	local ret = EndAddItem( sceneId, selfId )
	
	if ret > 0  then
		--加入任务到玩家列表
		ret = AddMission(sceneId,selfId, x212119_g_MissionId, x212119_g_ScriptId, 0, 0, 0)
		if ret <= 0 then
			local strText = format("#YDanh s醕h nhi甿 v�#W: c黙 c醕 h� 疸 馥y r癷")
			Msg2Player(sceneId, selfId, strText, MSG2PLAYER_PARA)
	   	BeginEvent(sceneId)
				AddText(sceneId, strText)
		  EndEvent(sceneId)
	  	DispatchMissionTips(sceneId,selfId)
			return
		end
		local strText = format("#Y Ti猵 nh nhi甿 v�: Th秈 thi猽 ni阯 cu皀g si")
		Msg2Player(sceneId, selfId, strText,MSG2PLAYER_PARA)
	 	BeginEvent(sceneId)
			AddText(sceneId, strText)
	  EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	
		local misIndex = GetMissionIndexByID(sceneId,selfId,x212119_g_MissionId)
		SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
		SetMissionByIndex( sceneId, selfId, misIndex, 1, 1)
		AddItemListToHuman(sceneId,selfId)
	
	else
		--提示不能接任务了
		local strText = "#Y � nhi甿 v� c黙 c醕 h� 疸 馥y."
		Msg2Player(sceneId, selfId, strText, MSG2PLAYER_PARA)
   	BeginEvent(sceneId)
			AddText(sceneId, strText)
	  EndEvent(sceneId)
  	DispatchMissionTips(sceneId,selfId)
		return
	
	end
	
end

--**********************************
--放弃
--**********************************
function x212119_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应to� 鸬 任务
  DelMission( sceneId, selfId, x212119_g_MissionId )
	DelItem( sceneId, selfId, x212119_g_MisItemId, 1 )	
end

--**********************************
--继续
--**********************************
function x212119_OnContinue( sceneId, selfId, targetId )
	--提交任务时to� 鸬 � 餴琺餍畔�
  BeginEvent(sceneId)
	AddText(sceneId,x212119_g_MissionName)
	AddText(sceneId,x212119_g_MissionComplete)
	AddMoneyBonus( sceneId, x212119_g_MoneyBonus )
  EndEvent( )
  DispatchMissionContinueInfo(sceneId,selfId,targetId,x212119_g_ScriptId,x212119_g_MissionId)
end

--**********************************
--检测喧ng否可以提交
--**********************************
function x212119_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x212119_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--提交
--**********************************
function x212119_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x212119_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		--添加任务奖励
		DelItem( sceneId, selfId, x212119_g_MisItemId, 1 )	
		AddMoney(sceneId,selfId, x212119_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId, x212119_g_exp)
		DelMission( sceneId, selfId, x212119_g_MissionId )
		MissionCom( sceneId, selfId, x212119_g_MissionId )
		Msg2Player( sceneId, selfId,"#Y Ho鄋 th鄋h nhi甿 v�: Th秈 thi猽 ni阯 cu皀g si",MSG2PLAYER_PARA )
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x212119_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--进入区域事件
--**********************************
function x212119_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x212119_OnItemChanged( sceneId, selfId, itemdataId )
end

