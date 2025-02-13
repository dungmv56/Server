--创建人[ QUFEI 2007-09-27 13:10 UPDATE BugID 25452 ]
--血浴神器事件脚本
--循环任务

--MisDescBegin
--脚本号
x500503_g_ScriptId	= 500503

--Ti猵 th挝馧PC属性
x500503_g_Position_X=266.2833
x500503_g_Position_Z=140.0340
x500503_g_SceneID=1
x500503_g_AccomplishNPC_Name="聈 D� T�"

--任务号
x500503_g_MissionId			= 420
--下m祎 c醝任务to� 鸬 ID
x500503_g_MissionIdNext	= 420
--M鴆 ti陁 nhi甿 v鴑pc
x500503_g_Name			= "聈 D� T�"
--任务归类
x500503_g_MissionKind			= 55
--衅ng c nhi甿 v� 
x500503_g_MissionLevel		= 10000
--喧ng否喧ngTinh英任务
x500503_g_IfMissionElite	= 0
--任务喧ng否已经完成
x500503_g_IsMissionOkFail	= 0		--变量to� 鸬 第0位
--任务C 杀死to� 鸬 怪
--保证可以根据等c动态to� 鸬 变换杀怪数量
x500503_g_RandomCustom = {{ id = "秀 gi猼 ch猼 ", numNeeded = 3, numComplete = 1 }}

--任务文本描述
x500503_g_MissionName			= "Huy猼 D鴆 Th Binh"
--任务描述
x500503_g_MissionInfo			= "H鱟 瘊c th kh�"
--M鴆 ti陁 nhi甿 v�
x500503_g_MissionTarget		= "#{XYSB_20070928_010}"
--未Ho鄋 t nhi甿 v鴗o� 鸬 npc对话
x500503_g_ContinueInfo		= "#{XYSB_20070928_009}"
--Ho鄋 t nhi甿 v鴑pc说to� 鸬 话
x500503_g_MissionComplete	= "Vi甤 ta giao 疸 ho鄋 th鄋h ch遖?"
--环数上限
x500503_g_MaxRound	= 0
--控制脚本
x500503_g_ControlScript		= 001066
--MisDescEnd

--任务脚本号
x500503_g_MissionScriptID	= 2			--变量to� 鸬 第2位
--杀怪总数
x500503_g_KillMonsterCount	= 3		--变量to� 鸬 第3位
--当前杀怪数
x500503_g_KillCountIng	= 4				--变量to� 鸬 第4位

--所拥有to� 鸬 事件ID列表
x500503_g_EventList	= {}

x500503_g_XueXiZhuZaoInfo			= "喧c Th kh�"

--装备纁醝形淦鱰o� 鸬 索引号
x500503_g_WeaponIdx	= 11

x500503_g_Weapon_ATTACK_P	 = 1			-- 物理攻击
x500503_g_Weapon_ATTACK_M  = 2			-- 魔法攻击
x500503_g_Weapon_DEFENCE_P = 3			-- 物理防御
x500503_g_Weapon_DEFENCE_M = 4			-- 魔法防御
x500503_g_Weapon_MISS = 5						-- 闪避
x500503_g_Weapon_HIT  = 6						-- 命中

x500503_g_ITEM_APT_LEVEL = 16				-- 可以Ti猵 th挝駎o� 鸬 武器资质c别
x500503_g_KillMONSTER_COUNT = 5000	-- 要求杀死to� 鸬 怪物总数
x500503_g_WeaponLevelMin		= 40		-- 武器最低等c
x500503_g_WeaponLevelMax		= 150		-- 武器最高等c
x500503_g_AcceptLowLevel		= 40		-- Ti猵 th挝駎o� 鸬 最低等c

x500503_g_Impact_Accept_Mission = 18		-- Ti猵 th挝袷眛o� 鸬 特效ID
x500503_g_Impact_Complete_Mission = 48	-- Ho鄋 t nhi甿 v眛o� 鸬 特效ID

x500503_g_ItemBonus={{id=30505700,num=1,sqlvl=42},{id=30505701,num=1,sqlvl=52},{id=30505702,num=1,sqlvl=62},{id=30505703,num=1,sqlvl=72},{id=30505704,num=1,sqlvl=82},{id=30505705,num=1,sqlvl=92}}   -- 残缺to� 鸬 神节
x500503_g_RadioItemBonus={{id=30302400 ,num=1},{id=30302401,num=1},{id=30302402,num=1},{id=30302403,num=1}}																			 -- 神器配方

