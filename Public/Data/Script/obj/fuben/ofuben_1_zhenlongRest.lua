--珍珑副本任务npc

--脚本号
x402001_g_scriptId = 402001


--所拥有to� 鸬 事件ID列表
x402001_g_eventList={401001}

--**********************************
--事件列表
--**********************************
function x402001_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	
		AddNumText( sceneId, x402001_g_scriptId, "Gi緄 thi畊 K� Cu礳", 11, 10 )
		AddNumText( sceneId, x402001_g_scriptId, "R秈 kh鰅 ph騨g ngh�", 9, 11 )
		AddNumText( sceneId, x402001_g_scriptId, "L鄊 sao 餺誸 k� thu 疬㧟 nhi玼 kinh nghi甿", 11, 512 )

		for i, findId in x402001_g_eventList do
			CallScriptFunction( x402001_g_eventList[i], "OnEnumerate",sceneId, selfId, targetId )
		end

	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x402001_OnDefaultEvent( sceneId, selfId,targetId )
	x402001_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中m祎 项
--**********************************
function x402001_OnEventRequest( sceneId, selfId, targetId, eventId )

	local Numtext = GetNumText()

	if Numtext == 10 then
		BeginEvent(sceneId)	
			AddText( sceneId, "#{function_help_063}" )	
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	elseif Numtext == 11 then
		BeginEvent(sceneId)	
			AddText( sceneId, "  N猽 鸬i ng� c黙 ng呓i 皤u � ph騨g ngh�, m� ng呓i l読 m祎 m靚h r秈 餴, b鱪 h� b穒 v kh鬾g th� ti猲 v鄌 v醤 c�. Ng呓i x醕 nh ph鋓 r秈 kh鰅 sao?" )
			AddNumText( sceneId, x402001_g_scriptId, "X醕 nh", 8, 12 )
			AddNumText( sceneId, x402001_g_scriptId, "Hu� b�", 8, 13 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	elseif Numtext == 12 then
		if sceneId == 518 then
			CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 1,175,145)
		elseif sceneId == 193 then
			CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 2,275,95)
		elseif sceneId == 418 or sceneId == 419 then
			CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 0,268,87)
		end
		return
	elseif Numtext == 13 then
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
		return
	elseif Numtext == 512 then
		BeginEvent(sceneId)	
			AddText( sceneId, "#{QJ_20080522_03}" )	
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	for i, findId in x402001_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end

end

--**********************************
--死亡事件
--**********************************
function x402001_OnDie( sceneId, selfId, killerId )
end
