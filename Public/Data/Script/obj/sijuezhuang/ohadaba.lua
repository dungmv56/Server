--缥缈峰副本....
--哈大霸对话脚本....

--脚本号
x893070_g_ScriptId = 893070

--副本逻辑脚本号....
x893070_g_FuBenScriptId = 893063

--**********************************
--任务入口函数....
--**********************************
function x893070_OnDefaultEvent( sceneId, selfId, targetId )

	BeginEvent(sceneId)
		AddText(sceneId,"Ph韆 tr呔c ch韓h l� T� Tuy畉 Trang. Ch鷑g ta ph鋓 餴 s鈛 v鄌 trong m緄 c� th� t靘 疬㧟 kho b醬. Tr呔c m l� T� Tuy畉 衖畁.")
		AddText(sceneId,"B阯 trong T� Tuy畉 衖畁 c� r nhi玼 h� v�. Nh遪g m祎 khi 疸 nghe th ti猲g chu鬾g, h� s� r秈 餴. Ta c� th� khi猲 th鄋h vi阯 c chi猲 trong 鸬i ng� t鄋g h靚h v鄌 疳nh chu鬾g. L鷆 痼 m緄 c� th� x鬾g v鄌.")

		--判断当前是否可以挑战....	
		if 1 == CallScriptFunction( x893070_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "MinMo" ) then
		AddText(sceneId,"H� v� trong 餴畁 疸 kh鬾g c騨, ta 疬㧟 T� Tuy畉 th� sinh M鏽 M 疬a t緄, m鱥 ng叨i 皤u b� h b gi�, 瓞 ta t緄 閜 h鰅 h kho b醬 � n絠 n鄌. H th叨ng th韈h L� B誧h  [ T呓ng Ti猲 T豼 ], m瞚 l s� d鴑g tuy畉 k� 皤u t錸g g 痿i l唼ng s醫 th呓ng. M鱥 ng叨i ch� c ch� � n� tr醤h h khi h ph醫 ra T呓ng Ti猲 T豼, sau 痼 tho鋓 m醝 b gi� h kh鬾g l� v 皤!")
		    AddNumText( sceneId, x893070_g_ScriptId, "Khi陁 chi猲 M鏽 M", 10, 1 )
		end
		--判断当前是否挑战完毕之后传送....	
		if 0 ~= CallScriptFunction( x893070_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "QinYun" ) then
		    AddNumText( sceneId, x893070_g_ScriptId, "衖 ti猵 v鄌 trong", 10, 2 )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end

--**********************************
--事件列表选中一项
--**********************************
function x893070_OnEventRequest( sceneId, selfId, targetId, eventId )

   if GetNumText() == 1 then

	--如果正在激活BOSS则返回....
	if 1 == CallScriptFunction( x893070_g_FuBenScriptId, "IsSJZTimerRunning", sceneId ) then
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
	local ret, msg = CallScriptFunction( x893070_g_FuBenScriptId, "CheckHaveBOSS", sceneId )
	if 1 == ret then
		BeginEvent(sceneId)
			AddText( sceneId, msg )
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end

	--判断当前是否可以挑战桑土公....	
	if 1 ~= CallScriptFunction( x893070_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "MinMo" ) then
		BeginEvent(sceneId)
			AddText( sceneId, "Ng呓i 疸 khi陁 chi猲." )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--开启缥缈峰计时器来激活自己....
	CallScriptFunction( x893070_g_FuBenScriptId, "OpenSJZTimer", sceneId, 7, x893070_g_ScriptId, -1 ,-1 )

	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)
  end

   if GetNumText() == 2 then
	SetPos(sceneId, selfId, 101, 52)

  end

end

--**********************************
--缥缈峰计时器的OnTimer....
--**********************************
function x893070_OnSJZTimer( sceneId, step, data1, data2 )

	if 7 == step then
		CallScriptFunction( x893070_g_FuBenScriptId, "TipAllHuman", sceneId, "Chi猲 黏u 5 gi鈟 sau b 馥u." )
		return
	end

	if 6 == step then
		CallScriptFunction( x893070_g_FuBenScriptId, "TipAllHuman", sceneId, "Chi猲 黏u 4 gi鈟 sau b 馥u." )
		return
	end

	if 5 == step then
		CallScriptFunction( x893070_g_FuBenScriptId, "TipAllHuman", sceneId, "Chi猲 黏u 3 gi鈟 sau b 馥u." )
		return
	end

	if 4 == step then
		CallScriptFunction( x893070_g_FuBenScriptId, "TipAllHuman", sceneId, "Chi猲 黏u 2 gi鈟 sau b 馥u." )
		return
	end

	if 3 == step then
		CallScriptFunction( x893070_g_FuBenScriptId, "TipAllHuman", sceneId, "Chi猲 黏u 1 gi鈟 sau b 馥u." )
		return
	end

	if 2 == step then
		--提示Chi猲 黏u b 馥u.....
		CallScriptFunction( x893070_g_FuBenScriptId, "TipAllHuman", sceneId, "Chi猲 黏u b 馥u." )
		--删除NPC....
		--CallScriptFunction( x893070_g_FuBenScriptId, "DeleteBOSS", sceneId, "MinMo_NPC" )
		return
	end

	if 1 == step then
		--建立BOSS....
		CallScriptFunction( x893070_g_FuBenScriptId, "CreateBOSS", sceneId, "MinMo_BOSS", -1, -1 )
		return
	end

end
