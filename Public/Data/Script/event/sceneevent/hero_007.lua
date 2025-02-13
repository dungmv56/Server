-- 212134
-- 盖世英雄

-- 直接接任务,Ho鄋 t nhi甿 v�

--MisDescBegin
--脚本号
x212134_g_ScriptId = 212134

--Ti猵 th挝馧PC属性
x212134_g_Position_X=160
x212134_g_Position_Z=127
x212134_g_SceneID=2
x212134_g_AccomplishNPC_Name="L� C鬾g B�"

--任务号
x212134_g_MissionId = 256
--前续任务号
x212134_g_PreMissionId_1 = 253
x212134_g_PreMissionId_2 = 254
x212134_g_PreMissionId_3 = 255

--目标NPC
x212134_g_Name	="L� C鬾g B�"

--任务归类
x212134_g_MissionKind = 55

--衅ng c nhi甿 v� 
x212134_g_MissionLevel = 75

--喧ng否喧ngTinh英任务
x212134_g_IfMissionElite = 0

--任务名
x212134_g_MissionName="C醝 th� anh h鵱g"
x212134_g_MissionInfo="#{Mis_Hero_end}"
x212134_g_MissionTarget="    T靘 L� C鬾g B� � th鄋h 姓i L� #{_INFOAIM160,128,2, L� C鬾g B祡. "
x212134_g_MissionComplete="  A, ng叨i thanh ni阯, c醕 h� qu� nhi阯 kh鬾g ph� k� v鱪g cua ta. C醕 h� 疸 s� d鵱g l騨g d鹡g c鋗 v� th鬾g minh t鄆 tr� c黙 m靚h tr鋓 qua bi猼 bao ch 疬秐g, quen bi猼 bao nhi陁 ng叨i, tr� h読 v� s� l� y陁 qu醝. Danh hi畊 anh h鵱g c醝 th� ta tg cho ng叨i c鹡g kh鬾g ti猚 ch鷗 n鄌! "

x212134_g_MoneyBonus=500000
x212134_g_exp=700000

x212134_g_Custom	= { {id="秀 t靘 疬㧟 L� C鬾g B�",num=1} }
x212134_g_IsMissionOkFail = 0

x212134_g_RadioItemBonus={{id=10553037 ,num=1},{id=10514077,num=1},{id=10521057,num=1}}


--MisDescEnd
--**********************************
--任务入口函数
--**********************************
function x212134_OnDefaultEvent( sceneId, selfId, targetId )
	--如果玩家完成过C醝 n鄖 任务
	if (IsMissionHaveDone(sceneId,selfId,x212134_g_MissionId) > 0 ) then
		return
	
	elseif( IsHaveMission(sceneId,selfId,x212134_g_MissionId) > 0)  then
		x212134_OnContinue( sceneId, selfId, targetId )
	
	--Th鯽 m鉵任务接收条件
	elseif x212134_CheckAccept(sceneId,selfId) > 0 then
			--发送任务Ti猵 th毕允総o� 鸬 信息
		BeginEvent(sceneId)
			AddText(sceneId,x212134_g_MissionName)
			AddText(sceneId,x212134_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}#r")
			AddText(sceneId,x212134_g_MissionTarget)
			AddText(sceneId,"#{M_SHOUHUO}#r")
			for i, item in x212134_g_RadioItemBonus do
				AddRadioItemBonus( sceneId, item.id, item.num )
			end
			AddMoneyBonus( sceneId, x212134_g_MoneyBonus )
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x212134_g_ScriptId,x212134_g_MissionId)
	end
end

--**********************************
--列举事件
--**********************************
function x212134_OnEnumerate( sceneId, selfId, targetId )

	--如果玩家完成过C醝 n鄖 任务
	if IsMissionHaveDone(sceneId,selfId,x212134_g_MissionId) > 0 then
		return 
	--如果已接此任务
	elseif IsHaveMission(sceneId,selfId,x212134_g_MissionId) > 0 then
		AddNumText(sceneId, x212134_g_ScriptId,x212134_g_MissionName,2,-1);

	--Th鯽 m鉵任务接收条件
	elseif x212134_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x212134_g_ScriptId,x212134_g_MissionName,1,-1);
	end

end

