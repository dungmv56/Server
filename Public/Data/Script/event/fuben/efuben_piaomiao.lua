x402046_g_ScriptId = 402046


x402046_left 	=123.0000
x402046_right	=127.0000

x402046_top  	=170.0000
x402046_bottom  =173.0000


--玩家进入m祎 c醝 area 时触发
function x402046_OnEnterArea( sceneId, selfId )

	BeginUICommand(sceneId)
		UICommand_AddInt(sceneId, x402046_g_ScriptId);
		UICommand_AddString(sceneId, "GotoLoulan");
		UICommand_AddString(sceneId, "C醕 h� c� ch mu痭 r秈 kh鰅 Phi陁 Mi璾 Phong?");
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 24)
	
	--CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 186,191,221)
end

--玩家T読 m祎 c醝 area 呆了m祎 段时间没走则定时触发
function x402046_OnTimer( sceneId, selfId )
	-- 毫 gi鈟,看T読 C醝 n鄖  area 停留多久了
	StandingTime = QueryAreaStandingTime( sceneId, selfId )
	-- 5 gi鈟后仍未传送
	if StandingTime >= 5000 then
		x402046_OnEnterArea( sceneId, selfId )
		ResetAreaStandingTime( sceneId, selfId, 0 )
	end
end

--玩家离开m祎 c醝 area 时触发
function x402046_OnLeaveArea( sceneId, selfId )
end

--**********************************
--任务入口函数
--**********************************
function x402046_GotoLoulan( sceneId, selfId, targetId )	-- 餴琺击该任务后执行此脚本
	
	--喧ng否喧ng副本
	local sceneType = LuaFnGetSceneType( sceneId )
	if sceneType ~= 1 then
		return
	end

	
	local targetX, targetZ = GetWorldPos(sceneId, selfId)
	
	if 	targetX < x402046_left or
			targetX > x402046_right or
			targetZ < x402046_top  or
			targetZ > x402046_bottom   then
		
		BeginEvent(sceneId)
			AddText(sceneId,"C醕 h� kh鬾g n trong v鵱g d竎h chuy琻.")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
			
	end
	
	CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 186,191,221)
		
end
