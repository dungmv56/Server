--宝藏探测器2型 

--脚本号
x300006_g_scriptId = 300004

--任务号
x300006_g_MissionId = 700

--任务道具编号
x300006_g_ItemId = 40002106

--**********************************
--刷新事件
--**********************************
function x300006_OnDefaultEvent( sceneId, selfId, BagIndex )
	misIndex = GetMissionIndexByID(sceneId,selfId,x300006_g_MissionId)
	x300006_g_MissionCondition = GetMissionParam(sceneId,selfId,misIndex,0)		-- 鹫t 疬㧟任务状态
	scene = GetMissionParam(sceneId,selfId,misIndex,2)					-- 鹫t 疬㧟宝物场景号
	treasureX = GetMissionParam(sceneId,selfId,misIndex,3)					-- 鹫t 疬㧟宝物X坐标
	treasureZ = GetMissionParam(sceneId,selfId,misIndex,4)				-- 鹫t 疬㧟宝物Z坐标	
	--如果任务已经完成
	if x300006_g_MissionCondition == 1 then
		BeginEvent(sceneId)
			AddText(sceneId,"秀 t靘 疬㧟 r癷, quay v� giao tr� nhi甿 v� 餴")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	--取 餴琺玩家当前坐标
	PlayerX = GetHumanWorldX(sceneId,selfId)
	PlayerZ = GetHumanWorldZ(sceneId,selfId)
	--计算玩家与宝藏to� 鸬 距离
	Distance = floor(sqrt((treasureX - PlayerX) * (treasureX - PlayerX) + (treasureZ - PlayerZ) * (treasureZ - PlayerZ)))
	if sceneId ~= scene then
		BeginEvent(sceneId)
			AddText(sceneId,"H靚h nh� b鋙 t鄋g kh鬾g n trong c鋘h n鄖")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	if Distance >1 then
		--BeginEvent(sceneId)
		--	AddText(sceneId,"探测器没有感应到任何宝藏")
		--EndEvent(sceneId)
		--DispatchMissionTips(sceneId,selfId)
		--BeginEvent(sceneId)
		--	AddText(sceneId,"继续找吧")
		--EndEvent(sceneId)
		--DispatchMissionTips(sceneId,selfId)
	--elseif Distance <= 100 and Distance >=2 then
		BeginEvent(sceneId)
			AddText(sceneId,"C� ly c醕h b鋙 t鄋g c騨 "..Distance.." G誳")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	elseif Distance <= 1 then
		BeginAddItem(sceneId)
			AddItem( sceneId,x300006_g_ItemId, 1 )
		local ret = EndAddItem(sceneId,selfId)
		if ret > 0  then
			AddItemListToHuman(sceneId,selfId)
			SetMissionByIndex(sceneId,selfId,misIndex,0,1)		--把任务状态变量设置为1,表示已经完成
		end
	end
end

--function OnTimeUp( sceneId, selfId, timeIndex )
--	npcobjid = LuaFnGetCopySceneData_Param(sceneId, 2)
--	if npcobjid ~= 0 then
--		LuaFnDeleteMonster( sceneId, npcobjid )
--		LuaFnSetCopySceneData_Param(sceneId, 2, 0)
--		StopTimer( sceneId, selfId,timeIndex)
--	end
--end

--function BaoZangAddress( sceneId, selfId  )
--	return	 45,2,3
	--g_TreasureAddress[1].scenenum,g_TreasureAddress[1].x,g_TreasureAddress[1].z
--end