--**********************************
--检测Ti猵 th跫�
--**********************************
function x212134_CheckAccept( sceneId, selfId )
	-- 1,检测玩家喧ng不喧ng已经做过
	if (IsMissionHaveDone(sceneId,selfId,x212134_g_MissionId) > 0 ) then
		return 0
	end

	-- 等c检测
	if GetLevel(sceneId, selfId) < x212134_g_MissionLevel then
		return 0
	end	
	
	--检测前续任务
	if IsMissionHaveDone(sceneId, selfId, x212134_g_PreMissionId_1 ) < 1   then
		return 0
	end
	--检测前续任务
	if IsMissionHaveDone(sceneId, selfId, x212134_g_PreMissionId_2 ) < 1   then
		return 0
	end
	--检测前续任务
	if IsMissionHaveDone(sceneId, selfId, x212134_g_PreMissionId_3 ) < 1   then
		return 0
	end

	return 1
end

--**********************************
--Ti猵 th�
--**********************************
function x212134_OnAccept( sceneId, selfId, targetId )
	if x212134_CheckAccept(sceneId, selfId) < 1   then
		return 0
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
	
	--加入任务到玩家列表
	local ret = AddMission(sceneId,selfId, x212134_g_MissionId, x212134_g_ScriptId, 0, 0, 0)
	if ret <= 0 then
		local strText = format("#YDanh s醕h nhi甿 v�#W: c黙 c醕 h� 疸 馥y r癷")
		Msg2Player(sceneId, selfId, strText, MSG2PLAYER_PARA)
   	BeginEvent(sceneId)
			AddText(sceneId, strText)
	  EndEvent(sceneId)
  	DispatchMissionTips(sceneId,selfId)
		return
	end
	local strText = format("#Y Ti猵 nh nhi甿 v�: Anh h鵱g c醝 th�")
	Msg2Player(sceneId, selfId, strText,MSG2PLAYER_PARA)
 	BeginEvent(sceneId)
		AddText(sceneId, strText)
  EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)

	local misIndex = GetMissionIndexByID(sceneId,selfId,x212134_g_MissionId)
	SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
	SetMissionByIndex( sceneId, selfId, misIndex, 1, 1)
	
end

--**********************************
--放弃
--**********************************
function x212134_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应to� 鸬 任务
  DelMission( sceneId, selfId, x212134_g_MissionId )
end

--**********************************
--继续
--**********************************
function x212134_OnContinue( sceneId, selfId, targetId )
	--提交任务时to� 鸬 � 餴琺餍畔�
  BeginEvent(sceneId)
		AddText(sceneId,x212134_g_MissionName)
		AddText(sceneId,x212134_g_MissionComplete)
		AddMoneyBonus( sceneId, x212134_g_MoneyBonus )
		for i, item in x212134_g_RadioItemBonus do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
  EndEvent( )
  DispatchMissionContinueInfo(sceneId,selfId,targetId,x212134_g_ScriptId,x212134_g_MissionId)
end

--**********************************
--检测喧ng否可以提交
--**********************************
function x212134_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x212134_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--提交
--**********************************
function x212134_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x212134_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		
		--添加任务奖励
		BeginAddItem(sceneId)
		for i, item in x212134_g_RadioItemBonus do
			if item.id == selectRadioId then
				AddItem( sceneId,item.id, item.num )
			end
		end
		ret = EndAddItem(sceneId,selfId)
		
		if ret < 1 then
			--任务奖励没有加成功
			BeginEvent(sceneId)
				strText = "Kh鬾g th� Ho鄋 t nhi甿 v�"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return
		end
		AddItemListToHuman(sceneId,selfId)
		
		AddMoney(sceneId,selfId, x212134_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId, x212134_g_exp)
		DelMission( sceneId, selfId, x212134_g_MissionId )
		MissionCom( sceneId, selfId, x212134_g_MissionId )
		Msg2Player( sceneId, selfId,"#Y Ho鄋 th鄋h nhi甿 v�: Anh h鵱g c醝 th�",MSG2PLAYER_PARA )

		-- 给玩家添加称号
		LuaFnAwardTitle( sceneId, selfId,  12, 236)
		SetCurTitle(sceneId, selfId,  12, 236)
		LuaFnDispatchAllTitle(sceneId, selfId)
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x212134_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--进入区域事件
--**********************************
function x212134_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x212134_OnItemChanged( sceneId, selfId, itemdataId )
end


