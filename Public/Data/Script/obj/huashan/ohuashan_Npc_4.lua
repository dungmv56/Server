--华山医疗NPC
--神医
--普通

--脚本号
x125004_g_scriptId = 125004

--所拥有to� 鸬 事件ID列表
x125004_g_eventList={701603}			-- “珍兽Tr� li畊”脚本

--游医脚本编号
x125004_g_healScriptId = 000064

--Tr� li畊设定
--当玩家to� 鸬 等级T読 10级以下to� 鸬 时候,Tr� li畊不收费；
--大于等于10级以上收取to� 鸬 费用为: 
--Tr� li畊费用＝(玩家最大生命值－当前生命值)×a+(玩家最大蓝值－当前蓝值)×b
--a、bT読 不同等级下to� 鸬 系数规定如下: 等级、a系数、b系数
--x125004_g_rat	=	{
--	{"0~9",0,0},	{"10~19",0.0079375,0.02480469},
--	{"20~29",0.018375,0.05742188},	{"30~39",0.0313125,0.09785157},
--	{"40~49",0.04675,0.14609376},		{"50~59",0.0646875,0.20214845},
--	{"60~69",0.085125,0.26601564},	{"70~79",0.1080625,0.33769533},
--	{"80~89",0.1335,0.41718752},	  {"90~99",0.162,0.50625}, 
--	{"100~109",0.2,0.6},	          {"110~119",0.2354,0.704}, 
--	{"120~129",0.2736,0.816},	      {"130~139",0.3146,0.936}, 
--	{"140~149",0.3584,1.064}	 
--	}
--改成与校场价格m祎 样 TT:45070

--**********************************
--事件列表
--**********************************
function x125004_UpdateEventList( sceneId, selfId, targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"#{OBJ_luoyang_0019}")
		-- AddNumText( sceneId, x125004_g_scriptId, "免费无敌", 6, 10 )
		AddNumText(sceneId,x125004_g_scriptId,"Tr� li畊",6,0)
	EndEvent(sceneId)
	for i, eventId in x125004_g_eventList do
		-- 调用“珍兽Tr� li畊”脚本
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x125004_OnDefaultEvent( sceneId, selfId,targetId )
	x125004_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中m祎 项
--**********************************
function x125004_OnEventRequest( sceneId, selfId, targetId, eventId )

	if GetNumText() == 10 then
			
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 50, 0 )
			return
	end

	--计算恢复血和气费用
	--local	gld	= x125004_CalcMoney_hpmp( sceneId, selfId )
	local	gld = CallScriptFunction( x125004_g_healScriptId, "CalcMoney_hpmp",sceneId, selfId, targetId )* 0.1
local	key	= GetNumText()

	if key == 1000 then	--不愿再Tr� li畊
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
		return
	end

	if key == 1001 then	--确认要Tr� li畊
		--计算恢复血和气费用
		--gld	= x125004_CalcMoney_hpmp( sceneId, selfId )
		gld = CallScriptFunction( x125004_g_healScriptId, "CalcMoney_hpmp",sceneId, selfId, targetId )* 0.1

		--  餴琺到交子和金钱数目
		local nMoneyJZ = GetMoneyJZ ( sceneId, selfId )
		local nMoney = GetMoney ( sceneId, selfId )
		
		--检查玩家喧ng否有足够to� 鸬 现金
		if (nMoneyJZ + nMoney >= gld) then
			--扣钱
			LuaFnCostMoneyWithPriority (sceneId, selfId, gld)
			--恢复血和气		
			x125004_Restore_hpmp ( sceneId, selfId, targetId )			
			return
		
		--钱不够	
		else		
			BeginEvent( sceneId )
				AddText( sceneId, "  Ng鈔 l唼ng c黙 c醕 h� kh鬾g 瘘!" )
				EndEvent( sceneId )
			DispatchMissionTips( sceneId, selfId )
		end
	end
	
	--加血
	if key == 0 then
		if GetHp( sceneId, selfId ) == GetMaxHp( sceneId, selfId ) and
			 GetMp( sceneId, selfId ) == GetMaxMp( sceneId, selfId ) then
			BeginEvent( sceneId )
			AddText( sceneId, "  Ng呓i hi畁 r kho� m課h, kh鬾g c ch鎍 tr�!" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			
			--H鼀 b鲋付ㄍ婕疑砩蟭o� 鸬 所有敌对可驱散驻留效果
			LuaFnDispelAllHostileImpacts( sceneId, selfId )
			return
		end
	
		if gld <= 0 then
			x125004_Restore_hpmp( sceneId, selfId, targetId )
		else
			BeginEvent( sceneId )
				AddText( sceneId, "  C醕 h� c t痭 #G#{_EXCHG"..gld.."}#W t緄 h癷 ph鴆 huy猼 v� kh�, x醕 鸶nh c� c ch鎍 tr� kh鬾g?" )
				AddNumText( sceneId, x125004_g_scriptId, "喧ng", -1, 1001 )
				AddNumText( sceneId, x125004_g_scriptId, "Sai", -1, 1000 )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
		end
	else
		for i, findId in x125004_g_eventList do
			if eventId == findId then
				-- 调用“珍兽Tr� li畊”脚本
				CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText() )	--GetNumText()喧ngaddnumtext中最后to� 鸬 变量
				return
			end
		end
	end
