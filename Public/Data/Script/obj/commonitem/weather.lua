--注意: 

--物品技能to� 鸬 逻辑只能使用基础技能和脚本来实现

--脚本:

--脚本号
x331026_g_scriptId = 331026 --临时写C醝 n鄖 ,真正用to� 鸬 时候m祎 定要改.

-- effect = Client/Config/EffectDefine.txt中定义to� 鸬 
-- time = 持续时间( gi鈟)

x331026_g_itemList = {}
x331026_g_itemList[30509029] = {effect=2, time=60,
	msg1="#W#{_INFOUSR%s}#c00FFFF th 疸 l鈛 kh鬾g m遖, c鈟 c痠 ru祅g 黏t kh� c, kh鬾g 疣nh l騨g n阯 疸 l 1 %s#c00FFFF, mi畁g l b, 1 l鷆 sau ch� th m鈟 餰n 餰n k閛 馥y tr秈, m遖 gi� b鉶 b鵱g.",
	msg2="#W#{_INFOUSR%s}#c00FFFF th �#G%s#c00FFFF 疸 l鈛 kh鬾g m遖, c鈟 c痠 ru祅g 黏t kh� c, kh鬾g 疣nh l騨g n阯 疸 l 1 %s#c00FFFF, mi畁g l b, 1 l鷆 sau ch� th m鈟 餰n 餰n k閛 馥y tr秈, m遖 gi� b鉶 b鵱g."}
x331026_g_itemList[30509030] = {effect=3, time=60,
	msg1="#W#{_INFOUSR%s}#c00FFFF 衋ng 鹧ng t読 ng叨i y陁 c黙 m靚h l l秈 th�, n猽 nh� c� ph� l騨g sau n鄖 s� b� tr秈 疳nh. V譨 n骾 d裻 c鈛, kh鬾g ng� m鈟 餰n k閛 皙n, s ch緋  . L鷆 痼 h� 皙n n閠 m 馥y v� kinh s�. Sau n鄖 ph醫 hi畁 Kh鬾g ng� l� do %s#c00FFFF l鄊 ra.",
	msg2="#W#{_INFOUSR%s}#c00FFFF 衋ng 鹧ng t読 ng叨i y陁 c黙 m靚h l l秈 th�, n猽 nh� c� ph� l騨g sau n鄖 s� b� tr秈 疳nh. V譨 n骾 d裻 c鈛, #G%s#c00FFFF kh鬾g ng� m鈟 餰n k閛 皙n, s ch緋  . L鷆 痼 h� 皙n n閠 m 馥y v� kinh s�. Sau n鄖 ph醫 hi畁 Kh鬾g ng� l� do %s#c00FFFF l鄊 ra."}
x331026_g_itemList[30509031] = {effect=4, time=60,
	msg1="#W#{_INFOUSR%s}#c00FFFF b� 1 疳m ti瑄 t� qu r li阯 t鴆 v� kh鬾g c騨 bi畁 ph醦 n鄌 kh醕, ch� c騨 l b鋙 v %s#c00FFFF 疸 c gi l鈛 nay, g鄌 l阯 1 ti猲g \"Oan!\", tr阯 tr秈 b眓g xu hi畁 1 lu皀g tuy猼 Nga mao r総 xu痭g, l� ti瑄 t� kinh s� qu� b� ch誽.",
	msg2="#W#{_INFOUSR%s}#c00FFFF t読 G%s#c00FFFF b� 1 疳m ti瑄 t� qu g li阯 t鴆 v� kh鬾g c騨 bi畁 ph醦 n鄌 kh醕, ch� c騨 l b鋙 v %s#c00FFFF 疸 c gi l鈛 nay, g鄌 l阯 1 ti猲g \"Oan!\", tr阯 tr秈 b眓g xu hi畁 1 lu皀g tuy猼 Nga mao r総 xu痭g, l� ti瑄 t� kinh s� qu� b� ch誽."}
