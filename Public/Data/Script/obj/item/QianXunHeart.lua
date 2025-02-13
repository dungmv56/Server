-- 寻路之心 ItemID 40004435

-- 脚本号
x300085_g_scriptId = 300085

x300085_g_event = 229024				-- 千寻任务脚本
--任务号
x300085_g_MissionId			= 421

--任务环数
x300085_g_Mission_RoundNum	 = 5		--第5位参数

x300085_g_FuQiMission_IDX		 	= 131	--夫妻关系任务索引
x300085_g_JieBaiMission_IDX		= 132	--结拜关系任务索引
x300085_g_ShiTuMission_IDX		= 133	--师徒关系任务索引

x300085_g_scenePosInfoList = { {sceneId=7,  scenename="Ki猰 C醕", PosName="Ki猰 m鬾 餴畃 th鷜", PosX=130, PosY=140,  PosR=10, Area=711 },
															 {sceneId=8,  scenename="恤n Ho鄋g", PosName="H鉵 h鋓 c ph", PosX=267, PosY=251,  PosR=10, Area=811 },
															 {sceneId=5,  scenename="K韓h K�", PosName="Ng鱟 疳i l鈓 phong", PosX=35 , PosY=265,  PosR=10, Area=511 },
															 {sceneId=4,  scenename="Th醝 H�", PosName="V� t� ca 疣i", PosX=155, PosY=255,  PosR=10, Area=411 },
															 {sceneId=3,  scenename="Tung S絥", PosName="Giang s絥 餫 ki玼", PosX=280, PosY=80,   PosR=10, Area=311 },
															 {sceneId=30, scenename="T鈟 H�", PosName="Nh v鱪g h� b鄌", PosX=170, PosY=230,  PosR=10, Area=3011},															 
															 {sceneId=31, scenename="Long Tuy玭", PosName="Phi l遳 tr馽 h�", PosX=270, PosY=280,  PosR=10, Area=3111},
															 {sceneId=25, scenename="Th呓ng S絥", PosName="T� th鼀 ni阯 hoa", PosX=260, PosY=110,  PosR=10, Area=2512},															 
															 {sceneId=32, scenename="V� Di", PosName="Y阯 t鯽 nh� ki玼", PosX=50 , PosY=180,  PosR=10, Area=3211},															 
															 {sceneId=0,  scenename="L誧 D呓ng", PosName="Kim th鄋h thang tr�", PosX=50,  PosY=220,  PosR=10, Area=11  } }

--**********************************
--事件交互入口
--**********************************
function x300085_OnDefaultEvent( sceneId, selfId, bagIndex )
-- 不C C醝 n鄖 接口,但要保留空函数
end


--**********************************
--C醝 n鄖 物品to� 鸬 使用过程喧ng否类似于技能: 
--H� th痭g会T読 执行开始时检测C醝 n鄖 函数to� 鸬 Tr� v�,如果Tr� v玹h b読则忽略后面to� 鸬 类似技能to� 鸬 执行.
--Tr� v�1: 技能类似to� 鸬 物品,可以继续类似技能to� 鸬 执行；Tr� v�0: 忽略后面to� 鸬 操作.
--**********************************
function x300085_IsSkillLikeScript( sceneId, selfId )
	return 1	 --C醝 n鄖 脚本C 动作支持
end


--**********************************
--直接Hu� b鲂Ч�: 
--H� th痭g会直接调用C醝 n鄖 接口,并根据C醝 n鄖 函数to� 鸬 Tr� v礨醕 nh以后to� 鸬 流程喧ng否执行.
--Tr� v�1: 已经Hu� b龆杂πЧ�,不再执行后续操作；Tr� v�0: 没有检测到相关效果,继续执行.
--**********************************
function x300085_CancelImpacts( sceneId, selfId )
	return 0	 --不C C醝 n鄖 接口,但要保留空函数,并且始终Tr� v�0.
end

--**********************************
--引导心跳处理入口: 
--引导技能会T読 每次心跳结束时调用C醝 n鄖 接口.
--Tr� v�: 1继续下次心跳；0: 中断引导.
--注: 这里喧ng技能生效m祎 次to� 鸬 入口
--**********************************
function x300085_OnActivateEachTick( sceneId, selfId )
	return 1	 --不喧ng引导性脚本, 只保留空函数.
end


