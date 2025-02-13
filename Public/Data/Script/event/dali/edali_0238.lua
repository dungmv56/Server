
--门派引导任务

--MisDescBegin
--脚本号
x210238_g_ScriptId = 210238

--Ti猵 th挝馧PC属性
x210238_g_Position_X=160.0895
x210238_g_Position_Z=156.9309
x210238_g_SceneID=2
x210238_g_AccomplishNPC_Name="Tri畊 Thi阯 S�"

--任务号
x210238_g_MissionId = 718

--目标NPC
x210238_g_Name	="Tri畊 Thi阯 S�"

--任务归类
x210238_g_MissionKind = 13

--衅ng c nhi甿 v� 
x210238_g_MissionLevel = 1

--喧ng否喧ngTinh英任务
x210238_g_IfMissionElite = 0
x210238_g_IsMissionOkFail = 0		--变量to� 鸬 第0位
--任务名
x210238_g_MissionName="10 n錷"
--任务描述
x210238_g_MissionInfo  = "    M l鉶 gi� T� 姓i Thi畁 Nh鈔 ch鷑g ta v譨 g c醕 h�, Li玭 c鋗 th c醕 h� 瘊ng l� 1 v� h鱟 k� t鄆 ng鄋 n錷 m緄 g. N猽 疬㧟 danh s� truy玭 th�, ti玭 鸢 t kh鬾g th� l叨ng"
x210238_g_MissionInfo1 = "    Nh遪g gi� 疴y vi甤 quan tr鱪g nh c黙 c醕 h�, l� ph鋓 n v鎛g c錸 c� v� h鱟. Sau khi n v鎛g c錸 c�, c� th� t靘 m祎 v� danh s�, h鱟 v� c鬾g uy阯 th鈓 h絥. Sau n鄖 tr� th鄋h m祎 鹫i anh h鵱g, 鹫i hi畃 s�!"
x210238_g_MissionInfo2 = "    Nh� th� n鄖, 瘙i c醕 h� 鹫t t緄 c 10, h銀 t緄 t靘 Tri畊 Thi阯 S� ta. M l鉶 gi� ch鷑g ta s� chu b� m祎 ph qu� 穑c bi畉 cho c醕 h�"
--M鴆 ti陁 nhi甿 v�
x210238_g_MissionTarget="#{MIS_dali_ZTS_002}"		
--未Ho鄋 t nhi甿 v鴗o� 鸬 npc对话
x210238_g_ContinueInfo="  C醕 h� 疸 鹫t t緄 c 10 ch遖?"
--提交时npcto� 鸬 话
x210238_g_MissionComplete="  T痶 qu�, c醕 h� c� th� gia nh m鬾 ph醝 r癷"		


x210238_g_exp=0
x210238_g_ItemBonus={}

x210238_g_Custom	= { {id="秀 鹫t 鹌ng c",num=10} }--变量to� 鸬 第1位

--MisDescEnd
--**********************************
--任务入口函数
--**********************************
function x210238_OnDefaultEvent( sceneId, selfId, targetId )

  --如果玩家完成过C醝 n鄖 任务
  if (IsMissionHaveDone(sceneId,selfId,x210238_g_MissionId) > 0 ) then
    return

	elseif( IsHaveMission(sceneId,selfId,x210238_g_MissionId) > 0)  then
		--发送任务需求to� 鸬 信息
		BeginEvent(sceneId)
			AddText(sceneId, x210238_g_MissionName)
			AddText(sceneId, x210238_g_ContinueInfo)
		EndEvent( )
		local bDone = x210238_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x210238_g_ScriptId,x210238_g_MissionId,bDone)
				
	--Th鯽 m鉵任务接收条件
  elseif x210238_CheckAccept(sceneId,selfId) > 0 then
		--发送任务Ti猵 th毕允総o� 鸬 信息
		BeginEvent(sceneId)
			AddText(sceneId,x210238_g_MissionName)
			AddText(sceneId,x210238_g_MissionInfo)
			AddText(sceneId,x210238_g_MissionInfo1)			
			AddText(sceneId,x210238_g_MissionInfo2)
			
			--AddText(sceneId,"#{M_MUBIAO}")
			--AddText(sceneId,x210238_g_MissionTarget)
			--AddText(sceneId,"#{M_SHOUHUO}")
			--AddMoneyBonus( sceneId, x210238_g_MoneyBonus )
			--for i, item in x210238_g_ItemBonus do
			--	AddItemBonus( sceneId, item.id, item.num )
			--end
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x210238_g_ScriptId,x210238_g_MissionId)
	end
end