-- 任务to� 鸬 类型代号定义
x500503_g_SubMissionTypeEnum = {killMonster=1}

--**********************************
--任务入口函数
--**********************************
-- 餴琺击该任务后执行此脚本
function x500503_OnDefaultEvent( sceneId, selfId, targetId )

	--判断该npc喧ng否喧ng对应任务to� 鸬 npc
	if LuaFnGetName( sceneId, targetId ) ~= x500503_g_Name then
		x500503_NotifyTip( sceneId, selfId, "Nh nhi甿 v� th b読" )					
		return 0
	end
		
	--如果玩家已经接了任务
	if IsHaveMission( sceneId, selfId, x500503_g_MissionId ) > 0 then				
		
		local ItemLevel = GetMissionData( sceneId, selfId, MD_MISSHENBING_WEAPONLEVEL )		--  鹫t 疬㧟扣除to� 鸬 武器to� 鸬 等c
		local Errorlvl = GetMissionData( sceneId, selfId, 0 )															-- 记录错误to� 鸬 武器to� 鸬 等c
		
		local LogInfo	= format( "[ShenBing]: x500503_OnDefaultEvent( sceneId=%d, GUID=%0X ), ItemLevel=%d, Errorlvl=%d",
													sceneId,
													LuaFnObjId2Guid( sceneId, selfId ),
													ItemLevel,
													Errorlvl )
		MissionLog(sceneId, LogInfo)
		
		local shenqilvl = 0					
		
		if ItemLevel >= x500503_g_WeaponLevelMin and ItemLevel < x500503_g_WeaponLevelMin + 10 then
			shenqilvl = x500503_g_ItemBonus[1].sqlvl
		elseif ItemLevel >= x500503_g_WeaponLevelMin + 10 and ItemLevel < x500503_g_WeaponLevelMin + 20 then
			shenqilvl = x500503_g_ItemBonus[2].sqlvl
		elseif ItemLevel >= x500503_g_WeaponLevelMin + 20 and ItemLevel < x500503_g_WeaponLevelMin + 30 then
			shenqilvl = x500503_g_ItemBonus[3].sqlvl
		elseif ItemLevel >= x500503_g_WeaponLevelMin + 30 and ItemLevel < x500503_g_WeaponLevelMin + 40 then
			shenqilvl = x500503_g_ItemBonus[4].sqlvl
		elseif ItemLevel >= x500503_g_WeaponLevelMin + 40 and ItemLevel < x500503_g_WeaponLevelMin + 50 then
			shenqilvl = x500503_g_ItemBonus[5].sqlvl
		elseif ItemLevel >= x500503_g_WeaponLevelMin + 50 then
			shenqilvl = x500503_g_ItemBonus[6].sqlvl	
		else
			shenqilvl = x500503_g_ItemBonus[1].sqlvl
				
			local LogInfo	= format( "[ShenBing]error: x500503_OnDefaultEvent( sceneId=%d, GUID=%0X ), shenqilvl=%d",
															sceneId,
															LuaFnObjId2Guid( sceneId, selfId ),
															shenqilvl )
			MissionLog(sceneId, LogInfo)					
		end
				
		--发送任务需求to� 鸬 信息
		BeginEvent(sceneId)
			AddText(sceneId, x500503_g_MissionName)
			AddText( sceneId, "#{XYSB_20070928_009}" )
			AddText( sceneId, "#r#G本任务对应神器等c: "..shenqilvl )
		EndEvent( )
		bDone = x500503_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId, selfId, targetId, x500503_g_ScriptId, x500503_g_MissionId, bDone)
		
	--如果未接任务
	else	
		--检测等c
		if LuaFnGetLevel( sceneId, selfId ) < x500503_g_AcceptLowLevel then
			BeginEvent(sceneId)	
			AddText( sceneId, "#{XYSB_20070928_002}" )
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return 0
		end
					
		-- 进入Ti猵 th挝窠缑�			
		x500503_AcceptMission( sceneId, selfId, targetId )
		
	end

end

