--副本任务
--陈永仁引导副本

--************************************************************************
--MisDescBegin

--脚本号
x311005_g_ScriptId = 311005

--副本名称
x311005_g_CopySceneName="Chi阯g 鸢ng cong"

--任务号
x311005_g_MissionId = 4002

--目标NPC
x311005_g_Name = "L遳 Ki畁 Minh"

--喧ng否喧ngTinh英任务
x311005_g_IfMissionElite = 1

--任务归类
x311005_g_MissionKind = 1

--********下面几项喧ng动态显示to� 鸬 内容,用于T読 任务列表中动态显示任务情况******
--循环任务to� 鸬 数据索引,里面存着已做to� 鸬 环数 MD_PINPAN_HUAN
x311005_g_MissionRound = 1
--**********************************以上喧ng动态****************************

--任务文本描述
x311005_g_MissionName="B靚h 鸶nh phi猲 lo課"
x311005_g_MissionInfo="Ch鷑g ta 疸 n r� t靚h h靚h to鄋 b� t靚h h靚h c黙 Ng� 朽i S絥 ph鋘 qu鈔, c醕 h� v� Tr V頽h Nh鈔 li阯 k猼, gi猼 h猼 to鄋 b� ph鋘 qu鈔, m祎 t阯 c鹡g kh鬾g ch譨!"  --任务描述
x311005_g_MissionTarget="Nh� s� gi鷓 疝 c黙 L遳 Ki畁 Minh ti猲 v鄌 doanh 鸶a c黙 ph鋘 qu鈔, gi猼 ch猼 1 t阯 Ph鋘 Qu鈔 Th� L頽h, 13 t阯 Ph鋘 Qu鈔 Th� V�, 6 t阯 Ph鋘 Qu鈔 M鬾 V�."	--M鴆 ti陁 nhi甿 v�
x311005_g_ContinueInfo="C醕 h� ph鋓 ti猵 t鴆 c� gg nh�!"	--未Ho鄋 t nhi甿 v鴗o� 鸬 npc对话
x311005_g_MissionComplete="C醡 絥, ch鷑g t鬷 cu痠 c鵱g c鹡g 疸 d醡 ra kh鰅 c豠 r癷"	--Ho鄋 t nhi甿 v鴑pc说话to� 鸬 话


--任务奖励
x311005_g_MoneyBonus=909

--MisDescEnd
--************************************************************************

--角色Mission变量� 餴琺�
--0号: 已经完成to� 鸬 环数,T読 接收任务时候赋值
--1号: 当前任务喧ng否完成(0未完成；1完成)
--2号: 当前副本任务to� 鸬 场景号
--3号: 接副本任务时候to� 鸬 队伍号
--4号: 未用
--5号: 未用
--6号: 未用
--7号: 未用

x311005_g_LimitMembers=1 --可以进副本to� 鸬 最小队伍人数
x311005_g_TickTime=5 --回调脚本to� 鸬 时钟时间(单位:  gi鈟/次)
x311005_g_LimitTotalHoldTime=120 --副本可以存活to� 鸬 时间(单位: 次数)
x311005_g_CloseTick=6	--副本关闭前倒计时(单位: 次数)
x311005_g_NoUserTime=300 --副本中没有人后可以继续保存to� 鸬 时间(单位:  gi鈟)
x311005_g_Fuben_X=57.6
x311005_g_Fuben_Z=107.3

