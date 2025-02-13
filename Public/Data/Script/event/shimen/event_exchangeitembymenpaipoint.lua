--任务链

--MisDescBegin
--脚本号
x229009_g_scriptId = 229009

--任务文本描述
x229009_g_ExchangeItem ="斜i v ph"
x229009_g_ExchangeTitle ="斜i danh hi畊"
x229009_g_MissionInfo ="鞋 c� v� c醕 甬 t� m鬾 ph醝 ph醫 huy r課g r� cho m鬾 ph醝 m靚h, s� ph� 疸 chu b� m祎 s� ph th叻ng, d鵱g #R400 #W餴琺 c痭g hi猲 m鬾 ph醝 l� c� th� 鸨i"  --任务描述
x229009_g_MissionTarget =""
x229009_g_ContinueInfo =""			--未Ho鄋 t nhi甿 v鴗o� 鸬 npc对话
x229009_g_MissionComplete =""	--Ho鄋 t nhi甿 v鴑pc说话to� 鸬 话

--MisDescEnd

x229009_g_exchangeitembymenpaipoint_Index = 23

x229009_g_menpainpc_table =  {
	{menpaiid=MP_SHAOLIN,  menpainame="Thi猽 L鈓", name="Huy玭 T�",	 title="Ph呓ng tr唼ng Thi猽 L鈓",	x=38, z=98},
	{menpaiid=MP_MINGJIAO, menpainame="Minh Gi醥", name="L鈓 Th� Tr叨ng", title="Minh Gi醥 gi醥 ch�", 	x=98, z=52},
	{menpaiid=MP_GAIBANG,  menpainame="C醝 Bang", name="T痭g T�",	 title="Tr叻ng l鉶 C醝 Bang", 	x=91, z=63},
	{menpaiid=MP_WUDANG, 	 menpainame="V� 衋ng", name="Tr呓ng Huy玭 T�", title="Ch叻ng m鬾 ph醝 V� 衋ng",	x=73, z=82},
	{menpaiid=MP_EMEI, 		 menpainame="Nga My", name="M課h Thanh Thanh", title="Ch叻ng m鬾 ph醝 Nga My",	x=96, z=73},
	{menpaiid=MP_DALI, 	   menpainame="Thi阯 Long", name="B鋘 Nh鈔",	 title="Ph呓ng tr唼ng Thi阯 Long T�",	x=96, z=66},
	{menpaiid=MP_XINGSU, 	 menpainame="Tinh T鷆", name="衖nh Xu鈔 Thu", title="Ch叻ng m鬾 c黙 ph醝 Tinh T鷆",	x=142, z=55},
	{menpaiid=MP_TIANSHAN, menpainame="Thi阯 S絥", name="Mai Ki猰",	 title="姓i s� mu礽 ph醝 Thi阯 S絥",	x=91, z=44},
	{menpaiid=MP_XIAOYAO,  menpainame="Ti陁 Dao", name="T� Tinh H�", title="T誱 Quy玭 Ch叻ng M鬾 Ti陁 Dao",	x=125, z=144},
}           

