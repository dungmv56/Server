x400933_g_ScriptId = 400933

x400933_left 	=69.0000
x400933_right	=76.0000

x400933_top  	=141.0000
x400933_bottom	=148.0000


--玩家进入m祎 c醝 area 时触发
function x400933_OnEnterArea( sceneId, selfId,a,b )

	BeginUICommand(sceneId)
		UICommand_AddInt(sceneId, x400933_g_ScriptId);
		UICommand_AddString(sceneId, "GotoGaochangmigong");
		UICommand_AddString(sceneId, "高昌迷宫为不加杀气场景,请注意安全.你确认要进入吗?");
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 24)
	
	--CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 520,100,99)
end

--玩家T読 m祎 c醝 area 呆了m祎 段时间没走则定时触发
function x400933_OnTimer( sceneId, selfId )
	-- 毫 gi鈟,看T読 C醝 n鄖  area 停留多久了
	StandingTime = QueryAreaStandingTime( sceneId, selfId )
	-- 5 gi鈟后仍未传送
	if StandingTime >= 5000 then
		x400933_OnEnterArea( sceneId, selfId )
		ResetAreaStandingTime( sceneId, selfId, 0 )
	end
end

--玩家离开m祎 c醝 area 时触发
function x400933_OnLeaveArea( sceneId, selfId )
end

--**********************************
--任务入口函数
--**********************************
function x400933_GotoGaochangmigong( sceneId, selfId, targetId )	-- 餴琺击该任务后执行此脚本
	
	-- 检查玩家喧ng不喧ng还T読 C醝 n鄖 范围内
	if sceneId ~= 424   then
		--Ng呓i 疸 kh鬾g � khu v馽 v chuy琻.
		BeginEvent(sceneId)
			AddText(sceneId,"Ng呓i 疸 kh鬾g � khu v馽 v chuy琻.")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	local targetX, targetZ = GetWorldPos(sceneId, selfId)
	
	if 	targetX < x400933_left or
			targetX > x400933_right or
			targetZ < x400933_top  or
			targetZ > x400933_bottom   then
		
		BeginEvent(sceneId)
			AddText(sceneId,"Ng呓i 疸 kh鬾g � khu v馽 v chuy琻.")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
			
	end
	
	CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 520,100,99)
		
end
