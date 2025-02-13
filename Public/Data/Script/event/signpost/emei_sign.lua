--Nga My
--问路脚本
x500065_g_scriptId = 500065

-- 问路类型 type: 1 为二c菜单, 2 为直接问路
x500065_g_Signpost = {
	{ type=2, name="B醝 ki猲 ch叻ng m鬾", x=96, y=73, tip="Ch叻ng m鬾", desc="Ch叻ng m鬾 � B di畁 Song Ki玼, c� 餴 v鄌 trong s� nh靚 th b� . 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="Gia nh Nga My", x=96, y=51, tip="L� th nh� n呓ng", desc="N猽 c醕 h� mu痭 tr� th鄋h m祎 th鄋h vi阯 c黙 ph醝 ta, h銀 餴 b醝 ki猲 L� Th Nh� N呓ng, b� � tr呔c T竛h 耺 C醕. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="H鱟 k� n錸g chi猲 黏u ph醝 Nga My", x=98, y=51, tip="H鱟 k� n錸g chi猲 黏u ph醝 Nga My", desc="Ch鷑g ta 皤u h鱟 v� ngh� t� Th鬷 L鴆 Hoa t� t� h鱟, T� t� � tr呔c Thanh 耺 C醕. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="H鱟 k� n錸g cu礳 s痭g ph醝 Nga My", x=43, y=108, tip="H鱟 k� n錸g cu礳 s痭g ph醝 Nga My", desc="H鄋 t� t� bi猼 s� d鴑g k� n錸g ch� t誳 ph� 鸬c truy玭 c黙 ph醝 ta, ng呓i c� th� t緄 La Phong Thanh V鈔 餴 t靘 t� t�. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="H鱟 k� n錸g h� tr� ph醝 Nga My", x=39, y=109, tip="H鱟 k� n錸g h� tr� ph醝 Nga My", desc="Linh t鈓 thu l� k� n錸g h� tr� c黙 ch� t誳 b鵤, H� Tam N呓ng c黙 La Phong Thanh V鈔 s� d誽 ng呓i . 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="H鱟 k� n錸g c咿i th� ph醝 Nga My", x=141, y=51, tip="H鱟 k� n錸g c咿i th�", desc="Ti陁 T呓ng Th鼀 c黙 B醕h Th鼀 Thu Phong s� d誽 ng呓i b鋘 l頽h c咿i. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="Mua v c咿i", x=145, y=53, tip="Mua v c咿i", desc="N猽 mu痭 mua 1 con Ph鴑g Ho鄋g, h銀 t緄 B醕h Th鼀 Thu Phong t靘 Ti陁 H呓ng Ng鱟. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="Nhi甿 v� Nga My", x=95, y=86, tip="Nhi甿 v� Nga My", desc="S� huynh M鉵h Long � Song Ki玼 餫ng t靘 ng叨i gi鷓 疝. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="Ti玭 tr誱 ph醝 Nga My", x=86, y=142, tip="Ti玭 tr誱 ph醝 Nga My", desc="Nghe n骾 D呓ng T� N呓ng � Nguy畉 Ki玼 Nam c� th� d鏽 ng呓i t緄 L誧 D呓ng, 姓i L�, T� Ch鈛 ho c醕 m鬾 ph醝 kh醕. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="朽o Hoa Tr", x=96, y=73, tip="朽o Hoa Tr", desc="Mu痭 v鄌 朽o Hoa Tr ph鋓 t緄 B di畁 Song Ki玼 t靘 ch叻ng m鬾. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="H鱟 khinh c鬾g ph醝 Nga My", x=105, y=58, tip="Nga My khinh c鬾g truy玭 th� nh鈔", desc="H鱟 khinh c鬾g ph醝 ta t緄 B di畁 Song Ki玼 t靘 T鬾 Nh� N呓ng. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
}

--**********************************
--列举事件
--**********************************
function x500065_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500065_g_Signpost do
		AddNumText(sceneId, x500065_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--任务入口函数
--**********************************
function x500065_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500065_g_Signpost[GetNumText()]

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
