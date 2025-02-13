--结婚任务

--脚本号
x806003_g_ScriptId		= 806003

x806003_g_eventId_marry = 0;				-- 我想结婚to� 鸬 事件ID
x806003_g_eventId_selectLevel1 = 1;			-- 选择m祎 般规模婚礼to� 鸬 事件ID
x806003_g_eventId_selectLevel2 = 2;			-- 选择中等规模婚礼to� 鸬 事件ID
x806003_g_eventId_selectLevel3 = 3;			-- 选择豪华规模婚礼to� 鸬 事件ID
x806003_g_eventId_selectLevelCancel = 4;	-- Hu� b鲅≡窕槔窆婺o� 鸬 事件ID
x806003_g_eventId_selfAcceptLevel1 = 5;		-- 自已X醕 nh了选择m祎 般规模婚礼
x806003_g_eventId_selfAcceptLevel2 = 6;		-- 自已X醕 nh了选择中等规模婚礼
x806003_g_eventId_selfAcceptLevel3 = 7;		-- 自已X醕 nh了选择豪华规模婚礼
x806003_g_eventId_selfCancelLevel = 8;		-- 自已Hu� b隽搜≡窕槔窆婺�
x806003_g_eventId_targetAcceptLevel1 = 9;	-- 对方X醕 nh了选择m祎 般规模婚礼
x806003_g_eventId_targetAcceptLevel2 = 10;	-- 对方X醕 nh了选择中等规模婚礼
x806003_g_eventId_targetAcceptLevel3 = 11;	-- 对方X醕 nh了选择豪华规模婚礼
x806003_g_eventId_targetCancelLevel = 12;	-- 对方Hu� b隽搜≡窕槔窆婺�
x806003_g_eventId_end = 13;					-- 结束语

x806003_g_ticketItemId = 30505079;			-- 高c婚礼券ID
x806003_g_ticketItemId2 = 30505106;			-- 中c婚礼券ID

--**********************************
--任务入口函数 请求结婚
--**********************************
function x806003_OnDefaultEvent(sceneId, selfId, targetId)
	local selectEventId	= GetNumText();

	--我想结婚to� 鸬 事件
	if x806003_g_eventId_marry == selectEventId then
		local canMarry = x806003_CheckOpenMarryLevelUI(sceneId, selfId, targetId);
		if canMarry == 1 then
			x806003_OpenMarryLevelUI(sceneId, selfId, targetId);
		end
	--选择婚礼规模to� 鸬 事件
	elseif x806003_g_eventId_selectLevel1 == selectEventId or x806003_g_eventId_selectLevel2 == selectEventId or x806003_g_eventId_selectLevel3 == selectEventId then
	
		local marryLevel = 0;
		--中等
		if x806003_g_eventId_selectLevel2 == selectEventId then
			marryLevel  = 1;
		--豪华
		elseif x806003_g_eventId_selectLevel3 == selectEventId then
			marryLevel  = 2;
		end
	
		x806003_SelfCheckSelectMarryLevel(sceneId, selfId, targetId, marryLevel);
		
	--Hu� b鲅≡窕槔窆婺o� 鸬 事件
	elseif x806003_g_eventId_selectLevelCancel == selectEventId then
		BeginUICommand(sceneId);
		EndUICommand(sceneId);
		DispatchUICommand(sceneId, selfId, 1000);
		
	--自已确认了选择
	elseif x806003_g_eventId_selfAcceptLevel1 == selectEventId or x806003_g_eventId_selfAcceptLevel2 == selectEventId or x806003_g_eventId_selfAcceptLevel3 == selectEventId then
	
		local marryLevel = 0;
		--中等
		if x806003_g_eventId_selfAcceptLevel2 == selectEventId then
			marryLevel  = 1;
		--豪华
		elseif x806003_g_eventId_selfAcceptLevel3 == selectEventId then
			marryLevel  = 2;
		end
		
		x806003_OnSelfAcceptSelectMarryLevel(sceneId, selfId, targetId, marryLevel);
	
	--自已Hu� b隽搜≡窕槔窆婺�
	elseif x806003_g_eventId_selfCancelLevel == selectEventId then
		local canMarry = x806003_CheckOpenMarryLevelUI(sceneId, selfId, targetId);
		if canMarry == 1 then
			x806003_OpenMarryLevelUI(sceneId, selfId, targetId);
		end
		
	--对方确认了选择
	elseif x806003_g_eventId_targetAcceptLevel1 == selectEventId or x806003_g_eventId_targetAcceptLevel2 == selectEventId or x806003_g_eventId_targetAcceptLevel3 == selectEventId then
	
		local marryLevel = 0;
		--中等
		if x806003_g_eventId_targetAcceptLevel2 == selectEventId then
			marryLevel  = 1;
		--豪华
		elseif x806003_g_eventId_targetAcceptLevel3 == selectEventId then
			marryLevel  = 2;
		end
		
		x806003_OnTargetAcceptSelectMarryLevel(sceneId, selfId, targetId, marryLevel);
	
	--对方Hu� b隽搜≡窕槔窆婺�
	elseif x806003_g_eventId_targetCancelLevel == selectEventId then
	
		x806003_OnTargetCancelSelectMarryLevel(sceneId, selfId, targetId);
	
	--结束语
	elseif x806003_g_eventId_end == selectEventId then
		BeginUICommand(sceneId);
		EndUICommand(sceneId);
		DispatchUICommand(sceneId, selfId, 1000);
	end
