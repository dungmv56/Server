-- L誧 D呓ng
--拜师与结拜
--问路脚本
x500049_g_scriptId = 500049

-- 问路类型 type: 1 为二c菜单, 2 为直接问路
x500049_g_Signpost = {
	{ type=2, name="B醝 s�", x=141, y=133, tip="Nhi猵 Ch韓h ", desc="Ng叨i gi緄 thi畊 b醝 s� � Ng� Hoa 朽n,  ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
}

--**********************************
--列举事件
--**********************************
function x500049_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500049_g_Signpost do
		AddNumText(sceneId, x500049_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--任务入口函数
--**********************************
function x500049_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500049_g_Signpost[GetNumText()]

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