end

--**********************************
--Ti猵 th薔PCto� 鸬 任务
--**********************************
function x125004_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x125004_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				-- 调用“珍兽Tr� li畊”脚本
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			end
			return
		end
	end
end

--**********************************
--拒绝此NPCto� 鸬 任务
--**********************************
function x125004_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后,要Tr� v玁PCto� 鸬 事件列表
	for i, findId in x125004_g_eventList do
		if missionScriptId == findId then
			x125004_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续(已经接了任务)
--**********************************
function x125004_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x125004_g_eventList do
		if missionScriptId == findId then
			-- 调用“珍兽Tr� li畊”脚本
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完to� 鸬 任务
--**********************************
function x125004_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x125004_g_eventList do
		if missionScriptId == findId then
			-- 调用“珍兽Tr� li畊”脚本
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x125004_OnDie( sceneId, selfId, killerId )
end

--**********************************
--恢复血和气
--**********************************
function x125004_Restore_hpmp( sceneId, selfId, targetId )
	RestoreHp( sceneId, selfId )
	RestoreMp( sceneId, selfId )
	--H鼀 b鲋付ㄍ婕疑砩蟭o� 鸬 所有敌对可驱散驻留效果
	LuaFnDispelAllHostileImpacts( sceneId, selfId )
	
	BeginEvent( sceneId )
		AddText( sceneId, "Huy猼 v� kh� c黙 ng呓i 疸 疬㧟 h癷 ph鴆" );
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
	
	BeginUICommand( sceneId )
	UICommand_AddInt( sceneId, targetId )
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId, 1000 )
end

--**********************************
--计算恢复血和气费用
--**********************************
--当玩家to� 鸬 等级T読 10级以下to� 鸬 时候,Tr� li畊不收费；
--大于等于10级以上收取to� 鸬 费用为: 
--Tr� li畊费用＝(玩家最大生命值－当前生命值)×a+(玩家最大蓝值－当前蓝值)×b
--function x125004_CalcMoney_hpmp( sceneId, selfId )
--	
--	local PlayerMaxLevel = GetHumanMaxLevelLimit()
--	local	level	= GetLevel( sceneId, selfId )
--	if level < 10 then	--如果玩家等级<10,则不C 钱
--		return 0
--	elseif level > PlayerMaxLevel then
--		level	= PlayerMaxLevel
--	end
--
--	local	rat		= x125004_g_rat[ floor(level/10) + 1 ]
--	local hp		= GetHp( sceneId, selfId )
--	local maxhp	= GetMaxHp( sceneId, selfId )
--	local mp		= GetMp( sceneId, selfId )
--	local maxmp	= GetMaxMp( sceneId, selfId )
--	local	gld		= floor( (maxhp-hp) * rat[2] + (maxmp-mp) * rat[3] )
--	if gld < 1 then
--		gld				= 1
--	end
--	return gld
--end
