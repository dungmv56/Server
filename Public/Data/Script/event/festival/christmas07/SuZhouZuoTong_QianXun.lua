--创建人[ QUFEI 2007-11-29 10:10 UPDATE BugID 27819 ]
--千寻任务事件脚本
--每种关系任务每天只能做m祎 次,每次20环

--MisDescBegin
--脚本号
x229024_g_ScriptId	= 229024

--Ti猵 th挝馧PC属性
x229024_g_Position_X=129.2676
x229024_g_Position_Z=213.0914
x229024_g_SceneID=1
x229024_g_AccomplishNPC_Name="左桐"

--任务号
x229024_g_MissionId			= 421
--下m祎 c醝任务to� 鸬 ID
x229024_g_MissionIdNext	= 421
--M鴆 ti陁 nhi甿 v鴑pc
x229024_g_Name			= "左桐"
--任务归类
x229024_g_MissionKind			= 12
--衅ng c nhi甿 v� 
x229024_g_MissionLevel		= 10
--喧ng否喧ngTinh英任务
x229024_g_IfMissionElite	= 0
--任务喧ng否已经完成
x229024_g_IsMissionOkFail	= 0		--变量to� 鸬 第0位

--任务文本描述
x229024_g_MissionName			= "千寻"
--任务描述
x229024_g_MissionInfo			= "#{QX_20071129_026}"
--M鴆 ti陁 nhi甿 v�
x229024_g_MissionTarget		= "#{QX_20071129_025}"
--未Ho鄋 t nhi甿 v鴗o� 鸬 npc对话
x229024_g_ContinueInfo		= "#{QIANXUN_INFO_19}"
--Ho鄋 t nhi甿 v鴑pc说to� 鸬 话
x229024_g_MissionComplete	= "#{QX_20071129_039}"
--每天每种关系to� 鸬 环数上限
x229024_g_MaxRound	= 10
--控制脚本
x229024_g_ControlScript		= 001066
--MisDescEnd

--任务喧ng否完成
x229024_g_Mission_IsComplete = 0		--第0位参数
--任务环数
x229024_g_Mission_RoundNum	 = 5		--第5位参数
--任务物品序号
x229024_g_Mission_ItemIdx		 = 6		--第6位参数

x229024_g_QianXunMission_IDX	= 120	--千寻任务索引
x229024_g_MissionInfo_IDX			= 121	--任务� 餴琺魉饕�
x229024_g_FuQiMission_IDX		 	= 131	--夫妻关系任务索引
x229024_g_JieBaiMission_IDX		= 132	--结拜关系任务索引
x229024_g_ShiTuMission_IDX		= 133	--师徒关系任务索引

--添加特殊to� 鸬 m祎 周连续千寻,czf,2009.08.07
x229024_g_SpecialBeginTime	= 20090824
x229024_g_SpecialEndTime	= 20090830
--所拥有to� 鸬 事件ID列表
x229024_g_EventList	= {}

x229024_g_Impact_Accept_Mission 	= 47	-- Ti猵 th挝袷眛o� 鸬 特效ID
x229024_g_PlayerSlow_LVL					= 10	-- Ti猵 th挝駎o� 鸬 最低等c
x229024_g_Activity_DayTime				=	5		-- 活动激活时间:每周五

x229024_g_ItemId = { {id=40004435,num=1},
										 {id=40004436,num=1},
										 {id=40004437,num=1},
										 {id=40004438,num=1} }

x229024_g_Impact_Complete_Mission = 43				-- 任务完成时to� 鸬 吉祥如意特效

x229024_g_scenePosInfoList = { {sceneId=7,  scenename="Ki猰 C醕", PosName="Ki猰 m鬾 餴畃 th鷜", PosX=130, PosY=140,  PosR=10, Area=711 },
															 {sceneId=8,  scenename="恤n Ho鄋g", PosName="H鉵 h鋓 c ph", PosX=267, PosY=251,  PosR=10, Area=811 },
															 {sceneId=5,  scenename="K韓h K�", PosName="Ng鱟 疳i l鈓 phong", PosX=35 , PosY=265,  PosR=10, Area=511 },
															 {sceneId=4,  scenename="Th醝 H�", PosName="V� t� ca 疣i", PosX=155, PosY=255,  PosR=10, Area=411 },
															 {sceneId=3,  scenename="Tung S絥", PosName="Giang s絥 餫 ki玼", PosX=280, PosY=80,   PosR=10, Area=311 },
															 {sceneId=30, scenename="T鈟 H�", PosName="Nh v鱪g h� b鄌", PosX=170, PosY=230,  PosR=10, Area=3011},															 
															 {sceneId=31, scenename="Long Tuy玭", PosName="Phi l遳 tr馽 h�", PosX=270, PosY=280,  PosR=10, Area=3111},
															 {sceneId=25, scenename="Th呓ng S絥", PosName="T� th鼀 ni阯 hoa", PosX=260, PosY=110,  PosR=10, Area=2512},															 
															 {sceneId=32, scenename="V� Di", PosName="Y阯 t鯽 nh� ki玼", PosX=50 , PosY=180,  PosR=10, Area=3211},															 
															 {sceneId=0,  scenename="L誧 D呓ng", PosName="Kim th鄋h thang tr�", PosX=50,  PosY=220,  PosR=10, Area=11  } }
															             

-- 奖励to� 鸬 物品
-- 节日神符
x229024_g_BonusFuJie = 20310010

