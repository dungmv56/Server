-- 终c还童丹


-- 宠物通用功能脚本
x334908_g_petCommonId = PETCOMMON

x334908_g_itemList = {}
x334908_g_itemList[30503016] = {minLevel = 1, maxLevel = 85}	--终c珍兽还童卷轴
x334908_g_itemList[30503017] = {minLevel = 1, maxLevel = 35}	--低c珍兽还童天书
x334908_g_itemList[30503018] = {minLevel = 1, maxLevel = 65}	--中c珍兽还童天书
x334908_g_itemList[30503019] = {minLevel = 1, maxLevel = 85}	--高c珍兽还童天书
x334908_g_itemList[30503020] = {minLevel = 1, maxLevel = 95}	--超c珍兽还童天书
--******************************************************************************
-- 以下部分C 喧ngC 修改to� 鸬 部分
--******************************************************************************

--脚本号 (改成正确脚本号)
x334908_g_scriptId = 334908

--标准效果ID (改成宠物使用驯养道具to� 鸬 特效)
--g_ImpactID = 0

--******************************************************************************
-- 以上部分C 喧ngC 修改to� 鸬 部分
--******************************************************************************

--脚本

--**********************************
--必须Tr� v� 1 才能正确执行以下流程
--**********************************
function x334908_IsSkillLikeScript( sceneId, selfId)
	return 1
end

--**********************************
--条件检测入口: 
--H� th痭g会T読 技能检测to� 鸬 时间 餴琺调用C醝 n鄖 接口,并根据C醝 n鄖 函数to� 鸬 Tr� v礨醕 nh以后to� 鸬 流程喧ng否执行.
--Tr� v�1: 条件检测通过,可以继续执行；Tr� v�0: 条件检测th b読,中断后续执行.
--**********************************
function x334908_OnConditionCheck( sceneId, selfId )
	--校验使用to� 鸬 物品
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end

	local itemTblIndex = LuaFnGetItemIndexOfUsedItem( sceneId, selfId );
	local petItem = x334908_g_itemList[itemTblIndex];
	if not petItem then
		x334908_NotifyTip(sceneId, selfId, "Ch遖 m� 鹫o c�, kh鬾g th� s� d鴑g.");
		return 0;
	end

	local petGUID_H = LuaFnGetHighSectionOfTargetPetGuid( sceneId, selfId )
	local petGUID_L = LuaFnGetLowSectionOfTargetPetGuid( sceneId, selfId )

	if LuaFnPetCanReturnToChild( sceneId, selfId, petGUID_H, petGUID_L, 1, -1) == 0 then
		return 0
	end
	
	local petDataID = LuaFnGetPetDataIDByGUID(sceneId, selfId, petGUID_H, petGUID_L);
	if not petDataID or petDataID < 0 then
		x334908_NotifyTip(sceneId, selfId, "无法对指定珍兽进行还童.");
		return 0;
	end
	
	local petTakeLevel = GetPetTakeLevel(petDataID);
	if not petTakeLevel or petTakeLevel < 1 then
		x334908_NotifyTip(sceneId, selfId, "无法识别珍兽to� 鸬 携带等c.");
		return 0;
	end
	
	if petTakeLevel > petItem.maxLevel then
		if (petTakeLevel == 95) then
			x334908_NotifyTip(sceneId, selfId, "#{95ZSH_081121_01}");
			return 0;
		else
			x334908_NotifyTip(sceneId, selfId, "不能对携带等c为"..petItem.maxLevel.."c以上to� 鸬 珍兽进行还童.");
			return 0;
		end
	end

	return 1
end

--**********************************
--消耗检测及处理入口: 
--H� th痭g会T読 技能消耗to� 鸬 时间 餴琺调用C醝 n鄖 接口,并根据C醝 n鄖 函数to� 鸬 Tr� v礨醕 nh以后to� 鸬 流程喧ng否执行.
--Tr� v�1: 消耗处理通过,可以继续执行；Tr� v�0: 消耗检测th b読,中断后续执行.
--注意: 这不光负责消耗to� 鸬 检测也负责消耗to� 鸬 执行.
--**********************************
function x334908_OnDeplete( sceneId, selfId )
	if(0<LuaFnDepletingUsedItem(sceneId, selfId)) then
		return 1
	end
	return 0