--**********************************
--列举事件
--**********************************
function x500503_OnEnumerate( sceneId, selfId, targetId )

	--判断该npc喧ng否喧ng对应任务to� 鸬 npc
	if LuaFnGetName( sceneId, targetId ) ~= x500503_g_Name then
		return 0
	end

	AddNumText( sceneId, x500503_g_ScriptId, x500503_g_XueXiZhuZaoInfo, 6, 115 )		

end

--**********************************
--检测Ti猵 th跫�,也供子任务调用
--**********************************
function x500503_CheckAccept( sceneId, selfId, targetId )
	
	--检测玩家喧ng否符合Ti猵 th挝駎o� 鸬 条件
	--判断该npc喧ng否喧ng对应任务to� 鸬 npc
	if LuaFnGetName( sceneId, targetId ) ~= x500503_g_Name then
		x500503_NotifyTip( sceneId, selfId, "Nh nhi甿 v� th b読" )					
		return 0
	end

	--已经接过则不符合条件
	if IsHaveMission( sceneId, selfId, x500503_g_MissionId ) > 0 then
		BeginEvent(sceneId)	
		AddText( sceneId, "#{XYSB_20070928_009}" )		
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return 0
	end
	
	--发送任务需求to� 鸬 信息
	BeginEvent(sceneId)
		AddText(sceneId, x500503_g_MissionName)
		AddText(sceneId, "#{XYSB_20070928_003}")
	EndEvent( )
	bDone = 2
	DispatchMissionDemandInfo(sceneId, selfId, targetId, x500503_g_ScriptId, x500503_g_MissionId, bDone)
	
	return 1
end

function x500503_GetKillCountByLevel(iItemLevel)
	local iCount = 5000
	if (iItemLevel>=40 and iItemLevel<50) then
		iCount =3000
	elseif (iItemLevel>=50 and iItemLevel<60) then
		iCount = 4000
	end
	return iCount
end

--**********************************
--Ti猵 th�,仅供子任务调用设置公共参数
--**********************************
function x500503_OnAccept( sceneId, selfId, targetId, scriptId,iItemLevel )
	
	--判断该npc喧ng否喧ng对应任务to� 鸬 npc
 	if LuaFnGetName( sceneId, targetId ) ~= x500503_g_Name then
 		x500503_NotifyTip( sceneId, selfId, "Nh nhi甿 v� th b読" )					
		return 0
	end
	
	
	--加入任务到玩家列表
	local bAdd = AddMission( sceneId, selfId, x500503_g_MissionId, x500503_g_ScriptId, 1, 0, 0 )
	if bAdd < 1 then
		x500503_NotifyTip( sceneId, selfId, "Nh nhi甿 v� th b読" )			
		
		local LogInfo	= format( "[ShenBing]error: x500503_OnAccept( sceneId=%d, GUID=%0X ), bAdd=%d",
														sceneId,
														LuaFnObjId2Guid( sceneId, selfId ),
														bAdd )
		MissionLog(sceneId, LogInfo)
		return 0
	end

	-- 餴琺到任务to� 鸬 序列号
	local	misIndex		= GetMissionIndexByID( sceneId, selfId, x500503_g_MissionId )
	
	--根据序列号把任务变量to� 鸬 第0位置0 (任务完成情况)
	SetMissionByIndex( sceneId, selfId, misIndex, 0, 0 )
	--根据序列号把任务变量to� 鸬 第1位置为任务脚本号
	SetMissionByIndex( sceneId, selfId, misIndex, 2, scriptId )
	local iKillCount =x500503_GetKillCountByLevel(iItemLevel)
	SetMissionByIndex(sceneId, selfId, misIndex, 3, iKillCount)
	SetMissionByIndex(sceneId, selfId, misIndex, 1, 0)
	
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x500503_g_Impact_Accept_Mission, 0 )
	
	local LogInfo	= format( "[ShenBing]Succeed: x500503_OnAccept( sceneId=%d, GUID=%0X ), misIndex=%d",
														sceneId,
														LuaFnObjId2Guid( sceneId, selfId ),
														misIndex )
	MissionLog(sceneId, LogInfo)
		
	return 1

end

--**********************************
--放弃,仅供子任务调用
--**********************************
function x500503_OnAbandon( sceneId, selfId )

	if IsHaveMission( sceneId, selfId, x500503_g_MissionId ) > 0 then
	  DelMission( sceneId, selfId, x500503_g_MissionId )
	else		
		return 0
	end
  