-- 圣诞帽
x229024_g_BonusItem = { {ItemID01=10410118, ItemID02=10410108},
											  {ItemID01=10410119, ItemID02=10410109},
											  {ItemID01=10410120, ItemID02=10410110},
											  {ItemID01=10410121, ItemID02=10410111},
											  {ItemID01=10410122, ItemID02=10410112},
											  {ItemID01=10410123, ItemID02=10410113},
											  {ItemID01=10410124, ItemID02=10410114},
											  {ItemID01=10410125, ItemID02=10410115},
											  {ItemID01=10410126, ItemID02=10410116},
											  {ItemID01=10410127, ItemID02=10410117} }
											  	
x229024_g_BonusEXP_List = { 0,0,0,0,0,0,0,0,0,17436,                                              
														18416,19369,20328,21326,22297,23274,24291,25280,26309,53543,          
														55908,58352,60811,63284,65707,68209,70727,73259,75739,126150,         
														130300,134474,138564,142784,147029,151297,155479,159795,164133,245746,
														252138,258454,264914,271409,277827,284391,290989,297509,304176,310878,
														317500,324270,331075,337914,344672,351580,358523,365383,372394,379440,
														386403,393517,400666,407731,414948,422200,429367,436688,444043,451433,
														458736,466195,473688,481093,488655,496251,503759,511424,519123,526733,
														534501,542303,550140,557887,565792,573732,581581,589590,597633,605584,
														613696,621842,629895,638110,646360,654515,662834,671187,679574,679574,
														679574,679574,679574,679574,679574,679574,679574,679574,679574,679574,
														679574,679574,679574,679574,679574,679574,679574,679574,679574,        }
                                           
--**********************************
--任务入口函数
--**********************************
-- 餴琺击该任务后执行此脚本
function x229024_OnDefaultEvent( sceneId, selfId, targetId )

	--判断该npc喧ng否喧ng对应任务to� 鸬 npc
	if LuaFnGetName( sceneId, targetId ) ~= x229024_g_Name then
		x229024_NotifyTip( sceneId, selfId, "Nh nhi甿 v� th b読" )					
		return 0
	end
			
	local	key	= GetNumText()	
	if key == x229024_g_QianXunMission_IDX then
		BeginEvent(sceneId)
			AddText(sceneId,"#{QX_20071129_023}")
			AddNumText( sceneId, x229024_g_ScriptId, "夫妻L頽h 任务", 6, x229024_g_FuQiMission_IDX )		
			AddNumText( sceneId, x229024_g_ScriptId, "结拜L頽h 任务", 6, x229024_g_JieBaiMission_IDX )		
			AddNumText( sceneId, x229024_g_ScriptId, "师徒L頽h 任务", 6, x229024_g_ShiTuMission_IDX )		
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif key == x229024_g_MissionInfo_IDX then
		x229024_TalkInfo( sceneId, selfId, targetId, "#{QIANXUN_INFO_02}" )		
		return 0

	elseif key == x229024_g_FuQiMission_IDX or key == x229024_g_JieBaiMission_IDX or key == x229024_g_ShiTuMission_IDX then
		if key == x229024_g_FuQiMission_IDX then
			if x229024_CheckMission_FuQi( sceneId, selfId ) == 0 then
				return 0
			end
		elseif key == x229024_g_JieBaiMission_IDX then
			if x229024_CheckMission_JieBai( sceneId, selfId ) == 0 then
				return 0
			end
		elseif key == x229024_g_ShiTuMission_IDX then
			if x229024_CheckMission_ShiTu( sceneId, selfId ) == 0 then
				return 0
			end
		end
		  	
		-- 如果已经接了任务
		if IsHaveMission( sceneId, selfId, x229024_g_MissionId ) > 0 then
												
			--发送任务需求to� 鸬 信息
			BeginEvent(sceneId)
				AddText(sceneId, x229024_g_MissionName)
				AddText(sceneId, x229024_g_ContinueInfo)			
			EndEvent( )
			
			local bDone = x229024_CheckSubmit( sceneId, selfId )				
			DispatchMissionDemandInfo(sceneId, selfId, targetId, x229024_g_ScriptId, x229024_g_MissionId, bDone)
			
		else			
			-- 任务喧ng否已满
			if IsMissionFull( sceneId, selfId ) == 1 then
				x229024_NotifyTip( sceneId, selfId, "#{QIANXUN_INFO_23}" )
				return 0
			end
			
			SetMissionData( sceneId, selfId, MD_QIANXUN_SELECT_MISSIONTYPE, key )			-- 设置队长所选to� 鸬 任务类型
					
			-- 进入Ti猵 th挝窠缑�			
			x229024_AcceptMission( sceneId, selfId, targetId )				
		end
	else
		x229024_NotifyTip( sceneId, selfId, "Nh nhi甿 v� th b読" )					
		return 0
	end

end

--**********************************
--列举事件
--**********************************
function x229024_OnEnumerate( sceneId, selfId, targetId )

	--判断该npc喧ng否喧ng对应任务to� 鸬 npc
	if LuaFnGetName( sceneId, targetId ) ~= x229024_g_Name then
		return 0
	end

	AddText(sceneId,"#{QIANXUN_INFO_01}")
	if x229024_CheckHuoDongTime() == 1 or x229024_CheckSpecialTime() ==1 then --czf modify
		AddNumText( sceneId, x229024_g_ScriptId, "千寻", 6, x229024_g_QianXunMission_IDX )
	end
		
	AddNumText( sceneId, x229024_g_ScriptId, "关于千寻", 11, x229024_g_MissionInfo_IDX )

