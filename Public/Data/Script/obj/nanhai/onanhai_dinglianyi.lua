--Nam H鋓NPC
--丁涟漪
--普通

--**********************************
--事件交互入口
--**********************************
function x034002_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  S� ph�, s� n呓ng.... C� 鹫i s� huynh... Th� l�, th� l�, 皤u kh鬾g c騨 n鎍 sao? Hu hu... m k� t鬷, t鬷 kh鬾g mu痭 s痭g n鎍..")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
