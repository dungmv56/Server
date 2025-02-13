--循环任务
--召集同伴
--************************************************************************
--MisDescBegin
--脚本号
x210211_g_ScriptId = 210211

--Ti猵 th挝馧PC属性
x210211_g_Position_X=173
x210211_g_Position_Z=146
x210211_g_SceneID=2
x210211_g_AccomplishNPC_Name="T鬾 B醫 Gia" 

--上m祎 c醝任务to� 鸬 ID
x210211_g_MissionIdPre =450

--任务号
x210211_g_MissionId = 451

--M鴆 ti陁 nhi甿 v鴑pc
x210211_g_Name	="T鬾 B醫 Gia" 

x210211_g_ItemId	=30505062

--任务归类
x210211_g_MissionKind = 13

--衅ng c nhi甿 v� 
x210211_g_MissionLevel = 3

--喧ng否喧ngTinh英任务
x210211_g_IfMissionElite = 0

--********下面几项喧ng动态显示to� 鸬 内容,用于T読 任务列表中动态显示任务情况******
x210211_g_IsMissionOkFail = 0					--变量to� 鸬 第0位
--**********************************以上喧ng动态****************************


--任务文本描述
x210211_g_MissionName="Ph髇g ho� ph醥"
x210211_g_MissionInfo="#{event_dali_0013}"  --任务描述至于什么地方合适,你只要打开#Y背包#W里to� 鸬 任务� 鹫o c� 疸 馥y�,右键 餴琺m祎 下C醝 n鄖 #Y传讯焰火#W,它就能给你相关to� 鸬 提示.
x210211_g_MissionTarget="#{xinshou_003}"		--M鴆 ti陁 nhi甿 v�
x210211_g_ContinueInfo="  L豠 疸 ph髇g 餴 ch遖?"		--未Ho鄋 t nhi甿 v鴗o� 鸬 npc对话
x210211_g_MissionComplete="#{event_dali_0015}"					--Ho鄋 t nhi甿 v鴑pc说话to� 鸬 话
x210211_g_ItemBonus={{id=10111000,num=1}}
x210211_g_SignPost = {x = 173, z = 146, tip = "T鬾 B醫 Gia "}
x210211_g_MoneyBonus=72
x210211_g_SignPost_1 = {x = 82, z = 220, tip = "衖琺 鸠t Ho� ph醥"}

x210211_g_Custom	= { {id="秀 鸠t Ho� ph醥 truy玭 tin",num=1} }

--MisDescEnd
--************************************************************************

--角色Mission变量� 餴琺�
--0号: 任务状态
--1号: 
--2号: 所T読 场景编号
--3号: 指定x坐标
--4号: 指定z坐标
--5号: 未用
--6号: 未用
--7号: 未用

--宝藏位置
x210211_g_TreasureAddress = {	{scene=2,x=82,z=220}}
--						{scene=2,x=104,z=201},
--						{scene=2,x=242,z=55},
--						{scene=2,x=202,z=237},
--						{scene=2,x=255,z=232},
--						{scene=2,x=82,z=220},
--						{scene=2,x=46,z=255},
--						{scene=2,x=44,z=151},
--						{scene=2,x=79,z=222}}

--**********************************
--任务入口函数
--**********************************
function x210211_OnDefaultEvent( sceneId, selfId, targetId )	-- 餴琺击该任务后执行此脚本
	if IsHaveMission(sceneId,selfId,x210211_g_MissionId) > 0 then
		--发送任务需求to� 鸬 信息
		BeginEvent(sceneId)
			AddText(sceneId,x210211_g_MissionName)
			AddText(sceneId,x210211_g_ContinueInfo)
			AddMoneyBonus( sceneId, x210211_g_MoneyBonus )
		EndEvent( )
		bDone = x210211_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x210211_g_ScriptId,x210211_g_MissionId,bDone)
	--Th鯽 m鉵任务接收条件
	elseif x210211_CheckAccept(sceneId,selfId) > 0 then
		--发送任务Ti猵 th毕允総o� 鸬 信息
		BeginEvent(sceneId)
			AddText(sceneId,x210211_g_MissionName)
			AddText(sceneId,x210211_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}#r")
			AddText(sceneId,x210211_g_MissionTarget)
			for i, item in x210211_g_ItemBonus do
				AddItemBonus( sceneId, item.id, item.num )
			end
			AddMoneyBonus( sceneId, x210211_g_MoneyBonus )
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x210211_g_ScriptId,x210211_g_MissionId)
	end
end

