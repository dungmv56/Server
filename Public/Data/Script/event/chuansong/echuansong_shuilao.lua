--玩家进入m祎 c醝 area 时触发
function x400914_OnEnterArea( sceneId, selfId )
--misIndex = GetMissionIndexByID(sceneId,selfId,4013)
--num = GetMissionParam(sceneId,selfId,misIndex,0)
--if	num == 1 then
--	NewWorld( sceneId, selfId, 0, 234, 69 )
--else
--	CallScriptFunction((231000), "OnAbandon",sceneId, selfId)
--end

--	BeginEvent(sceneId)
--		AddText(sceneId,"  你X醕 nh要离开水牢吗?")
--		AddNumText(sceneId,g_scriptId,"X醕 nh",2,0)
--		AddNumText(sceneId,g_scriptId,"Hu� b�",2,1)
--	EndEvent( )
--	DispatchEventList(sceneId,selfId,targetId)

	misIndex = GetMissionIndexByID(sceneId,selfId,1213)
	num = GetMissionParam(sceneId,selfId,misIndex,0)
	if	num == 1 then
		NewWorld( sceneId, selfId, 4, 52, 96 )
	else
		CallScriptFunction((232002), "OnAbandon",sceneId, selfId)
	end
end

--玩家T読 m祎 c醝 area 呆了m祎 段时间没走则定时触发
function x400914_OnTimer( sceneId, selfId )
	-- 毫 gi鈟,看T読 C醝 n鄖  area 停留多久了
	StandingTime = QueryAreaStandingTime( sceneId, selfId )
	-- 5 gi鈟后仍未传送
	if StandingTime >= 5000 then
		x400914_OnEnterArea( sceneId, selfId )
		ResetAreaStandingTime( sceneId, selfId, 0 )
	end
end

--玩家离开m祎 c醝 area 时触发
function x400914_OnLeaveArea( sceneId, selfId )
end

----**********************************
----事件列表选中m祎 项
----**********************************
--function OnEventRequest( sceneId, selfId, targetId, eventId )
--	if	GetNumText()==0	then
--		if	IsHaveMission( sceneId, selfId, 4012)>0	 then
--			misIndex = GetMissionIndexByID(sceneId,selfId,4013)
--			num = GetMissionParam(sceneId,selfId,misIndex,0)
--			if	num == 1 then
--				NewWorld( sceneId, selfId, 0, 234, 69 )
--			else
--				CallScriptFunction((231000), "OnAbandon",sceneId, selfId)
--			end
--		end
--	end
--end
