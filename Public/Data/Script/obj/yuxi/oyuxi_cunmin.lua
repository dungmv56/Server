--玉溪NPC
--村民
--普通

--**********************************
--事件交互入口
--**********************************
function x027007_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  B� C� L� L誴 瘊ng l� th y, d鵱g thu痗 c黙 b� , b畁h g� c鹡g kh鰅...tuy lu鬾 c� nh鎛g t醕 d鴑g ph� k� l�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
