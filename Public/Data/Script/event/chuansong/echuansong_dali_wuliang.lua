--玩家进入m祎 c醝 area 时触发
function x400006_OnEnterArea( sceneId, selfId )
	--CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 6,43,172)
	--增加姓i L�2/3 到无量山2/3to� 鸬 传送脚本相关内容	
	if sceneId ==2 then    -- 姓i L�1就到无量山1
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 6,43,172)
	elseif sceneId ==71 then -- 姓i L�2就到无量山2
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 73,43,172)		
	elseif sceneId ==72 then -- 姓i L�3就到无量山3
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 74,43,172)			
	end

end

--玩家T読 m祎 c醝 area 呆了m祎 段时间没走则定时触发
function x400006_OnTimer( sceneId, selfId )
	-- 毫 gi鈟,看T読 C醝 n鄖  area 停留多久了
	StandingTime = QueryAreaStandingTime( sceneId, selfId )
	-- 5 gi鈟后仍未传送
	if StandingTime >= 5000 then
		x400006_OnEnterArea( sceneId, selfId )
		ResetAreaStandingTime( sceneId, selfId, 0 )
	end
end

--玩家离开m祎 c醝 area 时触发
function x400006_OnLeaveArea( sceneId, selfId )
end
