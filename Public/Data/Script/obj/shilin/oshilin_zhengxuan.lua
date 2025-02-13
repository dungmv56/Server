--石林 郑玄

--脚本号
x026000_g_scriptId = 026000

--所拥有to� 鸬 事件ID列表
x026000_g_eventList={212103, 212104}

--**********************************
--事件列表
--**********************************
function x026000_UpdateEventList( sceneId, selfId,targetId )
	
	BeginEvent(sceneId)
		AddText(sceneId, "  $N, ta bi猼 ng呓i, t阯 tu眎 ng呓i 疸 truy玭 kh 姓i L�, r vui 疬㧟 g ng呓i � Th誧h L鈓, nh遪g hi畁 gi� Th誧h L鈓 l� 1 n絠 v� c鵱g nguy hi琺. L鄊 g� ng呓i c鹡g ph鋓 c th.")
		--AddNumText(sceneId, x026000_g_scriptId,"我想去盐湖", 9, 6)
		for i, eventId in x026000_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end

		if	IsHaveMission(sceneId,selfId,602) > 0	then
			AddNumText(sceneId, x026000_g_scriptId,"C鈛 chuy畁 tuy畉 v鱪g", 6, 1)
			x026000_nDescIndex = 1
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x026000_OnDefaultEvent( sceneId, selfId,targetId )
	x026000_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中m祎 项
--**********************************
function x026000_OnEventRequest( sceneId, selfId, targetId, eventId )
	local	arg	= GetNumText()
	if arg == 6 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 415, 45,34 )
		return
	end
	if eventId == x026000_g_scriptId  then
		BeginEvent(sceneId)
			if x026000_nDescIndex == 1 then
				AddText(sceneId, "#{Lua_Shilin_002}")
				AddNumText(sceneId, x026000_g_scriptId,"C醝 g�? B畁h d竎h kh黱g khi猵! Th� sau 痼?", 8, 1)
			elseif x026000_nDescIndex == 2 then
				AddText(sceneId, "#{Lua_Shilin_003}")
				AddNumText(sceneId, x026000_g_scriptId,"Xem ra Y琻 s� 疸 c製 Vi阯 Nguy畉 Th鬾...ta n骾 v kh鬾g 瘊ng sao?", 8, 1)
			elseif x026000_nDescIndex == 3 then
				AddText(sceneId, "#{Lua_Shilin_004}")
			end
			x026000_nDescIndex = x026000_nDescIndex +1
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		
		if x026000_nDescIndex == 4 then
			-- 读到这里就算Ho鄋 t nhi甿 v�
			local misIndex=GetMissionIndexByID(sceneId,selfId,602)
			local num0 = GetMissionParam(sceneId,selfId,misIndex,0)
			
			if num0 < 1 then				--如果Ch遖 瘘任务完成 餴琺条件
				SetMissionByIndex(sceneId,selfId,misIndex,0,1)		--任务变量第m祎 位增加1
				BeginEvent(sceneId)										--显示提示信息
					AddText(sceneId, "秀 nghe xong chuy畁 c黙 Tr竛h Huy玭: 1/1");
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
			end
		end
	end
		
	if	IsHaveMission(sceneId,selfId,602) <= 0	then
		CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	
	for i, findId in x026000_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
		end
	end
end

--**********************************
--Ti猵 th薔PCto� 鸬 任务
--**********************************
function x026000_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x026000_g_eventList do
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
function x026000_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后,要Tr� v玁PCto� 鸬 事件列表
	for i, findId in x026000_g_eventList do
		if missionScriptId == findId then
			x026000_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续(已经接了任务)
--**********************************
function x026000_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x026000_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完to� 鸬 任务
--**********************************
function x026000_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x026000_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x026000_OnDie( sceneId, selfId, killerId )
end