end

--**********************************
--继续
--**********************************
function x500503_OnContinue( sceneId, selfId, targetId )

	----PrintStr("OnContinue...")	
	
	--判断该npc喧ng否喧ng对应任务to� 鸬 npc
	if LuaFnGetName( sceneId, targetId ) ~= x500503_g_Name then
		x500503_NotifyTip( sceneId, selfId, "Nh nhi甿 v� th b読" )					
		return 0
	end
	
	--检测等c
	if LuaFnGetLevel( sceneId, selfId ) < x500503_g_AcceptLowLevel then		
		x500503_NotifyTip( sceneId, selfId, "Nh nhi甿 v� th b読" )					
		return 0
	end
	
	-- 检查任务喧ng否完成
	if x500503_CheckSubmit( sceneId, selfId ) ~= 1 then			
		return 0
	end
	
	BeginEvent(sceneId)
		AddText(sceneId,x500503_g_MissionName)
		AddText( sceneId, x500503_g_MissionComplete )
								
		for i, item in x500503_g_RadioItemBonus do
			AddRadioItemBonus( sceneId, item.id, item.num )					-- 奖励多选m祎 物品
		end
				
		-- AddMoneyBonus( sceneId, x500503_g_MoneyBonus )
	EndEvent( )
	DispatchMissionContinueInfo(sceneId,selfId,targetId,x500503_g_ScriptId,x500503_g_MissionId)
	
end

--**********************************
--检测喧ng否可以提交
--**********************************
function x500503_CheckSubmit( sceneId, selfId )

	if IsHaveMission( sceneId, selfId, x500503_g_MissionId ) <= 0 then				
		return 0
	end

	--T読 此判断提交条件喧ng否符合,并给予相应奖励
	-- 餴琺到任务to� 鸬 序列号
	local misIndex = GetMissionIndexByID(sceneId,selfId,x500503_g_MissionId)	
	if GetMissionParam(sceneId, selfId, misIndex, 0) > 0 then	--察看任务喧ng否完成
		return 1
	end
	
	return 0
	
end

--**********************************
--提交,仅供子任务调用
--**********************************
function x500503_OnSubmit( sceneId, selfId, targetId, selectRadioId )

	-- PrintStr("selectRadioId ="..selectRadioId)
	
	--判断该npc喧ng否喧ng对应任务to� 鸬 npc
	if LuaFnGetName( sceneId, targetId ) ~= x500503_g_Name then
		x500503_NotifyTip( sceneId, selfId, "Tr� nhi甿 v� th b読" )					
		return 0
	end
	
	--检测等c
	if LuaFnGetLevel( sceneId, selfId ) < x500503_g_AcceptLowLevel then		
		x500503_NotifyTip( sceneId, selfId, "Tr� nhi甿 v� th b読" )					
		return 0
	end
		
  -- 检查任务喧ng否完成
	if x500503_CheckSubmit( sceneId, selfId ) ~= 1 then
		x500503_NotifyTip( sceneId, selfId, "Tr� nhi甿 v� th b読" )			
		
		local LogInfo	= format( "[ShenBing]error: x500503_OnSubmit( sceneId=%d, GUID=%0X ), x500503_CheckSubmit=%d",
														sceneId,
														LuaFnObjId2Guid( sceneId, selfId ),
														x500503_CheckSubmit( sceneId, selfId ) )
		MissionLog(sceneId, LogInfo)
		return 0
	end
	
	local	Level			= GetLevel( sceneId, selfId )

	local ItemLevel = GetMissionData( sceneId, selfId, MD_MISSHENBING_WEAPONLEVEL )		--  鹫t 疬㧟扣除to� 鸬 武器to� 鸬 等c
	local Errorlvl = GetMissionData( sceneId, selfId, 0 )																-- 记录错误to� 鸬 武器to� 鸬 等c
	local shenjieID = 0
	
	local LogInfo	= format( "[ShenBing]: x500503_OnSubmit( sceneId=%d, GUID=%0X ), ItemLevel=%d, Errorlvl=%d",
														sceneId,
														LuaFnObjId2Guid( sceneId, selfId ),
														ItemLevel,
														Errorlvl )
	MissionLog(sceneId, LogInfo)
			
	if ItemLevel >= x500503_g_WeaponLevelMin and ItemLevel < x500503_g_WeaponLevelMin + 10 then
			shenjieID = x500503_g_ItemBonus[1].id
	elseif ItemLevel >= x500503_g_WeaponLevelMin + 10 and ItemLevel < x500503_g_WeaponLevelMin + 20 then
			shenjieID = x500503_g_ItemBonus[2].id
	elseif ItemLevel >= x500503_g_WeaponLevelMin + 20 and ItemLevel < x500503_g_WeaponLevelMin + 30 then
			shenjieID = x500503_g_ItemBonus[3].id
	elseif ItemLevel >= x500503_g_WeaponLevelMin + 30 and ItemLevel < x500503_g_WeaponLevelMin + 40 then
			shenjieID = x500503_g_ItemBonus[4].id
	elseif ItemLevel >= x500503_g_WeaponLevelMin + 40 and ItemLevel < x500503_g_WeaponLevelMin + 50 then
			shenjieID = x500503_g_ItemBonus[5].id
	elseif ItemLevel >= x500503_g_WeaponLevelMin + 50 then
			shenjieID = x500503_g_ItemBonus[6].id	
	else
			shenjieID = x500503_g_ItemBonus[1].id
			
			local LogInfo	= format( "[ShenBing]error: x500503_OnSubmit( sceneId=%d, GUID=%0X ), ItemLevel=%d, shenjieID=%d",
														sceneId,
														LuaFnObjId2Guid( sceneId, selfId ),
														ItemLevel,
														shenjieID )
			MissionLog(sceneId, LogInfo)			
	end
	-- PrintStr("ItemLevel ="..ItemLevel)
	-- PrintStr("shenjieID ="..shenjieID)
	
	--添加任务奖励	

	if selectRadioId == x500503_g_RadioItemBonus[1].id or selectRadioId == x500503_g_RadioItemBonus[2].id
			or selectRadioId == x500503_g_RadioItemBonus[3].id or selectRadioId == x500503_g_RadioItemBonus[4].id then
			
			BeginAddItem( sceneId )
			AddItem( sceneId, shenjieID, 2 )
			ret1 = EndAddItem( sceneId, selfId )
									