--**********************************
--列举事件
--**********************************
function x210238_OnEnumerate( sceneId, selfId, targetId )
	--如果玩家完成过C醝 n鄖 任务
	if IsMissionHaveDone(sceneId,selfId,x210238_g_MissionId) > 0 then
		return 
	--如果已接此任务
	elseif IsHaveMission(sceneId,selfId,x210238_g_MissionId) > 0 then
	    
	    local bDone = x210238_CheckSubmit( sceneId, selfId ) 
	    if( 1 == bDone ) then
	        AddNumText(sceneId, x210238_g_ScriptId, x210238_g_MissionName, 2, -1);
	    else
	        AddNumText(sceneId, x210238_g_ScriptId, x210238_g_MissionName, 1, -1);
	    end	
	    			
	--Th鯽 m鉵任务接收条件
	elseif x210238_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId, x210238_g_ScriptId, x210238_g_MissionName, 1, -1);
	end
end

--**********************************
--检测Ti猵 th跫�
--**********************************
function x210238_CheckAccept( sceneId, selfId )

	--要求完成to� 鸬 前续任务
	--if IsMissionHaveDone(sceneId,selfId,645) <= 0 then
	--	return 0

	--C 1c才能接
	if GetLevel( sceneId, selfId ) >= x210238_g_MissionLevel then
		return 1
	else
		return 0
	end
end

--**********************************
--Ti猵 th�
--**********************************
function x210238_OnAccept( sceneId, selfId )
	--如果玩家完成过C醝 n鄖 任务
	if IsMissionHaveDone(sceneId,selfId,x210238_g_MissionId) > 0 then
		return 
	end
		
	-- 加入任务到玩家列表
	local ret = AddMission( sceneId,selfId, x210238_g_MissionId, x210238_g_ScriptId, 1, 0, 0 )
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#YNh k� nhi甿 v� c黙 c醕 h� 疸 馥y" , MSG2PLAYER_PARA )
		return
	end
	
	--设置任务变量宝物to� 鸬 场景编号和坐标位置
	--local misIndex = GetMissionIndexByID(sceneId, selfId, x210238_g_MissionId)-- 餴琺到任务T読 20c醝任务中to� 鸬 序列号
	--SetMissionByIndex(sceneId,selfId,misIndex,0,0)					--根据序列号把任务变量to� 鸬 第m祎 位置0	第m祎 位喧ng完成/th b読情况

	--Msg2Player(  sceneId, selfId,"#YTi猵 th挝�" .. x210238_g_MissionName, MSG2PLAYER_PARA )
	Msg2Player(  sceneId, selfId,"Nh nhi甿 v�: #Y" .. x210238_g_MissionName, MSG2PLAYER_PARA )
	local misIndex = GetMissionIndexByID(sceneId, selfId, x210238_g_MissionId)-- 餴琺到任务T読 20c醝任务中to� 鸬 序列号
	SetMissionByIndex(sceneId,selfId,misIndex,1,1)
	
end

--**********************************
--放弃
--**********************************
function x210238_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应to� 鸬 任务
	DelMission( sceneId, selfId, x210238_g_MissionId )
end

--**********************************
--继续
--**********************************
function x210238_OnContinue( sceneId, selfId, targetId )
	--提交任务时to� 鸬 � 餴琺餍畔�
	BeginEvent(sceneId)
		AddText(sceneId,x210238_g_MissionName)
		AddText(sceneId,x210238_g_MissionComplete)

		for i, item in x210238_g_ItemBonus do
			AddItemBonus( sceneId, item.id, item.num )
		end
	EndEvent( )
	DispatchMissionContinueInfo(sceneId,selfId,targetId,x210238_g_ScriptId,x210238_g_MissionId)
end

--**********************************
--检测喧ng否可以提交
--**********************************
function x210238_CheckSubmit( sceneId, selfId )

    local Level = GetLevel( sceneId, selfId )
    
    if( Level < 10 ) then
        return 0
    end

	return 1

end

--**********************************
--提交
--**********************************
function x210238_OnSubmit( sceneId, selfId, targetId, selectRadioId )
		-- 安全性检测
		-- 1、检测玩家喧ng不喧ng有C醝 n鄖 任务
		if IsHaveMission(sceneId,selfId,x210238_g_MissionId) <= 0 then
			return
		end
		
		-- 2、Ho鄋 t nhi甿 v鴗o� 鸬 情况检测
		if x210238_CheckSubmit(sceneId, selfId) <= 0    then
			return
		end
		
		-- 金钱和Kinh nghi甿
		

		
		if( x210238_g_exp > 0 ) then
		    LuaFnAddExp( sceneId, selfId, x210238_g_exp)
		end
								
		DelMission( sceneId,selfId, x210238_g_MissionId )
		--设置任务已经被完成过
		MissionCom( sceneId,selfId, x210238_g_MissionId )
		
		
end

--**********************************
--杀死怪物或玩家
--**********************************
function x210238_OnKillObject( sceneId, selfId, objdataId ,objId )

end

--**********************************
--进入区域事件
--**********************************
function x210238_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x210238_OnItemChanged( sceneId, selfId, itemdataId )
end