--**********************************
--列举事件
--**********************************
function x210211_OnEnumerate( sceneId, selfId, targetId )
    --如果玩糾祎 刮赐瓿缮蟤祎 c醝任务
    if 	IsMissionHaveDone(sceneId,selfId,x210211_g_MissionIdPre) <= 0 then
    	return
    end
	if IsMissionHaveDone(sceneId,selfId,x210211_g_MissionId) > 0 then
    	return 
    --如果已接此任务
    elseif IsHaveMission(sceneId,selfId,x210211_g_MissionId) > 0 then
		AddNumText(sceneId,x210211_g_ScriptId,x210211_g_MissionName,2,-1);
    --Th鯽 m鉵任务接收条件
    elseif x210211_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x210211_g_ScriptId,x210211_g_MissionName,1,-1);
    end
end

--**********************************
--检测Ti猵 th跫�
--**********************************
function x210211_CheckAccept( sceneId, selfId )
	--C 3c才能接
	if GetLevel( sceneId, selfId ) >= 3 then
		return 1
	else
		return 0
	end
end

--**********************************
--Ti猵 th�
--**********************************
function x210211_OnAccept( sceneId, selfId )

	if x210211_CheckAccept(sceneId, selfId )<=0 then
		return
	end
	
	--x210211_g_sequence = random(3)					--根据宝物地 餴琺总数 鹫t 疬㧟m祎 c醝随机数
	SceneNum = x210211_g_TreasureAddress[1].scene
	X		 = x210211_g_TreasureAddress[1].x
	Z		 = x210211_g_TreasureAddress[1].z
	--添加烟花
	BeginAddItem(sceneId)
		AddItem( sceneId,x210211_g_ItemId, 1 )
	local ret = EndAddItem(sceneId,selfId)
	
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#Yh鄋h Trang nhi甿 v�#W c黙 c醕 h� 疸 馥y", MSG2PLAYER_PARA )
	
	else
		--加入任务到玩家列表
		local ret1 = AddMission( sceneId,selfId, x210211_g_MissionId, x210211_g_ScriptId, 0, 0, 1 )
	
		if ret1 > 0  then
			
			--设置任务变量宝物to� 鸬 场景编号和坐标位置
			misIndex = GetMissionIndexByID(sceneId,selfId,x210211_g_MissionId)		-- 餴琺到任务T読 20c醝任务中to� 鸬 序列号
			SetMissionByIndex(sceneId,selfId,misIndex,0,0)					--根据序列号把任务变量to� 鸬 第m祎 位置0	第m祎 位喧ng完成/th b読情况
			SetMissionByIndex(sceneId,selfId,misIndex,2,SceneNum)		--把第三位置为宝物to� 鸬 场景编号
			SetMissionByIndex(sceneId,selfId,misIndex,3,X)					--把第四位置为宝物to� 鸬 X坐标
			SetMissionByIndex(sceneId,selfId,misIndex,4,Z)					--把第五位置为宝物to� 鸬 Z坐标
			
			AddItemListToHuman(sceneId,selfId)
			Msg2Player( sceneId, selfId,"#YNh nhi甿 v�#W: 鸠t Ho� ph醥",MSG2PLAYER_PARA )
			
		  Msg2Player( sceneId, selfId, "@*;flagPOS;" .. sceneId .. ";" .. X .. ";" .. Z .. ";".."衖琺 鸠t Ho� ph醥", MSG2PLAYER_PARA )
			Msg2Player( sceneId, selfId, "@*;flashPOS;" .. sceneId .. ";" .. X .. ";" .. Z .. ";" .. "衖琺 鸠t Ho� ph醥", MSG2PLAYER_PARA )
			BeginEvent(sceneId)
				AddText(sceneId, "C醕 h� 疸 nh Ho� ph醥 truy玭 tin");
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			
			CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, x210211_g_SignPost_1.x, x210211_g_SignPost_1.z, x210211_g_SignPost_1.tip )
		else
			Msg2Player( sceneId, selfId,"#YDanh s醕h nhi甿 v�#W: c黙 c醕 h� 疸 馥y r癷", MSG2PLAYER_PARA )
		
		end
	end
end

--**********************************
--放弃
--**********************************
function x210211_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应to� 鸬 任务
    res = DelMission( sceneId, selfId, x210211_g_MissionId )
	if res > 0 then
		--移去任务物品
		DelItem( sceneId, selfId, x210211_g_ItemId, 1 )
		--CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x210211_g_SignPost.tip )
		
	  Msg2Player( sceneId, selfId, "@*;flagNPCdel;" .. sceneId .. ";" .. "衖琺 鸠t Ho� ph醥", MSG2PLAYER_PARA )
	  Msg2Player( sceneId, selfId, "@*;flashNPCdel;" .. sceneId .. ";" .. "衖琺 鸠t Ho� ph醥", MSG2PLAYER_PARA )
		
		
	end
end

