--周游
--村民
--普通

x021009_g_scriptId = 021009

--**********************************
--事件交互入口
--**********************************
function x021009_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"    Bg h鎢, qu醝 v tr阯 Ng鈔 Ngai Tuy猼 Nguy阯 n鄖 con n鄌 c鹡g c� th l馽 c黙 h鄋 b錸g, Ch� c� 瘘 餴琺 #GKh醤g b錸g#W m緄 c� kh� n錸g tung ho鄋h � n絠 n鄖. T読 h� c� th� gi鷓 c醕 h� t錸g 1 韙 kh醤g b錸g, nh遪g s� kh醤g b錸g cao c騨 xem v鄌 n� l馽 c黙 b鋘 th鈔.")
		AddNumText(sceneId, x021009_g_scriptId, "T錸g 1 s� kh醤g b錸g",6,0)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件列表选中m祎 项
--**********************************
function x021009_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText()==0	then
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 153, 0)
	end
end
