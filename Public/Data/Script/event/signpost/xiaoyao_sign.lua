--Ti陁 Dao
--问路脚本
x500069_g_scriptId = 500069

-- 问路类型 type: 1 为二c菜单, 2 为直接问路
x500069_g_Signpost = {
	{ type=2, name="B醝 ki猲 ch叻ng m鬾", x=125, y=144, tip="Ch叻ng m鬾", desc="姓i L� ch叻ng m鬾 nh鈔 T� Tinh H� � Th韓h H呓ng. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="Gia nh ph醝 Ti陁 Dao", x=125, y=144, tip="T� Tinh H� ", desc="T緄 Th韓h H呓ng t靘 姓i L� ch叻ng m鬾 T� Tinh H� s� 疬㧟 gia nh b眓 ph醝. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="H鱟 ph醝 Ti陁 Dao k� n錸g chi猲 黏u", x=125, y=142, tip="H鱟 ph醝 Ti陁 Dao k� n錸g chi猲 黏u", desc="Khang Qu鋘g L錸g c� th� giao cho c醕 h� v� c鬾g c黙 b鋘 ph醝, 鬾g � Th韓h H呓ng. 刵 ph韒 TAB, tr阯 b鋘 鸢 s� hi琻 th� 餴琺 nh nh醳 bi瑄 th�.", eventId=-1 },
	{ type=2, name="H鱟 ph醝 Ti陁 Dao k� n錸g cu礳 s痭g ph醝", x=62, y=68, tip="H鱟 ph醝 Ti陁 Dao k� n錸g cu礳 s痭g ph醝", desc="Ph鵱g A Tam c黙 姓i Quan c� th� giao cho ng呓i K� M鬾 械n Gi醦 thu. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="H鱟 k� n錸g h� tr� ph醝 Ti陁 Dao", x=53, y=150, tip="H鱟 k� n錸g h� tr� ph醝 Ti陁 Dao", desc="H鱟 k� n錸g h� tr� ph醝 Ti陁 Dao c ph鋓 t緄 T� 耼 t靘 Th誧h Thanh L�. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="H鱟 k� n錸g c咿i th� ph醝 Ti陁 Dao", x=53, y=56, tip="H鱟 k� n錸g c咿i th�", desc="Ng� L鉵h Qu鈔 s� d誽 ng呓i k� n錸g c咿i th�, 鬾g � th� ph騨g 痼. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="Mua v c咿i", x=65, y=55, tip="Mua v c咿i", desc="Vi阯 qu鋘 l� h呓u th C 械c b醤 v c咿i, 鬾g � c課h th� ph騨g. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="Nhi甿 v� ph醝 Ti陁 Dao", x=120, y=153, tip="Nhi甿 v� ph醝 Ti陁 Dao", desc="Ng叨i giao nhi甿 v� ph醝 Ti陁 Dao T Qu醤 � Th韓h H呓ng. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="Ti陁 Dao chuy琻 v s�", x=48, y=124, tip="Ti陁 Dao chuy琻 v s�", desc="L齂h痠 Lu� � ph韆 恤ng Ph鴑g Ho鄋g C c� th� d鏽 ng呓i t緄 L誧 D呓ng, 姓i L�, T� Ch鈛 ho c醕 m鬾 ph醝 kh醕. c th 醤h m 鬾g . 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="C痗 鸶a", x=62, y=68, tip="C痗 鸶a", desc="Ph鵱g A Tam c黙 姓i Quan c� th� d鏽 甬 t� b眓 bang t緄c痗 鸶a Ti陁 Dao. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="H鱟 khinh c鬾g ph醝 Ti陁 Dao", x=54, y=149, tip="Ng叨i d誽 khinh c鬾g Ti陁 Dao", desc="H鱟 khinh c鬾g ph醝 Ti陁 Dao ph鋓 t緄 T� 耼 � 痼 t靘 Th誧h Cam L鈓. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
}

--**********************************
--列举事件
--**********************************
function x500069_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500069_g_Signpost do
		AddNumText(sceneId, x500069_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--任务入口函数
--**********************************
function x500069_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500069_g_Signpost[GetNumText()]

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
