-- challenge.lua
-- Khi陁 chi猲相关脚本

x806010_g_ScriptId = 806010

-- 判断该玩家喧ng否处T読 Khi陁 chi猲区域
function x806010_HaveChallengeFlag( sceneId, selfId )
	return (GetMissionData( sceneId, selfId, MD_TIAOZHAN_SCRIPT ) > 0)
end

-- 让 selfId (及队友) Khi陁 chi猲 targetId (及队友)
function x806010_ProcChallenge( sceneId, selfId, targetId )
	local ChallengeScript = GetMissionData( sceneId, selfId, MD_TIAOZHAN_SCRIPT )

	if ChallengeScript ~= GetMissionData( sceneId, targetId, MD_TIAOZHAN_SCRIPT ) then
		return
	end

	-- 调用具体to� 鸬 Khi陁 chi猲脚本,每c醝擂台应该绑定m祎 c醝脚本
	CallScriptFunction(ChallengeScript, "DoChallenge", sceneId, selfId, targetId )
end
