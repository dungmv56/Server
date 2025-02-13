--情缘天龙

--脚本号
x990001_g_scriptId = 990001
x990001_g_x990001_g_szTamPhap = 0
szLuaFnGetXinFaLevel2 = 0
--所拥有的事件ID列表

--**********************************
--事件列表#G打孔前，必须保证身上有一个8级精铁或8级棉布或8级秘银。
--**********************************
function x990001_OnDefaultEvent( sceneId, selfId,targetId )
    BeginEvent(sceneId)
		AddText(sceneId,"  Tr叻ng m鬾 s� huynh c� vi甤 tr鱪g 鹫i ph鋓 l鄊, nh鎛g vi甤 nh 鸢 甬 b醝 s� giao cho ta ph� tr醕h.")
		local mp = GetMenPai(sceneId, selfId)
		local nMenpaiPoint = GetHumanMenpaiPoint(sceneId, selfId)
		if mp == 9 and nMenpaiPoint <= 0 then
			AddNumText(sceneId, x990001_g_scriptId, "Gia nh m鬾 ph醝",6,0)
		end
		if mp == 9 and nMenpaiPoint > 0 then
			AddNumText(sceneId, x990001_g_scriptId, "K� n錸g h鱟 t",12,1)
		end
		AddNumText(sceneId, x990001_g_ScriptId, "H鱟 khinh c鬾g ph醝 M� Dung",12,2)
		AddNumText(sceneId, x990001_g_scriptId, "Gi緄 thi畊 m鬾 ph醝"..GetLevel( sceneId, selfId ),8,3)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

