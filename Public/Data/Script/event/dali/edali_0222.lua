--副本任务
--木人

--************************************************************************
--MisDescBegin

--脚本号
x210222_g_ScriptId = 210222

--副本名称
x210222_g_CopySceneName="H hoa vi阯"
x210222_g_CopySceneMap = "newbie_2.nav"
x210222_g_CopySceneMonster = "newbie_2_monster.ini"

--任务号
x210222_g_MissionId = 702

--上m祎 c醝任务to� 鸬 ID
x210222_g_MissionIdPre = 701

--目标NPC
x210222_g_Name = "Th� Ph�"

--喧ng否喧ngTinh英任务
x210222_g_IfMissionElite = 1

--任务归类
x210222_g_MissionKind = 13

--衅ng c nhi甿 v� 
x210222_g_MissionLevel = 7

--********下面几项喧ng动态显示to� 鸬 内容,用于T読 任务列表中动态显示任务情况******
--循环任务to� 鸬 数据索引,里面存着已做to� 鸬 环数 MD_MURENXIANG_HUAN
--g_MissionRound = 9
--**********************************以上喧ng动态****************************

--任务文本描述
x210222_g_MissionName="H hoa vi阯"
x210222_g_MissionInfo="#{event_dali_0032}"  --任务描述
x210222_g_MissionTarget="V鄌 c豠 sau c黙 Hoa Vi阯. "	--M鴆 ti陁 nhi甿 v�
x210222_g_ContinueInfo="V鄌 c豠 sau c黙 Hoa Vi阯. "	--未Ho鄋 t nhi甿 v鴗o� 鸬 npc对话
x210222_g_MissionComplete="  Nhi甿 v� ho鄋 th鄋h"	--Ho鄋 t nhi甿 v鴑pc说话to� 鸬 话
x210222_g_SignPost = {x = 275, z = 50, tip = "Ho鄋g Mi T錸g "}
x210222_g_PetDataID=558	--任务宠物to� 鸬 编号

--角色Mission变量� 餴琺�
x210222_g_Param_huan		=0	--0号: 已经完成to� 鸬 环数,T読 接收任务时候赋值
x210222_g_IsMissionOkFail	=1	--1号: 当前任务喧ng否完成(0未完成；1完成)
x210222_g_Param_sceneid		=2	--2号: 当前副本任务to� 鸬 场景号
x210222_g_Param_guid		=3	--3号: 接副本任务时候to� 鸬 玩家GUID
x210222_g_Param_killcount	=4	--4号: 杀死任务怪to� 鸬 数量
x210222_g_Param_time		=5	--5号: 完成副本所用时间(单位:  gi鈟)
--6号: 未用
--7号: 未用

--任务奖励
x210222_g_MoneyBonus=2

--MisDescEnd
--************************************************************************

x210222_g_CopySceneType=FUBEN_MURENXIANG_7	--副本类型,定义T読 ScriptGlobal.lua里面
x210222_g_LimitMembers=1			--可以进副本to� 鸬 最小队伍人数
x210222_g_TickTime=5				--回调脚本to� 鸬 时钟时间(单位:  gi鈟/次)
x210222_g_LimitTotalHoldTime=360	--副本可以存活to� 鸬 时间(单位: 次数),如果此时间到了,则任务将会th b読
x210222_g_LimitTimeSuccess=500		--副本时间限制(单位: 次数),如果此时间到了,任务完成
x210222_g_CloseTick=6				--副本关闭前倒计时(单位: 次数)
x210222_g_NoUserTime=300			--副本中没有人后可以继续保存to� 鸬 时间(单位:  gi鈟)
x210222_g_DeadTrans=0				--死亡转移模式,0: 死亡后还可以继续T読 副本,1: 死亡后被强制移出副本
x210222_g_Fuben_X=44				--进入副本to� 鸬 位置X
x210222_g_Fuben_Z=54				--进入副本to� 鸬 位置Z
x210222_g_Back_X=275				--源场景位置X
x210222_g_Back_Z=50					--源场景位置Z
x210222_g_TotalNeedKill=0			--C 杀死怪物数量
x210222_g_MissionIdPre=701			--C 提前拥有to� 鸬 任务

