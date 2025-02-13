--L誧 D呓ngNPC
--神医
--普通

--脚本号
x000064_g_scriptId = 000064

--所拥有to� 鸬 事件ID列表
x000064_g_eventList={701603}	

-- C 加怒气to� 鸬 特殊NPC
x000064_g_SpecialNPC = "Long B� Thi阯"
x000064_g_SpecialNPC2 = "孙荼"
x000064_g_SpecialNPC3 = "琉宸"

--Th鄋h ph� 里没有免费无敌功能to� 鸬 特殊NPC
x000064_g_SpecialNPC_City = "L� Ho鄋g Li阯"

--Tr� li畊设定
--当玩家to� 鸬 等cT読 10c以下to� 鸬 时候,Tr� li畊不收费；
--大于等于10c以上收取to� 鸬 费用为: 
--Tr� li畊费用＝(玩家最大生命值－当前生命值)×a+(玩家最大蓝值－当前蓝值)×b
--a、bT読 不同等c下to� 鸬 系数规定如下: 等c、a系数、b系数
x000064_g_rat	=	{
	{"0~9",0,0},	{"10~19",0.0079375,0.02480469},
	{"20~29",0.018375,0.05742188},	{"30~39",0.0313125,0.09785157},
	{"40~49",0.04675,0.14609376},		{"50~59",0.0646875,0.20214845},
	{"60~69",0.085125,0.26601564},	{"70~79",0.1080625,0.33769533},
	{"80~89",0.1335,0.41718752},	  {"90~99",0.162,0.50625},
	{"100~109",0.3,0.8},	          {"110~119",0.352,0.935}, 
	{"120~129",0.408,1.08},	      {"130~139",0.468,1.235}, 
	{"140~149",0.532,1.4}	
	}

--**********************************
--事件列表
--**********************************
function x000064_UpdateEventList( sceneId, selfId, targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"#{OBJ_luoyang_0019}")
		AddNumText(sceneId,x000064_g_scriptId,"Tr� li畊",6,0)
	EndEvent(sceneId)
	for i, eventId in x000064_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x000064_OnDefaultEvent( sceneId, selfId,targetId )
	x000064_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中m祎 项
--**********************************
function x000064_OnEventRequest( sceneId, selfId, targetId, eventId )

	--计算恢复血和气费用
	local	gld	= x000064_CalcMoney_hpmp( sceneId, selfId )
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
		gld	= x000064_CalcMoney_hpmp( sceneId, selfId )
		
		--  餴琺到交子和金钱数目
		local nMoneyJZ = GetMoneyJZ ( sceneId, selfId )
		local nMoney = GetMoney ( sceneId, selfId )
		
		--检查玩家喧ng否有足够to� 鸬 现金
		if (nMoneyJZ + nMoney >= gld) then
			--扣钱
			LuaFnCostMoneyWithPriority (sceneId, selfId, gld)
			--恢复血和气
			x000064_Restore_hpmp( sceneId, selfId, targetId )			
			return
		
		--钱不够	
		else		
			BeginEvent( sceneId )
				AddText( sceneId, "  C醕 h� kh鬾g 瘘 ng鈔 l唼ng" )
				EndEvent( sceneId )
			DispatchMissionTips( sceneId, selfId )
		end
	end
	
	--加血
	if key == 0 then
		if GetHp( sceneId, selfId ) == GetMaxHp( sceneId, selfId ) and
			 GetMp( sceneId, selfId ) == GetMaxMp( sceneId, selfId ) then
			BeginEvent( sceneId )
			AddText( sceneId, "  Ng呓i hi畁 r kh鰁 m課h, kh鬾g c ch鎍 tr�!" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			
			--Hu� b鲋付ㄍ婕疑砩蟭o� 鸬 所有敌对可驱散驻留效果
			LuaFnDispelAllHostileImpacts( sceneId, selfId )
			return
		end
	
		if gld <= 0 then
			x000064_Restore_hpmp( sceneId, selfId, targetId )
		else
			BeginEvent( sceneId )
				AddText( sceneId, "  C醕 h� ph鋓 tr� #G#{_EXCHG"..gld.."}#W 鞋 h癷 ph鴆 Huy猼 v� kh�, c醕 h� c� 鸢ng � ch鎍 tr� kh鬾g?" )
				AddNumText( sceneId, x000064_g_scriptId, "C�", -1, 1001 )
				AddNumText( sceneId, x000064_g_scriptId, "Kh鬾g", -1, 1000 )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
		end
	else
		for i, findId in x000064_g_eventList do
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
function x000064_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000064_g_eventList do
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
function x000064_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后,要Tr� v玁PCto� 鸬 事件列表
	for i, findId in x000064_g_eventList do
		if missionScriptId == findId then
			x000064_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续(已经接了任务)
--**********************************
function x000064_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000064_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完to� 鸬 任务
--**********************************
function x000064_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x000064_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x000064_OnDie( sceneId, selfId, killerId )
end

--**********************************
--恢复血和气
--**********************************
function x000064_Restore_hpmp( sceneId, selfId, targetId )
	RestoreHp( sceneId, selfId )
	RestoreMp( sceneId, selfId )
	
	local msg = ""
	-- 判断该npc喧ng否喧ng龙霸天
	if LuaFnGetName( sceneId, targetId ) == x000064_g_SpecialNPC 
		or LuaFnGetName( sceneId, targetId ) == x000064_g_SpecialNPC2
		or LuaFnGetName( sceneId, targetId ) == x000064_g_SpecialNPC3 then
		RestoreRage( sceneId, selfId )
		msg = "Kh� huy猼 v� n� c黙 c醕 h� 疸 疬㧟 h癷 ph鴆 ho鄋 to鄋"
	else
		msg = "Huy猼 v� kh� 疸 h癷 ph鴆"
	end
	--Hu� b鲋付ㄍ婕疑砩蟭o� 鸬 所有敌对可驱散驻留效果
	LuaFnDispelAllHostileImpacts( sceneId, selfId )
	
	BeginEvent( sceneId )
		AddText( sceneId, msg );
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
--当玩家to� 鸬 等cT読 10c以下to� 鸬 时候,Tr� li畊不收费；
--大于等于10c以上收取to� 鸬 费用为: 
--Tr� li畊费用＝(玩家最大生命值－当前生命值)×a+(玩家最大蓝值－当前蓝值)×b
function x000064_CalcMoney_hpmp( sceneId, selfId )
  
  local PlayerMaxLevel = GetHumanMaxLevelLimit()
	local	level	= GetLevel( sceneId, selfId )
	if level < 10 then	--如果玩家等c<10,则不C 钱
		return 0
	elseif level > PlayerMaxLevel then
		level	= PlayerMaxLevel
	end

	local	rat		= x000064_g_rat[ floor(level/10) + 1 ]
	local hp		= GetHp( sceneId, selfId )
	local maxhp	= GetMaxHp( sceneId, selfId )
	local mp		= GetMp( sceneId, selfId )
	local maxmp	= GetMaxMp( sceneId, selfId )
	local	gld		= floor( (maxhp-hp) * rat[2] + (maxmp-mp) * rat[3] )
	if gld < 1 then
		gld				= 100
	end
	return gld
end