x331026_g_itemList[30509032] = {effect=5, time=60,
	msg1="#W#{_INFOUSR%s}#c00FFFF v� gia t錸g kh鬾g kh� c黙 s� l鉵g m課g v緄 ng叨i y陁 c黙 m靚h t読 Hoa ti玭 nguy畉 h�, s� d鴑g %s#c00FFFF v ph n鄖 kh鬾g d� c� 疬㧟 n鄖 ",
	msg2="#W#{_INFOUSR%s}#c00FFFF v� gia t錸g kh鬾g kh� c黙 s� l鉵g m課g v緄 ng叨i y陁 c黙 m靚h t読 #G%s#c00FFFF, s� d鴑g %s#c00FFFF v ph n鄖 kh鬾g d� c� 疬㧟 n鄖 "}
x331026_g_itemList[30509033] = {effect=6, time=60,
	msg1="#W#{_INFOUSR%s}#c00FFFF 餫ng c鵱g cao th� v� l鈓 t� v� %s#c00FFFF, khi th tr鷆 di畃 bay 馥y tr秈, ngay l t裞 tr� n阯 kh� th� h絥 ng叨i.",
	msg2="#W#{_INFOUSR%s}#c00FFFF 餫ng c鵱g cao th� v� l鈓 � #G%s#c00FFFFt� v�, s� d鴑g tr呔c 1 %s#c00FFFF, khi th tr鷆 di畃 bay 馥y tr秈, ngay l t裞 tr� n阯 kh� th� h絥 ng叨i."}
x331026_g_itemList[30509034] = {effect=7, time=60,
	msg1="#W#{_INFOUSR%s}#c00FFFF trong l鷆 餫ng 餴 d誳, ng鐄 h裯g l鄊 th�, s� d鴑g 1 %s#c00FFFF, m nh靚 phong di畃 bay 馥y tr秈, bu礳 mi畁g ng鈓 ra c鈛 \"S呓ng di畃 h皀g vu nh� nguy畉 hoa\", l鄊 ng叨i 餴 疬秐g r  t唼ng.",
	msg2="#W#{_INFOUSR%s}#c00FFFF �#G%s#c00FFFF trong l鷆 餫ng 餴 d誳, ng鐄 h裯g l鄊 th�, s� d鴑g 1 %s#c00FFFF, m nh靚 phong di畃 bay 馥y tr秈, bu礳 mi畁g ng鈓 ra c鈛 \"S呓ng di畃 h皀g vu nh� nguy畉 hoa\", l鄊 ng叨i 餴 疬秐g r  t唼ng."}
x331026_g_itemList[30509035] = {effect=8, time=60,
	msg1="#W#{_INFOUSR%s}#c00FFFF 皤u b� m鱥 ng叨i ch� khu鬾 m c黙 m靚h, trong l騨g kh鬾g cam t鈓, trong l鷆 gi d� 疸 s� d鴑g 1 %s#c00FFFF, sau 痼 t� trong b tr秈 馥y c醫 b鴌 餴 ra, r h鄆 l騨g v緄 s� thay 鸨i c黙 b鋘 th鈔.",
	msg2="#W#{_INFOUSR%s}#c00FFFF 皤u b� m鱥 ng叨i ch� khu鬾 m c黙 m靚h, trong l騨g kh鬾g cam t鈓, 疸 � #G%s#c00FFFF s� d鴑g 1 %s#c00FFFF, sau 痼 t� trong b tr秈 馥y c醫 b鴌 餴 ra, r h鄆 l騨g v緄 s� thay 鸨i c黙 b鋘 th鈔."}
x331026_g_itemList[30509036] = {effect=9, time=60,
	msg1="#W#{_INFOUSR%s}#c00FFFF n m� c鹡g mu痭 ph醫 t鄆, cho n阯 s� d鴑g 1 %s#c00FFFF, ngay l t裞 nguy阯 b鋙 r絠 nh� m遖, m鱥 ng叨i vui m譶g hoan h�.",
	msg2="#W#{_INFOUSR%s}#c00FFFF n m� c鹡g mu痭 ph醫 t鄆, n阯 � #G%s#c00FFFF s� d鴑g 1 %s#c00FFFF, ngay l t裞 nguy阯 b鋙 r絠 nh� m遖, m鱥 ng叨i vui m譶g hoan h�."}
