-- 212133
-- 无敌侠客

-- 直接接任务,Ho鄋 t nhi甿 v�

--MisDescBegin
--脚本号
x212133_g_ScriptId = 212133

--Ti猵 th挝馧PC属性
x212133_g_Position_X=267
x212133_g_Position_Z=116
x212133_g_SceneID=1
x212133_g_AccomplishNPC_Name="V呓ng An Th誧h"

--任务号
x212133_g_MissionId = 255
--前续任务号
x212133_g_PreMissionId = 389

--目标NPC
x212133_g_Name	="V呓ng An Th誧h"

--任务归类
x212133_g_MissionKind = 55

--衅ng c nhi甿 v� 
x212133_g_MissionLevel = 75

--喧ng否喧ngTinh英任务
x212133_g_IfMissionElite = 0

--任务名
x212133_g_MissionName="V� 鸶ch hi畃 kh醕h"
x212133_g_MissionInfo="#{Mis_Hero_songxin_03}"
x212133_g_MissionTarget="    T靘 V呓ng An Th誧h � th鄋h T� Ch鈛 #{_INFOAIM267,116,1, V呓ng An Th誧h}. "
x212133_g_MissionComplete="  V� c鬾g v� danh v鱪g c黙 c醕 h� 皤u 疸 鸬c b� giang h�, c醕h danh hi畊 anh h鵱g kh鬾g c騨 bao xa."

x212133_g_MoneyBonus=50000
x212133_g_exp=700000

x212133_g_Custom	= { {id="秀 t靘 th V呓ng An Th誧h",num=1} }
x212133_g_IsMissionOkFail = 0

x212133_g_RadioItemBonus={{id=10520087 ,num=1},{id=10522067,num=1}}


--MisDescEnd
--**********************************
--任务入口函数
--**********************************
function x212133_OnDefaultEvent( sceneId, selfId, targetId )
	--如果玩家完成过C醝 n鄖 任务
	if (IsMissionHaveDone(sceneId,selfId,x212133_g_MissionId) > 0 ) then
		return
	
	elseif( IsHaveMission(sceneId,selfId,x212133_g_MissionId) > 0)  then
		x212133_OnContinue( sceneId, selfId, targetId )
	
	--Th鯽 m鉵任务接收条件
	elseif x212133_CheckAccept(sceneId,selfId) > 0 then
			--发送任务Ti猵 th毕允総o� 鸬 信息
		BeginEvent(sceneId)
			AddText(sceneId,x212133_g_MissionName)
			AddText(sceneId,x212133_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}#r")
			AddText(sceneId,x212133_g_MissionTarget)
			AddText(sceneId,"#{M_SHOUHUO}#r")
			for i, item in x212133_g_RadioItemBonus do
				AddRadioItemBonus( sceneId, item.id, item.num )
			end
			AddMoneyBonus( sceneId, x212133_g_MoneyBonus )
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x212133_g_ScriptId,x212133_g_MissionId)
	end
end

--**********************************
--列举事件
--**********************************
function x212133_OnEnumerate( sceneId, selfId, targetId )

	--如果玩家完成过C醝 n鄖 任务
	if IsMissionHaveDone(sceneId,selfId,x212133_g_MissionId) > 0 then
		return 
	--如果已接此任务
	elseif IsHaveMission(sceneId,selfId,x212133_g_MissionId) > 0 then
		AddNumText(sceneId, x212133_g_ScriptId,x212133_g_MissionName,2,-1);

	--Th鯽 m鉵任务接收条件
	elseif x212133_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x212133_g_ScriptId,x212133_g_MissionName,1,-1);
	end

end

--**********************************
--检测Ti猵 th跫�
--**********************************
function x212133_CheckAccept( sceneId, selfId )
	-- 1,检测玩家喧ng不喧ng已经做过
	if (IsMissionHaveDone(sceneId,selfId,x212133_g_MissionId) > 0 ) then
		return 0
	end

	-- 等c检测
	if GetLevel(sceneId, selfId) < x212133_g_MissionLevel then
		return 0
	end	
	
	--检测前续任务
	if IsMissionHaveDone(sceneId, selfId, x212133_g_PreMissionId ) < 1   then
		return 0
	end

	return 1
end

--**********************************
--Ti猵 th�
--**********************************
function x212133_OnAccept( sceneId, selfId, targetId )
	if x212133_CheckAccept(sceneId, selfId) < 1   then
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
	local ret = AddMission(sceneId,selfId, x212133_g_MissionId, x212133_g_ScriptId, 0, 0, 0)
	if ret <= 0 then
		local strText = format("#YDanh s醕h nhi甿 v�#W: c黙 c醕 h� 疸 馥y r癷")
		Msg2Player(sceneId, selfId, strText, MSG2PLAYER_PARA)
   	BeginEvent(sceneId)
			AddText(sceneId, strText)
	  EndEvent(sceneId)
  	DispatchMissionTips(sceneId,selfId)
		return
	end
	local strText = format("#Y Ti猵 nh nhi甿 v�: Hi畃 kh醕h v� 鸶ch")
	Msg2Player(sceneId, selfId, strText,MSG2PLAYER_PARA)
 	BeginEvent(sceneId)
		AddText(sceneId, strText)
  EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)

	local misIndex = GetMissionIndexByID(sceneId,selfId,x212133_g_MissionId)
	SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
	SetMissionByIndex( sceneId, selfId, misIndex, 1, 1)
	
end

--**********************************
--放弃
--**********************************
function x212133_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应to� 鸬 任务
  DelMission( sceneId, selfId, x212133_g_MissionId )
end

--**********************************
--继续
--**********************************
function x212133_OnContinue( sceneId, selfId, targetId )
	--提交任务时to� 鸬 � 餴琺餍畔�
  BeginEvent(sceneId)
		AddText(sceneId,x212133_g_MissionName)
		AddText(sceneId,x212133_g_MissionComplete)
		AddMoneyBonus( sceneId, x212133_g_MoneyBonus )
		for i, item in x212133_g_RadioItemBonus do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
  EndEvent( )
  DispatchMissionContinueInfo(sceneId,selfId,targetId,x212133_g_ScriptId,x212133_g_MissionId)
end

--**********************************
--检测喧ng否可以提交
--**********************************
function x212133_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x212133_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--提交
--**********************************
function x212133_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x212133_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		
		--添加任务奖励
		BeginAddItem(sceneId)
		for i, item in x212133_g_RadioItemBonus do
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
		
		AddMoney(sceneId,selfId, x212133_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId, x212133_g_exp)
		DelMission( sceneId, selfId, x212133_g_MissionId )
		MissionCom( sceneId, selfId, x212133_g_MissionId )
		Msg2Player( sceneId, selfId,"#Y Ho鄋 th鄋h nhi甿 v�: Hi畃 kh醕h v� 鸶ch",MSG2PLAYER_PARA )

		-- 给玩家添加称号
		LuaFnAwardTitle( sceneId, selfId,  11, 235)
		SetCurTitle(sceneId, selfId,  11, 235)
		LuaFnDispatchAllTitle(sceneId, selfId)
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x212133_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--进入区域事件
--**********************************
function x212133_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x212133_OnItemChanged( sceneId, selfId, itemdataId )
end

