--L誧 D呓ngNPC
--乔复盛
--普通
x000109_g_scriptId=000109

--**********************************
--事件交互入口
--**********************************
function x000109_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  C� mu痭 t� m� ti甿 l鄊 鬾g ch� kh鬾g? Ta c� th� d誽 ng呓i")
		AddNumText(sceneId,x000109_g_scriptId,"Ki琺 tra t c� th呓ng 餴猰",6,2)
		if IsShutout( sceneId, selfId, ONOFF_T_PSHOP ) == 0 then
			AddNumText(sceneId,x000109_g_scriptId,"X鈟 d駈g th呓ng 餴猰 ri阯g",6,0)
		else
			AddNumText(sceneId,x000109_g_scriptId,"H鼀 gian h鄋g c黙 ta",6,7)
		end
		AddNumText(sceneId,x000109_g_scriptId,"Qu鋘 l� th呓ng 餴猰 ri阯g",6,1)
		AddNumText(sceneId,x000109_g_scriptId,"Ki琺 tra ti甿 餫ng chu b� b醤",6,3)
		AddNumText(sceneId,x000109_g_scriptId,"Gi緄 thi畊 th呓ng ti甿 ng叨i ch絠",11,6)
		AddNumText(sceneId,x000109_g_scriptId,"Li阯 quan thu mua nguy阯 li畊",11,10)

	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************

--事件列表选中m祎 项

--**********************************

function x000109_OnEventRequest( sceneId, selfId, targetId, eventId )

