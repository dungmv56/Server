--NPC 副本外休息室 传送NPC Ki猰 Thao

x402304_g_ScriptId = 402304; --脚本号
x402304_g_name	="Ki猰 Thao";

--所拥有to� 鸬 事件ID列表
x402304_g_eventId_yes = 0;
x402304_g_eventId_no = 1;

x402304_g_Exit_SceneID = 0 --传出场景ID
x402304_g_Win_X = 160 --获胜方出口
x402304_g_Win_Z = 106
x402304_g_Fail_X = 61 --th b読方出口
x402304_g_Fail_Z = 134

x402304_g_SheepBuff = 31550											--变羊buff

--**********************************
--事件交互入口
--**********************************
function x402304_OnDefaultEvent( sceneId, selfId, targetId )
	x402304_UpdateEventList( sceneId, selfId, targetId );
end

--**********************************
--事件列表
--**********************************
function x402304_UpdateEventList( sceneId, selfId, targetId )

	BeginEvent(sceneId);
		AddText( sceneId, "#{BHXZ_081210_158}" );
		AddNumText( sceneId, x402304_g_ScriptId, "#{BHXZ_081210_159}", 4, x402304_g_eventId_yes);
		--AddNumText( sceneId, x402304_g_ScriptId, "Hu� b�", 8, x402304_g_eventId_no);
	EndEvent(sceneId);
	DispatchEventList(sceneId, selfId, targetId);
	
end

--**********************************
--事件列表选中m祎 项
--**********************************
function x402304_OnEventRequest( sceneId, selfId, targetId, eventId )
	local selectEventId	= GetNumText();
	
	if selectEventId == x402304_g_eventId_yes then
		
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x402304_g_SheepBuff) == 1 then
			NewWorld( sceneId, selfId, x402304_g_Exit_SceneID, x402304_g_Fail_X, x402304_g_Fail_Z )
		else
			NewWorld( sceneId, selfId, x402304_g_Exit_SceneID, x402304_g_Win_X, x402304_g_Win_Z )
		end
		
	else
--		BeginUICommand( sceneId )
--		UICommand_AddInt( sceneId, targetId )
--		EndUICommand( sceneId )
--		DispatchUICommand( sceneId, selfId, 1000 )
	end

end

--**********************************
--Ti猵 th薔PCto� 鸬 任务
--**********************************
function x402304_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
end

--**********************************
--拒绝此NPCto� 鸬 任务
--**********************************
function x402304_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
end
