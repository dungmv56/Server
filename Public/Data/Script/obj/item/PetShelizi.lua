--珍兽舍利子

x300077_g_scriptId = 300077
x300077_g_bagIndex = -1	
x300077_g_hugeExp = 1500000
--**********************************
--事件交互入口
--**********************************
function x300077_OnDefaultEvent( sceneId, selfId, bagIndex )

	local slzExp = GetBagItemParam(sceneId, selfId, bagIndex, 4, 2) --EXP
	
	local PetGuidH , PetGuidL = LuaFnGetCurrentPetGUID(sceneId, selfId)

	if PetGuidH == nil or PetGuidL == nil then
		BeginEvent(sceneId)
			AddText(sceneId,"#{ZSKSSJ_081113_18}")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end

	if IsPilferLockFlag(sceneId, selfId)  == -1 then
		return
	end
	
	local petLevel		 = LuaFnGetPetLevelByGUID(sceneId, selfId , PetGuidH , PetGuidL)	
	local PetToHumanMaxLevel = GetPetMaxLevelToHuman(sceneId, selfId , PetGuidH , PetGuidL)
	local PetExp		 = GetPet_ExpByGUID(sceneId, selfId , PetGuidH , PetGuidL)
	
	if petLevel >= PetToHumanMaxLevel then
		BeginEvent(sceneId)
			AddText(sceneId,"#{ZSKSSJ_081126_2}")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end


	local levelCanUp = 0;
	local tmpExp = PetExp + slzExp
	
	local expToLevel = LuaFnGetPetNeedExp(sceneId, selfId, petLevel)	
	
	while tmpExp > expToLevel do
		levelCanUp = levelCanUp + 1	
		tmpExp = tmpExp - expToLevel
		expToLevel = LuaFnGetPetNeedExp(sceneId, selfId, petLevel + levelCanUp)
	end

	x300077_g_bagIndex = bagIndex

	BeginUICommand(sceneId);
		UICommand_AddInt(sceneId, slzExp);
		UICommand_AddInt(sceneId, levelCanUp);
		UICommand_AddInt(sceneId, petLevel);
		UICommand_AddInt(sceneId, PetToHumanMaxLevel);
		UICommand_AddInt(sceneId, PetGuidH);
		UICommand_AddInt(sceneId, PetGuidL);
		UICommand_AddInt(sceneId, bagIndex)
	EndUICommand(sceneId);
	DispatchUICommand(sceneId, selfId, 300077);	

end

--**********************************
--C醝 n鄖 物品to� 鸬 使用过程喧ng否类似于技能: 
--H� th痭g会T読 执行开始时检测C醝 n鄖 函数to� 鸬 Tr� v�,如果Tr� v玹h b読则忽略后面to� 鸬 类似技能to� 鸬 执行.
--Tr� v�1: 技能类似to� 鸬 物品,可以继续类似技能to� 鸬 执行；Tr� v�0: 忽略后面to� 鸬 操作.
--**********************************
function x300077_IsSkillLikeScript( sceneId, selfId)
	return 0; --C醝 n鄖 脚本C 动作支持
end

function x300077_UseShelizi(sceneId, selfId , bagIndex)
	
	if LuaFnGetItemTableIndexByIndex(sceneId, selfId , bagIndex) ~= 30900058 then
		return
	end
	
	local slzExp = GetBagItemParam(sceneId, selfId, bagIndex, 4, 2) --EXP

	if slzExp < 0 then
		return
	end	
	local PetGuidH , PetGuidL = LuaFnGetCurrentPetGUID(sceneId, selfId)
	if PetGuidH == nil or PetGuidL == nil then
		BeginEvent(sceneId)
			AddText(sceneId,"#{ZSKSSJ_081113_18}")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	local itemInfo = GetBagItemTransfer(sceneId, selfId ,bagIndex)
	if EraseItem(sceneId, selfId, bagIndex) > 0 then
		
		PetAddExp(sceneId, selfId,slzExp)
		local str = format("#{ZSKSSJ_081126_3}%d#{ZSKSSJ_081126_4}" ,slzExp )
		BeginEvent(sceneId)
			AddText(sceneId,str)
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0);
		if slzExp > x300077_g_hugeExp then
			local PetName = LuaFnGetPetTransferByGUID(sceneId, selfId ,PetGuidH , PetGuidL)
			local PlayerName = GetName(sceneId, selfId)
			local strText = format("#{_INFOUSR%s}#{ZSD_1}#{_INFOMSG%s}#{ZSD_2}#{_INFOMSG%s}#{ZSD_3}%d#{ZSD_4}" ,PlayerName,itemInfo,PetName,slzExp)
			AddGlobalCountNews( sceneId, strText)
		end
	end
end
