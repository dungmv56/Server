--随身元宝 NPC
--注意本脚本含有随身元宝相关功能,请m祎 定参照现有to� 鸬 例子进行修改.

x181003_g_scriptId 	= 181003
x181003_g_buyrate 	= 0.5

x181003_g_shoptableindex=120
x181003_g_zengdianshop=121

x181003_g_goodact		= 1		--元宝商店
x181003_g_buyact	 	= 2		--秏祎 辉�
x181003_g_ticketact = 3		--秏祎 辉ζ�
x181003_g_zdianact	= 4		--赠 餴琺商店
x181003_g_gotodali	= 5		--Tr� v獿誧 D呓ng

x181003_g_normalzdianshop	= 6		--普通增 餴琺商店
x181003_g_lv1zdianshop	= 7			--m祎 c材料
x181003_g_lv2zdianshop	= 8			--二c材料
x181003_g_lv3zdianshop	= 9			--三c材料
x181003_g_lv4zdianshop	= 10		--四c材料
x181003_g_lv5zdianshop	= 11		--五c材料
x181003_g_lv6zdianshop	= 12		--六c材料
x181003_g_lv7zdianshop	= 13		--七c材料
x181003_g_lv8zdianshop	= 14		--八c材料
x181003_g_lv9zdianshop	= 15		--九c材料
x181003_g_lv10zdianshop	= 16		--十c材料
x181003_g_newprize	= 17		--查看中奖
x181003_g_YuanBaoIntro	= 18	--元宝介绍

x181003_g_leave			= 20	--离开
x181003_g_return		= 21	--Tr� v�(主菜单)
x181003_g_return1		= 22	--Tr� v�(元宝商店)
x181003_g_DZYBact		= 23	--打造图元宝商店

--元宝商店	-modify by xindefeng
x181003_g_YBShop		=
{
	--索引(顺序递增 1-N),name = 商店名称,id = 商店ID,key = GetNumText(顺序递增 101-N)
	[1]	= { name = "Nhi畉 m読 th呓ng nh鈔", id = 151, key = 101 },
	[2]	= { name = "Ti甿 Tr鈔 th� Phi Phi", id = 152, key = 102 },
	[3]	= { name = "M� Lan th秈 trang 餴猰", id = 120, key = 103 },
	[4]	= { name = "L遳 D呓ng hoa ph醥 餴猰", id = 132, key = 104 },
	[5]	= { name = "Xu鈔 Th鄋h b醕h hoa cung", id = 133, key = 105 },
	[6]	= { name = "Thi阯 cung ng� m� gi醡", id = 134, key = 106 },
	[7]	= { name = "Bi琻 Th呔c linh d唼c 餴猰", id = 136, key = 107 },
	[8]	= { name = "朽o b鋙 k� v 餴猰", id = 137, key = 108 },
	[9]= { name = "Thi阯 D呓ng ph醫 ngh� qu醤", id = 145, key = 109 },
	[10]	= { name = "Phi陁 phi陁 tr鈔 th� qu醤", id = 135, key = 110 },
	[11]	= { name = "Tam Thanh Th Ph� Qu醤", id = 144, key = 111 },
	[12]	= { name = "Ho鄋 Th� Th鼀 C醕", id = 146, key = 112 },
	[13]	= { name = "Ph騨g B鋙 th誧h T� Ch鈛", id = 150, key = 114 },
}

--元宝珍兽店--add by xindefeng
x181003_g_YBPetShops =
{
	[1]	= { name = "Phi phi tr鈔 th� qu醤", id = 152, key = 112 },
	[2]	= { name = "Phi陁 phi陁 tr鈔 th� qu醤", id = 135, key = 113 }
}

--元宝形象店--add by xindefeng
x181003_g_YBXingXiangShops =
{
	[1]	= { name = "M� Lan th秈 trang 餴猰", id = 120, key = 114 },
	[2] = { name = "Nh� � bi猲 th鈔 trai", id = 181, key = 115 },
	[3] = { name = "Thi阯 d呓ng ph醫 ngh� qu醤", id = 145, key = 116 },
	[4] = { name = "Lan v� m� dung ph叨ng", id = 182, key = 117 }	--add by zchw
}

