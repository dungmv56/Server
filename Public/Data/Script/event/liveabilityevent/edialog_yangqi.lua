--生活技能
--养气

--2006-9-18 17:05 (C醝 n鄖 文件存T読 to� 鸬 意义喧ng为了兼容、及扩展,所有真正to� 鸬 判断,都T読 ecity_lifeskillstudy.lua中实现)
x713623_g_ScriptId 		= 713623
x713623_g_AbilityName	= "D咿ng kh�"
x713623_g_AbilityID		= ABILITY_YANGQI

-- 处理玩家所做to� 鸬 选择
function x713623_OnDefaultEvent( sceneId, selfId, targetId, nNum, npcScriptId, bid )
	if bid then
		if 0 == nNum then	--学习
			if CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "CheckCityStatus",sceneId, selfId,targetId) < 0 then
				return
			end
			BeginEvent(sceneId)
			local lv,money,con
			lv,money,con = CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnCityAction",sceneId, selfId, targetId, x713623_g_AbilityID, bid, 4)
			local studyMsg = format("N猽 c醕 h� 鹫t t緄 c %d, ph鋓 ti陁 t痭 #{_MONEY%d} v� %d 餴琺 bang h礽 m緄 c� th� h鱟 k� n錸g d咿ng kh�. C醕 h� c� quy猼 鸶nh h鱟 kh鬾g?", lv, money, con)
			AddText(sceneId,studyMsg)
			--X醕 nh学习按钮
					AddNumText(sceneId,x713623_g_ScriptId,"T読 h� x醕 鸶nh mu痭 h鱟", 6, 3)
			--Hu� b鲅鞍磁�
					AddNumText(sceneId,x713623_g_ScriptId,"T読 h� ch� mu痭 coi", 8, 4)
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		elseif 1 == nNum then	--升c
			if CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "CheckCityStatus",sceneId, selfId,targetId) < 0 then
				return
			end
			local ret = CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnCityCheck",sceneId, selfId, x713623_g_AbilityID, bid, 2)
			if ret > 0 then
				CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnCityAction",sceneId, selfId, targetId, x713623_g_AbilityID, bid, 2)
			end
		elseif 2 == nNum then	--了解
			local dialog = "#{event_liveabilityevent_0032}"
			BeginEvent(sceneId)
				AddText(sceneId, dialog)
			EndEvent(sceneId)
			DispatchEventList(sceneId, selfId, targetId)
		elseif 3 == nNum then	--X醕 nh学习
			local ret = CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnCityCheck",sceneId, selfId, x713623_g_AbilityID, bid, 1)
			if ret > 0 then
				CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnCityAction",sceneId, selfId, targetId, x713623_g_AbilityID, bid, 1)
			end
		elseif 4 <= nNum then	--只来看看
			CallScriptFunction( npcScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
		end
	else
		-- 目前养气技能必须T読 Th鄋h ph� 里才能学习、升c、了解
	end
end

-- 列举选项
-- nNum == 1 学习
-- nNum == 2 升c
-- nNum == 3 了解
function x713623_OnEnumerate( sceneId, selfId, targetId, bid, nNum)
	if bid then
		if 1 == nNum then
			local ret = CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnCityCheck",sceneId, selfId, x713623_g_AbilityID, bid, 5)
			if ret > 0 then AddNumText(sceneId,x713623_g_ScriptId,"H鱟 "..x713623_g_AbilityName.." k� n錸g", 12, 0) end
			return
		elseif 2 == nNum then
			local ret = CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnCityCheck",sceneId, selfId, x713623_g_AbilityID, bid, 6)
			if ret > 0 then AddNumText(sceneId,x713623_g_ScriptId,"Th錸g c"..x713623_g_AbilityName.." k� n錸g", 12, 1) end
			return
		elseif 3 == nNum then
			AddNumText(sceneId,x713623_g_ScriptId,"T読 h� mu痭 t靘 hi瑄 d咿ng kh�",11,2)
			AddNumText(sceneId,x713623_g_ScriptId,"Quay l読",8,5)
		end
	else
		-- 目前养气技能必须T読 Th鄋h ph� 里才能学习、升c、了解
	end
end
