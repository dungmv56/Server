--9大门派骑乘脚本

x210299_g_ScriptId = 210299;

--学习等c限制
x210299_g_SpecialEffectID = 18;

x210299_g_rideskillList = {};
x210299_g_rideskillList[1] ={limitLevel = 40, costMoney =350000, skillList = {
	{id=447,name="K� thu: H�"},
	{id=561,name="K� thu : S� t�"},
	{id=455,name="K� thu: Kh鬷 Lang"},
	{id=450,name="K� thu: H誧"},
	{id=451,name="K� thu: Thanh Ph唼ng"},
	{id=452,name="K� thu: Mao ng遳"},
	{id=448,name="K� thu: Ho鄋g Phi陁 M�"},
	{id=454,name="K� thu: 衖陁"},
	{id=453,name="K� thu: L礳"}}
	};

x210299_g_rideskillList[2] ={limitLevel = 60, costMoney =2900000, skillList = {
	{id=456,name="K� thu: B誧h H�"},
	{id=562,name="K� thu: B誧h s�"},
	{id=464,name="K� thu: B誧h Lang"},
	{id=459,name="K� thu: Kim D馽 H誧"},
	{id=460,name="K� thu: H皀g B誧h Ph唼ng"},
	{id=461,name="K� thu: B誧h mao ng遳"},
	{id=457,name="K� thu: Thanh B誧h Th鬾g M�"},
	{id=463,name="K� thu: B誧h 衖陁"},
	{id=462,name="K� thu: B誧h L礳"}}
	};

--**********************************
--任务入口函数
--**********************************
function x210299_OnDefaultEvent(sceneId, selfId, targetId, level, skillLevel)
	local selectSkill;
	local limitLevel;
	local costMoney;
	local selfMenpai = LuaFnGetMenPai(sceneId, selfId);
	if selfMenpai then
		skillLevel = skillLevel + 1;
		local selectRideskillList = x210299_g_rideskillList[skillLevel];

		local selectSkillIndex = selfMenpai + 1;
		selectSkill = selectRideskillList.skillList[selectSkillIndex];
		limitLevel = selectRideskillList.limitLevel;
		costMoney = selectRideskillList.costMoney;
	end
	
	local selfLevel = LuaFnGetLevel(sceneId, selfId);
	if selectSkill and limitLevel and selfLevel then
		if selfLevel < limitLevel then
			x210299_ShowTipWindow(sceneId, selfId, "C 鹫t t緄 c"..limitLevel.."M緄 h鱟 c� th� k� n錸g n鄖");
			return
		end
		
		local checkRet = LuaFnHaveSpecificEquitation(sceneId, selfId, selectSkill.id);
		if checkRet and checkRet == 0 then
				------------------------------------------------------------------------------	
			  local jz,_ = LuaFnCostMoneyWithPriority( sceneId, selfId, costMoney );	
				if jz == -1 then
					x210299_ShowTipWindow(sceneId, selfId, "#{GCShopBuyHandler_Info_Money_Is_Not_Enough}")
					return
				end
			------------------------------------------------------------------------------------
			local ret = LuaFnLearnSpecificEquitation(sceneId, selfId, selectSkill.id, 1);
			if ret and ret == 1 then
				LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x210299_g_SpecialEffectID, 0);
				x210299_ShowTipWindow(sceneId, selfId, "H鱟 疬㧟 "..selectSkill.name..".");
			end
		else
			x210299_ShowTipWindow(sceneId, selfId, "C醕 h� 疸 h鱟 疬㧟"..selectSkill.name..".");
		end
	end
end

--**********************************
--提示
--**********************************
function x210299_ShowTipWindow(sceneId, selfId, message)
	BeginEvent(sceneId);
		AddText(sceneId, message);
	EndEvent( );
	DispatchMissionTips(sceneId, selfId);
end

