--Thi猽 L鈓
--问路脚本
x500061_g_scriptId = 500061

-- 问路类型 type: 1 为二c菜单, 2 为直接问路
x500061_g_Signpost = {
	{ type=2, name="B醝 ki猲 ph呓ng tr唼ng", x=38, y=98, tip="Ph呓ng tr唼ng", desc="Ng呓i mu痭 b醝 ki猲 姓i s� Huy玭 T�, 鬾g � 姓t Ma Vi畁. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="Gia nh ph醝 Thi猽 L鈓", x=89, y=72, tip="Gi醡 t� Thi猽 L鈓 Huy玭 T竛h", desc="Mu痭 gia nh ph醝 Thi猽 L鈓 th� t靘 姓i s� Huy玭 T竛h, 鬾g � 姓i H鵱g b鋙 餴畁 m鬾 kh. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="H鱟 k� n錸g chi猲 黏u Thi猽 L鈓", x=91, y=71, tip="H鱟 k� n錸g chi猲 黏u m鬾 ph醝", desc="Thi猽 L鈓 tuy畉 k� danh x呔ng thi阯 h�, 姓i s� Huy玭 N課 c� th� d誽 ng呓i, 鬾g � 姓i H鵱g B鋙 衖畁 M鬾 kh. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="H鱟 k� n錸g cu礳 s痭g Thi猽 L鈓", x=128, y=86, tip="H鱟 k� n錸g cu礳 s痭g m鬾 ph醝", desc="姓i s� Huy玭 械 c� th� d誽 ng呓i k� n錸g khai s醤g 鸬c nh ph醝 Thi猽 L鈓, 鬾g � Long Th� Vi阯. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="H鱟 k� n錸g h� tr� Thi猽 L鈓", x=135, y=90, tip="H鱟 k� n錸g h� tr� m鬾 ph醝", desc="姓i s� Huy玭 Minh c� th� d誽 ng呓i k� n錸g Ph Ph醦, 鬾g � Long Th� Vi阯. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="H鱟 k� n錸g c咿i th� Thi猽 L鈓", x=57, y=88, tip="H鱟 k� n錸g c咿i th�", desc="姓i s� Huy玭 Di畉 c� th� d誽 ng呓i b鋘 l頽h c咿i h�, 鬾g � ph韆 Nam Chung l. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="Mua v c咿i", x=60, y=82, tip="Mua v c咿i", desc="Ng呓i c� th� mua h� � ch� 姓i s� Huy玭 Sinh, 鬾g � ph韆 Nam Chung l. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="Nhi甿 v� ph醝 Thi猽 L鈓", x=96, y=89, tip="Nhi甿 v� m鬾 ph醝", desc="N猽 c醕 h� mu痭 t靘 vi甤 瓞 l鄊 th� t靘 Hu� Ph呓ng s� huynh, anh ta � ph韆 nam 姓i H鵱g B鋙 衖畁. 刵 ph韒 TAB, tr阯 b鋘 鸢 s� hi琻 th� 餴琺 nh nh醳 bi瑄 th�.", eventId=-1 },
	{ type=2, name="Thi猽 L鈓 chuy琻 v s�", x=932, y=131, tip="Ng叨i chuy阯 ch� c黙 m鬾 ph醝", desc="S� huynh Tu� Lu鈔 trong S絥 M鬾 c� th� d鏽 ng呓i t緄 L誧 D呓ng, 姓i L�, T� Ch鈛 v� c醕 m鬾 ph醝 kh醕. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="Th醦 L鈓", x=61, y=62, tip="Ng叨i b鋙 v� Th醦 L鈓", desc="Mu痭 th� chi猲 Th醦 L鈓 th� t緄 Chung L t靘 姓i s� Huy玭 Tr譶g. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� K� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="H鱟 khinh c鬾g Thi猽 L鈓", x=38, y=102, tip="Ng叨i d誽 khinh c鬾g Thi猽 L鈓", desc="H鱟 khinh c鬾g t緄 姓t Ma Vi畁 t靘 Th醝 V鈔 mu礽 mu礽. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
}

--**********************************
--列举事件
--**********************************
function x500061_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500061_g_Signpost do
		AddNumText(sceneId, x500061_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--任务入口函数
--**********************************
function x500061_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500061_g_Signpost[GetNumText()]

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