end

--**********************************
--检测Ti猵 th跫�,也供子任务调用
--**********************************
function x229024_CheckAccept( sceneId, selfId, targetId )
	
	--检测玩家喧ng否符合Ti猵 th挝駎o� 鸬 条件
	--判断该npc喧ng否喧ng对应任务to� 鸬 npc
	if LuaFnGetName( sceneId, targetId ) ~= x229024_g_Name then
		x229024_NotifyTip( sceneId, selfId, "Nh nhi甿 v� th b読" )					
		return 0
	end
		
	--已经接过则不符合条件
	if IsHaveMission( sceneId, selfId, x229024_g_MissionId ) > 0 then
		x229024_TalkInfo( sceneId, selfId, targetId, "#{QIANXUN_INFO_19}" )							
		return 0
	end
	
	return 1
end

--**********************************
--Ti猵 th�,仅供子任务调用设置公共参数
--**********************************
function x229024_OnAccept( sceneId, selfId, targetId, scriptId )
	
	--判断该npc喧ng否喧ng对应任务to� 鸬 npc
 	if LuaFnGetName( sceneId, targetId ) ~= x229024_g_Name then
 		x229024_NotifyTip( sceneId, selfId, "Nh nhi甿 v� th b読" )					
		return 0
	end

	if x229024_CheckAccept( sceneId, selfId, targetId )<=0 then
		return 0
	end

	local	nMisType = GetMissionData( sceneId, selfId, MD_QIANXUN_SELECT_MISSIONTYPE )	--玩家所选to� 鸬 任务类型

	if nMisType == x229024_g_FuQiMission_IDX then
		if x229024_CheckMission_FuQi( sceneId, selfId ) == 0 then
			return 0
		end
	elseif nMisType == x229024_g_JieBaiMission_IDX then
		if x229024_CheckMission_JieBai( sceneId, selfId ) == 0 then
			return 0
		end
	elseif nMisType == x229024_g_ShiTuMission_IDX then
		if x229024_CheckMission_ShiTu( sceneId, selfId ) == 0 then
			return 0
		end
	else		
		x229024_NotifyTip( sceneId, selfId, "Nh nhi甿 v� th b読" )		
		return 0
	end
	local itemidx = random(getn(x229024_g_ItemId))
	
	if LuaFnGetTaskItemBagSpace( sceneId, selfId ) < x229024_g_ItemId[itemidx].num then
		x229024_NotifyTip( sceneId, selfId, "#{QX_20071129_027}" )		
		return 0
	end
	
	local nYear	 = LuaFnGetThisYear()
	local nMonth = LuaFnGetThisMonth()
  local nDay   = LuaFnGetDayOfThisMonth()
  local curDayTime = nYear*10000+(nMonth+1)*100+nDay
		
	BeginAddItem(sceneId)
	AddItem(sceneId,x229024_g_ItemId[itemidx].id, x229024_g_ItemId[itemidx].num)
	local canAdd = EndAddItem(sceneId,selfId)						
	if canAdd > 0 then						
		--加入任务到玩家列表
		local bAdd = AddMission( sceneId, selfId, x229024_g_MissionId, x229024_g_ScriptId, 0, 1, 0 )
		if bAdd >= 1 then				
			AddItemListToHuman(sceneId,selfId)
			
			-- 餴琺到任务to� 鸬 序列号
			local	misIndex		= GetMissionIndexByID( sceneId, selfId, x229024_g_MissionId )
			
			--根据序列号把任务变量to� 鸬 第0位置0 (任务完成情况)
			SetMissionByIndex( sceneId, selfId, misIndex, x229024_g_Mission_IsComplete, 0 )
			--根据序列号把任务变量to� 鸬 第1位置为任务脚本号
			SetMissionByIndex( sceneId, selfId, misIndex, 2, scriptId )		
			SetMissionByIndex(sceneId, selfId, misIndex, x229024_g_Mission_RoundNum, 1)
			SetMissionByIndex(sceneId, selfId, misIndex, x229024_g_Mission_ItemIdx, itemidx)
			SetMissionData( sceneId, selfId, MD_QIANXUN_SELECT_MISSIONTYPE, nMisType )
						
			if nMisType == x229024_g_FuQiMission_IDX then
				SetMissionData( sceneId, selfId, MD_QIANXUN_FUQI_DAYTIME, curDayTime )
			elseif nMisType == x229024_g_JieBaiMission_IDX then
				SetMissionData( sceneId, selfId, MD_QIANXUN_JIEBAI_DAYTIME, curDayTime )
			elseif nMisType == x229024_g_ShiTuMission_IDX then
				SetMissionData( sceneId, selfId, MD_QIANXUN_SHITU_DAYTIME, curDayTime )
			end
			
			local ScintInfo = x229024_g_scenePosInfoList[1]
			CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, ScintInfo.sceneId, ScintInfo.PosX, ScintInfo.PosY, x229024_g_MissionName)
			
			BeginEvent(sceneId)
				AddText(sceneId,x229024_g_MissionName)
				AddText(sceneId,x229024_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}#r")
				AddText(sceneId,"#{QX_20071129_025}")
				local strText = format("千寻任务第1环: 你只有到%sto� 鸬 #{_INFOAIM%d,%d,%d,%s} m緄 c� th� s� d鴑g寻路之心", ScintInfo.scenename, ScintInfo.PosX, ScintInfo.PosY, ScintInfo.sceneId, ScintInfo.scenename)						
				AddText(sceneId,strText)
				AddText(sceneId,"#e00f000Nh nh�: #e000000使用#gfff0f0滑鼠右键#g000000 餴琺击任务背包中to� 鸬 #gfff0f0寻路之心#g000000,可以显示C 找to� 鸬 任务地 餴琺.")											
			EndEvent( )					
			DispatchEventList(sceneId, selfId, targetId)
			
			-- LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x229024_g_Impact_Accept_Mission, 0 )
		end
	end

	return 1

