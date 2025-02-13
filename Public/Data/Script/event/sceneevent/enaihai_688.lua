-- 送信任务
-- 石敢当 -> 叶流凡

--MisDescBegin
--脚本号
x212114_g_ScriptId = 212114

--任务号
x212114_g_MissionId = 688

--前续任务
x212114_g_PreMissionId = 687

--目标NPC
x212114_g_Name	="Di畃 L遳 Ph鄊"

--任务归类
x212114_g_MissionKind = 45

--衅ng c nhi甿 v� 
x212114_g_MissionLevel = 82

--喧ng否喧ngTinh英任务
x212114_g_IfMissionElite = 0

--任务名
x212114_g_MissionName="V猼 m醬 th� 2"
x212114_g_MissionInfo="#{Mis_S_Nanhai_1010193}"
x212114_g_MissionTarget="  Mang #YHuy猼 y#W tg cho #RDi畃 L遳 Ph鄊#W � #GNam H鋓 Ki猰 Ph� #W#{_INFOAIM115,58,34, L遳 Di畃 Ph鄊}. "
x212114_g_MissionContinue="  C醕 h� t靘 ta c� vi甤 g�?"
x212114_g_MissionComplete="  T... T huy猼 y n鄖 d叨ng nh� l� y trang c黙 Nam Chi陁 B誧h Mi陁 Nh鈔"

x212114_g_MoneyBonus=36900
x212114_g_exp=35000

x212114_g_Custom	= { {id="秀 鹫t 疬㧟 t huy猼 y",num=1} }
x212114_g_IsMissionOkFail = 0

--MisDescEnd