--男
x229009_g_MaleTitleInfo = {
	{tlvl=1, mpp=0,    slt="Thi猽 L鈓 Hi畃 S�", mjt="Minh Gi醥 Hi畃 S�", gbt="C醝 Bang Hi畃 S�", wdt="V� 衋ng Hi畃 S�", emt="Nga My Hi畃 S�", xxt="Tinh T鷆 Hi畃 S�", tlt="Thi阯 Long Hi畃 S�", tst="Thi阯 S絥 Hi畃 S�", xyt="Ti陁 Dao Hi畃 S�"},
	{tlvl=2, mpp=1000, slt="Kh鬷 Y H� Ph醦", mjt="Th� Ho� Hi畃 S�", gbt="Thanh Li阯 挟 T�", wdt="Thanh Minh C� S�", emt="Thanh Phong C� S�", xxt="H鄋h 詎 Lang Qu鈔", tlt="T鄋g Kinh Hi畃 S�", tst="D呓ng Thi阯 B� Ch鷑g", xyt="Ph� C C� S�"},
	{tlvl=3, mpp=2500, slt="Kim Th鈔 La H醤", mjt="H� Gi醥 Ph醦 V呓ng", gbt="Huy玭 V� Tr叻ng L鉶", wdt="V� Vi Ch鈔 Nh鈔", emt="Ng鱟 Long Hi畃 S�", xxt="Th鷆 M畁h Ph醤 Quan", tlt="S鵱g Th醤h Thi阯 S�", tst="Thi阯 S絥 Th呓ng 縩g", xyt="L誧 Th Hi畃 S�"},
	{tlvl=4, mpp=5000, slt="懈a T課g B� T醫", mjt="Minh Gi醥 Th S�", gbt="Ch叻ng Bang Long 啸u", wdt="V� 衋ng Thi阯 T鬾", emt="Nga My Ti阯 Nh鈔", xxt="械c Th� Y Ti阯", tlt="Thi阯 Nam Long V呓ng", tst="H瞡 Nguy阯 S絥 Th", xyt="Ti陁 Dao Long Th"},
}
--女	
x229009_g_femaleTitleInfo = {	
	{tlvl=1, mpp=0,	   slt="Thi猽 L鈓 Hi畃 N�", mjt="Minh Gi醥 Hi畃 N�", gbt="C醝 Bang Hi畃 N�", wdt="V� 衋ng Hi畃 N�", emt="Nga My Hi畃 N�", xxt="Tinh T鷆 Hi畃 N�", tlt="Thi阯 Long Hi畃 N�", tst="Thi阯 S絥 Hi畃 N�", xyt="Ti陁 Dao Hi畃 N�"},
	{tlvl=2, mpp=1000, slt="B誧h Y Th� Gi�", mjt="Th� Ho� Hi畃 N�", gbt="B誧h Li阯 挟 T�", wdt="B誧h V鈔 C� S�", emt="Minh Nguy畉 C� S�", xxt="H鄋h 憂 N呓ng T�", tlt="T鄋g Kinh Hi畃 N�", tst="H誳 Thi阯 B� Ch鷑g", xyt="Th� Hoa C� S�"},
	{tlvl=3, mpp=2500, slt="械 Th� Quan 耺", mjt="H� Gi醥 T醤 Nh鈔", gbt="Chu T呔c Tr叻ng L鉶", wdt="Thanh T竛h T醤 Nh鈔", emt="Kim Ph唼ng Hi畃 N�", xxt="衞誸 M畁h D� Xoa", tlt="S鵱g Th醤h Thi阯 N�", tst="Thi阯 S絥 Tuy猼 K�", xyt="L錸g Ba Hi畃 N�"},
	{tlvl=4, mpp=5000, slt="Gi� Lam B� T醫", mjt="Quang Minh Th醤h N�", gbt="Ch叻ng B醫 Long N�", wdt="V� 衋ng Ti阯 T�", emt="Nga My Ti阯 T�", xxt="械c Th� D唼c V呓ng", tlt="Thi阯 Nam Long N�", tst="H瞡 Nguy阯 Hoa Th", xyt="Ti陁 Dao Th醤h N�"},
}

x229009_g_shimentitle_bonusitem = {
	{menpaiid=MP_SHAOLIN,	bonusItem=10113004},
	{menpaiid=MP_MINGJIAO,	bonusItem=10113004},
	{menpaiid=MP_GAIBANG,	bonusItem=10113004},
	{menpaiid=MP_WUDANG,	bonusItem=10113004},
	{menpaiid=MP_EMEI, 		bonusItem=10113004},
	{menpaiid=MP_DALI, 		bonusItem=10113004},
	{menpaiid=MP_XINGSU,	bonusItem=10113004},
	{menpaiid=MP_TIANSHAN,	bonusItem=10113004},
	{menpaiid=MP_XIAOYAO,	bonusItem=10113004},
}

