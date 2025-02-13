--L誧 D呓ngNPC
--汪旱
--普通

x000128_g_ScriptId	= 000128

--门派信息(门派名称,SceneID,PosX,PosY,门派ID)
x000128_g_mpInfo		= {}
x000128_g_mpInfo[0]	= { "Tinh T鷆", 16,  96, 152, MP_XINGSU }
x000128_g_mpInfo[1]	= { "Ti陁 Dao", 14,  67, 145, MP_XIAOYAO }
x000128_g_mpInfo[2]	= { "Thi猽 L鈓",  9,  96, 127, MP_SHAOLIN }
x000128_g_mpInfo[3]	= { "Thi阯 S絥", 17,  95, 120, MP_TIANSHAN }
x000128_g_mpInfo[4]	= { "Thi阯 Long", 13,  96, 120, MP_DALI }
x000128_g_mpInfo[5]	= { "Nga My", 15,  89, 139, MP_EMEI }
x000128_g_mpInfo[6]	= { "V� 衋ng", 12, 103, 140, MP_WUDANG }
x000128_g_mpInfo[7]	= { "Minh Gi醥", 11,  98, 167, MP_MINGJIAO }
x000128_g_mpInfo[8]	= { "C醝 Bang", 10,  91, 116, MP_GAIBANG }

x000128_g_Yinpiao = 40002000 

x000128_g_Impact_NotTransportList = { 5929, 5944 } -- 禁止传送to� 鸬 Impact
x000128_g_TalkInfo_NotTransportList = { "#{GodFire_Info_062}", "#{XSHCD_20080418_099}" } -- 禁止传送to� 鸬 Impact提示信息

