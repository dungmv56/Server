-- 血战聚贤庄


-- 200024
-- 顶天立地

-- 再T読 副本内完成杀怪任务

--************************************************************************
--MisDescBegin
--脚本号
x200024_g_ScriptId = 200024

--副本名称
x200024_g_CopySceneName="T� Hi玭 Trang"

--任务号
x200024_g_MissionId = 23

--前续任务
x200024_g_PreMissionId = 22

--目标NPC
x200024_g_Name = "Ti猼 M� Hoa"

--喧ng否喧ngTinh英任务
x200024_g_IfMissionElite = 1

--衅ng c nhi甿 v� 
x200024_g_MissionLevel = 40

--任务归类
x200024_g_MissionKind = 47

--任务文本描述
x200024_g_MissionName="Huy猼 chi猲 T� Hi玭 Trang"
x200024_g_MissionInfo="#{Mis_juqing_0023}"
x200024_g_MissionTarget="#{Mis_juqing_Tar_0023}"	--M鴆 ti陁 nhi甿 v�
x200024_g_MissionComplete="  $N, n� l秈 c黙 c醕 h�, l鉶 phu nh 鸶nh tr� kh鰅 v猼 th呓ng c黙 ti瑄 a 馥u n鄖. 玄i 皙n l鷆 v猼 th呓ng l鄋h, nh 鸶nh ph鋓 tr� l秈 lai l竎h c黙 H Y nh鈔. "	--Ho鄋 t nhi甿 v鴑pc说话to� 鸬 话

x200024_g_MoneyBonus=63000
x200024_g_exp=64000

x200024_g_RadioItemBonus={{id=10415004 ,num=1},{id=10415005,num=1},{id=10415006,num=1},{id=10415007,num=1}}

x200024_g_Custom	= { {id="秀 b鋙 h� Ki玼 Phong tho醫 nguy",num=1} }
x200024_g_IsMissionOkFail = 0

--MisDescEnd
--************************************************************************

--**********************************
--任务入口函数
--**********************************
function x200024_OnDefaultEvent( sceneId, selfId, targetId )	-- 餴琺击该任务后执行此脚本
	--如果已接此任务
	if IsHaveMission(sceneId,selfId,x200024_g_MissionId) > 0 then
		--发送任务需求to� 鸬 信息
		BeginEvent(sceneId)
			AddText(sceneId,x200024_g_MissionName)
			--AddMoneyBonus( sceneId, x200024_g_MoneyBonus )
		EndEvent( )
		bDone = x200024_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x200024_g_ScriptId,x200024_g_MissionId,bDone)
    --Th鯽 m鉵任务接收条件
  elseif x200024_CheckAccept(sceneId,selfId) > 0 then
		--发送任务Ti猵 th毕允総o� 鸬 信息
		BeginEvent(sceneId)
			AddText(sceneId,x200024_g_MissionName)
			AddText(sceneId,x200024_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}#r")
			AddText(sceneId,x200024_g_MissionTarget)
			AddText(sceneId,"#{M_SHOUHUO}#r")
			AddMoneyBonus( sceneId, x200024_g_MoneyBonus )
			for i, item in x200024_g_RadioItemBonus do
				AddRadioItemBonus( sceneId, item.id, item.num )
			end
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x200024_g_ScriptId,x200024_g_MissionId)
  end

end

--**********************************
--列举事件
--**********************************
function x200024_OnEnumerate( sceneId, selfId, targetId )
  --如果玩家完成过C醝 n鄖 任务
  if IsMissionHaveDone(sceneId,selfId,x200024_g_MissionId) > 0 then
		return
	end

  --如果已接此任务
	if IsHaveMission(sceneId,selfId,x200024_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == "Ti猼 M� Hoa"   then
			AddNumText(sceneId,x200024_g_ScriptId,x200024_g_MissionName,2,-1);
		end
	--Th鯽 m鉵任务接收条件
	elseif x200024_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x200024_g_ScriptId,x200024_g_MissionName,1,-1);
	end

end

--**********************************
--检测Ti猵 th跫�
--**********************************
function x200024_CheckAccept( sceneId, selfId )
	
	--C 4c才能接
	if GetLevel( sceneId, selfId ) < 40 then
		return 0
	end
	
	if IsMissionHaveDone(sceneId,selfId,x200024_g_PreMissionId) < 1 then
		return 0
	end
	
	return 1
end

--**********************************
--Ti猵 th�
--**********************************
function x200024_OnAccept( sceneId, selfId )
	--加入任务到玩家列表
	local ret = AddMission( sceneId,selfId, x200024_g_MissionId, x200024_g_ScriptId, 0, 0, 0 )
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#YNh k� nhi甿 v� c黙 c醕 h� 疸 馥y" , MSG2PLAYER_PARA )
		return
	end

	local misIndex = GetMissionIndexByID(sceneId,selfId,x200024_g_MissionId)			-- 餴琺到任务to� 鸬 序列号
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)						--根据序列号把任务变量to� 鸬 第0位置0
	SetMissionByIndex(sceneId,selfId,misIndex,1,0)						--根据序列号把任务变量to� 鸬 第1位置0
	Msg2Player(  sceneId, selfId,"#YTi猵 nh nhi甿 v�#W: Huy猼 chi猲 T� huy玭 trang",MSG2PLAYER_PARA )
	--CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, x200024_g_SignPost.x, x200024_g_SignPost.z, x200024_g_SignPost.tip )
	
	-- Ti猵 th挝窈�,M� ra 剧情
	LuaFnSetCopySceneData_Param(sceneId, 10, 1)
	LuaFnSetCopySceneData_Param(sceneId, 11, LuaFnGetCurrentTime())
	LuaFnSetCopySceneData_Param(sceneId, 12, LuaFnGetCurrentTime())
	LuaFnSetCopySceneData_Param(sceneId, 13, 1)
	
