--Thi阯 Long
--问路脚本
x500066_g_scriptId = 500066

-- 问路类型 type: 1 为二c菜单, 2 为直接问路
x500066_g_Signpost = {
	{ type=2, name="B醝 ki猲 ph呓ng tr唼ng", x=96, y=66, tip="Ph呓ng tr唼ng", desc="Ng呓i mu痭 b醝 ki猲 姓i s� B眓 Nh鈔, 鬾g 餫ng � 姓i H鵱g B鋙 衖畁. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="Gia nh Thi阯 Long ph醝", x=96, y=66, tip="B鋘 Nh鈔 ", desc="Mu痭 gia nh Thi阯 Long ph醝 ph鋓 t靘 B鋘 Nh鈔 鹫i s�, 鬾g ta � 姓i H鵱g B鋙 衖畁. 刵 ph韒 TAB, tr阯 b鋘 鸢 s� hi琻 th� 餴琺 nh nh醳 bi瑄 th�.", eventId=-1 },
	{ type=2, name="H鱟 k� n錸g chi猲 黏u c黙 Thi阯 Long ph醝", x=97, y=67, tip="H鱟 k� n錸g chi猲 黏u c黙 Thi阯 Long ph醝", desc="B眓 quan c黙 M鬾 kh 姓i H鵱g B鋙 衖畁 s� d誽 ng呓i v� c鬾g b眓 ph醝. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="H鱟 k� n錸g sinh s痭g c黙 Thi阯 Long ph醝", x=35, y=86, tip="H鱟 k� n錸g sinh s痭g c黙 Thi阯 Long ph醝", desc="B眓 T呔ng 鹫i s� � Kh鬾g S絥 朽n Ph騨g c� th� d誽 ng呓i k� n錸g tr� s鈛. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="H鱟 k� n錸g b� tr� c黙 Thi阯 Long ph醝", x=64, y=151, tip="H鱟 k� n錸g b� tr� c黙 Thi阯 Long ph醝", desc="B眓 Tham � Thi阯 T 朽i c� th� d誽 ng呓i k� n錸g b醕h quy猼 kinh m誧h. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="H鱟 k� n錸g c咿i th� c黙 Thi阯 Long ph醝", x=148, y=92, tip="H鱟 k� n錸g c咿i th�", desc="Mu痭 h鱟 c咿i ng馻 th� t靘 D呓ng Thanh Ng遳, 鬾g � Thi阯 M� C製. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="Mua v c咿i", x=146, y=95, tip="Mua v c咿i", desc="Mu痭 mua 1 con ng馻 皓p ph鋓 kh鬾g? H銀 t緄 Thi阯 M� C製 t靘 D呓ng B醕h Ng遳. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="Nhi甿 v� c黙 Thi阯 Long ph醝", x=95, y=88, tip="Nhi甿 v� c黙 Thi阯 Long ph醝", desc="姓i s� B鋘 Ph鄊 餫ng c 甬 t� b眓 bang gi鷓 疝, 鬾g ph韆 Nam 姓i H鵱g B鋙 餴畁. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="Ng叨i truy玭 tin c黙 Thi阯 Long ph醝", x=99, y=120, tip="Ng叨i truy玭 tin c黙 Thi阯 Long ph醝", desc="Ph� S鈔 � S絥 M鬾 Ngo読 c� th� d鏽 ng呓i t緄 L誧 D呓ng, 姓i L�, T� Ch鈛 ho c醕 m鬾 ph醝 kh醕. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="Ch鈔 th醦", x=35, y=86, tip="Ch鈔 th醦", desc="挟 t� b眓 bang m緄 疬㧟 ph閜 v鄌 c痗 鸶a, t靘 B眓 T呔ng 鹫i s� � Kh鬾g S絥 朽n Ph騨g. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="H鱟 khinh c鬾g c黙 Thi阯 Long ph醝", x=35, y=86, tip="Ng叨i d誽 khinh c鬾g Thi阯 Long", desc="Th竛h Nh� Lan � Di畊 H呓ng Bi畉 Vi畁 c� th� d誽 ng呓i khinh c鬾g b眓 ph醝. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
}

--**********************************
--列举事件
--**********************************
function x500066_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500066_g_Signpost do
		AddNumText(sceneId, x500066_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--任务入口函数
--**********************************
function x500066_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500066_g_Signpost[GetNumText()]

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