end

--**********************************
--列举事件
--**********************************
function x806003_OnEnumerate(sceneId, selfId, targetId)
	AddNumText(sceneId, x806003_g_ScriptId, "Ta mu痭 l gia th", 10, x806003_g_eventId_marry);
end

--**********************************
--检测喧ng否Th鯽 m鉵于结婚to� 鸬 条件
--**********************************
function x806003_CheckOpenMarryLevelUI(sceneId, selfId, targetId)
	local ret, maleId, femaleId = x806003_CheckMarry(sceneId, selfId, targetId, 0, 1);
	return ret;
end

--**********************************
-- 婚礼规模to� 鸬 选择页面
--**********************************
function x806003_OpenMarryLevelUI(sceneId, selfId, targetId)
	BeginEvent(sceneId);
		local moneyLevel0 = x806003_CalcNeedMoney(0);
		local moneyLevel1 = x806003_CalcNeedMoney(1);
		local moneyLevel2 = x806003_CalcNeedMoney(2);
		AddText(sceneId, "#{yuelao_jiehun}#r h鬾 l� th鬾g th叨ng, c b� ti玭 #{_MONEY"..moneyLevel0.."}; h鬾 l� quy m� b trung, c ti陁 t痭 #{_MONEY"..moneyLevel1.."}. h鬾 l� quy m� h鄌 hoa, c ti陁 t痭 #{_MONEY"..moneyLevel2.."}");
		AddNumText(sceneId, x806003_g_ScriptId, "H鬾 l� c� quy m� th鬾g th叨ng", 6, x806003_g_eventId_selectLevel1);
		AddNumText(sceneId, x806003_g_ScriptId, "H鬾 l� quy m� b trung", 6, x806003_g_eventId_selectLevel2);
		AddNumText(sceneId, x806003_g_ScriptId, "H鬾 l� quy m� h鄌 hoa", 6, x806003_g_eventId_selectLevel3);
		AddNumText(sceneId, x806003_g_ScriptId, "T誱 th秈 ta kh鬾g chu b� l gia th..", 8, x806003_g_eventId_selectLevelCancel);
	EndEvent(sceneId);
	DispatchEventList(sceneId, selfId, targetId);
end

--**********************************
-- 自已确认选择to� 鸬 页面
--**********************************
function x806003_SelfCheckSelectMarryLevel(sceneId, selfId, targetId, marryLevel)
	
	LuaFnSetHumanMarryInfo(sceneId, selfId, -1, 0);

	BeginEvent(sceneId);
		if marryLevel == 2 then
			AddText(sceneId, "C醕 h� 疸 ch鱪 r癷 "..x806003_GetMarryLevelName(marryLevel)..", 鸢ng th秈 c醕 h� s� ph鋓 tr� #Y"..GetItemName(sceneId, x806003_g_ticketItemId).."#Who#{_MONEY"..x806003_CalcNeedMoney(marryLevel).."}, #r#rC醕 ng呓i 疸 quy猼 鸶nh l gia th ch遖, v� cu礳 s痭g ti猵 t緄 s� b di b d竎h?");
		else
			AddText(sceneId, "C醕 h� 疸 ch鱪 r癷 "..x806003_GetMarryLevelName(marryLevel)..", 鸢ng th秈 c醕 h� s� ph鋓 tr� #Y"..GetItemName(sceneId, x806003_g_ticketItemId).."#W ho#Y"..GetItemName(sceneId, x806003_g_ticketItemId2).."#Who#{_MONEY"..x806003_CalcNeedMoney(marryLevel).."}, #r#rC醕 ng呓i 疸 quy猼 鸶nh l gia th ch遖, v� cu礳 s痭g ti猵 t緄 s� b di b d竎h?");
		end
		local tempAcceptEventID = x806003_g_eventId_selfAcceptLevel1;
		if marryLevel == 1 then
			tempAcceptEventID = x806003_g_eventId_selfAcceptLevel2;
		elseif marryLevel == 2 then
			tempAcceptEventID = x806003_g_eventId_selfAcceptLevel3;
		end		
		AddNumText(sceneId, x806003_g_ScriptId, "Duy畉", 6, tempAcceptEventID);
		AddNumText(sceneId, x806003_g_ScriptId, "Hu�", 8, x806003_g_eventId_selfCancelLevel);
	EndEvent(sceneId);
	DispatchEventList(sceneId, selfId, targetId);
	
