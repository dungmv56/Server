-- 宠物悟性提升

-- 脚本号
x800104_g_ScriptId = 800104

-- NPC 名字
x800104_g_Name = "V鈔 Phi Phi"

--**********************************
-- 任务入口函数
--**********************************
function x800104_OnDefaultEvent( sceneId, selfId, targetId )	--点击该任务后执行此脚本
	BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId, 19820424 )
end

--**********************************
-- 列举事件
--**********************************
function x800104_OnEnumerate( sceneId, selfId, targetId )
	AddNumText( sceneId, x800104_g_ScriptId, "Th錸g c ng� t韓h tr鈔 th�" ,6,-1)
end


--**********************************
-- 宠物悟性提升
--**********************************
function x800104_PetSavvy( sceneId, selfId, mainPetGuidH, mainPetGuidL, assisPetGuidH, assisPetGuidL )
	--判断根骨
	local gengu = LuaFnGetPetGenGuByGUID(sceneId, selfId, assisPetGuidH, assisPetGuidL)
	if gengu ==0 then
		BeginEvent( sceneId )
			AddText( sceneId, "C錸 C痶 c黙 th� tham gia h䅟 th鄋h = 0, kh鬾g th� gia t錸g ng� t韓h tr鈔 th�." )
		EndEvent( sceneId )
		DispatchMissionTips( sceneId, selfId )
		return 0
	end
	local retDiff = IncreaceSavvyByCompound( sceneId, selfId, mainPetGuidH, mainPetGuidL, assisPetGuidH, assisPetGuidL )
	if retDiff and retDiff > 0 then
		--成功的光效
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0);
	end
end

