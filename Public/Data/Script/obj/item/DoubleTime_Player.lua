-- 双倍Kinh nghi甿时间药水
-- 消耗m祎 c醝药水,

--脚本号
x300039_g_scriptId = 300039
x300039_g_ItemId = 30008002
x300039_g_ItemId_1 = 30008027
x300039_g_ItemId_2 = 30505214

x300039_g_BuffPalyer_25 = 60
x300039_g_BuffAll_15 = 62
x300039_g_BuffPet_25 = 61
x300039_g_BuffPet_2 = 53

--**********************************
--事件交互入口
--**********************************
function x300039_OnDefaultEvent( sceneId, selfId, nItemIndex)

	if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x300039_g_BuffPalyer_25) == 1   then
		BeginEvent(sceneId)
			AddText(sceneId,"Tr阯 ng叨i c醕 h� 疸 t皀 t読 th秈 gian nh鈔 痿i kinh nghi甿 qu� cao!")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x300039_g_BuffAll_15) == 1   then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,x300039_g_scriptId);
			UICommand_AddInt(sceneId,nItemIndex)
			UICommand_AddString(sceneId,"EatMe");
			UICommand_AddString(sceneId,"Tr阯 ng叨i c醕 h� 疸 t皀 t読 th秈 gian nh鈔 痿i kinh nghi甿, mu痭 x醕 nh s� d鴑g ch錸g?");
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 24)

		return
	end
	
	x300039_UseItem( sceneId, selfId, nItemIndex)
	
end

function x300039_IsSkillLikeScript( sceneId, selfId)
	return 0
end

--**********************************
--
--**********************************
function x300039_EatMe( sceneId, selfId, nItemIndex)
	x300039_UseItem( sceneId, selfId, nItemIndex)
end

--**********************************
-- 
--**********************************
function x300039_UseItem( sceneId, selfId, nItemIndex)
	-- 先检测C醝 n鄖  nItemIndex to� 鸬 物品喧ng不喧ng和当前to� 鸬 对应,
	local nItemId = GetItemTableIndexByIndex(sceneId, selfId, nItemIndex)
	if nItemId ~= x300039_g_ItemId and nItemId ~= x300039_g_ItemId_1 and nItemId ~= x300039_g_ItemId_2 then
		BeginEvent(sceneId)
			AddText(sceneId,"  Sai s髏 trong tay n鋓")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end

	--1,看玩家喧ng不喧ng当前to� 鸬 身上to� 鸬 双倍Kinh nghi甿时间喧ng多少,如果达到上限,就不能使用
	local nCurHaveTime = DEGetMoneyTime(sceneId, selfId)
	
	if nCurHaveTime >= 99*60*60   then
		BeginEvent(sceneId)
			AddText(sceneId,"  Tr呔c m, th秈 gian kinh nghi甿 g 痿i m� c醕 h� s� d鴑g Thi阯 linh 餫n c� 疬㧟 疸 皙n m裞 gi緄 h課.")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	--符合使用C醝 n鄖 物品to� 鸬 条件,
	local ret = EraseItem(sceneId, selfId, nItemIndex)
		
	-- 现T読 时间
	local nCurTime = LuaFnGetCurrentTime()

	if ret == 1    then
		DESetMoneyTime(sceneId, selfId, nCurHaveTime + 3600 )
		
		-- 如果玩家当前to� 鸬 双倍Kinh nghi甿时间喧ng被冻结to� 鸬 ,给玩家m祎 c醝提示
		if 1 == DEIsLock(sceneId, selfId)  then
			DESetLock( sceneId, selfId, 0 )
			BeginEvent(sceneId)
				AddText(sceneId,"Th秈 gian nh鈔 痿i kinh nghi甿 m� c醕 h� 痼ng b錸g 疸 疬㧟 gi鋓 痿ng, v� 疬㧟 t錸g th阭 1 gi� th秈 gian nh鈔 痿i kinh nghi甿.")
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			
		else
			BeginEvent(sceneId)
				AddText(sceneId,"S� d鴑g nh鈔 痿i kinh nghi甿 trong 1 gi�.")
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			
		end
		
	else
		BeginEvent(sceneId)
			AddText(sceneId,"V ph kh鬾g th� s� d鴑g")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		
	end
	
	-- 同步数据到客户端
	SendDoubleExpToClient(sceneId,selfId)
end

