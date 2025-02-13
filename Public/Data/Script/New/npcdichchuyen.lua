--大理NPC
--驿站....

x388888_g_ScriptId	= 388888

--门派信息(门派名称，SceneID，PosX，PosY，门派ID)
x388888_g_mpInfo		= {}
x388888_g_mpInfo[0]	= { "Tinh T鷆", 16,  96, 152, MP_XINGSU }
x388888_g_mpInfo[1]	= { "Ti陁 Dao", 14,  67, 145, MP_XIAOYAO }
x388888_g_mpInfo[2]	= { "Thi猽 L鈓",  9,  96, 127, MP_SHAOLIN }
x388888_g_mpInfo[3]	= { "Thi阯 S絥", 17,  95, 120, MP_TIANSHAN }
x388888_g_mpInfo[4]	= { "Thi阯 Long", 13,  96, 120, MP_DALI }
x388888_g_mpInfo[5]	= { "Nga My", 15,  89, 139, MP_EMEI }
x388888_g_mpInfo[6]	= { "V� 衋ng", 12, 103, 140, MP_WUDANG }
x388888_g_mpInfo[7]	= { "Minh Gi醥", 11,  98, 167, MP_MINGJIAO }
x388888_g_mpInfo[8]	= { "C醝 Bang", 10,  91, 116, MP_GAIBANG }
x388888_g_mpInfo[9]	= { "M� Dung", 535,  91, 116, MP_GAIBANG }

x388888_g_Yinpiao = 40002000 

x388888_g_Impact_NotTransportList = { 5929, 5944 } -- 禁止传送的Impact
x388888_g_TalkInfo_NotTransportList = { "#{GodFire_Info_062}", "#{XSHCD_20080418_099}" } -- 禁止传送的Impact提示信息

