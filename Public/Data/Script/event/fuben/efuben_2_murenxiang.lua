--副本任务
--M礳 Nh鈔

--************************************************************************
--MisDescBegin

--脚本号
x401010_g_ScriptId = 401010

--副本名称
x401010_g_CopySceneName="M礳 nh鈔 c鋘g"

--任务号
x401010_g_MissionId = 1054

--目标NPC
x401010_g_Name = "M礳 Nh鈔"

--喧ng否喧ngTinh英任务
x401010_g_IfMissionElite = 1

--任务归类
x401010_g_MissionKind = 1

--********下面几项喧ng动态显示to� 鸬 内容,用于T読 任务列表中动态显示任务情况******
--循环任务to� 鸬 数据索引,里面存着已做to� 鸬 环数 MD_MURENXIANG_HUAN
x401010_g_MissionRound = 9
--**********************************以上喧ng动态****************************

--任务文本描述
x401010_g_MissionName="M礳 nh鈔 c鋘g"
x401010_g_MissionInfo="Gi猼 h猼 to鄋 b� qu醝 v, 1 con c鹡g kh鬾g tha!"  --任务描述
x401010_g_MissionTarget="Gi猼 h猼 to鄋 b� qu醝 v"	--M鴆 ti陁 nhi甿 v�
x401010_g_ContinueInfo="C醕 h� ph鋓 ti猵 t鴆 c� gg nh�!"	--未Ho鄋 t nhi甿 v鴗o� 鸬 npc对话
x401010_g_MissionComplete="C醕 h� ph鋓 ti猵 t鴆 c� gg nh�!"	--Ho鄋 t nhi甿 v鴑pc说话to� 鸬 话


--任务奖励
x401010_g_MoneyBonus=8888

--MisDescEnd
--************************************************************************

--角色Mission变量� 餴琺�
x401010_g_Param_huan		=0	--0号: 已经完成to� 鸬 环数,T読 接收任务时候赋值
x401010_g_Param_ok			=1	--1号: 当前任务喧ng否完成(0未完成；1完成)
x401010_g_Param_sceneid		=2	--2号: 当前副本任务to� 鸬 场景号
x401010_g_Param_teamid		=3	--3号: 接副本任务时候to� 鸬 队伍号
x401010_g_Param_killcount	=4	--4号: 杀死任务怪to� 鸬 数量
x401010_g_Param_time		=5	--5号: 完成副本所用时间(单位:  gi鈟)
--6号: 未用
--7号: 未用

x401010_g_CopySceneType=FUBEN_EXAMPLE	--副本类型,定义T読 ScriptGlobal.lua里面
x401010_g_LimitMembers=3			--可以进副本to� 鸬 最小队伍人数
x401010_g_TickTime=5				--回调脚本to� 鸬 时钟时间(单位:  gi鈟/次)
x401010_g_LimitTotalHoldTime=360	--副本可以存活to� 鸬 时间(单位: 次数),如果此时间到了,则任务将会th b読
x401010_g_LimitTimeSuccess=500		--副本时间限制(单位: 次数),如果此时间到了,任务完成
x401010_g_CloseTick=6				--副本关闭前倒计时(单位: 次数)
x401010_g_NoUserTime=300			--副本中没有人后可以继续保存to� 鸬 时间(单位:  gi鈟)
x401010_g_DeadTrans=0				--死亡转移模式,0: 死亡后还可以继续T読 副本,1: 死亡后被强制移出副本
x401010_g_Fuben_X=23				--进入副本to� 鸬 位置X
x401010_g_Fuben_Z=23				--进入副本to� 鸬 位置Z
x401010_g_Back_X=125				--源场景位置X
x401010_g_Back_Z=61					--源场景位置Z
x401010_g_TotalNeedKill=10			--C 杀死怪物数量

