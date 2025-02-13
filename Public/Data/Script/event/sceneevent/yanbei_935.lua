--Nh課 B 清除熊患
--212122

--MisDescBegin
--脚本号
x212122_g_ScriptId = 212122

--Ti猵 th挝馧PC属性
x212122_g_Position_X=234
x212122_g_Position_Z=192
x212122_g_SceneID=19
x212122_g_AccomplishNPC_Name="Kh鷆 衞an"

--任务号
x212122_g_MissionId = 935

--目标NPC
x212122_g_Name	="Kh鷆 衞an"

--任务归类
x212122_g_MissionKind = 30

--衅ng c nhi甿 v� 
x212122_g_MissionLevel = 46

--喧ng否喧ngTinh英任务
x212122_g_IfMissionElite = 0

--任务名
x212122_g_MissionName="Thanh tr� n課 g"
x212122_g_MissionInfo="#{Mis_30_60_desc_010}"
x212122_g_MissionTarget="    Kh鷆 衞an � Nh課 B #{_INFOAIM233,192,19, Kh鷆 衞an} y陁 c c醕 h� 餴 gi猼 20 con H皀g Phong H鵱g #{_INFOAIM233,93,19,-1}. "
x212122_g_MissionContinue="  C醕 h� 疸 gi猼 ch猼 20 con H皀g Phong H鵱g ch遖 ?"
x212122_g_MissionComplete="  Th l� qu� t痶 r癷, c� nh� th�, H皀g Phong H鵱g s� kh鬾g d醡 皙n 錸 tr祄 qu鈔 l呓ng n鎍 r癷."

x212122_g_MoneyBonus=10000
x212122_g_exp=12000

x212122_g_Custom	= { {id="秀 gi猼 ch猼 H皀g Phong H鵱g",num=20} }
x212122_g_IsMissionOkFail = 0


--MisDescEnd
--**********************************
--任务入口函数
--**********************************
function x212122_OnDefaultEvent( sceneId, selfId, targetId )
	--如果玩家完成过C醝 n鄖 任务
	if (IsMissionHaveDone(sceneId,selfId,x212122_g_MissionId) > 0 ) then
		return
	elseif( IsHaveMission(sceneId,selfId,x212122_g_MissionId) > 0)  then
		--x212122_OnContinue( sceneId, selfId, targetId )
		local bDone = x212122_CheckSubmit( sceneId, selfId )
		BeginEvent(sceneId)
			AddText(sceneId,x212122_g_MissionName)
			AddText(sceneId,x212122_g_MissionContinue)
		EndEvent( )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x212122_g_ScriptId,x212122_g_MissionId,bDone)		
	
	--Th鯽 m鉵任务接收条件
	elseif x212122_CheckAccept(sceneId,selfId) > 0 then
		--发送任务Ti猵 th毕允総o� 鸬 信息
		local  PlayerName=GetName(sceneId,selfId)	
		BeginEvent(sceneId)
			AddText(sceneId,x212122_g_MissionName)
			AddText(sceneId,x212122_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}#r")
			AddText(sceneId,x212122_g_MissionTarget)
			AddText(sceneId,"#{M_SHOUHUO}#r")
			AddMoneyBonus( sceneId, x212122_g_MoneyBonus )
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x212122_g_ScriptId,x212122_g_MissionId)
	end
end

--**********************************
--列举事件
--**********************************
function x212122_OnEnumerate( sceneId, selfId, targetId )

	--如果玩家完成过C醝 n鄖 任务
	if IsMissionHaveDone(sceneId,selfId,x212122_g_MissionId) > 0 then
		return 
	--如果已接此任务
	elseif IsHaveMission(sceneId,selfId,x212122_g_MissionId) > 0 then
		AddNumText(sceneId, x212122_g_ScriptId,x212122_g_MissionName,2,-1);
	--Th鯽 m鉵任务接收条件
	elseif x212122_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x212122_g_ScriptId,x212122_g_MissionName,1,-1);
	end

end

--**********************************
--检测Ti猵 th跫�
--**********************************
function x212122_CheckAccept( sceneId, selfId )
	-- 1,检测玩家喧ng不喧ng已经做过
	if (IsMissionHaveDone(sceneId,selfId,x212122_g_MissionId) > 0 ) then
		return 0
	end
		
	-- 等c检测
	if GetLevel(sceneId, selfId) < x212122_g_MissionLevel then
		return 0
	end
	
	return 1
end