end

--**********************************
-- 自已已经确认了C黙 ng呓i 选择to� 鸬 事件
--**********************************
function x806003_OnSelfAcceptSelectMarryLevel(sceneId, selfId, targetId, marryLevel)

	local marryTargetId = x806003_GetMarryTargetId(sceneId, selfId, 1, targetId);
	
	if marryTargetId ~= -1 then
	
		marryTargetGUID = LuaFnGetGUID(sceneId, marryTargetId);
		LuaFnSetHumanMarryInfo(sceneId, selfId, marryTargetGUID, 1);
		
		x806003_TargetCheckSelectMarryLevel(sceneId, selfId, targetId, marryLevel);
		
		x806003_MessageBox(sceneId, selfId, targetId, "玄i 鸠i ph呓ng x醕 nh...");
		
	end
end

--**********************************
-- 对方确认选择to� 鸬 页面
--**********************************
function x806003_TargetCheckSelectMarryLevel(sceneId, selfId, targetId, marryLevel)

	local marryTargetId = x806003_GetMarryTargetId(sceneId, selfId, 1, targetId);
	
	if marryTargetId ~= -1 then
	
		LuaFnSetHumanMarryInfo(sceneId, marryTargetId, -1, 0);
		
		BeginEvent(sceneId);
			if marryLevel == 2 then
				AddText(sceneId, "携i ph呓ng 疸 ch鱪 xong"..x806003_GetMarryLevelName(marryLevel)..", 鸢ng th秈 鸠i ph呓ng s� ph鋓 tr�#Y"..GetItemName(sceneId, x806003_g_ticketItemId).."#Who#{_MONEY"..x806003_CalcNeedMoney(marryLevel).."}, #r#rC醕 ng呓i 疸 quy猼 鸶nh l gia th ch遖, v� cu礳 s痭g ti猵 t緄 s� b di b d竎h?");
			else
				AddText(sceneId, "携i ph呓ng 疸 ch鱪 xong"..x806003_GetMarryLevelName(marryLevel)..", 鸢ng th秈 鸠i ph呓ng s� ph鋓 tr�#Y"..GetItemName(sceneId, x806003_g_ticketItemId).."#W ho#Y"..GetItemName(sceneId, x806003_g_ticketItemId2).."#Who#{_MONEY"..x806003_CalcNeedMoney(marryLevel).."}, #r#rC醕 ng呓i 疸 quy猼 鸶nh l gia th ch遖, v� cu礳 s痭g ti猵 t緄 s� b di b d竎h?");
			end
			local tempAcceptEventID = x806003_g_eventId_targetAcceptLevel1;
			if marryLevel == 1 then
				tempAcceptEventID = x806003_g_eventId_targetAcceptLevel2;
			elseif marryLevel == 2 then
				tempAcceptEventID = x806003_g_eventId_targetAcceptLevel3;
			end
			AddNumText(sceneId, x806003_g_ScriptId, "Duy畉", 6, tempAcceptEventID);
			AddNumText(sceneId, x806003_g_ScriptId, "Hu�", 8, x806003_g_eventId_targetCancelLevel);
		EndEvent(sceneId);
		DispatchEventList(sceneId, marryTargetId, targetId);
	end
end

