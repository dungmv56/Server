--Th�nh Th� S�n��������
--����NPC�����ű�

--�ű���
x808067_g_ScriptId	= 808067

--Th�nh Th� S�n���������ű�
x808067_g_ActivityScriptId	= 808066

--����buff....
x808067_g_LimitiBuff = {

			50,
			112,
			1079,1080,1081,1082,1083,1084,1085,1086,1087,1088,1089,1090,
			1709,1710,1711,1712,1713,1714,1715,1716,1717,1718,1719,1720,
			7084,
			7085,

}


--**********************************
--���⽻��:�����ж�
--**********************************
function x808067_OnActivateConditionCheck( sceneId, selfId, activatorId )

	local strText = "Tr�ng th�i tr߾c m�t kh�ng th� m� ra"
	--�޵�״̬�޷�M� ra ����....
	if LuaFnIsUnbreakable(sceneId,activatorId) ~= 0 then
		BeginEvent(sceneId)
		 		AddText(sceneId,strText)
		 	EndEvent(sceneId)
		DispatchMissionTips(sceneId,activatorId)
		return 0
	end

	--����״̬�޷�M� ra ����....
	if LuaFnIsConceal(sceneId,activatorId) ~= 0 then
		BeginEvent(sceneId)
		 		AddText(sceneId,strText)
		 	EndEvent(sceneId)
		DispatchMissionTips(sceneId,activatorId)
		return 0
	end

	--����buff�޷�M� ra ....
	for i, impactId in x808067_g_LimitiBuff do
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, activatorId, impactId) == 1 then
			BeginEvent(sceneId)
			 		AddText(sceneId,strText)
			 	EndEvent(sceneId)
			DispatchMissionTips(sceneId,activatorId)
			return 0
		end
	end

	--��ⱳ����ng���еط�....
	if LuaFnGetPropertyBagSpace( sceneId, activatorId ) < 1 then
		BeginEvent(sceneId)
			AddText( sceneId, "Ch� tr�ng trong t�i x�ch kh�ng ��" )
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,activatorId)
		return 0
	end

	--�����ng����Կ�����....
	local bRet, PlayerName = CallScriptFunction( x808067_g_ActivityScriptId, "CheckOpenBigBox", sceneId, activatorId )

	if bRet == 0 then
		BeginEvent(sceneId)
		 		AddText(sceneId,"B�o v�t mong mu�n b� ng߶i �o�t �i r�i");
		 	EndEvent(sceneId)
		DispatchMissionTips(sceneId,activatorId)
		return 0
	end

	if bRet == -1 then
		BeginEvent(sceneId)
		 		AddText(sceneId, PlayerName.."�ang m� b�o t߽ng, t�m th�i kh�ng th� thao t�c");
		 	EndEvent(sceneId)
		DispatchMissionTips(sceneId,activatorId)
		return 0
	end

	return 1

end

--**********************************
--���⽻��:���ĺͿ۳�����
--**********************************
function x808067_OnActivateDeplete( sceneId, selfId, activatorId )
	return 1
end

--**********************************
--���⽻��:������ɹ���Ч����
--**********************************
function x808067_OnActivateEffectOnce( sceneId, selfId, activatorId )
	CallScriptFunction( x808067_g_ActivityScriptId, "OnBigBoxOpen", sceneId, selfId, activatorId )
	return 1
end

--**********************************
--���⽻��:������ÿʱ������Ч����
--**********************************
function x808067_OnActivateEffectEachTick( sceneId, selfId, activatorId )
	return 1
end

--**********************************
--���⽻��:������ʼʱto� � ���⴦��
--**********************************
function x808067_OnActivateActionStart( sceneId, selfId, activatorId )
		return 1
end

--**********************************
--���⽻��:��������ʱto� � ���⴦��
--**********************************
function x808067_OnActivateCancel( sceneId, selfId, activatorId )
	return 0
end

--**********************************
--���⽻��:�����ж�ʱto� � ���⴦��
--**********************************
function x808067_OnActivateInterrupt( sceneId, selfId, activatorId )
	CallScriptFunction( x808067_g_ActivityScriptId, "OnCancelOpen", sceneId )
	return 0
end
