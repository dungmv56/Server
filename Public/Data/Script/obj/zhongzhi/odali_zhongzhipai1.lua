--��i L�
--��ֲ��1

--�ű���
x714057_g_ScriptId = 714057

event_xuanzezhiwu = 713550

--ֲ���Ʒ����б�
x714057_g_eventList={20104001,20104002,20104005,20104007,20104009,20104012,
			20105001,20105004,20105007,20105012} --ֲ��to� � ���,����ngeventId
--**********************************
--�¼��������
--**********************************
function x714057_OnDefaultEvent( sceneId, selfId,targetId )
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
			AddText(sceneId, "M�i m�t v�t tr�ng �u c� th� chia th�nh 2 lo�i: thu ho�ch s�m v� mu�n. Th�i gian tr߷ng th�nh c�a lo�i thu ho�ch s�m ch�ng 5 ph�t. Th�i gian tr߷ng th�nh c�a lo�i thu ho�ch mu�n ch�ng 70 ph�t. Nh�ng k�t qu� thu ho�ch ���c r�t nhi�u. anh ch�n lo�i n�o?")
			AddNumText(sceneId, x714057_g_ScriptId, "Tr�ng lo�i thu ho�ch s�m",6,254)
			AddNumText(sceneId, x714057_g_ScriptId, "Tr�ng lo�i thu ho�ch mu�n",6,255)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end
end

--**********************************
--�¼��б�ѡ��m�t ��
--**********************************
function x714057_OnEventRequest( sceneId, selfId, targetId, eventId )
	local name_Index
	local NumText = GetNumText()

	if NumText == 254 or NumText == 255 then
		BeginEvent(sceneId)
			AddText(sceneId, "Xin ch�n lo�i v�t tr�ng")
			--ͨ��x714057_g_eventList��scriptglobal��to� � ֲ���б��Ա�,�����������ֲ���ܵ�c�p����ʾ��Ӧֲ��
			for i, eventId in x714057_g_eventList do	--����C�i n�y �����˿�����ֲto� � ֲ���б�
				for j,g_ZhiWuId in V_ZHONGZHI_ID do		--����scriptglobal��to� � ����ֲ���б�
					if eventId == g_ZhiWuId then
						AbilityLevel = QueryHumanAbilityLevel( sceneId, selfId, ABILITY_ZHONGZHI)
						if AbilityLevel >= V_ZHONGZHI_NEEDLEVEL[j] then --��������ֲ���ܵ�c�p>=��ֲ��Ҫ���ܵ�c�p]
							
							if NumText == 254 then
								name_Index = j								
							else
								name_Index = j + getn(V_ZHONGZHI_NAME)/2
							end

							AddNumText(sceneId, x714057_g_ScriptId, V_ZHONGZHI_NAME[name_Index],6,name_Index)
							break
						end
					end
				end
			end
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return

	end
	
	zhiwuId = NumText
	for i, findId in x714057_g_eventList do
		if zhiwuId <= getn(V_ZHONGZHI_NAME) then
			CallScriptFunction( 713550, "OnDefaultEvent",sceneId, selfId, targetId, zhiwuId )
			return
		end
	end
end

--**********************************
--Ti�p th���NPCto� � ����(��ʱ��������ӿ�)
--**********************************
function x714057_OnMissionSubmit( sceneId, selfId, targetId, scriptId )
	for i, findId in x714057_g_eventList do
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
function x714057_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x714057_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId, ABILITY_ZHONGZHI )	
			end
			return
		end
	end
end