--**********************************
-- 对方已经确认了C黙 ng呓i 选择to� 鸬 事件
--**********************************
function x806003_OnTargetAcceptSelectMarryLevel(sceneId, selfId, targetId, marryLevel)

	local marryTargetId = x806003_GetMarryTargetId(sceneId, selfId, 1, targetId);
	
	if marryTargetId ~= -1 then
	
		--此时to� 鸬 self=对方
		marryTargetGUID = LuaFnGetGUID(sceneId, marryTargetId);
		LuaFnSetHumanMarryInfo(sceneId, selfId, marryTargetGUID, 1);

		local checkRet, maleId, femaleId = x806003_CheckMarry(sceneId, marryTargetId, targetId, marryLevel, 0);
		if checkRet == 1 then
			x806003_DoMarry(sceneId, marryTargetId, targetId, marryLevel, maleId, femaleId);
		end
		
	end
end

--**********************************
-- 对方已经Hu� b隽薈黙 ng呓i 选择to� 鸬 事件
--**********************************
function x806003_OnTargetCancelSelectMarryLevel(sceneId, selfId, targetId, marryLevel)

	--关闭自已to� 鸬 窗口
	BeginUICommand(sceneId);
	EndUICommand(sceneId);
	DispatchUICommand(sceneId, selfId, 1000);
	
	--提示信息给对方
	local marryTargetId = x806003_GetMarryTargetId(sceneId, selfId, 0, targetId);
	
	if marryTargetId ~= -1 then
	
		x806003_MessageBox(sceneId, marryTargetId, targetId, "携i ph呓ng 疸 t� ch痠");
		
	end
end

