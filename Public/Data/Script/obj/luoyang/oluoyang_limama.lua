--L誧 D呓ngNPC
--李妈妈
--普通

--**********************************
--事件交互入口
--**********************************
function x000044_OnDefaultEvent( sceneId, selfId,targetId )
local  PlayerName=GetName(sceneId,selfId)	
	local  PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex = " c� n呓ng "
	else
		PlayerSex = " c醕 h�"
	end
	BeginEvent(sceneId)
		AddText(sceneId,"  H� h�, 痼 kh鬾g ph鋓 l� "..PlayerName..PlayerSex.."#{OBJ_luoyang_0015}")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
