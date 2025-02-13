-- 200038

-- 六军辟易 护送 Ti陁 Phong 回

--MisDescBegin
--脚本号
x200038_g_ScriptId = 200038

--任务号
x200038_g_MissionId = 32

--前续任务号
x200038_g_PreMissionId = 31

--目标NPC
x200038_g_Name	="Ti陁 Phong"

--任务归类
x200038_g_MissionKind = 52

--衅ng c nhi甿 v� 
x200038_g_MissionLevel = 50

--喧ng否喧ngTinh英任务
x200038_g_IfMissionElite = 0

--任务名
x200038_g_MissionName="L鴆 Qu鈔 T� D竎h"
--任务描述
x200038_g_MissionInfo="#{Mis_juqing_0032}"
--M鴆 ti陁 nhi甿 v�
x200038_g_MissionTarget="#{Mis_juqing_Tar_0032}"		
--提交时npcto� 鸬 话
x200038_g_MissionComplete="  Gia Lu H皀g C� l読 nh靚 th m tr秈, t c� 皤u d馻 v鄌 s裞 ngh頰 甬 Ti陁 Phong v� $N 鹫i hi畃. Hai v� xin nh m祎 l誽 c黙 Gia Lu H皀g C�!"		

x200038_g_MoneyBonus=54000
x200038_g_exp=62400

x200038_g_RadioItemBonus={{id=10422007 ,num=1},{id=10422008,num=1},{id=10422009,num=1},{id=10422010,num=1}}

x200038_g_Custom	= { {id="秀 h� t痭g Ti陁 Phong v� Ho鄋g Th醝 Th鷆 quay v� tr読 B n鷌 Th呓ng Mang",num=1} }

--MisDescEnd

--**********************************
--任务入口函数
--**********************************
function x200038_OnDefaultEvent( sceneId, selfId, targetId )	-- 餴琺击该任务后执行此脚本
	
	if IsHaveMission(sceneId,selfId,x200038_g_MissionId) > 0 then
			--C 任务完成才可以
			local misIndex = GetMissionIndexByID(sceneId, selfId, x200038_g_MissionId)-- 餴琺到任务T読 20c醝任务中to� 鸬 序列号
			if GetMissionParam(sceneId, selfId, misIndex, 0) == 1	then   --如果护送完成
				BeginEvent(sceneId)
					AddText(sceneId,x200038_g_Name)
					AddText(sceneId,x200038_g_MissionComplete)
					AddText(sceneId,"#{M_MUBIAO}#r")
					AddText(sceneId,x200038_g_MissionTarget)
					AddMoneyBonus( sceneId, x200038_g_MoneyBonus )
					for i, item in x200038_g_RadioItemBonus do
						AddRadioItemBonus( sceneId, item.id, item.num )
					end
				EndEvent( )
				DispatchMissionContinueInfo(sceneId, selfId, targetId, x200038_g_ScriptId, x200038_g_MissionId)
		end
		
	elseif x200038_CheckAccept(sceneId,selfId) > 0 then

		BeginEvent(sceneId)
			AddText(sceneId, x200038_g_MissionName)
			AddText(sceneId, x200038_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}#r")
			AddText(sceneId, x200038_g_MissionTarget)
			AddText(sceneId,"#{M_SHOUHUO}#r")
			for i, item in x200038_g_RadioItemBonus do
				AddRadioItemBonus( sceneId, item.id, item.num )
			end
			AddMoneyBonus( sceneId, x200038_g_MoneyBonus )
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x200038_g_ScriptId,x200038_g_MissionId)
	end	
end

--**********************************
--列举事件
--**********************************
function x200038_OnEnumerate( sceneId, selfId, targetId )

	-- 如果前续任务1没有完成,就Tr� v�
	if IsMissionHaveDone(sceneId, selfId, x200038_g_PreMissionId) <= 0   then
		return
	end
	-- 如果本任务已经完成,就Tr� v�
	if IsMissionHaveDone(sceneId, selfId, x200038_g_MissionId) > 0 then
   	return
	--Th鯽 m鉵任务接收条件
	elseif IsHaveMission(sceneId, selfId, x200038_g_MissionId) > 0 then

		if GetName(sceneId, targetId) == x200038_g_Name then
			--BeginEvent(sceneId)
				AddNumText(sceneId, x200038_g_ScriptId, x200038_g_MissionName,2,-1);
			--EndEvent()	
			DispatchEventList(sceneId, selfId, targetId)
		end
		
	--Th鯽 m鉵任务接收条件
  elseif x200038_CheckAccept(sceneId, selfId) > 0 then
		if GetName(sceneId, targetId) == x200038_g_Name then
			--BeginEvent(sceneId)
				AddNumText(sceneId, x200038_g_ScriptId, x200038_g_MissionName,1,-1);
			--EndEvent()
			DispatchEventList(sceneId, selfId, targetId)	
		end
  end
end

--**********************************
-- 
--**********************************
function x200038_OnLockedTarget( sceneId, selfId, targetId )

end

--**********************************
--检测Ti猵 th跫�
--**********************************
function x200038_CheckAccept( sceneId, selfId )
	-- 接任务to� 鸬 条件喧ng,人物达到20c以上,并且完成了前续任务
	
	-- 1,检测玩家喧ng不喧ng已经做过
	if (IsMissionHaveDone(sceneId,selfId,x200038_g_MissionId) > 0 ) then
		return 0
	end

	if GetLevel(sceneId, selfId) < x200038_g_MissionLevel   then
		return 0
	end
	
	if IsMissionHaveDone(sceneId, selfId, x200038_g_PreMissionId ) < 1   then
		return 0
	end
	
	return 1