--0.X鈟 d駈g th呓ng 餴猰 ri阯g->显示建店条款->由客户端请求建店
		if	GetNumText()==0	then

			BeginEvent(sceneId)

				AddText(sceneId,"#{PS_OPEN_SHOP_NOTICE}")

			EndEvent(sceneId)

			DispatchMissionDemandInfo(sceneId,selfId,targetId,x000109_g_scriptId,0,1)


		--1.管理自己店铺
		elseif	GetNumText()==1	then

			--1.0通过店铺名来判定喧ng否此店已经打开
			strShop0Name = LuaFnGetShopName(sceneId, selfId, 0)
			strShop1Name = LuaFnGetShopName(sceneId, selfId, 1)

			--1.1没店铺直接发错误提示
			if((strShop0Name == "")and(strShop1Name == "")) then
				BeginEvent(sceneId)

					strText = "Xin l瞚, ng呓i h靚h nh� kh鬾g c� ti甿!"

					AddText(sceneId,strText);

				EndEvent(sceneId)

				DispatchMissionTips(sceneId,selfId)

			--1.2有店铺根据不同情况不同处理
			else
				--1.2.1有两c醝店铺,等待进m祎 步选择
				if((strShop0Name ~= "") and (strShop1Name ~= "")) then
						BeginEvent(sceneId)

							AddText(sceneId,"H� h�, t� ra tr叻ng qu t緄 r癷, xin h鰅 c醕 h� mu痭 t緄 xem gian ti甿 n鄌?")

							if GetPlayerShopFrezeType(sceneId, selfId, 0) == 1 then
								AddNumText(sceneId,x000109_g_scriptId,"#cCCCCCCTi甿 1  "..strShop0Name,-1,4)
							else
								AddNumText(sceneId,x000109_g_scriptId,"Ti甿 1  "..strShop0Name,-1,4)
							end
							if GetPlayerShopFrezeType(sceneId, selfId, 1) == 1 then
								AddNumText(sceneId,x000109_g_scriptId,"#cCCCCCCTi甿 2  "..strShop1Name,-1,5)
							else
								AddNumText(sceneId,x000109_g_scriptId,"Ti甿 2  "..strShop1Name,-1,5)
							end

						EndEvent(sceneId)
						DispatchEventList(sceneId,selfId,targetId)

				--1.2.2只有m祎 c醝直接打开C醝 n鄖 
				elseif(strShop0Name ~= "") then
						LuaFnOpenPlayerShop(sceneId, selfId, targetId, 0)

				--1.2.3只有m祎 c醝直接打开C醝 n鄖 
				elseif(strShop1Name ~= "") then
						LuaFnOpenPlayerShop(sceneId, selfId, targetId, 1)
				end

			end

		--2.察看所有商店to� 鸬 列表

		elseif	GetNumText()==2	then

			DispatchPlayerShopList( sceneId, selfId, targetId )

		--3.察看所有盘出商店to� 鸬 列表
		elseif	GetNumText()==3	then

			DispatchPlayerShopSaleOutList( sceneId, selfId, targetId )

		--4.察看自己身上to� 鸬 指定商店
		elseif	GetNumText()==4	then

			LuaFnOpenPlayerShop(sceneId, selfId, targetId, 0)

		--5.察看自己身上to� 鸬 指定商店
		elseif	GetNumText()==5	then

			LuaFnOpenPlayerShop(sceneId, selfId, targetId, 1)
		
		--6.Gi緄 thi畊 th呓ng ti甿 ng叨i ch絠
		elseif	GetNumText()==6	then

			BeginEvent(sceneId)
				AddText( sceneId, "#{function_help_048}" )
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)

		--7.再次确认喧ng否删店
		elseif	GetNumText()==7	then
	
			--1.0通过店铺名来判定喧ng否此店已经打开
			local strShop0Name = LuaFnGetShopName(sceneId, selfId, 0)
			local strShop1Name = LuaFnGetShopName(sceneId, selfId, 1)

			--1.1没店铺直接发错误提示
			if((strShop0Name == "")and(strShop1Name == "")) then
				BeginEvent(sceneId)
					strText = "C醕 h� 韙 nh ph鋓 c� 1 gian h鄋g"
					AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
			else
				BeginEvent(sceneId)
					AddText(sceneId,"#{UnregisterShopHelp}")
					AddNumText(sceneId,x000109_g_scriptId,"Duy畉",6,8)
					AddNumText(sceneId,x000109_g_scriptId,"R秈 kh鰅",6,9)
				EndEvent(sceneId)
				DispatchEventList(sceneId,selfId,targetId)
			end

		--7.删!
		elseif	GetNumText()==8	then
			local canErase = CanErasePlayerShop(sceneId, selfId)
			if(canErase == 1) then
				BeginUICommand(sceneId)
				EndUICommand(sceneId)
				DispatchUICommand(sceneId,selfId, 1000)
				ErasePlayerShop(sceneId,selfId)
				local msg = format("Ch鷆 m譶g c醕 h� h鼀 b� th鄋h c鬾g, ti玭 v痭 trong gian h鄋g 疸 ho鄋 tr� cho c醕 h�, vui l騨g ki琺 tra l読.");
				BeginEvent( sceneId )
					AddText( sceneId, msg )
				EndEvent( sceneId )
				DispatchMissionTips( sceneId, selfId )
				
				msg = format("您已成功注销c醝人商店");
				BeginEvent( sceneId )
					AddText( sceneId, msg )
				EndEvent( sceneId )
				DispatchMissionTips( sceneId, selfId )
				
				BeginUICommand(sceneId)
				EndUICommand(sceneId)
				DispatchUICommand(sceneId,selfId, 19810222)
			elseif canErase == -1 then
				local msg = format("您to� 鸬 商店已被冻结.");
				BeginEvent( sceneId )
					AddText( sceneId, msg )
				EndEvent( sceneId )
				DispatchMissionTips( sceneId, selfId )
			else
				local msg = format("Th呓ng ti甿 c黙 c醕 h� v鏽 c騨 th呓ng ph, khi n鄌 tr痭g h銀 皙n t靘 ta.");
				BeginEvent( sceneId )
					AddText( sceneId, msg )
				EndEvent( sceneId )
				DispatchMissionTips( sceneId, selfId )
			end
		elseif	GetNumText()==9	then
			BeginUICommand(sceneId)
			EndUICommand(sceneId)
			DispatchUICommand(sceneId,selfId, 1000)
		elseif	GetNumText()==10	then
			BeginEvent(sceneId)
				AddText( sceneId, "#{function_help_101}" )
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		end

end



--**********************************

--继续

--**********************************

function x000109_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )

	ApplyPlayerShop( sceneId, selfId, targetId )

end
