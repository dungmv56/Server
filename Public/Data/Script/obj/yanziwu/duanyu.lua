-- 402256
-- �o�n D�

x402256_TBL = {}
x402256_TBL["IDX_TimerPrepare"] = 1
x402256_TBL["IDX_TimerInterval"] = 2
x402256_TBL["IDX_FlagCombat"] = 1
x402256_TBL["BossSkill"] = 1002
x402256_TBL["PrepareTime"] = 60000
x402256_TBL["SkillInterval"] = 60000
x402256_TBL["BossBuff"] = 9999


function x402256_OnDie( sceneId, selfId, killerId )
	MonsterAI_SetIntParamByIndex(sceneId, selfId, 1, 0)
	MonsterAI_SetIntParamByIndex(sceneId, selfId, 2, 0)
	MonsterAI_SetBoolParamByIndex(sceneId, selfId, 1, 0)
end

function x402256_OnDefaultEvent( sceneId, selfId, targetId )
	
end

function x402256_OnHeartBeat(sceneId, selfId, nTick)

	-- ���o�n D�Ѫ����to� � ʱ��,�ı��o�n D�to� � Ai����File
	if(1==LuaFnIsCharacterLiving(sceneId, selfId)) then
		if(1==MonsterAI_GetBoolParamByIndex(sceneId, selfId, 1)) then
			if GetHp(sceneId, selfId) <= GetMaxHp(sceneId, selfId) - 500 then
				--if GetAIScriptID(sceneId, selfId) == 245  then
					SetAIScriptID(sceneId, selfId, 246)
					
					-- �ı��o�n D��ةto� � ��Ӫ
					local nMonsterNum = GetMonsterCount(sceneId)
					for i=0, nMonsterNum-1 do
						local nMonsterId = GetMonsterObjID(sceneId,i)
						local szName = GetName(sceneId, nMonsterId)
						if szName== "Ba Thi�n Th�ch" or 
							 szName== "Ph�m Hoa" or
							 szName== "Ch� V�n L�" or
							 szName== "C� Яc Th�nh" or
							 szName== "Ph� T� Quy" or
							 szName== "Chu �an Th�n"     then
							 
							if GetUnitCampID(sceneId,nMonsterId, nMonsterId) ~= 110  then
								SetUnitCampID(sceneId,nMonsterId, nMonsterId, 110)
								CallScriptFunction((200060), "Paopao",sceneId, 
														szName, 
														"Y�n T� �", 
														"C�c ng߽i h�y n�p m�ng")
							end
						end
					--end
					
				end
				--LuaFnSetCopySceneData_Param(sceneId, x402254_g_bWangyuyanSpeak, 1)
			end
		else
			--PrintNum(2)
		end
	end

end

function x402256_OnInit(sceneId, selfId)
	MonsterAI_SetIntParamByIndex(sceneId, selfId, 1, 0)
	MonsterAI_SetIntParamByIndex(sceneId, selfId, 2, 0)
	MonsterAI_SetBoolParamByIndex(sceneId, selfId, 1, 0)
end

function x402256_OnKillCharacter(sceneId, selfId, targetId)
--	if(-1~=targetId) then
--		local szTarget = GetName(sceneId, targetId)		
--		LuaFnNpcChat(sceneId, selfId, 0, szTarget .. ",�����������ʮ��,����үүҲֻ����·m�t ��!")
--	end
end

function x402256_OnEnterCombat(sceneId, selfId, enmeyId)
--	if(0<x402256_TBL["BossBuff"]) then
--		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x402256_TBL["BossBuff"], 0)
--	end
	MonsterAI_SetIntParamByIndex(sceneId, selfId, 1, 60000)
	MonsterAI_SetIntParamByIndex(sceneId, selfId, 2, 0)
	MonsterAI_SetBoolParamByIndex(sceneId, selfId, 1, 1)
end

function x402256_OnLeaveCombat(sceneId, selfId)
	MonsterAI_SetIntParamByIndex(sceneId, selfId, 1, 0)
	MonsterAI_SetIntParamByIndex(sceneId, selfId, 2, 0)
	MonsterAI_SetBoolParamByIndex(sceneId, selfId, 1, 0)
end


