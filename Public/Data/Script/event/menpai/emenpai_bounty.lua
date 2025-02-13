--门派奖励装备与珍兽

--脚本号
x808004_g_ScriptId			= 808004

--操作集
x808004_g_Key			=
{
	["eqp"]					= 100,	--L頽h 装备
	["pet"]					= 101,	--L頽h 珍兽
	["menpai"]				= 102,	--L頽h 门派时装
}

--装备奖励
x808004_g_EqpNum	= 9
x808004_g_Eqp			=
{
	[0]	= { weapon = 10430010, armor = 10443010, menpai=10124000 },	--Thi猽 L鈓
	[1]	= { weapon = 10431110, armor = 10443110, menpai=10124001 },	--Minh Gi醥
	[2]	= { weapon = 10431210, armor = 10443210, menpai=10124002 },	--C醝 Bang
	[3]	= { weapon = 10432010, armor = 10443410, menpai=10124004 },	--V� 衋ng
	[4]	= { weapon = 10432110, armor = 10443310, menpai=10124003 },	--Nga My
	[5]	= { weapon = 10433210, armor = 10443510, menpai=10124005 },	--Tinh T鷆
	[6]	= { weapon = 10435210, armor = 10443810, menpai=10124008 },	--Thi阯 Long
	[7]	= { weapon = 10434010, armor = 10443610, menpai=10124006 },	--Thi阯 S絥
	[8] = { weapon = 10435110, armor = 10443710, menpai=10124007 },	--Ti陁 Dao
}

--珍兽奖励
x808004_g_PetNum	= 3
x808004_g_Pet			=
{
	itemRcvErrMsg = "    Khi tg tr鈔 th� cho c醕 h�, c騨 ph鋓 疬a c� 鸢 ch絠 v� 鸢 錸 cho tr鈔 th�. Xin 瓞 hai khoang tr痭g trong H鄋h trang v� h銀 t緄 t靘 t読 h�.",
	[1]	= { id = 3030, name = "C T� Tr叻ng Th鄋h",   itemList = { { id = 30601001, num = 20 }, { id = 30602001, num = 20 } } },
	[2]	= { id = 3040, name = "Nh韒 Tr叻ng Th鄋h", itemList = { { id = 30601001, num = 20 }, { id = 30604001, num = 20 } } },
	[3]	= { id = 3050, name = "H T� Tr叻ng Th鄋h", itemList = { { id = 30601001, num = 20 }, { id = 30605001, num = 20 } } },
}

