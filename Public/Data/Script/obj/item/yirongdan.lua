--注意: 

--物品技能to� 鸬 逻辑只能使用基础技能和脚本来实现

--脚本:

--以下喧ng脚本样例:


------------------------------------------------------------------------------------------
--m祎 般物品to� 鸬 默认脚本

--脚本号
x300029_g_scriptId = 300029 --临时写C醝 n鄖 ,真正用to� 鸬 时候m祎 定要改.

--C to� 鸬 等c

--效果to� 鸬 ID
x300029_g_itemList = {}
x300029_g_itemList[30501003] = {impactId=4828}
x300029_g_itemList[30501007] = {impactId=4836}
x300029_g_itemList[30501008] = {impactId=4837}
x300029_g_itemList[30501009] = {impactId=4838}
x300029_g_itemList[30501010] = {impactId=4839}
x300029_g_itemList[30501011] = {impactId=4840}
x300029_g_itemList[30501012] = {impactId=4841}
x300029_g_itemList[30501013] = {impactId=4842}
x300029_g_itemList[30501014] = {impactId=4843}
x300029_g_itemList[30501015] = {impactId=4844}
x300029_g_itemList[30501016] = {impactId=4845}
x300029_g_itemList[30501101] = {impactId=4846}
x300029_g_itemList[30501102] = {impactId=4847}
x300029_g_itemList[30505132] = {impactId=4848}
x300029_g_itemList[30501107] = {impactId=4849}
x300029_g_itemList[30501108] = {impactId=4850}
x300029_g_itemList[30501109] = {impactId=4851}
x300029_g_itemList[30501110] = {impactId=4852}
x300029_g_itemList[30501111] = {impactId=4853}
x300029_g_itemList[30501112] = {impactId=4854}
x300029_g_itemList[30501113] = {impactId=4855}
x300029_g_itemList[30501114] = {impactId=4856}
x300029_g_itemList[30501115] = {impactId=4857}
x300029_g_itemList[30501116] = {impactId=4858}
x300029_g_itemList[30501125] = {impactId=4860}
x300029_g_itemList[30501126] = {impactId=4861}
x300029_g_itemList[30501127] = {impactId=4862}
x300029_g_itemList[30501128] = {impactId=4863}
x300029_g_itemList[30501129] = {impactId=4864}
x300029_g_itemList[30501130] = {impactId=4865}
x300029_g_itemList[30501131] = {impactId=4860}
x300029_g_itemList[30501132] = {impactId=4861}
x300029_g_itemList[30501133] = {impactId=4862}
x300029_g_itemList[30501134] = {impactId=4846}
x300029_g_itemList[30501135] = {impactId=4847}
x300029_g_itemList[30501136] = {impactId=4848}
x300029_g_itemList[30501137] = {impactId=4828}
x300029_g_itemList[30501138] = {impactId=4836}
x300029_g_itemList[30501139] = {impactId=4837}
x300029_g_itemList[30501140] = {impactId=4838}
x300029_g_itemList[30501141] = {impactId=4839}
x300029_g_itemList[30501142] = {impactId=4840}
x300029_g_itemList[30501143] = {impactId=4841}
x300029_g_itemList[30501144] = {impactId=4842}
x300029_g_itemList[30501145] = {impactId=4843}
x300029_g_itemList[30501146] = {impactId=4844}
x300029_g_itemList[30501147] = {impactId=4845}
x300029_g_itemList[30501148] = {impactId=4866}
x300029_g_itemList[30501149] = {impactId=4867}
x300029_g_itemList[30501150] = {impactId=4868}
x300029_g_itemList[30501151] = {impactId=4866}
x300029_g_itemList[30501152] = {impactId=4867}
x300029_g_itemList[30501153] = {impactId=4868}
x300029_g_itemList[30501154] = {impactId=4869}
x300029_g_itemList[30501155] = {impactId=4870}
x300029_g_itemList[30501156] = {impactId=4871}
x300029_g_itemList[30501157] = {impactId=4873}
x300029_g_itemList[30501158] = {impactId=4872}
x300029_g_itemList[30501159] = {impactId=4873}
x300029_g_itemList[30501160] = {impactId=4872}
x300029_g_itemList[30501163] = {impactId=4856}
x300029_g_itemList[30501164] = {impactId=4854}
x300029_g_itemList[30501165] = {impactId=4855}
x300029_g_itemList[30503022] = {impactId=4876} --礼盒变身
x300029_g_itemList[30503023] = {impactId=4877} --玫瑰花变身
x300029_g_itemList[30503024] = {impactId=4878} --兔爷变身