--**********************************
--任务入口函数
--**********************************
function x401010_OnDefaultEvent( sceneId, selfId, targetId )
	if( IsHaveMission(sceneId,selfId,x401010_g_MissionId) > 0)  then	--如果玩家已经接了C醝 n鄖 任务
		misIndex = GetMissionIndexByID(sceneId,selfId,x401010_g_MissionId)
		bDone = x401010_CheckSubmit( sceneId, selfId )
		if bDone==0 then						--任务未完成
			BeginEvent(sceneId)
				AddText(sceneId,x401010_g_MissionName)
				AddText(sceneId,"Chu b� xong ch遖?")
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x401010_g_ScriptId,x401010_g_MissionId)
		elseif bDone==1 then					--任务已经完成
			BeginEvent(sceneId)
				AddText(sceneId,x401010_g_MissionName)
				AddText(sceneId,x401010_g_MissionComplete)
				AddText(sceneId,"C醕 h� s� nh 疬㧟: ")
				AddMoneyBonus(sceneId,x401010_g_MoneyBonus)
			EndEvent( )
			DispatchMissionDemandInfo(sceneId,selfId,targetId,x401010_g_ScriptId,x401010_g_MissionId,bDone)
		end
    elseif x401010_CheckAccept(sceneId,selfId) > 0 then		--没有任务,Th鯽 m鉵任务接收条件
		--发送任务Ti猵 th毕允総o� 鸬 信息
		BeginEvent(sceneId)
			AddText(sceneId,x401010_g_MissionName)
			AddText(sceneId,x401010_g_MissionInfo)
			AddText(sceneId,"M鴆 ti陁 nhi甿 v�: ")
			AddText(sceneId,x401010_g_MissionTarget)
			AddText(sceneId,"C醕 h� s� nh 疬㧟: ")
			AddMoneyBonus(sceneId,x401010_g_MoneyBonus)
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x401010_g_ScriptId,x401010_g_MissionId)
    end
end

--**********************************
--列举事件
--**********************************
function x401010_OnEnumerate( sceneId, selfId, targetId )
	--如果已接此任务
	if IsHaveMission(sceneId,selfId,x401010_g_MissionId) > 0 then
		AddNumText(sceneId, x401010_g_ScriptId,x401010_g_MissionName,3,-1);
	--Th鯽 m鉵任务接收条件
    elseif x401010_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x401010_g_ScriptId,x401010_g_MissionName,4,-1);
    end
end

--**********************************
--检测Ti猵 th跫�
--**********************************
function x401010_CheckTeamLeader( sceneId, selfId )
	if	GetTeamId( sceneId, selfId)<0	then	--判断喧ng否有队伍
		BeginEvent(sceneId)
	  		AddText(sceneId,"C醕 h� ph鋓 gia nh v鄌 m祎 鸬i ng�");
	  	EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return	0
	end
	--取 餴琺玩家附近to� 鸬 队友数量(包括自己)
	local	nearteammembercount = GetNearTeamCount( sceneId, selfId) 
	
	if	nearteammembercount<x401010_g_LimitMembers	then
		BeginEvent(sceneId)
	  		AddText(sceneId,"S� ng叨i trong 鸬i ng� c黙 c醕 h� kh鬾g 瘘");
	  	EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return	 0
	end
	
	if	LuaFnIsTeamLeader( sceneId, selfId)==0	then	--只有队长才能接任务
		BeginEvent(sceneId)
	  		AddText(sceneId,"Ng叨i kh鬾g ph鋓 l� nh髆 tr叻ng");
	  	EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return	 0
	end
	
	return nearteammembercount
end

