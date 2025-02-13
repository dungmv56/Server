--制药技能升c

--脚本号
x713562_g_ScriptId = 713562

--此npc可以升到to� 鸬 最高等c
x713562_g_MaxLevel = 5

----技能编号
x713562_g_AbilityID = ABILITY_ZHIYAO

--技能名称
x713562_g_AbilityName = " Ch� d唼c "

--**********************************
--任务入口函数
--**********************************
function x713562_OnDefaultEvent( sceneId, selfId, targetId, nNum, npcScriptId, bid )
	--玩家技能to� 鸬 等c
	AbilityLevel = QueryHumanAbilityLevel(sceneId, selfId, x713562_g_AbilityID)
	--玩家加工技能to� 鸬 熟练度
	ExpPoint = GetAbilityExp(sceneId, selfId, x713562_g_AbilityID)
	--任务判断

	--如果还没有学会该生活技能
	if AbilityLevel < 1	then
		BeginEvent(sceneId)
			strText = "Ng呓i v鏽 ch遖 th� h鱟"..x713562_g_AbilityName.." k� n錸g!"
			AddText(sceneId,strText)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--如果喧ngT読 Th鄋h ph� 中升c
	if bid then
		--检查Th鄋h ph� 喧ng否处于低维护状态
		if CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "CheckCityStatus",sceneId, selfId,targetId) < 0 then
			return
		end
		local ret = CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnCityCheck",sceneId, selfId, x713562_g_AbilityID, bid, 2)
		if ret > 0 then
			CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnCityAction",sceneId, selfId, targetId, x713562_g_AbilityID, bid, 2)
		end
		return
	end
	--如果生活技能等c已经超出该npc所能教to� 鸬 范围
	if AbilityLevel >= x713562_g_MaxLevel then
		BeginEvent(sceneId)
			strText = "Ta ch� c� th� d誽 ng呓i t� c 1-5"..x713562_g_AbilityName.." k� n錸g, xin t緄 bang h礽 瓞 h鱟 cao h絥!"..x713562_g_AbilityName.."."
			AddText(sceneId,strText)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	else
		--DispatchAbilityInfo(sceneId, selfId, targetId,x713562_g_ScriptId, x713562_g_AbilityID, LEVELUP_ABILITY_ZHIYAO[AbilityLevel+1].Money, LEVELUP_ABILITY_ZHIYAO[AbilityLevel+1].HumanExp, LEVELUP_ABILITY_ZHIYAO[AbilityLevel+1].AbilityExpLimitShow,LEVELUP_ABILITY_ZHIYAO[AbilityLevel+1].HumanLevelLimit)
		local ret, demandMoney, demandExp, limitAbilityExp, limitAbilityExpShow, currentLevelAbilityExpTop, limitLevel = LuaFnGetAbilityLevelUpConfig(ABILITY_ZHIYAO, AbilityLevel + 1);
		if ret and ret == 1 then
			DispatchAbilityInfo(sceneId, selfId, targetId,x713562_g_ScriptId, x713562_g_AbilityID, demandMoney, demandExp, limitAbilityExpShow, limitLevel);
		end
	end
end

--**********************************
--列举事件
--**********************************
function x713562_OnEnumerate( sceneId, selfId, targetId, bid )
		if bid then
			local ret = CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnCityCheck",sceneId, selfId, x713562_g_AbilityID, bid, 6)
			if ret > 0 then AddNumText(sceneId,x713562_g_ScriptId,"Th錸g c"..x713562_g_AbilityName.." k� n錸g", 12, 1) end
			return
		end
		--如果不到等c则不显示选项
		--if GetLevel(sceneId,selfId) >= LEVELUP_ABILITY_ZHIYAO[1].HumanLevelLimit then
		local ret, demandMoney, demandExp, limitAbilityExp, limitAbilityExpShow, currentLevelAbilityExpTop, limitLevel = LuaFnGetAbilityLevelUpConfig(ABILITY_ZHIYAO, 1);
		if ret and ret == 1 and 1 then
			AddNumText(sceneId,x713562_g_ScriptId,"Th錸g c"..x713562_g_AbilityName.." k� n錸g", 12, 1)
		end
		return
end

--**********************************
--检测Ti猵 th跫�
--**********************************
function x713562_CheckAccept( sceneId, selfId )
end

--**********************************
--Ti猵 th�
--**********************************
function x713562_OnAccept( sceneId, selfId, x713562_g_AbilityID )
end