--**********************************
--事件交互入口
--**********************************
function x229009_OnDefaultEvent( sceneId, selfId,targetId )
	--PrintStr("OnDefaultEvent...")
	for i, v in x229009_g_menpainpc_table do
		if v.name == GetName(sceneId, targetId) then
			if v.menpaiid == GetMenPai(sceneId, selfId) then
				--PrintNum(GetNumText())
				if 10 <= GetNumText() and GetNumText() <= 14 then
					--秏祎 怀坪�
					x229009_ExchangeTitleBymenpaipoint( sceneId, selfId,targetId, GetNumText()-10 )
				elseif 7 == GetNumText() then
				x229009_ExchangeItemBymenpaipoint( sceneId, selfId,targetId )
				break
				elseif 8 == GetNumText() then
					--添加称号
					x229009_AddExchangeTitleList( sceneId, selfId,targetId )
					break
				end	
			else
				local str ="Ng呓i kh鬾g ph鋓 l� 甬 t� c黙 m鬾 ph醝 n鄖, ta ch� ph鴆 v� cho 甬 t� m鬾 ph醝"
				BeginEvent(sceneId)
					AddText(sceneId, str)
				EndEvent()
				DispatchMissionTips(sceneId, selfId)
				Msg2Player(  sceneId, selfId, str, MSG2PLAYER_PARA )		
			end	
		end
	end
end

--**********************************
--列举事件
--**********************************
function x229009_OnEnumerate( sceneId, selfId, targetId )
	--PrintStr("OnEnumerate...")
	AddNumText(sceneId,x229009_g_scriptId, x229009_g_ExchangeItem, 3, 7);
	AddNumText(sceneId,x229009_g_scriptId, x229009_g_ExchangeTitle, 3, 8);

end

function x229009_ExchangeItemBymenpaipointFn( sceneId, selfId,targetId, needPoint )
	
	if (needPoint < 0 ) then
		return
	end
	
	local menpaipoint = GetHumanMenpaiPoint(sceneId, selfId)
	if menpaipoint < 400 then
		local str ="衖琺 c痭g hi猲 hi畁 t読 c黙 ng呓i l�" .. tostring(menpaipoint) .."v鏽 kh鬾g 瘘 400 h銀 c� l阯"
		BeginEvent(sceneId)
			AddText(sceneId, str)
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		Msg2Player(  sceneId, selfId, str, MSG2PLAYER_PARA )		
	else
		local nItemId, strItemName, strItemDesc = GetOneMissionItem(x229009_g_exchangeitembymenpaipoint_Index)
		BeginAddItem(sceneId)
			AddItem(sceneId,nItemId, 1)
		local ret = EndAddItem(sceneId,selfId)
		if ret <= 0 then
			BeginEvent(sceneId)
				AddText(sceneId,"Tay n鋓 c黙 ng呓i 疸 馥y, kh鬾g th� 鸨i 疬㧟")
			EndEvent()
			DispatchMissionTips(sceneId, selfId)
		else
			AddItemListToHuman(sceneId, selfId)
			SetHumanMenpaiPoint(sceneId, selfId, menpaipoint-400)
			local str = format("Tr� 400 餴琺 鸬 c痭g hi猲 m鬾 ph醝, ng呓i 疸 鹫t 疬㧟 %s", strItemName)
			Msg2Player(  sceneId, selfId, str, MSG2PLAYER_PARA )	
			
			str = format("C醕 h� 鹫t 疬㧟 %s.", strItemName)
			BeginEvent(sceneId)
				AddText(sceneId, str)
			EndEvent()
			DispatchMissionTips(sceneId, selfId)
				
		end
	end	
	
end

function x229009_ExchangeItemBymenpaipoint( sceneId, selfId,targetId )
	BeginUICommand(sceneId)
		UICommand_AddInt(sceneId,x229009_g_scriptId);
		UICommand_AddInt(sceneId,targetId);
		UICommand_AddString(sceneId,"ExchangeItemBymenpaipointFn");
		UICommand_AddString(sceneId,x229009_g_MissionInfo);
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 24)

end

--/////////////////////////////////////////////////////////////////////////////////

