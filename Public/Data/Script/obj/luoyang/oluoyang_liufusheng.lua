--L誧 D呓ngNPC
--柳复生
--普通

--**********************************
--事件交互入口
--**********************************
function x000097_OnDefaultEvent( sceneId, selfId,targetId )
    local  PlayerName=GetName(sceneId,selfId)	
	local  PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex = " c� n呓ng"
	else
		PlayerSex = " c醕 h�"
	end
	BeginEvent(sceneId)
		AddText(sceneId,"  Y阯 t鈓, "..PlayerName..PlayerSex..", ta nh 鸶nh s� n� l馽 tham gia cu礳 thi")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
