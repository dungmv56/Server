--Ʈ��� � L�o ��iAI

--A	�������յ��������Ⱥ��....
--B ����Զ�ҩ����ͨ����....ȫ���������m�t c�i�˶����ͷſռ���....�ٸ����c�ibuff....
--C ���̲���¶�����Լ�ʹ��m�t c�i�ռ���....ͬʱT�i ��ǰ���˽��·�c�i����....
--D �����Ա任��ÿ��5 gi�y��ȫ���������˼�m�t c�ibuff....

--ȫ�̶����������ƶ�����to� � buff....
--20 gi�y��ʼѭ���ͷ�ABC����....��ȴ20 gi�y....
--ÿ5 gi�yʹ��m�t ��D....
--BOSS����������Cu�c chi�n ������������Dto� � buff....


--�ű���
x402279_g_ScriptId	= 402279

--�����߼��ű���....
x402279_g_FuBenScriptId = 402276

--����Buff....
x402279_Buff_MianYi1	= 10472	--����m�t Щ����Ч��....
x402279_Buff_MianYi2	= 10471	--������ͨ����....

--ABC����....
x402279_SkillA			= 1111	--�򵥰���翷�ʹ���˺�������to� � �汾....
x402279_SkillB			= 1112	--�򵥰���翷�ʹ���˺�������to� � �汾....
x402279_BuffB				= 19803	--�򵥰���翷�ʹ���˺�������to� � �汾....
x402279_SkillC			= 1113	--�򵥰���翷�ʹ���˺�������to� � �汾....
x402279_SpeObjC			= 72	--�򵥰���翷�ʹ���˺�������to� � �汾....
x402279_SkillABC_CD	=	20000

--D����....
x402279_BuffD				= 19801	--�򵥰���翷�ʹ���˺�������to� � �汾....
x402279_SkillD_CD		= 5000


--AI Index....
x402279_IDX_CD_SkillABC		= 1	--ABC����to� � CD....
x402279_IDX_CurSkillIndex	= 2	--��������ʹ��ABC��to� � ��c�i����....
x402279_IDX_CD_SkillD			= 3	--D����to� � CD....

x402279_IDX_CombatFlag 		= 1	--��ng����Cu�c chi�n ״̬to� � ��־....


--**********************************
--��ʼ��....
--**********************************
function x402279_OnInit(sceneId, selfId)
	--����AI....
	x402279_ResetMyAI( sceneId, selfId )

end


--**********************************
--����....
--**********************************
function x402279_OnHeartBeat(sceneId, selfId, nTick)

	--�����ng����ng����....
	if LuaFnIsCharacterLiving(sceneId, selfId) ~= 1 then
		return
	end

	--�����ng��T�i Cu�c chi�n ״̬....
	if 0 == MonsterAI_GetBoolParamByIndex( sceneId, selfId, x402279_IDX_CombatFlag ) then
		return
	end

	--ABC��������....
	if 1 == x402279_TickSkillABC( sceneId, selfId, nTick ) then
		return
	end

	--D��������....
	if 1 == x402279_TickSkillD( sceneId, selfId, nTick ) then
		return
	end

end


--**********************************
--����Cu�c chi�n ....
--**********************************
function x402279_OnEnterCombat(sceneId, selfId, enmeyId)

	--�ӳ�ʼbuff....
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x402279_Buff_MianYi1, 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x402279_Buff_MianYi2, 0 )

	--����AI....
	x402279_ResetMyAI( sceneId, selfId )

	--���ý���Cu�c chi�n ״̬....
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x402279_IDX_CombatFlag, 1 )

end


--**********************************
--�뿪Cu�c chi�n ....
--**********************************
function x402279_OnLeaveCombat(sceneId, selfId)

	--����AI....
	x402279_ResetMyAI( sceneId, selfId )

	--ɾ���Լ�....
	LuaFnDeleteMonster( sceneId, selfId )

	--�����Ի�NPC....
	local MstId = CallScriptFunction( x402279_g_FuBenScriptId, "CreateBOSS", sceneId, "WuLaoDa_NPC", -1, -1 )
	SetUnitReputationID( sceneId, MstId, MstId, 0 )