--**********************************
--Ti猵 th�
--**********************************
function x212122_OnAccept( sceneId, selfId, targetId )
	if x212122_CheckAccept(sceneId, selfId) < 1   then
		return 0
	end
	
	-- 检查玩家to� 鸬 心法喧ng不喧ng达到了要求(前六种衅ng c t鈓 ph醦 大于等于30c)
	if CallScriptFunction( 212120, "CheckAllXinfaLevel", sceneId, selfId, 45 ) == 0  then
   	BeginEvent(sceneId)
			local strText = format("Nhi甿 v� n鄖 y陁 c 6 lo読 t鈓 ph醦 皤u 鹫t c 45.")
			AddText(sceneId, strText)
	  EndEvent(sceneId)
  	DispatchMissionTips(sceneId,selfId)
		return
	end
	
	--加入任务到玩家列表
	local ret = AddMission(sceneId,selfId, x212122_g_MissionId, x212122_g_ScriptId, 0, 0, 0)
	if ret <= 0 then
		Msg2Player(sceneId, selfId,"#YDanh s醕h nhi甿 v�#W: c黙 c醕 h� 疸 馥y r癷" , MSG2PLAYER_PARA)
   	BeginEvent(sceneId)
			AddText(sceneId, "#YDanh s醕h nhi甿 v�#W: c黙 c醕 h� 疸 馥y r癷")
	  EndEvent(sceneId)
  	DispatchMissionTips(sceneId,selfId)
		return
	end
	Msg2Player(sceneId, selfId,"#Y Ti猵 nh nhi甿 v�: Thanh Tr� H鵱g Ho課.",MSG2PLAYER_PARA)
 	BeginEvent(sceneId)
		AddText(sceneId, "#Y Ti猵 nh nhi甿 v�: Thanh Tr� H鵱g Ho課.")
  EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)

	local misIndex = GetMissionIndexByID(sceneId,selfId,x212122_g_MissionId)
	SetMissionByIndex( sceneId, selfId, misIndex, 0, 0)
	SetMissionByIndex( sceneId, selfId, misIndex, 1, 0)
	
	-- 玩家关心杀怪
	SetMissionEvent( sceneId,selfId,x212122_g_MissionId, 0 )

end

--**********************************
--放弃
--**********************************
function x212122_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应to� 鸬 任务
  DelMission( sceneId, selfId, x212122_g_MissionId )
end

--**********************************
--继续
--**********************************
function x212122_OnContinue( sceneId, selfId, targetId )
	--提交任务时to� 鸬 � 餴琺餍畔�
  BeginEvent(sceneId)
	AddText(sceneId,x212122_g_MissionName)
	AddText(sceneId,x212122_g_MissionComplete)
	AddMoneyBonus( sceneId, x212122_g_MoneyBonus )
  EndEvent()
  DispatchMissionContinueInfo(sceneId,selfId,targetId,x212122_g_ScriptId,x212122_g_MissionId)
end

--**********************************
--检测喧ng否可以提交
--**********************************
function x212122_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x212122_g_MissionId )
	if bRet ~= 1 then
		return 0
	end
	
	local misIndex = GetMissionIndexByID(sceneId,selfId,x212122_g_MissionId)
	if GetMissionParam(sceneId, selfId, misIndex, 0) < 1  then
		return 0
	end

	return 1
end

--**********************************
--提交
--**********************************
function x212122_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x212122_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		--添加任务奖励
		AddMoney(sceneId,selfId, x212122_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId, x212122_g_exp)
		DelMission( sceneId, selfId, x212122_g_MissionId )
		MissionCom( sceneId, selfId, x212122_g_MissionId )
		Msg2Player( sceneId, selfId,"#Y Ho鄋 th鄋h nhi甿 v�: Thanh Tr� H鵱g Ho課",MSG2PLAYER_PARA )
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x212122_OnKillObject( sceneId, selfId, objdataId, objId )
	local monsterName = GetMonsterNamebyDataId(objdataId)
	if monsterName == " H皀g Phong H鵱g "    then
		local num = GetMonsterOwnerCount(sceneId,objId)
		for j=0,num-1  do
			local humanObjId = GetMonsterOwnerID(sceneId,objId,j)
			if IsHaveMission(sceneId, humanObjId, x212122_g_MissionId) > 0 then
				local misIndex = GetMissionIndexByID(sceneId,humanObjId,x212122_g_MissionId)
				if GetMissionParam(sceneId, humanObjId, misIndex, 0) <=0  then
					local ct = GetMissionParam(sceneId, humanObjId, misIndex, 1)
					if ct < 20    then
						SetMissionByIndex(sceneId, humanObjId, misIndex, 1, ct+1)
						-- 通知客户端
			     	BeginEvent(sceneId)
							local strText = format("秀 gi猼 ch猼 H皀g Phong H鵱g: %d/20", ct+1 )
							AddText(sceneId, strText)
					  EndEvent(sceneId)
				  	DispatchMissionTips(sceneId,humanObjId)
						if ct+1 >= 20  then
							SetMissionByIndex( sceneId, humanObjId, misIndex, 0, 1 )
						end
					end
				end
			end
		end
	end
end

--**********************************
--进入区域事件
--**********************************
function x212122_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x212122_OnItemChanged( sceneId, selfId, itemdataId )
end