end

--**********************************
--定时事件
--**********************************
function x200024_OnTimer(sceneId,selfId)--,missionIndex)
	
end

--**********************************
--放弃
--**********************************
function x200024_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应to� 鸬 任务
  DelMission( sceneId, selfId, x200024_g_MissionId )
--	CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x200024_g_SignPost.tip )
end


--**********************************
--继续
--**********************************
function x200024_OnContinue( sceneId, selfId, targetId )
	--提交任务时to� 鸬 � 餴琺餍畔�
  BeginEvent(sceneId)
	AddText(sceneId,x200024_g_MissionName)
	AddText(sceneId,x200024_g_MissionComplete)
	AddText(sceneId,"#{M_SHOUHUO}#r")
	AddMoneyBonus( sceneId, x200024_g_MoneyBonus )
	for i, item in x200024_g_RadioItemBonus do
		AddRadioItemBonus( sceneId, item.id, item.num )
	end
  EndEvent( )
  DispatchMissionContinueInfo(sceneId,selfId,targetId,x200024_g_ScriptId,x200024_g_MissionId)
end

--**********************************
--检测喧ng否可以提交
--**********************************
function x200024_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x200024_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	local misIndex = GetMissionIndexByID(sceneId,selfId,x200024_g_MissionId)
	
	local Kill1 = LuaFnGetCopySceneData_Param(sceneId, 15)

	if Kill1~=1 			then
		return 0
	end

	return 1
end

--**********************************
--提交
--**********************************
function x200024_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	if x200024_CheckSubmit(sceneId, selfId) == 1   then
  	BeginAddItem(sceneId)
		for i, item in x200024_g_RadioItemBonus do
			if item.id == selectRadioId then
				AddItem( sceneId,item.id, item.num )
			end
		end
		local ret = EndAddItem(sceneId,selfId)
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

		AddMoney(sceneId,selfId,x200024_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId,x200024_g_exp)

		DelMission( sceneId, selfId, x200024_g_MissionId )
		MissionCom( sceneId, selfId, x200024_g_MissionId )
		Msg2Player( sceneId, selfId,"#YHo鄋 t nhi甿 v�: Huy猼 chi猲 T� Hi玭 Trang",MSG2PLAYER_PARA )

		Msg2Player( sceneId, selfId,"C醕 h� 疸 ho鄋 th鄋h xong lo誸 nhi甿 v� #GT� Hi玭 Trang #W",MSG2PLAYER_PARA )
		local selfGuid = LuaFnObjId2Guid(sceneId, selfId)
		LuaFnSendMailToGUID(sceneId, selfGuid, "C醕 h� 疸 ho鄋 th鄋h xong lo誸 nhi甿 v� #GT� Hi玭 Trang #W. Sau khi 鹫t t緄 c 50, t靘 Tri畊 Thi阯 S� � th鄋h 姓i L�, M� m祎 lo誸 nhi甿 v� #GTh呓ng Mang S絥 #W")

		-- 完成聚贤庄剧情,给10 餴琺剧情 餴琺
		local nPoint = GetHumanJuqingPoint(sceneId, selfId)
		SetHumanJuqingPoint(sceneId, selfId, nPoint+10)

		-- 通知玩家,可以做剧情循环任务了
		-- 您现T読 可以去AA城to� 鸬 [bb,cc]找到DD,Ti猵 th鳧D循环任务.
		local strText1 = "C醕 h� b鈟 gi� c� th� 餴 to� 鸬 [118,62]th鄋h L誧 D呓ng t靘 Gia Lu 姓i Th誧h, ti猵 nh nhi甿 v� tu ho鄋 c黙 Ti陁 Phong."
		LuaFnSendSystemMail(sceneId, GetName(sceneId,selfId), strText1)
		
		BeginEvent(sceneId)
			AddText(sceneId,strText1);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		
		
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x200024_OnKillObject( sceneId, selfId, objdataId ,objId)

	local misIndex
	if GetName(sceneId,objId) == "Huy玭 N課"	  then
		local misIndex = GetMissionIndexByID(sceneId,selfId,x200024_g_MissionId)
		SetMissionByIndex(sceneId,selfId,misIndex,3,1)
	end
	if GetName(sceneId,objId) == "Huy玭 T竎h"	  then
		local misIndex = GetMissionIndexByID(sceneId,selfId,x200024_g_MissionId)
		SetMissionByIndex(sceneId,selfId,misIndex,4,1)
	end
	
end

--**********************************
--进入区域事件
--**********************************
function x200024_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x200024_OnItemChanged( sceneId, selfId, itemdataId )
end


