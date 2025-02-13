--装备减少修理th b読次数
--脚本号
x809265_g_ScriptId = 809265

--减少修理th b読次数UI 1005

--**********************************
--列举事件
--**********************************
function x809265_OnEnumerate( sceneId, selfId, targetId )

end


--**********************************
--减少修理th b読次数
--**********************************
function x809265_EquipFaileTimes( sceneId, selfId, nItemIndex1, nItemIndex2)

	local ret = LuaFnIsItemLocked( sceneId, selfId, nItemIndex1 )
	if ret ~= 0 then
		BeginEvent(sceneId)
		AddText(sceneId,"Kh鬾g d鵱g 疬㧟 trang b� n鄖");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end

	
	ret = LuaFnIsItemAvailable( sceneId, selfId, nItemIndex2 )
	if ret ~= 1 then
		BeginEvent(sceneId)
		AddText(sceneId,"Kh鬾g th� s� d鴑g nhu v l�");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	local szTransfer = GetBagItemTransfer(sceneId,selfId, nItemIndex2);


	local sy_index = LuaFnGetItemTableIndexByIndex( sceneId, selfId, nItemIndex2 )
	if sy_index ~= 30900007 and sy_index ~= 30900000   then
		BeginEvent(sceneId)
		AddText(sceneId,"Gi鋗 s� l s豠 ch鎍 th b読 c c� nhu v l�");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end

	local	text	= "S豠 ch鎍 th鄋h c鬾g"
	local money = GetMoney( sceneId, selfId )
	local jiaozi = GetMoneyJZ(sceneId, selfId);
	local need_money = GetBagItemLevel( sceneId, selfId, nItemIndex1 ) * 200
	if money+jiaozi < need_money then
		text="H� s� l s豠 ch鎍 trang b� th b読 c c� #{_EXCHG%d}, ng鈔 l唼ng tr阯 ng叨i c醕 h� kh鬾g 瘘"
		text=format( text, need_money )
		BeginEvent(sceneId)
		AddText(sceneId,text);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end

	local szMsg;
	local szName;
	szName = GetName( sceneId, selfId );		
	
	if sy_index == 30900007  then
		ret = LuaFnFaileTimes( sceneId, selfId, nItemIndex1, nItemIndex2, 1 )
		szMsg = format( "#W#{_INFOUSR%s}#H sau khi 疸 s� d鴑g #W#{_INFOMSG%s}#H, h癷 ph鴆 th鄋h c鬾g s� l s鎍 ch鎍 c黙 trang b� l� 1 l, tr醤h g銀 v� sau 3 l s豠 ch鎍 trang b� th b読.", szName, szTransfer );
	elseif sy_index == 30900000  then
		ret = LuaFnFaileTimes( sceneId, selfId, nItemIndex1, nItemIndex2, 0 )
		szMsg = format( "#W#{_INFOUSR%s}#H sau khi 疸 s� d鴑g #W#{_INFOMSG%s}#H, h癷 ph鴆 th鄋h c鬾g s� l s鎍 ch鎍 c黙 trang b� l� 3 l, tr醤h g銀 v� sau 3 l s豠 ch鎍 trang b� th b読.", szName, szTransfer );
	end

	if ret == 0 then
		LuaFnCostMoneyWithPriority( sceneId, selfId, need_money ) --zchw
		LuaFnEraseItem( sceneId, selfId, nItemIndex2 )
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 49, 0);

		
		--AddGlobalCountNews( sceneId, szMsg )
		
	end
	
	if ret == -1 then
		text="L瞚 kh鬾g x醕 鸶nh"
	end

	if ret == -2 then
		text="Kh鬾g d鵱g 疬㧟 trang b� n鄖"
	end
	
	if ret == -3 then
		text="Kh鬾g th� s� d鴑g nhu v l�"
	end

	if ret == -4 then
		text="S� l s豠 ch鎍 th b読 疸 th nh"
	end

	BeginEvent(sceneId)
		AddText(sceneId,text)
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
end