--**********************************
-- 判断喧ng否可以结婚
--**********************************
function x806003_CheckMarry(sceneId, selfId, targetId, marryLevel, isCheckOpenMarryLevelUI)
	local szMsg = "N猽 mu痭 l gia th, 2 b阯 nh� trai v� nh� g醝 c鵱g h鱬 th鄋h m祎 nh髆 r癷 t緄 t靘 ta"
	if LuaFnHasTeam(sceneId, selfId) == 0 then
		x806003_MessageBox(sceneId, selfId, targetId, szMsg);
		return 0, -1, -1;
	end
	
	szMsg = "Nh髆 c黙 鸬i k猼 h鬾 nh thi猼 ph鋓 do hai b阯 nh� trai-g醝 h䅟 th鄋h, kh鬾g 疬㧟 c� th鄋h vi阯 ngo鄆"
	if LuaFnGetTeamSize(sceneId, selfId) ~= 2 then
		x806003_MessageBox(sceneId, selfId, targetId, szMsg);
		return 0, -1, -1;
	end

	szMsg = "Ch� c� 2 ng叨i 皤u 皙n b阯 ta m緄 c� th� k猼 h鬾"
	local nearNum = GetNearTeamCount(sceneId, selfId);
	if nearNum ~= 2 then
		x806003_MessageBox(sceneId, selfId, targetId, szMsg);
		return 0, -1, -1;
	end

	szMsg = "Hai b阯 b bu礳 ph鋓 kh醕 gi緄 t韓h m緄 c� th� k猼 h鬾"
	local maleId = -1;
	local femaleId = -1;
	local marryTargetId = -1;
	for nearIndex = 0, nearNum - 1 do
		local memId = GetNearTeamMember(sceneId, selfId, nearIndex);
		local sexType = LuaFnGetSex(sceneId, memId);
		if sexType == 1 then
			maleId = memId;
		else
			femaleId = memId;
		end
		if memId ~= selfId then
			marryTargetId = memId;
		end
	end
	
	if maleId == -1 or femaleId == -1 then
		x806003_MessageBox(sceneId, selfId, targetId, szMsg);
		return 0, -1, -1;
	end

	szMsg = "Khi l gia th, b阯 nam ph鋓 鹫t 35 c, b阯 n� ph鋓 鹫t 20 c"
	if LuaFnGetLevel(sceneId, maleId) < 35 or LuaFnGetLevel(sceneId, femaleId) < 20 then
		x806003_MessageBox(sceneId, selfId, targetId, szMsg);
		return 0, -1, -1;
	end

	szMsg = "Hai b阯 皤u ph鋓 ch遖 k猼 h鬾 m緄 c� th� k猼 h鬾"
	if LuaFnIsMarried(sceneId, maleId) > 0 or LuaFnIsMarried(sceneId, femaleId) > 0 then
		x806003_MessageBox(sceneId, selfId, targetId, szMsg);
		return 0, -1, -1;
	end

	szMsg = "N猽 mu痭 l gia th, 鸬 h鎢 h鋙 c黙 hai b阯 c 鹫t t緄 1000"
	if LuaFnIsFriend(sceneId, maleId, femaleId) ~= 1 or LuaFnIsFriend(sceneId, femaleId, maleId) ~= 1 then
		x806003_MessageBox(sceneId, selfId, targetId, szMsg);
		return 0, -1, -1;
	end

	if LuaFnGetFriendPoint(sceneId, maleId, femaleId) < 1000 or LuaFnGetFriendPoint(sceneId, femaleId, maleId) < 1000 then
		x806003_MessageBox(sceneId, selfId, targetId, szMsg);
		return 0, -1, -1;
	end

	szMsg = "C醕 ng呓i l� s� 鸢, l鄊 sao c� th� l gia th 疬㧟?"
	if LuaFnIsMaster(sceneId, maleId, femaleId) == 1 or LuaFnIsMaster(sceneId, femaleId, maleId) == 1 then
		x806003_MessageBox(sceneId, selfId, targetId, szMsg);
		return 0, -1, -1;
	end

	szMsg = "Hai b阯 疸 k猼 h鬾, kh鬾g th� k猼 h鬾 疬㧟 n鎍"
	if LuaFnIsBrother(sceneId, maleId, femaleId) == 1 or LuaFnIsBrother(sceneId, femaleId, maleId) == 1 then
		x806003_MessageBox(sceneId, selfId, targetId, szMsg);
		return 0, -1, -1;
	end
	
	if isCheckOpenMarryLevelUI and isCheckOpenMarryLevelUI == 1 then
		return 1, -1, -1;
	end
	
	local ticketItemPos = -1;
	local selectTicketItemId = -1;
	if marryLevel == 2 then
		ticketItemPos = GetBagPosByItemSn(sceneId, selfId, x806003_g_ticketItemId);
		selectTicketItemId = x806003_g_ticketItemId;
	else
		ticketItemPos = GetBagPosByItemSn(sceneId, selfId, x806003_g_ticketItemId2);
		selectTicketItemId = x806003_g_ticketItemId2;
		if not ticketItemPos or ticketItemPos < 0 then
			ticketItemPos = GetBagPosByItemSn(sceneId, selfId, x806003_g_ticketItemId);
			selectTicketItemId = x806003_g_ticketItemId;
		end
	end
	if ticketItemPos and ticketItemPos > -1 then
		local checkRet = LuaFnIsItemAvailable(sceneId, selfId, ticketItemPos);
		if not checkRet or checkRet ~= 1 then
			x806003_MessageBox(sceneId, selfId, targetId, "C黙 c醕 h�#Y"..GetItemName(sceneId, selectTicketItemId).."#Wb� kh骯 鸶nh r癷, cho n阯 b鈟 gi� kh鬾g th� giao cho ta.");
			x806003_MessageBox(sceneId, marryTargetId, targetId, " 鸠i ph呓ng#Y "..GetItemName(sceneId, selectTicketItemId).."#Wb� kh骯 鸶nh r癷, cho n阯 b鈟 gi� kh鬾g th� giao cho ta.");
			return 0, -1, -1;
		end
	else
	--hzp 2008-12-9
		local nMoneyJZ = GetMoneyJZ(sceneId, selfId);
		local nMoneyJB = LuaFnGetMoney(sceneId, selfId);
		local nMoneySelf = nMoneyJZ + nMoneyJB;
		local needMoney = x806003_CalcNeedMoney(marryLevel);
		if nMoneyJZ and nMoneyJB and nMoneySelf and needMoney and nMoneySelf >= needMoney then
		else
			szMsg = "Xin l瞚, ng鈔 l唼ng tr阯 ng叨i c醕 h� kh鬾g 瘘"
			x806003_MessageBox(sceneId, selfId, targetId, szMsg);
			szMsg = "Xin l瞚, ng鈔 l唼ng tr阯 ng叨i 鸠i ph呓ng kh鬾g 瘘"
			x806003_MessageBox(sceneId, marryTargetId, targetId, szMsg);
			return 0, -1, -1;
		end
	end
	
	szMsg = "Kh鬾g gian trong tay n鋓 疸 馥y, kh鬾g th� 穑t th阭 nh鏽 c呔i. Xin ki琺 tra tay n鋓 2 b阯"
	local maleProSpace = LuaFnGetPropertyBagSpace(sceneId, maleId);
	local femaleProSpace = LuaFnGetPropertyBagSpace(sceneId, femaleId);
	if maleProSpace < 1 or femaleProSpace < 1 then
		x806003_MessageBox(sceneId, maleId, targetId, szMsg);
		x806003_MessageBox(sceneId, femaleId, targetId, szMsg);
		return 0, -1, -1;
	end
	
	local selfTaskCount = GetMissionCount(sceneId, selfId);
	if selfTaskCount >= 20 then
		szMsg = "Nhi甿 v� ghi ch閜 疸 馥y, kh鬾g th� nh nhi甿 v� m緄"
		x806003_MessageBox(sceneId, selfId, targetId, szMsg);
		szMsg = "Nhi甿 v� ghi ch閜 c黙 鸠i ph呓ng 疸 馥y, kh鬾g th� nh nhi甿 v� m緄"
		x806003_MessageBox(sceneId, marryTargetId, targetId, szMsg);
		return 0, -1, -1;
	end
	
	szMsg = "Hai b阯 v鏽 ch遖 ho鄋 to鄋 鸢ng � k猼 h鬾"
	local maleGUID = LuaFnGetGUID(sceneId, maleId);
	local femaleGUID = LuaFnGetGUID(sceneId, femaleId);
	local maleIsAccept, maleTargetGUID = LuaFnGetHumanMarryInfo(sceneId, maleId);
	if maleIsAccept and maleIsAccept == 1 and maleTargetGUID and maleTargetGUID == femaleGUID then
	else
		x806003_MessageBox(sceneId, maleId, targetId, szMsg);
		return 0, -1, -1;
	end
	
	local femaleIsAccept, femaleTargetGUID = LuaFnGetHumanMarryInfo(sceneId, femaleId);
	if femaleIsAccept and femaleIsAccept == 1 and femaleTargetGUID and femaleTargetGUID == maleGUID then
	else
		x806003_MessageBox(sceneId, femaleId, targetId, szMsg);
		return 0, -1, -1;
	end

	return 1, maleId, femaleId;