--**********************************
--事件交互入口
--**********************************
function x388888_OnDefaultEvent( sceneId, selfId,targetId )
	
	-- 检测玩家身上是不是有“银票”这个东西，有就不能使用这里的功能
	if GetItemCount(sceneId, selfId, x388888_g_Yinpiao)>=1  then
		BeginEvent( sceneId )
			AddText( sceneId, "Ng呓i 餫ng trong tr課g th醝 Th呓ng Nh鈔, kh鬾g th� d竎h chuy琻!" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end

	local	mp
	local	i		= 0
	BeginEvent( sceneId )

		AddText( sceneId, "#{loulan_yizhan_20080329}")
		 
		--AddNumText( sceneId, x388888_g_ScriptId, "Quay v� m鬾 ph醝", 9, 1000 )
		--AddNumText( sceneId, x388888_g_ScriptId, "Th鄋h Th� - L誧 D呓ng", 9, 1001 )
		--AddNumText( sceneId, x388888_g_ScriptId, "Th鄋h Th� -  L誧 D呓ng - C豼 Ch鈛 Th呓ng H礽", 9, 1002 )
		AddNumText( sceneId, x388888_g_ScriptId, "Ng� Hoa D鄋", 9, 1003 )
		---AddNumText( sceneId, x388888_g_ScriptId, "Th鄋h Th� - T� Ch鈛 - Thi猼 T唼ng Ph�", 9, 1004 )
		--AddNumText( sceneId, x388888_g_ScriptId, "Th鄋h Th� - L鈛 Lan", 9, 1005 )
		--AddNumText( sceneId, x388888_g_ScriptId, "Th鄋h Th� - Th鷆 H� C� Tr", 9, 1016 )
		--AddNumText( sceneId, x388888_g_ScriptId, "Th鄋h Th� - #GPh唼ng Minh Tr", 9, 1017 )
		 
		--AddNumText( sceneId, x388888_g_ScriptId, "衖 Th 鹫i M鬾 Ph醝", 9, 1011 )
		
		--for i, mp in x388888_g_mpInfo do
			--AddNumText( sceneId, x388888_g_ScriptId, "门派 - "..mp[1], 9, i )
		--end

	
	
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

end

--**********************************
--事件列表选中一项
--**********************************
function x388888_OnEventRequest( sceneId, selfId, targetId, eventId )

	--漕运禁止传送....
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
				x388888_MsgBox( sceneId, selfId, targetId, "T� 鸬i c黙 ng呓i c� th鄋h vi阯 餫ng trong tr課g th醝 T鄌 V, kh鬾g th� d竎h chuy琻!" )
				return
			end
		end
	end

	if IsHaveMission(sceneId,selfId,4021) > 0 then
		x388888_MsgBox( sceneId, selfId, targetId, "Ng呓i 餫ng trong tr課g th醝 T鄌 V, kh鬾g th� d竎h chuy琻!" )
		return
	end

	--检测Impact状态驻留效果
	for i, ImpactId in x388888_g_Impact_NotTransportList do
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, ImpactId) ~= 0 then
			x388888_MsgBox( sceneId, selfId, targetId, x388888_g_TalkInfo_NotTransportList[i] )			
			return 0
		end
	end

	
	--返回门派....
	local	arg	= GetNumText()
	local	mp
	local	i		= 0
	local	id	= LuaFnGetMenPai( sceneId, selfId )
	if arg == 1000 then		--返回门派
		if id < 0 or (id == 9 and LuaFnGetXinFaLevel(sceneId,selfId,64) <= 0) then --Add by S骾
			x388888_MsgBox( sceneId, selfId, targetId, "Ng呓i v鏽 ch遖 gia nh m鬾 ph醝." )
		elseif id == 9 and LuaFnGetXinFaLevel(sceneId,selfId,64) > 0 then --Add by S骾
			CallScriptFunction((400900),"TransferFunc",sceneId,selfId,535,91,116)
		else
			mp	= x388888_GetMPInfo( id )
			if mp ~= nil then
				CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, mp[2], mp[3], mp[4] )
			end
		end
		return
	end

	--洛阳....
	if arg == 1001 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 0, 233, 321 )
		return
	end

	--洛阳九州....
	if arg == 1002 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 0, 325, 270 )
		return
	end

	--苏州....
	if arg == 1003 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 2, 160,160 )
		return
	end

	--苏州铁匠....
	if arg == 1004 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 1, 331, 226 )
		return
	end

	--楼兰....
	if arg == 1005 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 186, 286, 129 )
		return
	end

	--凤鸣镇....
	if arg == 1017 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 580, 158, 120 )
		return
	end

	if arg == 1011 then		
		BeginEvent( sceneId )
			for i, mp in x388888_g_mpInfo do
				AddNumText( sceneId, x388888_g_ScriptId, "M鬾 ph醝 - "..mp[1], 9, i )
			end
			
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	
		return
	end
	
	if arg == 1016 then		--束河古镇
			-- add by zchw
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId, x388888_g_ScriptId);
			-- zchw fix Transfer bug
			UICommand_AddInt(sceneId, targetId);
			UICommand_AddString(sceneId, "GotoShuHeGuZhen");
			UICommand_AddString(sceneId, "Th鷆 H� C� Tr l� khu v馽 kh鬾g t錸g s醫 kh�, ng呓i x醕 鸶nh 餴 ti猵?");
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 24)
		return
	end
	
	--门派....
	for i, mp in x388888_g_mpInfo do
		if arg == i then
			CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, mp[2], mp[3], mp[4] )
			return
		end
	end

end
--  add by zchw
function x388888_GotoShuHeGuZhen( sceneId, selfId, targetId )
	CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 420, 200, 211, 20 );
	return
end
--**********************************
--根据门派ID获取门派信息
--**********************************
function x388888_GetMPInfo( mpID )
	local	mp
	local	i		= 0
	for i, mp in x388888_g_mpInfo do
		if mp[5] == mpID then
			return mp
		end
	end
	return nil
end

--**********************************
--对话窗口信息提示
--**********************************
function x388888_MsgBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
