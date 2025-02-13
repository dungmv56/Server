-- L誧 D呓ng问路脚本
x500000_g_scriptId = 500000

-- 问路类型 type: 1 为二c菜单, 2 为直接问路
x500000_g_Signpost = {
		{ type=1, name="Nh kinh nghi甿 nh鈔 痿i?", eventId=500049, x=0, y=0, tip=" ", desc=" " },		--无单独脚本
		{ type=1, name="L鄊 sao gia nh m鬾 ph醝?", eventId=500049, x=0, y=0, tip=" ", desc=" " },			--无单独脚本
		{ type=1, name="Mua c醕 lo読 v ph", eventId=500001, x=0, y=0, tip=" ", desc=" " },
		{ type=1, name="D竎h tr誱", eventId=500002, x=0, y=0, tip=" ", desc=" " },
		{ type=1, name="Ti玭 trang, 疬絥g ph�, nguy阯 b鋙", eventId=500003, x=0, y=0, tip=" ", desc=" " },
		{ type=1, name="Ta mu痭 r鑞 luy畁 b鋘 l頽h", eventId=500004, x=0, y=0, tip=" ", desc=" " },
		{ type=1, name="H鱟 1 s� k� n錸g 鸲i s痭g", eventId=500005, x=0, y=0, tip=" ", desc=" " },
		{ type=1, name="Nhi甿 v� v� ph� b鋘", eventId=500006, x=0, y=0, tip=" ", desc=" " },
		{ type=1, name="Ta mu痭 l gia th", eventId=500007, x=0, y=0, tip=" ", desc=" " },
		{ type=1, name="Bang ph醝", eventId=500008, x=0, y=0, tip=" ", desc=" " },
		{ type=1, name="Th呓ng h礽", eventId=500009, x=0, y=0, tip=" ", desc=" " },
		{ type=1, name="K�", eventId=500010, x=0, y=0, tip=" ", desc=" " },
		{ type=1, name="L鬷 疣i", eventId=500011, x=0, y=0, tip=" ", desc=" " },
		{ type=1, name="B鋙 Th誧h H䅟 Th鄋h", eventId=500012, x=0, y=0, tip=" ", desc=" " },
		{ type=1, name="K猼 b醝", eventId=500013, x=0, y=0, tip=" ", desc=" " },
}
--{ type=2, name="东升客栈", x=100.7, y=124.2, tip="L誧 D呓ng东升客栈", desc="L誧 D呓ng最大to� 鸬 客栈之m祎 ,三教九流聚集之地." },

--**********************************
--列举事件
--**********************************
function x500000_OnEnumerate( sceneId, selfId, targetId )
--	AddNumText(sceneId, x500000_g_scriptId, "账号安全", -1, 1009)   --帐号  to  账号
	for i, signpost in x500000_g_Signpost do
		AddNumText(sceneId, x500000_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--任务入口函数
--**********************************
function x500000_OnDefaultEvent( sceneId, selfId, targetId )

--	if GetNumText() == 1009 then
--		OpenWorldReference(sceneId, selfId, "AccountSafe")
--		return
--	end
	signpost = x500000_g_Signpost[GetNumText()]
	if GetNumText()==1 then
		BeginEvent(sceneId)
			AddText(sceneId, signpost.name .. ": ")
			AddText(sceneId, "Xin t緄 qu鋘g tr叨ng � L誧 D呓ng [150,91] n絠 L遳 Ki畁 Minh nh g 痿i kinh nghi甿")
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
		CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, 150, 91, "L遳 Ki畁 Minh" )
		return
	end
	
	if GetNumText()==2 then
		BeginEvent(sceneId)
			AddText(sceneId, signpost.name .. ": ")
			AddText(sceneId, "Xin t緄 m鱥 d竎h tr誱 c黙 c醕 th鄋h th� ( Tab c� th� m� b鋘 鸢 ra tra t靘 k� hi畊 ch� #GD竎h#W) chuy琻 t緄 m鬾 ph醝 m� c醕 h� mu痭 b醝 s�. Sau khi t緄 m鬾 ph醝 h銀  v鄌 #GNg叨i d鏽 疬秐g cho m鬾 ph醝 #W l� c� th� h鰅 疬㧟 v� tr� b醝 s�. Ho  ph韒 TAB m� b鋘 鸢 t靘 k� hi畊 ch� #GS� #W.")
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
		CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, 139, 182, "Ng� 醒c X呓ng" )
		return
	end

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