end


--**********************************
--ɱ������....
--**********************************
function x402279_OnKillCharacter(sceneId, selfId, targetId)

end


--**********************************
--����....
--**********************************
function x402279_OnDie( sceneId, selfId, killerId )

	--����AI....
	x402279_ResetMyAI( sceneId, selfId )

	--ɾ���Լ�....
	SetCharacterDieTime( sceneId, selfId, 3000 )

	--M� ra � L�o ��i����to� � ��ʱ��....
	local x,z = GetWorldPos( sceneId, selfId )
	CallScriptFunction( x402279_g_FuBenScriptId, "OpenWuLaoDaDieTimer", sceneId, 4, x402279_g_ScriptId, x, z )

	--�����Ѿ�Khi�u chi�n��� L�o ��i....
	CallScriptFunction( x402279_g_FuBenScriptId, "SetBossBattleFlag", sceneId, "WuLaoDa", 2 )

	--�����û��Khi�u chi�n��˫�������Khi�u chi�n˫��....
	if 2 ~= CallScriptFunction( x402279_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "ShuangZi" )	then
		CallScriptFunction( x402279_g_FuBenScriptId, "SetBossBattleFlag", sceneId, "ShuangZi", 1 )
	end
	-- zchw ȫ�򹫸�
	local	playerName	= GetName( sceneId, killerId )
	
	--ɱ������to� � ��ng�����m�t �ȡ������to� � T�n....
	local playerID = killerId
	local objType = GetCharacterType( sceneId, killerId )
	if objType == 3 then
		playerID = GetPetCreator( sceneId, killerId )
		playerName = GetName( sceneId, playerID )
	end
	
	--������������m�t �ȡ�ӳ�to� � T�n....
	local leaderID = GetTeamLeader( sceneId, playerID )
	if leaderID ~= -1 then
		playerName = GetName( sceneId, leaderID )
	end
	
	if playerName ~= nil then
		str = format("#{_INFOUSR%s}#{XPM_8724_4}", playerName);      --� L�o ��i
		AddGlobalCountNews( sceneId, str )
	end

end


--**********************************
--����AI....
--**********************************
function x402279_ResetMyAI( sceneId, selfId )

	--���ò���....
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x402279_IDX_CD_SkillABC, x402279_SkillABC_CD )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x402279_IDX_CurSkillIndex, 1 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x402279_IDX_CD_SkillD, x402279_SkillD_CD )
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x402279_IDX_CombatFlag, 0 )

	--�����������Dto� � buff....
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 then
			LuaFnCancelSpecificImpact( sceneId, nHumanId, x402279_BuffD )
		end
	end

end


--**********************************
--ABC��������....
--**********************************
function x402279_TickSkillABC( sceneId, selfId, nTick )

	--���¼���CD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x402279_IDX_CD_SkillABC )
	if cd > nTick then

		MonsterAI_SetIntParamByIndex( sceneId, selfId, x402279_IDX_CD_SkillABC, cd-nTick )
		return 0

	else

		MonsterAI_SetIntParamByIndex( sceneId, selfId, x402279_IDX_CD_SkillABC, x402279_SkillABC_CD-(nTick-cd) )

		local CurSkill = MonsterAI_GetIntParamByIndex( sceneId, selfId, x402279_IDX_CurSkillIndex )
		if CurSkill == 1 then
			MonsterAI_SetIntParamByIndex( sceneId, selfId, x402279_IDX_CurSkillIndex, 2 )
			return x402279_UseSkillA( sceneId, selfId )
		elseif CurSkill == 2 then
			MonsterAI_SetIntParamByIndex( sceneId, selfId, x402279_IDX_CurSkillIndex, 3 )
			return x402279_UseSkillB( sceneId, selfId )
		elseif CurSkill == 3 then
			MonsterAI_SetIntParamByIndex( sceneId, selfId, x402279_IDX_CurSkillIndex, 1 )
			return x402279_UseSkillC( sceneId, selfId )
		end

	end