function x229009_GetCurShimenTitleLevel(menpai, title )  --, titleinfo)
	local titlelevel = 0
	if menpai == MP_SHAOLIN then
		for i=1, 4 do
			if title == x229009_g_MaleTitleInfo[i].slt then
				titlelevel = x229009_g_MaleTitleInfo[i].tlvl
				return titlelevel
			end
			if title == x229009_g_femaleTitleInfo[i].slt then
				titlelevel = x229009_g_femaleTitleInfo[i].tlvl
				return titlelevel
			end
		end	
	elseif menpai == MP_MINGJIAO then
		for i=1, 4 do
			if title == x229009_g_MaleTitleInfo[i].mjt then
				titlelevel = x229009_g_MaleTitleInfo[i].tlvl
				return titlelevel
			end
			if title == x229009_g_femaleTitleInfo[i].mjt then
				titlelevel = x229009_g_femaleTitleInfo[i].tlvl
				return titlelevel
			end
		end	
	elseif menpai == MP_GAIBANG then
		for i=1, 4 do
			if title == x229009_g_MaleTitleInfo[i].gbt then
				titlelevel = x229009_g_MaleTitleInfo[i].tlvl
				return titlelevel
			end
			if title == x229009_g_femaleTitleInfo[i].gbt then
				titlelevel = x229009_g_femaleTitleInfo[i].tlvl
				return titlelevel
			end
		end	
	elseif menpai == MP_WUDANG then
		for i=1, 4 do
			if title == x229009_g_MaleTitleInfo[i].wdt then
				titlelevel = x229009_g_MaleTitleInfo[i].tlvl
				return titlelevel
			end
			if title == x229009_g_femaleTitleInfo[i].wdt then
				titlelevel = x229009_g_femaleTitleInfo[i].tlvl
				return titlelevel
			end
		end	
	elseif menpai == MP_EMEI then
		for i=1, 4 do
			if title == x229009_g_MaleTitleInfo[i].emt then
				titlelevel = x229009_g_MaleTitleInfo[i].tlvl
				return titlelevel
			end
			if title == x229009_g_femaleTitleInfo[i].emt then
				titlelevel = x229009_g_femaleTitleInfo[i].tlvl
				return titlelevel
			end
		end	
	elseif menpai == MP_DALI then
		for i=1, 4 do
			if title == x229009_g_MaleTitleInfo[i].tlt then
				titlelevel = x229009_g_MaleTitleInfo[i].tlvl
				return titlelevel
			end
			if title == x229009_g_femaleTitleInfo[i].tlt then
				titlelevel = x229009_g_femaleTitleInfo[i].tlvl
				return titlelevel
			end
		end	
	elseif menpai == MP_XINGSU then
		for i=1, 4 do
			if title == x229009_g_MaleTitleInfo[i].xxt then
				titlelevel = x229009_g_MaleTitleInfo[i].tlvl
				return titlelevel
			end
			if title == x229009_g_femaleTitleInfo[i].xxt then
				titlelevel = x229009_g_femaleTitleInfo[i].tlvl
				return titlelevel
			end
		end	
	elseif menpai == MP_TIANSHAN then
		for i=1, 4 do
			if title == x229009_g_MaleTitleInfo[i].tst then
				titlelevel = x229009_g_MaleTitleInfo[i].tlvl
				return titlelevel
			end
			if title == x229009_g_femaleTitleInfo[i].tst then
				titlelevel = x229009_g_femaleTitleInfo[i].tlvl
				return titlelevel
			end
		end	
	elseif menpai == MP_XIAOYAO then
		for i=1, 4 do
			if title == x229009_g_MaleTitleInfo[i].xyt then
				titlelevel = x229009_g_MaleTitleInfo[i].tlvl
				return titlelevel
			end
			if title == x229009_g_femaleTitleInfo[i].xyt then
				titlelevel = x229009_g_femaleTitleInfo[i].tlvl
				return titlelevel
			end
		end	
	end
	
	return titlelevel
end

function x229009_GetSelectedTitle(menpai, titleinfo, level)
	if level < 1 or level > 4 then
		return 0, 0,""
	end
	
	local title =""
	if menpai == MP_SHAOLIN then
		title = titleinfo[level].slt
	elseif menpai == MP_MINGJIAO then
		title = titleinfo[level].mjt
	elseif menpai == MP_GAIBANG then
		title = titleinfo[level].gbt
	elseif menpai == MP_WUDANG then
		title = titleinfo[level].wdt
	elseif menpai == MP_EMEI then
		title = titleinfo[level].emt
	elseif menpai == MP_DALI then
		title = titleinfo[level].tlt
	elseif menpai == MP_XINGSU then
		title = titleinfo[level].xxt
	elseif menpai == MP_TIANSHAN then
		title = titleinfo[level].tst
	elseif menpai == MP_XIAOYAO then
		title = titleinfo[level].xyt
	end
	
	return titleinfo[level].tlvl, titleinfo[level].mpp, title
