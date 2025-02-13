--姓i L齆PC
--黄纳福
--普通

--脚本号
x002087_g_ScriptId	= 002087

--任务号
x002087_g_MoneyId = MF_BUCHANG_MONEY
x002087_g_StoneId = MF_BUCHANG_STONE
x002087_g_EquipId = MF_BUCHANG_EQUIP

--各c醝门派装备列表
x002087_g_equipInfo = {}
x002087_g_equipInfo[0]	= {MP_XINGSU,10433240,10440540,10441540,10442540,10443540,10444540,10445540,10450054,10451054,10452054,10453054}
x002087_g_equipInfo[1]	= {MP_XIAOYAO,10434140,10440740,10441740,10442740,10443740,10444740,10445740,10450074,10451074,10452074,10453074}
x002087_g_equipInfo[2]	= {MP_SHAOLIN,10431040,10440040,10441040,10442040,10443040,10444040,10445040,10450004,10451004,10452004,10453004}
x002087_g_equipInfo[3]	= {MP_TIANSHAN,10435040,10440640,10441640,10442640,10443640,10444640,10445640,10450064,10451064,10452064,10453064}
x002087_g_equipInfo[4]	= {MP_DALI,10434240,10440840,10441840,10442840,10443840,10444840,10445840,10450084,10451084,10452084,10453084}
x002087_g_equipInfo[5]	= {MP_EMEI,10433040,10440340,10441340,10442340,10443340,10444340,10445340,10450034,10451034,10452034,10453034}
x002087_g_equipInfo[6]	= {MP_WUDANG,10432140,10440440,10441440,10442440,10443440,10444440,10445440,10450044,10451044,10452044,10453044}
x002087_g_equipInfo[7]	= {MP_MINGJIAO,10430140,10440140,10441140,10442140,10443140,10444140,10445140,10450014,10451014,10452014,10453014}
x002087_g_equipInfo[8]	= {MP_GAIBANG,10431240,10440240,10441240,10442240,10443240,10444240,10445240,10450024,10451024,10452024,10453024}