end

--**********************************
-- 处理结婚
--**********************************
function x806003_DoMarry(sceneId, selfId, targetId, marryLevel, maleId, femaleId)
	if LuaFnHasTeam(sceneId, selfId) == 0 then
		return 0;
	end

	if LuaFnGetTeamSize(sceneId, selfId) ~= 2 then
		return 0;
	end

	local nearNum = GetNearTeamCount(sceneId, selfId);
	if nearNum ~= 2 then
		return 0;
	end

	local maleId = -1;
	local femaleId = -1;
	for nearIndex = 0, nearNum - 1 do
		local memId = GetNearTeamMember(sceneId, selfId, nearIndex);
		local sexType = LuaFnGetSex(sceneId, memId);
		if sexType == 1 then
			maleId = memId;
		else
			femaleId = memId;
		end
	end

	if maleId == -1 or femaleId == -1 then
		return 0;
	end

	--扣钱
	local ticketItemPos = -1;
	local selectTicketItemId = -1;
	if marryLevel == 2 then
		ticketItemPos = GetBagPosByItemSn(sceneId, selfId, x806003_g_ticketItemId);
		selectTicketItemId = x806003_g_ticketItemId;
	else
		ticketItemPos = GetBagPosByItemSn(sceneId, selfId, x806003_g_ticketItemId2);
		selectTicketItemId = x806003_g_ticketItemId2;
		if not ticketItemPos or ticketItemPos < 0 then
			ticketItemPos = GetBagPosByItemSn(sceneId, selfId, x806003_g_ticketItemId);
			selectTicketItemId = x806003_g_ticketItemId;
		end
	end
	if ticketItemPos and ticketItemPos > -1 then
		local checkRet = LuaFnIsItemAvailable(sceneId, selfId, ticketItemPos);
		if not checkRet or checkRet ~= 1 then
			return 0;
		end
		
		local eraseItemRet = EraseItem(sceneId, selfId, ticketItemPos);
		if not eraseItemRet or eraseItemRet ~= 1 then
			return 0;
		end
	else
		--local money = LuaFnGetMoney(sceneId, selfId);
		--local needMoney = x806003_CalcNeedMoney(marryLevel);
		--if money and needMoney and money >= needMoney then
		--hzp 2008-12-9
		local nMoneyJZ = GetMoneyJZ(sceneId, selfId);
		local nMoneyJB = LuaFnGetMoney(sceneId, selfId);
		local nMoneySelf = nMoneyJZ + nMoneyJB;
		local needMoney = x806003_CalcNeedMoney(marryLevel);
		if nMoneyJZ and nMoneyJB and nMoneySelf and needMoney and nMoneySelf >= needMoney then
		else
			return 0;
		end

		--LuaFnCostMoney(sceneId, selfId, needMoney);	
		LuaFnCostMoneyWithPriority(sceneId, selfId, needMoney);	
	end

	--增加称号
	local maleName = LuaFnGetName(sceneId, maleId);
	local femaleName = LuaFnGetName(sceneId, femaleId);

	LuaFnAwardSpouseTitle(sceneId, femaleId, maleName .. " N呓ng t�");
	DispatchAllTitle(sceneId, femaleId);

	LuaFnAwardSpouseTitle(sceneId, maleId, femaleName .. " Phu qu鈔");
	DispatchAllTitle(sceneId, maleId);

	--发戒指
	local pos;
	local ringItemId = x806003_GetRingByMarryLevel(marryLevel);
	pos	= TryRecieveItem(sceneId, maleId, ringItemId, 1);
	if pos and pos ~= -1 then
		LuaFnSetItemCreator(sceneId, maleId, pos, femaleName);
	end

	pos	= TryRecieveItem(sceneId, femaleId, ringItemId, 1);
	if pos and pos ~= -1 then
		LuaFnSetItemCreator(sceneId, femaleId, pos, maleName);
	end
	
	--重温婚礼计数清0
	SetMissionData( sceneId, maleId, MD_TW_REEXPERIENCE_WEDDING_TOTAL_COUNT, 0 )
	SetMissionData( sceneId, femaleId, MD_TW_REEXPERIENCE_WEDDING_TOTAL_COUNT, 0 )
	
	--正式结婚
	LuaFnMarry(sceneId, maleId, femaleId, marryLevel);
	
	--加入新任务
	CallScriptFunction( 250036, "OnAccept", sceneId, selfId, marryLevel);

	--聊天窗口给男方提示
	--Msg2Player(sceneId, maleId, "Ch鷆 m譶g你和"..femaleName.."结为夫妻!", MSG2PLAYER_PARA);
	Msg2Player(sceneId, maleId, "C醕 h� 鹫t th阭 danh x遪g \'"..femaleName.."Phu qu鈔 c黙 \'", MSG2PLAYER_PARA);

	--聊天窗口给女方提示
	--Msg2Player(sceneId, femaleId, "Ch鷆 m譶g你和"..maleName.."结为夫妻!", MSG2PLAYER_PARA);
	Msg2Player(sceneId, femaleId, "C醕 h� 鹫t th阭 danh x遪g \'"..maleName.."N呓ng t� c黙 \'", MSG2PLAYER_PARA);
	
	local ringItemName = GetItemName(sceneId, ringItemId);
	if ringItemName then
		Msg2Player(sceneId, maleId, "C醕 h� 疸 鹫t 疬㧟 "..ringItemName..".", MSG2PLAYER_PARA );
		Msg2Player(sceneId, femaleId, "C醕 h� 疸 鹫t 疬㧟 "..ringItemName..".", MSG2PLAYER_PARA);
	end
	
	--世界公告
	local strChatMessage = "#cffffcc Xin ch鷆 m譶g#W#{_INFOUSR"..maleName.."}#cffffcc v� #W#{_INFOUSR"..femaleName.."} #cffffccv頽h k猼 鸢ng t鈓, nguy畁 ch鷆 cho 2 ng叨i 馥u b誧 r錸g long, v頽h k猼 鸢ng t鈓, h課h ph鷆 su痶 鸲i #W";
	BroadMsgByChatPipe(sceneId, selfId, "@*;SrvMsg;SCA:"..strChatMessage, 4);
	
	--分别发EMAIL给男女双方上面to� 鸬 所有好友
	local maleGuid = LuaFnGetGUID(sceneId, maleId);
	local femaleGuid = LuaFnGetGUID(sceneId, femaleId);
	LuaFnSendMailToAllFriend( sceneId, maleId, "Bg h鎢 y陁 qu� c黙 ta, ta 疸 c鵱g " .. femaleName .. " h� k猼 l呓ng duy阯, h銀 ch鷆 ph鷆 cho ch鷑g ta!", 1, femaleGuid )
	LuaFnSendMailToAllFriend( sceneId, femaleId, "Bg h鎢 y陁 qu� c黙 ta, ta 疸 c鵱g " .. maleName .. " h� k猼 l呓ng duy阯, h銀 ch鷆 ph鷆 cho ch鷑g ta!", 1, maleGuid )

	--结束语
	local endMsg = "Ch鷆 m譶g c醕 ng叨i h� k猼 li阯 l�, m秈 xu痭g g H� Lai L誧 (177, 94) t読 L誧 D呓ng 瓞 s x猵 ki畊 hoa r呔c d鈛. Nh遪g H� Lai L誧 ph� tr醕h to鄋 b� vi甤 h� c黙 L誧 D呓ng, ng鄖 n鄌 c鹡g b t痠 m t痠 m鹖. V� v trong v騨g 1 canh gi�, n猽 c醕 ng呓i kh鬾g t緄 g ngay, qu� gi� s� kh鬾g c� c醕h kh醕";
	BeginEvent(sceneId);
		AddText(sceneId, endMsg);
		AddNumText(sceneId, x806003_g_ScriptId, "衋 t�..", 8, x806003_g_eventId_end);
	EndEvent(sceneId);
	DispatchEventList(sceneId, maleId, targetId);
	
	BeginEvent(sceneId);
		AddText(sceneId, endMsg);
		AddNumText(sceneId, x806003_g_ScriptId, "衋 t�..", 8, x806003_g_eventId_end);
	EndEvent(sceneId);
	DispatchEventList(sceneId, femaleId, targetId);