--元宝宝石店--add by xindefeng
x181003_g_YBBaoshiShops =
{
	[1]	= { name = "Ph騨g b鋙 th誧h T� Ch鈛", id = 150, key = 119 },
	[2]	= { name = "Ph騨g b鋙 th誧h L誧 D呓ng", id = 178, key = 120 },
	[3]	= { name = "#gff00f0Ti甿 b鋙 th誧h tinh hoa", id = 198, key = 132 }   -- added by houzhifang in 20081107 tt:40793; 120--131被用过了
}

--打造图商店
x181003_g_DZYBShop	=
{
	--索引(顺序递增 1-N),name = 商店名称,id = 商店ID,key = GetNumText(顺序递增 201-N)
	[1]	= { name = "姓i 餫o, Tr叨ng th呓ng 痄 t誳 鸢", id = 156, key = 201 },
	[2]	= { name = "薪n 餺鋘, Song 餺鋘 痄 t誳 鸢", id = 157, key = 202 },
	[3]	= { name = "Phi猲, Ho鄋 痄 t誳 鸢", id = 158, key = 203 },
	[4]	= { name = "M鉶, Y ph鴆 痄 t誳 鸢", id = 159, key = 204 },
	[5]	= { name = "H� th�, H鄆 痄 t誳 鸢", id = 160, key = 205 },
	[6]	= { name = "H� uy琻, H� ki阯 痄 t誳 鸢", id = 161, key = 206 },
	[7]	= { name = "Y陁 疳i 痄 t誳 鸢", id = 162, key = 207 },
	[8]= { name = "H課g li阯 痄 t誳 鸢", id = 163, key = 208 },
	[9]	= { name = "Gi緄 ch� 痄 t誳 鸢", id = 164, key = 209 },
	[10]	= { name = "H� ph� 痄 t誳 鸢", id = 165, key = 210 },
}

--浏阳花炮店
x181003_g_YBHuaPaoShops =
{
	[1]	= { name = "H鯽 th� ng鈔 hoa", id = 190, key = 300 },
	[2]	= { name = "Ti猼 nh h� kh醤h", id = 191, key = 301 },
	[3]	= { name = "Xu鈔 Th鄋h b醕h hoa", id = 192, key = 302 },
}

--桃堡奇物店
x181003_g_YBQiWuShops =
{
	[1]	= { name = "Linh lung th誧h 馥u k�", id = 193, key = 303 },
	[2]	= { name = "D� th� gia c鬾g ph叨ng", id = 194, key = 304 },
	[3]	= { name = "Nam b k� ho�", id = 195, key = 305 },
	[4]	= { name = "Ti甿 b鋙 th誧h", id = 137, key = 306 },
}

--热卖商店
x181003_g_YBReMaiShops =
{
	[1]	= { name = "Ra m v ph m緄", id = 188, key = 307 },
	[2] = { name = "Nhi畉 m読 th呓ng ph", id = 189, key = 309 },
}

--**********************************
--事件交互入口
--**********************************
function x181003_OnDefaultEvent( sceneId, selfId, targetId )
	if targetId == -1 then
		x181003_OnEventRequest( sceneId, selfId, targetId, nil )
	else
		BeginEvent( sceneId )
--			local strText = "    C� ti玭 c� th� sai khi猲 疬㧟 c� Qu�, tuy tr阯 giang h� ch� tr鱪g v� l馽, nh遪g c� kim nguy阯 b鋙 r癷 c� th� khi猲 nh鎛g vi甤 tr呔c 疴y v痭 kh� l鄊 tr� n阯 d� d鄋g h絥, c醕 h� mu痭 l鄊 g�?"
--			AddText( sceneId, strText )
--			AddNumText( sceneId, x181003_g_scriptId, "Ta mu痭 mua th呓ng ph", 2, x181003_g_goodact)
--			if targetId >= 0 then
--				AddNumText( sceneId, x181003_g_scriptId, "Ta mu痭 鸨i kim nguy阯 b鋙", 2, x181003_g_buyact)
--				if IsShutout( sceneId, selfId, ONOFF_T_YBCASH ) == 0 then
--					AddNumText( sceneId, x181003_g_scriptId, "Ta mu痭 鸨i phi猽 kim nguy阯 b鋙", 2, x181003_g_ticketact)
--				end
--			else
--				targetId = -1	--为了能正常弹出选项
--			end
			for i = 1, getn( x181003_g_YBShop ) do
				AddNumText( sceneId, x181003_g_scriptId, x181003_g_YBShop[i].name, 7, x181003_g_YBShop[i].key )
			end
			AddNumText(sceneId,x181003_g_scriptId, "Chuy阯 b醤 痄 t誳 鸢", 7, x181003_g_DZYBact)
			AddNumText( sceneId, x181003_g_scriptId, "Gi緄 thi畊 th呓ng ti甿 Nguy阯 b鋙 v� 衖琺 tg", 11, x181003_g_YuanBaoIntro)
			if targetId < 0 then
				targetId = -1
			end
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
end

