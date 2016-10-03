--��翷帱��....
--Tang Th� C�ng�Ի��ű�....

--�ű���
x402271_g_ScriptId = 402271

--�����߼��ű���....
x402271_g_FuBenScriptId = 402263

--**********************************
--������ں���....
--**********************************
function x402271_OnDefaultEvent( sceneId, selfId, targetId )

	BeginEvent(sceneId)
		AddText( sceneId, "#{PMF_20080521_08}" )
		AddNumText( sceneId, x402271_g_ScriptId, "Khi�u chi�n", 10, 1 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end

--**********************************
--�¼��б�ѡ��m�t ��
--**********************************
function x402271_OnEventRequest( sceneId, selfId, targetId, eventId )

	--�����T�i ����BOSS��Tr� v�....
	if 1 == CallScriptFunction( x402271_g_FuBenScriptId, "IsPMFTimerRunning", sceneId ) then
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

	--�����T�i �ͱ�to� � BOSSCu�c chi�n ��Tr� v�....
	local ret, msg = CallScriptFunction( x402271_g_FuBenScriptId, "CheckHaveBOSS", sceneId )
	if 1 == ret then
		BeginEvent(sceneId)
			AddText( sceneId, msg )
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end

	--�жϵ�ǰ��ng�����Khi�u chi�nTang Th� C�ng....	
	if 1 ~= CallScriptFunction( x402271_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "SangTuGong" ) then
		BeginEvent(sceneId)
			AddText( sceneId, "#{PMF_20080521_09}" )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--M� ra ��翷��ʱ���������Լ�....
	CallScriptFunction( x402271_g_FuBenScriptId, "OpenPMFTimer", sceneId, 7, x402271_g_ScriptId, -1, -1 )

	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)

end

--**********************************
--��翷��ʱ��to� � OnTimer....
--**********************************
function x402271_OnPMFTimer( sceneId, step, data1, data2 )

	if 7 == step then
		CallScriptFunction( x402271_g_FuBenScriptId, "TipAllHuman", sceneId, "Cu�c chi�n 5 gi�y sau s� b�t �u" )
		return
	end

	if 6 == step then
		CallScriptFunction( x402271_g_FuBenScriptId, "TipAllHuman", sceneId, "Cu�c chi�n 4 gi�y sau s� b�t �u" )
		return
	end

	if 5 == step then
		CallScriptFunction( x402271_g_FuBenScriptId, "TipAllHuman", sceneId, "Cu�c chi�n 3 gi�y sau s� b�t �u" )
		return
	end

	if 4 == step then
		CallScriptFunction( x402271_g_FuBenScriptId, "TipAllHuman", sceneId, "Cu�c chi�n 2 gi�y sau s� b�t �u" )
		return
	end

	if 3 == step then
		CallScriptFunction( x402271_g_FuBenScriptId, "TipAllHuman", sceneId, "Cu�c chi�n 1 gi�y sau s� b�t �u" )
		return
	end

	if 2 == step then
		--��ʾCu�c chi�n b�t �u....
		CallScriptFunction( x402271_g_FuBenScriptId, "TipAllHuman", sceneId, "Cu�c chi�n b�t �u" )
		--ɾ��NPC....
		CallScriptFunction( x402271_g_FuBenScriptId, "DeleteBOSS", sceneId, "SangTuGong_NPC" )
		return
	end

	if 1 == step then
		--����BOSS....
		CallScriptFunction( x402271_g_FuBenScriptId, "CreateBOSS", sceneId, "SangTuGong_BOSS", -1, -1 )
		return
	end

end
