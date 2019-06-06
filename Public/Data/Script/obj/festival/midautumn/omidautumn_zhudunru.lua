-- 中秋NPC
-- 朱敦儒

x050006_g_scriptId = 050006

--**********************************
--事件交互入口
--**********************************
function x050006_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		local strText = "    Y陁 ng 醤h trung thu, t� ng鄋 x遖 疸 v. #rGi鎍 s呓ng ng鱟 gi� v鄋g, s醤g trong vg v. #rN絠 n絠 饀a v閚 r鑝, nh� nh� ti猲g nh誧 vang. #r凶ng ch� l痠 quan san, khi猲 m鄖 ng鄆 chau l読. #r蓄a ng鱟 c� l�, 餴琺 cam t呓i. #rR唼u n髇g ph総 v鄋g, tay thon 疬a ch閚. #rPh鋓 bi猼 bao ch� 瘙i, t 痍m n鄖 n錷 t緄, m叨i hai l tr騨 khuy猼. #rCh g� khi  疬㧟 s醤g t� nh� tr錸g n鄖"
		AddText( sceneId, "Th鼀 餴畊 ca 馥u" )
		AddText( sceneId, strText )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