--**********************************
--检测Ti猵 th跫�
--**********************************
function x401010_CheckAccept( sceneId, selfId )
	if	GetTeamId( sceneId, selfId)<0	then	--判断喧ng否有队伍
		BeginEvent(sceneId)
	  		AddText(sceneId,"C醕 h� ph鋓 gia nh v鄌 m祎 鸬i ng�");
	  	EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return	0
	end
	
	--取 餴琺玩家附近to� 鸬 队友数量(包括自己)
	local	nearteammembercount = GetNearTeamCount( sceneId, selfId) 

	if	nearteammembercount<x401010_g_LimitMembers	then
		BeginEvent(sceneId)
	  		AddText(sceneId,"S� ng叨i trong 鸬i ng� c黙 c醕 h� kh鬾g 瘘");
	  	EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return	 0
	end
	
	if	LuaFnIsTeamLeader( sceneId, selfId)==0	then	--只有队长才能接任务
		BeginEvent(sceneId)
	  		AddText(sceneId,"Ng叨i kh鬾g ph鋓 l� nh髆 tr叻ng");
	  	EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return	 0
	end
	
	--检测小队中喧ng否有人任务记录已满, 队友喧ng否已经接过此任务
	local mems = {}
	for	i=0,nearteammembercount-1 do
		mems[i] = GetNearTeamMember(sceneId, selfId, i)
		if GetMissionCount( sceneId, mems[i]) >= 20 then	--队友身上任务数量喧ng否达到上限20c醝
			BeginEvent(sceneId)
				AddText(sceneId,"Ghi ch閜 nhi甿 v� c黙 ng叨i trong 鸬i ng� 疸 馥y");
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return 0
		elseif IsHaveMission(sceneId,mems[i],x401010_g_MissionId)>0 then
			--队友喧ng否已经接过此任务或者另外m祎 c醝任务
			BeginEvent(sceneId)
				AddText(sceneId,"Trong 鸬i 疸 c� ng叨i nh nhi甿 v� n鄖");
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return 0
		end
	end
	
	return	1
end

--**********************************
--Ti猵 th�
--**********************************
function x401010_OnAccept( sceneId, selfId )
	
	local teamid = GetTeamId( sceneId, selfId)
	
	if( IsHaveMission(sceneId,selfId,x401010_g_MissionId) > 0)  then	--已经有任务to� 鸬 
		misIndex = GetMissionIndexByID(sceneId,selfId,x401010_g_MissionId)
		copysceneid = GetMissionParam( sceneId, selfId, misIndex, x401010_g_Param_sceneid)
		saveteamid = GetMissionParam( sceneId, selfId, misIndex, x401010_g_Param_teamid)
		
		if copysceneid>=0 and teamid==saveteamid then --进过副本
			--将自己传送到副本场景
			NewWorld( sceneId, selfId, copysceneid, x401010_g_Fuben_X, x401010_g_Fuben_Z) ;
		else
			BeginEvent(sceneId)
				AddText(sceneId,"衖玼 ki畁 kh鬾g ph� h䅟");
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
	else
		--加入任务到玩家列表
		if x401010_CheckAccept(sceneId,selfId) <= 0 then	--判断接收条件
			return 0
		end

		--取 餴琺玩家附近to� 鸬 队友数量(包括自己)
		local	nearteammembercount = GetNearTeamCount( sceneId, selfId) 
		local mems = {}
		for	i=0,nearteammembercount-1 do
			mems[i] = GetNearTeamMember(sceneId, selfId, i)
			--给每c醝队伍成员加入任务
			AddMission( sceneId, mems[i], x401010_g_MissionId, x401010_g_ScriptId, 1, 0, 0 )
			
			misIndex = GetMissionIndexByID( sceneId, mems[i], x401010_g_MissionId )
			
			local huan = GetMissionData(sceneId,selfId,MD_MURENXIANG_HUAN)
			
			--将任务to� 鸬 第0号数据设置为已经完成to� 鸬 
			SetMissionByIndex(sceneId,mems[i],misIndex,x401010_g_Param_huan,huan)
			
			--将任务to� 鸬 第1号数据设置为0,表示未完成to� 鸬 任务
			SetMissionByIndex(sceneId,mems[i],misIndex,x401010_g_Param_ok,0)
			
			--将任务to� 鸬 第2号数据设置为-1, 用于保存副本to� 鸬 场景号
			SetMissionByIndex(sceneId,mems[i],misIndex,x401010_g_Param_sceneid,-1)

			--将任务to� 鸬 第3号数据队伍号
			SetMissionByIndex(sceneId,mems[i],misIndex,x401010_g_Param_teamid,teamid)
		end
		
		x401010_MakeCopyScene( sceneId, selfId, nearteammembercount ) ;
	end
end