--			BeginAddItem( sceneId )
--			AddItem( sceneId, selectRadioId, 1 )
--			ret2 = EndAddItem( sceneId, selfId )
									
			if ret1 > 0 then
				TryRecieveItem( sceneId, selfId, shenjieID, QUALITY_MUST_BE_CHANGE )	-- 放不下就没有了				
				TryRecieveItem( sceneId, selfId, selectRadioId, QUALITY_MUST_BE_CHANGE )	-- 放不下就没有了
				
			else
					BeginEvent(sceneId)
					strText = "� 鹫o c� ho nguy阯 li畊 kh鬾g 瘘 kh鬾g gian, th飊h s豠 sang l読 sau l読 皙n l頽h."
					AddText(sceneId,strText);
					EndEvent(sceneId)
					DispatchMissionTips(sceneId,selfId)
					return 0
			end
			
			if DelMission( sceneId, selfId, x500503_g_MissionId ) <= 0 then					
					MissionLog(sceneId, "[ShenBing]error: x500503_OnSubmit..DelMission")
					return 0
			end
			--如果有后续任务,则删除
			if IsHaveMission( sceneId, selfId, x500503_g_MissionIdNext ) > 0 then
					DelMission( sceneId, selfId, x500503_g_MissionIdNext )
			end
			
			--AddExp( sceneId, selfId, Exp )
			--AddMoney( sceneId, selfId, Money )
			--显示对话框
			BeginEvent( sceneId )	
				AddText( sceneId, "  做 餴琺不错,这里有 残缺to� 鸬 神节,算喧ng给C黙 ng呓i 奖励." )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )			
			
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x500503_g_Impact_Complete_Mission, 0 )
	else
			BeginEvent(sceneId)
			strText = "奖励L頽h th b読请重新L頽h ."
			AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return 0
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x500503_OnKillObject( sceneId, selfId, objdataId ,objId)--参数意思: 场景号、玩家objId、怪物表位置号、怪物
		
	-- local nMonsterId = GetMissionParam(sceneId, selfId, misIndex, x500503_g_StrForePart+3)
	-- local _, strMonsterName = GetNpcInfoByNpcId(sceneId,nMonsterId)
	local monsterName = GetMonsterNamebyDataId(objdataId)
	
	local num = GetMonsterOwnerCount(sceneId,objId)
	for i=0,num-1  do
		-- 取 餴琺拥有分配权to� 鸬 人to� 鸬 objId
		local humanObjId = GetMonsterOwnerID(sceneId,objId,i)
		-- PrintStr("humanObjId=" .. humanObjId)
		-- 看C醝 n鄖 人喧ng不喧ng有C醝 n鄖 任务
		if IsHaveMission(sceneId, humanObjId, x500503_g_MissionId) > 0 then
			-- 先判断喧ng不喧ng已经Th鯽 m鉵了完成标志
			local misIndex = GetMissionIndexByID(sceneId,humanObjId,x500503_g_MissionId)
			if GetMissionParam(sceneId, humanObjId, misIndex, 0) <=0  then
				local	PlayerLevel = GetLevel( sceneId, humanObjId )
				local MonsterLevel = GetLevel(sceneId, objId)
	
				if ((PlayerLevel - MonsterLevel >= 0) and (PlayerLevel - MonsterLevel < 10))
					  or ((MonsterLevel - PlayerLevel >= 0) and (MonsterLevel - PlayerLevel < 10)) then
					--SetMissionParamByIndexEx(sceneId, humanObjId, misIndex, 3, 0, 30)														
					local demandKillCount = GetMissionParam(sceneId, humanObjId, misIndex, 3)
		
					--PrintStr("demandKillCount=" .. demandKillCount)
					local killedCount =	GetMissionParam(sceneId, humanObjId, misIndex, 1)
					killedCount = killedCount + 1
					--根据双完美兵器to� 鸬 等c 鹫t 疬㧟玩家C 杀多少c醝怪,
					--可能以前40-60cto� 鸬 玩家已经了Ti猵 th挝駎o� 鸬 杀5000to� 鸬 怪,C 纠正 -zz
					local ItemLevel = GetMissionData( sceneId, humanObjId, MD_MISSHENBING_WEAPONLEVEL )
					local iLevelCount =x500503_GetKillCountByLevel(ItemLevel)	 
					if (iLevelCount<demandKillCount) then
						demandKillCount = iLevelCount
						SetMissionByIndex(sceneId, humanObjId, misIndex, 3, demandKillCount)
					end	
					if (iLevelCount<killedCount) then
						killedCount = iLevelCount
					end
					SetMissionByIndex(sceneId, humanObjId, misIndex, 1, killedCount)
								
					BeginEvent(sceneId)
						local str = format("秀 gi猼 ch猼 qu醝 v y陁 c: %d/%d", "怪物", killedCount, demandKillCount )						
						AddText(sceneId, str)
					EndEvent(sceneId)
					DispatchMissionTips(sceneId, humanObjId)
					if killedCount >= demandKillCount then
						SetMissionByIndex(sceneId, humanObjId, misIndex, 0, 1)
					end
				end --if
			end --if
		end --if
	end --for