end

--**********************************
--放弃,仅供子任务调用
--**********************************
function x229024_OnAbandon( sceneId, selfId )
  
  --删除玩家任务列表中对应to� 鸬 任务
  local itemidx = 1
  if IsHaveMission( sceneId, selfId, x229024_g_MissionId ) > 0 then
  	local misIndex = GetMissionIndexByID(sceneId,selfId,x229024_g_MissionId)
 	  itemidx = GetMissionParam(sceneId,selfId,misIndex,x229024_g_Mission_ItemIdx) 	
 	end
	if HaveItem(sceneId, selfId, x229024_g_ItemId[itemidx].id) > 0 then
	  if LuaFnGetAvailableItemCount(sceneId, selfId, x229024_g_ItemId[itemidx].id) >= x229024_g_ItemId[itemidx].num then
	    DelItem( sceneId, selfId, x229024_g_ItemId[itemidx].id, LuaFnGetAvailableItemCount(sceneId, selfId, x229024_g_ItemId[itemidx].id) )
			if IsHaveMission( sceneId, selfId, x229024_g_MissionId ) > 0 then
	 			DelMission( sceneId, selfId, x229024_g_MissionId )
			else		
				return 0
			end
	  else
	  	x229024_NotifyTip( sceneId, selfId, "V ph c黙 c醕 h� hi畁 kh鬾g d鵱g 疬㧟 ho 疸 b� kh骯." )			
			return 0
	  end 
  else
 		if IsHaveMission( sceneId, selfId, x229024_g_MissionId ) > 0 then
	 		DelMission( sceneId, selfId, x229024_g_MissionId )
		else		
			return 0
		end	    
  end
  
end

--**********************************
--继续
--**********************************
function x229024_OnContinue( sceneId, selfId, targetId )
	
	--判断该npc喧ng否喧ng对应任务to� 鸬 npc
	if LuaFnGetName( sceneId, targetId ) ~= x229024_g_Name then
		x229024_NotifyTip( sceneId, selfId, "Nh nhi甿 v� th b読" )					
		return 0
	end
	
	--检测等c
	if LuaFnGetLevel( sceneId, selfId ) < x229024_g_PlayerSlow_LVL then		
		x229024_NotifyTip( sceneId, selfId, "Nh nhi甿 v� th b読" )					
		return 0
	end
	
	-- 检查任务喧ng否完成
	if x229024_CheckSubmit( sceneId, selfId ) ~= 1 then			
		return 0
	end
	
	BeginEvent(sceneId)
		AddText(sceneId,x229024_g_MissionName)
		AddText( sceneId, x229024_g_MissionComplete )				
	EndEvent( )
	DispatchMissionContinueInfo(sceneId,selfId,targetId,x229024_g_ScriptId,x229024_g_MissionId)
	
end

--**********************************
--检测喧ng否可以提交
--**********************************
function x229024_CheckSubmit( sceneId, selfId )

	if IsHaveMission( sceneId, selfId, x229024_g_MissionId ) <= 0 then				
		return 0
	end

	--T読 此判断提交条件喧ng否符合,并给予相应奖励
	-- 餴琺到任务to� 鸬 序列号
	local misIndex = GetMissionIndexByID(sceneId,selfId,x229024_g_MissionId)	
	if GetMissionParam(sceneId, selfId, misIndex, 0) > 0 then	--察看任务喧ng否完成		
		return 1
	end
	
	return 0
	
end

