--Th�nh Th� S�n��������

--�ű���
x808066_g_ScriptId	= 808066

--NPC����
x808066_g_BigBox = {

	Name			= "B�ch m�ng b�o t߽ng",
	MonsterID	= 5011,
	PosX			= 142,
	PosY			= 112,
	ScriptID	= 808067

}

--��ǰto� � ������ng���T�i ....1��T�i  0����T�i 
x808066_g_IsBigBoxExist = 0

--��ǰ��ng������T�i M� ra ����....
x808066_g_IsBigBoxOpening = 0
x808066_g_OpeningPlayerName = "(ERROR)"

--��T�i ������to� � �˿�ʼ������to� � ʱ��....
x808066_g_PlayerOpeningTime = 0

--������ID
x808066_g_SkillBooks = {

			30402051,
			30402052,
			30402053,
			30402054,
			30402012,
			30402014,
			30402016,
			30402018,
			30402020,
			30402088,
			30402090,
			30402026,
			30402030,
			30402032,
			30402034,
			30402036,
			30402038,
			30402040,
			30402042,
			30402044,
			30402046,
			30402048,
			30402050,
			30402056,
			30402060,
			30402062,
			30402064,
			30402066,
			30402068,
			30402070,
			30402072,
			30402074
}

x808066_g_SkillBooksNormal = {

			30402051,
			30402052,
			30402053,
			30402054,
			30402012,
			30402014,
			30402016,
			--30402018,
			30402020,
			--30402088,
			--30402090,
			--30402026,
			30402030,
			30402032,
			30402034,
			30402036,
			30402038,
			--30402040,
			30402042,
			30402044,
			--30402046,
			30402048,
			30402050,
			--30402056,
			--30402060,
			30402062,
			30402064,
			30402066,
			--30402068,
			30402070,
			--30402072,
			30402074
}

--����to� � BOSSto� � ���ݱ�....
x808066_g_BOSSData = {

	{ ID = 3845, PosX = 144, PosY = 112, BaseAI = 15, ExtAIScript = 0, ScriptID = -1, PatrolId = 0 },
	{ ID = 3846, PosX = 140, PosY = 112, BaseAI = 15, ExtAIScript = 0, ScriptID = -1, PatrolId = 1 },
	{ ID = 3847, PosX = 140, PosY = 113, BaseAI = 15, ExtAIScript = 0, ScriptID = -1, PatrolId = 2 },
	{ ID = 3848, PosX = 144, PosY = 113, BaseAI = 15, ExtAIScript = 0, ScriptID = -1, PatrolId = 3 },

}

--���������....�ж�������͵����ٵ����....
x808066_g_DropBox = {

	{ PosX = 135, PosY = 108 },
	{ PosX = 136, PosY = 112 },
	{ PosX = 138, PosY = 108 },
	{ PosX = 143, PosY = 113 },
	{ PosX = 146, PosY = 109 },
	{ PosX = 147, PosY = 109 },

	{ PosX = 135, PosY = 113 },
	{ PosX = 137, PosY = 113 },
	{ PosX = 138, PosY = 114 },
	{ PosX = 143, PosY = 115 },
	{ PosX = 146, PosY = 112 },
	{ PosX = 147, PosY = 113 },

	{ PosX = 135, PosY = 115 },
	{ PosX = 137, PosY = 115 },
	{ PosX = 138, PosY = 116 },
	{ PosX = 143, PosY = 117 },
	{ PosX = 146, PosY = 114 },
	{ PosX = 147, PosY = 115 },

	{ PosX = 135, PosY = 117 },
	{ PosX = 147, PosY = 117 },

}

--�����to� � ��Ʒ�����....
x808066_g_DropBoxItem = {

	{ odds = 100, itemId =30505145 },

}

