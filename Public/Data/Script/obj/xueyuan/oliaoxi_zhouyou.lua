--周游
--村民
--普通

x021009_g_scriptId = 021009

--**********************************
--事件交互入口
--**********************************
function x021009_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"   Bg h鎢, Ng鈔 Nhai Tuy猼 Nguy阯 qu醝 v ng叨i ng叨i 皤u c� 疬㧟 h鄋 b錸g th l馽, ch� c� #G b錸g kh醤g #W c鹡g 瘘 t鄆 cao c� th� � n絠 n鄖 ho鄋h h鄋h v� k�. T読 h� c� th� gi鷓 ng呓i t錸g l阯 m祎 韙 b錸g kh醤g, nh遪g c鄋g nhi玼  b錸g kh醤g c騨 c ch韓h ng呓i 皙n c� gg.")
		AddNumText(sceneId, x021009_g_scriptId, "T錸g kh醤g b錸g",6,0)
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
