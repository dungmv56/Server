--T� Ch�uNPC 
--�u D� T�
--��ͨ

--�ű���
x001066_g_ScriptId = 001066
x001066_g_ShenBingScriptId = 500503			-- Ѫ���������ű�
x001066_g_ChongZhuScriptId = 500504			-- ��������������ű�
x001066_g_Name			= "�u D� T�"

x001066_g_eventList={}
--**********************************
--�¼��б�
--**********************************
function x001066_UpdateEventList( sceneId, selfId,targetId )
end

--**********************************
--�¼��������
--**********************************
function x001066_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent( sceneId )
		AddText(sceneId,"#{OBJ_suzhou_0020}")
		
		for i, eventId in x001066_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
		
		if LuaFnGetName( sceneId, targetId ) == x001066_g_Name then
			AddNumText(sceneId,x001066_g_ScriptId,"Huy�t D�c Th�n Binh",3,105)
		end
		AddNumText(sceneId,x001066_g_ScriptId,"Gi�m �nh t� ch�t trang b�",6,4)
		AddNumText(sceneId,x001066_g_ScriptId,"C߶ng h�a trang b�",6,5)
		AddNumText(sceneId,x001066_g_ScriptId,"N�ng cao ��ng c�p trang b�",6,6)
		--AddNumText(sceneId,x001066_g_ScriptId,"װ���ı�����",6,7)

		AddNumText(sceneId,x001066_g_ScriptId,"T�ng s� l�n s�a ch�a",6,8)
		AddNumText(sceneId,x001066_g_ScriptId,"Kh�c Danh Trang B�",6,9)
		AddNumText(sceneId,x001066_g_ScriptId,"G� kh�c danh trang b�",6,22)
		AddNumText(sceneId,x001066_g_ScriptId,"T�i gi�m �nh trang b�",6,19)
		if LuaFnGetName( sceneId, targetId ) == x001066_g_Name then
			AddNumText(sceneId,x001066_g_ScriptId,"��c th�n kh�",11,106)
		end
		
		AddNumText( sceneId, x001066_g_ScriptId, "V� trang b� kh�c ch�m", 11, 10 )
		
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��б�ѡ��m�t ��
--**********************************
function x001066_OnEventRequest( sceneId, selfId, targetId, eventId )