--**********************************
--检测夫妻任务
--**********************************
function x229024_CheckMission_FuQi( sceneId, selfId )

	local nYear	 = LuaFnGetThisYear()
	local nMonth = LuaFnGetThisMonth()
  local nDay   = LuaFnGetDayOfThisMonth()
  local curDayTime = nYear*10000+(nMonth+1)*100+nDay
		
	local nMisDaytime = 0
	local	IsHaveMis = 0
	
	--如果玩家已经接了任务
	if IsHaveMission( sceneId, selfId, x229024_g_MissionId ) > 0 then
		local nMisType 	= GetMissionData( sceneId, selfId, MD_QIANXUN_SELECT_MISSIONTYPE )				-- 玩家身上to� 鸬 任务类型
			
		if nMisType ~= x229024_g_FuQiMission_IDX then
			x229024_NotifyTip( sceneId, selfId, "#{QIANXUN_INFO_18}" )
			return 0
		end
		
		IsHaveMis = 1
	else
		nMisDaytime = GetMissionData( sceneId, selfId, MD_QIANXUN_FUQI_DAYTIME )			--  鹫t 疬㧟上次Ti猵 th蚱薰叵等挝駎o� 鸬 时间
		
		if nMisDaytime == curDayTime then
			x229024_NotifyTip( sceneId, selfId, "#{QX_20071129_032}" )
			
			return 0
		end
		
		IsHaveMis = 0
	end
	
	if x229024_GeneralRule( sceneId, selfId ) == 0 then
		return 0
	end

	-- 组队中喧ng否有两c醝(含)以上to� 鸬 械i vi阯 
	local NumMem = LuaFnGetTeamSize( sceneId, selfId )
  if NumMem < 2 then   	
   	if IsHaveMis == 1 then
    	x229024_NotifyTip( sceneId, selfId, "#{QIANXUN_INFO_08}" )
    else
     	x229024_NotifyTip( sceneId, selfId, "#{QIANXUN_INFO_07}" )						
    end
    return 0
	end 
		
	-- 组队中to� 鸬 两c醝人必须都T読 附近
	local nNearTeamCount = GetNearTeamCount( sceneId, selfId )
  if GetNearTeamCount( sceneId, selfId ) < 2 then  	
   	x229024_NotifyTip( sceneId, selfId, "#{QX_20071129_034}" )						
    return 0
	end 
	
	--喧ng否有夫妻关系....
	local ObjID0 = selfId
	local ObjID1
	for i=0, nNearTeamCount-1 do
		ObjID1 = GetNearTeamMember( sceneId, selfId, i )
		if ObjID0 ~= ObjID1 then
			local	SelfGUID	= LuaFnObjId2Guid( sceneId, ObjID0 )
			local	SpouGUID	= LuaFnGetSpouseGUID( sceneId, ObjID1 )
		
			if LuaFnIsMarried( sceneId, ObjID0 ) ~= 0 and LuaFnIsMarried( sceneId, ObjID1 ) ~= 0 and SelfGUID == SpouGUID then			
		    return 1
			end
		end
	end
	
	x229024_NotifyTip( sceneId, selfId, "#{QIANXUN_INFO_11}" )							
	return 0
	
end

--**********************************
--检测结拜任务
--**********************************
function x229024_CheckMission_JieBai( sceneId, selfId )

	local nYear	 = LuaFnGetThisYear()
	local nMonth = LuaFnGetThisMonth()
  local nDay   = LuaFnGetDayOfThisMonth()
  local curDayTime = nYear*10000+(nMonth+1)*100+nDay
  		
	local nMisDaytime = 0
	local	IsHaveMis = 0
	--如果玩家已经接了任务
	if IsHaveMission( sceneId, selfId, x229024_g_MissionId ) > 0 then	
		local nMisType 	= GetMissionData( sceneId, selfId, MD_QIANXUN_SELECT_MISSIONTYPE )				-- 玩家身上to� 鸬 任务类型
			
		if nMisType ~= x229024_g_JieBaiMission_IDX then
			x229024_NotifyTip( sceneId, selfId, "#{QIANXUN_INFO_18}" )
			return 0
		end
	
		IsHaveMis = 1
	else		
		nMisDaytime = GetMissionData( sceneId, selfId, MD_QIANXUN_JIEBAI_DAYTIME )		--  鹫t 疬㧟上次Ti猵 th岚莨叵等挝駎o� 鸬 时间
		
		if nMisDaytime == curDayTime then
			x229024_NotifyTip( sceneId, selfId, "#{QX_20071129_033}" )
			
			return 0
		end
		
		IsHaveMis = 0
	end

	if x229024_GeneralRule( sceneId, selfId ) == 0 then
		return 0
	end

	-- 组队中喧ng否有两c醝(含)以上to� 鸬 械i vi阯 
	local NumMem = LuaFnGetTeamSize( sceneId, selfId )
  if NumMem < 2 then
   	if IsHaveMis == 1 then
      x229024_NotifyTip( sceneId, selfId, "#{QIANXUN_INFO_15}" )
    else
     x229024_NotifyTip( sceneId, selfId, "#{QIANXUN_INFO_14}" )						
    end
    return 0
	end 
	
	-- 组队中to� 鸬 械i vi阯 必须都T読 附近		
	local nNearTeamCount = GetNearTeamCount( sceneId, selfId )
  if GetNearTeamCount( sceneId, selfId ) < 2 then
   	x229024_NotifyTip( sceneId, selfId, "#{QX_20071129_035}" )						
  	return 0
	end 
	
	--喧ng否有结拜关系....	
	local firstPlayer = selfId
	local otherPlayer
	for i=0, nNearTeamCount-1 do
		otherPlayer = GetNearTeamMember( sceneId, selfId, i )
		if firstPlayer ~= otherPlayer then
			if LuaFnIsBrother(sceneId, firstPlayer, otherPlayer) == 1 then			
				return 1
			end
		end
	end

	x229024_NotifyTip( sceneId, selfId, "#{QIANXUN_INFO_16}" )			
	return 0
	
end