--**********************************
--放弃
--**********************************
function x401010_OnAbandon( sceneId, selfId )

	misIndex = GetMissionIndexByID(sceneId,selfId,x401010_g_MissionId)
	local copyscene = GetMissionParam( sceneId, selfId, misIndex, x401010_g_Param_sceneid)
	
	--删除玩家任务列表中对应to� 鸬 任务
    DelMission( sceneId, selfId, x401010_g_MissionId )
	
	if sceneId==copyscene then --如果T読 副本里删除任务,则直接传送回
		BeginEvent(sceneId)
			AddText(sceneId,"Nhi甿 v� th b読!");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		
		oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3) ;--取 餴琺副本入口场景号
		
		NewWorld( sceneId, selfId, oldsceneId, x401010_g_Back_X, x401010_g_Back_Z )
	end
end

--**********************************
--创建副本
--**********************************
function x401010_MakeCopyScene( sceneId, selfId, nearmembercount )

	local mems = {}
	mylevel = 0 
	for	i=0,nearmembercount-1 do
		mems[i] = GetNearTeamMember(sceneId, selfId, i)
		mylevel = mylevel+GetLevel(sceneId,mems[i])
	end
	mylevel = mylevel/nearmembercount
	
	leaderguid=LuaFnObjId2Guid(sceneId,selfId)
	LuaFnSetSceneLoad_Map(sceneId, "xingxiu.nav"); --地图喧ng必须选取to� 鸬 ,而且必须T読 Config/SceneInfo.ini里配置好
	LuaFnSetCopySceneData_TeamLeader(sceneId, leaderguid);
	LuaFnSetCopySceneData_NoUserCloseTime(sceneId, x401010_g_NoUserTime*1000);
	LuaFnSetCopySceneData_Timer(sceneId, x401010_g_TickTime*1000);
	LuaFnSetCopySceneData_Param(sceneId, 0, x401010_g_CopySceneType);--设置副本数据,这里将0号索引to� 鸬 数据设置为999,用于表示副本号999(数字自定义)
	LuaFnSetCopySceneData_Param(sceneId, 1, x401010_g_ScriptId);--将1号数据设置为副本场景事件脚本号
	LuaFnSetCopySceneData_Param(sceneId, 2, 0);--设置定时器调用次数
	LuaFnSetCopySceneData_Param(sceneId, 3, -1);--设置副本入口场景号, 初始化
	LuaFnSetCopySceneData_Param(sceneId, 4, 0);--设置副本关闭标志, 0开放,1关闭
	LuaFnSetCopySceneData_Param(sceneId, 5, 0);--设置离开倒计时次数
	LuaFnSetCopySceneData_Param(sceneId, 6, GetTeamId(sceneId,selfId)); --保存队伍号
	LuaFnSetCopySceneData_Param(sceneId, 7, 0) ;--杀死Bossto� 鸬 数量
	
	if	mylevel<=10	 then
		LuaFnSetSceneLoad_Monster(sceneId, "murenxiang_monster_10.ini")
	elseif	mylevel<=20	 then
		LuaFnSetSceneLoad_Monster(sceneId, "murenxiang_monster_20.ini")
	elseif	mylevel<=30	 then
		LuaFnSetSceneLoad_Monster(sceneId, "murenxiang_monster_30.ini")
	elseif	mylevel<=40	 then
		LuaFnSetSceneLoad_Monster(sceneId, "murenxiang_monster_40.ini")
	elseif	mylevel<=50	 then
		LuaFnSetSceneLoad_Monster(sceneId, "murenxiang_monster_50.ini")
	elseif	mylevel<=60	 then
		LuaFnSetSceneLoad_Monster(sceneId, "murenxiang_monster_60.ini")
	elseif	mylevel<=70	 then
		LuaFnSetSceneLoad_Monster(sceneId, "murenxiang_monster_70.ini")
	elseif	mylevel<=80	 then
		LuaFnSetSceneLoad_Monster(sceneId, "murenxiang_monster_80.ini")
	elseif	mylevel<=90	 then
		LuaFnSetSceneLoad_Monster(sceneId, "murenxiang_monster_90.ini")
	elseif	mylevel<=100	 then
		LuaFnSetSceneLoad_Monster(sceneId, "murenxiang_monster_100.ini")
	elseif	mylevel<=110	 then
		LuaFnSetSceneLoad_Monster(sceneId, "murenxiang_monster_110.ini")
	elseif	mylevel<=120	 then
		LuaFnSetSceneLoad_Monster(sceneId, "murenxiang_monster_120.ini")
	elseif	mylevel<=130	 then
		LuaFnSetSceneLoad_Monster(sceneId, "murenxiang_monster_130.ini")
	elseif	mylevel<=140	 then
		LuaFnSetSceneLoad_Monster(sceneId, "murenxiang_monster_140.ini")
	elseif	mylevel<=150	 then
		LuaFnSetSceneLoad_Monster(sceneId, "murenxiang_monster_150.ini")
	elseif	mylevel<=160	 then
		LuaFnSetSceneLoad_Monster(sceneId, "murenxiang_monster_160.ini")
	elseif	mylevel<=170	 then
		LuaFnSetSceneLoad_Monster(sceneId, "murenxiang_monster_170.ini")
	elseif	mylevel<=180	 then
		LuaFnSetSceneLoad_Monster(sceneId, "murenxiang_monster_180.ini")
	elseif	mylevel<=190	 then
		LuaFnSetSceneLoad_Monster(sceneId, "murenxiang_monster_190.ini")
	elseif	mylevel<=200	 then
		LuaFnSetSceneLoad_Monster(sceneId, "murenxiang_monster_200.ini")
	end	
	

	local bRetSceneID = LuaFnCreateCopyScene(sceneId); --初始化完成后调用创建副本函数
	BeginEvent(sceneId)
		if bRetSceneID>0 then
			AddText(sceneId,"D竎h chuy琻 th鄋h c鬾g!");
		else
			AddText(sceneId,"S� l唼ng b鋘 sao 疸 皙n gi緄 h課, 皤 ngh� l醫 n鎍 th� l読!");
			--删除玩家任务列表中对应to� 鸬 任务
			DelMission( sceneId, selfId, x401010_g_MissionId )
		end
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	
end

