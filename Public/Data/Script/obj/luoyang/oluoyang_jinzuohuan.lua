--L誧 D呓ngNPC
--金左焕
--普通

--**********************************
--事件交互入口
--**********************************
function x000028_OnDefaultEvent( sceneId, selfId,targetId )
    local  PlayerName=GetName(sceneId,selfId)	
	local  PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex = " c� n呓ng "
	else
		PlayerSex = " c醕 h�"
	end
	BeginEvent(sceneId)
		AddText(sceneId,"  Ai n骾 qu痗 l� c痭g ti猲 c黙 Cao Ly Qu痗 ch鷑g ta b� m? N骾 l醥, kh鬾g h� c� chuy畁 痼. "..PlayerName..PlayerSex..", n猽 c騨 nghe c� ng叨i n骾 b, h銀 d h v� 疴y g ta, ta ph鋓 h鰅 xem con m n鄌 c黙 h 疸 nh靚 th qu痗 l� b� m")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
