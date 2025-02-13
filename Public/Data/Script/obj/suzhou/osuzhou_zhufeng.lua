--T� Ch�uNPC
--���
--��ͨ

x001069_g_ScriptId	= 001069

--������
x001069_g_Key				=
{
	["inf"]	= 1000,	--�������
	["ln"]	= 1,		--��ҪѧϰTinh���䷽ - Tinh�� - ����
	["zh"]	= 2,		--��ҪѧϰTinh���䷽ - Tinh�� - ����
	["gn"]	= 3,		--��ҪѧϰTinh���䷽ - Tinh�� - ����
	["sh"]	= 4,		--Tinh���䷽�̵�
}

--�̵���
x001069_g_shoptableindex=196

--**********************************
--�¼��������
--**********************************
function x001069_OnDefaultEvent( sceneId, selfId, targetId )

	BeginEvent( sceneId )
		AddText( sceneId, "    10 n�m � r�n ra 1 c�y ki�m, � c�a Chu Phong ta l�m ra l� t�t nh�t!" )
		if GetLevel( sceneId, selfId ) >= 10 then
			AddNumText( sceneId, x001069_g_ScriptId, "Ta mu�n h�c tinh luy�n (R�n) ph�i ph߽ng", 2, x001069_g_Key["ln"] )
			AddNumText( sceneId, x001069_g_ScriptId, "Ta mu�n h�c tinh ch� (May M�c) ph�i ph߽ng", 2, x001069_g_Key["zh"] )
			AddNumText( sceneId, x001069_g_ScriptId, "Ta mu�n h�c tinh c�ng (C�ng Ngh�) ph�i ph߽ng", 2, x001069_g_Key["gn"] )
			AddNumText( sceneId, x001069_g_ScriptId, "Mua tinh c�ng ph�i ph߽ng", 7, x001069_g_Key["sh"])
		end
		AddNumText( sceneId, x001069_g_ScriptId, "Gi�i thi�u ch� t�o", 11, x001069_g_Key["inf"] )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
	
end

--**********************************
--�¼��б�ѡ��m�t ��
--**********************************
function x001069_OnEventRequest( sceneId, selfId, targetId, eventId )

	local	key	= GetNumText()

	if key == x001069_g_Key["inf"] then
		x001069_MsgBox( sceneId, selfId, targetId, "#{INTRO_ZHIZAO}" )
	
	elseif key == x001069_g_Key["ln"] then
		if QueryHumanAbilityLevel( sceneId, selfId, 46 ) ~= 1 then
			SetHumanAbilityLevel( sceneId, selfId, 46, 1 )
		end
		for i = 644, 703 do
			SetPrescription( sceneId, selfId, i, 1 )
		end
		x001069_MsgBox( sceneId, selfId, targetId, "    Ch�c m�ng c�c h� �� h�c h�t t�t c� ph�i ph߽ng Tinh luy�n" )

	elseif key == x001069_g_Key["zh"] then
		if QueryHumanAbilityLevel( sceneId, selfId, 47 ) ~= 1 then
			SetHumanAbilityLevel( sceneId, selfId, 47, 1 )
		end
		for i = 704, 773 do
			SetPrescription( sceneId, selfId, i, 1 )
		end
		for i = 804, 883 do
			SetPrescription( sceneId, selfId, i, 1 )
		end
		x001069_MsgBox( sceneId, selfId, targetId, "    Ch�c m�ng c�c h� �� h�c h�t t�t c� ph�i ph߽ng Tinh ch�" )
	
	elseif key == x001069_g_Key["gn"] then
		if QueryHumanAbilityLevel( sceneId, selfId, 48 ) ~= 1 then
			SetHumanAbilityLevel( sceneId, selfId, 48, 1 )
		end
		for i = 774, 803 do
			SetPrescription( sceneId, selfId, i, 1 )
		end
		
		for i = 1064, 1075 do
			SetPrescription( sceneId, selfId, i, 1 )
		end
 		
		x001069_MsgBox( sceneId, selfId, targetId, "    Ch�c m�ng c�c h� �� h�c h�t t�t c� ph�i ph߽ng Tinh c�ng" )
	elseif key == x001069_g_Key["sh"] then
		DispatchShopItem( sceneId, selfId, targetId, x001069_g_shoptableindex )
	end

end

--**********************************
--Message Box
--**********************************
function x001069_MsgBox( sceneId, selfId, targetId, str )

	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
	
end