--**********************************
--继续
--**********************************
function x401010_OnContinue( sceneId, selfId, targetId )

	misIndex = GetMissionIndexByID(sceneId,selfId,x401010_g_MissionId)
	if	GetMissionParam( sceneId, selfId, misIndex, x401010_g_Param_sceneid)>=1	then
		DispatchMissionContinueInfo(sceneId, selfId, targetId, x401010_g_ScriptId, x401010_g_MissionId)
	end

end

--**********************************
--检测喧ng否可以提交
--**********************************
function x401010_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x401010_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

--判断任务喧ng否已经完成
	misIndex = GetMissionIndexByID(sceneId,selfId,x401010_g_MissionId)
	if	GetMissionParam( sceneId, selfId, misIndex, x401010_g_Param_ok)>=1 then 
		return	1
	else
		return	0
	end
end

--**********************************
--提交
--**********************************
function x401010_OnSubmit( sceneId, selfId, targetId, selectRadioId )

	if x401010_CheckSubmit( sceneId, selfId, selectRadioId )>0 then		--已经Ho鄋 t nhi甿 v�
	
		local	iHuan=GetMissionData(sceneId,selfId,MD_MURENXIANG_HUAN)	--取 餴琺总共做过to� 鸬 环数
		iHuan=iHuan+1
		local iDayCount=GetMissionData(sceneId,selfId,MD_MURENXIANG_DAYCOUNT)
		local iDayTime = mod(iDayCount,100000)	--上m祎 次交任务to� 鸬 时间
		local iDayHuan = floor(iDayCount/100000) --当天内完成to� 鸬 任务环数
		
		local CurDaytime = GetDayTime()
		
		if CurDaytime==iDayTime then --上次Ho鄋 t nhi甿 v鷑g同m祎 天内
			iDayHuan = iDayHuan+1
		else
			iDayTime = CurDaytime
			iDayHuan = 1
		end
		iDayCount = iDayHuan*100000+iDayTime
		
		--添加任务奖励
		money = 100*iDayHuan
		AddMoney(sceneId,selfId,money );
		
		--设置循环任务to� 鸬 环数
		SetMissionData(sceneId,selfId,MD_MURENXIANG_HUAN,iHuan)
		SetMissionData(sceneId,selfId,MD_MURENXIANG_DAYCOUNT,iDayCount)
		
		BeginEvent(sceneId)
			strText_M = format("Ng呓i 疸 餺誸 疬㧟 %d ng鈔 l唼ng",money)
	  		strText = format("Nhi甿 v� ho鄋 th鄋h, hi畁 餫ng l� v騨g th� %d",iDayHuan)
	  		AddText(sceneId,strText);
	  		AddText(sceneId,strText_M);
	  	EndEvent(sceneId)
	  	DispatchMissionTips(sceneId,selfId)
	  	
		--设置任务已经被完成过
		DelMission( sceneId,selfId,  x401010_g_MissionId )
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x401010_OnKillObject( sceneId, selfId, objdataId ,objId )

	--喧ng否喧ng副本
	sceneType = LuaFnGetSceneType(sceneId) ;
	if sceneType~=1 then
		return
	end 
	--喧ng否喧ng所C to� 鸬 副本
	fubentype = LuaFnGetCopySceneData_Param(sceneId,0)
	if fubentype~=x401010_g_CopySceneType then
		return
	end
	--副本关闭标志
	leaveFlag = LuaFnGetCopySceneData_Param(sceneId, 4) ;
	if 	leaveFlag==1 then --如果副本已经被置成关闭状态,则杀怪无效
		return 
	end
	
	--取 餴琺当前场景里to� 鸬 人数
	num = LuaFnGetCopyScene_HumanCount(sceneId)
	
	killednumber = LuaFnGetCopySceneData_Param(sceneId, 7) ;--杀死怪to� 鸬 数量
	killednumber = killednumber+1
	LuaFnSetCopySceneData_Param(sceneId, 7, killednumber) ;--设置杀死怪to� 鸬 数量
	
	if killednumber<x401010_g_TotalNeedKill then

		BeginEvent(sceneId)
			strText = format("秀 gi猼 %d/%d", killednumber, x401010_g_TotalNeedKill )
			AddText(sceneId,strText);
		EndEvent(sceneId)

		for i=0,num-1 do
			humanObjId = LuaFnGetCopyScene_HumanObjId(sceneId,i)--取 餴琺当前场景里人to� 鸬 objId
			DispatchMissionTips(sceneId,humanObjId)
			
			misIndex = GetMissionIndexByID(sceneId,humanObjId,x401010_g_MissionId) --取 餴琺任务数据索引值
			local killedcount = GetMissionParam( sceneId, humanObjId, misIndex, x401010_g_Param_killcount) --取 餴琺已经杀了to� 鸬 怪物数
			killedcount = killedcount +1 ;
			SetMissionByIndex(sceneId,humanObjId,misIndex,x401010_g_Param_killcount,killedcount) --设置任务数据
		end
	elseif killednumber>=x401010_g_TotalNeedKill then
		--设置任务完成标志
		LuaFnSetCopySceneData_Param(sceneId, 4, 1)
		
		--取 餴琺已经执行to� 鸬 定时次数
		TickCount = LuaFnGetCopySceneData_Param(sceneId, 2) ;
		
		for i=0,num-1 do
			humanObjId = LuaFnGetCopyScene_HumanObjId(sceneId,i)	--取 餴琺当前场景里人to� 鸬 objId
			misIndex = GetMissionIndexByID(sceneId,humanObjId,x401010_g_MissionId)--取 餴琺任务数据索引值

			local killedcount = GetMissionParam( sceneId, humanObjId, misIndex, x401010_g_Param_killcount) --取 餴琺已经杀了to� 鸬 怪物数
			killedcount = killedcount +1 ;
			SetMissionByIndex(sceneId,humanObjId,misIndex,x401010_g_Param_killcount,killedcount) --设置任务数据
			
			--将任务to� 鸬 第1号数据设置为1,表示完成to� 鸬 任务
			SetMissionByIndex(sceneId,humanObjId,misIndex,x401010_g_Param_ok,1)--设置任务数据
			--完成副本所用时间
			SetMissionByIndex(sceneId,humanObjId,misIndex,x401010_g_Param_time,TickCount*x401010_g_TickTime)--设置任务数据

			BeginEvent(sceneId)
				strText = format("Nhi甿 v� ho鄋 th鄋h, sau %d gi鈟 s� chuy琻 t緄 v� tr� v鄌 c豠", x401010_g_CloseTick*x401010_g_TickTime )
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,humanObjId)
		end
	end