--**********************************
--任务入口函数
--**********************************
function x210222_OnDefaultEvent( sceneId, selfId, targetId )
	if IsHaveMission(sceneId,selfId,x210222_g_MissionId) > 0  then	--如果玩家已经接了C醝 n鄖 任务
		misIndex = GetMissionIndexByID(sceneId,selfId,x210222_g_MissionId)
		bDone = x210222_CheckSubmit( sceneId, selfId )
		if bDone==0 then						--任务未完成
			BeginEvent(sceneId)
				AddText(sceneId,x210222_g_MissionName)
				AddText(sceneId,"Chu b� xong ch遖?")
				AddMoneyBonus( sceneId, x210222_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x210222_g_ScriptId,x210222_g_MissionId)
		elseif bDone==1 then					--任务已经完成
			BeginEvent(sceneId)
				AddText(sceneId,x210222_g_MissionName)
				AddText(sceneId,x210222_g_MissionComplete)
				--AddText(sceneId,"你将 餴琺到: ")
				--AddMoneyBonus(sceneId,x210222_g_MoneyBonus)
			EndEvent( )
			DispatchMissionDemandInfo(sceneId,selfId,targetId,x210222_g_ScriptId,x210222_g_MissionId,bDone)
		end
    elseif x210222_CheckAccept(sceneId,selfId) > 0 then		--没有任务,Th鯽 m鉵任务接收条件
		--发送任务Ti猵 th毕允総o� 鸬 信息
		BeginEvent(sceneId)
			AddText(sceneId,x210222_g_MissionName)
			AddText(sceneId,x210222_g_MissionInfo)
			--AddText(sceneId,"M鴆 ti陁 nhi甿 v�: ")
			--AddText(sceneId,x210222_g_MissionTarget)
			--AddText(sceneId,"你将 餴琺到: ")
			--AddMoneyBonus(sceneId,x210222_g_MoneyBonus)
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x210222_g_ScriptId,x210222_g_MissionId)
    end
end

--**********************************
--列举事件
--**********************************
function x210222_OnEnumerate( sceneId, selfId, targetId )
	if IsMissionHaveDone(sceneId,selfId,x210222_g_MissionId) > 0 then
		return
	end
	--如果已接此任务
	if IsHaveMission(sceneId,selfId,x210222_g_MissionId) > 0 then
		AddNumText(sceneId, x210222_g_ScriptId,x210222_g_MissionName,2,-1);
	--Th鯽 m鉵任务接收条件
    elseif x210222_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x210222_g_ScriptId,x210222_g_MissionName,1,-1);
    end
end

--**********************************
--检测Ti猵 th跫�
--**********************************
function x210222_CheckAccept( sceneId, selfId )
	if IsHaveMission(sceneId,selfId,x210222_g_MissionIdPre) <= 0    then
		return 0
	end

	local petcount = LuaFnGetPetCount(sceneId, selfId) --取 餴琺宠物数量
	for	i=0,petcount-1 do
		petdataid = LuaFnGetPet_DataID(sceneId, selfId, i) --取 餴琺宠物编号
		if petdataid==x210222_g_PetDataID then
			return	0
		end
	end

	return 1
end