--**********************************
--任务入口函数
--**********************************
function x311005_OnDefaultEvent( sceneId, selfId, targetId )
	if( IsHaveMission(sceneId,selfId,x311005_g_MissionId) > 0)  then	--如果玩家已经接了C醝 n鄖 任务
		misIndex = GetMissionIndexByID(sceneId,selfId,x311005_g_MissionId)
		bDone = x311005_CheckSubmit( sceneId, selfId )
		if GetName(sceneId,targetId) == x311005_g_Name then		--喧ng目标NPC
			BeginEvent(sceneId)
				AddText(sceneId,x311005_g_MissionName)
				AddText(sceneId,"Chu b� xong ch遖?")
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x311005_g_ScriptId,x311005_g_MissionId)
		elseif bDone==1 then	--任务已经完成,并且T読 交任务to� 鸬 NPC上 餴琺击to� 鸬 事件
			BeginEvent(sceneId)
				AddText(sceneId,x311005_g_MissionName)
				AddText(sceneId,x311005_g_MissionComplete)
				AddText(sceneId,"C醕 h� s� nh 疬㧟: ")
				AddMoneyBonus(sceneId,x311005_g_MoneyBonus)
			EndEvent( )
			DispatchMissionDemandInfo(sceneId,selfId,targetId,x311005_g_ScriptId,x311005_g_MissionId,bDone)
		end
    elseif x311005_CheckAccept(sceneId,selfId) > 0 then		--没有任务,Th鯽 m鉵任务接收条件
		if GetName(sceneId,targetId) ~= x311005_g_Name then
			--发送任务Ti猵 th毕允総o� 鸬 信息
			BeginEvent(sceneId)
				AddText(sceneId,x311005_g_MissionName)
				AddText(sceneId,x311005_g_MissionInfo)
				AddText(sceneId,"M鴆 ti陁 nhi甿 v�: ")
				AddText(sceneId,x311005_g_MissionTarget)
				AddText(sceneId,"C醕 h� s� nh 疬㧟: ")
				AddMoneyBonus(sceneId,x311005_g_MoneyBonus)
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x311005_g_ScriptId,x311005_g_MissionId)
		end
    end
end

--**********************************
--列举事件
--**********************************
function x311005_OnEnumerate( sceneId, selfId, targetId )
	--如果已接此任务
	if IsHaveMission(sceneId,selfId,x311005_g_MissionId) > 0 then
		bDone = x311005_CheckSubmit( sceneId, selfId )
		if GetName(sceneId,targetId) == x311005_g_Name	and	bDone==0 then --任务NPC,任务没完成
			AddNumText(sceneId, x311005_g_ScriptId,x311005_g_MissionName);
		elseif	GetName(sceneId,targetId) ~= x311005_g_Name	and	bDone==1 then --交任务to� 鸬 NPC, 任务完成
			AddNumText(sceneId, x311005_g_ScriptId,x311005_g_MissionName);
		end
	--Th鯽 m鉵任务接收条件
    elseif x311005_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x311005_g_Name then
			AddNumText(sceneId,x311005_g_ScriptId,x311005_g_MissionName);
		end
    end
end

