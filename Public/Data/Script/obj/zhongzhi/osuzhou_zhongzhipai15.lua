--T� Ch�u
--��ֲ��15

--�ű���
x714107_g_ScriptId = 714107

event_xuanzezhiwu = 713550

--ֲ���Ʒ����б�
x714107_g_eventList={20104001,20104002,20104005,20104008,20104009,20104010,
			20105001,20105003,20105006,20105009,20105010} --ֲ��to� � ���,����ngscriptId
--**********************************
--�¼��������
--**********************************
function x714107_OnDefaultEvent( sceneId, selfId,targetId )
	--PLANTFLAG[1] =0
	--PLANTFLAG[2] =0
	AbilityLevel = QueryHumanAbilityLevel( sceneId, selfId, ABILITY_ZHONGZHI)
	--�����Ҳ�����ֲ����
	if AbilityLevel == 0	then
		BeginEvent(sceneId)
			AddText(sceneId, "C�c h� n�n h�c k� n�ng tr�ng tr�t tr߾c")
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
		return
	end
	--�����m�t ���ֲ����
	if AbilityLevel ~= 0	then
		BeginEvent(sceneId)
			AddText(sceneId, "Xin ch�n lo�i v�t tr�ng")
			--ͨ��x714107_g_eventList��scriptglobal��to� � ֲ���б��Ա�,�����������ֲ���ܵ�c�p����ʾ��Ӧֲ��
			for i, scriptId in x714107_g_eventList do	--����C�i n�y �����˿�����ֲto� � ֲ���б�
				for j,g_ZhiWuId in V_ZHONGZHI_ID do		--����scriptglobal��to� � ����ֲ���б�
					if scriptId == g_ZhiWuId then
						if AbilityLevel >= V_ZHONGZHI_NEEDLEVEL[j] then --��������ֲ���ܵ�c�p>=��ֲ��Ҫ���ܵ�c�p]
							AddNumText(sceneId, x714107_g_eventList[i], V_ZHONGZHI_NAME[j],6,-1)
							break
						end
					end
				end
			end
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end
end

--**********************************
--�¼��б�ѡ��m�t ��
--**********************************
function x714107_OnEventRequest( sceneId, selfId, targetId, scriptId )
	zhiwuId = scriptId
	for i, findId in x714107_g_eventList do
		if zhiwuId == findId then
			CallScriptFunction( 713550, "OnDefaultEvent",sceneId, selfId, targetId, zhiwuId )
			return
		end
	end
end

--**********************************
--Ti�p th���NPCto� � ����(��ʱ��������ӿ�)
--**********************************
function x714107_OnMissionSubmit( sceneId, selfId, targetId, scriptId )
	for i, findId in x714107_g_eventList do
		if scriptId == findId then
			ret = CallScriptFunction( scriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( scriptId, "OnAccept", sceneId, selfId, ABILITY_ZHONGZHI )
				CallScriptFunction( scriptId, "OnDefaultEvent",sceneId, selfId, targetId, ABILITY_ZHONGZHI )
			end
			return
		end
	end
end

--**********************************
--Ti�p th���NPCto� � ����
--**********************************
function x714107_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x714107_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId, ABILITY_ZHONGZHI )	
			end
			return
		end
	end
end