function x990001_OnEventRequest( sceneId, selfId, targetId, eventId)
	local haveMoney = x990001_MoneyDisplayChange( sceneId, selfId, GetMoney(sceneId, selfId)+GetMoneyJZ(sceneId, selfId) )
	local nMenpaiPoint = GetHumanMenpaiPoint(sceneId, selfId)
	if	GetNumText()==2	then
		x990001_HocKinhCong(sceneId, selfId, targetId, nMenpaiPoint)
	end
	
	if	GetNumText()==1	then
		BeginEvent(sceneId)
				AddText(sceneId, "  Ch鱪 B� t竎h mu痭 n鈔g t鈓 ph醦:")
				AddNumText(sceneId, x990001_g_scriptId, "Giang Nam Ki猰 Quy猼",12,20)
				AddNumText(sceneId, x990001_g_ScriptId, "S醫 Tr叨ng Quy猼",12,21)
			AddNumText(sceneId, x990001_g_scriptId, "Vi阭 D呓ng T鈓 Ph醦",12,22)
			AddNumText(sceneId, x990001_g_scriptId, "Thanh V鈔 B� T竎h",12,23)
			AddNumText(sceneId, x990001_g_scriptId, "S呓ng L頽h Ki猰 Thu",12,24)
			AddNumText(sceneId, x990001_g_scriptId, "Tinh Nguy畉 Y陁 Thu",12,25)
			AddNumText(sceneId, x990001_g_scriptId, "Tham H䅟 C鬾g",12,26)
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
	end
	
	if GetNumText()==20 then
		x990001_g_szTamPhap = 64
		local szLuaFnGetXinFaLevel = LuaFnGetXinFaLevel(sceneId,selfId,x990001_g_szTamPhap)
		if szLuaFnGetXinFaLevel == 10 or szLuaFnGetXinFaLevel == 20 or szLuaFnGetXinFaLevel == 30 or szLuaFnGetXinFaLevel == 40 or szLuaFnGetXinFaLevel == 50 or szLuaFnGetXinFaLevel == 60 or szLuaFnGetXinFaLevel == 70 or szLuaFnGetXinFaLevel == 80 or szLuaFnGetXinFaLevel == 90 or szLuaFnGetXinFaLevel == 100 or szLuaFnGetXinFaLevel == 110 or szLuaFnGetXinFaLevel == 120 or szLuaFnGetXinFaLevel == 130 or szLuaFnGetXinFaLevel == 140 then
			szLuaFnGetXinFaLevel2 = szLuaFnGetXinFaLevel + 10;
		else
			szLuaFnGetXinFaLevel2 = szLuaFnGetXinFaLevel + 9;
		end
		BeginEvent(sceneId)
			AddText(sceneId, "B� t竎h: #GGiang Nam Ki猰 Quy猼#W#r")
			AddText(sceneId, "T鈓 ph醦 hi畁 t読:        "..szLuaFnGetXinFaLevel)
			AddText(sceneId, "T鈓 ph醦 ti猵 theo:     "..szLuaFnGetXinFaLevel2)
			AddText(sceneId, "#rTi玭 v鄋g c�:               "..haveMoney)
			AddText(sceneId, "Ti玭 v鄋g c:             "..szLuaFnGetXinFaLevel2.."#-02")
			AddNumText(sceneId, x990001_g_scriptId, "H鱟",12,200)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	if GetNumText()==21	then
		x990001_g_szTamPhap = 65
		local szLuaFnGetXinFaLevel = LuaFnGetXinFaLevel(sceneId,selfId,x990001_g_szTamPhap)
		if szLuaFnGetXinFaLevel == 10 or szLuaFnGetXinFaLevel == 20 or szLuaFnGetXinFaLevel == 30 or szLuaFnGetXinFaLevel == 40 or szLuaFnGetXinFaLevel == 50 or szLuaFnGetXinFaLevel == 60 or szLuaFnGetXinFaLevel == 70 or szLuaFnGetXinFaLevel == 80 or szLuaFnGetXinFaLevel == 90 or szLuaFnGetXinFaLevel == 100 or szLuaFnGetXinFaLevel == 110 or szLuaFnGetXinFaLevel == 120 or szLuaFnGetXinFaLevel == 130 or szLuaFnGetXinFaLevel == 140 then
			szLuaFnGetXinFaLevel2 = szLuaFnGetXinFaLevel + 10;
		else
			szLuaFnGetXinFaLevel2 = szLuaFnGetXinFaLevel + 9;
		end
		BeginEvent(sceneId)
			AddText(sceneId, "B� t竎h: #GS醫 Tr叨ng Quy猼#W#r")
			AddText(sceneId, "T鈓 ph醦 hi畁 t読:        "..szLuaFnGetXinFaLevel)
			AddText(sceneId, "T鈓 ph醦 ti猵 theo:     "..szLuaFnGetXinFaLevel2)
			AddText(sceneId, "#rTi玭 v鄋g c�:               "..haveMoney)
			AddText(sceneId, "Ti玭 v鄋g c:             "..szLuaFnGetXinFaLevel2.."#-02")
			AddNumText(sceneId, x990001_g_scriptId, "H鱟",12,201)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	if GetNumText()==22	then
		x990001_g_szTamPhap = 66
		local szLuaFnGetXinFaLevel = LuaFnGetXinFaLevel(sceneId,selfId,x990001_g_szTamPhap)
		if szLuaFnGetXinFaLevel == 10 or szLuaFnGetXinFaLevel == 20 or szLuaFnGetXinFaLevel == 30 or szLuaFnGetXinFaLevel == 40 or szLuaFnGetXinFaLevel == 50 or szLuaFnGetXinFaLevel == 60 or szLuaFnGetXinFaLevel == 70 or szLuaFnGetXinFaLevel == 80 or szLuaFnGetXinFaLevel == 90 or szLuaFnGetXinFaLevel == 100 or szLuaFnGetXinFaLevel == 110 or szLuaFnGetXinFaLevel == 120 or szLuaFnGetXinFaLevel == 130 or szLuaFnGetXinFaLevel == 140 then
			szLuaFnGetXinFaLevel2 = szLuaFnGetXinFaLevel + 10;
		else
			szLuaFnGetXinFaLevel2 = szLuaFnGetXinFaLevel + 9;
		end
		BeginEvent(sceneId)
			AddText(sceneId, "B� t竎h: #GVi阭 D呓ng T鈓 Ph醦#W#r")
			AddText(sceneId, "T鈓 ph醦 hi畁 t読:        "..szLuaFnGetXinFaLevel)
			AddText(sceneId, "T鈓 ph醦 ti猵 theo:     "..szLuaFnGetXinFaLevel2)
			AddText(sceneId, "#rTi玭 v鄋g c�:               "..haveMoney)
			AddText(sceneId, "Ti玭 v鄋g c:             "..szLuaFnGetXinFaLevel2.."#-02")
			AddNumText(sceneId, x990001_g_scriptId, "H鱟",12,202)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	if GetNumText()==23	then
		x990001_g_szTamPhap = 67
		local szLuaFnGetXinFaLevel = LuaFnGetXinFaLevel(sceneId,selfId,x990001_g_szTamPhap)
		if szLuaFnGetXinFaLevel == 10 or szLuaFnGetXinFaLevel == 20 or szLuaFnGetXinFaLevel == 30 or szLuaFnGetXinFaLevel == 40 or szLuaFnGetXinFaLevel == 50 or szLuaFnGetXinFaLevel == 60 or szLuaFnGetXinFaLevel == 70 or szLuaFnGetXinFaLevel == 80 or szLuaFnGetXinFaLevel == 90 or szLuaFnGetXinFaLevel == 100 or szLuaFnGetXinFaLevel == 110 or szLuaFnGetXinFaLevel == 120 or szLuaFnGetXinFaLevel == 130 or szLuaFnGetXinFaLevel == 140 then
			szLuaFnGetXinFaLevel2 = szLuaFnGetXinFaLevel + 10;
		else
			szLuaFnGetXinFaLevel2 = szLuaFnGetXinFaLevel + 9;
		end
		BeginEvent(sceneId)
			AddText(sceneId, "B� t竎h: #GThanh V鈔 B� T竎h#W#r")
			AddText(sceneId, "T鈓 ph醦 hi畁 t読:        "..szLuaFnGetXinFaLevel)
			AddText(sceneId, "T鈓 ph醦 ti猵 theo:     "..szLuaFnGetXinFaLevel2)
			AddText(sceneId, "#rTi玭 v鄋g c�:               "..haveMoney)
			AddText(sceneId, "Ti玭 v鄋g c:             "..szLuaFnGetXinFaLevel2.."#-02")
			AddNumText(sceneId, x990001_g_scriptId, "H鱟",12,203)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	if GetNumText()==24	then
		x990001_g_szTamPhap = 68
		local szLuaFnGetXinFaLevel = LuaFnGetXinFaLevel(sceneId,selfId,x990001_g_szTamPhap)
		if szLuaFnGetXinFaLevel == 10 or szLuaFnGetXinFaLevel == 20 or szLuaFnGetXinFaLevel == 30 or szLuaFnGetXinFaLevel == 40 or szLuaFnGetXinFaLevel == 50 or szLuaFnGetXinFaLevel == 60 or szLuaFnGetXinFaLevel == 70 or szLuaFnGetXinFaLevel == 80 or szLuaFnGetXinFaLevel == 90 or szLuaFnGetXinFaLevel == 100 or szLuaFnGetXinFaLevel == 110 or szLuaFnGetXinFaLevel == 120 or szLuaFnGetXinFaLevel == 130 or szLuaFnGetXinFaLevel == 140 then
			szLuaFnGetXinFaLevel2 = szLuaFnGetXinFaLevel + 10;
		else
			szLuaFnGetXinFaLevel2 = szLuaFnGetXinFaLevel + 9;
		end
		BeginEvent(sceneId)
			AddText(sceneId, "B� t竎h: #GS呓ng L頽h Ki猰 Thu#W#r")
			AddText(sceneId, "T鈓 ph醦 hi畁 t読:        "..szLuaFnGetXinFaLevel)
			AddText(sceneId, "T鈓 ph醦 ti猵 theo:     "..szLuaFnGetXinFaLevel2)
			AddText(sceneId, "#rTi玭 v鄋g c�:               "..haveMoney)
			AddText(sceneId, "Ti玭 v鄋g c:             "..szLuaFnGetXinFaLevel2.."#-02")
			AddNumText(sceneId, x990001_g_scriptId, "H鱟",12,204)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	if GetNumText()==25	then
		x990001_g_szTamPhap = 69
		local szLuaFnGetXinFaLevel = LuaFnGetXinFaLevel(sceneId,selfId,x990001_g_szTamPhap)
		if szLuaFnGetXinFaLevel == 10 or szLuaFnGetXinFaLevel == 20 or szLuaFnGetXinFaLevel == 30 or szLuaFnGetXinFaLevel == 40 or szLuaFnGetXinFaLevel == 50 or szLuaFnGetXinFaLevel == 60 or szLuaFnGetXinFaLevel == 70 or szLuaFnGetXinFaLevel == 80 or szLuaFnGetXinFaLevel == 90 or szLuaFnGetXinFaLevel == 100 or szLuaFnGetXinFaLevel == 110 or szLuaFnGetXinFaLevel == 120 or szLuaFnGetXinFaLevel == 130 or szLuaFnGetXinFaLevel == 140 then
			szLuaFnGetXinFaLevel2 = szLuaFnGetXinFaLevel + 10;
		else
			szLuaFnGetXinFaLevel2 = szLuaFnGetXinFaLevel + 9;
		end
		BeginEvent(sceneId)
			AddText(sceneId, "B� t竎h: #GTinh Nguy畉 Y陁 Thu#W#r")
			AddText(sceneId, "T鈓 ph醦 hi畁 t読:        "..szLuaFnGetXinFaLevel)
			AddText(sceneId, "T鈓 ph醦 ti猵 theo:     "..szLuaFnGetXinFaLevel2)
			AddText(sceneId, "#rTi玭 v鄋g c�:               "..haveMoney)
			AddText(sceneId, "Ti玭 v鄋g c:             "..szLuaFnGetXinFaLevel2.."#-02")
			AddNumText(sceneId, x990001_g_scriptId, "H鱟",12,205)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	if GetNumText()==26	then
		x990001_g_szTamPhap = 70
		local szLuaFnGetXinFaLevel = LuaFnGetXinFaLevel(sceneId,selfId,70)
		if szLuaFnGetXinFaLevel <= 0 then
			BeginEvent(sceneId)
				AddText(sceneId, "C醕 h� ch遖 h鱟 B� t竎h n鄖")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		else
			if szLuaFnGetXinFaLevel == 10 or szLuaFnGetXinFaLevel == 20 or szLuaFnGetXinFaLevel == 30 or szLuaFnGetXinFaLevel == 40 or szLuaFnGetXinFaLevel == 50 or szLuaFnGetXinFaLevel == 60 or szLuaFnGetXinFaLevel == 70 or szLuaFnGetXinFaLevel == 80 or szLuaFnGetXinFaLevel == 90 or szLuaFnGetXinFaLevel == 100 or szLuaFnGetXinFaLevel == 110 or szLuaFnGetXinFaLevel == 120 or szLuaFnGetXinFaLevel == 130 or szLuaFnGetXinFaLevel == 140 then
				szLuaFnGetXinFaLevel2 = szLuaFnGetXinFaLevel + 10;
			else
				szLuaFnGetXinFaLevel2 = szLuaFnGetXinFaLevel + 9;
			end
			BeginEvent(sceneId)
				AddText(sceneId, "B� t竎h: #GTham H䅟 C鬾g#W#r")
				AddText(sceneId, "T鈓 ph醦 hi畁 t読:        "..szLuaFnGetXinFaLevel)
				AddText(sceneId, "T鈓 ph醦 ti猵 theo:     "..szLuaFnGetXinFaLevel2)
				AddText(sceneId, "#rTi玭 v鄋g c�:               "..haveMoney)
				AddText(sceneId, "Ti玭 v鄋g c:             "..szLuaFnGetXinFaLevel2.."#-02")
				AddNumText(sceneId, x990001_g_scriptId, "H鱟",12,206)
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
	end
	
	if GetNumText() >= 200 and GetNumText() <= 206 then
		x990001_UpTamPhap( sceneId, selfId, targetId, x990001_g_szTamPhap );
	end
	
	if	GetNumText()==3	then
		BeginEvent(sceneId)
			AddText(sceneId, "#{OBJ_gusu_0001}")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end
	if GetNumText() == 0 then 
		x990001_MenPai = GetMenPai(sceneId, selfId)
		if GetLevel( sceneId, selfId ) < 10 then
			BeginEvent(sceneId)
				AddText(sceneId,"C醕 h� h銀 瘙i t緄 sau c 10 l読 t緄 b醝 s� h鱟 ngh�!")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		elseif x990001_MenPai ~= 9 then
			BeginEvent(sceneId)
				AddText(sceneId,"Ng呓i 疸 l� cao 鸢 c黙 m鬾 ph醝 kh醕, ch鷑g ta kh鬾g thu nh ng呓i")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		elseif x990001_MenPai == 9 and nMenpaiPoint > 0 then
			BeginEvent(sceneId)
				AddText(sceneId, "Ng呓i l読 t緄 qu r s� ph�, ng呓i 疸 l� 甬 t� ph醝 M� Dung, c騨 b醝 s� g� n鎍")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		else
			BeginEvent(sceneId)
				AddText(sceneId, "歇n 疴y, h銀 gia nh M� Dung Th� Gia c黙 ch鷑g t鬷 餴.")
				AddNumText(sceneId, x990001_g_scriptId, "Ta mu痭 b醝 nh ph醝 M� Dung",6,4)
				AddNumText(sceneId, x990001_g_scriptId, "T読 h� ch遖 mu痭 b醝 s�",8,5)
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
	end
	if GetNumText()==5	then
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
		return
	end
	if GetNumText()==4	then
		if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 2 then
			BeginEvent(sceneId)
				AddText(sceneId,"  H銀 s x猵 l読 tay n鋓, c 2 v� tr� tr痭g, ta s� th叻ng cho ng呓i!")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		else
			LuaFnJoinMenpai(sceneId, selfId, selfId, 9)
			CallScriptFunction( 200099, "InitRelation", sceneId, selfId )
				
			LuaFnSetXinFaLevel(sceneId,selfId,64,10)
			LuaFnSetXinFaLevel(sceneId,selfId,65,10)
			LuaFnSetXinFaLevel(sceneId,selfId,66,10)
			LuaFnSetXinFaLevel(sceneId,selfId,67,10)
			LuaFnSetXinFaLevel(sceneId,selfId,68,10)
			LuaFnSetXinFaLevel(sceneId,selfId,69,10)

			local nMenpaiPoint = GetHumanMenpaiPoint(sceneId, selfId)
			SetHumanMenpaiPoint(sceneId, selfId, nMenpaiPoint+20)
			BeginEvent(sceneId)
				AddText(sceneId,"C醕 h� 疸 gia nh ph醝 M� Dung!");
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			TryRecieveItem( sceneId, selfId, 10432010, 1 )
			if TryRecieveItem( sceneId, selfId, 10553095, 1 ) >= 0 then
				str		= "#YC醕 h� 疸 nh 疬㧟 "..GetItemName( sceneId, 10553095 ).."."
				x990001_MsgBox( sceneId, selfId, str )
			end
			BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
			EndUICommand( sceneId )
			DispatchUICommand( sceneId, selfId, 1000 )
		end
	end
