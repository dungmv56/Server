--玄冰术技能升c

--脚本号
x713574_g_ScriptId = 713574

--此npc可以升到to� 鸬 最高等c
x713574_g_nMaxLevel = 10

--**********************************
--任务入口函数
--**********************************
function x713574_OnDefaultEvent( sceneId, selfId, targetId )
	--玩家技能to� 鸬 等c
	AbilityLevel = QueryHumanAbilityLevel(sceneId, selfId, ABILITY_XUANBINGSHU)
	--玩家玄冰术技能to� 鸬 熟练度
	ExpPoint = GetAbilityExp(sceneId, selfId, ABILITY_XUANBINGSHU)
	--任务判断

	--判断喧ng否喧ngThi阯 S絥弟子,不喧ngThi阯 S絥弟子不能学习
		if GetMenPai(sceneId,selfId) ~= MP_TIANSHAN then
			BeginEvent(sceneId)
        		AddText(sceneId,"Ng呓i kh鬾g ph鋓 l� 甬 t� b眓 bang, ta kh鬾g th� d誽 ng呓i");
        	EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
	--如果还没有学会该生活技能
	if AbilityLevel < 1	then
		BeginEvent(sceneId)
			strText = "Ng呓i v鏽 ch遖 h鱟 k� n錸g huy玭 b錸g thu"
			AddText(sceneId,strText)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--如果生活技能等c已经超出该npc所能教to� 鸬 范围
	if AbilityLevel >= x713574_g_nMaxLevel then
		BeginEvent(sceneId)
			strText = "Ta ch� c� th� d誽 ng呓i k� n錸g huy玭 b錸g thu t� c 1-10, h銀 t緄 bang ph醝 瓞 h鱟 c cao h絥"
			AddText(sceneId,strText)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	else
		--DispatchAbilityInfo(sceneId, selfId, targetId,x713574_g_ScriptId, ABILITY_XUANBINGSHU, LEVELUP_ABILITY_MENPAI[AbilityLevel+1].Money, LEVELUP_ABILITY_MENPAI[AbilityLevel+1].HumanExp, LEVELUP_ABILITY_MENPAI[AbilityLevel+1].AbilityExpLimitShow,LEVELUP_ABILITY_MENPAI[AbilityLevel+1].HumanLevelLimit)
		local tempAbilityId = ABILITY_XUANBINGSHU;
		local tempAbilityLevel = AbilityLevel + 1;
		local ret, demandMoney, demandExp, limitAbilityExp, limitAbilityExpShow, currentLevelAbilityExpTop, limitLevel = LuaFnGetAbilityLevelUpConfig(tempAbilityId, tempAbilityLevel);
		if ret and ret == 1 then
			DispatchAbilityInfo(sceneId, selfId, targetId,x713574_g_ScriptId, tempAbilityId, demandMoney, demandExp, limitAbilityExpShow, limitLevel);
		end
	end
end

--**********************************
--列举事件
--**********************************
function x713574_OnEnumerate( sceneId, selfId, targetId )
		--如果不到等c则不显示选项
		if 1 then
			AddNumText(sceneId,x713574_g_ScriptId,"Th錸g c k� n錸g huy玭 b錸g thu", 12, 1)
		end
		return
end

--**********************************
--检测Ti猵 th跫�
--**********************************
function x713574_CheckAccept( sceneId, selfId )
end

--**********************************
--Ti猵 th�
--**********************************
function x713574_OnAccept( sceneId, selfId, ABILITY_XUANBINGSHU )
end