end

--**********************************
--对话窗口信息提示
--**********************************
function x806003_MessageBox(sceneId, selfId, targetId, msg)
	BeginEvent(sceneId);
		AddText(sceneId, msg);
	EndEvent(sceneId);
	DispatchEventList(sceneId, selfId, targetId);
end

--**********************************
--计算婚礼对应to� 鸬 钱数
--**********************************
function x806003_CalcNeedMoney(marryLevel)
	if marryLevel == 1 then
		return 5203344;
	elseif marryLevel == 2 then
		return 13145200;
	else
		return 520520;
	end
end

--**********************************
-- 餴琺婚礼等c对应to� 鸬 名称
--**********************************
function x806003_GetMarryLevelName(marryLevel)
	if marryLevel == 1 then
		return "H鬾 l� b trung ";
	elseif marryLevel == 2 then
		return "H鬾 l� sang tr鱪g ";
	else
		return "H鬾 l� th鬾g th叨ng ";
	end
end

--**********************************
-- 餴琺婚礼等c对应to� 鸬 戒指to� 鸬 ID
--**********************************
function x806003_GetRingByMarryLevel(marryLevel)
	if marryLevel == 1 then
		return 10422097;
	elseif marryLevel == 2 then
		return 10422098;
	else
		return 10422096;
	end
