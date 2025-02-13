--Nh課 Nam 私通Linh国
--212120

--MisDescBegin
--脚本号
x212120_g_ScriptId = 212120

--Ti猵 th挝馧PC属性
x212120_g_Position_X=129
x212120_g_Position_Z=50
x212120_g_SceneID=18
x212120_g_AccomplishNPC_Name="Gia Lu M誧 Ca"

--任务号
x212120_g_MissionId = 926

--目标NPC
x212120_g_Name	="Gia Lu M誧 Ca"

--任务归类
x212120_g_MissionKind = 29

--衅ng c nhi甿 v� 
x212120_g_MissionLevel = 31

--喧ng否喧ngTinh英任务
x212120_g_IfMissionElite = 0

--任务名
x212120_g_MissionName="T� th鬾g Li陁 Qu痗"
x212120_g_MissionInfo="#{Mis_30_60_desc_001}"
x212120_g_MissionTarget="    Mang m h鄊 c黙 M� Th譨 S鋘h 疬a cho Gia Lu M誧 Ca � Nhan Nam #{_INFOAIM128,50,18, Gia Lu M誧 Ca}. "
x212120_g_MissionContinue="  Ta nghe n骾 quan vi阯 c黙 姓i T痭g r tham lam, kh鬾g bi猼 c� th hay kh鬾g ?"
x212120_g_MissionComplete="  锈y l� l� th� M� Th譨 S鋘h 疬a cho ta � ? Mau mang cho ta xem., �... ... � th� ra l� v, v l� qu� t痶 r癷. 姓i T痭g c� quan vi阯 nh� th� d� c� th阭 bao nhi陁 t呔ng s� 姓i T痭g d鹡g c鋗 chi猲 黏u c鹡g kh鬾g 疳ng s�. Haha 瘊ng l� tr秈 gi鷓 n呔c 姓i Li陁 ta! #R<Gia Lu M誧 Ca l� ra v� 稹c � tr阯 khu鬾 m.>"

x212120_g_MoneyBonus=6000
x212120_g_exp=7000

x212120_g_Custom	= { {id="秀 l 疬㧟 m h鄊 c黙 M� Th譨 S鋘h",num=1} }
x212120_g_IsMissionOkFail = 0

x212120_g_MisItemId = 40004416 --马承倩密函