--**********************************
--Ti猵 th�
--**********************************
function x210222_OnAccept( sceneId, selfId )

	local selfguid = LuaFnGetGUID( sceneId, selfId)

	if( IsHaveMission(sceneId,selfId,x210222_g_MissionId) > 0)  then	--已经有任务to� 鸬 
		misIndex = GetMissionIndexByID(sceneId,selfId,x210222_g_MissionId)
		copysceneid = GetMissionParam( sceneId, selfId, misIndex, x210222_g_Param_sceneid)
		saveguid = GetMissionParam( sceneId, selfId, misIndex, x210222_g_Param_guid)

		if copysceneid>=0 and selfguid==saveguid then --进过副本
			--将自己传送到副本场景
			if IsCanEnterCopyScene( copysceneid, GetHumanGUID( sceneId, selfId ) ) == 1 then
				NewWorld( sceneId, selfId, copysceneid, x210222_g_Fuben_X, x210222_g_Fuben_Z )
			else
				x210222_NotifyFailTips( sceneId, selfId, "B鋘 Th阭 疸 痼ng, Xin sau khi b� nhi甿 v� n鄖 h銀 nh l読 nhi甿 v�" )
			end
		else
			x210222_NotifyFailTips( sceneId, selfId, "H銀 nh l読 nhi甿 v� n鄖" )
		end
	else
		--加入任务到玩家列表
		if x210222_CheckAccept(sceneId,selfId) <= 0 then	--判断接收条件
			return 0
		end

		--给每c醝队伍成员加入任务
		AddMission( sceneId, selfId, x210222_g_MissionId, x210222_g_ScriptId, 0, 0, 0 )

		misIndex = GetMissionIndexByID( sceneId, selfId, x210222_g_MissionId )

		--将任务to� 鸬 第1号数据设置为0,表示未完成to� 鸬 任务
		SetMissionByIndex(sceneId,selfId,misIndex,x210222_g_IsMissionOkFail,0)

		--将任务to� 鸬 第2号数据设置为-1, 用于保存副本to� 鸬 场景号
		SetMissionByIndex(sceneId,selfId,misIndex,x210222_g_Param_sceneid,-1)

		--将任务to� 鸬 第3号数据队伍号
		SetMissionByIndex(sceneId,selfId,misIndex,x210222_g_Param_guid,selfguid)
		Msg2Player( sceneId, selfId,"#YNh nhi甿 v�#W: H hoa vi阯",MSG2PLAYER_PARA )
		CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, x210222_g_SignPost.x, x210222_g_SignPost.z, x210222_g_SignPost.tip )
		x210222_MakeCopyScene( sceneId, selfId, 0 )
	end
end

--**********************************
--放弃
--**********************************
function x210222_OnAbandon( sceneId, selfId )
	misIndex = GetMissionIndexByID(sceneId,selfId,x210222_g_MissionId)
	local copyscene = GetMissionParam( sceneId, selfId, misIndex, x210222_g_Param_sceneid)
	--删除玩家任务列表中对应to� 鸬 任务
    DelMission( sceneId, selfId, x210222_g_MissionId )

	if sceneId==copyscene then --如果T読 副本里删除任务,则直接传送回
		BeginEvent(sceneId)
			AddText(sceneId,"C醕 h� k猼 th鷆 cu礳 th醡 hi琺 H hoa vi阯, h銀 quay v� th鄋h 姓i L�!");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)

		oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3) ;--取 餴琺副本入口场景号

		NewWorld( sceneId, selfId, oldsceneId, x210222_g_Back_X, x210222_g_Back_Z )
	end
end

--**********************************
--创建副本
--**********************************
function x210222_MakeCopyScene( sceneId, selfId, nearmembercount )

	leaderguid=LuaFnObjId2Guid(sceneId,selfId)
	LuaFnSetSceneLoad_Map(sceneId, x210222_g_CopySceneMap); --地图喧ng必须选取to� 鸬 ,而且必须T読 Config/SceneInfo.ini里配置好
	LuaFnSetCopySceneData_TeamLeader(sceneId, leaderguid);
	LuaFnSetCopySceneData_NoUserCloseTime(sceneId, x210222_g_NoUserTime*1000);
	LuaFnSetCopySceneData_Timer(sceneId, x210222_g_TickTime*1000);
	LuaFnSetCopySceneData_Param(sceneId, 0, x210222_g_CopySceneType);--设置副本数据,这里将0号索引to� 鸬 数据设置为999,用于表示副本号999(数字自定义)
	LuaFnSetCopySceneData_Param(sceneId, 1, x210222_g_ScriptId);--将1号数据设置为副本场景事件脚本号
	LuaFnSetCopySceneData_Param(sceneId, 2, 0);--设置定时器调用次数
	LuaFnSetCopySceneData_Param(sceneId, 3, -1);--设置副本入口场景号, 初始化
	LuaFnSetCopySceneData_Param(sceneId, 4, 0);--设置副本关闭标志, 0开放,1关闭
	LuaFnSetCopySceneData_Param(sceneId, 5, 0);--设置离开倒计时次数
	LuaFnSetCopySceneData_Param(sceneId, 6, leaderguid); --保存玩家号
	LuaFnSetCopySceneData_Param(sceneId, 7, 0) ;--杀死Bossto� 鸬 数量
	LuaFnSetSceneLoad_Monster(sceneId, x210222_g_CopySceneMonster)	--7c后花园捉宠副本

	local bRetSceneID = LuaFnCreateCopyScene(sceneId); --初始化完成后调用创建副本函数
	BeginEvent(sceneId)
		if bRetSceneID>0 then
			AddText(sceneId,"D竎h chuy琻 th鄋h c鬾g!");
		else
			AddText(sceneId,"S� l唼ng b鋘 sao 疸 皙n gi緄 h課, 皤 ngh� l醫 n鎍 th� l読!");
			--删除玩家任务列表中对应to� 鸬 任务
			DelMission( sceneId, selfId, x210222_g_MissionId )
		end
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)

