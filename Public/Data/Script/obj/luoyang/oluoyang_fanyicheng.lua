--L誧 D呓ngNPC
--范移城
--普通

x000143_g_ScriptId	= 143
x000143_g_EventList	= { 808008, 808009 }

--**********************************
--事件交互入口
--**********************************
function x000143_OnDefaultEvent( sceneId, selfId, targetId )

	BeginEvent( sceneId )
		AddText( sceneId, "  Ta l� di d鈔 ti猵 疸i s�, n猽 c醕 h� v譨 di d鈔 皙n 疴y, c� c gi鷓 疝 g� th� h銀 l阯 ti猲g." )
		for i, eventId in x000143_g_EventList do
			CallScriptFunction( eventId, "OnEnumerate", sceneId, selfId, targetId )
		end
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

end

--**********************************
--事件列表选中m祎 项
--**********************************
function x000143_OnEventRequest( sceneId, selfId, targetId, eventId )

	for i, findId in x000143_g_EventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
			return
		end
	end

end