--**********************************
--�¼��������
--**********************************
function x808066_OnDefaultEvent( sceneId, actId, param1, param2, param3, param4, param5 )

	--������ng�񴴽���to� � ���䶼������....
	local message = format("@*;SrvMsg;SCA:#{ShengShouBigBoxNotice}" )
	AddGlobalCountNews( sceneId, message )

	--�׵罻������Ч��....
	local curWeather = LuaFnGetSceneWeather(sceneId)
	if not curWeather or curWeather ~= -1 then
		--�Ѿ����������򲻸ı�����....
	else
		LuaFnSetSceneWeather(sceneId, 3, 5*60*1000 )
	end

	--����Ѿ����˾Ͳ��ٴ�����to� � ����....
	if x808066_g_IsBigBoxExist == 1 then
		return
	end

	--û���򴴽�NPC����....
	local MstId = LuaFnCreateMonster(sceneId, x808066_g_BigBox.MonsterID, x808066_g_BigBox.PosX, x808066_g_BigBox.PosY, 3, 0, x808066_g_BigBox.ScriptID )
	SetCharacterName( sceneId, MstId, x808066_g_BigBox.Name )
	x808066_g_IsBigBoxExist = 1

end

--**********************************
--�����ng����Դ򿪴���....
--**********************************
function x808066_CheckOpenBigBox( sceneId, selfId )

	--������ng���T�i ....
	if x808066_g_IsBigBoxExist == 0 then
		return 0, "(ERROR)"
	end

	--���������T�i ������....
	if x808066_g_IsBigBoxOpening == 1 then

		--�����ng�Լ�T�i ��....
		if x808066_g_OpeningPlayerName == LuaFnGetName( sceneId, selfId ) then
			return 1, "(ERROR)"
		end

		--�����ng����T�i ���������Ѿ���ʱ��....����λ��������....
		local NowTime = LuaFnGetCurrentTime()
		if (NowTime - x808066_g_PlayerOpeningTime) > 150 then
			x808066_g_PlayerOpeningTime = NowTime
			x808066_g_OpeningPlayerName = LuaFnGetName( sceneId, selfId )
			return 1, "(ERROR)"
		else
			return -1, x808066_g_OpeningPlayerName
		end

	end

	--û����T�i ������....
	x808066_g_IsBigBoxOpening = 1
	x808066_g_PlayerOpeningTime = LuaFnGetCurrentTime()
	x808066_g_OpeningPlayerName = LuaFnGetName( sceneId, selfId )
	return 1, "(ERROR)"

end

--**********************************
--��ҿ����䱻����¼�(�ɴ���ű�����)....
--**********************************
function x808066_OnCancelOpen( sceneId )

	x808066_g_IsBigBoxOpening = 0
	x808066_g_OpeningPlayerName = "(ERROR)"
	x808066_g_PlayerOpeningTime = 0

end

--**********************************
--���䱻���¼�(�ɴ���ű�����)....
--**********************************
function x808066_OnBigBoxOpen( sceneId, selfId, activatorId )

	local rand = random(100)
	if rand <= 33 then
		--����������....
		x808066_GiveSkillBook( sceneId, selfId, activatorId )
	elseif rand <= 66 then
		--����BOSS....
		x808066_GiveBOSS( sceneId, selfId, activatorId )
	else
		--����m�t �ѵ����....
		x808066_GiveDropBox( sceneId, selfId, activatorId )
	end

	--kill����....������������Ϊ�򿪸���....
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 169, 0);
	LuaFnGmKillObj( sceneId, activatorId, selfId )

	--ͳ��....
	LuaFnAuditShengShouOpenBigBox(sceneId, activatorId)

	x808066_g_IsBigBoxExist = 0
	x808066_g_IsBigBoxOpening = 0
	x808066_g_OpeningPlayerName = "(ERROR)"
	x808066_g_PlayerOpeningTime = 0

end

--**********************************
--���䱻���¼�_��������....
--**********************************
function x808066_GiveSkillBook( sceneId, selfId, activatorId )

	--��������m�t ��������....������....
	local rand = random(100)
	
	local numBooks
	local randBook
	local BookID
	
	if (rand < 80) then			--80%����T�i ���п��ܵ���to� � �������
		numBooks = getn(x808066_g_SkillBooks)
		randBook = random(numBooks)
		BookID = x808066_g_SkillBooks[ randBook ]
	else										--20%������10���ض�����
		numBooks = getn(x808066_g_SkillBooksNormal)
		randBook = random(numBooks)
		BookID = x808066_g_SkillBooksNormal[ randBook ]
	end

	--����Ʒ������....
	local BagIndex = TryRecieveItem( sceneId, activatorId, BookID, QUALITY_MUST_BE_CHANGE )
	if BagIndex ~= -1 then

		BeginEvent( sceneId )
			AddText( sceneId, "C�c h� �� nh�n ���c m�t c�i#{_ITEM"..BookID.."}" )
		EndEvent( sceneId )
		DispatchMissionTips( sceneId, activatorId )

		--����....
		local ItemTransfer = GetBagItemTransfer(sceneId,activatorId,BagIndex)
		local PlayerName = GetName(sceneId, activatorId)
		local str = format( "#W#{_INFOUSR%s}#PT�i #GTh�nh Th� S�n#P c� y�n ph�ng h�a kh�ng c�n th�n �nh m�t, m� h� b�n trong ��nh v�o #Y��i b�o s߽ng #P, m� ra v�a th�y, d� nhi�n l� m�t quy�n #{_INFOMSG%s}.", PlayerName, ItemTransfer )
		BroadMsgByChatPipe( sceneId, activatorId, str, 4 )

	end

	--kill����....������������Ϊ�򿪸���....
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 169, 0);
	LuaFnGmKillObj( sceneId, activatorId, selfId )