x331026_g_itemList[30509052] = {effect=10, time=60,
	msg1="#HTh醤g n錷, m祎 h癷 l鬷 minh sau m遖 to ti猲 皙n, bay v� ph韆 nam chim nh課 tr鑟 non l礽 su痠 tr� v� nh�; T読 疴y m鵤 r馽 r� #W#{_INFOUSR%s}#H s� d鴑g m祎 c醝 #W%s#H, t� l ca ng㱮 n鄖 痿ng m誧h d呓ng tu� n鬾g d鈔 huy h鉵 h� s�, v v� c c� c鄖 c h鋙 quang c鋘h.",
	msg2="#HLao 鸬ng l� th k� , lao 鸬ng l� v� 鹫i . Ng叨i lao 鸬ng d鵱g c lao  hai tay c鵱g tr� tu�, b畁  n鄖 nhi玼 m鄒 ban lan  th� gi緄, s醤g t誳  nh鈔 lo読  v錸 minh.#W#{_INFOUSR%s}#H t読 疴y c醝 穑c bi畉  trong cu礳 s痭g, � #G%s#H s� d鴑g  m祎 c醝 #W%s#H h呔ng to鄋 th� gi緄  ng叨i lao 鸬ng ch鄌!"}
x331026_g_itemList[30509066] = {effect=20, time=60,
	msg1="#H嘘m th t竎h bu鬾g xu痭g,#W#{_INFOUSR%s}#H 痍m qua m祅g ng遳 lang ch裞 n� c h� th呔c g g�, h鈓 m� v� c鵱g, v� th� s� d鴑g  m祎 c醝 #W%s#H, l n鄖 h呔ng s� h鎢 鸬c th鈔  m鱥 ng叨i t鋘 y陁  t韓 hi畊!",
	msg2="#H嘘m th t竎h, c h� th呔c, ng鈔 h�, ng遳 lang ch裞 n�......#W#{_INFOUSR%s}#H t読 疴y c醝 穑c bi畉  trong cu礳 s痭g, 鸬t nhi阯 l騨g c� s� c鋗, h呔ng #G%s#H  thi阯 kh鬾g n閙 餴 m祎 phen #W%s#H, nh th秈 hoa v� bay t醤 lo課."}
x331026_g_itemList[30509071] = {effect=21, time=60,
	msg1="#{AOYYH_8804_01}#W#{_INFOUSR%s}#H t靚h c鋗 m鉵h li畉 d鈔g tr鄌 #{AOYYH_8804_03}%s#{AOYYH_8804_04}",
	msg2="#{AOYYH_8804_01}#W#{_INFOUSR%s}#H t靚h c鋗 m鉵h li畉 d鈔g tr鄌 t読 #G%s#{AOYYH_8804_03}%s#{AOYYH_8804_04}"}
x331026_g_itemList[30509083] = {effect=22, time=60,
	msg1="#HKhi t緄 sinh nh b課 th鈔, #W#{_INFOUSR%s}#H m譶g r� kh鬾g t� k靘 h鉳 疬㧟, v� th� s� d鴑g m祎 c醝 #W%s#H, bi瑄 鹫t ch鷆 ph鷆 ch鈔 th鄋h tha thi猼 鸠i v緄 sinh nh bg h鎢!",
	msg2="#W#{_INFOUSR%s}#H � sinh nh b課 tri k�, cho #G%s#H ch鈓 ng騣  m祎 c醝 #W%s#H, n骾: Nguy畁 s� h鎢 kho醝 ho誸, h課h ph鷆,  醦, v may s� 皙n v緄 ng呓i, sinh nh vui v�!"}
--**********************************
--事件交互入口
--**********************************
function x331026_OnDefaultEvent( sceneId, selfId, bagIndex )
-- 不C C醝 n鄖 接口,但要保留空函数
end

--**********************************
--C醝 n鄖 物品to� 鸬 使用过程喧ng否类似于技能: 
--H� th痭g会T読 执行开始时检测C醝 n鄖 函数to� 鸬 Tr� v�,如果Tr� v玹h b読则忽略后面to� 鸬 类似技能to� 鸬 执行.
--Tr� v�1: 技能类似to� 鸬 物品,可以继续类似技能to� 鸬 执行；Tr� v�0: 忽略后面to� 鸬 操作.
--**********************************
function x331026_IsSkillLikeScript( sceneId, selfId)
	return 1; --C醝 n鄖 脚本C 动作支持
