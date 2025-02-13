-- L誧 D呓ng
--宝石合成
--问路脚本
x500012_g_scriptId = 500012

-- 问路类型 type: 1 为二c菜单, 2 为直接问路
x500012_g_Signpost = {
	{ type=2, name="B鋙 Th誧h H䅟 Th鄋h", x=177, y=184, tip="B鄋h Ho鄆 Ng鱟 ", desc="Th� m� ngh� h䅟 th鄋h B鋙 Th誧h B鄋h Ho鄆 Ng鱟 (177, 184) � ph鴆 s裞 餴猰 gi鎍 疬秐g l緉 ph韆 Nam v� 恤ng Th�. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
}

--**********************************
--列举事件
--**********************************
function x500012_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500012_g_Signpost do
		AddNumText(sceneId, x500012_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--任务入口函数
--**********************************
function x500012_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500012_g_Signpost[GetNumText()]

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