end

function x229009_AddExchangeTitleList(sceneId, selfId, targetId)
	--PrintStr("AddExchangeTitleList...")
	-- 餴琺到门派
	local level = GetLevel(sceneId, selfId)
	local menpai = GetMenPai(sceneId, selfId)
	--local shimentitle = GetShimenTitle(sceneId, selfId)
	--男女判断
	local titleinfo
	local sex = GetSex(sceneId, selfId)
	if 1 == sex then
		titleinfo = x229009_g_MaleTitleInfo
	elseif 0 == sex then
		titleinfo = x229009_g_femaleTitleInfo
	end

	local step = 10
	BeginEvent(sceneId)
	
	if menpai == MP_SHAOLIN then
		for i=1, 4 do
			local seltitlelvl, needpoint, seltitle = x229009_GetSelectedTitle(menpai, titleinfo, i)
			local str = seltitle .." c" .. needpoint .." 餴琺 c痭g hi猲 s� m鬾"
			AddNumText(sceneId,x229009_g_scriptId, str, 3, i+step)
		end
	elseif menpai == MP_MINGJIAO then
		for i=1, 4 do
			local seltitlelvl, needpoint, seltitle = x229009_GetSelectedTitle(menpai, titleinfo, i)
			local str = seltitle .." c" .. needpoint .." 餴琺 c痭g hi猲 s� m鬾"
			AddNumText(sceneId,x229009_g_scriptId, str, 3, i+step)
		end
	elseif menpai == MP_GAIBANG then
		for i=1, 4 do
			local seltitlelvl, needpoint, seltitle = x229009_GetSelectedTitle(menpai, titleinfo, i)
			local str = seltitle .." c" .. needpoint .." 餴琺 c痭g hi猲 s� m鬾"
			AddNumText(sceneId,x229009_g_scriptId, str, 3, i+step)
		end
	elseif menpai == MP_WUDANG then
		for i=1, 4 do
			local seltitlelvl, needpoint, seltitle = x229009_GetSelectedTitle(menpai, titleinfo, i)
			local str = seltitle .." c" .. needpoint .." 餴琺 c痭g hi猲 s� m鬾"
			AddNumText(sceneId,x229009_g_scriptId, str, 3, i+step)
		end
	elseif menpai == MP_EMEI then
		for i=1, 4 do
			local seltitlelvl, needpoint, seltitle = x229009_GetSelectedTitle(menpai, titleinfo, i)
			local str = seltitle .." c" .. needpoint .." 餴琺 c痭g hi猲 s� m鬾"
			AddNumText(sceneId,x229009_g_scriptId, str, 3, i+step)
		end
	elseif menpai == MP_DALI then
		for i=1, 4 do
			local seltitlelvl, needpoint, seltitle = x229009_GetSelectedTitle(menpai, titleinfo, i)
			local str = seltitle .." c" .. needpoint .." 餴琺 c痭g hi猲 s� m鬾"
			AddNumText(sceneId,x229009_g_scriptId, str, 3, i+step)
		end
	elseif menpai == MP_XINGSU then
		for i=1, 4 do
			local seltitlelvl, needpoint, seltitle = x229009_GetSelectedTitle(menpai, titleinfo, i)
			local str = seltitle .." c" .. needpoint .." 餴琺 c痭g hi猲 s� m鬾"
			AddNumText(sceneId,x229009_g_scriptId, str, 3, i+step)
		end
	elseif menpai == MP_TIANSHAN then
		for i=1, 4 do
			local seltitlelvl, needpoint, seltitle = x229009_GetSelectedTitle(menpai, titleinfo, i)
			local str = seltitle .." c" .. needpoint .." 餴琺 c痭g hi猲 s� m鬾"
			AddNumText(sceneId,x229009_g_scriptId, str, 3, i+step)
		end
	elseif menpai == MP_XIAOYAO then
		for i=1, 4 do
			local seltitlelvl, needpoint, seltitle = x229009_GetSelectedTitle(menpai, titleinfo, i)
			local str = seltitle .." c" .. needpoint .." 餴琺 c痭g hi猲 s� m鬾"
			AddNumText(sceneId,x229009_g_scriptId, str, 3, i+step)
		end
	end
	
	EndEvent()
	
	DispatchEventList(sceneId,selfId,targetId)
