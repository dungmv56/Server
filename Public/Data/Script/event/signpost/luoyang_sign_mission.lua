-- L誧 D呓ng
--循环任务与副本
--问路脚本
x500006_g_scriptId = 500006

-- 问路类型 type: 1 为二c菜单, 2 为直接问路
x500006_g_Signpost = {
	{ type=2, name="L誧 D呓ng T鄌 v s�", x=228, y=175, tip="Tri畊 Minh Th鄋h", desc="L誧 D呓ng T鄌 v S� Tri畊 Minh Th鄋h [227,177]. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="Tr鈔 Long k� cu礳", x=271, y=88, tip="V呓ng T韈h T鈔 ", desc="T靘 t緄 K� Th醤h V呓ng T韈h T鈔 � v呓ng ph� n礽 ph韆 恤ng B th鄋h L誧 D呓ng (271, 88) . 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
}

--**********************************
--列举事件
--**********************************
function x500006_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500006_g_Signpost do
		AddNumText(sceneId, x500006_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--任务入口函数
--**********************************
function x500006_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500006_g_Signpost[GetNumText()]

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