end

function x990001_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
-- 屏幕中间信息提示
--**********************************
function x990001_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

function x990001_MsgBox( sceneId, selfId, str )
	Msg2Player( sceneId, selfId, str, MSG2PLAYER_PARA )
	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

function x990001_HocKinhCong( sceneId, selfId, targetId, snMenpaiPoint )
	if GetMenPai(sceneId, selfId) == 9 and snMenpaiPoint > 0 then
		if	HaveSkill( sceneId, selfId, 200)<0	then
			-- 扣钱
			if GetMoney(sceneId, selfId)+GetMoneyJZ(sceneId, selfId) < STUDY_MENPAI_QINGGONG_SPEND  then
				BeginEvent(sceneId)
					AddText(sceneId,"  Ng鈔 l唼ng tr阯 ng叨i c醕 h� kh鬾g 瘘 1#-15, v� v kh鬾g th� h鱟 khinh c鬾g b眓 m鬾")
				EndEvent(sceneId)
				DispatchEventList(sceneId,selfId,targetId)
				return
			end
			-- 扣钱
			CostMoney(sceneId,selfId,STUDY_MENPAI_QINGGONG_SPEND)
				
			AddSkill( sceneId, selfId, 200 )
			DelSkill( sceneId, selfId, 34 )
			BeginEvent(sceneId)
				AddText(sceneId,"Ch鷆 m譶g ng呓i 疸 h鱟 疬㧟 khinh c鬾g c黙 b眓 m鬾, hy v鱪g ng呓i ti猵 t鴆 n� l馽 瓞 ph醫 huy danh ti猲g b眓 m鬾")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		else
				BeginEvent(sceneId)
					AddText(sceneId,"Ch苙g ph鋓 ng呓i 疸 h鱟 r癷 sao?")
				EndEvent(sceneId)
				DispatchEventList(sceneId,selfId,targetId)
		end
	elseif GetMenPai(sceneId, selfId) == 9 then
		BeginEvent(sceneId)
			AddText(sceneId,"H鱟 khinh c鬾g M� Dung tr呔c ti阯 c gia nh ph醝 M� Dung!")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	else
		BeginEvent(sceneId)
			AddText(sceneId,"Ng呓i kh鬾g ph鋓 l� 甬 t� c黙 b眓 bang, ta kh鬾g th� d誽 ng呓i khinh c鬾g c黙 M� Dung")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end
