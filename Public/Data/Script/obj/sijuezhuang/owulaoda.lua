--缥缈峰副本....
--乌老大对话脚本....

--脚本号
x893072_g_ScriptId = 893072

--副本逻辑脚本号....
x893072_g_FuBenScriptId = 893063

--战败乌老大对话脚本号....
x893072_g_LossScriptId = 893075

--**********************************
--任务入口函数....
--**********************************
function x893072_OnDefaultEvent( sceneId, selfId, targetId )

	BeginEvent(sceneId)

		AddText( sceneId, "Noi n鄖 ch韓h l� T?n V?n s? t?i - T鈟 V?n C醕 . Theo ta di?u tra  tin t?c, T?n V?n c� Ch鷆 ?nh Di陁 H?ng v� Kim S Cu皀g V� l� hai d?i tuy?t k?.#r Ch鷆 ?nh Di陁 H?ng s? g鈟 thuong t?n l?n l阯 c醕 h? v� ch韓h m靚h d?i ngu c?a m靚h." )
		AddText( sceneId, "Kim S Cu皀g V� d馻 v鄌 h癷 鈓 phi阯 瓞 c叨ng h骯 c鬾g l馽 c黙 T V. Nghe n骾 c� ng叨i 疸 b� m m課g trong m祎 chi陁 c黙 h, uy l馽 v� c鵱g!#r C醕 ng呓i chu b� t痶 , cho ta bi猼, ta s� d鏽 T V ra!" )

		if 1 == CallScriptFunction( x893070_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "TaoQin" ) then
		    AddNumText( sceneId, x893072_g_ScriptId, "Khi陁 chi猲 T V", 10, 1 )
		end

		--判断当前是否可以挑战李秋水....	
		if 0 ~= CallScriptFunction( x893072_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "PangQi" ) then
		    AddNumText( sceneId, x893072_g_ScriptId, "衖 ti猵 v鄌 trong", 10, 2 )
		end

	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end

--**********************************
--事件列表选中一项
--**********************************
function x893072_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 1 then

	--如果正在激活BOSS则返回....
	if 1 == CallScriptFunction( x893072_g_FuBenScriptId, "IsSJZTimerRunning", sceneId ) then
		return
	end

	--是不是队长....
	if GetTeamLeader(sceneId,selfId) ~= selfId then
		BeginEvent(sceneId)
			AddText( sceneId, "#{PMF_20080521_07}" )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--如果正在和别的BOSSChi猲 黏u 则返回....
	local ret, msg = CallScriptFunction( x893072_g_FuBenScriptId, "CheckHaveBOSS", sceneId )
	if 1 == ret then
		BeginEvent(sceneId)
			AddText( sceneId, msg )
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end

	--判断当前是否可以挑战乌老大....	
		if 1 ~= CallScriptFunction( x893072_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "TaoQin" ) then
			BeginEvent(sceneId)
				AddText( sceneId, "#{PMF_20080521_11}" )
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
		--开启缥缈峰计时器来激活自己....
		CallScriptFunction( x893072_g_FuBenScriptId, "OpenSJZTimer", sceneId, 7, x893072_g_ScriptId, -1 ,-1 )

	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)
  end

   if GetNumText() == 2 then
	SetPos(sceneId, selfId, 28, 57)
  end

end

--**********************************
--缥缈峰计时器的OnTimer....
--**********************************
function x893072_OnSJZTimer( sceneId, step, data1, data2 )

	if 7 == step then
		CallScriptFunction( x893072_g_FuBenScriptId, "TipAllHuman", sceneId, "Chi猲 黏u 5 gi鈟 sau b 馥u." )
		return
	end

	if 6 == step then
		CallScriptFunction( x893072_g_FuBenScriptId, "TipAllHuman", sceneId, "Chi猲 黏u 4 gi鈟 sau b 馥u." )
		return
	end

	if 5 == step then
		CallScriptFunction( x893072_g_FuBenScriptId, "TipAllHuman", sceneId, "Chi猲 黏u 3 gi鈟 sau b 馥u." )
		return
	end

	if 4 == step then
		CallScriptFunction( x893072_g_FuBenScriptId, "TipAllHuman", sceneId, "Chi猲 黏u 2 gi鈟 sau b 馥u." )
		return
	end

	if 3 == step then
		CallScriptFunction( x893072_g_FuBenScriptId, "TipAllHuman", sceneId, "Chi猲 黏u 1 gi鈟 sau b 馥u." )
		return
	end

	if 2 == step then
		--提示Chi猲 黏u b 馥u.....
		CallScriptFunction( x893072_g_FuBenScriptId, "TipAllHuman", sceneId, "Chi猲 黏u b 馥u." )
		--删除NPC....
		--CallScriptFunction( x893072_g_FuBenScriptId, "DeleteBOSS", sceneId, "TaoQin_NPC" )
		return
	end

	if 1 == step then
		--建立BOSS....
		CallScriptFunction( x893072_g_FuBenScriptId, "CreateBOSS", sceneId, "TaoQin_BOSS", -1, -1 )
		return
	end

end