--**********************************
--检测Ti猵 th跫�
--**********************************
function x311005_CheckTeamLeader( sceneId, selfId )
	if	GetTeamId( sceneId, selfId)<0	then	--判断喧ng否有队伍
		BeginEvent(sceneId)
	  		AddText(sceneId,"C醕 h� ph鋓 gia nh v鄌 m祎 鸬i ng�");
	  	EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return	0
	end
	--取 餴琺玩家附近to� 鸬 队友数量(包括自己)
	local	nearteammembercount = GetNearTeamCount( sceneId, selfId) 
	
	if	nearteammembercount<x311005_g_LimitMembers	then
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
function x311005_CheckAccept( sceneId, selfId )
	if	GetTeamId( sceneId, selfId)<0	then	--判断喧ng否有队伍
		BeginEvent(sceneId)
	  		AddText(sceneId,"C醕 h� ph鋓 gia nh v鄌 m祎 鸬i ng�");
	  	EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return	0
	end
	
	--取 餴琺玩家附近to� 鸬 队友数量(包括自己)
	local	nearteammembercount = GetNearTeamCount( sceneId, selfId) 

	if	nearteammembercount<x311005_g_LimitMembers	then
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
		elseif IsHaveMission(sceneId,mems[i],x311005_g_MissionId)>0 or IsHaveMission(sceneId,mems[i],4001)>0 then	
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
function x311005_OnAccept( sceneId, selfId )
	
	local teamid = GetTeamId( sceneId, selfId)
	
	if( IsHaveMission(sceneId,selfId,x311005_g_MissionId) > 0)  then	--已经有任务to� 鸬 
		misIndex = GetMissionIndexByID(sceneId,selfId,x311005_g_MissionId)
		copysceneid = GetMissionParam( sceneId, selfId, misIndex, 2)
		saveteamid = GetMissionParam( sceneId, selfId, misIndex, 3)
		
		if copysceneid<0 then --还没有进过副本
			nearmembercount = x311005_CheckTeamLeader( sceneId, selfId )
			if nearmembercount>0 then --有队伍,人数足够,为队长, Tr� v滴耸�
			--队长创建副本场景
				x311005_MakeCopyScene( sceneId, selfId, nearmembercount ) ;
			end
		elseif teamid==saveteamid then
			--将自己传送到副本场景
			NewWorld( sceneId, selfId, copysceneid, x311005_g_Fuben_X, x311005_g_Fuben_Z) ;
		else
			BeginEvent(sceneId)
				AddText(sceneId,"衖玼 ki畁 kh鬾g ph� h䅟");
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
	else
		--加入任务到玩家列表
		if x311005_CheckAccept(sceneId,selfId) <= 0 then	--判断接收条件
			return 0
		end

		--取 餴琺玩家附近to� 鸬 队友数量(包括自己)
		local	nearteammembercount = GetNearTeamCount( sceneId, selfId) 
		local mems = {}
		for	i=0,nearteammembercount-1 do
			mems[i] = GetNearTeamMember(sceneId, selfId, i)
			--给每c醝队伍成员加入任务
			AddMission( sceneId, mems[i], x311005_g_MissionId, x311005_g_ScriptId, 1, 0, 0 )
			
			misIndex = GetMissionIndexByID( sceneId, mems[i], x311005_g_MissionId )
			
			local huan = GetMissionData(sceneId,selfId,x311005_g_MissionRound)
			
			--将任务to� 鸬 第0号数据设置为已经完成to� 鸬 
			SetMissionByIndex(sceneId,mems[i],misIndex,0,huan)
			
			--将任务to� 鸬 第1号数据设置为0,表示未完成to� 鸬 任务
			SetMissionByIndex(sceneId,mems[i],misIndex,1,0)
			
			--将任务to� 鸬 第2号数据设置为-1, 用于保存副本to� 鸬 场景号
			SetMissionByIndex(sceneId,mems[i],misIndex,2,-1)

			--将任务to� 鸬 第3号数据队伍号
			SetMissionByIndex(sceneId,mems[i],misIndex,3,teamid)
		end
	end
end

--**********************************
--放弃
--**********************************
function x311005_OnAbandon( sceneId, selfId )

	misIndex = GetMissionIndexByID(sceneId,selfId,x311005_g_MissionId)
	local copyscene = GetMissionParam( sceneId, selfId, misIndex, 2)
	
	--删除玩家任务列表中对应to� 鸬 任务
    DelMission( sceneId, selfId, x311005_g_MissionId )
	
	if sceneId==copyscene then --如果T読 副本里删除任务,则直接传送回
		BeginEvent(sceneId)
			AddText(sceneId,"Nhi甿 v� th b読!");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		
		oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3) ;--取 餴琺副本入口场景号
		
		NewWorld( sceneId, selfId, oldsceneId, 127, 28 )
	end
end

