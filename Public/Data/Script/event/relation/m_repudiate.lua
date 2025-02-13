--C��ng b�c ly h�n����

--�ű���
x806004_g_ScriptId		= 806004

--C��ng b�c ly h�n
x806004_g_Repudiate						= {}
x806004_g_Repudiate["Id"]			= 1002
x806004_g_Repudiate["Name"]		= "C��ng b�c ly h�n"
x806004_g_Repudiate["Skills"]	= { {260,"K� n�ng phu th� c�p 1"}, {261,"K� n�ng phu th� c�p 2"}, {262,"K� n�ng phu th� c�p 3"},
													{263,"K� n�ng phu th� c�p 4"}, {264,"K� n�ng phu th� c�p 5"}, {265,"K� n�ng phu th� c�p 6"},
													{266,"K� n�ng phu th� c�p 7"}, {267,"K� n�ng phu th� c�p 8"}, {268,"K� n�ng phu th� c�p 9"} }

--��ʾ��Ϣ
x806004_g_msg_rep					= {}
x806004_g_msg_rep["mar"]	= "  Ng߽i ch�a k�t h�n, �� mu�n ly h�n?"
x806004_g_msg_rep["gld"]	= "  C�n mang #{_EXCHG200000} m�i c� th� ly h�n"

--**********************************
--������ں��� �������
--**********************************
function x806004_OnDefaultEvent( sceneId, selfId, targetId )
	if x806004_CheckAccept( sceneId, selfId, targetId ) == 0 then
		return 0
	end
	
	--ͬ�����
	if GetNumText() == 1 then
		x806004_OnAccept( sceneId, selfId )
		
		--�رս���		
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
		return 1
	end
	--��ͬ�����
	if GetNumText() == 2 then
		--�رս���		
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
		return 1
	end
	
	x806004_OnSubmit( sceneId, selfId, targetId )
	return 1
end

--**********************************
--�о��¼�
--**********************************
function x806004_OnEnumerate( sceneId, selfId, targetId )
	if LuaFnIsMarried( sceneId, selfId ) > 0 then
		AddNumText( sceneId, x806004_g_ScriptId, x806004_g_Repudiate["Name"] , 6, -1 )
	end
end

--**********************************
--���Ti�p th�����
--**********************************
function x806004_CheckAccept( sceneId, selfId, targetId )
	--(1)�ѻ�
	if LuaFnIsMarried( sceneId, selfId ) == 0 then
		x806004_MessageBox( sceneId, selfId, targetId, x806004_g_msg_rep["mar"] )
		return 0
	end
	
	--(2)���to� � ������Я����Ǯ���ڵ���N=200000
	--if LuaFnGetMoney( sceneId, selfId ) < 200000 then
	--hzp 2008-12-10
		local nMoneyJZ = GetMoneyJZ(sceneId, selfId);
		local nMoneyJB = LuaFnGetMoney(sceneId, selfId);
		local nMoneySelf = nMoneyJZ + nMoneyJB;
	if nMoneySelf < 200000 then
		x806004_MessageBox( sceneId, selfId, targetId, x806004_g_msg_rep["gld"] )
		return 0
	end

	return 1
end

--**********************************
--ȷ��˫����Ը���
--**********************************
function x806004_OnSubmit( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "  Ng߽i h�y x�c nh�n c�n c��ng ch� ly h�n kh�ng?" )
		AddNumText( sceneId, x806004_g_ScriptId, "C�", 6, 1 )		-- 9 + i �ƶ��ͻ����ض�to� � ͼ�� (ѡ��ͼ��Ϊ������)
		AddNumText( sceneId, x806004_g_ScriptId, "Kh�ng", 8, 2 )		-- 9 + i �ƶ��ͻ����ض�to� � ͼ�� (ѡ��ͼ��Ϊ������)
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--Ti�p th�
--**********************************
function x806004_OnAccept( sceneId, selfId )
	--C�n ��c�p����
	if LuaFnIsPasswordSetup( sceneId, selfId, 0 ) == 1 then
		if LuaFnIsPasswordUnlocked( sceneId, selfId, 1 ) == 0 then
			return
		end
	end
	
	--(1)�۳����ng������Ͻ�Ǯ200000
	--LuaFnCostMoney( sceneId, selfId, 200000 )
	LuaFnCostMoneyWithPriority(sceneId, selfId, 200000);	
	--(2)���Ѷ����ó�N=X(10),XΪ�ܹ������Է�T�i ��to� � ���ֵ
	local SpouseGUID = LuaFnGetSpouseGUID( sceneId, selfId )
	LuaFnSetFriendPointByGUID( sceneId, selfId, SpouseGUID, 10 )

	--(3)ɾ���ƺ�
	LuaFnAwardSpouseTitle( sceneId, selfId, "" )
	DispatchAllTitle( sceneId, selfId )

	--(4)ɾ�����޼���
	local skillId
	for _, skillId in x806004_g_Repudiate["Skills"] do
		DelSkill( sceneId, selfId, skillId[1] )
	end
	
	NewSkill = { 250, 251, 252, 253, 254, 255, 256, 257, 258, 259 }
	for _, skillId in NewSkill do
		DelSkill( sceneId, selfId, skillId )
	end
	
	--ɾ����Ӱ���뼼��
	for _, skillId in { 269,270,271,272,273 } do
		DelSkill( sceneId, selfId, skillId )
	end
	
	local SpouseName	= LuaFnGetFriendName( sceneId, selfId, SpouseGUID )
	local selfName		= LuaFnGetName( sceneId, selfId )

	--����ͨ�ʼ�����ż֪ͨ���
	LuaFnSendSystemMail( sceneId, SpouseName, selfName .. " �� ch�n c��ng ch� ly h�n v�i ng߽i, t�y v�o duy�n s� v�y" )
	--LuaFnSendNormalMail( sceneId, selfId, SpouseName, selfName .. "��ѡ��������C��ng b�c ly h�n��,��,��Ե��.���ڻ�������,� gi�y�ѧ���޼�����ȫ�����." )
	
	--ɾ����Ӧ���ʱto� � ����
	CallScriptFunction(250036, "OnAbandon", sceneId, selfId);
	CallScriptFunction(250037, "OnAbandon", sceneId, selfId);

	--����ִ���ʼ�����ż��ִ�����
	LuaFnSendScriptMail( sceneId, SpouseName, MAIL_REPUDIATE, LuaFnGetGUID( sceneId, selfId ), 0, 0 )

	LuaFnDivorce( sceneId, selfId )
end

--**********************************
--�Ի�������Ϣ��ʾ
--**********************************
function x806004_MessageBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
