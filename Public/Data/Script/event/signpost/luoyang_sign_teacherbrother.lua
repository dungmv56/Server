-- L誧 D呓ng
--拜师与结拜
--问路脚本
x500013_g_scriptId = 500013

-- 问路类型 type: 1 为二c菜单, 2 为直接问路
x500013_g_Signpost = {
	{ type=2, name="K猼 b醝", x=144, y=68, tip="Tr Phu Chi ", desc="Th唼ng th� h� b� Tr Phu Chi (144, 68) � T鈟 Kinh Ph� n礽, N猽 mu痭 k猼 b醝 th� 餴 t靘 鬾g. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
}

--**********************************
--列举事件
--**********************************
function x500013_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500013_g_Signpost do
		AddNumText(sceneId, x500013_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--任务入口函数
--**********************************
function x500013_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500013_g_Signpost[GetNumText()]

	if signpost.type == 1 then
		BeginEvent(sceneId)
			AddText(sceneId, signpost.name .. ": ")
			CallScriptFunction( signpost.eventId, "OnEnumerate", sceneId, selfId, targetId )
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
	elseif signpost.type == 2 then
		CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, signpost.x, signpost.y, signpost.tip )

		BeginEvent(sceneId)
			AddText(sceneId, signpost.desc)
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
	end

end
