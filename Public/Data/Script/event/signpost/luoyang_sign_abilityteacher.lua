-- L誧 D呓ng
--生活技能导师
--问路脚本
x500005_g_scriptId = 500005

-- 问路类型 type: 1 为二c菜单, 2 为直接问路
x500005_g_Signpost = {
	{ type=2, name="姓i s� tr皀g tr鱰", x=219, y=262, tip="L遳 Di甤 N鬾g ", desc="衖 ra kh鰅 L誧 D呓ng, Nam M鬾, qua c ph韆 tr呔c, 餴 v� h呔ng 恤ng, t靘 鹫i s� tr皀g tr鱰 L遳 Di甤 N鬾g � th豠 ru祅g [219,262]. 刵 ph韒TAB 瓞 xem tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="姓i s� khai th醕 m�", x=212, y=151, tip="Vi 邪ng Chu� ", desc="姓i s� khai kho醤g Vi 邪ng Ch鵼 (212, 151) trong ti甿 v� kh� � 恤ng Th�. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="姓i s� h醝 thu痗", x=120, y=169, tip="Nghi阭 B醕h Th鋙 ", desc="姓i s� h醝 thu痗 Nghi阭 B醕h Th鋙 (120, 169) � 疬秐g l緉 ph韆 恤ng T鈟 Th�,  ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="Ng� phu", x=207, y=184, tip="Kh呓ng Ng� ", desc="Ng� phu Kh呓ng Ng� (207, 184) � Nam M鬾 恤ng Th�,  ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="姓i s� m� ngh�", x=60, y=146, tip="Long Tam Thi猽 ", desc="姓i s� c鬾g ngh� Long Tam Thi猽 � (60, 146) � 疬秐g l緉 ph韆 T鈟. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="姓i s� may v�", x=193, y=172, tip="Ph� M鏽 Chi ", desc="姓i s� may v� Ph� M鏽 Chi (193, 172) � 恤ng Th�. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="姓i s� luy畁 kim", x=213, y=160, tip="V呓ng 醒c Ph鷆 ", desc="喧c ki猰 鹫i s� V呓ng 醒c Ph鷆 (213, 160) � trong ti甿 binh kh� � 恤ng Th�. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="姓i s� n 錸", x=134, y=152, tip="L� 姓i Chu� ", desc="姓i s� n n呔ng L� 姓i Ch鼀 (134, 152) � trong t豼 餴猰 ch� giao nhau gi鎍 T鈟 Th� v� 疬秐g l緉 ph韆 T鈟. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="姓i s� ch� du㧟", x=138, y=164, tip="Tr呓ng Minh C鋘h ", desc="姓i s� ch� d唼c Tr呓ng Minh C鋘h (138, 164) � ti甿 thu痗 gi鎍 T鈟 Th� v� 疬秐g l緉 ph韆 Nam. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="姓i s� d咿ng sinh ph醦", x=132, y=156, tip="T叨ng Vy ", desc="姓i s� d咿ng sinh ph醦 T叨ng Vy (132, 156) � ti甿 thu痗 ch� giao nhau gi鎍 T鈟 Th� v� 疬秐g l緉 ph韆 T鈟. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="姓i s� d唼c l� h鱟", x=136, y=169, tip="B誧h D頽h Minh ", desc="姓i s� d唼c l� h鱟 B誧h D頽h Minh (136, 169) � ti甿 thu痗 gi鎍 T鈟 Th� v� 疬秐g l緉 ph韆 Nam. 刵 ph韒 TAB, tr阯 b鋘 鸢 c� k� hi畊 nh nh醳", eventId=-1 },
	{ type=2, name="重购配方", x=141, y=133, tip="小高", desc="#G重购配方: #W因某种不可控原因造成玩家已学会to� 鸬 #G加工材料类配方、馒头配方、初/中/高c食材类配方、咫尺天涯配方#W丢失,可以到#GT� Ch鈛#Wto� 鸬 #G小高(96,127)#W购买重#G购配方#W,其出售价格#G统m祎 为1银#W.", eventId=-1 },
	{ type=2, name="材料加工介绍", x=153, y=171, tip="冯铸铁", desc="#{CLJG_20071204}", eventId=-1 },	
}

--**********************************
--列举事件
--**********************************
function x500005_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500005_g_Signpost do
		AddNumText(sceneId, x500005_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--任务入口函数
--**********************************
function x500005_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500005_g_Signpost[GetNumText()]

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