end

--**********************************
--进入区域事件
--**********************************
function x401010_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x401010_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--副本事件
--**********************************
function x401010_OnCopySceneReady( sceneId, destsceneId )

	LuaFnSetCopySceneData_Param(destsceneId, 3, sceneId);--设置副本入口场景号
	leaderguid  = LuaFnGetCopySceneData_TeamLeader(destsceneId) ;	
	leaderObjId = LuaFnGuid2ObjId(sceneId,leaderguid);

	--取 餴琺玩家附近to� 鸬 队友数量(包括自己)
	local	nearteammembercount = GetNearTeamCount( sceneId, leaderObjId) 
	local mems = {}
	for	i=0,nearteammembercount-1 do
		mems[i] = GetNearTeamMember(sceneId, leaderObjId, i)
		misIndex = GetMissionIndexByID(sceneId,mems[i],x401010_g_MissionId)
		
		--将任务to� 鸬 第2号数据设置为副本to� 鸬 场景号
		SetMissionByIndex(sceneId,mems[i],misIndex,x401010_g_Param_sceneid,destsceneId)
				
		NewWorld( sceneId, mems[i], destsceneId, x401010_g_Fuben_X, x401010_g_Fuben_Z) ;
	end
end

--**********************************
--有玩家进入副本事件
--**********************************
function x401010_OnPlayerEnter( sceneId, selfId )
	--设� gi鈟劳龊蟾椿� 餴琺位置
	SetPlayerDefaultReliveInfo( sceneId, selfId, "%10", -1, "0", sceneId, x401010_g_Fuben_X, x401010_g_Fuben_Z );
