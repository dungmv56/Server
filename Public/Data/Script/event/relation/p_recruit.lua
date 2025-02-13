--收徒任务

--脚本号
x806008_g_ScriptId = 806008

--收徒
x806008_g_Recruit					= {}
x806008_g_Recruit["Id"]		= 1003
x806008_g_Recruit["Name"]	= "邪 甬 ph鋓 b醝 ta l鄊 s� ph�"

--提示信息
x806008_g_msg					= {}
x806008_g_msg["tem"]	= "  Khi b醝 s� c c� quan h� h鎢 h鋙 v緄 鸢 甬, v� c 2 ng叨i l 鸬i t緄 t靘 ta"
x806008_g_msg["ner"]	= "  Ch� c� 2 ng叨i 皤u t緄 b阯 ta m緄 c� th� b醝 s�"
x806008_g_msg["mlv"]	= "  衅ng c c黙 s� ph� ph鋓 l緉 h絥 鸢 甬 10 c"
x806008_g_msg["slv"]	= "  邪 甬 c 10 疸 b 馥u c� th� b醝 s�"
x806008_g_msg["sib"]	= "  C� quan h� k猼 b醝 kh鬾g th� b醝 s�"
x806008_g_msg["mar"]	= "  C� quan h� phu th� kh鬾g th� b醝 s�"
x806008_g_msg["frp"]	= "  C鵱g l� b課 h鎢 m緄 c� th� b醝 s�"
x806008_g_msg["msl"]	= "  Xin n鈔g 鹌ng c s� 鹧c c黙 c醕 h�, ch� c� nh鈔 t鄆 c� 鹌ng c s� 鹧c l緉 h絥 1 m緄 疬㧟 thu nh 鸢 甬"
x806008_g_msg["rec_3"]	= "  Sau khi c咿ng ch� ph� gi鋓 quan h� s� 鸢 3 ng鄖 m緄 c� th� b醝 s� l読"
x806008_g_msg["rec_2"]	= "  L唼ng 鸢 甬 疬㧟 thu nh 疸 qu� l緉"
x806008_g_msg["rec_1"]	= "  Ng叨i ch絠 疸 c� s� ph�, kh鬾g th� b醝 s�"
x806008_g_msg["ts"]	= "  已经喧ng师徒关系了,不能拜师."

