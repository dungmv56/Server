--Minh Gi醥NPC
--玛拉
--普通

--**********************************
--事件交互入口
--**********************************
function x011007_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"B醕h Hoa mu礽 mu礽 n骾 Trung Th� c� t騛 H鄋 Ng鱟 Th醦, trong 痼 c� r nhi玼 truy玭 thuy猼, th s� mu痭 餴 xem l.")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