end


--**********************************
--D��������....
--**********************************
function x402279_TickSkillD( sceneId, selfId, nTick )

	--���¼���CD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x402279_IDX_CD_SkillD )
	if cd > nTick then

		MonsterAI_SetIntParamByIndex( sceneId, selfId, x402279_IDX_CD_SkillD, cd-nTick )
		return 0

	else

		MonsterAI_SetIntParamByIndex( sceneId, selfId, x402279_IDX_CD_SkillD, x402279_SkillD_CD-(nTick-cd) )
		return x402279_UseSkillD( sceneId, selfId )

	end

end


--**********************************
--ʹ��A����....
--**********************************
function x402279_UseSkillA( sceneId, selfId )

	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x402279_SkillA, selfId, x, z, 0, 1 )
	return 1

end


--**********************************
--ʹ��B����....
--**********************************
function x402279_UseSkillB( sceneId, selfId )

	--��������Чto� � ���to� � �б�....
	local PlayerList = {}

	--����Чto� � �˼����б�....
	local numPlayer = 0
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 and LuaFnIsCharacterLiving(sceneId, nHumanId) == 1 then
			PlayerList[numPlayer+1] = nHumanId
			numPlayer = numPlayer + 1
		end
	end

	--�����ѡm�t c�i���....
	if numPlayer <= 0 then
		return 0
	end
	local PlayerId = PlayerList[ random(numPlayer) ]

	--����ʹ�ü���....
	local x,z = GetWorldPos( sceneId, PlayerId )
	LuaFnUnitUseSkill( sceneId, selfId, x402279_SkillB, PlayerId, x, z, 0, 1 )

	--�����buff....
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, PlayerId, x402279_BuffB, 0 )

	return 1

end


--**********************************
--ʹ��C����....
--**********************************
function x402279_UseSkillC( sceneId, selfId )

	-- ��t ���c��ǰ����....
	local enemyId = GetMonsterCurEnemy( sceneId, selfId )
	if enemyId <= 0 then
		return 0
	end
	if GetCharacterType( sceneId, enemyId ) == 3 then
		enemyId = GetPetCreator( sceneId, enemyId )
	end

	--T�i �õ��˽��·�c�i����....
	local x,z = GetWorldPos( sceneId, enemyId )
	CreateSpecialObjByDataIndex( sceneId, selfId, x402279_SpeObjC, x, z, 0 )

	--����....
	MonsterTalk( sceneId, -1, "", "#{PMF_20080530_17}" )

	--���Լ�ʹ��m�t c�iֻ����Чto� � �ռ���....
	x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x402279_SkillC, selfId, x, z, 0, 1 )

	return 1

end


--**********************************
--ʹ��D����....
--**********************************
function x402279_UseSkillD( sceneId, selfId )

	--�������������˼�buff....
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 and LuaFnIsCharacterLiving(sceneId, nHumanId) == 1 then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, nHumanId, x402279_BuffD, 0 )
		end
	end

end


--**********************************
--� L�o ��i������ʱ��OnTimer....
--���ڿ����������ӳ�ˢ��ս��� L�o ��i....
--**********************************
function x402279_OnHaDaBaDieTimer( sceneId, step, posX, posY )

	if 1 == step then
		--����ս��to� � � L�o ��iNPC....
		local MstId = CallScriptFunction( x402279_g_FuBenScriptId, "CreateBOSS", sceneId, "WuLaoDaLoss_NPC", posX, posY )
		SetUnitReputationID( sceneId, MstId, MstId, 0 )
		SetPatrolId(sceneId, MstId, 0)
	end

end
