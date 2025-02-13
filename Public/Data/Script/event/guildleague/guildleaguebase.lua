--帮会同 gi鈟基础功能

x650000_g_ScriptId = 650000;

function x650000_OnDefaultEvent( sceneId, selfId, targetId )
	local num = GetNumText()
	if num == 1 then
		--查看同 gi鈟列表
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1206)
	elseif num == 2 then
		--创建同 gi鈟
		if GetGuildPos(sceneId,selfId) ~= GUILD_POSITION_CHIEFTAIN then		
			BeginEvent(sceneId)
				AddText(sceneId,"#{TM_20080311_01}")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)	
		elseif LuaFnGetHumanGuildLeagueID( sceneId, selfId ) >= 0 then			
			BeginEvent(sceneId)
				AddText(sceneId,"#{TM_20080311_02}")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)	
		else
			BeginUICommand(sceneId)
				UICommand_AddInt(sceneId,targetId)
			EndUICommand(sceneId)
			DispatchUICommand(sceneId,selfId, 1207)
		end
	elseif num == 3 then
		--查看同 gi鈟信息
		if LuaFnGetHumanGuildLeagueID( sceneId, selfId ) >= 0 then
			BeginUICommand(sceneId)
				UICommand_AddInt(sceneId,targetId)
			EndUICommand(sceneId)
			DispatchUICommand(sceneId,selfId, 1208)
		else
			BeginEvent(sceneId)
				AddText(sceneId,"#{TM_20080311_13}")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)			
		end
	elseif num == 4 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{TM_20080320_02}")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end
end

function x650000_OnEnumerate( sceneId, selfId, targetId )
	AddNumText(sceneId, x650000_g_ScriptId, "Ki琺 tra 鸢ng minh li畉 bi瑄", 6, 1 )
	AddNumText(sceneId, x650000_g_ScriptId, "Th鄋h l 邪ng minh", 6, 2 )
	AddNumText(sceneId, x650000_g_ScriptId, "Ki琺 tra b眓 minh", 6, 3 )
	AddNumText(sceneId, x650000_g_ScriptId, "Gi緄 thi畊 邪ng Minh", 11, 4 )
end