--**********************************
--任务入口函数
--**********************************
function x808004_OnDefaultEvent( sceneId, selfId, targetId, menpai )
	local	mp	= GetMenPai( sceneId, selfId )
	if mp < 0 or mp >= x808004_g_EqpNum then
		x808004_MsgBox( sceneId, selfId, targetId, "  C醕 h� v鏽 ch遖 gia nh m鬾 ph醝!" )
		return
	end
	if mp ~= menpai then
		x808004_MsgBox( sceneId, selfId, targetId, "  C醕 h� kh鬾g ph鋓 l� 甬 t� c黙 b鋘 m鬾!" )
		return
	end

	local	flag	= GetMissionData( sceneId, selfId, MD_MENPAI_BOUNTY )
	local	fEqp	= floor( flag / 10 )
	local	fPet	= flag - fEqp * 10
	local	str

	--选择按钮
	local	key	= GetNumText()
	local	rnd
	
		
	if key == x808004_g_Key["eqp"] then
		if fEqp > 0 then
			return
		end

		if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 1 then
			x808004_MsgBox( sceneId, selfId, targetId, "  Kh鬾g gian trong H鄋h trang c黙 c醕 h� kh鬾g 瘘. Ch飊h l� xong h銀 t緄 t靘 t読 h�." )
			return
		end
		if TryRecieveItem( sceneId, selfId, x808004_g_Eqp[mp].weapon, 1 ) >= 0 then
			str		= "#YC醕 h� nh 疬㧟 "..GetItemName( sceneId, x808004_g_Eqp[mp].weapon ).."."
			Msg2Player( sceneId, selfId, str, MSG2PLAYER_PARA )
			x808004_NotifyTip( sceneId, selfId, str )
		end
		if TryRecieveItem( sceneId, selfId, x808004_g_Eqp[mp].armor, 1 ) >= 0 then
			str		= "#YC醕 h� nh 疬㧟 "..GetItemName( sceneId, x808004_g_Eqp[mp].armor ).."."
			Msg2Player( sceneId, selfId, str, MSG2PLAYER_PARA )
			x808004_NotifyTip( sceneId, selfId, str )
		end
		x808004_MsgBox( sceneId, selfId, targetId, "  H銀 xem h鄋h trang, c醕 h� 疸 鹫t 疬㧟 tg th叻ng trang b�" )
		fEqp		= 1
	elseif key == x808004_g_Key["pet"] then
		if fPet > 0 then
			return
		end

		rnd			= random( getn( x808004_g_Pet ) )

		local itemList = x808004_g_Pet[rnd].itemList
		if not itemList then
			return
		end

		LuaFnBeginAddItem( sceneId )
			for i, item in itemList do
				LuaFnAddItem( sceneId, item.id, item.num )
			end
		local nRet = LuaFnEndAddItem( sceneId, selfId )
		if nRet ~= 1 then
			x808004_MsgBox( sceneId, selfId, targetId, x808004_g_Pet.itemRcvErrMsg )
			return
		end

		local createPetRet, retGUID_H, retGUID_L = LuaFnCreatePetToHuman(sceneId, selfId, x808004_g_Pet[rnd].id, 10, 0);
		if createPetRet and createPetRet == 1 then
			LuaFnAddItemListToHuman( sceneId, selfId )
			str		= "#YC醕 h� nh 疬㧟 "..x808004_g_Pet[rnd].name.."."
			Msg2Player( sceneId, selfId, str, MSG2PLAYER_PARA )
			x808004_NotifyTip( sceneId, selfId, str )
			x808004_MsgBox( sceneId, selfId, targetId, "  H銀 xem h鄋h trang, c醕 h� 疸 鹫t 疬㧟 tg th叻ng tr鈔 th�" )
			fPet	= 1
		else
			x808004_MsgBox( sceneId, selfId, targetId, "  C醕 h� kh鬾g th� mang theo qu� nhi玼 tr鈔 th�" )
		end
	elseif key == x808004_g_Key["menpai"] then
		if GetMissionData( sceneId, selfId, MD_MENPAI_BOUNTY_SHIZHUANG ) > 0 then
			return
		end

		if GetItemCount(sceneId,selfId, x808004_g_Eqp[mp].menpai) > 0 then
			x808004_MsgBox( sceneId, selfId, targetId, "Tr阯 ng叨i c醕 h� 疸 c� th秈 trang m鬾 ph醝, kh鬾g th� nh th阭" )
			return
		end
		
		if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 1 then
			x808004_MsgBox( sceneId, selfId, targetId, "  Kh鬾g gian trong H鄋h trang c黙 c醕 h� kh鬾g 瘘. Ch飊h l� xong h銀 t緄 t靘 t読 h�" )
			return
		end
		if TryRecieveItem( sceneId, selfId, x808004_g_Eqp[mp].menpai, 1 ) >= 0 then
			str		= "#YC醕 h� nh 疬㧟 "..GetItemName( sceneId, x808004_g_Eqp[mp].menpai ).."."
			Msg2Player( sceneId, selfId, str, MSG2PLAYER_PARA )
			x808004_NotifyTip( sceneId, selfId, str )
		end
		SetMissionData( sceneId, selfId, MD_MENPAI_BOUNTY_SHIZHUANG, 1 )		
		return
	end
	
	--门派奖励to� 鸬 标记
	SetMissionData( sceneId, selfId, MD_MENPAI_BOUNTY, floor( fEqp * 10 + fPet ) )
end

--**********************************
--列举事件
--**********************************
function x808004_OnEnumerate( sceneId, selfId, targetId )
	--设置门派奖励to� 鸬 标记,此任务只能接取m祎 次
	local	flag		= GetMissionData( sceneId, selfId, MD_MENPAI_BOUNTY )
	local	bShiZhuang	= GetMissionData( sceneId, selfId, MD_MENPAI_BOUNTY_SHIZHUANG )
	local	fEqp	= floor( flag / 10 )
	local	fPet	= flag - fEqp * 10
	if fEqp == 0 then
		AddNumText( sceneId, x808004_g_ScriptId, "Nh trang b�", 4, x808004_g_Key["eqp"] )
	end
	if fPet == 0 then
		AddNumText( sceneId, x808004_g_ScriptId, "Nh tr鈔 th�", 4, x808004_g_Key["pet"] )
	end
	if bShiZhuang <= 0 then
		AddNumText( sceneId, x808004_g_ScriptId, "Nh th秈 trang m鬾 ph醝", 4, x808004_g_Key["menpai"] )
	end
	
end

--**********************************
--对话框提示
--**********************************
function x808004_MsgBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--醒目提示
--**********************************
function x808004_NotifyTip( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
