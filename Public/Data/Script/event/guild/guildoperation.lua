--帮会相关UI 30,31,103

x600000_g_ScriptId = 600000;
x600000_g_Yinpiao = 40002000

function x600000_OnEnumerate( sceneId, selfId, targetId, sel )
	if( sel == 1 ) then
		GuildCreate(sceneId, selfId, targetId);
	elseif( sel == 2 ) then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId) --调用Th鄋h ph� 入口组界面
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 103)
		--先让客户端记录NPC信息再显示窗口
		CityApply(sceneId, selfId)
		GuildList(sceneId, selfId, targetId);
	elseif( sel == 3 ) then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId);
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 30)
	elseif( sel == 4 ) then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId);
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 31)
	elseif( sel == 5 )then
		local ret = CheckPlayerCanApplyCity(sceneId, selfId);
		if ret==1 then 
			BeginUICommand(sceneId)
				UICommand_AddInt(sceneId,targetId) --调用Th鄋h ph� 入口组界面
			EndUICommand(sceneId)
			DispatchUICommand(sceneId,selfId, 101)
			--先让客户端记录NPC信息再显示窗口
			CityApply(sceneId, selfId)
		elseif ret==-1 then
			BeginEvent(sceneId)
				AddText(sceneId,"Bang h礽 疸 c� th鄋h th�!")
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
	elseif( sel == 6 ) then
		--喧ng否T読 漕运
		local haveImpact = LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 113)
		if haveImpact == 1 then
				BeginEvent(sceneId)
					strText = "Xin l瞚, c醕 h� hi畁 gi� � trong tr課g th醝 v chuy琻."
					AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				return
		end
		-- 检测玩家身上喧ng不喧ng有“银票”C醝 n鄖 东西,有就不能使用这里to� 鸬 功能
		if GetItemCount(sceneId, selfId, x600000_g_Yinpiao)>=1  then
			BeginEvent( sceneId )
				AddText( sceneId, "  Tr阯 ng叨i c醕 h� c� ng鈔 phi猽, 餫ng ch誽 tr痭 n�! Ta kh鬾g th� gi鷓 c醕 h�" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			return
		end
		
		CityMoveTo(sceneId, selfId)
	end
	
end