--**********************************
--事件交互入口
--**********************************
function x300029_OnDefaultEvent( sceneId, selfId, bagIndex )
-- 不C C醝 n鄖 接口,但要保留空函数
end

--**********************************
--C醝 n鄖 物品to� 鸬 使用过程喧ng否类似于技能: 
--H� th痭g会T読 执行开始时检测C醝 n鄖 函数to� 鸬 Tr� v�,如果Tr� v玹h b読则忽略后面to� 鸬 类似技能to� 鸬 执行.
--Tr� v�1: 技能类似to� 鸬 物品,可以继续类似技能to� 鸬 执行；Tr� v�0: 忽略后面to� 鸬 操作.
--**********************************
function x300029_IsSkillLikeScript( sceneId, selfId)
	return 1; --C醝 n鄖 脚本C 动作支持
end

--**********************************
--直接Hu� b鲂Ч�: 
--H� th痭g会直接调用C醝 n鄖 接口,并根据C醝 n鄖 函数to� 鸬 Tr� v礨醕 nh以后to� 鸬 流程喧ng否执行.
--Tr� v�1: 已经Hu� b龆杂πЧ�,不再执行后续操作；Tr� v�0: 没有检测到相关效果,继续执行.
--**********************************
function x300029_CancelImpacts( sceneId, selfId )
	return 0; --不C C醝 n鄖 接口,但要保留空函数,并且始终Tr� v�0.
end

--**********************************
--条件检测入口: 
--H� th痭g会T読 技能检测to� 鸬 时间 餴琺调用C醝 n鄖 接口,并根据C醝 n鄖 函数to� 鸬 Tr� v礨醕 nh以后to� 鸬 流程喧ng否执行.
--Tr� v�1: 条件检测通过,可以继续执行；Tr� v�0: 条件检测th b読,中断后续执行.
--**********************************
function x300029_OnConditionCheck( sceneId, selfId )
	--校验使用to� 鸬 物品
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
	
	local itemTblIndex = LuaFnGetItemIndexOfUsedItem( sceneId, selfId );
	local itemCur = x300029_g_itemList[itemTblIndex];
	if not itemCur then
		x300029_NotifyFailTips(sceneId, selfId, "Ch遖 m� 鹫o c�, kh鬾g th� s� d鴑g.");
		return 0;
	end

	return 1; --不C 任何条件,并且始终Tr� v�1.
end

--**********************************
--消耗检测及处理入口: 
--H� th痭g会T読 技能消耗to� 鸬 时间 餴琺调用C醝 n鄖 接口,并根据C醝 n鄖 函数to� 鸬 Tr� v礨醕 nh以后to� 鸬 流程喧ng否执行.
--Tr� v�1: 消耗处理通过,可以继续执行；Tr� v�0: 消耗检测th b読,中断后续执行.
--注意: 这不光负责消耗to� 鸬 检测也负责消耗to� 鸬 执行.
--**********************************
function x300029_OnDeplete( sceneId, selfId )
	if(0<LuaFnDepletingUsedItem(sceneId, selfId)) then
		return 1;
	end
	return 0;
end

--**********************************
--只会执行m祎 次入口: 
--聚气和瞬发技能会T読 消耗完成后调用C醝 n鄖 接口(聚气结束并且各种条件都Th鯽 m鉵to� 鸬 时候),而引导
--技能也会T読 消耗完成后调用C醝 n鄖 接口(技能to� 鸬 m祎 开始,消耗成功执行之后).
--Tr� v�1: 处理成功；Tr� v�0: 处理th b読.
--注: 这里喧ng技能生效m祎 次to� 鸬 入口
--**********************************
function x300029_OnActivateOnce( sceneId, selfId )
	local itemTblIndex = LuaFnGetItemIndexOfUsedItem( sceneId, selfId );
	local itemCur = x300029_g_itemList[itemTblIndex];
	if not itemCur then
		x300029_NotifyFailTips(sceneId, selfId, "Ch遖 m� 鹫o c�, kh鬾g th� s� d鴑g.");
		return 0;
	end
	
	if(-1~=itemCur.impactId) then
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, itemCur.impactId, 0);
	end
	return 1;
end

--**********************************
--引导心跳处理入口: 
--引导技能会T読 每次心跳结束时调用C醝 n鄖 接口.
--Tr� v�: 1继续下次心跳；0: 中断引导.
--注: 这里喧ng技能生效m祎 次to� 鸬 入口
--**********************************
function x300029_OnActivateEachTick( sceneId, selfId)
	return 1; --不喧ng引导性脚本, 只保留空函数.
end

--**********************************
-- 醒目th b読提示
--**********************************
function x300029_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
