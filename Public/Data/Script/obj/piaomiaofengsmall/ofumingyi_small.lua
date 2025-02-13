--��翷帱��....
--Ph� M�n Nghi�Ի��ű�....

--�ű���
x402286_g_ScriptId = 402286

--�����߼��ű���....
x402286_g_FuBenScriptId = 402276

--����buff��....
x402286_g_ZhenSheBuffTbl = { 10264, 10265, 10266 }
--��Ȥbuff��....
x402286_g_YouQuBuffTbl = { 10261, 10262, 10263 }


--**********************************
--������ں���....
--**********************************
function x402286_OnDefaultEvent( sceneId, selfId, targetId )

	BeginEvent(sceneId)
		AddText( sceneId, "#{PMF_20080521_12}" )

		--�жϵ�ǰ��ng�����Khi�u chi�n˫��....	
		if 1 == CallScriptFunction( x402286_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "ShuangZi" ) then
			AddNumText( sceneId, x402286_g_ScriptId, "Khi�u chi�n B�t b�nh ��o nh�n c�ng Tr�c B�t Ph�m", 10, 1 )
		end

	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end

--**********************************
--�¼��б�ѡ��m�t ��
--**********************************
function x402286_OnEventRequest( sceneId, selfId, targetId, eventId )

	--�����T�i ����BOSS��Tr� v�....
	if 1 == CallScriptFunction( x402286_g_FuBenScriptId, "IsPMFTimerRunning", sceneId ) then
		return
	end

	--��ng����ng�ӳ�....
	if GetTeamLeader(sceneId,selfId) ~= selfId then
		BeginEvent(sceneId)
			AddText( sceneId, "#{PMF_20080521_07}" )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--�жϵ�ǰ��ng�����Khi�u chi�n˫��....	
	if 1 ~= CallScriptFunction( x402286_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "ShuangZi" ) then
		return
	end

	--�����T�i �ͱ�to� � BOSSCu�c chi�n ��Tr� v�....
	local ret, msg = CallScriptFunction( x402286_g_FuBenScriptId, "CheckHaveBOSS", sceneId )
	if 1 == ret then
		BeginEvent(sceneId)
			AddText( sceneId, msg )
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end

	--M� ra ��翷��ʱ���������Լ�....
	CallScriptFunction( x402286_g_FuBenScriptId, "OpenPMFTimer", sceneId, 16, x402286_g_ScriptId, -1 ,-1 )
	
	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)

end

--**********************************
--��翷��ʱ��to� � OnTimer....
--**********************************
function x402286_OnPMFTimer( sceneId, step, data1, data2 )

	if 16 == step then
		MonsterTalk(sceneId, -1, "", "#{PMF_20080521_13}" )
		return
	end

	if 13 == step then
		MonsterTalk(sceneId, -1, "", "#{PMF_20080521_14}" )
		return
	end

	if 10 == step then
		MonsterTalk(sceneId, -1, "", "#{PMF_20080521_15}" )
		return
	end

	if 7 == step then
		MonsterTalk(sceneId, -1, "", "#{PMF_20080521_16}" )
		x402286_UseZhenShe( sceneId )
		CallScriptFunction( x402286_g_FuBenScriptId, "TipAllHuman", sceneId, "Cu�c chi�n 5 gi�y sau s� b�t �u" )
		return
	end

	if 6 == step then
		CallScriptFunction( x402286_g_FuBenScriptId, "TipAllHuman", sceneId, "Cu�c chi�n 4 gi�y sau s� b�t �u" )
		return
	end

	if 5 == step then
		CallScriptFunction( x402286_g_FuBenScriptId, "TipAllHuman", sceneId, "Cu�c chi�n 3 gi�y sau s� b�t �u" )
		return
	end

	if 4 == step then
		MonsterTalk(sceneId, -1, "", "#{PMF_20080521_17}" )
		x402286_UseYouQu( sceneId )
		CallScriptFunction( x402286_g_FuBenScriptId, "TipAllHuman", sceneId, "Cu�c chi�n 2 gi�y sau s� b�t �u" )
		return
	end

	if 3 == step then
		CallScriptFunction( x402286_g_FuBenScriptId, "TipAllHuman", sceneId, "Cu�c chi�n 1 gi�y sau s� b�t �u" )
		return
	end

	if 2 == step then
		--��ʾCu�c chi�n b�t �u....
		CallScriptFunction( x402286_g_FuBenScriptId, "TipAllHuman", sceneId, "Cu�c chi�n b�t �u" )
		return
	end

	if 1 == step then
		--����BOSS....
		CallScriptFunction( x402286_g_FuBenScriptId, "CreateBOSS", sceneId, "ZhuoBuFan_BOSS", -1, -1 )
		CallScriptFunction( x402286_g_FuBenScriptId, "CreateBOSS", sceneId, "BuPingDaoRen_BOSS", -1, -1 )
		return
	end

end

--**********************************
--��������....
--**********************************
function x402286_UseZhenShe( sceneId )

	local bossId = CallScriptFunction( x402286_g_FuBenScriptId, "FindBOSS", sceneId, "FuMinYi_NPC" )
	if bossId == -1 then
		return
	end

	local idx = random( getn(x402286_g_ZhenSheBuffTbl) )
	local buffId = x402286_g_ZhenSheBuffTbl[idx]

	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 and LuaFnIsCharacterLiving(sceneId, nHumanId) == 1 then
			LuaFnSendSpecificImpactToUnit( sceneId, bossId, bossId, nHumanId, buffId, 0 )
		end
	end

end

--**********************************
--������Ȥ....
--**********************************
function x402286_UseYouQu( sceneId )

	local bossId = CallScriptFunction( x402286_g_FuBenScriptId, "FindBOSS", sceneId, "FuMinYi_NPC" )
	if bossId == -1 then
		return
	end

	local idx = random( getn(x402286_g_YouQuBuffTbl) )
	local buffId = x402286_g_YouQuBuffTbl[idx]

	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 and LuaFnIsCharacterLiving(sceneId, nHumanId) == 1 then
			LuaFnSendSpecificImpactToUnit( sceneId, bossId, bossId, nHumanId, buffId, 0 )
		end
	end

end
