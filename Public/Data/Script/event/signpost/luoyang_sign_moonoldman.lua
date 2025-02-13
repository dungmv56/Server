-- L誧 D呓ng
--月下老人
--问路脚本
x500007_g_scriptId = 500007

-- 问路类型 type: 1 为二c菜单, 2 为直接问路
x500007_g_Signpost = {
	{ type=2, name="Nguy畉 l鉶 l鉶 nh鈔", x=46, y=62, tip="Nguy畉 L鉶 ", desc="Nguy畉 l鉶 l鉶 nh鈔 � g骳 T鈟 B trong th鄋h L誧 D呓ng. mu痭 ng叨i m緄 t� ch裞 h鬾 l�, c� t靘 鬾g. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
}

--**********************************
--列举事件
--**********************************
function x500007_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500007_g_Signpost do
		AddNumText(sceneId, x500007_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--任务入口函数
--**********************************
function x500007_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500007_g_Signpost[GetNumText()]

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