--**********************************
--创建副本
--**********************************
function x311005_MakeCopyScene( sceneId, selfId, nearmembercount )

	local mems = {}
	mylevel = 0 
	for	i=0,nearmembercount-1 do
		mems[i] = GetNearTeamMember(sceneId, selfId, i)
		mylevel = mylevel+GetLevel(sceneId,mems[i])
	end
	mylevel = mylevel/nearmembercount
	
	leaderguid=LuaFnObjId2Guid(sceneId,selfId)
	LuaFnSetSceneLoad_Map(sceneId, "_pingpan_1.nav"); --地图喧ng必须选取to� 鸬 ,而且必须T読 Config/SceneInfo.ini里配置好
	LuaFnSetCopySceneData_TeamLeader(sceneId, leaderguid);
	LuaFnSetCopySceneData_NoUserCloseTime(sceneId, x311005_g_NoUserTime*1000);
	LuaFnSetCopySceneData_Timer(sceneId, x311005_g_TickTime*1000);
	LuaFnSetCopySceneData_Param(sceneId, 0, 999);--设置副本数据,这里将0号索引to� 鸬 数据设置为999,用于表示副本号999(数字自定义)
	LuaFnSetCopySceneData_Param(sceneId, 1, x311005_g_ScriptId);--将1号数据设置为副本场景事件脚本号
	LuaFnSetCopySceneData_Param(sceneId, 2, 0);--设置定时器调用次数
	LuaFnSetCopySceneData_Param(sceneId, 3, -1);--设置副本入口场景号, 初始化
	LuaFnSetCopySceneData_Param(sceneId, 4, 0);--设置副本关闭标志, 0开放,1关闭
	LuaFnSetCopySceneData_Param(sceneId, 5, 0);--设置离开倒计时次数
	LuaFnSetCopySceneData_Param(sceneId, 6, 0);--杀死to� 鸬 叛军1to� 鸬 数量
	LuaFnSetCopySceneData_Param(sceneId, 7, 0);--杀死to� 鸬 叛军2to� 鸬 数量
	LuaFnSetCopySceneData_Param(sceneId, 8, 0);--杀死to� 鸬 叛军3to� 鸬 数量
	
	if	mylevel<=40	 then
		LuaFnSetSceneLoad_Monster(sceneId, "_pingpan_1_monster.ini")
		LuaFnSetCopySceneData_Param(sceneId, 9,536);--杀死to� 鸬 叛军1to� 鸬 怪物类型
		LuaFnSetCopySceneData_Param(sceneId,10,529);--杀死to� 鸬 叛军2to� 鸬 怪物类型
		LuaFnSetCopySceneData_Param(sceneId,11,538);--杀死to� 鸬 叛军3to� 鸬 怪物类型
	elseif	mylevel<=55	 then
		LuaFnSetSceneLoad_Monster(sceneId, "_pingpan_40_monster.ini")
		LuaFnSetCopySceneData_Param(sceneId, 9,1825);--杀死to� 鸬 叛军1to� 鸬 怪物类型
		LuaFnSetCopySceneData_Param(sceneId,10,1835);--杀死to� 鸬 叛军2to� 鸬 怪物类型
		LuaFnSetCopySceneData_Param(sceneId,11,539);--杀死to� 鸬 叛军3to� 鸬 怪物类型
	elseif	mylevel<=70	 then
		LuaFnSetSceneLoad_Monster(sceneId, "_pingpan_55_monster.ini")
		LuaFnSetCopySceneData_Param(sceneId, 9,1845);--杀死to� 鸬 叛军1to� 鸬 怪物类型
		LuaFnSetCopySceneData_Param(sceneId,10,1850);--杀死to� 鸬 叛军2to� 鸬 怪物类型
		LuaFnSetCopySceneData_Param(sceneId,11,540);--杀死to� 鸬 叛军3to� 鸬 怪物类型
	elseif	mylevel<=85	 then
		LuaFnSetSceneLoad_Monster(sceneId, "_pingpan_70_monster.ini")
		LuaFnSetCopySceneData_Param(sceneId, 9,517);--杀死to� 鸬 叛军1to� 鸬 怪物类型
		LuaFnSetCopySceneData_Param(sceneId,10,518);--杀死to� 鸬 叛军2to� 鸬 怪物类型
		LuaFnSetCopySceneData_Param(sceneId,11,541);--杀死to� 鸬 叛军3to� 鸬 怪物类型
	else
		LuaFnSetSceneLoad_Monster(sceneId, "_pingpan_85_monster.ini")
		LuaFnSetCopySceneData_Param(sceneId, 9,1955);--杀死to� 鸬 叛军1to� 鸬 怪物类型
		LuaFnSetCopySceneData_Param(sceneId,10,1950);--杀死to� 鸬 叛军2to� 鸬 怪物类型
		LuaFnSetCopySceneData_Param(sceneId,11,542);--杀死to� 鸬 叛军3to� 鸬 怪物类型
	end	

	LuaFnSetCopySceneData_Param(sceneId,12,GetTeamId(sceneId,selfId)); --保存队伍号
	
	local bRetSceneID = LuaFnCreateCopyScene(); --初始化完成后调用创建副本函数
	BeginEvent(sceneId)
		if bRetSceneID>0 then
			AddText(sceneId,"D竎h chuy琻 th鄋h c鬾g!");
		else
			AddText(sceneId,"X鈟 d駈g ph� b鋘 th b読");
		end
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	
end