--**********************************
--检测师徒任务
--**********************************
function x229024_CheckMission_ShiTu( sceneId, selfId )
	
	local nYear	 = LuaFnGetThisYear()
	local nMonth = LuaFnGetThisMonth()
  local nDay   = LuaFnGetDayOfThisMonth()
  local curDayTime = nYear*10000+(nMonth+1)*100+nDay

	local nMisDaytime = 0
	local	IsHaveMis = 0
	--如果玩家已经接了任务
	if IsHaveMission( sceneId, selfId, x229024_g_MissionId ) > 0 then
		local nMisType 	= GetMissionData( sceneId, selfId, MD_QIANXUN_SELECT_MISSIONTYPE )				-- 玩家身上to� 鸬 任务类型
			
		if nMisType ~= x229024_g_ShiTuMission_IDX then
			x229024_NotifyTip( sceneId, selfId, "#{QIANXUN_INFO_18}" )
			return 0
		end
		
		IsHaveMis = 1
	else		
		nMisDaytime = GetMissionData( sceneId, selfId, MD_QIANXUN_SHITU_DAYTIME )			--  鹫t 疬㧟上次Ti猵 thν焦叵等挝駎o� 鸬 时间
		
		if nMisDaytime == curDayTime then
			x229024_NotifyTip( sceneId, selfId, "#{QX_20071129_039}" )
			
			return 0
		end
		
		IsHaveMis = 0
	end

	if x229024_GeneralRule( sceneId, selfId ) == 0 then
		return 0
	end

	-- 组队中喧ng否有两c醝(含)以上to� 鸬 械i vi阯 
	local NumMem = LuaFnGetTeamSize( sceneId, selfId )
  if NumMem < 2 then
   	if IsHaveMis == 1 then
       x229024_NotifyTip( sceneId, selfId, "#{QIANXUN_INFO_15}" )
    else
     	x229024_NotifyTip( sceneId, selfId, "#{QIANXUN_INFO_14}" )						
    end
    return 0
	end 
	
	-- 组队中to� 鸬 械i vi阯 必须都T読 附近		
	local nNearTeamCount = GetNearTeamCount( sceneId, selfId )
  if GetNearTeamCount( sceneId, selfId ) < 2 then
   	x229024_NotifyTip( sceneId, selfId, "#{QIANXUN_INFO_17}" )						
    return 0
	end 
	
	-- 队伍中喧ng否有师徒关系....	
	local firstPlayer = selfId
	local otherPlayer
	for i=0, nNearTeamCount-1 do
		otherPlayer = GetNearTeamMember( sceneId, selfId, i )		
		if firstPlayer ~= otherPlayer then
			if LuaFnIsMaster(sceneId, otherPlayer, firstPlayer) == 1 then
				return 1
			end
			if LuaFnIsMaster(sceneId, firstPlayer, otherPlayer) == 1 then
				return 1
			end
		end
	end
	
	x229024_NotifyTip( sceneId, selfId, "#{QX_20071129_036}" )
	return 0
	
end

--**********************************
--提交,仅供子任务调用
--**********************************
function x229024_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	
	--判断该npc喧ng否喧ng对应任务to� 鸬 npc
	if LuaFnGetName( sceneId, targetId ) ~= x229024_g_Name then
		x229024_NotifyTip( sceneId, selfId, "Tr� nhi甿 v� th b読" )					
		return 0
	end
	
	--检测等c
	if LuaFnGetLevel( sceneId, selfId ) < x229024_g_PlayerSlow_LVL then		
		x229024_NotifyTip( sceneId, selfId, "Tr� nhi甿 v� th b読" )					
		return 0
	end
		
  -- 检查任务喧ng否完成
	if x229024_CheckSubmit( sceneId, selfId ) ~= 1 then
		x229024_NotifyTip( sceneId, selfId, "Tr� nhi甿 v� th b読" )				
		return 0
	end
	
	local	nMisType = GetMissionData( sceneId, selfId, MD_QIANXUN_SELECT_MISSIONTYPE )	--械i vi阯 所选to� 鸬 任务类型

	if nMisType == x229024_g_FuQiMission_IDX then
		if x229024_CheckMission_FuQi( sceneId, selfId ) == 0 then
			return 0
		end
	elseif nMisType == x229024_g_JieBaiMission_IDX then
		if x229024_CheckMission_JieBai( sceneId, selfId ) == 0 then
			return 0
		end
	elseif nMisType == x229024_g_ShiTuMission_IDX then
		if x229024_CheckMission_ShiTu( sceneId, selfId ) == 0 then
			return 0
		end
	else		
		x229024_NotifyTip( sceneId, selfId, "Nh nhi甿 v� th b読" )		
		return 0
	end

	-- 队长发H� th痭g公告
	if selfId == GetTeamLeader( sceneId, selfId ) then
		local temp = ""
				
		if nMisType == x229024_g_FuQiMission_IDX then
			temp = "#{QX_20071129_043}"
		elseif nMisType == x229024_g_JieBaiMission_IDX then
			temp = "#{QX_20071129_046}"
		elseif nMisType == x229024_g_ShiTuMission_IDX then
			temp = "#{QX_20071129_047}"
		end
		
		local strText = format("#{_INFOUSR%s}#{QX_20071129_048}%s#{QIANXUN_INFO_24}", GetName(sceneId,selfId), temp )
		BroadMsgByChatPipe( sceneId, 0, strText, 4 )
	end
	
	local playerlvl = LuaFnGetLevel( sceneId, selfId )	
	LuaFnAddExp( sceneId, selfId, x229024_g_BonusEXP_List[playerlvl] )
	DelMission( sceneId, selfId, x229024_g_MissionId )			

end

--**********************************
--杀死怪物或玩家
--**********************************
function x229024_OnKillObject( sceneId, selfId, objdataId ,objId)--参数意思: 场景号、玩家objId、怪物表位置号、怪物
end

