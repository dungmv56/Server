--花车巡游任务
--MisDescBegin
--脚本号
x250036_g_ScriptId = 250036

--任务号
x250036_g_MissionId = 1020

--M鴆 ti陁 nhi甿 v鴑pc
x250036_g_TargetNpcName	="H� Lai L誧"

--任务归类
x250036_g_MissionKind = 3

--衅ng c nhi甿 v� 
x250036_g_MissionLevel = 1

--喧ng否喧ngTinh英任务
x250036_g_IfMissionElite = 0

--任务限时
x250036_g_MissionLimitTime = 60 * 60 * 1000; --毫 gi鈟

--下面几项喧ng动态显示to� 鸬 内容,用于T読 任务列表中动态显示任务情况**********************

--以上喧ng动态**************************************************************

--任务文本描述
x250036_g_MissionName="R呔c ki畊 hoa";
x250036_g_MissionInfo="M秈 皙n L誧 D呓ng[177,94] H� Lai L誧 s x猵 tu du bg xe hoa.";
x250036_g_MissionTarget="M秈 皙n L誧 D呓ng g H� Lai L誧 #{_INFOAIM177,94,0, H� Lai L誧} s x猵 tu du bg xe hoa.";		--M鴆 ti陁 nhi甿 v�
x250036_g_ContinueInfo1="Th xin l瞚, 疸 qu� th秈 gian d� 鸶nh c黙 c醕 h�, c醕 h� ch� c� th� b� qua ... ...";
x250036_g_ContinueInfo2="� 疴y c l k� ho誧h, c醡 絥";
x250036_g_MissionComplete="H銀 瓞 ch鷑g ta b 馥u";

--任务奖励
x250036_g_MoneyBonus = 0

--MisDescEnd

x250036_g_eventId_begin = 0;	-- 餴琺击花车巡游任务to� 鸬 事件
x250036_g_eventId_start = 1;	-- 餴琺击开始巡游to� 鸬 事件
x250036_g_eventId_close = 2;	-- 餴琺击等会再开始to� 鸬 事件

x250036_g_busDataIds = {3, 4, 5};	--花车to� 鸬 DataID
x250036_g_busPatrolPathId = 3;		--花车路径ID


--**********************************
--任务入口函数
--**********************************
function x250036_OnDefaultEvent(sceneId, selfId, targetId)	-- 餴琺击该任务后执行此脚本
	local selectEventId	= GetNumText();
	
	-- 餴琺击花车巡游任务to� 鸬 事件
	if x250036_g_eventId_begin == selectEventId then
		x250036_OnBegin(sceneId, selfId, targetId);
	-- 餴琺击开始巡游to� 鸬 事件
	elseif x250036_g_eventId_start == selectEventId then
		x250036_OnStart(sceneId, selfId, targetId);
	-- 餴琺击等会再开始to� 鸬 事件
	elseif x250036_g_eventId_close == selectEventId then
		BeginUICommand(sceneId);
		EndUICommand(sceneId);
		DispatchUICommand(sceneId, selfId, 1000);
	end

end

--**********************************
--列举事件
--**********************************
function x250036_OnEnumerate(sceneId, selfId, targetId)
    --如果已接此任务
    if IsHaveMission(sceneId,selfId,x250036_g_MissionId) > 0 then
		AddNumText(sceneId, x250036_g_ScriptId, x250036_g_MissionName, 6, x250036_g_eventId_begin);
    end
end

--**********************************
--检测Ti猵 th跫�
--**********************************
function x250036_CheckAccept(sceneId, selfId)
	return 1;
end

--**********************************
--Ti猵 th�
--**********************************
function x250036_OnAccept(sceneId, selfId, marryLevel)

	--加入任务到玩家列表
	AddMission(sceneId, selfId, x250036_g_MissionId, x250036_g_ScriptId, 0, 0, 0);
	misIndex = GetMissionIndexByID(sceneId, selfId, x250036_g_MissionId);			-- 餴琺到任务to� 鸬 序列号
	if misIndex and misIndex >= 0 then
		StartMissionTimer(sceneId,selfId, x250036_g_MissionId);
		SetMissionByIndex(sceneId,selfId,misIndex, 0, 1);						--根据序列号把任务变量to� 鸬 第0位置0 (任务完成情况)
		SetMissionByIndex(sceneId,selfId,misIndex, 7, x250036_g_MissionLimitTime);
		SetMissionByIndex(sceneId,selfId,misIndex, 2, marryLevel);
		
		Msg2Player(sceneId, selfId,"#YNh nhi甿 v�: "..x250036_g_MissionName.."",MSG2PLAYER_PARA);	--聊天窗口提示
	end