--**********************************
--信息提示
--**********************************
function x300085_MsgBox( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--条件检测入口: 
--H� th痭g会T読 技能检测to� 鸬 时间 餴琺调用C醝 n鄖 接口,并根据C醝 n鄖 函数to� 鸬 Tr� v礨醕 nh以后to� 鸬 流程喧ng否执行.
--Tr� v�1: 条件检测通过,可以继续执行；Tr� v�0: 条件检测th b読,中断后续执行.
--**********************************
function x300085_OnConditionCheck( sceneId, selfId )
	
	--背包中to� 鸬 位置
	local	bagId	= LuaFnGetBagIndexOfUsedItem( sceneId, selfId )
	if bagId < 0 then
		return 0
	end
	
	--校验使用to� 鸬 物品
	if( 1 ~= LuaFnVerifyUsedItem( sceneId, selfId ) ) then
		return 0
	end
	
	--检测物品喧ng否加锁
	if LuaFnLockCheck( sceneId, selfId, bagId, 0 ) < 0 then
		x300085_MsgBox( sceneId, selfId, "V ph n鄖 疸 b� kh骯!" )
		return 0
	end

	if IsHaveMission( sceneId, selfId, x300085_g_MissionId ) <= 0 then
		return 0
	end

	local misIndex = GetMissionIndexByID(sceneId,selfId,x300085_g_MissionId)
	local nRoundNum = GetMissionParam(sceneId, selfId, misIndex, x300085_g_Mission_RoundNum)
	local ScintInfo = x300085_g_scenePosInfoList[nRoundNum]
	
	--取 餴琺玩家当前坐标
	local PlayerX = GetHumanWorldX(sceneId,selfId)
	local PlayerY = GetHumanWorldZ(sceneId,selfId)
	--计算玩家与目标 餴琺to� 鸬 距离
	local Distance = floor(sqrt((ScintInfo.PosX-PlayerX)*(ScintInfo.PosX-PlayerX)+(ScintInfo.PosY-PlayerY)*(ScintInfo.PosY-PlayerY)))
	local str = format("Ng呓i t靘 nhi甿 v� 甬 %d: 衖 #G%s#W th錷 d� #G%s#{_INFOAIM%d,%d,%d,%s}#W, v譨 xem c鋘h 皓p giang h� 餴. Th飊h s� d鴑g #YTi阯 nh鈔 ch� l�#W.", nRoundNum, ScintInfo.scenename, ScintInfo.PosName, ScintInfo.PosX, ScintInfo.PosY, ScintInfo.sceneId, ScintInfo.scenename)		
	if sceneId ~= ScintInfo.sceneId then
		BeginEvent(sceneId)
			AddText(sceneId, str)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,-1)
		return 0
	end
	
	--PrintStr("Distance=" .. Distance)

	if Distance > ScintInfo.PosR then
		BeginEvent(sceneId)
			AddText(sceneId,str)
			AddText(sceneId,"Kho鋘g c醕h c騨 "..Distance.." G誳")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,-1)
	
	elseif Distance <= ScintInfo.PosR then  		
 		local	nMisType = GetMissionData( sceneId, selfId, MD_QIANXUN_SELECT_MISSIONTYPE )	--械i vi阯 所选to� 鸬 任务类型
		-- 保证任务关系人也要T読 附近
		if nMisType == x300085_g_FuQiMission_IDX then
			if CallScriptFunction(x300085_g_event,"CheckMission_FuQi",sceneId, selfId) == 0 then
				return 0
			end
		elseif nMisType == x300085_g_JieBaiMission_IDX then
			if CallScriptFunction(x300085_g_event,"CheckMission_JieBai",sceneId, selfId) == 0 then			
				return 0
			end
		elseif nMisType == x300085_g_ShiTuMission_IDX then
			if CallScriptFunction(x300085_g_event,"CheckMission_ShiTu",sceneId, selfId) == 0 then			
				return 0
			end
		else		
			x300085_NotifyTip( sceneId, selfId, "S� d鴑g v ph th b読" )		
			return 0
		end  		
 		 		
 		return 1		
	end
	
	return 0
end

--**********************************
--消耗检测及处理入口: 
--H� th痭g会T読 技能消耗to� 鸬 时间 餴琺调用C醝 n鄖 接口,并根据C醝 n鄖 函数to� 鸬 Tr� v礨醕 nh以后to� 鸬 流程喧ng否执行.
--Tr� v�1: 消耗处理通过,可以继续执行；Tr� v�0: 消耗检测th b読,中断后续执行.
--注意: 这不光负责消耗to� 鸬 检测也负责消耗to� 鸬 执行.
--**********************************
function x300085_OnDeplete( sceneId, selfId )	
	--
	--T読 此还要再次检测m祎 下....
	--
	local ret
	ret = x300085_OnConditionCheck( sceneId, selfId )
	if 0 == ret then
		return 0
	end

	return 1

end

--**********************************
--只会执行m祎 次入口: 
--聚气和瞬发技能会T読 消耗完成后调用C醝 n鄖 接口(聚气结束并且各种条件都Th鯽 m鉵to� 鸬 时候),而引导
--技能也会T読 消耗完成后调用C醝 n鄖 接口(技能to� 鸬 m祎 开始,消耗成功执行之后).
--Tr� v�1: 处理成功；Tr� v�0: 处理th b読.
--注: 这里喧ng技能生效m祎 次to� 鸬 入口
--**********************************
function x300085_OnActivateOnce( sceneId, selfId )
	
	--背包中to� 鸬 位置
	local	bagId	= LuaFnGetBagIndexOfUsedItem( sceneId, selfId )
	if bagId < 0 then
		return 0
	end
	
	CallScriptFunction(x300085_g_event,"OnUseItem",sceneId, selfId, bagId)
	return 1

end
