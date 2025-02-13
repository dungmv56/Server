--燕子坞 宋兵 没有什么实际功能

--脚本号
x402262_g_scriptId = 402262

--所拥有to� 鸬 事件ID列表
x402262_g_eventList={}	

--**********************************
--事件列表
--**********************************
function x402262_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		local nRand = random(4)
		local str = ""
		if nRand == 1  then
			str = "  Nghe n骾 l n鄖 ph鋘 t m秈 t緄 t� 鹫i 醕 nh鈔 ti猲 皙n 醡 s醫 H� Di阯 B醥 t呔ng qu鈔!"
		elseif nRand == 2 then
			str = "  H� Di阯 B醥 t呔ng qu鈔 c� nguy hi琺, m秈 c醕 ng呓i ch誽 nhanh 皙n k� h誱 餴 l阯 b鋙 h� h!"
		elseif nRand == 3 then
			str = "  H� Di阯 B醥 t呔ng qu鈔 l� ch鷑g ta 姓i T痭g hi猰 c�  h� t呔ng, h絥 n鎍 am hi瑄 thu� chi猲, c� h �, 姓i T痭g thu� qu鈔 t thg!"
		else
			str = "  N猽 ta c鹡g s� khinh c鬾g, nh 鸶nh h礽 th鋓  l� sen bay 皙n k� h誱 餴 l阯 b鋙 h� H� Di阯 B醥 t呔ng qu鈔!"
		end
		
		AddText(sceneId, str)		    				
		for i, eventId in x402262_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x402262_OnDefaultEvent( sceneId, selfId,targetId )
	x402262_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中m祎 项
--**********************************
function x402262_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x402262_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--Ti猵 th薔PCto� 鸬 任务
--**********************************
function x402262_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x402262_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId, targetId )
			end
			return
		end
	end
end

--**********************************
--拒绝此NPCto� 鸬 任务
--**********************************
function x402262_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后,要Tr� v玁PCto� 鸬 事件列表
	for i, findId in x402262_g_eventList do
		if missionScriptId == findId then
			x402262_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续(已经接了任务)
--**********************************
function x402262_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x402262_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完to� 鸬 任务
--**********************************
function x402262_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x402262_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x402262_OnDie( sceneId, selfId, killerId )

end