--**********************************
--进入区域事件
--**********************************
function x229024_OnEnterArea( sceneId, selfId, zoneId )

	if IsHaveMission( sceneId, selfId, x229024_g_MissionId ) <= 0 then
		return 0
	end
	local misIndex = GetMissionIndexByID(sceneId,selfId,x229024_g_MissionId)
	local index = GetMissionParam(sceneId,selfId,misIndex,x229024_g_Mission_RoundNum)
	if sceneId ~= x229024_g_scenePosInfoList[index].sceneId or zoneId ~= x229024_g_scenePosInfoList[index].Area then
		return 0
	end
	
	local nposX = random(3)
	local nposY = random(3)
	CreateSpecialObjByDataIndex(sceneId, selfId, x229024_g_Impact_Complete_Mission, x229024_g_scenePosInfoList[index].PosX+nposX, x229024_g_scenePosInfoList[index].PosY+nposY, 0)			-- 进入探索区域后播放to� 鸬 特效
end

--**********************************
--道具改变
--**********************************
function x229024_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--接任务后显示to� 鸬 界面
--**********************************
function x229024_AcceptDialog(sceneId, selfId, rand, g_Dialog, targetId )

	BeginEvent( sceneId )
		AddText( sceneId, g_Dialog )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

end

--**********************************
--交任务后显示to� 鸬 界面
--**********************************
function x229024_SubmitDialog( sceneId, selfId, rand )
end

