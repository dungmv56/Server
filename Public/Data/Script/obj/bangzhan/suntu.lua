--帮战副本NPC A帮
--神医 孙荼
--普通

--脚本号
x402295_g_scriptId = 402295

--所拥有to� 鸬 事件ID列表
x402295_g_eventList={701603}

--游医脚本编号
x402295_g_healScriptId = 000064

--Tr� li畊设定 参见脚本000064

--**********************************
--事件列表
--**********************************
function x402295_UpdateEventList( sceneId, selfId, targetId )
	if CallScriptFunction(402047, "IsCommonAGuild", sceneId, selfId ) == 1 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{BHXZ_081103_23}")
			AddNumText(sceneId,x402295_g_scriptId,"Tr� li畊",6,0)
		EndEvent(sceneId)
		for i, eventId in x402295_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	else
		BeginEvent(sceneId);
			AddText( sceneId, "#{BHXZ_081103_20}" );
		EndEvent(sceneId);
		DispatchEventList(sceneId, selfId, targetId);
	end
end

--**********************************
--事件交互入口
--**********************************
function x402295_OnDefaultEvent( sceneId, selfId,targetId )
	x402295_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中m祎 项
--**********************************
function x402295_OnEventRequest( sceneId, selfId, targetId, eventId )
	local	gld =CallScriptFunction( x402295_g_healScriptId, "CalcMoney_hpmp",sceneId, selfId, targetId )* 0.1
	
	if CallScriptFunction(402047, "IsCommonAGuild", sceneId, selfId ) == 0 then
		return
	end

	local	key	= GetNumText()

	if key == 1000 then	--不愿再Tr� li畊
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
		return
	end
	if key == 1001 then	--确认要Tr� li畊
		gld =CallScriptFunction( x402295_g_healScriptId, "CalcMoney_hpmp",sceneId, selfId, targetId )* 0.1
		local money = GetMoney( sceneId, selfId )
		local JiaoZi = GetMoneyJZ( sceneId, selfId )
		gld = floor(gld)

		if money+JiaoZi < gld then
			BeginEvent( sceneId )
				AddText( sceneId, "#{BHXZ_081103_85}" )
				EndEvent( sceneId )
			DispatchMissionTips( sceneId, selfId )
		else
			local jz, jb = LuaFnCostMoneyWithPriority(sceneId, selfId, gld);
			if jz ~= -1 then
				CallScriptFunction( x402295_g_healScriptId, "Restore_hpmp",sceneId, selfId, targetId )
			end
		end
		return
	end
	
	--加血
	if key == 0 then
		if GetHp( sceneId, selfId ) == GetMaxHp( sceneId, selfId ) and
		GetRage( sceneId, selfId ) == GetMaxRage( sceneId, selfId ) and
		GetMp( sceneId, selfId ) == GetMaxMp( sceneId, selfId ) then
			BeginEvent( sceneId )
			AddText( sceneId, "#{BHXZ_081103_86}" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			
			--Hu� b鲋付ㄍ婕疑砩蟭o� 鸬 所有敌对可驱散驻留效果
			LuaFnDispelAllHostileImpacts( sceneId, selfId )
			return
		end
	
		if gld <= 0 then
			CallScriptFunction( x402295_g_healScriptId, "Restore_hpmp",sceneId, selfId, targetId )
			--x402295_Restore_hpmp( sceneId, selfId, targetId )
		else
			BeginEvent( sceneId )
			AddText( sceneId, "#{BHXZ_081103_87}#{_EXCHG"..gld.."}#{BHXZ_081103_88}" )
			AddNumText( sceneId, x402295_g_scriptId, "喧ng", -1, 1001 )
			AddNumText( sceneId, x402295_g_scriptId, "Sai", -1, 1000 )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
		end
	else
		for i, findId in x402295_g_eventList do
			if eventId == findId then
				CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText() )	--GetNumText()喧ngaddnumtext中最后to� 鸬 变量
				return
			end
		end
	end
end

--**********************************
--Ti猵 th薔PCto� 鸬 任务
--**********************************
function x402295_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x402295_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			end
			return
		end
	end
end

--**********************************
--拒绝此NPCto� 鸬 任务
--**********************************
function x402295_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后,要Tr� v玁PCto� 鸬 事件列表
	for i, findId in x402295_g_eventList do
		if missionScriptId == findId then
			x402295_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续(已经接了任务)
--**********************************
function x402295_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x402295_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完to� 鸬 任务
--**********************************
function x402295_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x402295_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x402295_OnDie( sceneId, selfId, killerId )
end