--**********************************
--继续
--**********************************
function x210211_OnContinue( sceneId, selfId, targetId )
	--提交任务时to� 鸬 � 餴琺餍畔�
    BeginEvent(sceneId)
		AddText(sceneId,x210211_g_MissionName)
		AddText(sceneId,x210211_g_MissionComplete)
		AddMoneyBonus( sceneId, x210211_g_MoneyBonus )
		for i, item in x210211_g_ItemBonus do
			AddItemBonus( sceneId,item.id, item.num )
		end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x210211_g_ScriptId,x210211_g_MissionId)
end

--**********************************
--检测喧ng否可以提交
--**********************************
function x210211_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x210211_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	misIndex = GetMissionIndexByID(sceneId,selfId,x210211_g_MissionId)
	x210211_g_MissionCondition = GetMissionParam(sceneId,selfId,misIndex,0)		-- 鹫t 疬㧟任务状态
	if	x210211_g_MissionCondition>=1	then
		return	1
	else
		return	0
	end
end

--**********************************
--提交
--**********************************
function x210211_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	if x210211_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
    	BeginAddItem(sceneId)
			for i, item in x210211_g_ItemBonus do
				AddItem( sceneId,item.id, item.num )
			end
		ret = EndAddItem(sceneId,selfId)
		--添加任务奖励
			if ret > 0 then
					AddMoney(sceneId,selfId,x210211_g_MoneyBonus );
					LuaFnAddExp( sceneId, selfId,400)
					ret = DelMission( sceneId, selfId, x210211_g_MissionId )
				if ret > 0 then
					MissionCom( sceneId, selfId, x210211_g_MissionId )
					AddItemListToHuman(sceneId,selfId)
					Msg2Player(  sceneId, selfId,"#YHo鄋 t nhi甿 v�#W: 携t Ho� ph醥",MSG2PLAYER_PARA )
					CallScriptFunction( 210212, "OnDefaultEvent",sceneId, selfId, targetId)
				end
			else
				--任务奖励没有加成功
				BeginEvent(sceneId)
					strText = "Kh鬾g th� Ho鄋 t nhi甿 v�"
					AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
			end
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x210211_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--进入区域事件
--**********************************
function x210211_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x210211_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--道具使用
--**********************************
function x210211_OnUseItem( sceneId, selfId, BagIndex )
	misIndex = GetMissionIndexByID(sceneId,selfId,x210211_g_MissionId)
	x210211_g_MissionCondition = GetMissionParam(sceneId,selfId,misIndex,0)		-- 鹫t 疬㧟任务状态
	scene = GetMissionParam(sceneId,selfId,misIndex,2)					-- 鹫t 疬㧟宝物场景号
	treasureX = x210211_g_SignPost_1.x				-- 鹫t 疬㧟宝物X坐标
	treasureZ = x210211_g_SignPost_1.z				-- 鹫t 疬㧟宝物Z坐标	
	--如果任务已经完成
	if x210211_g_MissionCondition == 1 then
		BeginEvent(sceneId)
			AddText(sceneId,"Ph醫 ra Ho� ph醥 truy玭 tin th鄋h c鬾g")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	--取 餴琺玩家当前坐标
	PlayerX = GetHumanWorldX(sceneId,selfId)
	PlayerZ = GetHumanWorldZ(sceneId,selfId)
	--计算玩家与宝藏to� 鸬 距离
	Distance = floor(sqrt((treasureX-PlayerX)*(treasureX-PlayerX)+(treasureZ-PlayerZ)*(treasureZ-PlayerZ)))
	if sceneId==scene or sceneId==71 or sceneId==72 then
	else
		BeginEvent(sceneId)
			AddText(sceneId,"C� h� � c鋘h n鄖 kh鬾g th� ph醫 ra Ho� ph醥 truy玭 tin")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	if Distance > 5 then
		BeginEvent(sceneId)
			AddText(sceneId,"衖琺 鸠t Ho� ph醥 truy玭 tin c騨 c醕h kho鋘g "..Distance.." G誳")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	elseif Distance <= 5 then
		SetMissionByIndex(sceneId,selfId,misIndex,0,1)		--把任务状态变量设置为1,表示已经完成
		SetMissionByIndex(sceneId,selfId,misIndex,1,1)		--把任务状态变量设置为1,表示已经完成
		CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, x210211_g_SignPost.x, x210211_g_SignPost.z, x210211_g_SignPost.tip )
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 4825, 0);
		BeginEvent(sceneId)
			AddText(sceneId,"挟 t� c醕 鹫i m鬾 ph醝 疬㧟 tin l� l唼t k閛 t緄, mau v� t靘 T鬾 B醫 Gia 餴")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		DelItem( sceneId, selfId, x210211_g_ItemId, 1 )
	end
end