end

--**********************************
--只会执行m祎 次入口: 
--聚气和瞬发技能会T読 消耗完成后调用C醝 n鄖 接口(聚气结束并且各种条件都Th鯽 m鉵to� 鸬 时候),而引导
--技能也会T読 消耗完成后调用C醝 n鄖 接口(技能to� 鸬 m祎 开始,消耗成功执行之后).
--Tr� v�1: 处理成功；Tr� v�0: 处理th b読.
--注: 这里喧ng技能生效m祎 次to� 鸬 入口
--**********************************
function x334908_OnActivateOnce( sceneId, selfId )
	petGUID_H = LuaFnGetHighSectionOfTargetPetGuid( sceneId, selfId )
	petGUID_L = LuaFnGetLowSectionOfTargetPetGuid( sceneId, selfId )

	-- 珍兽还童
	local ret, perLevel = LuaFnPetReturnToChild( sceneId, selfId, petGUID_H, petGUID_L, 1, -1)
	if ret and ret == 1 then
		local szMsg = "珍兽还童成功!";
		x334908_NotifyTip( sceneId, selfId, szMsg );															-- 醒目提示
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0);		-- 特效
		
		local itemTblIndex = LuaFnGetItemIndexOfUsedItem( sceneId, selfId );			--by Vega 20080919
		local nGrowLevel = 0;
		if (itemTblIndex == 30503017 or itemTblIndex == 30503018 or itemTblIndex == 30503019 or itemTblIndex == 30503020 or itemTblIndex == 30503016) then		
			nGrowLevel = LuaFnGetPetGrowRateByGUID( sceneId, selfId, petGUID_H, petGUID_L )      
		end											--by Vega 20080919

		local selfName = LuaFnGetName(sceneId, selfId);
		local petTransfer = LuaFnGetPetTransferByGUID(sceneId, selfId, petGUID_H, petGUID_L);
		if perLevel and perLevel >= 6 and selfName and petTransfer then
			local strWorldChat = "#{_INFOUSR"..selfName.."}#H使用#Y还童天书#H后,#{_INFOMSG"..petTransfer.."}#H从天而降!";
			BroadMsgByChatPipe(sceneId, selfId, strWorldChat, 4);
		end
		
		-- 成长率T読 杰出(含)以上时播放H� th痭g公告
		-- add by WTT	20090116
		if (nGrowLevel >= 4) then
			local strTbl = {"普通","优秀","杰出","卓越","完美"};
			-- AAA很喜欢小动物,将珍兽还童后竟然意外to� 鸬  餴琺到了成长率为CCCto� 鸬 BBB！爱心to� 鸬 回报果然丰厚.
			-- AAA为玩家链接  BBB为还童后珍兽to� 鸬 链接	 CCC为成长率(杰出及以上).
			local Msg = "#W#{_INFOUSR%s}#{HT14}#Y"..strTbl[nGrowLevel].."#{HT15}#{_INFOMSG%s}#{HT16}"
			local szPetTrans = GetPetTransString ( sceneId, selfId, petGUID_H, petGUID_L )
			local str = format( Msg, selfName, szPetTrans )
				
			BroadMsgByChatPipe (sceneId, selfId, str, 4)
		end
		
	end
	return 1
end

--**********************************
--引导心跳处理入口: 
--引导技能会T読 每次心跳结束时调用C醝 n鄖 接口.
--Tr� v�: 1继续下次心跳；0: 中断引导.
--注: 这里喧ng技能生效m祎 次to� 鸬 入口
--**********************************
function x334908_OnActivateEachTick( sceneId, selfId )
	return 1
end

-- C醝 n鄖 函数没有什么用,但喧ng必须有
function x334908_CancelImpacts( sceneId, selfId )
	return 0
end


--**********************************
--醒目提示
--**********************************
function x334908_NotifyTip( sceneId, selfId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end
