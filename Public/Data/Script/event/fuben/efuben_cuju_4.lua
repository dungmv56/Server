x402045_g_KillNum = 30

--**********************************
-- 足球死亡
--**********************************
function x402045_OnDie(sceneId, objId, killerId)
	
	local szName = GetName(sceneId, objId)

	if szName == "Ho鄋g S T鷆 C"  or
			szName == "H皀g S T鷆 C"  or
			szName == "Lam S T鷆 C"  or
			szName == "Hoa S T鷆 C"  or
			
			szName == "Ho鄋g S 姓i T鷆 C"  or
			szName == "H皀g S 姓i T鷆 C"  or
			szName == "Lam S 姓i T鷆 C"     then
			
		local nKillNum = LuaFnGetCopySceneData_Param(sceneId, x402045_g_KillNum)
		nKillNum = nKillNum + 1
		local str = "秀 gi猼 ch猼 T鷆 C: " .. tostring(nKillNum) .. "/149"
		x402045_TipAllHuman(sceneId, str)
		LuaFnSetCopySceneData_Param(sceneId, x402045_g_KillNum, nKillNum)
	end
end

--**********************************
--提示所有副本内玩家
--**********************************
function x402045_TipAllHuman( sceneId, Str )
	--  鹫t 疬㧟场景里头to� 鸬 所有人
	local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
	-- 没有人to� 鸬 场景,什么都不做
	if nHumanNum < 1 then
		return
	end
	for i=0, nHumanNum-1  do
		local PlayerId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		BeginEvent(sceneId)
			AddText(sceneId, Str)
		EndEvent(sceneId)
		DispatchMissionTips(sceneId, PlayerId)
	end
end