---------------------------����-------------------------------------------------
		if GetNumText() == 10 then
			BeginEvent(sceneId)	
				AddText(sceneId,"#{function_help_055}#r")
				
				AddNumText(sceneId, x001066_g_ScriptId,"Trang b� kh�c ch�m",11,11);
				AddNumText(sceneId, x001066_g_ScriptId,"Trang b� c߶ng h�a",11,12);
				AddNumText(sceneId, x001066_g_ScriptId,"Gi�m �nh ch�t l��ng trang b�",11,13);
				--AddNumText(sceneId, x001066_g_ScriptId,"Gi�i thi�u thay �i ngo�i h�nh",11,14);				
				AddNumText(sceneId, x001066_g_ScriptId,"Gi�i thi�u v� gi�m �nh t� ch�t trang b� l�i t� �u",11,29);

			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
	
		if GetNumText() == 11 then
			BeginEvent(sceneId)						
				AddText(sceneId,"#{function_help_044}#r")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end	
		if GetNumText() == 12 then
			BeginEvent(sceneId)						
					AddText(sceneId,"#{function_help_045}#r")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end	
		if GetNumText() == 13 then
			BeginEvent(sceneId)						
					AddText(sceneId,"#{function_help_046}#r")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end	
		if GetNumText() == 14 then
			BeginEvent(sceneId)						
					AddText(sceneId,"#{function_help_047}#r")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end	
		if GetNumText() == 29 then
			BeginEvent(sceneId)						
					AddText(sceneId,"#{function_help_097}")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end	
		
		--------------------------------------------------------------------------
		
		-- Gi�m иnh T� Ch�t Trang B�
		if GetNumText() == 4 then
			BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
			EndUICommand( sceneId )
			DispatchUICommand( sceneId, selfId, 1001 )
			return
		end

		-- װ��ǿ��
		if	GetNumText()==5	then

			BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId)
			EndUICommand(sceneId)
			DispatchUICommand(sceneId,selfId, 1002)
			return

		end

		if	GetNumText()==6	then

			BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId)
			EndUICommand(sceneId)
			DispatchUICommand(sceneId,selfId, 1003)
			return

		end

		if	GetNumText()==7	then

			BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId)
			EndUICommand(sceneId)
			DispatchUICommand(sceneId,selfId, 1010)
			return

		end

		-- ���ӿ���������
		if	GetNumText()==8	then

			BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId)
			EndUICommand(sceneId)
			DispatchUICommand(sceneId,selfId, 1004)
			return

		end

		-- װ������
		if	GetNumText()==9	then

			BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId)
			EndUICommand(sceneId)
			DispatchUICommand(sceneId,selfId, 1005)
			return

		end
		
		-- װ������
		if	GetNumText()==22	then

			BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId)
			EndUICommand(sceneId)
			DispatchUICommand(sceneId,selfId, 1006)
			return

		end
		
		-- ���¼���װ������
		if	GetNumText()==19	then

			BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId)
			EndUICommand(sceneId)
			DispatchUICommand(sceneId,selfId, 112233)
			return

		end
		
		-- Ѫԡ���
		if GetNumText() == 105 then
			BeginEvent(sceneId)						
				AddText(sceneId,"#{XYSB_20070928_001}")				
				CallScriptFunction( x001066_g_ShenBingScriptId, "OnEnumerate",sceneId, selfId, targetId )
				CallScriptFunction( x001066_g_ChongZhuScriptId, "OnEnumerate",sceneId, selfId, targetId )
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end	
		
		if GetNumText() == 106 then
			BeginEvent(sceneId)						
				AddText( sceneId, "#{XYSB_20070928_011}" )
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end	
		
		if eventId == x001066_g_ShenBingScriptId then
			CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
			return
		end	
		
		if eventId == x001066_g_ChongZhuScriptId then
			CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
			return
		end	
		
		for i, findId in x001066_g_eventList do
			if eventId == findId then
				CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
				return
			end
		end
		
end

--**********************************
--Ti�p th���NPCto� � ����
--**********************************
function x001066_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )

	if missionScriptId == x001066_g_ShenBingScriptId then
		CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId, targetId )
	end
	
	local i	= 1
	local findId = 0
	for i, findId in x001066_g_eventList do
		if missionScriptId == findId then
			local ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId, targetId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId, targetId )
			end
			return
		end
	end

end

--**********************************
--�ܾ���NPCto� � ����
--**********************************
function x001066_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	
	--�ܾ�֮��,ҪTr� v�NPCto� � �¼��б�
	
	if missionScriptId == x001066_g_ShenBingScriptId then
		x001066_UpdateEventList( sceneId, selfId, targetId )
		return
	end	

end

--**********************************
--����(�Ѿ���������)
--**********************************
function x001066_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	
	if missionScriptId == x001066_g_ShenBingScriptId then
		CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
		return
	end	

end

--**********************************
--�ύ������to� � ����
--**********************************
function x001066_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	
	if missionScriptId == x001066_g_ShenBingScriptId then
		CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
		return
	end	

end

--**********************************
--�����¼�
--**********************************
function x001066_OnDie( sceneId, selfId, killerId )
end

--**********************************
--�ύ��Ʒ
--**********************************
function x001066_OnMissionCheck( sceneId, selfId, npcid, scriptId, index1, index2, index3, indexpet )
	
	if scriptId == x001066_g_ShenBingScriptId or scriptId == x001066_g_ChongZhuScriptId then
		CallScriptFunction( scriptId, "OnMissionCheck", sceneId, selfId, npcid, scriptId, index1, index2, index3, indexpet )
		return
	end
	
end