end

--**********************************
--直接Hu� b鲂Ч�: 
--H� th痭g会直接调用C醝 n鄖 接口,并根据C醝 n鄖 函数to� 鸬 Tr� v礨醕 nh以后to� 鸬 流程喧ng否执行.
--Tr� v�1: 已经Hu� b龆杂πЧ�,不再执行后续操作；Tr� v�0: 没有检测到相关效果,继续执行.
--**********************************
function x331026_CancelImpacts( sceneId, selfId )
	return 0; --不C C醝 n鄖 接口,但要保留空函数,并且始终Tr� v�0.
end

--**********************************
--条件检测入口: 
--H� th痭g会T読 技能检测to� 鸬 时间 餴琺调用C醝 n鄖 接口,并根据C醝 n鄖 函数to� 鸬 Tr� v礨醕 nh以后to� 鸬 流程喧ng否执行.
--Tr� v�1: 条件检测通过,可以继续执行；Tr� v�0: 条件检测th b読,中断后续执行.
--**********************************
function x331026_OnConditionCheck( sceneId, selfId )
	--校验使用to� 鸬 物品
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
	
	local itemTblIndex = LuaFnGetItemIndexOfUsedItem( sceneId, selfId );
	local curItem = x331026_g_itemList[itemTblIndex];
	if not curItem then
		x331026_NotifyFailTips(sceneId, selfId, "Ch遖 m� 鹫o c�, kh鬾g th� s� d鴑g.");
		return 0;
	end
	
	local curWeather = LuaFnGetSceneWeather(sceneId);
	if not curWeather or curWeather ~= -1 then
		x331026_NotifyFailTips(sceneId, selfId, "Trong kh鬾g kh� 穑c th� kh鬾g th� s� d鴑g v ph n鄖.");
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
function x331026_OnDeplete( sceneId, selfId )
	
	local itemTblIndex = LuaFnGetItemIndexOfUsedItem( sceneId, selfId );
	local curItem = x331026_g_itemList[itemTblIndex];
	if not curItem then
		x331026_NotifyFailTips(sceneId, selfId, "Ch遖 m� 鹫o c�, kh鬾g th� s� d鴑g.");
		return 0;
	end
	
	local itemBagIndex = LuaFnGetBagIndexOfUsedItem(sceneId, selfId);
	local szTransferItem = GetBagItemTransfer(sceneId, selfId, itemBagIndex);
	local selfName = GetName(sceneId, selfId);
	
	if(0<LuaFnDepletingUsedItem(sceneId, selfId)) then
		if szTransferItem and selfName then
			local sceneType = LuaFnGetSceneType(sceneId);
			local strMsg;
			if sceneType and sceneType == 0 then
				local sceneName = GetSceneName(sceneId);
				strMsg = format(curItem.msg2, selfName, sceneName, "#{_INFOMSG"..szTransferItem.."}");
			else
				strMsg = format(curItem.msg1, selfName, "#{_INFOMSG"..szTransferItem.."}");
			end
			BroadMsgByChatPipe(sceneId, selfId, strMsg, 4);
		end
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
function x331026_OnActivateOnce( sceneId, selfId )
	
	local itemTblIndex = LuaFnGetItemIndexOfUsedItem( sceneId, selfId );
	local curItem = x331026_g_itemList[itemTblIndex];
	if not curItem then
		x331026_NotifyFailTips(sceneId, selfId, "Ch遖 m� 鹫o c�, kh鬾g th� s� d鴑g.");
		return 0;
	end
	
	LuaFnSetSceneWeather(sceneId, curItem.effect, curItem.time * 1000 );
	return 1;
end

--**********************************
--引导心跳处理入口: 
--引导技能会T読 每次心跳结束时调用C醝 n鄖 接口.
--Tr� v�: 1继续下次心跳；0: 中断引导.
--注: 这里喧ng技能生效m祎 次to� 鸬 入口
--**********************************
function x331026_OnActivateEachTick( sceneId, selfId)
	return 1; --不喧ng引导性脚本, 只保留空函数.
end

--**********************************
-- 醒目th b読提示
--**********************************
function x331026_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
