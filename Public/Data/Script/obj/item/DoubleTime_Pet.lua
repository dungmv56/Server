-- 宠物双倍Kinh nghi甿时间药水
-- 消耗m祎 c醝药水,为宠物提供m祎 c醝小时双倍Kinh nghi甿时间

--脚本号
x300040_g_scriptId = 300040
x300040_g_ItemId = 30008003
x300040_g_ItemId_1 = 30008028

x300040_g_BuffId = 53

x300040_g_BuffPalyer_25 = 60
x300040_g_BuffAll_15 = 62
x300040_g_BuffPet_25 = 61
x300040_g_BuffPet_2 = 53

--**********************************
--事件交互入口
--**********************************
function x300040_OnDefaultEvent( sceneId, selfId, nItemIndex )

	-- 如果身上有2.5to� 鸬 ,就不让吃
	if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x300040_g_BuffPet_25) == 1   then
		BeginEvent(sceneId)
			AddText(sceneId,"Tr阯 ng叨i c醕 h� 疸 t皀 t読 th秈 gian nh鈔 痿i kinh nghi甿 qu� cao!")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	-- 有相同to� 鸬 ,也不让再吃
	if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x300040_g_BuffPet_2) == 1   then
		BeginEvent(sceneId)
			AddText(sceneId,"C醕 h� 餫ng s� d鴑g d唼c li畊 nh鈔 痿i kinh nghi甿, vui l騨g sau khi m hi畊 qu� h銀 s� d鴑g ti猵.")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	x300040_UseItem( sceneId, selfId, nItemIndex)
end

function x300040_IsSkillLikeScript( sceneId, selfId)
	return 0
end

--**********************************
--
--**********************************
function x300040_EatMe( sceneId, selfId, nItemIndex)
	x300040_UseItem( sceneId, selfId, nItemIndex)
end

--**********************************
-- 
--**********************************
function x300040_UseItem( sceneId, selfId, nItemIndex)
	
	-- 先检测C醝 n鄖  nItemIndex to� 鸬 物品喧ng不喧ng和当前to� 鸬 对应,
	local nItemId = GetItemTableIndexByIndex(sceneId, selfId, nItemIndex)
	if nItemId ~= x300040_g_ItemId and nItemId ~= x300040_g_ItemId_1   then
		BeginEvent(sceneId)
			AddText(sceneId,"  Sai s髏 trong tay n鋓")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	-- 扣m祎 c醝药
	local ret = EraseItem(sceneId, selfId, nItemIndex)

	if ret == 1   then
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x300040_g_BuffId, 100 )
		BeginEvent(sceneId)
			AddText(sceneId,"S� d鴑g nh鈔 痿i kinh nghi甿 cho th� nu鬷 trong 1 gi�.")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		
	else
		BeginEvent(sceneId)
			AddText(sceneId,"V ph kh鬾g th� s� d鴑g")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		
	end
end

