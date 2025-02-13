-- 转性丹

-- 脚本号
x800108_g_ScriptId = 800108;

x800108_zhuanXingdian_ItemDataID = 30502003;	--转性丹

--**********************************
-- 任务入口函数
--**********************************
function x800108_OnDefaultEvent(sceneId, selfId, targetId)
	--珍兽洗 餴琺
	BeginUICommand(sceneId);
		UICommand_AddInt(sceneId, targetId);
	EndUICommand(sceneId);
	DispatchUICommand(sceneId, selfId, 800108);
end

--**********************************
-- 列举事件
--**********************************
function x800108_OnEnumerate(sceneId, selfId, targetId)
	AddNumText(sceneId, x800108_g_ScriptId, "Thay 鸨i t韓h c醕h tr鈔 th�" , 6, -1);
end

--**********************************
-- 转性丹规则
-- 0 - 胆小
-- 1 - 谨慎	
-- 2 - 忠诚
-- 3 - Tinh明
-- 4 - 勇猛
--**********************************
function x800108_ZhuanXingdian(sceneId, selfId, petGUID_H, petGUID_L)

	if not sceneId or not selfId or not petGUID_H or not petGUID_L then
		x800108_ShowTips(sceneId, selfId, "Thao t醕 sai.");
		return 0;
	end
	
	local zhuanXingdianItemName = GetItemName(sceneId, x800108_zhuanXingdian_ItemDataID);
	if not zhuanXingdianItemName then
		x800108_ShowTips(sceneId, selfId, "Ch遖 m� v ph");
		return 0;
	end

	local curAIType = LuaFnGetPetAITypeByGUID(sceneId, selfId, petGUID_H, petGUID_L);
	if not curAIType or curAIType == -1 then
		x800108_ShowTips(sceneId, selfId, "Tr鈔 th� m� c醕 h� ch� 鸶nh kh鬾g t皀 t読.");
		return 0;
	end

	local petAvailableFlag = LuaFnIsPetAvailableByGUIDNoPW(sceneId, selfId, petGUID_H, petGUID_L);
	if not petAvailableFlag or petAvailableFlag ~= 1 then
		x800108_ShowTips(sceneId, selfId, "Kh鬾g th� ti猲 h鄋h thao t醕 v緄 tr鈔 th� b� kh骯");
		return 0;
	end
	
	local availableItemCount = LuaFnGetAvailableItemCount(sceneId, selfId, x800108_zhuanXingdian_ItemDataID);
	if not availableItemCount or availableItemCount < 1 then
		x800108_ShowTips(sceneId, selfId, "C "..zhuanXingdianItemName..".");
		return 0;
	end
	
	local delRet = LuaFnDelAvailableItem(sceneId, selfId, x800108_zhuanXingdian_ItemDataID, 1);
	if not delRet or delRet ~= 1 then
		x800108_ShowTips(sceneId, selfId, "Kh tr�"..zhuanXingdianItemName.."Th b読.");
		return 0;
	end

	--AI类型必改变,而且每种机率喧ngm祎 样to� 鸬 
	local toAIType = random(4) - 1;
	if toAIType >= curAIType then
		toAIType = toAIType + 1;
	end

	local ret = LuaFnSetPetAITypeByGUID(sceneId, selfId, petGUID_H, petGUID_L, toAIType);
	if not ret or ret ~= 1 then
		x800108_ShowTips(sceneId, selfId, "Tr鈔 th� m� c醕 h� ch� 鸶nh kh鬾g t皀 t読.");
		return 0;
	end

	x800108_ShowTips(sceneId, selfId, "T韓h c醕h tr鈔 th� c黙 c醕 h� 疸 bi猲 鸨i th鄋h c鬾g.");
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0);
	return 1;
end

--**********************************
-- 提示信息
--**********************************
function x800108_ShowTips(sceneId, selfId, tipMsg)
	BeginEvent(sceneId);
		AddText(sceneId, tipMsg);
	EndEvent(sceneId);
	DispatchMissionTips(sceneId, selfId);
end