--**********************************
--醒目提示
--**********************************
function x229024_NotifyTip( sceneId, selfId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end

--**********************************
--与NPC对话
--**********************************
function x229024_TalkInfo( sceneId, selfId, targetId, msg )

	BeginEvent(sceneId)
		AddText( sceneId, msg )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end

--**********************************
--取 餴琺本事件to� 鸬 MissionId,用于obj文件中对话情景to� 鸬 判断
--**********************************
function x229024_GetEventMissionId( sceneId, selfId )	
	return x229024_g_MissionId
end

function x229024_AcceptMission( sceneId, selfId, targetId )
	
	--判断该npc喧ng否喧ng对应任务to� 鸬 npc
	if LuaFnGetName( sceneId, targetId ) ~= x229024_g_Name then
		x229024_NotifyTip( sceneId, selfId, "Nh nhi甿 v� th b読" )		
		return 0
	end

	local  PlayerName=GetName(sceneId,selfId)		
	
	--发送任务Ti猵 th毕允総o� 鸬 信息
	BeginEvent(sceneId)
		AddText(sceneId,x229024_g_MissionName)
		AddText( sceneId, x229024_g_MissionInfo )
		AddText(sceneId,"#{M_MUBIAO}")
		AddText(sceneId,"#{QX_20071129_025}")
		AddText(sceneId,"#{M_SHOUHUO}")
		AddText(sceneId,"#{QX_20071129_050}")
		
	EndEvent( )
	DispatchMissionInfo(sceneId,selfId,targetId,x229024_g_ScriptId,x229024_g_MissionId)	

end

--/////////////////////////////////////////////////////////////////////////////////////////////////////
--获取具体itemto� 鸬 详细信息
function x229024_GetItemDetailInfo(itemId)
	local itemId, itemName, itemDesc = GetItemInfoByItemId(itemId)
	if itemId == -1 then
		local strText = format("%s物品T読 'EquipBase.txt'没有找到!!", itemName)		
	end
	return itemId, itemName, itemDesc
end	

--/////////////////////////////////////////////////////////////////////////////////////////////////////
-- 检测任务通用规则
function x229024_GeneralRule( sceneId, selfId )
		
	if GetLevel( sceneId, selfId ) < x229024_g_PlayerSlow_LVL then
		x229024_NotifyTip( sceneId, selfId, "#{QIANXUN_INFO_10}" )		
		return 0
	end
	
	if x229024_CheckHuoDongTime() ~= 1 and x229024_CheckSpecialTime() ~= 1 then --czf modify
		return 0
	end
	
	-- 任务物品栏喧ng否已满
	if LuaFnGetTaskItemBagSpace( sceneId, selfId ) < x229024_g_ItemId[1].num then
		x229024_NotifyTip( sceneId, selfId, "#{QX_20071129_027}" )
		return 0
	end
	
	-- 喧ng否处于组队状态
  if LuaFnHasTeam( sceneId, selfId ) == 0 then
  	--如果玩家已经接了任务
  	if IsHaveMission( sceneId, selfId, x229024_g_MissionId ) > 0 then
  		x229024_NotifyTip( sceneId, selfId, "#{QIANXUN_INFO_05}" )
  	else
  	  x229024_NotifyTip( sceneId, selfId, "#{QIANXUN_INFO_03}" )
  	end
  	
    return 0
  end
 	
	return 1
end

--*******************************************
--或者喧ng 2009年8月24日0 餴琺至2009年8月30日24 餴琺
--连续m祎 周M� ra 千寻,czf,2009.08.07
--*******************************************
function x229024_CheckSpecialTime()

	local curDate = GetTime2Day( )
	
	--如果喧ng喧ng 2009年8月24日0 餴琺至2009年8月30日24 餴琺连续m祎 周,则M� ra 
	if curDate >= x229024_g_SpecialBeginTime and curDate <= x229024_g_SpecialEndTime then
		return 1
	else
		return 0
	end
	
end
--**********************************
--检测活动时间
--**********************************
function x229024_CheckHuoDongTime()

  local nDay = GetTodayWeek()

	-- 检测喧ng否星期五
  if nDay == x229024_g_Activity_DayTime then
  	return 1
	else
		return 0
	end

end

--**********************************
--道具使用
--**********************************
function x229024_OnUseItem( sceneId, selfId, bagIndex )

	if IsHaveMission( sceneId, selfId, x229024_g_MissionId ) <= 0 then
		return 0
	end

	local misIndex = GetMissionIndexByID(sceneId,selfId,x229024_g_MissionId)
	local nRoundNum = GetMissionParam(sceneId, selfId, misIndex, x229024_g_Mission_RoundNum)	
	local ScintInfo = x229024_g_scenePosInfoList[nRoundNum]
	
	--取 餴琺玩家当前坐标
	local PlayerX = GetHumanWorldX(sceneId,selfId)
	local PlayerY = GetHumanWorldZ(sceneId,selfId)
	--计算玩家与目标 餴琺to� 鸬 距离
	local Distance = floor(sqrt((ScintInfo.PosX-PlayerX)*(ScintInfo.PosX-PlayerX)+(ScintInfo.PosY-PlayerY)*(ScintInfo.PosY-PlayerY)))
	
	local str = ""

  if nRoundNum >= x229024_g_MaxRound then
  	local missitemid = GetItemTableIndexByIndex( sceneId, selfId, bagIndex )
		local ret = DelItem( sceneId, selfId, missitemid, 1 )
		
		if ret <= 0 then
			return 0
		end

		-- 100%几率掉落包	
		-- 给Ho鄋 t nhi甿 v鴗o� 鸬 玩家m祎 c醝掉落包
		local nItemId = 0
		local nItemCount = 0					
		local rand =random(100)
		local ntype = 1
		local IsTalkWorld = 0
		local playerlvl = LuaFnGetLevel( sceneId, selfId )
		
		-- 1/20几率掉落圣诞帽
		-- 31492 改为掉落包几率为0
		if random(1) == 10 then
			if playerlvl < 12 then
				ntype = 1
			elseif playerlvl < 22 then
				ntype = 2
			elseif playerlvl < 32 then
				ntype = 3
			elseif playerlvl < 42 then
				ntype = 4
			elseif playerlvl < 52 then
				ntype = 5
			elseif playerlvl < 62 then
				ntype = 6
			elseif playerlvl < 72 then
				ntype = 7
			elseif playerlvl < 82 then
				ntype = 8
			elseif playerlvl < 92 then
				ntype = 9
			else
				ntype = 10
			end
					
			if rand <= 96 then
				nItemId = x229024_g_BonusItem[ntype].ItemID01					-- 拾取绑定
				nItemCount = 1			  	
			else
				nItemId = x229024_g_BonusItem[1].ItemID02					-- 装备绑定
				nItemCount = 1
				IsTalkWorld = 1
			end
		end
							
		-- local x,z = GetWorldPos(sceneId, selfId)
							
		-- local nBoxId = DropBoxEnterScene(	x,z,sceneId )		
		
		-- if nBoxId > -1  then
		-- 	AddItemToBox(sceneId,nBoxId,QUALITY_CREATE_BY_BOSS,1,x229024_g_BonusFuJie)						
		-- 	if nItemCount > 0 then							
		-- 		AddItemToBox(sceneId,nBoxId,QUALITY_CREATE_BY_BOSS,1,nItemId)						
		-- 	end
		-- 							
		-- 	-- 把C醝 n鄖 掉落绑定给制定玩家
		-- 	SetItemBoxOwner(sceneId, nBoxId, LuaFnGetGUID(sceneId,selfId))
		-- 	
		-- 	if IsTalkWorld == 1 then							
		-- 		local strText = format("#{QX_20071129_040}#R#{_INFOUSR%s}#{QX_20071129_041}%s#{QX_20071129_042}", GetName(sceneId,selfId), GetItemName(sceneId,nItemId) )
		-- 		BroadMsgByChatPipe( sceneId, 0, strText, 4 )
		-- 	end
		-- 	-- T読 这里记录M� ra 宝箱to� 鸬 日志
		-- 	LuaFnAuditPlayerBehavior(sceneId, selfId, "M� ra 千寻宝箱");
		-- end
		
		SetMissionByIndex( sceneId, selfId, misIndex, x229024_g_Mission_IsComplete, 1 )													-- 任务完成
		
	else
		
		x229024_NotifyTip( sceneId, selfId, "完成情况:已探索 "..nRoundNum.."/"..x229024_g_MaxRound )
		nRoundNum = nRoundNum+1							
		SetMissionByIndex(sceneId, selfId, misIndex, x229024_g_Mission_RoundNum, nRoundNum)				
		ScintInfo = x229024_g_scenePosInfoList[nRoundNum]
		
		PlayerX = GetHumanWorldX(sceneId,selfId)
		PlayerY = GetHumanWorldZ(sceneId,selfId)
		--计算玩家与目标 餴琺to� 鸬 距离
		Distance = floor(sqrt((ScintInfo.PosX-PlayerX)*(ScintInfo.PosX-PlayerX)+(ScintInfo.PosY-PlayerY)*(ScintInfo.PosY-PlayerY)))
		nRoundNum = GetMissionParam(sceneId, selfId, misIndex, x229024_g_Mission_RoundNum)
		CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, ScintInfo.sceneId, ScintInfo.PosX, ScintInfo.PosY, x229024_g_MissionName)
		
		str = format("千寻任务第%d环: 去#G%s#W探索#G%s#{_INFOAIM%d,%d,%d,%s}#W,m祎 览江湖美景吧.抵达后请使用#Y寻路之心#W.", nRoundNum, ScintInfo.scenename, ScintInfo.PosName, ScintInfo.PosX, ScintInfo.PosY, ScintInfo.sceneId, ScintInfo.scenename)	
		
		BeginEvent(sceneId)
			AddText(sceneId, str)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,-1)
	end
end
