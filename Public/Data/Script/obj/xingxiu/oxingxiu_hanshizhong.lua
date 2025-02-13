--Tinh T鷆NPC
--韩世忠
--普通

x016001_g_scriptId = 016001
x016001_g_eventList={227900,808004}

x016001_g_StudyAbility_NeedMoney = 5550000		--555G
---“门派召集令”配方ID
x016001_g_RecipeId = 563
--顺发特效ID
x016001_g_SpecialEffectID = 18;


--**********************************
--事件交互入口
--**********************************
function x016001_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  Ta l� H鄋 Th� Trung hi畁 餫ng gi� ch裞 鹫i s� huynh c黙 ph醝 Tinh T鷆.")
		local mp = GetMenPai(sceneId, selfId)
		local nMenpaiPoint = GetHumanMenpaiPoint(sceneId, selfId)
		if mp == 9 then 
			if nMenpaiPoint <= 0 then
				AddNumText(sceneId, x016001_g_scriptId, "Gia nh m鬾 ph醝",6,0)
			end
		end
		AddNumText(sceneId, x016001_g_scriptId, "Gi緄 thi畊 m鬾 ph醝",8,1)
		AddNumText(sceneId, x016001_g_scriptId, "H鱟 c醕h l鄊 ra l畁h tri畊 t c黙 m鬾 ph醝",12,2)
		AddNumText(sceneId, x016001_g_scriptId, "H鱟 K� n錸g c黙 m鬾 ph醝?",8,6)		--指路到技能学习人
		for i, eventId in x016001_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件列表选中m祎 项
