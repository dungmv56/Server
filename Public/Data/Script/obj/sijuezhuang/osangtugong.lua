--缥缈峰副本....
--桑土公对话脚本....

--脚本号
x893071_g_ScriptId = 893071

--副本逻辑脚本号....
x893071_g_FuBenScriptId = 893063

--**********************************
--任务入口函数....
--**********************************
function x893071_OnDefaultEvent( sceneId, selfId, targetId )

	BeginEvent(sceneId)
		AddText( sceneId, "N絠 n鄖 ch韓h l� 朽o Thanh s� t読 - B鄋 Long C醕 . Giang h� 鸢n 鹫i 朽o Thanh hai b畁h t, kh鬾g th� nh靚 th g�. Nh遪g c鬾g phu v鏽 nh� c� l� T� Tuy畉 Trang trung t痠 c叨ng.#r 朽o Thanh ch錸 nu鬷 4 lo読 m h� c鵱g 10 lo読 thanh 遪g. Ch鷑g 鸠i 朽o Thanh trung th鄋h, t t鈓. N猽 trong chi猲 黏u xu hi畁 trong l秈 n骾, nh 鸶nh ph鋓 疳nh lui ch鷑g 馥u ti阯!" )
		AddText( sceneId, "M kh醕 h c騨 c� Tuy畉 k� 甬 nh -- Tam Phong L遳 V鈔. Sau khi s� d鴑g tuy畉 k�, 朽o Thanh xu qu� nh th, v� c鵱g hung 醕. Nghe n骾, k� n錸g n鄖 c� hi畊 裯g ph� tr醤, h鋙 h鋙 l㱮 d鴑g c� th� 餰m Tam Phong L遳 V鈔 ph� gi鋓!#r C醕 ng呓i chu b� t痶, cho ta bi猼, ta s� c� c醕h d鏽 d� 朽o Thanh ra!" )
		if 1 == CallScriptFunction( x893070_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "QinYun" ) then
		    AddNumText( sceneId, x893071_g_ScriptId, "Khi陁 chi猲 朽o Thanh", 10, 1 )
		end
		if 0 ~= CallScriptFunction( x893070_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "TaoQin" ) then
		    AddNumText( sceneId, x893071_g_ScriptId, "衖 ti猵 v鄌 trong", 10, 2 )
		end

	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end

--**********************************
--事件列表选中一项
--**********************************
function x893071_OnEventRequest( sceneId, selfId, targetId, eventId )
   if GetNumText() == 1 then
	--如果正在激活BOSS则返回....
	if 1 == CallScriptFunction( x893071_g_FuBenScriptId, "IsSJZTimerRunning", sceneId ) then
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
	local ret, msg = CallScriptFunction( x893071_g_FuBenScriptId, "CheckHaveBOSS", sceneId )
	if 1 == ret then
		BeginEvent(sceneId)
			AddText( sceneId, msg )
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end

	--判断当前是否可以挑战桑土公....	
	if 1 ~= CallScriptFunction( x893071_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "QinYun" ) then
		BeginEvent(sceneId)
			AddText( sceneId, "Ng呓i 疸 khi陁 chi猲." )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--开启缥缈峰计时器来激活自己....
	CallScriptFunction( x893071_g_FuBenScriptId, "OpenSJZTimer", sceneId, 7, x893071_g_ScriptId, -1, -1 )

	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)
  end

   if GetNumText() == 2 then
	SetPos(sceneId, selfId, 73, 91)
  end

end

--**********************************
--缥缈峰计时器的OnTimer....
--**********************************
function x893071_OnSJZTimer( sceneId, step, data1, data2 )

	if 7 == step then
		CallScriptFunction( x893071_g_FuBenScriptId, "TipAllHuman", sceneId, "Chi猲 黏u 5 gi鈟 sau b 馥u." )
		return
	end

	if 6 == step then
		CallScriptFunction( x893071_g_FuBenScriptId, "TipAllHuman", sceneId, "Chi猲 黏u 4 gi鈟 sau b 馥u." )
		return
	end

	if 5 == step then
		CallScriptFunction( x893071_g_FuBenScriptId, "TipAllHuman", sceneId, "Chi猲 黏u 3 gi鈟 sau b 馥u." )
		return
	end

	if 4 == step then
		CallScriptFunction( x893071_g_FuBenScriptId, "TipAllHuman", sceneId, "Chi猲 黏u 2 gi鈟 sau b 馥u." )
		return
	end

	if 3 == step then
		CallScriptFunction( x893071_g_FuBenScriptId, "TipAllHuman", sceneId, "Chi猲 黏u 1 gi鈟 sau b 馥u." )
		return
	end

	if 2 == step then
		--提示Chi猲 黏u b 馥u.....
		CallScriptFunction( x893071_g_FuBenScriptId, "TipAllHuman", sceneId, "Chi猲 黏u b 馥u." )
		--删除NPC....
		--CallScriptFunction( x893071_g_FuBenScriptId, "DeleteBOSS", sceneId, "QinYun_NPC" )
		return
	end

	if 1 == step then
		--建立BOSS....
		CallScriptFunction( x893071_g_FuBenScriptId, "CreateBOSS", sceneId, "QinYun_BOSS", -1, -1 )
		return
	end

end
