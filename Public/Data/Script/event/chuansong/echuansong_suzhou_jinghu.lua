x400003_g_ScriptId = 400003

x400003_left 	=59.0000
x400003_right	=68.0000

x400003_top  	=266.0000
x400003_bottom	=275.0000


--玩家进入m祎 c醝 area 时触发
function x400003_OnEnterArea( sceneId, selfId )

        BeginUICommand(sceneId)
		UICommand_AddInt(sceneId, x400003_g_ScriptId);
		UICommand_AddString(sceneId, "GotoJinghu");
		UICommand_AddString(sceneId, "#{QZDZCS_100724}");
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 24)

	--CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 5,277,46)
end

--玩家T読 m祎 c醝 area 呆了m祎 段时间没走则定时触发
function x400003_OnTimer( sceneId, selfId )
	-- 毫 gi鈟,看T読 C醝 n鄖  area 停留多久了
	StandingTime = QueryAreaStandingTime( sceneId, selfId )
	-- 5 gi鈟后仍未传送
	if StandingTime >= 5000 then
		x400003_OnEnterArea( sceneId, selfId )
		ResetAreaStandingTime( sceneId, selfId, 0 )
	end
end

--玩家离开m祎 c醝 area 时触发
function x400003_OnLeaveArea( sceneId, selfId )
end

--**********************************
--任务入口函数
--**********************************
function x400003_GotoJinghu( sceneId, selfId, targetId )	-- 餴琺击该任务后执行此脚本
	
	-- 检查玩家喧ng不喧ng还T読 C醝 n鄖 范围内
	--if sceneId ~= 1   then
		--Kh眓g th� d竎h chuy琻 皙n khu v馽 y陁 c.
		--BeginEvent(sceneId)
			--AddText(sceneId,"Kh眓g th� d竎h chuy琻 皙n khu v馽 y陁 c.")
--		EndEvent(sceneId)
	--	DispatchMissionTips(sceneId,selfId)
		--return
	--end
	
	--local targetX, targetZ = GetWorldPos(sceneId, selfId)
	
	--if 	targetX < x400003_left or
		--	targetX > x400003_right or
			--targetZ < x400003_top  or
			--targetZ > x400003_bottom   then
		
--		BeginEvent(sceneId)
	--		AddText(sceneId,"Kh眓g th� d竎h chuy琻 皙n khu v馽 y陁 c.")
		--EndEvent(sceneId)
		--DispatchMissionTips(sceneId,selfId)
		--return
			
	--end
	
	CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 5,277,46)
		
end

