-- 中秋NPC
-- 晁端礼

x050004_g_scriptId = 050004

--**********************************
--事件交互入口
--**********************************
function x050004_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		local strText = "    Tr錸g v鄌 痍m trung thu, c馽 k� tr騨 馥y. S鬾g tr秈 cu痭 l 痤a v鄋g. 36 th鈓 cung, v閚 r鑝 l阯 xem. S呓ng th絤 呔t t骳 m鈟, kh� v呓n tay ng鱟 l課h. B靚h th叨ng l� n鄌 ch苙g Thuy玭 Quy阯. Th鈛 痍m lg l�, th醤g n錷 t鄋"
		AddText( sceneId, "B鄆 h醫 Nam" )
		AddText( sceneId, strText )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