end

--**********************************
--Ti猵 th�
--**********************************
function x200038_OnAccept( sceneId, selfId, targetId )

	-- 检测玩家喧ng不喧ng已经完成过C醝 n鄖 任务
	if IsMissionHaveDone(sceneId, selfId, x200038_g_MissionId) > 0   then
		return
	end

	--加入任务到玩家列表
	local ret = AddMission( sceneId,selfId, x200038_g_MissionId, x200038_g_ScriptId, 0, 0, 0 )
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#YNh k� nhi甿 v� c黙 c醕 h� 疸 馥y" , MSG2PLAYER_PARA )
		return
	end
	
	Msg2Player(  sceneId, selfId,"#YNh nhi甿 v�#W: L鴆 Qu鈔 T� D竎h" , MSG2PLAYER_PARA )
	
	-- T読 这里启动m祎 c醝护送,
	if LuaFnGetCopySceneData_Param(sceneId, 8) < 10  then
		LuaFnSetCopySceneData_Param(sceneId, 8, 10)
		LuaFnSetCopySceneData_Param(sceneId, 10, 1)
	end

end

--**********************************
--放弃
--**********************************
function x200038_OnAbandon( sceneId, selfId )
  --将护送npc瞬移回原来位置
  DelMission(sceneId, selfId, x200038_g_MissionId)
  
end

--**********************************
--继续
--**********************************
function x200038_OnContinue( sceneId, selfId, targetId )

	BeginEvent(sceneId)
		AddText(sceneId,x200038_g_Name)
		AddText(sceneId,x200038_g_MissionComplete)
		AddText(sceneId,"#{M_MUBIAO}#r")
		AddText(sceneId,x200038_g_MissionTarget)
		AddMoneyBonus( sceneId, x200038_g_MoneyBonus )
		for i, item in x200038_g_RadioItemBonus do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
	EndEvent( )
	
	DispatchMissionContinueInfo(sceneId, selfId, targetId, x200038_g_ScriptId, x200038_g_MissionId)

end

--**********************************
--检测喧ng否可以提交
--**********************************
function x200038_CheckSubmit( sceneId, selfId )
	
	local misIndex = GetMissionIndexByID(sceneId, selfId, x200038_g_MissionId)
	
	local bComplete = GetMissionParam(sceneId, selfId, misIndex, 0)	
	if bComplete > 0 then
		return 1
	else
		return 0
	end
	
end

--**********************************
--提交
--**********************************
function x200038_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	
	-- 检测喧ng不喧ngTh鯽 m鉵Ho鄋 t nhi甿 v鴗o� 鸬 条件
	if x200038_CheckSubmit(sceneId, selfId) < 1 then 
		return
	end

	BeginAddItem(sceneId)
	for i, item in x200038_g_RadioItemBonus do
		if item.id == selectRadioId then

			AddItem( sceneId,item.id, item.num )
		end
	end
	ret = EndAddItem(sceneId,selfId)
	--添加任务奖励
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
	
	--添加任务奖励
	AddMoney(sceneId,selfId, x200038_g_MoneyBonus );
	LuaFnAddExp( sceneId, selfId, x200038_g_exp)

	DelMission( sceneId,selfId, x200038_g_MissionId )
	--设置任务已经被完成过
	MissionCom( sceneId,selfId, x200038_g_MissionId )
	Msg2Player(  sceneId, selfId,"#YHo鄋 t nhi甿 v�#W: L鴆 Qu鈔 T� D竎h",MSG2PLAYER_PARA )

	Msg2Player( sceneId, selfId,"C醕 h� 疸 ho鄋 th鄋h xong m祎 lo誸 nhi甿 v�#G Th呓ng Mang S絥#W",MSG2PLAYER_PARA )
	local selfGuid = LuaFnObjId2Guid(sceneId, selfId)
	LuaFnSendMailToGUID(sceneId, selfGuid, "C醕 h� 疸 ho鄋 th鄋h xong 1 lo誸 nhi甿 v�#G Th呓ng Mang S絥 #W. Sau khi 鹫t t緄 c 60, t緄 t靘 Tri畊 Thi阯 S� � 姓i L�, M� h� th痭g nhi甿 v� #Gn鷌 C� L鬷 #W")

	-- 完成苍茫山剧情,给10 餴琺剧情 餴琺
	local nPoint = GetHumanJuqingPoint(sceneId, selfId)
	SetHumanJuqingPoint(sceneId, selfId, nPoint+10)
	
	-- 通知玩家,可以做剧情循环任务了
	-- 您现T読 可以去AA城to� 鸬 [bb,cc]找到DD,Ti猵 th鳧D循环任务.
	local strText1 = "#{LOOTMISSION_MAIL_09}"
	LuaFnSendSystemMail(sceneId, GetName(sceneId,selfId), strText1)
	
	BeginEvent(sceneId)
		AddText(sceneId,"#{LOOTMISSION_INFO_04}");
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	
end

function x200038_OnHumanDie(sceneId, selfId)

end

--**********************************
--定时事件
--**********************************
function x200038_OnTimer(sceneId,selfId)

end