--**********************************
--事件列表选中m祎 项
--**********************************
function x181003_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == x181003_g_buyact then
		--先询问自己to� 鸬 剩余 餴琺数
		CallScriptFunction( PRIZE_SCRIPT_ID, "AskPoint", sceneId, selfId )
		
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
			UICommand_AddInt( sceneId, x181003_g_buyrate*1000)
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 2001 )
	elseif GetNumText() == x181003_g_newprize then
		CallScriptFunction( PRIZE_SCRIPT_ID, "AskPrize", sceneId, selfId)
	elseif GetNumText() == x181003_g_return then
		local nID = targetId;
		if nID < 0 then nID = -2 end -- -2喧ng菜单,-1喧ng响应
		x181003_OnDefaultEvent( sceneId, selfId, nID )
	elseif GetNumText() == x181003_g_goodact or GetNumText() == x181003_g_return1 then
--		BeginEvent( sceneId )
--			for i = 1, getn( x181003_g_YBShop ) do
--				AddNumText( sceneId, x181003_g_scriptId, x181003_g_YBShop[i].name, 7, x181003_g_YBShop[i].key )
--			end
--			AddNumText(sceneId,x181003_g_scriptId, "打造图专卖", 7, x181003_g_DZYBact)
--			AddNumText( sceneId, x181003_g_scriptId, "Tr� v蟤祎 页", -1, x181003_g_return)
--		EndEvent( sceneId )
--		DispatchEventList( sceneId, selfId, targetId )
		local nID = targetId;
		if nID < 0 then nID = -2 end -- -2喧ng菜单,-1喧ng响应
		x181003_OnDefaultEvent( sceneId, selfId, nID )
	elseif GetNumText() == x181003_g_DZYBact then
		BeginEvent( sceneId )
			local strText = "  Ch鱪 痄 t誳 鸢 th呓ng 餴猰"
			AddText( sceneId, strText )
			
			for i = 1, getn( x181003_g_DZYBShop ) do
				AddNumText( sceneId, x181003_g_scriptId, x181003_g_DZYBShop[i].name, 7, x181003_g_DZYBShop[i].key )
			end
			AddNumText( sceneId, x181003_g_scriptId, "Tr� v� trang tr呔c", -1, x181003_g_return1)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == x181003_g_zdianact then
		BeginEvent( sceneId )
			strText = "  Xin c錸 c� v鄌 nhu c l馻 ch鱪 kh醕 nhau c黙 th呓ng ti甿 餴琺 tg"
			AddText( sceneId, strText )
			AddNumText( sceneId, x181003_g_scriptId, "Th呓ng ph ph� th鬾g tg 餴琺", 7, x181003_g_normalzdianshop)
			AddNumText( sceneId, x181003_g_scriptId, "Nguy阯 li畊 c 1 ", 7, x181003_g_lv1zdianshop)
			AddNumText( sceneId, x181003_g_scriptId, "Nguy阯 li畊 c 2 ", 7, x181003_g_lv2zdianshop)
			AddNumText( sceneId, x181003_g_scriptId, "Nguy阯 li畊 c 3 ", 7, x181003_g_lv3zdianshop)
			AddNumText( sceneId, x181003_g_scriptId, "Nguy阯 li畊 c 4 ", 7, x181003_g_lv4zdianshop)
			AddNumText( sceneId, x181003_g_scriptId, "Nguy阯 li畊 c 5 ", 7, x181003_g_lv5zdianshop)
			AddNumText( sceneId, x181003_g_scriptId, "Nguy阯 li畊 c 6 ", 7, x181003_g_lv6zdianshop)
			AddNumText( sceneId, x181003_g_scriptId, "Nguy阯 li畊 c 7 ", 7, x181003_g_lv7zdianshop)
			AddNumText( sceneId, x181003_g_scriptId, "Nguy阯 li畊 c 8 ", 7, x181003_g_lv8zdianshop)
			AddNumText( sceneId, x181003_g_scriptId, "Nguy阯 li畊 c 9 ", 7, x181003_g_lv9zdianshop)
			AddNumText( sceneId, x181003_g_scriptId, "Nguy阯 li畊 c 10 ", 7, x181003_g_lv10zdianshop)
			AddNumText( sceneId, x181003_g_scriptId, "Tr� v� trang tr呔c", -1, x181003_g_return)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == x181003_g_gotodali then
		NewWorld(sceneId,selfId,0,200,177)
	elseif GetNumText() == x181003_g_ticketact then
		local nYuanBao = YuanBao(sceneId,selfId,targetId,3,0)
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 2002 )
	elseif GetNumText() == x181003_g_leave then
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
	elseif GetNumText() == x181003_g_normalzdianshop then
		x181003_NewDispatchShopItem( sceneId, selfId,targetId, 121 )
	elseif GetNumText() == x181003_g_lv1zdianshop then
		x181003_NewDispatchShopItem( sceneId, selfId,targetId, 122 )
	elseif GetNumText() == x181003_g_lv2zdianshop then
		x181003_NewDispatchShopItem( sceneId, selfId,targetId, 123 )
	elseif GetNumText() == x181003_g_lv3zdianshop then
		x181003_NewDispatchShopItem( sceneId, selfId,targetId, 124 )
	elseif GetNumText() == x181003_g_lv4zdianshop then
		x181003_NewDispatchShopItem( sceneId, selfId,targetId, 125 )
	elseif GetNumText() == x181003_g_lv5zdianshop then
		x181003_NewDispatchShopItem( sceneId, selfId,targetId, 126 )
	elseif GetNumText() == x181003_g_lv6zdianshop then
		x181003_NewDispatchShopItem( sceneId, selfId,targetId, 127 )
	elseif GetNumText() == x181003_g_lv7zdianshop then
		x181003_NewDispatchShopItem( sceneId, selfId,targetId, 128 )
	elseif GetNumText() == x181003_g_lv8zdianshop then
		x181003_NewDispatchShopItem( sceneId, selfId,targetId, 129 )
	elseif GetNumText() == x181003_g_lv9zdianshop then
		x181003_NewDispatchShopItem( sceneId, selfId,targetId, 130 )
	elseif GetNumText() == x181003_g_lv10zdianshop then
		x181003_NewDispatchShopItem( sceneId, selfId,targetId, 131 )
	elseif GetNumText() == x181003_g_YuanBaoIntro	then
		BeginEvent( sceneId )
			AddText( sceneId, "#{INTRO_YUANBAO}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 102 then	--Thi阯 Long珍兽店	--add by xindefeng
		BeginEvent( sceneId )
		for i = 1, getn( x181003_g_YBPetShops ) do
			AddNumText( sceneId, x181003_g_scriptId, x181003_g_YBPetShops[i].name, 7, x181003_g_YBPetShops[i].key )
		end
		AddNumText( sceneId, x181003_g_scriptId, "Tr� v� trang tr呔c", -1, x181003_g_return1)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 104 then	--Thi阯 Long形象馆	--add by xindefeng
		BeginEvent( sceneId )
		for i = 1, getn( x181003_g_YBXingXiangShops ) do
			AddNumText( sceneId, x181003_g_scriptId, x181003_g_YBXingXiangShops[i].name, 7, x181003_g_YBXingXiangShops[i].key )
		end
		AddNumText( sceneId, x181003_g_scriptId, "Tr� v� trang tr呔c", -1, x181003_g_return1)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 109 then	--Thi阯 Long宝石店--add by xindefeng
		BeginEvent( sceneId )
		for i = 1, getn( x181003_g_YBBaoshiShops ) do
			AddNumText( sceneId, x181003_g_scriptId, x181003_g_YBBaoshiShops[i].name, 7, x181003_g_YBBaoshiShops[i].key )
		end
		AddNumText( sceneId, x181003_g_scriptId, "Tr� v� trang tr呔c", -1, x181003_g_return1)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )		
	elseif GetNumText() == 105 then	--浏阳花炮店
		BeginEvent( sceneId )
		for i = 1, getn( x181003_g_YBHuaPaoShops ) do
			AddNumText( sceneId, x181003_g_scriptId, x181003_g_YBHuaPaoShops[i].name, 7, x181003_g_YBHuaPaoShops[i].key )
		end
		AddNumText( sceneId, x181003_g_scriptId, "Tr� v� trang tr呔c", -1, x181003_g_return1)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 108 then	--桃堡奇物店
		BeginEvent( sceneId )
		for i = 1, getn( x181003_g_YBQiWuShops ) do
			AddNumText( sceneId, x181003_g_scriptId, x181003_g_YBQiWuShops[i].name, 7, x181003_g_YBQiWuShops[i].key )
		end
		AddNumText( sceneId, x181003_g_scriptId, "Tr� v� trang tr呔c", -1, x181003_g_return1)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 101 then	--热卖商店
		BeginEvent( sceneId )
		for i = 1, getn( x181003_g_YBReMaiShops ) do
			AddNumText( sceneId, x181003_g_scriptId, x181003_g_YBReMaiShops[i].name, 7, x181003_g_YBReMaiShops[i].key )
		end
		AddNumText( sceneId, x181003_g_scriptId, "Tr� v� trang tr呔c", -1, x181003_g_return1)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	else
		--元宝商店
		for i = 1, getn( x181003_g_YBShop ) do
			if (GetNumText() == 102 or GetNumText() == 104 or GetNumText() == 109 or GetNumText() == 105 or GetNumText() == 108 or GetNumText() == 101) then	--商店类型选项--add by xindefeng
				break
			end
			if GetNumText() == x181003_g_YBShop[i].key then
				x181003_NewDispatchShopItem( sceneId, selfId, targetId, x181003_g_YBShop[i].id )
				break
			end
		end
		--Thi阯 Long珍兽店--add by xindefeng
		for i = 1, getn( x181003_g_YBPetShops ) do
			if GetNumText() == x181003_g_YBPetShops[i].key then
				x181003_NewDispatchShopItem( sceneId, selfId, targetId, x181003_g_YBPetShops[i].id )
				break
			end
		end
		--Thi阯 Long形象馆--add by xindefeng
		for i = 1, getn( x181003_g_YBXingXiangShops ) do
			if GetNumText() == x181003_g_YBXingXiangShops[i].key then
				x181003_NewDispatchShopItem( sceneId, selfId, targetId, x181003_g_YBXingXiangShops[i].id )
				break
			end
		end
		--宝石商店--add by xindefeng
		for i = 1, getn( x181003_g_YBBaoshiShops ) do
			if GetNumText() == x181003_g_YBBaoshiShops[i].key then
				x181003_NewDispatchShopItem( sceneId, selfId, targetId, x181003_g_YBBaoshiShops[i].id )
				break
			end
		end
		--打造图专卖
		for i = 1, getn( x181003_g_DZYBShop ) do
			if GetNumText() == x181003_g_DZYBShop[i].key then
				x181003_NewDispatchShopItem( sceneId, selfId, targetId, x181003_g_DZYBShop[i].id )
				break
			end
		end
		--浏阳花炮店
		for i = 1, getn( x181003_g_YBHuaPaoShops ) do
			if GetNumText() == x181003_g_YBHuaPaoShops[i].key then
				x181003_NewDispatchShopItem( sceneId, selfId, targetId, x181003_g_YBHuaPaoShops[i].id )
				break
			end
		end
		--桃堡奇物店
		for i = 1, getn( x181003_g_YBQiWuShops ) do
			if GetNumText() == x181003_g_YBQiWuShops[i].key then
				x181003_NewDispatchShopItem( sceneId, selfId, targetId, x181003_g_YBQiWuShops[i].id )
				break
			end
		end
		--热卖商店
		for i = 1, getn( x181003_g_YBReMaiShops ) do
			if GetNumText() == x181003_g_YBReMaiShops[i].key then
				x181003_NewDispatchShopItem( sceneId, selfId, targetId, x181003_g_YBReMaiShops[i].id )
				break
			end
		end
	end
end

--**********************************
--客户端购买元宝接口
--**********************************
function x181003_BuyYuanbao( sceneId, selfId, nYuanBao )
	--购买元宝
	if nYuanBao then
		if nYuanBao > 0 and nYuanBao <= 10000 then
			CallScriptFunction( PRIZE_SCRIPT_ID, "AskYuanBao", sceneId, selfId, nYuanBao, nYuanBao*x181003_g_buyrate*1000)
		end
	end
end

--**********************************
--按需来弹出商店,分为随身商店和NPC商店
--**********************************
function x181003_NewDispatchShopItem(sceneId,selfId,targetId,shopId)
	if targetId >= 0 then	
		DispatchShopItem( sceneId, selfId,targetId, shopId )
	else
		DispatchNoNpcShopItem( sceneId, selfId, shopId )
	end
end