end

function x229009_GetShimenTitle_BonusItem(sceneId, selfId)
	local menpai = GetMenPai(sceneId, selfId)
	for i, v in x229009_g_shimentitle_bonusitem do
		if v.menpaiid == menpai then
			return v.bonusItem
		end
	end
	return 0
end

function x229009_ExchangeTitleBymenpaipoint( sceneId, selfId,targetId, level )
	--PrintStr("ExchangeTitleBymenpaipoint")
	--SetHumanMenpaiPoint(sceneId, selfId, 1000000)
	local titleinfo
	local menpai = GetMenPai(sceneId, selfId)
	local sex = GetSex(sceneId, selfId)
	if 1 == sex then
		titleinfo = x229009_g_MaleTitleInfo
	elseif 0 == sex then
		titleinfo = x229009_g_femaleTitleInfo
	end
	local title = GetShimenTitle(sceneId, selfId)
	--PrintStr("title=" .. title)
	local seltitlelvl, needpoint, seltitle = x229009_GetSelectedTitle(menpai, titleinfo, level)
	local curtitlelvl = x229009_GetCurShimenTitleLevel(menpai, title)
	
	--PrintStr("seltitlelvl=" .. seltitlelvl)
	--PrintStr("curtitlelvl=" .. curtitlelvl)
	
	local str
	if seltitlelvl < curtitlelvl then
		str ="Ng呓i 疸 c� danh x遪g m鬾 ph醝 c cao, kh鬾g c 鸨i n鎍"
	elseif seltitlelvl == curtitlelvl then
		str ="Ng呓i 疸 c� danh x遪g n鄖, kh鬾g c 鸨i n鎍"
	elseif seltitlelvl > curtitlelvl then
		local menpaipoint = GetHumanMenpaiPoint(sceneId, selfId)
		--PrintStr("menpaipoint=" .. menpaipoint)
		--PrintStr("needpoint=" .. needpoint)
		if needpoint <= menpaipoint then
			if seltitlelvl == 2 then
				BeginAddItem(sceneId)
					AddItem(sceneId, x229009_GetShimenTitle_BonusItem(sceneId, selfId), 1)
				local ret = EndAddItem(sceneId,selfId)
				if ret > 0 then
					AddItemListToHuman(sceneId, selfId)
					str ="Ch鷆 m譶g ng呓i 疸 鹫t 疬㧟 #Y" .. seltitle .."#W danh x遪g, hy v鱪g ti猵 t鴆 v� b眓 m鬾 n� l馽 ph醫 huy danh ti猲g. 锈y l� 1 b� y trang c黙 b眓 m鬾, coi nh� l� m祎 ph th叻ng c黙 s� ph� ban cho ng呓i cho nh鎛g v v� 疸 qua"
					SetShimenTitle(sceneId, selfId, seltitle)
					LuaFnDispatchAllTitle(sceneId, selfId)
					SetHumanMenpaiPoint(sceneId, selfId, menpaipoint-needpoint)
				else
					str ="Tay n鋓 c黙 ng呓i 疸 馥y, vi s� chu b� ch鷗 qu� cho ng呓i. S豠 so課 tay n鋓 xong, h銀 t緄 t靘 ta"
				end	
			else
				str ="Ch鷆 m譶g ng呓i 疸 鹫t 疬㧟 #Y" .. seltitle .."#W danh x遪g, hy v鱪g ti猵 t鴆 v� b眓 m鬾 n� l馽 ph醫 huy danh ti猲g"
				SetShimenTitle(sceneId, selfId, seltitle)
				LuaFnDispatchAllTitle(sceneId, selfId)
				SetHumanMenpaiPoint(sceneId, selfId, menpaipoint-needpoint)
			end
		else
			str ="械 c痭g hi猲 m鬾 ph醝 c黙 ng呓i hi畁 kh鬾g 瘘, kh鬾g th� 鸨i 疬㧟"			
		end
	end
	BeginEvent(sceneId)
		AddText(sceneId, str)
	EndEvent()
	DispatchEventList(sceneId,selfId,targetId)	
end