end

function x990001_UpTamPhap( sceneId, selfId, targetId, TamPhap )
	local TamPhapHienTai = LuaFnGetXinFaLevel(sceneId,selfId,TamPhap)
	if TamPhapHienTai >= GetLevel( sceneId, selfId ) then
		BeginEvent(sceneId)
			AddText(sceneId,"  衅ng c T鈓 ph醦 疸 鹫t t緄 c cao nh. Xin n鈔g cao 鹌ng c nh鈔 v")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	if TamPhapHienTai == 10 or TamPhapHienTai == 20 or TamPhapHienTai == 30 or TamPhapHienTai == 40 or TamPhapHienTai == 50 or TamPhapHienTai == 60 or TamPhapHienTai == 70 or TamPhapHienTai == 80 or TamPhapHienTai == 90 or TamPhapHienTai == 100 or TamPhapHienTai == 110 or TamPhapHienTai == 120 or TamPhapHienTai == 130 or TamPhapHienTai == 140 then
			TamPhapHienTai = TamPhapHienTai + 10;
	else
			TamPhapHienTai = TamPhapHienTai + 9;
	end
	NeedMoneyUP = TamPhapHienTai * 10000;
	if GetMoney(sceneId, selfId)+GetMoneyJZ(sceneId, selfId) < NeedMoneyUP  then
		BeginEvent(sceneId)
			AddText(sceneId,"  Ng鈔 l唼ng tr阯 ng叨i c醕 h� kh鬾g 瘘, v� v kh鬾g th� n鈔g t鈓 ph醦")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	LuaFnSetXinFaLevel(sceneId,selfId,TamPhap,TamPhapHienTai)
	CostMoney(sceneId,selfId,NeedMoneyUP)
	x990001_MsgBox( sceneId, selfId, "N鈔g t鈓 ph醦 th鄋h c鬾g");
	DispatchUICommand( sceneId, selfId, 1000 )