end

--**********************************
--放弃
--**********************************
function x250036_OnAbandon(sceneId, selfId)
	--删除玩家任务列表中对应to� 鸬 任务
 	local checkMission = IsHaveMission(sceneId, selfId, x250036_g_MissionId);
	if checkMission and checkMission == 1 then
	  DelMission(sceneId, selfId, x250036_g_MissionId);
	 end
end

--**********************************
--继续
--**********************************
function x250036_OnContinue(sceneId, selfId, targetId)
end

--**********************************
--检测喧ng否可以提交
--**********************************
function x250036_CheckSubmit(sceneId, selfId)
	return 0;
end

--**********************************
--提交
--**********************************
function x250036_OnSubmit(sceneId, selfId, targetId,selectRadioId)
end

--**********************************
--杀死怪物或玩家
--**********************************
function x250036_OnKillObject(sceneId, selfId, objdataId ,objId)
end

--**********************************
--进入区域事件
--**********************************
function x250036_OnEnterArea(sceneId, selfId, zoneId)
end

--**********************************
--道具改变
--**********************************
function x250036_OnItemChanged(sceneId, selfId, itemdataId)
end

--**********************************
--定时事件
--**********************************
function x250036_OnTimer(sceneId,selfId)
	local misIndex = GetMissionIndexByID(sceneId,selfId,x250036_g_MissionId);
	if misIndex and misIndex >= 0 then
		local saveTime = GetMissionParam(sceneId, selfId, misIndex, 7);
		if saveTime and saveTime > 0 then
			saveTime = saveTime - 1000;
			if saveTime <= 0 then
				StopMissionTimer(sceneId, selfId, x250036_g_MissionId);
				SetMissionByIndex(sceneId, selfId, misIndex, 0, 2);
				saveTime = 0;
			end
			SetMissionByIndex(sceneId, selfId, misIndex, 7, saveTime);
		end
	end
end

--**********************************
-- 餴琺击花车巡游任务to� 鸬 事件
--**********************************
function x250036_OnBegin(sceneId, selfId, targetId)
	local misIndex = GetMissionIndexByID(sceneId,selfId,x250036_g_MissionId);
	if misIndex and misIndex >= 0 then
		local stateCode = GetMissionParam(sceneId, selfId, misIndex, 0);
		if stateCode and stateCode == 2 then
			x250036_MessageBox(sceneId, selfId, targetId, "C醕 ng呓i 皙n mu祅 qu�, phu ki畊 do ta s x猵 疸 餴 h猼 r癷, kh鬾g th� l鄊 疳m r呔c 疬㧟");
			DelMission(sceneId, selfId, x250036_g_MissionId);
		else
			BeginEvent(sceneId);
				AddText(sceneId, "Ch鷆 m譶g c醕 ng呓i, phu ki畊 疸 chu b� xong, h銀 l t裞 r呔c d鈛");
				AddNumText(sceneId, x250036_g_ScriptId, "Gi� h銀 b 馥u r呔c", 8, x250036_g_eventId_start);
				AddNumText(sceneId, x250036_g_ScriptId, "Ch� m祎 l醫 l読 b 馥u..", 8, x250036_g_eventId_close);
			EndEvent(sceneId);
			DispatchEventList(sceneId, selfId, targetId);
		end
	end
end