--**********************************
--继续
--**********************************
function x311005_OnContinue( sceneId, selfId, targetId )

	misIndex = GetMissionIndexByID(sceneId,selfId,x311005_g_MissionId)
	if	GetMissionParam( sceneId, selfId, misIndex, 2)>=1	then
		DispatchMissionContinueInfo(sceneId, selfId, targetId, x311005_g_ScriptId, x311005_g_MissionId)
	end

end

--**********************************
--检测喧ng否可以提交
--**********************************
function x311005_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x311005_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

--判断任务喧ng否已经完成
	misIndex = GetMissionIndexByID(sceneId,selfId,x311005_g_MissionId)
	if	GetMissionParam( sceneId, selfId, misIndex, 1)>=1 then 
		return	1
	else
		return	0
	end
end

--**********************************
--提交
--**********************************
function x311005_OnSubmit( sceneId, selfId, targetId, selectRadioId )

	if x311005_CheckSubmit( sceneId, selfId, selectRadioId )>0 then		--已经Ho鄋 t nhi甿 v�
	
		--设置任务已经被完成过
		DelMission( sceneId,selfId,  x311005_g_MissionId )
		
		local	i=GetMissionData(sceneId,selfId,x311005_g_MissionRound)
		if	i>=10	then
			i=1
		else
			i=i+1
		end
		
		--添加任务奖励
		money = 100*i+x311005_g_MoneyBonus
		AddMoney(sceneId,selfId,money );
		
		--设置循环任务to� 鸬 环数
		SetMissionData(sceneId,selfId,x311005_g_MissionRound,i)
		
		BeginEvent(sceneId)
			strText_M = format("Ng呓i 疸 餺誸 疬㧟 %d ng鈔 l唼ng",money)
	  		strText = format("Nhi甿 v� b靚h 鸶nh phi猲 lo課 疸 ho鄋 t, hi畁 gi� l� v騨g th�%d",i)
	  		AddText(sceneId,strText);
	  		AddText(sceneId,strText_M);
	  	EndEvent(sceneId)
	  	DispatchMissionTips(sceneId,selfId)
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x311005_OnKillObject( sceneId, selfId, objdataId ,objId )
	
	--取 餴琺当前场景里to� 鸬 人数
	num = LuaFnGetCopyScene_HumanCount(sceneId)
	
	killednumber_1 = LuaFnGetCopySceneData_Param(sceneId, 6) ;--杀死叛军to� 鸬 数量
	killednumber_2 = LuaFnGetCopySceneData_Param(sceneId, 7) ;--杀死叛军to� 鸬 数量
	killednumber_3 = LuaFnGetCopySceneData_Param(sceneId, 8) ;--杀死叛军to� 鸬 数量
	killednumber = killednumber_1+killednumber_2+killednumber_3
	IsKillOK=0		
	if killednumber<20 then
		needkilled_1 = LuaFnGetCopySceneData_Param(sceneId, 9) ;--杀死叛军to� 鸬 怪物类型
		needkilled_2 = LuaFnGetCopySceneData_Param(sceneId,10) ;--杀死叛军to� 鸬 怪物类型
		needkilled_3 = LuaFnGetCopySceneData_Param(sceneId,11) ;--杀死叛军to� 鸬 怪物类型

		BeginEvent(sceneId)
		if objdataId==needkilled_1 then
			killednumber_1 = killednumber_1+1
			strText = format("秀 gi猼 ch猼 qu鈔 m鬾 v� ph鋘 b礽 %d/6", killednumber_1 )
			AddText(sceneId,strText);
			IsKillOK=1
		elseif objdataId==needkilled_2 then
			killednumber_2 = killednumber_2+1
			BeginEvent(sceneId)
			strText = format("秀 gi猼 ch猼 qu鈔 th� v� ph鋘 b礽 %d/13", killednumber_2 )
			AddText(sceneId,strText);
			IsKillOK=1
		elseif objdataId==needkilled_3 then
			killednumber_3 = killednumber_3+1
			strText = format("秀 gi猼 ch猼 qu鈔 th� l頽h ph鋘 b礽 %d/1", killednumber_3 )
			AddText(sceneId,strText);
			IsKillOK=1
		end
		EndEvent(sceneId)

		if IsKillOK==1 then
			for i=0,num-1 do
				humanObjId = LuaFnGetCopyScene_HumanObjId(sceneId,i)--取 餴琺当前场景里人to� 鸬 objId
				DispatchMissionTips(sceneId,humanObjId)
			end
			
			LuaFnSetCopySceneData_Param(sceneId, 6, killednumber_1);--设置杀死to� 鸬 叛军to� 鸬 数量
			LuaFnSetCopySceneData_Param(sceneId, 7, killednumber_2);--设置杀死to� 鸬 叛军to� 鸬 数量
			LuaFnSetCopySceneData_Param(sceneId, 8, killednumber_3);--设置杀死to� 鸬 叛军to� 鸬 数量
		end
	end
	
	killednumber = killednumber_1+killednumber_2+killednumber_3
	if killednumber>=20 and IsKillOK==1 then
	
		--设置任务完成标志
		LuaFnSetCopySceneData_Param(sceneId, 4, 1)
		
		for i=0,num-1 do
			humanObjId = LuaFnGetCopyScene_HumanObjId(sceneId,i)	--取 餴琺当前场景里人to� 鸬 objId
			misIndex = GetMissionIndexByID(sceneId,humanObjId,x311005_g_MissionId)--取 餴琺任务数据索引值

			--将任务to� 鸬 第1号数据设置为1,表示完成to� 鸬 任务
			SetMissionByIndex(sceneId,humanObjId,misIndex,1,1)--设置任务数据

			BeginEvent(sceneId)
				strText = format("Nhi甿 v� ho鄋 th鄋h, sau %d gi鈟 s� chuy琻 t緄 v� tr� v鄌 c豠", x311005_g_CloseTick*x311005_g_TickTime )
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,humanObjId)
		end
	end
