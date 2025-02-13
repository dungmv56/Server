x400932_g_ScriptId = 400932

x400932_left 	=25.0000
x400932_right	=31.0000

x400932_top =100.0000
x400932_bottom	=106.0000

--玩家进入m祎 c醝 area 时触发
function x400932_OnEnterArea( sceneId, selfId,a,b )

	BeginUICommand(sceneId)
		UICommand_AddInt(sceneId, x400932_g_ScriptId);
		UICommand_AddString(sceneId, "GotoHuoyangu");
		UICommand_AddString(sceneId, "火焰谷为不加杀气场景,请注意安全.你确认要进入吗?");
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 24)
	
	--CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 519,71,29)
end

--玩家T読 m祎 c醝 area 呆了m祎 段时间没走则定时触发
function x400932_OnTimer( sceneId, selfId )
	-- 毫 gi鈟,看T読 C醝 n鄖  area 停留多久了
	StandingTime = QueryAreaStandingTime( sceneId, selfId )
	-- 5 gi鈟后仍未传送
	if StandingTime >= 5000 then
		x400932_OnEnterArea( sceneId, selfId )
		ResetAreaStandingTime( sceneId, selfId, 0 )
	end
end

--玩家离开m祎 c醝 area 时触发
function x400932_OnLeaveArea( sceneId, selfId )
end

--**********************************
--任务入口函数
--**********************************
function x400932_GotoHuoyangu( sceneId, selfId, targetId )	-- 餴琺击该任务后执行此脚本
	
	-- 检查玩家喧ng不喧ng还T読 C醝 n鄖 范围内
	if sceneId ~= 423   then
		--Ng呓i 疸 kh鬾g � khu v馽 v chuy琻.
		BeginEvent(sceneId)
			AddText(sceneId,"Ng呓i 疸 kh鬾g � khu v馽 v chuy琻.")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	local targetX, targetZ = GetWorldPos(sceneId, selfId)
	
	if 	targetX < x400932_left or
			targetX > x400932_right or
			targetZ < x400932_top  or
			targetZ > x400932_bottom   then
		
		BeginEvent(sceneId)
			AddText(sceneId,"Ng呓i 疸 kh鬾g � khu v馽 v chuy琻.")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
			
	end
	
	CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 519,71,29)
		
end
