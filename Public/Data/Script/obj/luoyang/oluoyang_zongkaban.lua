--L誧 D呓ngNPC
--宗喀班
--普通

--**********************************
--事件交互入口
--**********************************
function x000042_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  Kh鬾g bi猼 姓i h礽 t鷆 c n錷 nay b阯 n鄌 s� thg, th h癷 h祊!")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