end

--**********************************
--继续
--**********************************
function x210222_OnContinue( sceneId, selfId, targetId )

	misIndex = GetMissionIndexByID(sceneId,selfId,x210222_g_MissionId)
	if	GetMissionParam( sceneId, selfId, misIndex, x210222_g_Param_sceneid)>=1	then
		BeginEvent(sceneId)
			AddText(sceneId,x210222_g_MissionComplete);
		EndEvent(sceneId)
		DispatchMissionContinueInfo(sceneId, selfId, targetId, x210222_g_ScriptId, x210222_g_MissionId)
	end

end

--**********************************
--检测喧ng否可以提交
--**********************************
function x210222_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x210222_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

--判断任务喧ng否已经完成
	misIndex = GetMissionIndexByID(sceneId,selfId,x210222_g_MissionId)
	if	GetMissionParam( sceneId, selfId, misIndex, x210222_g_IsMissionOkFail)>=1 then
		return	1
	else
		return	0
	end
	return 0
end

--**********************************
--提交
--**********************************
function x210222_OnSubmit( sceneId, selfId, targetId, selectRadioId )

	if x210222_CheckSubmit( sceneId, selfId, selectRadioId )>0 then		-- 已经Ho鄋 t nhi甿 v�
		--添加任务奖励
		money = x210222_g_MoneyBonus									-- *iDayHuan
		AddMoney(sceneId,selfId,money );

		BeginEvent(sceneId)
	  		AddText(sceneId,"Nhi甿 v� ho鄋 th鄋h")
	  	EndEvent(sceneId)
	  	DispatchMissionTips(sceneId,selfId)

		--设置任务已经被完成过
		DelMission( sceneId, selfId, x210222_g_MissionId )
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x210222_OnKillObject( sceneId, selfId, objdataId, objId )
end

--**********************************
--进入区域事件
--**********************************
function x210222_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x210222_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--副本事件
--**********************************
function x210222_OnCopySceneReady( sceneId, destsceneId )

	LuaFnSetCopySceneData_Param(destsceneId, 3, sceneId);--设置副本入口场景号
	leaderguid  = LuaFnGetCopySceneData_TeamLeader(destsceneId) ;
	leaderObjId = LuaFnGuid2ObjId(sceneId,leaderguid);

	if LuaFnIsCanDoScriptLogic( sceneId, leaderObjId ) == 1 then			-- 处于可以执行逻辑to� 鸬 状态
		if IsHaveMission( sceneId, leaderObjId, x210222_g_MissionId ) > 0 then
			misIndex = GetMissionIndexByID( sceneId, leaderObjId, x210222_g_MissionId )

			--将任务to� 鸬 第2号数据设置为副本to� 鸬 场景号
			SetMissionByIndex( sceneId, leaderObjId, misIndex, x210222_g_Param_sceneid, destsceneId )

			NewWorld( sceneId, leaderObjId, destsceneId, x210222_g_Fuben_X, x210222_g_Fuben_Z )
		else
			x210222_NotifyFailTips( sceneId, leaderObjId, "C醕 h� 疸 kh鬾g nh nhi甿 v� n鄖 t� tr呔c" )
		end
	end
end