end

--**********************************
--进入区域事件
--**********************************
function x311005_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x311005_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--副本事件
--**********************************
function x311005_OnCopySceneReady( sceneId, destsceneId )

	LuaFnSetCopySceneData_Param(destsceneId, 3, sceneId);--设置副本入口场景号
	leaderguid  = LuaFnGetCopySceneData_TeamLeader(destsceneId) ;	
	leaderObjId = LuaFnGuid2ObjId(sceneId,leaderguid);

	--取 餴琺玩家附近to� 鸬 队友数量(包括自己)
	local	nearteammembercount = GetNearTeamCount( sceneId, leaderObjId) 
	local mems = {}
	for	i=0,nearteammembercount-1 do
		mems[i] = GetNearTeamMember(sceneId, leaderObjId, i)
		misIndex = GetMissionIndexByID(sceneId,mems[i],x311005_g_MissionId)
		
		--将任务to� 鸬 第2号数据设置为副本to� 鸬 场景号
		SetMissionByIndex(sceneId,mems[i],misIndex,2,destsceneId)
				
		NewWorld( sceneId, mems[i], destsceneId, x311005_g_Fuben_X, x311005_g_Fuben_Z) ;
	end
end

--**********************************
--有玩家进入副本事件
--**********************************
function x311005_OnPlayerEnter( sceneId, selfId )
	--设� gi鈟劳龊蟾椿� 餴琺位置
	SetPlayerDefaultReliveInfo( sceneId, selfId, "%10", -1, "0", sceneId, x311005_g_Fuben_X, x311005_g_Fuben_Z );
