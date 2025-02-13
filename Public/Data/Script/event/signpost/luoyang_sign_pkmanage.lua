-- L誧 D呓ng
--pk管理员
--问路脚本
x500011_g_scriptId = 500011

-- 问路类型 type: 1 为二c菜单, 2 为直接问路
x500011_g_Signpost = {
	{ type=2, name="V� tr叨ng L誧 D呓ng", x=89, y=173, tip="V� tr叨ng L誧 D呓ng", desc="Mu痭 h鱟 h鰅 v� ngh� h銀 t緄 v� tr叨ng L誧 D呓ng. H銀  ph韒 ph鋓 瓞 t靘 鸠i th�, l馻 ch鱪 th� chi猲", eventId=-1 },
}

--**********************************
--列举事件
--**********************************
function x500011_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500011_g_Signpost do
		AddNumText(sceneId, x500011_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--任务入口函数
--**********************************
function x500011_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500011_g_Signpost[GetNumText()]

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
