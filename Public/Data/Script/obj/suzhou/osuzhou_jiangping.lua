--T� Ch�uNPC		����npc		1��c�p���㼼��		2���㼼��� �i�m�
--��ƽ
--��ͨ
--��ʹ���¼���� 0-K� n�ng h�c t�p 2-X�c nh�nѧϰ	3-����ѧϰ	
--�ű���
x001032_g_ScriptId = 001032

--�̵���
x001032_g_shoptableindex=73

--��ӵ��to� � �¼�Id�б�
--estudy_diaoyu = 713510
--elevelup_diaoyu = 713569
--edialog_diaoyu = 713609
--��ӵ��to� � �¼�ID�б�
x001032_g_eventList={713510,713569}--,713609}
--**********************************
--�¼��б�
--**********************************
function x001032_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"#{OBJ_suzhou_0011}")
	for i, eventId in x001032_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	--�̵�ѡ��
	AddNumText(sceneId,x001032_g_ScriptId,"Mua c�ng c�",7,ABILITY_TEACHER_SHOP)
	AddNumText( sceneId, x001032_g_ScriptId, "Gi�i thi�u c�u c�", 11, 100 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x001032_OnDefaultEvent( sceneId, selfId,targetId )
	x001032_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��m�t ��
--**********************************
function x001032_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 100 then
		BeginEvent( sceneId )
			AddText( sceneId, "#{function_help_003}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end

	if	GetNumText() == ABILITY_TEACHER_SHOP	then
		DispatchShopItem( sceneId, selfId,targetId, x001032_g_shoptableindex )
	end
	for i, findId in x001032_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x001032_g_ScriptId )
		return
		end
	end
end

--**********************************
--Ti�p th���NPCto� � ����
--**********************************
function x001032_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001032_g_eventList do
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
--�ܾ���NPCto� � ����
--**********************************
function x001032_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��,ҪTr� v�NPCto� � �¼��б�
	for i, findId in x001032_g_eventList do
		if missionScriptId == findId then
			x001032_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--����(�Ѿ���������)
--**********************************
function x001032_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001032_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ������to� � ����
--**********************************
function x001032_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x001032_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x001032_OnDie( sceneId, selfId, killerId )
end
