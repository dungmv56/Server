--养生法技能学习

--脚本号
x713528_g_ScriptId = 713528

--此npc可以升到to� 鸬 最高等c
x713528_g_nMaxLevel = 30

x713528_g_AbilityID = ABILITY_YANGSHENGFA
--学习界面要说to� 鸬 话
x713528_g_MessageStudy = "Ch� c c醕 h� ch竨 b� #{_MONEY%d} m緄 c� th� h鱟 疬㧟 k� n錸g d咿ng sinh ph醦. C醕 h� c� quy猼 鸶nh h鱟 kh鬾g?"

x713528_g_AbilityName = "D咿ng sinh ph醦"

--**********************************
--任务入口函数
--**********************************
function x713528_OnDefaultEvent( sceneId, selfId, targetId, ButtomNum,g_Npc_ScriptId,bid )
	--玩家技能to� 鸬 等c
	AbilityLevel = QueryHumanAbilityLevel(sceneId, selfId, ABILITY_YANGSHENGFA)
	--玩家加工技能to� 鸬 熟练度
	ExpPoint = GetAbilityExp(sceneId, selfId, ABILITY_YANGSHENGFA)
	--任务判断

	--判断喧ng否已经学会了养生法,如果学会了,则提示已经学会了
	if AbilityLevel >= 1 then
		BeginEvent(sceneId)
        	AddText(sceneId,"C醕 h� 疸 h鱟 k� n錸g d咿ng sinh ph醦 r癷");
        	EndEvent(sceneId)
        DispatchMissionTips(sceneId,selfId)
		return
	end

	--T読 Th鄋h ph� 里学习C醝 n鄖 技能
	if bid then
		x713528_StudyInCity(sceneId, selfId, targetId, ButtomNum,g_Npc_ScriptId,bid)
		return
	end

	--如果 餴琺击to� 鸬 喧ng“K� n錸g h鱟 t”(即参数=0)
	if ButtomNum == 0 then
		
		local tempAbilityId = ABILITY_YANGSHENGFA;
		local tempAbilityLevel = 1;
		local ret, demandMoney, demandExp, limitAbilityExp, limitAbilityExpShow, currentLevelAbilityExpTop, limitLevel = LuaFnGetAbilityLevelUpConfig(tempAbilityId, tempAbilityLevel);
		if ret and ret == 1 then
			BeginEvent(sceneId)
			--AddText(sceneId,x713528_g_MessageStudy)
			local addText = format(x713528_g_MessageStudy, demandMoney);
			AddText(sceneId,addText)
			--X醕 nh学习按钮
					AddNumText(sceneId,x713528_g_ScriptId,"T読 h� x醕 鸶nh mu痭 h鱟", 6, 2)
			--Hu� b鲅鞍磁�
					AddNumText(sceneId,x713528_g_ScriptId,"T読 h� ch� mu痭 coi", 8, 3)
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		end
	elseif ButtomNum == 2 then			--如果 餴琺击to� 鸬 喧ng“我X醕 nh要学习”
		local tempAbilityId = ABILITY_YANGSHENGFA;
		local tempAbilityLevel = 1;
		local ret, demandMoney, demandExp, limitAbilityExp, limitAbilityExpShow, currentLevelAbilityExpTop, limitLevel = LuaFnGetAbilityLevelUpConfig(tempAbilityId, tempAbilityLevel);
		if ret and ret == 1 then
			--检查玩家喧ng否有m祎 c醝银币to� 鸬 现金
			if GetMoney(sceneId,selfId) < demandMoney then			
				BeginEvent(sceneId)
					AddText(sceneId,"C醕 h� kh鬾g 瘘 ng鈔 l唼ng");
					EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				return
			end
			--检查玩家等c喧ng否达到要求
			if GetLevel(sceneId,selfId) < limitLevel then
				BeginEvent(sceneId)
					AddText(sceneId,"衅ng c c黙 ng呓i kh鬾g 瘘");
					EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				return
			end
			--删除金钱
			CostMoney(sceneId,selfId,demandMoney)
			--技能蘈inh�1
			SetHumanAbilityLevel(sceneId,selfId,ABILITY_YANGSHENGFA,1)
			--T読 npc聊天窗口通知玩家已经学会了
			BeginEvent(sceneId)
				AddText(sceneId,"C醕 h� 疸 h鱟 xong k� n錸g d咿ng sinh ph醦")
			EndEvent( )
			DispatchEventList(sceneId,selfId,targetId)
		end
	else --如果 餴琺击“我只喧ng来看看”
		CallScriptFunction( g_Npc_ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
end

--**********************************
--列举事件
--**********************************
function x713528_OnEnumerate( sceneId, selfId, targetId, bid )
		if bid then
			local ret = CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnCityCheck",sceneId, selfId, x713528_g_AbilityID, bid, 5)
			if ret > 0 then AddNumText(sceneId,x713528_g_ScriptId,"H鱟 "..x713528_g_AbilityName.." k� n錸g", 12, 0) end
			return
		end
		--如果不到等c则不显示选项
		--if GetLevel(sceneId,selfId) >= 10 then
			AddNumText(sceneId,x713528_g_ScriptId,"H鱟 k� n錸g d咿ng sinh ph醦", 12, 0)
		--end
		return
end

--**********************************
--检测Ti猵 th跫�
--**********************************
function x713528_CheckAccept( sceneId, selfId )
end

--**********************************
--Ti猵 th�
--**********************************
function x713528_OnAccept( sceneId, selfId, ABILITY_YANGSHENGFA )
end

--T読 Th鄋h ph� 里学习此生活技能时C 执行to� 鸬 函数
function x713528_StudyInCity(sceneId, selfId, targetId, ButtomNum,g_Npc_ScriptId,bid)
	if bid then
		if 0 == ButtomNum then
			--检查Th鄋h ph� 喧ng否处于低维护状态
			if CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "CheckCityStatus",sceneId, selfId,targetId) < 0 then
				return
			end
			--添加条件显示内容
			BeginEvent(sceneId)
			local lv,money,con
			lv,money,con = CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnCityAction",sceneId, selfId, targetId, x713528_g_AbilityID, bid, 4)
			local studyMsg = format("N猽 c醕 h� 鹫t t緄 c %d, ph鋓 ti陁 t痭 #{_MONEY%d} v� %d 餴琺 bang h礽 s� c� th� h鱟 疬㧟 "..x713528_g_AbilityName.." K� n錸g. Ng呓i quy猼 鸶nh h鱟 c醝 g�?", lv, money, con)
			AddText(sceneId,studyMsg)
			--X醕 nh学习按钮
					AddNumText(sceneId,x713528_g_ScriptId,"T読 h� x醕 鸶nh mu痭 h鱟", 6, 2)
			--Hu� b鲅鞍磁�
					AddNumText(sceneId,x713528_g_ScriptId,"T読 h� ch� mu痭 coi", 8, 3)
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		elseif 2 == ButtomNum then
			local ret = CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnCityCheck",sceneId, selfId, x713528_g_AbilityID, bid, 1)
			if ret > 0 then
				CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnCityAction",sceneId, selfId, targetId, x713528_g_AbilityID, bid, 1)
			end
		else
			CallScriptFunction( g_Npc_ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
		end
	end
end
