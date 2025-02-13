--珍兽技能学习UI 3

x311111_g_ScriptId = 311111;

x311111_g_MenPaiId = 0;
x311111_g_MenPaiSkillIds = {701,702,703}

--**********************************
--列举事件
--**********************************
function x311111_OnEnumerate( sceneId, selfId, targetId, sel )
	if(sel == 6) then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId); --调用发布征友信息界面
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 5)
		
		local ret = DispatchPetPlacardList(sceneId,selfId,targetId,-1,-1,1);
		if(0 == ret) then
			Msg2Player( sceneId,selfId,"Hi畁 t読 kh鬾g c� s醕h tr鈔 th�",MSG2PLAYER_PARA)
		end
	elseif (sel == 1) then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId);	--调用新版珍兽技能学习界面 UI 223
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 223)
	else
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId);
			UICommand_AddInt(sceneId,sel)		--调用技能学习界面
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 3)
	end
end

--条件检查,Tr� v�0 检查th b読 ,1 检查成功
function x311111_PetSkillStudy_MenPaiCheck(sceneId, selfId)
	if(x311111_g_MenPaiId ~= tonumber(GetMenPai(sceneId, selfId))) then
		return 0;
	else
		return 1;
	end
end

--门派技能学习
function x311111_PetSkillStudy_MenPai_Learn(sceneId, selfId, petHid, petLid, skillId)
	local ret = PetStudySkill_MenPai(sceneId, selfId, petHid, petLid, skillId);
	if( 1 == ret ) then
		Msg2Player( sceneId,selfId,"H鱟 t k� n錸g th鄋h c鬾g",MSG2PLAYER_PARA)
	else
		Msg2Player( sceneId,selfId,"嗅ng ti猚, h鱟 t k� n錸g th b読",MSG2PLAYER_PARA)
	end
end

--驯养费查询
function x311111_PetSkillStudy_Ask_Money(sceneId, selfId, petHid, petLid)
	local money	= x311111_CalcMoney_ha( sceneId, selfId, petHid, petLid )
	BeginUICommand(sceneId)
		UICommand_AddInt(sceneId, money)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 4)
end

--驯养珍兽
function x311111_PetSkillStudy_Domestication(sceneId, selfId, petHid, petLid)
--local ret = PetDomestication(sceneId, selfId, petHid, petLid);
	local checkAvailable = LuaFnIsPetAvailableByGUIDNoPW(sceneId, selfId, petHid, petLid);
	if checkAvailable and checkAvailable == 1 then
		local money	= x311111_CalcMoney_ha( sceneId, selfId, petHid, petLid )
		local PlayerMoney = GetMoney( sceneId, selfId )  +  GetMoneyJZ(sceneId, selfId)  --交子普及 Vega
		if PlayerMoney < money then
			return
		end
		--给玩家to� 鸬 珍兽蘈inh炖侄炔⑸境鹎�
		LuaFnCostMoneyWithPriority( sceneId, selfId, money )
		LuaFnSetPetHappiness( sceneId, selfId, petHid, petLid, 100 )
		Msg2Player( sceneId, selfId, "Ho鄋 鸢ng th鄋h c鬾g", MSG2PLAYER_PARA )
	else
		Msg2Player( sceneId, selfId, "Tr課g th醝 hi畁 t読 kh鬾g th� thao t醕", MSG2PLAYER_PARA )
	end
end

--查看前m祎 篇征友信息
function x311111_PetInviteFriend_Ask_NewPage(sceneId, selfId, npcId, guid1, guid2, dir)
	local ret = DispatchPetPlacardList(sceneId, selfId, npcId, guid1, guid2, dir)
	if(0 == ret) then
		Msg2Player( sceneId,selfId,"Kh鬾g 瘘 tr鈔 th� li璾",MSG2PLAYER_PARA)
	end
end

--**********************************
--计算恢复欢乐度费用
--**********************************
--单位血驯养价值: 0.025+n*0.0005(n为珍兽等c)
--单位快乐度价值: 0.373+0.44*n(n为珍兽等c)
function x311111_CalcMoney_ha( sceneId, selfId, petHid, petLid )
	local lv	= LuaFnGetPetLevelByGUID( sceneId, selfId, petHid, petLid )
	local	ha	= 100 - LuaFnGetPetHappiness( sceneId, selfId, petHid, petLid )
	if ha <= 0 then
		return 0
	end

	local	gld	= floor( ( 0.373+lv*0.44 ) * ha )
	if gld < 1 then
		gld			= 1
	end
	return gld
end