--**********************************
--事件交互入口
--**********************************
function x000128_OnDefaultEvent( sceneId, selfId,targetId )
	
	-- 检测玩家身上喧ng不喧ng有“银票”C醝 n鄖 东西,有就不能使用这里to� 鸬 功能
	if GetItemCount(sceneId, selfId, x000128_g_Yinpiao)>=1  then
		BeginEvent( sceneId )
			AddText( sceneId, "  Xin th� l瞚 tr阯 ng叨i c醕 h� 餫ng gi� ng鈔 phi猽 ta kh鬾g th� gi鷓 疬㧟." )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end

	local	mp
	local	i		= 0
	BeginEvent( sceneId )
		AddText( sceneId, "#{XIYU_20071228_01}")
		AddNumText( sceneId, x000128_g_ScriptId, "Quay v� m鬾 ph醝", 9, 1000 )
		AddNumText( sceneId, x000128_g_ScriptId, "Th鄋h Th� - T� Ch鈛", 9, 1001 )
		AddNumText( sceneId, x000128_g_ScriptId, "Th鄋h Th� - T� Ch鈛 - Thi猼 T唼ng Ph�", 9, 1007 )
		AddNumText( sceneId, x000128_g_ScriptId, "Th鄋h Th� - 姓i L�", 9, 1002 )
		AddNumText( sceneId, x000128_g_ScriptId, "Th鄋h Th� - L鈛 Lan", 9, 1011 )
		AddNumText( sceneId, x000128_g_ScriptId, "Th鄋h Th� - Th鷆 H� C� Tr", 9, 1010 )
		--AddNumText( sceneId, x000128_g_ScriptId, "Th鄋h ph�  - L誧 D呓ng", 9, 1006 )
		AddNumText( sceneId, x000128_g_ScriptId, "羞a ta 皙n nh鎛g m鬾 ph醝 kh醕", 9, 1012 )
		--for i, mp in x000128_g_mpInfo do
			--AddNumText( sceneId, x000128_g_ScriptId, "M鬾 ph醝 - "..mp[1], 9, i )
		--end

		
		
		-- 歇n 恤n Ho鄋g v� Tung S絥?
		AddNumText( sceneId, x000128_g_ScriptId, "歇n 恤n Ho鄋g v� Tung S絥?", 11, 2000 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中m祎 项
--**********************************
function x000128_OnEventRequest( sceneId, selfId, targetId, eventId )
	--队伍相关
	if GetTeamId(sceneId,selfId)>=0 and 
		IsTeamFollow(sceneId, selfId)==1 and
		LuaFnIsTeamLeader(sceneId,selfId)==1 then
		num=LuaFnGetFollowedMembersCount( sceneId, selfId)
		local mems = {}
		for	i=0,num-1 do
			mems[i] = GetFollowedMember(sceneId, selfId, i)
			if mems[i] == -1 then
				return
			end
			if IsHaveMission(sceneId,mems[i],4021) > 0 then
				x000128_MsgBox( sceneId, selfId, targetId, "  Trong 鸬i ng� c黙 c醕 h� c� ng叨i 餫ng l鄊 nhi甿 v� v chuy琻, th呓ng nh鈔 ta kh鬾g th� cung c d竎h v� cho c醕 h� 疬㧟." )
				return
			end
		end
	end

	--漕运相关
	if IsHaveMission(sceneId,selfId,4021) > 0 then
		x000128_MsgBox( sceneId, selfId, targetId, "  Xin th� l瞚! C醕 h� 餫ng mang trong m靚h nhi甿 v� v chuy琻, th呓ng nh鈔 ta kh鬾g th� cung c d竎h v� cho c醕 h�." )
		return
	end

	--检测Impact状态驻留效果
	for i, ImpactId in x000128_g_Impact_NotTransportList do
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, ImpactId) ~= 0 then
			x000128_MsgBox( sceneId, selfId, targetId, x000128_g_TalkInfo_NotTransportList[i] )			
			return 0
		end
	end

	--顺利传送
	local	arg	= GetNumText()
	local	mp
	local	i		= 0
	local	id	= LuaFnGetMenPai( sceneId, selfId )
	if arg == 1000 then		--Tr� v排�
		if id < 0 or id >= 9 then
			x000128_MsgBox( sceneId, selfId, targetId, "  C醕 h� ch遖 gia nh m鬾 ph醝 n鄌." )
		else
			mp	= x000128_GetMPInfo( id )
			if mp ~= nil then
				CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, mp[2], mp[3], mp[4] )
			end
		end
		return
	end
	if arg == 1001 then		--T� Ch鈛
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 1, 114,162 )
		return
	end
	if arg == 1007 then		--T� Ch鈛铁匠铺
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 1, 235, 132 )
		return
	end
	if arg == 1002 then		--姓i L�
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 2, 241, 141 )
		return
	end
	if arg == 1006 then		--L誧 D呓ng
		SetPos(sceneId, selfId, 132,183)
		return
	end
  	if arg == 1011 then		--L鈛 Lan
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 186, 288, 136, 75 )
		return
	end
	for i, mp in x000128_g_mpInfo do
		if arg == i then
			CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, mp[2], mp[3], mp[4] )
			return
		end
	end

	if GetNumText()== 1010 then		--Th鷆 H� C� Tr
	-- modify by zchw
			-- add by zchw
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId, x000128_g_ScriptId);
			-- zchw fix Transfer bug
			UICommand_AddInt(sceneId, targetId);
			UICommand_AddString(sceneId, "GotoShuHeGuZhen");
			UICommand_AddString(sceneId, "Th鷆 H� C� Tr l� n絠 PK s� kh鬾g b� s醫 kh�. Xin ch� � an to鄋. C醕 h� c� x醕 nh ti猲 v鄌 kh鬾g?");
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 24)
		return
	end
	
	if arg == 1012 then		
		BeginEvent( sceneId )
			for i, mp in x000128_g_mpInfo do
				AddNumText( sceneId, x000128_g_ScriptId, "M鬾 ph醝 - "..mp[1], 9, i )
			end
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	
		return
	end
	
	if GetNumText() == 2000 then		--
		BeginEvent( sceneId )
			AddText( sceneId, "#{GOTO_DUNHUANF_SONGSHAN}" ) 
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		
		return
	end
end
--  add by zchw
function x000128_GotoShuHeGuZhen( sceneId, selfId, targetId )
	CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 420, 200, 211, 20 );
	return
end
--**********************************
--根据门派ID获取门派信息
--**********************************
function x000128_GetMPInfo( mpID )
	local	mp
	local	i		= 0
	for i, mp in x000128_g_mpInfo do
		if mp[5] == mpID then
			return mp
		end
	end
	return nil
end

--**********************************
--对话窗口信息提示
--**********************************
function x000128_MsgBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
