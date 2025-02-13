--同门相助
--花费m祎 些门派贡献来直接完成m祎 环Nhi甿 v� s� m鬾....

x229011_g_scriptId = 229011

x229011_g_strHelpFinishedText = "  邪ng m鬾 g n課, ph鋓 ra tay t呓ng tr�, nhi甿 v� c黙 c醕 h� ta 疸 giao cho 鸢ng m鬾 kh醕 餴 ho鄋 th鄋h r癷. #r#Gnhi甿 v� ho鄋 th鄋h! #W"

--**********************************
--任务入口函数
--**********************************
function x229011_OnDefaultEvent( sceneId, selfId, targetId, menpaiId, numTextId )

	if numTextId == 1 then

		BeginEvent( sceneId )

			if IsHaveMission(sceneId,selfId,MENPAI_SHIMEN_MISID[menpaiId+1]) <= 0 then
				AddText( sceneId, "H靚h nh� c醕 h� kh鬾g c� ti猵 nh nhi甿 v� s� m鬾.")
			else
				local strText = "  V課 doanh s� m鬾, ng叨i ng叨i c� ph鷆! M眎 ng鄖 nh鎛g 甬 t� kh鬾g ng譶g n� l馽 l鄊 nhi甿 v� s� m鬾 ch鷑g t鬷 s� th叻ng cho ph th叻ng qu� gi�, 疬絥g nhi阯, 甬 t� khi l鄊 nhi甿 v� s� m鬾 g ph鋓 kh� kh錸 ch鷑g t鬷 s� t t鈓 tr� gi鷓. #Rc醕 h� quy猼 鸶nh ti陁 hao #G%d 餴琺 #W c黙 鸬 c痭g hi猲 s� m鬾, v� nh鎛g s� huynh s� t� c� th� gi鷓 c醕 h� ho鄋 th鄋h nhi甿 v� s� m鬾 hi畁 gi� nh�?"
				strText = format( strText, x229011_GetHelpFinishNeed( sceneId, selfId ) )
				AddText( sceneId, strText )
				AddNumText( sceneId, x229011_g_scriptId, "Duy畉", 6, 2 )
				AddNumText( sceneId, x229011_g_scriptId, "R秈 kh鰅", 8, 3 )
			end

		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	elseif numTextId == 2 then

		CallScriptFunction( MENPAI_SHIMEN_SCRIPTID[menpaiId+1], "HelpFinishOneHuan", sceneId, selfId, targetId )

	elseif numTextId == 3 then

		--关闭对话窗口....
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1000)
		
	end

end

--**********************************
--列举事件
--**********************************
function x229011_OnEnumerate( sceneId, selfId, targetId, menpaiId )

	--如果玩家不喧ng该本门派to� 鸬 就不显示....
	if menpaiId == GetMenPai( sceneId, selfId ) then
		AddNumText( sceneId, x229011_g_scriptId, "邪ng m鬾 t呓ng tr�", 6, 1 );
	end

end

--**********************************
--计算同门相助所需to� 鸬 门派贡献....
--**********************************
function x229011_GetHelpFinishNeed( sceneId, selfId )

	--同门相助所需贡献度=完成20环to� 鸬 贡献度 * 80%
	
	--每环实际奖励贡献度=(玩家等c-基础等c)* 等c影响参数 + 基础贡献度
	--完成20环to� 鸬 贡献度=(玩家等c-基础等c)* 等c影响参数 * 20 + 20环基础贡献度总和(=40)
	
	local level = GetLevel(sceneId, selfId)
	local need = (level - 10) * 0.05 * 20 + 40
	need = need * 0.8
	need = floor( need )

	return need

end

--**********************************
--检测并扣除同门相助所需to� 鸬 门派贡献....
--**********************************
function x229011_CheckAndDepleteHelpFinishMenPaiPoint( sceneId, selfId, targetId )

	local needPoint = x229011_GetHelpFinishNeed( sceneId, selfId )
	local menpaiPoint = GetHumanMenpaiPoint( sceneId, selfId )

	if menpaiPoint < needPoint then
		BeginEvent(sceneId)
			AddText( sceneId, "  H靚h nh� c醕 h� kh鬾g c� 瘘 餴琺 c痭g hi猲 s� m鬾, h銀 v� s� ph� l鄊 th阭 t� vi甤, c醕 鸢ng m鬾 s� to鄋 l馽 gi鷓 c醕 h�." )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
		return 0
	else
		SetHumanMenpaiPoint( sceneId, selfId, menpaiPoint-needPoint )
		return 1
	end

end