end

function x990001_MoneyDisplayChange( sceneId, selfId, money )
	Moneydisplay = ""
	Bronze = mod(money,100)
	Silver = (mod(money,10000) - Bronze)/100
	Gold = (money - Bronze - Silver * 100)/10000
	if Gold ~= 0 and Silver ~= 0 and Bronze ~= 0 then
		Moneydisplay = ""..Gold.."#-02"..Silver.."#-03"..Bronze.."#-04"
	elseif Gold ~= 0 and Silver ~= 0 and Bronze == 0 then
		Moneydisplay = ""..Gold.."#-02"..Silver.."#-03"
	elseif Gold ~= 0 and Silver == 0 and Bronze ~= 0 then
		Moneydisplay = ""..Gold.."#-02"..Bronze.."#-04"
	elseif Gold ~= 0 and Silver == 0 and Bronze == 0 then
		Moneydisplay = ""..Gold.."#-02"
	elseif Gold == 0 and Silver ~= 0 and Bronze ~= 0 then
		Moneydisplay = ""..Silver.."#-03"..Bronze.."#-04"
	elseif Gold == 0 and Silver ~= 0 and Bronze == 0 then
		Moneydisplay = ""..Silver.."#-03"
	elseif Gold == 0 and Silver == 0 and Bronze ~= 0 then
		Moneydisplay = ""..Bronze.."#-04"
	elseif Gold  == 0 and Silver == 0 and Bronze == 0 then
		Moneydisplay = "0#-04"
	end
	return Moneydisplay
end