end

--**********************************
--进入区域事件
--**********************************
function x500503_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x500503_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--接任务后显示to� 鸬 界面
--**********************************
function x500503_AcceptDialog(sceneId, selfId, rand, g_Dialog, targetId )

	BeginEvent( sceneId )
		AddText( sceneId, g_Dialog )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

end

--**********************************
--交任务后显示to� 鸬 界面
--**********************************
function x500503_SubmitDialog( sceneId, selfId, rand )
end

--**********************************
--把信送到后显示to� 鸬 界面
--**********************************
function x500503_SubmitDialog( sceneId, selfId, rand )
end

--**********************************
--醒目提示
--**********************************
function x500503_NotifyTip( sceneId, selfId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end

--**********************************
--取 餴琺本事件to� 鸬 MissionId,用于obj文件中对话情景to� 鸬 判断
--**********************************
function x500503_GetEventMissionId( sceneId, selfId )	
	MissionLog(sceneId, "[ShenBing]x500503_GetEventMissionId..x500503_g_MissionId="..x500503_g_MissionId)
	return x500503_g_MissionId
end

function x500503_AcceptMission( sceneId, selfId, targetId )

	--判断该npc喧ng否喧ng对应任务to� 鸬 npc
	if LuaFnGetName( sceneId, targetId ) ~= x500503_g_Name then
		x500503_NotifyTip( sceneId, selfId, "Nh nhi甿 v� th b読" )			
		MissionLog(sceneId, "[ShenBing]error: x500503_AcceptMission..LuaFnGetName="..LuaFnGetName( sceneId, targetId ))
		return 0
	end

	local  PlayerName=GetName(sceneId,selfId)		
	
	--发送任务Ti猵 th毕允総o� 鸬 信息
	BeginEvent(sceneId)
		AddText(sceneId,x500503_g_MissionName)
		AddText( sceneId, x500503_g_MissionInfo )
		AddText(sceneId,"#{M_MUBIAO}")
		AddText(sceneId,"#{XYSB_20070928_007}"..PlayerName.."#{XYSB_20070928_008}")		
		AddText(sceneId,"#{M_SHOUHUO}")
		-- AddItemDemand( sceneId, x500503_g_ItemBonus[1].id, x500503_g_ItemBonus[1].num )  -- 奖励m祎 种物品
		
		AddText(sceneId,"#{XYSB_20070930_012}")
						
		for i, item in x500503_g_RadioItemBonus do
			AddRadioItemBonus( sceneId, item.id, item.num )					-- 奖励多选m祎 物品
		end
				
		-- AddMoneyBonus( sceneId, x500503_g_MoneyBonus )
	EndEvent( )
	DispatchMissionInfo(sceneId,selfId,targetId,x500503_g_ScriptId,x500503_g_MissionId)	

end

-- 武器提交事件
function x500503_OnMissionCheck( sceneId, selfId, npcid, scriptId, index1, index2, index3, petindex )
  
	--PrintStr("OnMissionCheck...")
	-- print(sceneId, selfId, npcid, scriptId, index1, index2, index3, petindex)
	
	local LogInfo	= format( "[ShenBing]: x500503_OnMissionCheck( sceneId=%d, GUID=%0X ), index1=%d, index2=%d, index3=%d, petindex=%d",
														sceneId,
														LuaFnObjId2Guid( sceneId, selfId ),
														index1,
														index2,
														index3,
														petindex)	
	MissionLog(sceneId, LogInfo)	
	
	-- 血欲神兵任务提交界面
	-- 提交武器to� 鸬 任务喧ng不喧ng要Ti猵 th鴗o� 鸬 任务
	if scriptId ~= x500503_g_ScriptId then
		x500503_NotifyTip( sceneId, selfId, "Nh nhi甿 v� th b読" )			
		MissionLog(sceneId, "[ShenBing]error: x500503_OnMissionCheck..scriptId="..scriptId)
		return 0
	end
	
	--判断该npc喧ng否喧ng对应任务to� 鸬 npc
	if LuaFnGetName( sceneId, npcid ) ~= x500503_g_Name then
		x500503_NotifyTip( sceneId, selfId, "Nh nhi甿 v� th b読" )			
		MissionLog(sceneId, "[ShenBing]error: x500503_OnMissionCheck..LuaFnGetName="..LuaFnGetName( sceneId, npcid ))
		return 0
	end
	
	--如果玩家已经接了任务
	if IsHaveMission( sceneId, selfId, x500503_g_MissionId ) > 0 then	
		BeginEvent(sceneId)	
		AddText( sceneId, "#{XYSB_20070928_009}" )		
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,npcid)
		return 0
	end
	
	--检测等c
	if LuaFnGetLevel( sceneId, selfId ) < x500503_g_AcceptLowLevel then
		BeginEvent(sceneId)	
		AddText( sceneId, "#{XYSB_20070928_002}" )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,npcid)
		return 0
	end
	
	local index = 0
	local ItemLevel = 0	
	local ItemID = 0	
	local PlayerLevel = GetLevel( sceneId, selfId )
	
	for i=1, 3 do
		if i == 1 then
			index = index1
		elseif i == 2 then
			index = index2
		elseif i == 3 then
			index = index3
		else
			index = index1
		end
		
		if index < 100 then
			ItemLevel = GetBagItemLevel(sceneId, selfId, index)
			ItemID = LuaFnGetItemTableIndexByIndex(sceneId, selfId, index)
			-- PrintStr("ItemID ="..ItemID)
			
			-- 检测武器喧ng否符合任务Ti猵 th�  level >= x500503_g_WeaponLevelMin 内功攻击和外功攻击 >= x500503_g_ITEM_APT_LEVEL 武器to� 鸬 等c不能超过玩家to� 鸬 等c 已鉴定过资质
			local attack_p = GetItemApt(sceneId, selfId, index, x500503_g_Weapon_ATTACK_P)
			local attack_m = GetItemApt(sceneId, selfId, index, x500503_g_Weapon_ATTACK_M)
			local isJudge = LuaFnIsJudgeApt(sceneId, selfId, index)				
			local EquipType = GetItemEquipPoint( ItemID )
			
			local LogInfo	= format( "[ShenBing]: x500503_OnMissionCheck( sceneId=%d, GUID=%0X ), ItemID=%d, ItemLevel=%d, attack_p=%d, attack_m=%d, isJudge=%d, isLock=%d, EquipType=%d",
														sceneId,
														LuaFnObjId2Guid( sceneId, selfId ),
														ItemID,
														ItemLevel,
														attack_p,
														attack_m,
														isJudge,
														LuaFnIsItemAvailable( sceneId, selfId, index ),
														EquipType )	
			MissionLog(sceneId, LogInfo)	
			
			-- 物品喧ng否为武器
			if EquipType ~= 0 then
				x500503_NotifyTip( sceneId, selfId, "#{XYSB_20070928_014}" )								
				return 0
			end
			
			-- 物品喧ng否T読 40c以上
			if ItemLevel < x500503_g_WeaponLevelMin then
				x500503_NotifyTip( sceneId, selfId, "#{XYSB_20070928_014}" )								
				return 0
			end
			
			-- 玩家喧ng否能够使用
			if ItemLevel > PlayerLevel then
				x500503_NotifyTip( sceneId, selfId, "#{XYSB_20070928_015}" )								
				return 0
			end
	
			-- 物品喧ng否鉴定
			if isJudge ~= 1 then
				x500503_NotifyTip( sceneId, selfId, "#{XYSB_20070928_017}" )								
				return 0
			end
			
			-- 物品喧ng否双完美
			if attack_p < x500503_g_ITEM_APT_LEVEL or attack_m < x500503_g_ITEM_APT_LEVEL then
				x500503_NotifyTip( sceneId, selfId, "#{XYSB_20070928_016}" )								
				return 0
			end
	
			-- 物品喧ng否锁定
			if LuaFnIsItemAvailable( sceneId, selfId, index ) == 0 then
					x500503_NotifyTip( sceneId, selfId, "#{XYSB_20070928_018}" )								
					return 0
			end
				
			-- PrintStr("ItemLevel ="..ItemLevel)
				
			local accres = x500503_OnAccept( sceneId, selfId, npcid, scriptId ,ItemLevel)
			
			if accres > 0 then
				local ret = EraseItem( sceneId, selfId, index )
				if	ret > 0 then
					SetMissionData(sceneId, selfId, MD_MISSHENBING_WEAPONLEVEL, ItemLevel )		--记录扣除to� 鸬 武器to� 鸬 等c
					
					local LogInfo	= format( "[ShenBing]: x500503_OnMissionCheck( sceneId=%d, GUID=%0X ), ItemID=%d",
														sceneId,
														LuaFnObjId2Guid( sceneId, selfId ),
														ItemID)	
					MissionLog(sceneId, LogInfo)	
					return 1
				else
					BeginEvent(sceneId)			
						local strText = format("删除武器th b読")
						AddText(sceneId,strText)									
					EndEvent(sceneId)
			
					DispatchEventList(sceneId,selfId,-1)
				end					
			end
			
			x500503_NotifyTip( sceneId, selfId, "Nh nhi甿 v� th b読" )			
			MissionLog(sceneId, "[ShenBing]error: x500503_OnMissionCheck..index..accres="..accres)
			return 0					
						
		end
	end
				
	x500503_NotifyTip( sceneId, selfId, "L頽h 任务th b読: 武器不合格" )
			
end

--/////////////////////////////////////////////////////////////////////////////////////////////////////
--获取具体itemto� 鸬 详细信息
function x500503_GetItemDetailInfo(itemId)
	local itemId, itemName, itemDesc = GetItemInfoByItemId(itemId)
	if itemId == -1 then
		local strText = format("%s物品T読 'EquipBase.txt'没有找到!!", itemName)		
	end
	return itemId, itemName, itemDesc
end	