--MisDescEnd
--**********************************
--任务入口函数
--**********************************
function x212120_OnDefaultEvent( sceneId, selfId, targetId )
	--如果玩家完成过C醝 n鄖 任务
	if (IsMissionHaveDone(sceneId,selfId,x212120_g_MissionId) > 0 ) then
		return
	elseif( IsHaveMission(sceneId,selfId,x212120_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x212120_g_Name then
			--x212120_OnContinue( sceneId, selfId, targetId )
			BeginEvent(sceneId)
				AddText(sceneId,x212120_g_MissionName)
				AddText(sceneId,x212120_g_MissionContinue)
			EndEvent( )
			DispatchMissionDemandInfo(sceneId,selfId,targetId,x212120_g_ScriptId,x212120_g_MissionId,1)		
		end
	
	--Th鯽 m鉵任务接收条件
	elseif x212120_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x212120_g_Name then
			--发送任务Ti猵 th毕允総o� 鸬 信息
			BeginEvent(sceneId)
				AddText(sceneId,x212120_g_MissionName)
				AddText(sceneId,x212120_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}#r")
				AddText(sceneId,x212120_g_MissionTarget)
				AddText(sceneId,"#{M_SHOUHUO}#r")
				AddMoneyBonus( sceneId, x212120_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x212120_g_ScriptId,x212120_g_MissionId)
		end
	end
end

--**********************************
--列举事件
--**********************************
function x212120_OnEnumerate( sceneId, selfId, targetId )

	--如果玩家完成过C醝 n鄖 任务
	if IsMissionHaveDone(sceneId,selfId,x212120_g_MissionId) > 0 then
		return 
	--如果已接此任务
	elseif IsHaveMission(sceneId,selfId,x212120_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x212120_g_Name then
			AddNumText(sceneId, x212120_g_ScriptId,x212120_g_MissionName,2,-1);
		end
	--Th鯽 m鉵任务接收条件
	elseif x212120_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x212120_g_Name then
			AddNumText(sceneId,x212120_g_ScriptId,x212120_g_MissionName,1,-1);
		end
	end

end

--**********************************
--检测Ti猵 th跫�
--**********************************
function x212120_CheckAccept( sceneId, selfId )
	-- 1,检测玩家喧ng不喧ng已经做过
	if (IsMissionHaveDone(sceneId,selfId,x212120_g_MissionId) > 0 ) then
		return 0
	end
		
	-- 等c检测
	if GetLevel(sceneId, selfId) < x212120_g_MissionLevel then
		return 0
	end
	
	return 1
end

--**********************************
--Ti猵 th�
--**********************************
function x212120_OnAccept( sceneId, selfId, targetId )
	if x212120_CheckAccept(sceneId, selfId) < 1   then
		return 0
	end

	-- 检查玩家to� 鸬 心法喧ng不喧ng达到了要求(前六种衅ng c t鈓 ph醦 大于等于30c)
	if x212120_CheckAllXinfaLevel(sceneId, selfId, 30) == 0  then
   	BeginEvent(sceneId)
			local strText = format("T鈓 ph醦 c黙 c醕 h� 皤u ph鋓 鹫t 皙n 30 nm緄 c� th� ti猵 nh nhi甿 v� n鄖.")
			AddText(sceneId, strText)
	  EndEvent(sceneId)
  	DispatchMissionTips(sceneId,selfId)
		return
	end

	-- C 给玩家身上丢m祎 c醝物品
	BeginAddItem( sceneId )
		AddItem( sceneId, x212120_g_MisItemId, 1 )
	local ret = EndAddItem( sceneId, selfId )

	if ret <= 0  then
		--提示不能接任务了
		local strText = "Y� nhi甿 v� c黙 c醕 h� 疸 馥y."
		Msg2Player(sceneId, selfId, strText, MSG2PLAYER_PARA)
   	BeginEvent(sceneId)
			AddText(sceneId, strText)
	  EndEvent(sceneId)
  	DispatchMissionTips(sceneId,selfId)
		return
		
	else
		--加入任务到玩家列表
		ret = AddMission(sceneId,selfId, x212120_g_MissionId, x212120_g_ScriptId, 0, 0, 0)
		if ret <= 0 then
			local strText = "#YDanh s醕h nhi甿 v�#W: c黙 c醕 h� 疸 馥y r癷"
			Msg2Player(sceneId, selfId, strText, MSG2PLAYER_PARA)
	   	BeginEvent(sceneId)
				AddText(sceneId, strText)
		  EndEvent(sceneId)
	  	DispatchMissionTips(sceneId,selfId)
			return
		end
		local strText = "#Y Ti猵 nh nhi甿 v�: T� Th鬾g Li陁 Qu痗."
		Msg2Player(sceneId, selfId, strText, MSG2PLAYER_PARA)
   	BeginEvent(sceneId)
			AddText(sceneId, strText)
	  EndEvent(sceneId)
  	DispatchMissionTips(sceneId,selfId)
	
		local misIndex = GetMissionIndexByID(sceneId,selfId,x212120_g_MissionId)
		SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
		SetMissionByIndex( sceneId, selfId, misIndex, 1, 1)
		AddItemListToHuman(sceneId,selfId)
	end

end

--**********************************
--放弃
--**********************************
function x212120_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应to� 鸬 任务
  DelMission( sceneId, selfId, x212120_g_MissionId )
	DelItem( sceneId, selfId, x212120_g_MisItemId, 1 )	
end

--**********************************
--继续
--**********************************
function x212120_OnContinue( sceneId, selfId, targetId )
	--提交任务时to� 鸬 � 餴琺餍畔�
  BeginEvent(sceneId)
		AddText(sceneId,x212120_g_MissionName)
		AddText(sceneId,x212120_g_MissionComplete)
		AddMoneyBonus( sceneId, x212120_g_MoneyBonus )
  EndEvent()
  DispatchMissionContinueInfo(sceneId,selfId,targetId,x212120_g_ScriptId,x212120_g_MissionId)
end

--**********************************
--检测喧ng否可以提交
--**********************************
function x212120_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x212120_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--提交
--**********************************
function x212120_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x212120_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		-- 删除任务道具
		DelItem( sceneId, selfId, x212120_g_MisItemId, 1 )	
		--添加任务奖励
		AddMoney(sceneId,selfId, x212120_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId, x212120_g_exp)
		DelMission( sceneId, selfId, x212120_g_MissionId )
		MissionCom( sceneId, selfId, x212120_g_MissionId )
		Msg2Player( sceneId, selfId,"#Y Ho鄋 thanh nhi甿 v�: T� Th鬾g Li陁 Qu痗",MSG2PLAYER_PARA )
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x212120_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--进入区域事件
--**********************************
function x212120_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x212120_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--检测心法喧ng不够接任务
--**********************************
function x212120_CheckAllXinfaLevel(sceneId, selfId, level)
	local nMenpai = GetMenPai(sceneId, selfId)
	if nMenpai<0 or nMenpai>8   then
		return 0
	end
	
	for i=1, 6 do
		local nXinfaLevel = LuaFnGetXinFaLevel(sceneId, selfId, nMenpai*6 + i)
		if nXinfaLevel < level    then
			return 0
		end
	end
	return 1
end