--**********************************
--任务入口函数 请求收徒
--**********************************
function x806008_OnDefaultEvent( sceneId, selfId, targetId )
	local	key	= GetNumText()
	
	if key == -1 then
		local	tId	= x806008_CheckAccept( sceneId, selfId, targetId )
		if tId == 0 then
			return
		end

		local	MasterName		= LuaFnGetName( sceneId, selfId )
		local	ApprenticeName= LuaFnGetName( sceneId, tId )

		--请对方确认喧ng否愿意拜师
		BeginEvent( sceneId )
				AddText( sceneId, "  Sau khi b醝 s�, gi猼 qu醝 c� th� 鹫t 疬㧟10% kinh nghi甿 gia th鄋h. N猽 c� s� ph� c鵱g nh nh髆, 鹫t 疬㧟20% kinh nghi甿 gia th鄋h" )
				AddText( sceneId, "  Sau khi b醝 s�, 鸢 甬 s� 鹫t 疬㧟 \""..MasterName.."Danh x遪g \"邪 甬 c黙" )
				AddText( sceneId, "  Ng呓i c� th馽 l騨g mu痭 b醝"..MasterName.."L鄊 s� ph�?" )
				AddNumText( sceneId, x806008_g_ScriptId, "C�", 6, 1 )
				AddNumText( sceneId, x806008_g_ScriptId, "Kh鬾g", 8, 0 )
		EndEvent( sceneId )
		DispatchEventList( sceneId, tId, targetId )

		BeginEvent( sceneId )
			AddText( sceneId, "  Ch� 瘙i "..ApprenticeName.." h癷 疳p" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

		--BeginEvent( sceneId )
		--	AddText( sceneId, "你喧ng否愿意拜"..MasterName.."为师?" )
		--EndEvent( sceneId )
		--DispatchMissionInfo( sceneId, tId, targetId, x806008_g_ScriptId, x806008_g_Recruit["Id"] )

	elseif key == 0 then
		x806008_OnCancel( sceneId, selfId, targetId )

	elseif key == 1 then
		x806008_OnConfirm( sceneId, selfId, targetId )
	end

end

--**********************************
--列举事件
--**********************************
function x806008_OnEnumerate( sceneId, selfId, targetId )
	AddNumText( sceneId, x806008_g_ScriptId, x806008_g_Recruit["Name"], 6, -1 )
end

--**********************************
--检测Ti猵 th跫�
--**********************************
function x806008_CheckAccept( sceneId, selfId, targetId )
	--(1)组队中只有师徒两c醝人
	if LuaFnHasTeam( sceneId, selfId ) == 0 or LuaFnGetTeamSize( sceneId, selfId ) ~= 2 then
		x806008_MsgBox( sceneId, selfId, targetId, x806008_g_msg["tem"] )
		return 0
	end
	if LuaFnGetTeamSceneMemberCount( sceneId, selfId ) ~= 1 then
		x806008_MsgBox( sceneId, selfId, targetId, x806008_g_msg["ner"] )
		return 0
	end

	local tId	= LuaFnGetTeamSceneMember( sceneId, selfId, 0 )
	if LuaFnIsCanDoScriptLogic( sceneId, selfId ) ~= 1 or LuaFnIsCanDoScriptLogic( sceneId, tId ) ~= 1 then
		return 0
	end

	--(2)徒弟等c≥10c
	if LuaFnGetLevel( sceneId, tId ) < 10 then
		x806008_MsgBox( sceneId, selfId, targetId, x806008_g_msg["slv"] )
		return 0
	end

	--当玩家到45后不能再拜师了
	if LuaFnGetLevel( sceneId, tId ) > 44 then
		x806008_MsgBox( sceneId, selfId, targetId, "#{STGZ_20080520_7}" )
		return 0
	end


	--(3)师傅等c必须≥徒弟10c
	if LuaFnGetLevel( sceneId, selfId ) < ( LuaFnGetLevel( sceneId, tId ) + 10 ) then
		x806008_MsgBox( sceneId, selfId, targetId, x806008_g_msg["mlv"] )
		return 0
	end

	--(4)师德等c>0
	local MasterLevel = LuaFnGetmasterLevel( sceneId, selfId )
	if MasterLevel <= 0 then
		x806008_MsgBox( sceneId, selfId, targetId, x806008_g_msg["msl"] )
		return 0
	end

	--(5)喧ng否喧ng结拜
	if LuaFnIsBrother( sceneId, selfId, tId ) ~= 0 then
		x806008_MsgBox( sceneId, selfId, targetId, x806008_g_msg["sib"] )
		return 0
	end

	--(6)喧ng否喧ng夫妻
	if LuaFnIsSpouses( sceneId, selfId, tId ) ~= 0 then
		x806008_MsgBox( sceneId, selfId, targetId, x806008_g_msg["mar"] )
		return 0
	end

	--06.10.24,最新to� 鸬 策划文档已经把此部分内容去掉了
	--(7)喧ng否强行解除师徒关系不满3天
	--if LuaFnGetPrenticeBetrayTime( sceneId, selfId ) < (86400 * 3) then
	--	x806008_MsgBox( sceneId, selfId, targetId, x806008_g_msg["rec_3"] )
	--	return 0
	--end

	--(8)看看当前徒弟数喧ng否已经最大了
	--计算可以收到to� 鸬 徒弟数
	local PrenticeNum = 2
	if MasterLevel == 1 then
		PrenticeNum = 2
	elseif MasterLevel == 2 then
		PrenticeNum = 3
	elseif MasterLevel == 3 then
		PrenticeNum = 5
	elseif MasterLevel == 4 then
		PrenticeNum = 8
	end
	if LuaFnGetPrenticeCount( sceneId, selfId ) >= PrenticeNum then
		x806008_MsgBox( sceneId, selfId, targetId, x806008_g_msg["rec_2"] )
		return 0
	end
	
	--(9)喧ng否现T読 有师傅
	if LuaFnHaveMaster( sceneId, tId ) ~= 0 then
		x806008_MsgBox( sceneId, selfId, targetId, x806008_g_msg["rec_1"] )
		return 0
	end

	--(10)必须喧ng好友
	if LuaFnIsFriend( sceneId, selfId, tId ) ~= 1 or LuaFnIsFriend( sceneId, tId, selfId ) ~= 1 then
		x806008_MsgBox( sceneId, selfId, targetId, x806008_g_msg["frp"] )
		return 0
	end
	
	--(11)喧ng否已经喧ng师徒关系了
	if LuaFnIsMaster( sceneId, selfId, tId ) ~= 0 or LuaFnIsMaster( sceneId, tId, selfId ) ~= 0 then
		x806008_MsgBox( sceneId, selfId, targetId, x806008_g_msg["ts"] )
		return 0 
	end

	return tId
end

--**********************************
--Ti猵 th�
--**********************************
function x806008_OnAccept( sceneId, selfId, targetId )
	x806008_OnConfirm( sceneId, selfId, targetId )
end

--**********************************
--提交
--**********************************
function x806008_OnSubmit( sceneId, selfId, targetId, tId )
	--徒弟增加m祎 c醝称号
	local	MasterName	= LuaFnGetName( sceneId, tId )
	local	SelfName		= LuaFnGetName( sceneId, selfId )
	AwardShiTuTitle( sceneId, selfId, MasterName.." 甬 t�" )
	DispatchAllTitle( sceneId, selfId )
	LuaFnAprentice( sceneId, selfId, tId )

	--师傅
	x806008_MsgBox( sceneId, tId, targetId, "  Ch鷆 m譶g thu nh 鸢 甬 th鄋h c鬾g" )
	Msg2Player( sceneId, tId, "Ch鷆 m譶g thu nh 鸢 甬 th鄋h c鬾g", MSG2PLAYER_PARA )
	Msg2Player( sceneId, tId, "S� ph� c n� l馽 d誽 b鋙 鸢 nhi", MSG2PLAYER_PARA )
	str		= format( "Ch鷆 m譶g c醕 h� 疸 nh %s l鄊 鸢 甬. Sau khi nh xong, gi猼 qu醝, kinh nghi甿 s� t錸g l阯 5%, v� 鹫t th阭 c痭g hi猲 kinh nghi甿 c黙 鸢 甬, nh遪g c ph鋓 鸨i l 1 l唼ng tr� gi� thi畁 醕 nh 鸶nh. C鵱g 鸢 甬 nh nh髆, n猽 ph� h䅟 v緄 餴玼 ki畁 鹫t tr� gi� thi畁 醕. Nh� v tr� gi� thi畁 醕 s� t錸g 160% so v緄 ban 馥u", SelfName )
	LuaFnSendSystemMail( sceneId, MasterName, str )
	--LuaFnSendNormalMail( sceneId, tId, MasterName, str )
	CallScriptFunction( SCENE_SCRIPT_ID, "PlaySoundEffect", sceneId, tId, 66 )
	LuaFnSendSpecificImpactToUnit( sceneId, tId, tId, tId, 18, 1000 )

	--徒弟
	x806008_MsgBox( sceneId, selfId, targetId, "  Ch鷆 m譶g b醝 s� th鄋h c鬾g!" )
	Msg2Player( sceneId, selfId, "Ch鷆 m譶g b醝 s� th鄋h c鬾g!", MSG2PLAYER_PARA )
	str		= format( "Ch鷆 m譶g ng呓i 疸 b醝%sl鄊 s� ph�. Sau khi nh xong, gi猼 qu醝, kinh nghi甿 s� t錸g l阯 10%. N猽 c鵱g s� ph� nh nh髆 gi猼 qu醝 s� t錸g l阯 20%. Sau khi l阯 c 40, nh鎛g tg th叻ng kinh nghi甿 s� b� x骯 b�", MasterName )
	LuaFnSendSystemMail( sceneId, SelfName, str )
	--LuaFnSendNormalMail( sceneId, selfId, SelfName, str )
	CallScriptFunction( SCENE_SCRIPT_ID, "PlaySoundEffect", sceneId, selfId, 66 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 18, 1000 )
end

--**********************************
--同意拜师
--**********************************
function x806008_OnConfirm( sceneId, selfId, targetId )
	--tId 喧ng即将成为师傅to� 鸬 玩家
	local tId
	if LuaFnHasTeam( sceneId, selfId ) == 0 then
		return
	end
	if LuaFnGetTeamSize( sceneId, selfId ) ~= 2 then
		return
	end
	if LuaFnGetTeamSceneMemberCount( sceneId, selfId ) ~= 1 then
		return
	end
	tId	= LuaFnGetTeamSceneMember( sceneId, selfId, 0 )

	--徒弟
	x806008_MsgBox( sceneId, selfId, targetId, "  Ng呓i 疸 鸢ng � b醝 鸠i ph呓ng l鄊 s� ph�" )
	Msg2Player( sceneId, selfId, "Ng呓i 疸 鸢ng � b醝 鸠i ph呓ng l鄊 s� ph�", MSG2PLAYER_PARA )
	--师傅
	x806008_MsgBox( sceneId, tId, targetId, "  携i ph呓ng 疸 鸢ng � b醝 ng呓i l鄊 s� ph�" )
	Msg2Player( sceneId, tId, "携i ph呓ng 疸 鸢ng � b醝 ng呓i l鄊 s� ph�", MSG2PLAYER_PARA )

	if x806008_CheckAccept( sceneId, tId, targetId ) > 0 then
		x806008_OnSubmit( sceneId, selfId, targetId, tId )
	end
end

--**********************************
--拒绝拜师
--**********************************
function x806008_OnCancel( sceneId, selfId, targetId )
	--tId 喧ng即将成为师傅to� 鸬 玩家
	local tId
	if LuaFnHasTeam( sceneId, selfId ) == 0 then
		return
	end
	if LuaFnGetTeamSize( sceneId, selfId ) ~= 2 then
		return
	end
	if LuaFnGetTeamSceneMemberCount( sceneId, selfId ) ~= 1 then
		return
	end
	tId	= LuaFnGetTeamSceneMember( sceneId, selfId, 0 )

	--徒弟
	x806008_MsgBox( sceneId, selfId, targetId, "  Ng呓i 疸 c� tuy畉 b醝 鸠i ph呓ng l鄊 s� ph�" )
	Msg2Player( sceneId, selfId, "Ng呓i 疸 c� tuy畉 b醝 鸠i ph呓ng l鄊 s� ph�", MSG2PLAYER_PARA )
	--师傅
	x806008_MsgBox( sceneId, tId, targetId, "  携i ph呓ng 疸 c� tuy畉 b醝 ng呓i l鄊 s� ph�" )
	Msg2Player( sceneId, tId, "携i ph呓ng 疸 c� tuy畉 b醝 ng呓i l鄊 s� ph�", MSG2PLAYER_PARA )
end

--**********************************
--对话窗口信息提示
--**********************************
function x806008_MsgBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--醒目信息提示
--**********************************
function x806008_MsgTip( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
