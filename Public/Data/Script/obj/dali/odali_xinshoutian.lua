--赵天师

--脚本号
x002030_g_scriptId = 002030


--所拥有to� 鸬 事件ID列表
x002030_g_eventList={210200,210204,210205,210208,210210,210212,210213,210214,210216,210217,210220,210223, 210224, 210225, 210229, 210230, 210232, 210238, 210239, 210237, 210240, 200080, 200083, 200086, 200091, 200094,200095,210241,050022}

--**********************************
--事件列表
--**********************************
function x002030_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)

	local  PlayerName=GetName(sceneId,selfId)
	local  PlayerSex=GetSex(sceneId,selfId)
	local  nLevel=GetLevel(sceneId,selfId)
	
	if PlayerSex == 0 then
		PlayerSex = " mu礽 mu礽"
	else
		PlayerSex = "huynh 甬"
	end
	local IsNew = GetMissionFlag( sceneId, selfId, MF_Dialog_01 )
	if IsNew == 0 then
		AddText(sceneId,"  "..PlayerName..PlayerSex.."#{OBJ_dali_0011}") --#r  T読 你等c低to� 鸬 时候,你也可以来我这里帮我做些事情,蝝祎 岣鉑inh nghi甿以及金钱等不同to� 鸬 奖励,帮助你成为m祎 c醝真正to� 鸬 姓i hi畃.
		SetMissionFlag( sceneId, selfId, MF_Dialog_01, 1 )
	elseif IsNew == 1 then
		if GetLevel( sceneId, selfId ) >= 10 and GetMenPai( sceneId, selfId ) == MP_WUMENPAI then
			AddText( sceneId, "  "..PlayerName..PlayerSex.."#{OBJ_dali_0054}" )
		else
			AddText( sceneId, "  "..PlayerName..PlayerSex.."#{OBJ_dali_0012}" )
		end
	end

	if nLevel >= 20 then
		AddNumText( sceneId, x002030_g_scriptId, "Nhi甿 v� k竎h t靚h", 11, 10 )
	end

	if nLevel >= 50 then
		AddNumText( sceneId, x002030_g_scriptId, "Thi阯 Th� c� li阯 danh", 6, 199 )
		AddNumText( sceneId, x002030_g_scriptId, "Thi阯 Th� c� li阯 danh gi緄 thi畊", 11, 200 )
	end

	for i, eventId in x002030_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	
	
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x002030_OnDefaultEvent( sceneId, selfId,targetId )
	x002030_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中m祎 项
--**********************************
function x002030_OnEventRequest( sceneId, selfId, targetId, eventId )

	if GetNumText() == 10 then
			BeginEvent(sceneId)	
					
				AddText( sceneId, "#{function_help_073}" )
				AddNumText( sceneId, x002030_g_scriptId, "Hi畁 gi� ta 疸 ti猲 h鄋h 皙n 疴u r癷?", 11, 11 )
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
	end
	
	if GetNumText() == 11 then
		CallScriptFunction( 200098, "DispatchJuqintInfo",sceneId, selfId, targetId )
		return
	end

	--天下武学功能
	if GetNumText() == 198 then
		--检查善恶值
		local gbvalue = LuaFnGetHumanGoodBadValue( sceneId, selfId )
		if gbvalue < 100 then
			BeginEvent( sceneId )
				AddText( sceneId, "Ng呓i kh鬾g 瘘 gi� tr� thi畁 醕, ta kh鬾g th� 疬a th� ti猲 c� cho ng呓i." )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			return
		end

		--检查任务栏空间
		LuaFnBeginAddItem( sceneId )
			LuaFnAddItem( sceneId, 40002108, 1)
		local retc = LuaFnEndAddItem( sceneId, selfId )
		if 1 ~= retc then
			BeginEvent( sceneId )
				AddText( sceneId, "� 鹫o c� kh鬾g 瘘 ch�." )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			return
		end
		
		--加推荐信
		BeginAddItem(sceneId)
			AddItem( sceneId,40002108,1)
		local ret = EndAddItem(sceneId,selfId)
		if 1 == ret then
			AddItemListToHuman(sceneId,selfId)
			--扣善恶值
			gbvalue = gbvalue - 100
			LuaFnSetHumanGoodBadValue( sceneId, selfId, gbvalue )
			
			--屏幕中间提示信息
			BeginEvent(sceneId)
				AddText(sceneId,"Ng呓i nh 疬㧟 1 l� th� ti猲 c�.")
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			
			--发送特效
			LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,18,1000)
		end
		return
	end	
	
	--天下武学
	if GetNumText() == 199 then
		BeginEvent(sceneId)
			AddText( sceneId, "#{function_help_100}" )
			AddNumText( sceneId, x002030_g_scriptId, "Gi� tr� thi畁 醕 l� 1.000 ta cho ng呓i 1 l� th� ti猲 c�", 7, 198)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	--天下武学介绍
	if GetNumText() == 200 then
		BeginEvent(sceneId)
			AddText( sceneId, "#{function_help_100}" )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	for i, findId in x002030_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--Ti猵 th薔PCto� 鸬 任务
--**********************************
function x002030_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002030_g_eventList do
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
function x002030_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后,要Tr� v玁PCto� 鸬 事件列表
	for i, findId in x002030_g_eventList do
		if missionScriptId == findId then
			x002030_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续(已经接了任务)
--**********************************
function x002030_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002030_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完to� 鸬 任务
--**********************************
function x002030_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x002030_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x002030_OnDie( sceneId, selfId, killerId )
end

--**********************************
--时钟事件
--**********************************
function x002030_OnCharacterTimer( sceneId, selfId, dataId, nowtime )
--场景号,ObjID,怪物表号,时间值(毫 gi鈟)

end





