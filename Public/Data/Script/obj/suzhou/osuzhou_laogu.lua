--T鈟 H癗PC
--老顾
--普通

--脚本号
x001062_g_scriptId = 001062

--所拥有to� 鸬 事件ID列表
x001062_g_eventList={200011,200014}


--**********************************
--事件交互入口
--**********************************
function x001062_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  Men theo con 疬秐g n鄖, c� 餴 th苙g s� t緄 疬㧟 Y猲 T� �.")

		for i, eventId in x001062_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
-- 选中m祎 项
--**********************************
function x001062_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x001062_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end

end