end

--**********************************
-- 餴琺对方to� 鸬 objId
--**********************************
function x806003_GetMarryTargetId(sceneId, selfId, showMessage, targetId)

	local marryTargetId = -1;
	
	local szMsg = "N猽 mu痭 l gia th, 2 b阯 nh� trai v� nh� g醝 c鵱g h鱬 th鄋h m祎 nh髆 r癷 t緄 t靘 ta"
	if LuaFnHasTeam(sceneId, selfId) == 0 then
		if showMessage and showMessage == 1 then
			x806003_MessageBox(sceneId, selfId, targetId, szMsg);
		end
		return -1;
	end
	
	szMsg = "Nh髆 c黙 鸬i k猼 h鬾 nh thi猼 ph鋓 do hai b阯 nh� trai-g醝 h䅟 th鄋h, kh鬾g 疬㧟 c� th鄋h vi阯 ngo鄆"
	if LuaFnGetTeamSize(sceneId, selfId) ~= 2 then
		if showMessage and showMessage == 1 then
			x806003_MessageBox(sceneId, selfId, targetId, szMsg);
		end
		return -1;
	end

	szMsg = "Ch� c� 2 ng叨i 皤u 皙n b阯 ta m緄 c� th� k猼 h鬾"
	local nearNum = GetNearTeamCount(sceneId, selfId);
	if nearNum ~= 2 then
		if showMessage and showMessage == 1 then
			x806003_MessageBox(sceneId, selfId, targetId, szMsg);
		end
		return -1;
	end

	for nearIndex = 0, nearNum - 1 do
		local memId = GetNearTeamMember(sceneId, selfId, nearIndex);
		if memId ~= selfId then
			marryTargetId = memId;
		end
	end
	
	return marryTargetId;
	
end
