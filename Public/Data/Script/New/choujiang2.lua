--大理NPC
--抽奖
--普通

--**********************************
--事件交互入口
--**********************************
function x000159_OnDefaultEvent( sceneId, selfId,targetId )
	local temp = random(10)
	local msgStr = format( "  #GB課 mu痭 th� t鄆 v may ? H銀 餰m 15 con th鋙 ng� 瓞 c� th� tham gia s� ki畁 n鄖. Nh鎛g vi阯 b鋙 th誧h c 5 v� c鵱g gi� tr� 餫ng ch� c醕 b課.")
	BeginEvent(sceneId)
		AddText(sceneId,msgStr)
		AddNumText( sceneId, x000160_g_ScriptId, "C� ! T鬷 c� mang theo 15 con Th鋙 Ng�", 10, 1 )
		AddNumText( sceneId, x000160_g_ScriptId, "Kh鬾g ! T鬷 ch遖 瘘 s� c� n鄖", 10, 2 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
--**********************************
--事件列表选中一项
--**********************************
function x000159_OnEventRequest( sceneId, selfId, targetId, eventId)
	if GetNumText() == 1 then
		if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 1 then
			x000159_NotifyFailTips( sceneId, selfId, "Tay n鋣 疸 馥y" )
			x000159_NotifyFailBox( sceneId, selfId, targetId, "  Tay n鋓 疸 馥y" )
			return
		end
		local number = LuaFnGetAvailableItemCount(sceneId, selfId, 20102001)
		if number<1 then
			x000159_NotifyFailBox( sceneId, selfId, targetId, " B課 kh鬾g c� Th鋙 Ng� h銀 h鱟 ngh� c鈛 c� v� t緄 Ki猰 C醕, V� L唼ng S絥, Th醝 H�... thu th 瘘 15 con Th鋙 Ng� r癷 h銀 t靘 ta." )
			return
		else
			local reply = LuaFnDelAvailableItem(sceneId,selfId,20102001,15)
			if reply > 0 then
				local temp = random(60)
			local equipID
			if temp==1 then
				equipID=50514001
			elseif temp==2 then
				equipID=50513006
			elseif temp==3 then
				equipID=20102001
			elseif temp==4 then
				equipID=50513005
			elseif temp==5 then
				equipID=50513005
			elseif temp==6 then
				equipID=50513004
			elseif temp==7 then
				equipID=50513004
			elseif temp==8 then
				equipID=50513003
			elseif temp==9 then
				equipID=50513003
			elseif temp==10 then
				equipID=50513003
			elseif temp==11 then
				equipID=50513002
			elseif temp==12 then
				equipID=50513002
			elseif temp==13 then
				equipID=50513001
			elseif temp==14 then
				equipID=50513001
			elseif temp==15 then
				equipID=50512008
			elseif temp==16 then
				equipID=50512008
			elseif temp==17 then
				equipID=50512007
			elseif temp==18 then
				equipID=50512007
			elseif temp==19 then
				equipID=50512006
			elseif temp==20 then
				equipID=50512006
			elseif temp==21 then
				equipID=50512005
			elseif temp==22 then
				equipID=50501001
			elseif temp==23 then
				equipID=50512004
			elseif temp==24 then
				equipID=50512004
			elseif temp==25 then
				equipID=50512003
			elseif temp==26 then
				equipID=50512003
			elseif temp==27 then
				equipID=50512002
			elseif temp==28 then
				equipID=50501001
			elseif temp==29 then
				equipID=50512002
			elseif temp==30 then
				equipID=50512001
			elseif temp==31 then
				equipID=50512001
			elseif temp==32 then
				equipID=50512001
			elseif temp==33 then
				equipID=50511002
			elseif temp==34 then
				equipID=50511001
			elseif temp==35 then
				equipID=50504002
			elseif temp==36 then
				equipID=50503001
			elseif temp==37 then
				equipID=50502008
			elseif temp==38 then
				equipID=50502007
			elseif temp==39 then
				equipID=50502006
			elseif temp==40 then
				equipID=50502005
			elseif temp==41 then
				equipID=50502004
			elseif temp==42 then
				equipID=50502003
			elseif temp==43 then
				equipID=50502002
			elseif temp==44 then
				equipID=50502001
			elseif temp==45 then
				equipID=50501002
			else
				equipID=0
			end
			local str = "  #YXin ch鷆 m譶g b課 疸 鹫t 1 #W"..GetItemName( sceneId, equipID ).."！"
			if equipID~=0 then
				if TryRecieveItem( sceneId, selfId, equipID, 1 ) >= 0 then
					x000159_NotifyFailTips( sceneId, selfId, str )
					x000159_NotifyFailBox( sceneId, selfId, targetId, str )
				end
			else
				local str = "  H鬽 nay b課 kh鬾g may m."
				x000159_NotifyFailTips( sceneId, selfId, str )
				x000159_NotifyFailBox( sceneId, selfId, targetId, str )
			end
			else
				x000159_NotifyFailBox( sceneId, selfId, targetId, "Thao t醕 sai, kh鬾g th馽 hi畁 trao 鸨i." )
			end
		end
	elseif GetNumText() == 2 then
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
			EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
		return		
	end
end
--**********************************
-- 对话窗口信息提示
--**********************************
function x000159_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
-- 屏幕中间信息提示
--**********************************
function x000159_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