--**********************************
--任务入口函数
--**********************************
function x212114_OnDefaultEvent( sceneId, selfId, targetId )
	--如果玩家完成过C醝 n鄖 任务
	if (IsMissionHaveDone(sceneId,selfId,x212114_g_MissionId) > 0 ) then
		return
	elseif( IsHaveMission(sceneId,selfId,x212114_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x212114_g_Name then
			x212114_OnContinue( sceneId, selfId, targetId )
		end
	
	--Th鯽 m鉵任务接收条件
	elseif x212114_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x212114_g_Name then
			--发送任务Ti猵 th毕允総o� 鸬 信息
			local  PlayerName=GetName(sceneId,selfId)	
			BeginEvent(sceneId)
				AddText(sceneId,x212114_g_MissionName)
				AddText(sceneId,x212114_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}#r")
				AddText(sceneId,x212114_g_MissionTarget)
				AddText(sceneId,"#{M_SHOUHUO}#r")
				AddMoneyBonus( sceneId, x212114_g_MoneyBonus )
				AddRadioItemBonus( sceneId, 10420074, 1 )
				AddRadioItemBonus( sceneId, 10410076, 1 )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x212114_g_ScriptId,x212114_g_MissionId)
		end
	end
end

--**********************************
--列举事件
--**********************************
function x212114_OnEnumerate( sceneId, selfId, targetId )
	--如果玩家完成过C醝 n鄖 任务
	if IsMissionHaveDone(sceneId,selfId,x212114_g_MissionId) > 0 then
		return 
	--如果已接此任务
	elseif IsHaveMission(sceneId,selfId,x212114_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x212114_g_Name then
			AddNumText(sceneId, x212114_g_ScriptId,x212114_g_MissionName,2,-1);
		end
	--Th鯽 m鉵任务接收条件
	elseif x212114_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x212114_g_Name then
			AddNumText(sceneId,x212114_g_ScriptId,x212114_g_MissionName,1,-1);
		end
	end

end

--**********************************
--检测Ti猵 th跫�
--**********************************
function x212114_CheckAccept( sceneId, selfId )
	-- 1,检测玩家喧ng不喧ng已经做过
	if (IsMissionHaveDone(sceneId,selfId,x212114_g_MissionId) > 0 ) then
		return 0
	end
		
	-- 等c检测
	if GetLevel( sceneId, selfId ) < x212114_g_MissionLevel then
		return 0
	end
	
	-- 前续任务to� 鸬 完成情况
	if IsMissionHaveDone(sceneId,selfId,x212114_g_PreMissionId) < 1  then
		return 0
	end
	
	return 1	
end

--**********************************
--Ti猵 th�
--**********************************
function x212114_OnAccept( sceneId, selfId, targetId )
	if x212114_CheckAccept(sceneId, selfId) < 1   then
		return 0
	end
	
	-- 添加任务物品
	BeginAddItem( sceneId )
		AddItem( sceneId, 40002075, 1 )
	local ret = EndAddItem( sceneId, selfId )

	if ret <= 0 then 
		--提示不能接任务了
		Msg2Player(  sceneId, selfId,"#Yh鄋h Trang nhi甿 v�#W c黙 c醕 h� 疸 馥y", MSG2PLAYER_PARA )
	else
		--加入任务到玩家列表
		local ret = AddMission( sceneId,selfId, x212114_g_MissionId, x212114_g_ScriptId, 0, 0, 0 )
		if ret <= 0 then
			Msg2Player(  sceneId, selfId,"#YNh k� nhi甿 v� c黙 c醕 h� 疸 馥y" , MSG2PLAYER_PARA )
			return
		end

		AddItemListToHuman(sceneId,selfId)
		Msg2Player(  sceneId, selfId,"#YNh nhi甿 v�#W: v猼 m醬 th� 2",MSG2PLAYER_PARA )
		BeginEvent(sceneId)
			strText = "#YNh nhi甿 v�#W: v猼 m醬 th� 2"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		
		local misIndex = GetMissionIndexByID(sceneId,selfId,x212114_g_MissionId)
		SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
		SetMissionByIndex( sceneId, selfId, misIndex, 1, 1)
	end
	
end

--**********************************
--放弃
--**********************************
function x212114_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应to� 鸬 任务
  DelMission( sceneId, selfId, x212114_g_MissionId )
	DelItem( sceneId, selfId, 40002075, 1 )	
--	CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x212114_g_SignPost.tip )
end

--**********************************
--继续
--**********************************
function x212114_OnContinue( sceneId, selfId, targetId )
	--提交任务时to� 鸬 � 餴琺餍畔�
  BeginEvent(sceneId)
	AddText(sceneId,x212114_g_MissionName)
	AddText(sceneId,x212114_g_MissionComplete)
	AddMoneyBonus( sceneId, x212114_g_MoneyBonus )
	AddRadioItemBonus( sceneId, 10420074, 1 )
	AddRadioItemBonus( sceneId, 10410076, 1 )
  EndEvent( )
  DispatchMissionContinueInfo(sceneId,selfId,targetId,x212114_g_ScriptId,x212114_g_MissionId)
end

--**********************************
--检测喧ng否可以提交
--**********************************
function x212114_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x212114_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--提交
--**********************************
function x212114_OnSubmit( sceneId, selfId, targetId, selectRadioId )

	if x212114_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		-- 添加奖励物品
		BeginAddItem(sceneId)
			AddItem( sceneId, selectRadioId, 1 )
		local ret = EndAddItem(sceneId,selfId)
		
		if ret > 0  then
			-- 删除任务物品
			DelItem( sceneId, selfId, 40002075, 1 )	

			--添加任务奖励
			AddItemListToHuman(sceneId,selfId)			
			AddMoney(sceneId,selfId, x212114_g_MoneyBonus );
			LuaFnAddExp( sceneId, selfId, x212114_g_exp)
			
			--设置任务已经被完成过
			DelMission( sceneId,selfId,  x212114_g_MissionId )
			MissionCom( sceneId,selfId,  x212114_g_MissionId )
	
			Msg2Player(  sceneId, selfId,"#YHo鄋 t nhi甿 v�#W: v猼 m醬 th� 2",MSG2PLAYER_PARA )
			
			-- 调用后续任务
			CallScriptFunction((200081), "OnDefaultEvent",sceneId, selfId, targetId )
			
			-- 提交任务后,刷2组,3c醝怪出来,消失时间30 gi鈟
			local nNpcId
			nNpcId = LuaFnCreateMonster(sceneId, 823, 118, 55, 0, 0, -1)
			SetCharacterDieTime(sceneId, nNpcId, 30000)
			
			nNpcId = LuaFnCreateMonster(sceneId, 821, 115, 54, 0, 0, -1)
			SetCharacterDieTime(sceneId, nNpcId, 30000)
			nNpcId = LuaFnCreateMonster(sceneId, 821, 114, 52, 0, 0, -1)
			SetCharacterDieTime(sceneId, nNpcId, 30000)
			
		else
			--任务奖励没有加成功
			BeginEvent(sceneId)
				AddText(sceneId, "Kh鬾g th� Ho鄋 t nhi甿 v�");
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		
		end
		
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x212114_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--进入区域事件
--**********************************
function x212114_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x212114_OnItemChanged( sceneId, selfId, itemdataId )
end