end

--**********************************
--有玩家T読 副本中死亡事件
--**********************************
function x311005_OnHumanDie( sceneId, selfId, killerId )
end

--**********************************
--副本场景定时器事件
--**********************************
function x311005_OnCopySceneTimer( sceneId, nowTime )
	
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
		
		if leaveTickCount == x311005_g_CloseTick then --倒计时间到,大家都出去吧
		
			oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3) ;--取 餴琺副本入口场景号
			
			--将当前副本场景里to� 鸬 所有人传送回原来进入时候to� 鸬 场景
			local membercount = LuaFnGetCopyScene_HumanCount(sceneId)
			local mems = {}
			for	i=0,membercount-1 do
				mems[i] = LuaFnGetCopyScene_HumanObjId(sceneId,i)
				NewWorld( sceneId, mems[i], oldsceneId, 127, 28 )
			end
			
		elseif leaveTickCount<x311005_g_CloseTick then
		
			oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3) ;--取 餴琺副本入口场景号

			--通知当前副本场景里to� 鸬 所有人,场景关闭倒计时间
			local membercount = LuaFnGetCopyScene_HumanCount(sceneId)
			local mems = {}
			for	i=0,membercount-1 do
				mems[i] = LuaFnGetCopyScene_HumanObjId(sceneId,i)
	  			BeginEvent(sceneId)
	  				strText = format("C醕 h� s� r秈 kh鰅 疴y sau %d gi鈟!", (x311005_g_CloseTick-leaveTickCount)*x311005_g_TickTime )
	  				AddText(sceneId,strText);
	  			EndEvent(sceneId)
	  			DispatchMissionTips(sceneId,mems[i])
			end
		end
	elseif TickCount == x311005_g_LimitTotalHoldTime then --副本总时间限制到了
		--此处设置副本任务有时间限制to� 鸬 情况,当时间到后处理...
		local membercount = LuaFnGetCopyScene_HumanCount(sceneId)
		local mems = {}
		for	i=0,membercount-1 do
			mems[i] = LuaFnGetCopyScene_HumanObjId(sceneId,i)
			DelMission( sceneId, mems[i], x311005_g_MissionId );--任务th b読,删除之

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
			if IsHaveMission(sceneId,mems[i],x311005_g_MissionId) > 0 then
				oldteamid = LuaFnGetCopySceneData_Param(sceneId, 12) ; --取 餴琺保存to� 鸬 队伍号
				
				if oldteamid ~= GetTeamId(sceneId,mems[i]) then
					DelMission( sceneId, mems[i], x311005_g_MissionId );--任务th b読,删除之

  					BeginEvent(sceneId)
  						AddText(sceneId,"Nhi甿 v� th b読, ng呓i kh鬾g � trong 瘊ng nh髆");
  					EndEvent(sceneId)
  					DispatchMissionTips(sceneId,mems[i])
  					
 					oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3) ;--取 餴琺副本入口场景号
					NewWorld( sceneId, mems[i], oldsceneId, 127, 28 )
  				end
  			end
		end
				
	end
end

