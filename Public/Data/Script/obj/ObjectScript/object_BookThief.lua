--B�o th� thi�t t�c

x807003_g_scriptId=807003

--**********************************
--�¼��������
--**********************************
function x807003_OnDefaultEvent( sceneId, selfId, targetId )

	--�ж���ng���ܹ������npcto� � ����
	
	local npcLevel = GetCharacterLevel(sceneId, targetId)

	--ȡ �i�m��Ҹ���to� � ��������(�����Լ�)
	local nearteammembercount = GetNearTeamCount( sceneId, selfId )
	if  nearteammembercount < 3 then	
		BeginEvent(sceneId)
			AddText(sceneId, "#{ZSSFC_090211_07}")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		
		return
	end
	
	local maxLevel = 0
	for	i = 0, nearteammembercount - 1 do
		local memberID = GetNearTeamMember( sceneId, selfId, i )
		local memberLevel = GetLevel(sceneId, memberID)
		if memberLevel > maxLevel then
			maxLevel = memberLevel
		end
	end
	
	if maxLevel < npcLevel then
		BeginEvent(sceneId)
			AddText(sceneId, "#{ZSSFC_090211_08}")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		
		return
	end
	
	--����npc
	--���öԹ�Ϊ�ж�to� �  Ŀǰ��ng28����ng�ж�to� � ,������˸ı�����Ӧto� � �����������ҾͲ��ˣ���:-(((
	SetUnitReputationID(sceneId, selfId, targetId, 28)

end

function x807003_OnDie(sceneId, selfId, killerId)

end

