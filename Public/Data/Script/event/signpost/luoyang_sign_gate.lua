-- L誧 D呓ng
--城门
--问路脚本
x500004_g_scriptId = 500004

-- 问路类型 type: 1 为二c菜单, 2 为直接问路
x500004_g_Signpost = {
	{ type=2, name="Nam M鬾", x=159, y=251, tip="Nam M鬾", desc="Nam M鬾 n痠 li玭 Tung S絥, g髉 � ng叨i ch絠 t� c 15-20 th苙g ti猲", eventId=-1 },
	{ type=2, name="恤ng M鬾", x=260, y=134, tip="恤ng M鬾", desc="恤ng M鬾 n痠 li玭 Nh課 Nam, g髉 � ng叨i ch絠 t� c 30~36 th苙g ti猲", eventId=-1 },
	{ type=2, name="T鈟 M鬾", x=58, y=135, tip="T鈟 M鬾", desc="T鈟 M鬾 n痠 li玭 恤n Ho鄋g, g髉 � ng叨i ch絠 t� c 9~16 th苙g ti猲", eventId=-1 },
}

--**********************************
--列举事件
--**********************************
function x500004_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500004_g_Signpost do
		AddNumText(sceneId, x500004_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--任务入口函数
--**********************************
function x500004_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500004_g_Signpost[GetNumText()]

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