--**********************************
-- 餴琺击开始巡游to� 鸬 事件
--**********************************
function x250036_OnStart(sceneId, selfId, targetId)
	local marryLevel = 0;
	local misIndex = GetMissionIndexByID(sceneId,selfId,x250036_g_MissionId);
	if misIndex and misIndex >= 0 then
		local stateCode = GetMissionParam(sceneId, selfId, misIndex, 0);
		if stateCode and stateCode == 2 then
			x250036_MessageBox(sceneId, selfId, targetId, "C醕 ng呓i 皙n mu祅 qu�, phu ki畊 do ta s x猵 疸 餴 h猼 r癷, kh鬾g th� l鄊 疳m r呔c 疬㧟");
			DelMission(sceneId, selfId, x250036_g_MissionId);
			return 0;
		else
			marryLevel = GetMissionParam(sceneId, selfId, misIndex, 2);
		end
	else
		x250036_MessageBox(sceneId, selfId, targetId, "Ch遖 t靘 疬㧟 nhi甿 v� r呔c ki畊 hoa");
		return 0;
	end
		
	local szMsg = "N猽 mu痭 r呔c ki畊 hoa, xin hai b阯 nam n� l th鄋h 1 nh髆, l読 t緄 t靘 ta"
	if LuaFnHasTeam(sceneId, selfId) == 0 then
		x250036_MessageBox(sceneId, selfId, targetId, szMsg);
		return 0;
	end
	
	szMsg = "Nh髆 ch� c� th� do hai b阯 phu th� l th鄋h, trong nh髆 kh鬾g th� c� th鄋h vi阯 kh醕"
	if LuaFnGetTeamSize(sceneId, selfId) ~= 2 then
		x250036_MessageBox(sceneId, selfId, targetId, szMsg);
		return 0;
	end

	szMsg = "Ch� khi 2 ng叨i 皤u 皙n b阯 ta m緄 c� th� b 馥u r呔c ki畊 hoa"
	local nearNum = GetNearTeamCount(sceneId, selfId);
	if nearNum ~= 2 then
		x250036_MessageBox(sceneId, selfId, targetId, szMsg);
		return 0;
	end

	szMsg = "Kh鬾g ph鋓 l� phu th�, kh鬾g th� b 馥u r呔c ki畊 hoa"
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
		x250036_MessageBox(sceneId, selfId, targetId, szMsg);
		return 0;
	end
	
	local isSpouses = LuaFnIsSpouses(sceneId, maleId, femaleId);
	if isSpouses and isSpouses > 0 then
	else
		x250036_MessageBox(sceneId, selfId, targetId, szMsg);
		return 0;
	end
	--zchw
	for nearIndex = 0, nearNum - 1 do
		local memId = GetNearTeamMember(sceneId, selfId, nearIndex);
		if LuaFnIsStalling(sceneId, memId) == 1 then
			x250036_MessageBox(sceneId, selfId, targetId, "#{CWHL_081208_1}")
			return 0;
		end
	end
	
	local busIndex = 1;
	if marryLevel and marryLevel > -1 and marryLevel < 3 then
		busIndex = marryLevel + 1;
	else
		busIndex = 1;
	end
	
	local busObjID = LuaFnCreateBusByPatrolPathId(sceneId, x250036_g_busDataIds[busIndex], x250036_g_busPatrolPathId, 0);
	if busObjID and busObjID ~= -1 then
		local succeeded, strText;
		succeeded = 0;
		local addPassergerRet = LuaFnBusAddPassengerList(sceneId, busObjID, targetId, 1, 2, maleId, femaleId);
		if addPassergerRet and addPassergerRet == OR_OK then
			local busStartRet = LuaFnBusStart(sceneId, busObjID);
			if busStartRet and busStartRet == 1 then
				BeginUICommand(sceneId);
				EndUICommand(sceneId);
				DispatchUICommand(sceneId, selfId, 1000);
				DelMission(sceneId, selfId, x250036_g_MissionId);
				CallScriptFunction(250037, "OnAccept", sceneId, selfId, marryLevel);
				succeeded = 1;
			else
				strText = "Kh穒 鸬ng c� l瞚, r呔c ki畊 hoa th b読, xin li阯 h� v緄 GM"
			end
		end
		
		if succeeded and succeeded == 1 then
		else
			LuaFnBusRemoveAllPassenger(sceneId, busObjID);
			LuaFnDeleteBus(sceneId, busObjID);
			if strText then
				x250036_MessageBox(sceneId, selfId, targetId, strText);
			end
		end
	end

end

--**********************************
--对话窗口信息提示
--**********************************
function x250036_MessageBox(sceneId, selfId, targetId, msg)
	BeginEvent(sceneId);
		AddText(sceneId, msg);
	EndEvent(sceneId);
	DispatchEventList(sceneId, selfId, targetId);
end

