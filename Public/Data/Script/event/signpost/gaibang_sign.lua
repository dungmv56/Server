--C醝 Bang
--问路脚本
x500063_g_scriptId = 500063

-- 问路类型 type: 1 为二c菜单, 2 为直接问路
x500063_g_Signpost = {
	{ type=2, name="Gia nh C醝 Bang", x=91, y=98, tip="Tr C� Nh課 ", desc="Ng呓i mu痭 gia nh Thi阯 h� 甬 nh 鹫i bang kh鬾g? H銀 t靘 Tr C� Nh課 tr叻ng l鉶 � T� Ngh頰 羞秐g M鬾. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="H鱟 C醝 Bang k� n錸g chi猲 黏u", x=94, y=99, tip="H鱟 C醝 Bang k� n錸g chi猲 黏u", desc="H� Tam K� tr叻ng l鉶 c� th� d誽 ng呓i k� n錸g c黙 b眓 bang, 鬾g � c眓g T� Ngh頰 羞秐g M鬾. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="H鱟 k� n錸g cu礳 s痭g ph醝 C醝 Bang", x=114, y=91, tip="H鱟 k� n錸g cu礳 s痭g ph醝 C醝 Bang", desc="Tr叻ng l鉶 Ng� Tr叨ng Phong � c眓g Trung Li畉 羞秐g M鬾 c� th� d誽 ng呓i k� n錸g l鄊 r唼u. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="H鱟 k� n錸g h� tr� ph醝 C醝 Bang", x=131, y=83, tip="H鱟 k� n錸g h� tr� ph醝 C醝 Bang", desc="H銀 t緄 朽o Vi阯, 朽 Ch� � 痼, ng呓i h鰅 xem 鬾g c� ch竨 d誽 ng呓i Li阯 Hoa L誧 kh鬾g. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="H鱟 k� n錸g c咿i th� ph醝 C醝 Bang", x=38, y=89, tip="H鱟 k� n錸g c咿i th�", desc="T呔ng Quang 徐nh � T� T呓ng Ph騨g c� th� d誽 ng呓i c醕h c咿i s骾. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="Mua v c咿i", x=54, y=86, tip="Mua v c咿i", desc="Mua v c咿i t靘 L� Nh Vi畉 � T鈟 S呓ng Ph騨g. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="Nhi甿 v� C醝 Bang", x=92, y=70, tip="Nhi甿 v� C醝 Bang", desc="H皀g Th鬾g � ph韆 sau T� Ngh頰 羞秐g, 詎g 餫ng t靘 ng叨i gi鷓 疝. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="C醝 Bang chuy琻 v s�", x=93, y=118, tip="C醝 Bang chuy琻 v s�", desc="Tr呓ng To鄋 T叨ng � ngo鄆 T� Ngh頰 羞秐g c� th� d鏽 ng呓i t緄 L誧 D呓ng, 姓i L�, T� Ch鈛 ho c醕 m鬾 ph醝 kh醕. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="H r唼u", x=41, y=144, tip="H r唼u", desc="H r唼u c� ng叨i t緄 ph�, t緄 Ti瑄 朽o Vi阯 t靘 Ph 刵 d鏽 ng呓i t緄 饀眎 ch鷑g 餴. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="H鱟 khinh c鬾g ph醝 C醝 Bang", x=112, y=90, tip="Ng叨i d誽 khinh c鬾g C醝 Bang", desc="Ng� Tuy猼 Ki玼 � ngo鄆 Trung Li畉 羞秐g M鬾 c� th� d誽 ng呓i khinh c鬾g c黙 b眓 bang. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
}

--**********************************
--列举事件
--**********************************
function x500063_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500063_g_Signpost do
		AddNumText(sceneId, x500063_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--任务入口函数
--**********************************
function x500063_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500063_g_Signpost[GetNumText()]

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
