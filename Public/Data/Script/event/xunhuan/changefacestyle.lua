--调整脸型
--脚本号
x805029_g_ScriptId = 805029

--调整脸型UI 21

--**********************************
--列举事件
--**********************************
function x805029_OnEnumerate( sceneId, selfId, targetId )
	-- 调试信息
	--BeginEvent(sceneId)
	--	AddText(sceneId, "进入调整脸型脚本");
	--EndEvent(sceneId)
	--DispatchMissionTips(sceneId,selfId)	
	
	-- 为什么要 NPC T阯?
	local TransportNPCName=GetName(sceneId,targetId);

	BeginUICommand(sceneId)
		UICommand_AddInt(sceneId,targetId)
		UICommand_AddString(sceneId,TransportNPCName)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 928)
	return
end

--**********************************
--调整脸型
--**********************************
function x805029_FinishAdjust( sceneId, selfId, styleId)

	--  餴琺到调整脸型所需物品to� 鸬 id及其数量
	local ItemId, ItemCount = GetChangeFaceItemIdAndItemCount(styleId)
		
	-- Tr� v捣欠�
	if ItemId < 0 or ItemCount < 0 then
		return
	end
	
	local nItemNum = LuaFnGetAvailableItemCount( sceneId, selfId, ItemId )

	-- 物品喧ng否够用或锁定
	if ItemCount > nItemNum then
		BeginEvent(sceneId)
			AddText(sceneId, "您没有定颜珠,或者定颜珠被锁定.");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
		--  鹫t 疬㧟定颜珠T読 背包中to� 鸬 位置(定颜珠会T読 改变脸型to� 鸬 过程中被删除,所以C 先保存它to� 鸬 信息)
	local ItemPos = LuaFnGetItemPosByItemDataID(sceneId, selfId, ItemId, 0)
	local szItemTransfer = GetBagItemTransfer(sceneId, selfId, ItemPos)
	
	-- 物品检测通过,再检查玩家金钱
	local moneyJZ = GetMoneyJZ (sceneId, selfId)
	local money = GetMoney (sceneId, selfId)
	
	-- 物品和金钱检测都通过
	if (moneyJZ + money >= 50000)	then	
		-- 设置玩家新脸型(会T読 C醝 n鄖 过程中消耗物品和金钱)
		local ret = ChangeHumanFaceModel( sceneId, selfId, styleId )
		if ret == 0  then
			BeginEvent(sceneId)
				AddText(sceneId,"改变脸型成功.");
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		
		-- 改变脸型th b読
		elseif ret == 1 then
			BeginEvent(sceneId)
				AddText(sceneId,"请选择m祎 种新脸型.");
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return
		elseif ret == 3 then
			BeginEvent(sceneId)
				AddText(sceneId, "您没有定颜珠,或者定颜珠被锁定.");
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return
		elseif ret == 4 then	
			BeginEvent(sceneId)
				AddText(sceneId, "Kh鬾g 瘘 ng鈔 l唼ng.");
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return
		else
			return
		end

	-- Kh鬾g 瘘 ng鈔 l唼ng.
	else
		BeginEvent(sceneId)
			AddText(sceneId, "Kh鬾g 瘘 ng鈔 l唼ng");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end	
	
	-- 发送广播
	local message;	
	local randMessage = random(3);
	local nsex = LuaFnGetSex(sceneId, selfId)
	local str1,str2
	if nsex == 0  then
		str1 = "mu礽  "
		str2 = "些p"
	else
		str1 = "huynh  "
		str2 = "皓p trai"
	end
	
	if randMessage == 1 then
		message = format("#c00FFFFCon ng叨i mu痭 khu鬾 m, c鈟 mu痭 v� c鈟, #W#{_INFOUSR%s}#c00FFFF r hi瑄 鹫o l� n鄖 n阯 h鬽 nay d鵱g #W#{_INFOMSG%s}#c00FFFF 瓞 thay 鸨i dung m誳, l鄊 cho Phan An ph鋓 t裞 ch猼, 衖陁 Thuy玭 c鹡g ph鋓 h� th﹏!", LuaFnGetName(sceneId, selfId), szItemTransfer);
	elseif randMessage == 2 then
		message = format("#c00FFFFMa K韓h n骾 tr阯 th� gi緄 n鄖" .. str2 .. "秀 sinh ra r癷! Ch韓h l� #W#{_INFOUSR%s}#c00FFFF l鷆 n銀 con Nh課 l緉 l鄊 r絠 t� tr阯 tr秈 xu痭g, mau 餴 xem" .. str1 .. "餴, c醝#W#{_INFOMSG%s}#c00FFFF n鄖 sau khi s� d鴑g qu� nhi阯 hi畊 qu� v� c鵱g!", LuaFnGetName(sceneId, selfId), szItemTransfer);
	else
		message = format("#c00FFFFA! Sao c� trong d騨g su痠 n鄖 皤u ng豠 b鴑g l阯 h猼 ? Kh鬾g l� b� tr鷑g 鸬c m� ch猼 ? Kh鬾g ph鋓, th� ra l� do #W#{_INFOUSR%s}#c00FFFF m緄 v譨 餴 ngang qua, l� c� m c�. Tr秈 �!" .. str1 .. "D鵱g #W#{_INFOMSG%s}#c00FFFF th� sau n鄖 s� c� 1 dung m誳 tuy畉 th� nh� th� n鄖!", LuaFnGetName(sceneId, selfId), szItemTransfer);
	end

	BroadMsgByChatPipe(sceneId, selfId, message, 4);
end