--事件交互入口
--**********************************
function x002087_OnDefaultEvent( sceneId, selfId, targetId )
	--首先应该判断喧ng否应该给予补偿
	--相关to� 鸬 代码
	--显示补偿列表
	--15号开始,21号结束
	local day = GetDayTime()
	if day >= 7019 then
		x002087_MsgBox( sceneId, selfId, targetId, "Th秈 gian nhi甿 v� 疸 qua" )
		return
	end
	BeginEvent( sceneId )
		AddText( sceneId, "  Xin c鋗 t� m鱥 ng叨i 疸 黱g h� Thi阯 Long B醫 B�, 瓞 th� nghi甿 h� th痭g tr� ch絠 m緄, c ph鋓 x骯 t� li畊 l遳 tr�. V� c鵱g th� l瞚 v� b ti畁 n鄖. Ta c� ch鷗 qu� m鱪 cho m鱥 ng叨i, xin 鹱ng ch� c叨i" )
		AddNumText( sceneId, x002087_g_ScriptId, "N鈔g 鹌ng c t緄 10", 6, 0 )
		AddNumText( sceneId, x002087_g_ScriptId, "N鈔g 鹌ng c t緄 40", 6, 1 )
		AddNumText( sceneId, x002087_g_ScriptId, "Cho ta 1 b� trang b� c 40", 6, 2 )
		AddNumText( sceneId, x002087_g_ScriptId, "Ta 疸 40 r癷, h銀 cho ta B鋙 Th誧h", 6, 3 )
		AddNumText( sceneId, x002087_g_ScriptId, "Ta 疸 40 r癷, h銀 cho ta ng鈔 l唼ng", 6, 4 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--事件交互入口
--**********************************
function x002087_OnStoneEvent( sceneId, selfId, targetId )
	--首先应该判断喧ng否应该给予补偿
	--相关to� 鸬 代码
	--显示补偿列表
	BeginEvent( sceneId )
		AddText( sceneId, "  Ng呓i mu痭 l鉵h B鋙 Th誧h g�? Ch� c� th� nh 1 trong 2 lo読 B鋙 Th誧h d呔i 疴y" )
		AddNumText( sceneId, x002087_g_ScriptId, "Mi陁 Nh鉵 Th誧h", 6, 5 )
		AddNumText( sceneId, x002087_g_ScriptId, "H� Nh鉵 Th誧h", 6, 6 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中m祎 项
--**********************************
function x002087_OnEventRequest( sceneId, selfId, targetId, eventId )
	--取 餴琺列表号
	local	arg	= GetNumText()
	local	id	= LuaFnGetMenPai( sceneId, selfId )
	if arg == 0 then		-- 餴琺击了10c选项
	--判断喧ng否大于10c
		if GetLevel( sceneId, selfId ) >= 10 then --大于等于10c
			x002087_MsgBox( sceneId, selfId, targetId, "  衅ng c c黙 c醕 h� 疸 l緉 t呓ng 疬絥g v緄 c 10, kh鬾g th� th錸g c 鹌ng c c黙 c醕 h�" )
			return
		else --设置等c为10c
			LuaFnHumanLevelUp(sceneId, selfId,10,0)
			x002087_MsgBox( sceneId, selfId, targetId, "Ch鷆 m譶g c醕 h� th錸g c t緄 10, c醕 h� v v� qu�" )
			return
		end
	elseif arg == 1 then-- 餴琺击了40c选项
		--判断喧ng否大于40c
		if GetLevel( sceneId, selfId ) >= 40 then --大于等于40c
			x002087_MsgBox( sceneId, selfId, targetId, "  衅ng c c黙 c醕 h� 疸 l緉 t呓ng 疬絥g v緄 c 40, kh鬾g th� th錸g c 鹌ng c c黙 c醕 h� n鎍" )
			return
		elseif id < 0 or id >= 9 then --判断喧ng否加入门派
				x002087_MsgBox( sceneId, selfId, targetId, "  Xin gia nh m鬾 ph醝 tr呔c, c� th� th錸g 鹌ng c m靚h t緄 10 tr呔c r癷 m緄 gia nh m鬾 ph醝" )
				return
		else
			LuaFnHumanLevelUp(sceneId, selfId,40,40)
			x002087_MsgBox( sceneId, selfId, targetId, "Ch鷆 m譶g c醕 h� th錸g c t緄 40, c醕 h� v v� qu�" )
			return
		end
	elseif arg == 2 then--玩家要装备
		--判断喧ng否小于40c
		if GetMissionFlag(sceneId,selfId,x002087_g_EquipId)==1 then
			x002087_MsgBox( sceneId, selfId, targetId, " L鉶 gi� ta v鏽 ch遖 h� 鸢 疴u, ch苙g ph鋓 ng呓i 疸 t譶g l鉵h r癷 sao?" )
			return			
		elseif GetLevel( sceneId, selfId ) < 40 then --小于40c
			x002087_MsgBox( sceneId, selfId, targetId, " Ch� sau khi 鹫t t緄 c 40, m緄 疬㧟 l鉵h trang b� b� sung" )
			return
		elseif id < 0 or id >= 9 then --判断喧ng否加入门派
				x002087_MsgBox( sceneId, selfId, targetId, "  Xin gia nh m鬾 ph醝 tr呔c, c� th� th錸g 鹌ng c m靚h t緄 10 tr呔c r癷 m緄 gia nh m鬾 ph醝" )
				return
		else --喧ng否有13c醝空格
			if LuaFnGetPropertyBagSpace(sceneId, selfId) < 11  then --没有空格
				x002087_MsgBox( sceneId, selfId, targetId, "	1 b� trang b� c 40 t眓g c祅g g癿 11 m髇, kh鬾g gian tay n鋓 c黙 c醕 h� kh鬾g 瘘 cho 11, d鱪 d﹑ xong, h銀 t緄 t靘 ta" )
				return
			else 
				--按照门派给玩家装备
				x002087_GiveEquip( sceneId, selfId, targetId, id)
				x002087_MsgBox( sceneId, selfId, targetId, "Cho c醕 h� trang b� n鄖, c醕 h� v鏽 ch遖 h鄆 l騨g?" )
				SetMissionFlag( sceneId, selfId, x002087_g_EquipId, 1 )
				return
			end
		end
	elseif arg == 3 then--玩家要宝石
		if GetMissionFlag(sceneId,selfId,x002087_g_StoneId)==1 then
			x002087_MsgBox( sceneId, selfId, targetId, " L鉶 gi� ta v鏽 ch遖 h� 鸢 疴u, ch苙g ph鋓 ng呓i 疸 t譶g l鉵h r癷 sao?" )
			return			
		--判断喧ng否小于40c
		elseif GetLevel( sceneId, selfId ) < 40 then --小于40c
			x002087_MsgBox( sceneId, selfId, targetId, " Ch� sau khi 鹫t t緄 c 40, m緄 疬㧟 l頽h B鋙 Th誧h b� sung" )
			return
		else --给出宝石列表
			x002087_OnStoneEvent( sceneId, selfId, targetId )
			return
		end
	elseif arg == 4 then--玩家要钱
		--判断喧ng否小于40c
		if GetMissionFlag(sceneId,selfId,x002087_g_MoneyId)==1 then
			x002087_MsgBox( sceneId, selfId, targetId, " L鉶 gi� ta v鏽 ch遖 h� 鸢 疴u, ch苙g ph鋓 ng呓i 疸 t譶g l鉵h r癷 sao?" )
			return	
		elseif GetLevel( sceneId, selfId ) < 40 then --小于40c
			x002087_MsgBox( sceneId, selfId, targetId, " Ch� sau khi 鹫t t緄 c 40, m緄 疬㧟 l頽h 鸢ng v鄋g b� sung" )
			return
		else --给出宝石列表
			if LuaFnAddMoney(sceneId, selfId,1000000) == -1  then --给钱th b読该如何做?
				--加钱th b読
				return
			else
				x002087_MsgBox( sceneId, selfId, targetId, "C醕 h� th tham qu�, l c� ti玭 d咿ng l鉶 c黙 ta" )
				SetMissionFlag( sceneId, selfId, x002087_g_MoneyId, 1 )
				return
			end
		end		
	elseif arg == 5 then--玩家要Mi陁 Nh鉵 Th誧h
		--判断喧ng否已经拿过Mi陁 Nh鉵 Th誧h
		if GetLevel( sceneId, selfId ) < 40 then --小于40c
			x002087_MsgBox( sceneId, selfId, targetId, " Ch� sau khi 鹫t t緄 c 40, m緄 疬㧟 l頽h 鸢ng v鄋g b� sung" )
			return
		else --给玩家Mi陁 Nh鉵 Th誧h
			if LuaFnGetMaterialBagSpace(sceneId, selfId) < 20  then --没有空格
				x002087_MsgBox( sceneId, selfId, targetId, " B鋙 Th誧h 疬㧟 th叻ng g癿 20 lo読, kh鬾g gian tay n鋓 c黙 c醕 h� kh鬾g 瘘, d鱪 d﹑ xong, h銀 t緄 t靘 ta" )
				return
			else 		
				--给玩家20c醝Mi陁 Nh鉵 Th誧h
				x002087_GiveStone( sceneId, selfId, targetId, 0)
				x002087_MsgBox( sceneId, selfId, targetId, "20 vi阯 B鋙 Th誧h, s呔ng ch遖" )
				SetMissionFlag( sceneId, selfId, x002087_g_StoneId, 1 )
				return
			end
		end
	elseif arg == 6 then--玩家要H� Nh鉵 Th誧h
		--判断喧ng否已经拿过H� Nh鉵 Th誧h
		if GetLevel( sceneId, selfId ) < 40 then --小于40c
			x002087_MsgBox( sceneId, selfId, targetId, " Ch� sau khi 鹫t t緄 c 40, m緄 疬㧟 l頽h 鸢ng v鄋g b� sung" )
			return
		else --给玩糾祎 ⒀凼�
			if LuaFnGetMaterialBagSpace(sceneId, selfId) < 20  then --没有空格
				x002087_MsgBox( sceneId, selfId, targetId, " B鋙 Th誧h 疬㧟 th叻ng g癿 20 lo読, kh鬾g gian tay n鋓 c黙 c醕 h� kh鬾g 瘘, d鱪 d﹑ xong, h銀 t緄 t靘 ta" )
				return
			else
				--给玩家20c醝H� Nh鉵 Th誧h
				x002087_GiveStone( sceneId, selfId, targetId, 1)
				x002087_MsgBox( sceneId, selfId, targetId, "20 vi阯 B鋙 Th誧h, s呔ng ch遖" )
				SetMissionFlag( sceneId, selfId, x002087_g_StoneId, 1 )
				return
			end
		end		
		return
	end		
end		
		
		
--**********************************
--对话窗口信息提示
--**********************************
function x002087_MsgBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--给装备
--**********************************
--function x002087_GiveEquip( sceneId, selfId,menpai )
function x002087_GiveEquip( sceneId, selfId, targetId, menpai )

	--取 餴琺装备信息
	local mp =  x002087_GetEquipInfo( menpai )
	if mp ~= nil then
		for i=2,12 do
			BeginAddItem(sceneId)
				AddItem( sceneId,mp[i],1)	
			local ret = EndAddItem(sceneId,selfId)
			if ret > 0 then
				AddItemListToHuman(sceneId,selfId)
				--Msg2Player(sceneId, selfId,"#YHo鄋 t nhi甿 v�: 第m祎 把武器",MSG2PLAYER_PARA )
			end
		end
	end
end

--**********************************
--给宝石,0 Mi陁 Nh鉵 Th誧h,1 H� Nh鉵 Th誧h
--**********************************
--function x002087_GiveStone( sceneId, selfId,kind )
function x002087_GiveStone( sceneId, selfId, targetId, kind )
	--给Mi陁 Nh鉵 Th誧h
	if kind == 0 then
		for i=1,20 do
			BeginAddItem(sceneId)
				AddItem( sceneId,50101001,1)	
			local ret = EndAddItem(sceneId,selfId)
			if ret > 0 then
				AddItemListToHuman(sceneId,selfId)
			end
		end
	end
	--给H� Nh鉵 Th誧h
	if kind == 1 then
		for i=1,20 do
			BeginAddItem(sceneId)
				AddItem( sceneId,50101002,1)	
			local ret = EndAddItem(sceneId,selfId)
			if ret > 0 then
				AddItemListToHuman(sceneId,selfId)
			end
		end
	end
end

--**********************************
--取� gi鈟裘排勺氨感畔�
--**********************************
function x002087_GetEquipInfo( mpID )
	local mp
	local i = 0
	for i, mp in x002087_g_equipInfo do
		if mp[1] == mpID then
			return mp
		end
	end
	return nil
end
