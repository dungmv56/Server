--玩家进入m祎 c醝 area 时触发
function x400019_OnEnterArea( sceneId, selfId )
	--CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 2,39,152)
	if sceneId ==7 then    -- Ki猰 C醕1就到姓i L�1
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 2,39,152)
	elseif sceneId ==75 then -- Ki猰 C醕2就到姓i L�2
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 71,39,152)		
	elseif sceneId ==76 then -- Ki猰 C醕3就到姓i L�3
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 72,39,152)			
	end

end

--玩家T読 m祎 c醝 area 呆了m祎 段时间没走则定时触发
function x400019_OnTimer( sceneId, selfId )
	-- 毫 gi鈟,看T読 C醝 n鄖  area 停留多久了
	StandingTime = QueryAreaStandingTime( sceneId, selfId )
	-- 5 gi鈟后仍未传送
	if StandingTime >= 5000 then
		x400019_OnEnterArea( sceneId, selfId )
		ResetAreaStandingTime( sceneId, selfId, 0 )
	end
end

--玩家离开m祎 c醝 area 时触发
function x400019_OnLeaveArea( sceneId, selfId )
end
