-- 宠物双倍Kinh nghi甿时间药水

--脚本号
x300047_g_scriptId = 300047
x300047_g_ItemId = 30008015
x300047_g_BuffId = 61

x300047_g_BuffPalyer_25 = 60
x300047_g_BuffAll_15 = 62
x300047_g_BuffPet_25 = 61
x300047_g_BuffPet_2 = 53

--**********************************
--事件交互入口
--**********************************
function x300047_OnDefaultEvent( sceneId, selfId, nItemIndex )
	
	-- 如果有自己,就不让再吃
	if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x300047_g_BuffPet_25) == 1   then
		BeginEvent(sceneId)
			AddText(sceneId,"C醕 h� 餫ng s� d鴑g d唼c li畊 nh鈔 痿i kinh nghi甿, vui l騨g sau khi m hi畊 qu� h銀 s� d鴑g ti猵.")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end

	if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x300047_g_BuffPet_2) == 1   then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,x300047_g_scriptId);
			UICommand_AddInt(sceneId,nItemIndex)
			UICommand_AddString(sceneId,"EatMe");
			UICommand_AddString(sceneId,"Tr阯 ng叨i c醕 h� 疸 t皀 t読 th秈 gian nh鈔 痿i kinh nghi甿, mu痭 x醕 nh thay 鸨i ch錸g?");
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 24)
		return
	end
	
	x300047_UseItem( sceneId, selfId, nItemIndex)
	
end

function x300047_IsSkillLikeScript( sceneId, selfId)
	return 0
end

--**********************************
--
--**********************************
function x300047_EatMe( sceneId, selfId, nItemIndex)
	x300047_UseItem( sceneId, selfId, nItemIndex)
end

--**********************************
-- 
--**********************************
function x300047_UseItem( sceneId, selfId, nItemIndex)
	-- 先检测C醝 n鄖  nItemIndex to� 鸬 物品喧ng不喧ng和当前to� 鸬 对应,
	if GetItemTableIndexByIndex(sceneId, selfId, nItemIndex) ~= x300047_g_ItemId  then
		BeginEvent(sceneId)
			AddText(sceneId,"  Sai s髏 trong tay n鋓")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end

	-- 扣m祎 c醝药
	local ret = EraseItem(sceneId, selfId, nItemIndex)

	if ret == 1   then
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x300047_g_BuffId, 100 )
		BeginEvent(sceneId)
			AddText(sceneId,"C醕 h� t錸g 2.5 kinh nghi甿 Tr鈔 th� trong 1 gi�")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		
	else
		BeginEvent(sceneId)
			AddText(sceneId,"V ph kh鬾g th� s� d鴑g")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		
	end
end