--**********************************
function x016001_OnEventRequest( sceneId, selfId, targetId, eventId )

	if GetNumText()==0	then

		x016001_g_MenPai = GetMenPai(sceneId, selfId)
		if x016001_g_MenPai == 5   then
			BeginEvent(sceneId)
				AddText(sceneId, "Ng呓i l読 皙n ti陁 khi琻 vi s� r癷, ng呓i 疸 l� 甬 t� c黙 Tinh T鷆 ta, c騨 b醝 s� l鄊 g� n鎍 c� ch�")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
		
		if x016001_g_MenPai ~= 9 then
			BeginEvent(sceneId)
				AddText(sceneId,"Ng呓i 疸 l� cao 鸢 c黙 m鬾 ph醝 kh醕, ch鷑g ta kh鬾g thu nh ng呓i")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end

		BeginEvent(sceneId)
			AddText(sceneId, "#{MenpaiInfo_005}")
			AddNumText(sceneId, x016001_g_scriptId, "Ta mu痭 b醝 nh ph醝 Tinh T鷆",6,3)
			AddNumText(sceneId, x016001_g_scriptId, "T読 h� ch遖 mu痭 b醝 s�",8,4)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		 
		return
	end
	
	if GetNumText()==4	then
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
		return
	end

	if GetNumText()==3	then
		if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 2 then
			BeginEvent(sceneId)
				AddText(sceneId,"  H銀 s x猵 l読 tay n鋓, c 2 v� tr� tr痭g, ta s� th叻ng cho ng呓i!")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		elseif GetLevel( sceneId, selfId ) < 10 then
			BeginEvent(sceneId)
				AddText(sceneId,"C醕 h� h銀 瘙i t緄 sau c 10 l読 t緄 b醝 s� h鱟 ngh�!")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		else
			x016001_g_MenPai = GetMenPai(sceneId, selfId)
			if x016001_g_MenPai == 5 then
				BeginEvent(sceneId)
					AddText(sceneId, "Ng呓i l読 皙n ti陁 khi琻 vi s� r癷, ng呓i 疸 l� 甬 t� c黙 Tinh T鷆 ta, c騨 b醝 s� l鄊 g� n鎍 c� ch�")
				EndEvent(sceneId)
				DispatchEventList(sceneId,selfId,targetId)
			--Tr� v滴�9表示无门派
			elseif x016001_g_MenPai==9	then
				LuaFnJoinMenpai(sceneId, selfId, targetId, 5)

				-- 设置初始to� 鸬 Npc关系值
				CallScriptFunction( 200099, "InitRelation", sceneId, selfId )

				-- 把相关to� 鸬 心法设置为10c别  31,34,35
				LuaFnSetXinFaLevel(sceneId,selfId,31,10)
				LuaFnSetXinFaLevel(sceneId,selfId,34,10)
				LuaFnSetXinFaLevel(sceneId,selfId,35,10)

				BeginEvent(sceneId)
					AddText(sceneId,"C醕 h� 疸 gia nh ph醝 Tinh T鷆!");
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				--给玩家发信,告诉他到哪里打怪,怎样赚钱
				LuaFnSendSystemMail( sceneId, GetName(sceneId,selfId), "#{LevelMail_menpai_1}" )
				--LuaFnSendSystemMail( sceneId, GetName(sceneId,selfId), "#{OBJ_xingxiu_0001}" )
				
				--门派奖励召集令
				for i=1, 20 do
					TryRecieveItem( sceneId, selfId, 30501001, 1 )
				end
				x016001_MsgBox( sceneId, selfId, "L 疬㧟 20 t Chi陁 t l畁h c黙 m鬾 ph醝" )

				if TryRecieveItem( sceneId, selfId, 10124005, 1 ) >= 0 then
					str		= "#YC醕 h� 疸 nh 疬㧟 #W"..GetItemName( sceneId, 10124005 ).."."
					x016001_MsgBox( sceneId, selfId, str )
				end
				
				if	LuaFnGetSex( sceneId, selfId)==0	then
					LuaFnMsg2Player( sceneId, selfId,"C醕 h� 疸 gia nh ph醝 Tinh T鷆!",MSG2PLAYER_PARA)
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 165, 0)
					CallScriptFunction( 227900, "OnDefaultEvent",sceneId, selfId, targetId )
				else
					LuaFnMsg2Player( sceneId, selfId,"C醕 h� 疸 gia nh ph醝 Tinh T鷆!",MSG2PLAYER_PARA)
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 165, 0)
					CallScriptFunction( 227900, "OnDefaultEvent",sceneId, selfId, targetId )
				end
			else
				BeginEvent(sceneId)
					AddText(sceneId,"Ng呓i 疸 l� cao 鸢 c黙 m鬾 ph醝 kh醕, ch鷑g ta kh鬾g thu nh ng呓i")
				EndEvent(sceneId)
				DispatchEventList(sceneId,selfId,targetId)
			end
		end
	elseif	GetNumText()==1	then
		BeginEvent(sceneId)
			AddText(sceneId, "#{OBJ_xingxiu_0003}")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif	GetNumText() == 2 then
	
		x016001_g_MenPai = GetMenPai(sceneId, selfId)
		if x016001_g_MenPai == 5 then

			local RecipeFlag = IsPrescrLearned( sceneId, selfId, x016001_g_RecipeId );
			if RecipeFlag >= 1 then
				BeginEvent(sceneId)
						AddText(sceneId,"C醕 h� 疸 h鱟 l鄊 l畁h tri畊 t m鬾 ph醝.")
				EndEvent(sceneId)
				DispatchEventList(sceneId,selfId,targetId)
				return 0;
			end
				
			local	lev	= QueryHumanAbilityLevel( sceneId, selfId, 39 )
			if lev < 2 then
					BeginEvent(sceneId)
					AddText(sceneId,"Ch� c� k� n錸g Ch� x韈h thi阯 nhai 鹫t c 鸬 2 m緄 c� th� truy玭 th�! Ngo鄆 ra, c醕 h� c騨 ph鋓 n祊 cho t読 h�#{_MONEY"..x016001_g_StudyAbility_NeedMoney.."}")
					EndEvent(sceneId)
					DispatchEventList(sceneId,selfId,targetId)
					return
			end	
				
			if LuaFnGetMoney( sceneId, selfId )+GetMoneyJZ( sceneId, selfId ) < x016001_g_StudyAbility_NeedMoney then
				BeginEvent(sceneId)
						AddText(sceneId,"  Ti玭 c醕 h� mang theo kh鬾g 瘘! Ph鋓 n祊 cho ht#{_EXCHG"..x016001_g_StudyAbility_NeedMoney.."}.")
				EndEvent(sceneId)
				DispatchEventList(sceneId,selfId,targetId)
				return 0
			else
				BeginEvent(sceneId)
					AddText(sceneId,"  H鱟 ph呓ng th裞 ph痠 h䅟 l畁h tri畊 t m鬾 ph醝 ph鋓 n祊 cho t読 h� #{_MONEY"..x016001_g_StudyAbility_NeedMoney.."}")
					AddNumText(sceneId, x016001_g_scriptId, "T読 h� 鸢ng � h鱟.",12,999)
				EndEvent(sceneId)
				DispatchEventList(sceneId,selfId,targetId)
				return
					
			end

		else
			BeginEvent(sceneId)
				AddText(sceneId, "Ta ch� truy玭 th� cho 甬 t� c黙 b眓 ph醝")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		end
	
	elseif	GetNumText() == 999 then
		-- 检测玩家喧ng不喧ng学会了必要to� 鸬 技能并达到必要等c
		local	lev	= QueryHumanAbilityLevel( sceneId, selfId, 39 )
		if lev < 2 then
			BeginEvent(sceneId)
				AddText(sceneId,"  K� n錸g Ch� th呔c thi阯 nhai c黙 c醕 h� v鏽 ch遖 鹫t c 鸬 2, t読 h� kh鬾g th� d誽 疬㧟.")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
			
		-- 检测玩家喧ng不喧ng够钱
		if GetMoney(sceneId, selfId)+GetMoneyJZ(sceneId, selfId) < x016001_g_StudyAbility_NeedMoney   then
			BeginEvent(sceneId)
				AddText(sceneId, " Ti玭 c醕 h� mang theo kh鬾g 瘘.")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		end
		
		local delMoney,delJiaoZi = LuaFnCostMoneyWithPriority( sceneId, selfId, x016001_g_StudyAbility_NeedMoney )
		if delMoney and delMoney ~= -1  then
			CallScriptFunction( USERECIPE_SCRIPT, "ReadRecipe", sceneId, selfId, x016001_g_RecipeId )
			LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x016001_g_SpecialEffectID, 0);
			
			BeginEvent(sceneId)
				AddText(sceneId,"C醕 h� 疸 h鱟 c醕h l鄊 ra l畁h tri畊 t c黙 m鬾 ph醝 r癷!")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		end
		
	else
		for i, findId in x016001_g_eventList do
			if eventId == findId then
				CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, MP_XINGSU )
				return
			end
		end
	end
	--指路
	if GetNumText()==6 then
		BeginEvent(sceneId)
			AddText(sceneId, "Thi To鄋 [87,70] c� th� truy玭 d誽 cho ng呓i k� n錸g chi猲 黏u c黙 ph醝 ta. 刵 ph韒 TAB, tr阯 b鋘 鸢 s� xu hi畁 k� hi畊 餫ng nh nh醳")
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
		CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, 87, 70, "施全" )
		return
	end
end

--**********************************
--Ti猵 th薔PCto� 鸬 任务
--**********************************
function x016001_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x016001_g_eventList do
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
function x016001_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后,要Tr� v玁PCto� 鸬 事件列表
	for i, findId in x016001_g_eventList do
		if missionScriptId == findId then
			x016001_OnDefaultEvent( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续(已经接了任务)
--**********************************
function x016001_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x016001_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完to� 鸬 任务
--**********************************
function x016001_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x016001_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x016001_OnDie( sceneId, selfId, killerId )
end

--**********************************
--消息提示
--**********************************
function x016001_MsgBox( sceneId, selfId, str )
	Msg2Player( sceneId, selfId, str, MSG2PLAYER_PARA )
	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
