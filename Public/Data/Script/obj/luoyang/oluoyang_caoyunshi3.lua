--姓i L齆PC
--漕运使
--漕运循环任务

--脚本号
x311008_g_scriptId = 311008

--所拥有to� 鸬 事件ID列表
x311008_g_eventList={311010}	

--Nhi甿 v� R鵤-Th� thi ch誽号
x311008_g_MissionId			= 1000
--Nhi甿 v� R鵤-Th� thi ch誽事件列表
x311008_g_GodFireEventList={}		-- 808082
--每天R鵤-Th� thi ch誽活动M� ra 时间
x311008_g_ActivityTime		= { {tstart=1230, tend=1330},
														  {tstart=1930, tend=2030},
														  {tstart=2130, tend=2230} }

--Nhi甿 v� R鵤-Th� thi ch誽完成标记
x311008_g_Mission_IsComplete = 0	--任务参数to� 鸬 第0位
--R鵤-Th� thi ch誽L誧 D呓ng打卡标记
x311008_g_LuoYang_RecordIdx = 1		--任务参数to� 鸬 第1位
--R鵤-Th� thi ch誽T� Ch鈛打卡标记
x311008_g_SuZhou_RecordIdx = 2		--任务参数to� 鸬 第2位
--R鵤-Th� thi ch誽姓i L蚩ū昙�
x311008_g_DaLi_RecordIdx = 3			--任务参数to� 鸬 第3位
--孔明灯完成数量标记
x311008_g_KongMing_Lighten = 4		--任务参数to� 鸬 第4位
--Nhi甿 v� R鵤-Th� thi ch誽每天轮数标记
x311008_g_RoundIndex = 7					--任务参数to� 鸬 第7位

--C  餴琺燃孔明灯to� 鸬 总数
x311008_g_KongMing_CntMax	 = 24

--**********************************
--事件列表
--**********************************
function x311008_UpdateEventList( sceneId, selfId, targetId )

	for i, eventId in x311008_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate", sceneId, selfId, targetId )
	end

end

--**********************************
--事件交互入口
--**********************************
function x311008_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		--  餴琺燃姓i L鹪�
		if x311008_OnIsFillPlayCard(sceneId, selfId, targetId) == 1 then

			local misIndex = GetMissionIndexByID(sceneId,selfId,x311008_g_MissionId)
			SetMissionByIndex(sceneId, selfId, misIndex, x311008_g_DaLi_RecordIdx, 1)
			x311008_NotifyTip( sceneId, selfId, "#{GodFire_Info_020}" )
			
			-- 检测任务喧ng否完成
			if GetMissionParam(sceneId, selfId, misIndex, x311008_g_LuoYang_RecordIdx) == 1
				 and GetMissionParam(sceneId, selfId, misIndex, x311008_g_SuZhou_RecordIdx) == 1
				 and GetMissionParam(sceneId, selfId, misIndex, x311008_g_DaLi_RecordIdx) == 1 then
				
				-- 检测喧ng否 餴琺燃所有孔明灯
				if GetMissionParam(sceneId, selfId, misIndex, x311008_g_KongMing_Lighten) >= x311008_g_KongMing_CntMax then								
					-- 任务完成
					AddText( sceneId, "#{GodFire_Info_028}" )
					SetMissionByIndex( sceneId, selfId, misIndex, x311008_g_Mission_IsComplete, 1 )
				else
					AddText( sceneId, "#{GodFire_Info_037}" )
				end
			else
				--  餴琺燃火源
				AddText( sceneId, "#{GodFire_Info_010}" )
			end
			
		else
			AddText( sceneId, "#{function_caoyun_2}" )
			AddNumText( sceneId, x311008_g_scriptId, "T靘 hi瑄 T鄌 v", 11, 1 )
			AddNumText( sceneId, x311008_g_scriptId, "B 馥u T鄌 v", 7, 2 )
			
			for i, eventId in x311008_g_GodFireEventList do
				CallScriptFunction( eventId, "OnEnumerate", sceneId, selfId, targetId )
			end
		end
		
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中m祎 项
--**********************************
function x311008_OnEventRequest( sceneId, selfId, targetId, eventId )
	local NumText = GetNumText();
	if NumText == 1 then
		BeginEvent( sceneId )
			AddText( sceneId, "#{function_help_053}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	elseif NumText == 2 then
		x311008_UpdateEventList( sceneId, selfId, targetId )
		return
	end

	for i, findId in x311008_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnHandle_QuestUI",sceneId, selfId, targetId, NumText )
			return
		end
	end
	
	for i, findId in x311008_g_GodFireEventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			
			return 0
		end
	end
	
end

--**********************************
--Ti猵 th薔PCto� 鸬 任务
--**********************************
function x311008_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x311008_g_GodFireEventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId, targetId, missionScriptId )
			return
		end
	end
end

--**********************************
--拒绝此NPCto� 鸬 任务
--**********************************
function x311008_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后,关闭对话窗口
	return
end

--**********************************
--继续(已经接了任务)
--**********************************
function x311008_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x311008_g_GodFireEventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完to� 鸬 任务
--**********************************
function x311008_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x311008_g_GodFireEventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x311008_OnDie( sceneId, selfId, killerId )
end


-- 检测R鵤-Th� thi ch誽传递活动喧ng否Th鯽 m鉵打卡条件
function x311008_OnIsFillPlayCard(sceneId, selfId, targetId)

  --玩家身上喧ng否有Nhi甿 v� R鵤-Th� thi ch誽
	if IsHaveMission( sceneId, selfId, x311008_g_MissionId ) <= 0 then				
		return 0
	end

	--检测玩家参加活动to� 鸬 时间
	local	nDayTime = GetMissionData( sceneId, selfId, MD_GODOFFIRE_DAYTIME )
	
	local nDay = LuaFnGetDayOfThisMonth()
	if nDayTime ~= nDay then
		return 0
	end

	local misIndex = GetMissionIndexByID(sceneId,selfId,x311008_g_MissionId)
	
	--检测当天参加to� 鸬 喧ng第几轮
	local nRoundIdx = GetMissionParam(sceneId, selfId, misIndex, x311008_g_RoundIndex)

	local nHour	 = GetHour()
	local nMinute = GetMinute()  
  local curHourTime = nHour*100+nMinute

	if curHourTime < x311008_g_ActivityTime[nRoundIdx].tstart or curHourTime > x311008_g_ActivityTime[nRoundIdx].tend then
		return 0
	end
	
	--检测喧ng否T読 姓i L蚬�
	if GetMissionParam(sceneId, selfId, misIndex, x311008_g_DaLi_RecordIdx) == 1 then
		return 0
	end
	
	return 0
end

--**********************************
--醒目提示
--**********************************
function x311008_NotifyTip( sceneId, selfId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end
