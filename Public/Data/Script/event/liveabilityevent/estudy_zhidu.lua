--制毒技能学习

--脚本号
x713517_g_ScriptId = 713517

--此npc可以升到to� 鸬 最高等c
x713517_g_nMaxLevel = 5

--学习界面要说to� 鸬 话
x713517_g_MessageStudy = "N猽 c醕 h� 鹫t t緄 c %d v� ph鋓 ti陁 t痭 #{_MONEY%d} m緄 c� th� h鱟 疬㧟 k� n錸g b鄌 ch� 鸬c. C醕 h� c� quy猼 鸶nh h鱟 kh鬾g?"


--**********************************
--任务入口函数
--**********************************
function x713517_OnDefaultEvent( sceneId, selfId, targetId, ButtomNum,g_Npc_ScriptId )
	--玩家技能to� 鸬 等c
	AbilityLevel = QueryHumanAbilityLevel(sceneId, selfId, ABILITY_ZHIDU)
	--玩家制毒技能to� 鸬 熟练度
	ExpPoint = GetAbilityExp(sceneId, selfId, ABILITY_ZHIDU)
	--任务判断

	--判断喧ng否喧ngTinh T鷆派弟子,不喧ngTinh T鷆弟子不能学习
		if GetMenPai(sceneId,selfId) ~= MP_XINGSU then
			BeginEvent(sceneId)
        		AddText(sceneId,"Ng呓i kh鬾g ph鋓 l� 甬 t� b眓 bang, ta kh鬾g th� d誽 ng呓i");
        	EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
	--判断喧ng否已经学会了制毒,如果学会了,则提示已经学会了
	if AbilityLevel >= 1 then
		BeginEvent(sceneId)
        	AddText(sceneId,"Ng呓i 疸 h鱟 k� n錸g ch� t誳 鸬c r癷");
        	EndEvent(sceneId)
        DispatchMissionTips(sceneId,selfId)
		return
	end

	--如果 餴琺击to� 鸬 喧ng“K� n錸g h鱟 t”(即参数=0)
	if ButtomNum == 0 then
		
		local tempAbilityId = ABILITY_ZHIDU;
		local tempAbilityLevel = 1;
		local ret, demandMoney, demandExp, limitAbilityExp, limitAbilityExpShow, currentLevelAbilityExpTop, limitLevel = LuaFnGetAbilityLevelUpConfig(tempAbilityId, tempAbilityLevel);
		if ret and ret == 1 then
			BeginEvent(sceneId)
			--AddText(sceneId,x713517_g_MessageStudy)
			local addText = format(x713517_g_MessageStudy, limitLevel, demandMoney);
			AddText(sceneId,addText)
			--X醕 nh学习按钮
					AddNumText(sceneId,x713517_g_ScriptId,"T読 h� x醕 鸶nh mu痭 h鱟", 6, 2)
			--Hu� b鲅鞍磁�
					AddNumText(sceneId,x713517_g_ScriptId,"T読 h� ch� mu痭 coi", 8, 3)
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		end
	elseif ButtomNum == 2 then			--如果 餴琺击to� 鸬 喧ng“我X醕 nh要学习”
		local tempAbilityId = ABILITY_ZHIDU;
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
			SetHumanAbilityLevel(sceneId,selfId,ABILITY_ZHIDU,1)
			--T読 npc聊天窗口通知玩家已经学会了
			BeginEvent(sceneId)
				AddText(sceneId,"Ng呓i 疸 h鱟 xong k� n錸g ch� t誳 鸬c")
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
function x713517_OnEnumerate( sceneId, selfId, targetId )
		--如果不到等c则不显示选项
		--if GetLevel(sceneId,selfId) >= 10 then
			AddNumText(sceneId,x713517_g_ScriptId,"H鱟 k� n錸g ch� t誳 鸬c", 12, 0)
		--end
		return
end

--**********************************
--检测Ti猵 th跫�
--**********************************
function x713517_CheckAccept( sceneId, selfId )
end

--**********************************
--Ti猵 th�
--**********************************
function x713517_OnAccept( sceneId, selfId, ABILITY_CAIKUANG )
end