end

--**********************************
--有玩家T読 副本中死亡事件
--**********************************
function x401010_OnHumanDie( sceneId, selfId, killerId )
	if x401010_g_DeadTrans==1 then --死亡后C 被强制踢出场景
	
		misIndex = GetMissionIndexByID(sceneId,selfId,x401010_g_MissionId)--取 餴琺任务数据索引值
		
		--将任务to� 鸬 第1号数据设置为1,表示完成to� 鸬 任务
		SetMissionByIndex(sceneId,selfId,misIndex,x401010_g_Param_ok,1)--设置任务数据
		local TickCount = LuaFnGetCopySceneData_Param(sceneId, 2) ;--取 餴琺已经执行to� 鸬 定时次数
		--完成副本所用时间
		SetMissionByIndex(sceneId,selfId,misIndex,x401010_g_Param_time,TickCount*x401010_g_TickTime)--设置任务数据

		oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3) ;--取 餴琺副本入口场景号
		NewWorld( sceneId, selfId, oldsceneId, x401010_g_Back_X, x401010_g_Back_Z )
	end
end

--**********************************
--副本场景定时器事件
--**********************************
function x401010_OnCopySceneTimer( sceneId, nowTime )
	
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
		
		if leaveTickCount == x401010_g_CloseTick then --倒计时间到,大家都出去吧
		
			oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3) ;--取 餴琺副本入口场景号
			
			--将当前副本场景里to� 鸬 所有人传送回原来进入时候to� 鸬 场景
			local membercount = LuaFnGetCopyScene_HumanCount(sceneId)
			local mems = {}
			for	i=0,membercount-1 do
				mems[i] = LuaFnGetCopyScene_HumanObjId(sceneId,i)
				NewWorld( sceneId, mems[i], oldsceneId, x401010_g_Back_X, x401010_g_Back_Z )
			end
			
		elseif leaveTickCount<x401010_g_CloseTick then
		
			oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3) ;--取 餴琺副本入口场景号

			--通知当前副本场景里to� 鸬 所有人,场景关闭倒计时间
			local membercount = LuaFnGetCopyScene_HumanCount(sceneId)
			local mems = {}
			for	i=0,membercount-1 do
				mems[i] = LuaFnGetCopyScene_HumanObjId(sceneId,i)
	  			BeginEvent(sceneId)
	  				strText = format("C醕 h� s� r秈 kh鰅 疴y sau %d gi鈟!", (x401010_g_CloseTick-leaveTickCount)*x401010_g_TickTime )
	  				AddText(sceneId,strText);
	  			EndEvent(sceneId)
	  			DispatchMissionTips(sceneId,mems[i])
			end
		end
	elseif TickCount == x401010_g_LimitTimeSuccess then
		--此处设置有时间限制to� 鸬 任务完成处理
		local membercount = LuaFnGetCopyScene_HumanCount(sceneId)
		local mems = {}
		for	i=0,membercount-1 do
			mems[i] = LuaFnGetCopyScene_HumanObjId(sceneId,i)
			
  			BeginEvent(sceneId)
  				AddText(sceneId,"Th秈 gian ho鄋 t nhi甿 v� 疸 t緄, ho鄋 th鄋h!");
  			EndEvent(sceneId)
  			DispatchMissionTips(sceneId,mems[i])
  			
			misIndex = GetMissionIndexByID(sceneId,mems[i],x401010_g_MissionId)--取 餴琺任务数据索引值
			--将任务to� 鸬 第1号数据设置为1,表示完成to� 鸬 任务
			SetMissionByIndex(sceneId,mems[i],misIndex,x401010_g_Param_ok,1)--设置任务数据
			--完成副本所用时间
			SetMissionByIndex(sceneId,mems[i],misIndex,x401010_g_Param_time,TickCount*x401010_g_TickTime)--设置任务数据
		end

		--设置副本关闭标志
		LuaFnSetCopySceneData_Param(sceneId, 4, 1) ;
		
	elseif TickCount == x401010_g_LimitTotalHoldTime then --副本总时间限制到了
		--此处设置副本任务有时间限制to� 鸬 情况,当时间到后处理...
		local membercount = LuaFnGetCopyScene_HumanCount(sceneId)
		local mems = {}
		for	i=0,membercount-1 do
			mems[i] = LuaFnGetCopyScene_HumanObjId(sceneId,i)
			DelMission( sceneId, mems[i], x401010_g_MissionId );--任务th b読,删除之

  			BeginEvent(sceneId)
  				AddText(sceneId,"Nhi甿 v� th b読, qu� gi�!");
  			EndEvent(sceneId)
  			DispatchMissionTips(sceneId,mems[i])
		end

		--设置副本关闭标志
		LuaFnSetCopySceneData_Param(sceneId, 4, 1) ;
		
	else 
		--定时检查队伍成员to� 鸬 队伍号,如果不符合,则踢出副本
		local membercount = LuaFnGetCopyScene_HumanCount(sceneId)
		local mems = {}
		for	i=0,membercount-1 do
			mems[i] = LuaFnGetCopyScene_HumanObjId(sceneId,i)
			if IsHaveMission(sceneId,mems[i],x401010_g_MissionId) > 0 then
				oldteamid = LuaFnGetCopySceneData_Param(sceneId, 6) ; --取 餴琺保存to� 鸬 队伍号
				if oldteamid ~= GetTeamId(sceneId,mems[i]) then
				
					DelMission( sceneId, mems[i], x401010_g_MissionId );--任务th b読,删除之

  					BeginEvent(sceneId)
  						AddText(sceneId,"Nhi甿 v� th b読, ng呓i kh鬾g � trong 瘊ng nh髆");
  					EndEvent(sceneId)
  					DispatchMissionTips(sceneId,mems[i])
  					
 					oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3) ;--取 餴琺副本入口场景号
					NewWorld( sceneId, mems[i], oldsceneId, x401010_g_Back_X, x401010_g_Back_Z )
  				end
  			end
		end
		
	end
end