--**********************************
--有玩家进入副本事件
--**********************************
function x210222_OnPlayerEnter( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x210222_g_MissionId ) == 0 then				--如果进入副本前删除任务,则直接传送回
		x210222_NotifyFailTips( sceneId, selfId, "C醕 h� hi畁 ch遖 nh nhi甿 v� n鄖, h銀 quay v� th鄋h 姓i L�!" )
		local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )		--取 餴琺副本入口场景号
		NewWorld( sceneId, selfId, oldsceneId, x210222_g_Back_X, x210222_g_Back_Z )
		return
	end

	--设� gi鈟劳龊蟾椿� 餴琺位置
	SetPlayerDefaultReliveInfo( sceneId, selfId, "%10", -1, "0", sceneId, x210222_g_Fuben_X, x210222_g_Fuben_Z );
end

--**********************************
--有玩家T読 副本中死亡事件
--**********************************
function x210222_OnHumanDie( sceneId, selfId, killerId )
end

--**********************************
--副本场景定时器事件
--**********************************
function x210222_OnCopySceneTimer( sceneId, nowTime )

	--副本时钟读取及设置
	TickCount = LuaFnGetCopySceneData_Param(sceneId, 2) ;--取 餴琺已经执行to� 鸬 定时次数
	TickCount = TickCount+1 ;
	LuaFnSetCopySceneData_Param(sceneId, 2, TickCount);--设置新to� 鸬 定时器调用次数

	--副本关闭标志
	leaveFlag = LuaFnGetCopySceneData_Param(sceneId, 4) ;

	if leaveFlag == 1 then --C 离开

		--离开倒计时间to� 鸬 读取和设置
		leaveTickCount = LuaFnGetCopySceneData_Param(sceneId, 5) ;
		leaveTickCount = leaveTickCount+1 ;
		LuaFnSetCopySceneData_Param(sceneId, 5, leaveTickCount) ;

		if leaveTickCount == x210222_g_CloseTick then --倒计时间到,大家都出去吧

			oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3) ;--取 餴琺副本入口场景号

			--将当前副本场景里to� 鸬 所有人传送回原来进入时候to� 鸬 场景
			local membercount = LuaFnGetCopyScene_HumanCount(sceneId)
			local mems = {}
			for	i=0,membercount-1 do
				mems[i] = LuaFnGetCopyScene_HumanObjId(sceneId,i)
				NewWorld( sceneId, mems[i], oldsceneId, x210222_g_Back_X, x210222_g_Back_Z )
			end

		elseif leaveTickCount<x210222_g_CloseTick then

			oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3) ;--取 餴琺副本入口场景号

			--通知当前副本场景里to� 鸬 所有人,场景关闭倒计时间
			local membercount = LuaFnGetCopyScene_HumanCount(sceneId)
			local mems = {}
	  		local strText = format("C醕 h� s� r秈 kh鰅 疴y sau %d gi鈟!", (x210222_g_CloseTick-leaveTickCount)*x210222_g_TickTime )
			for	i=0,membercount-1 do
				mems[i] = LuaFnGetCopyScene_HumanObjId(sceneId,i)
	  			BeginEvent(sceneId)
	  				AddText(sceneId,strText);
	  			EndEvent(sceneId)
	  			DispatchMissionTips(sceneId,mems[i])
			end
		end
	elseif TickCount == x210222_g_LimitTotalHoldTime then --副本总时间限制到了
		--此处设置副本任务有时间限制to� 鸬 情况,当时间到后处理...
		local membercount = LuaFnGetCopyScene_HumanCount(sceneId)
		local mems = {}
		for	i=0,membercount-1 do
			mems[i] = LuaFnGetCopyScene_HumanObjId(sceneId,i)
			DelMission( sceneId, mems[i], x210222_g_MissionId );--任务th b読,删除之

  			BeginEvent(sceneId)
  				AddText(sceneId,"Nhi甿 v� th b読, qu� gi�!");
  			EndEvent(sceneId)
  			DispatchMissionTips(sceneId,mems[i])
		end

		--设置副本关闭标志
		LuaFnSetCopySceneData_Param(sceneId, 4, 1) ;
	end
end

function x210222_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent(sceneId)
		AddText(sceneId, Tip)
	EndEvent(sceneId)
	DispatchMissionTips(sceneId, selfId)
end
