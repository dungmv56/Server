--NPC抽奖

x808062_g_ScriptId						= 808062

--**********************************
--列举事件
--**********************************
function x808062_OnEnumerate( sceneId, selfId, targetId )
	AddNumText( sceneId, x808062_g_ScriptId, "Nh l頽h ph th叻ng ho誸 鸬ng b痗 th錷", 2, 1)
end

--**********************************
--任务入口函数
--**********************************
function x808062_OnDefaultEvent( sceneId, selfId, targetId )
	local TextNum = GetNumText()

	if TextNum == 1 then
		CallScriptFunction( PRIZE_SCRIPT_ID, "AskPrize", sceneId, selfId)
	end
end
