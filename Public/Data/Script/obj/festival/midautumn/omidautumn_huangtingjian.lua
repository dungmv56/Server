-- 中秋NPC
-- 黄庭坚

x050003_g_scriptId = 050003

--**********************************
--事件交互入口
--**********************************
function x050003_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		local strText = "    Trung thu kh鬾g m遖. Say ti璶 tr錸g v� rg n鷌 t鈟. C叨i h� h鄋g ria. C� m trung thu nh靚 th tr錸g. #r#rN錷 tr呔c ngo鄆 s鬾g. Nhi n� chuy玭 li huynh 甬 h礽. 嘘m nay l阯 l. Ti瑄 T� thanh ca d� b誧 馥u"
		AddText( sceneId, "B� ch� M礳 Lan Hoa" )
		AddText( sceneId, strText )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