end

--**********************************
--���䱻���¼�_����BOSS....
--**********************************
function x808066_GiveBOSS( sceneId, selfId, activatorId )

	--ˢBOSS....
	local MstId
	for _, BOSSData in x808066_g_BOSSData do
		MstId = LuaFnCreateMonster(sceneId, BOSSData.ID, BOSSData.PosX, BOSSData.PosY, BOSSData.BaseAI, BOSSData.ExtAIScript, BOSSData.ScriptID )
		SetCharacterDieTime(sceneId, MstId, 2*60*60*1000 )
		SetPatrolId(sceneId, MstId, BOSSData.PatrolId)
	end

	--����....
	local PlayerName = GetName(sceneId, activatorId)
	local str = format( "#GTh�nh Th� S�n#P Th��ng qu�n anh �o�t b�o, duy #W#{_INFOUSR%s}#P t�i cao m�t b�c, h�n chi�n b�n trong m�t ch߷ng �em #YB�ch m�ng b�o t߽ng#P ��nh ng�, kh�ng ng� nh�ng l�i nh�y ra b�n #WB�o t߽ng �ng t� #P!", PlayerName )
	BroadMsgByChatPipe( sceneId, activatorId, str, 4 )

end

--**********************************
--���䱻���¼�_����m�t �ѵ����....
--**********************************
function x808066_GiveDropBox( sceneId, selfId, activatorId )

	--������Ȩ��....
	local totalOdds = 0
	for _, item in x808066_g_DropBoxItem do
		totalOdds = totalOdds  + item.odds
	end
	if totalOdds < 1 then
		return
	end

	--�������....
	local BoxId = -1
	local DropItemId = -1
	local randValue = 0
	for _, box in x808066_g_DropBox do

		--���㱾������to� � ��Ʒ....
		randValue = random(1, totalOdds);
		randValue = randValue - 1;
		for _, item in x808066_g_DropBoxItem do
			if item.odds >= randValue then
				DropItemId = item.itemId;
				break;
			end
			randValue = randValue - item.odds;
		end

		--�ŵ������������....
		if DropItemId > 0 then
			BoxId = DropBoxEnterScene( box.PosX, box.PosY, sceneId )
			if BoxId > -1 then
				AddItemToBox(sceneId,BoxId,QUALITY_CREATE_BY_BOSS,1,DropItemId)
			end
		end

	end
	
	--����....
	local PlayerName = GetName(sceneId, activatorId)
	local str = format( "#GTh�nh Th� S�n#W#{_INFOUSR%s}#P qu�n h�o � c� m� ra #YB�ch m�ng b�o t߽ng#P, ch� th�y kim quang hi�n l�n, kh�p c� t�i b�o, ti�ng hoan h� vang d�i.", PlayerName )
	BroadMsgByChatPipe( sceneId, activatorId, str, 4 )

end

function x808066_OnPlayerPickUpItemInBoar( sceneId, selfId, itemId, bagidx )

	--����....
	if itemId == 40004429 then

		local playerName = GetName(sceneId, selfId)
		local transfer = GetBagItemTransfer(sceneId,selfId,bagidx)
		local str = format( "#{BoarItem_Info_001}#{_INFOUSR%s}#{BoarItem_Info_002}#{_INFOMSG%s}#{BoarItem_Info_003}", playerName, transfer)

		BroadMsgByChatPipe(sceneId, selfId, str, 4)

	end
	
end
