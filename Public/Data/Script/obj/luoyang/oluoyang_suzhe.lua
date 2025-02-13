--L誧 D呓ngNPC
--苏辙
--普通

x000000_g_scriptId=000000

--**********************************

--事件交互入口

--**********************************

function x000000_OnDefaultEvent( sceneId, selfId,targetId )

	BeginEvent(sceneId)
		AddText(sceneId,"衞an v呓ng l� ng� 甬 c黙 疬絥g kim ho鄋g 皙, 鹧ng 馥u trong c醕 ho鄋g th鈔. M d� n錷 nay ch� m緄 15 tu眎, nh遪g 疸 t� c� kh� 鸬 kh醕 th叨ng")
		--AddText(sceneId,"你可以选择建立属于自己to� 鸬 商铺.")

		--AddNumText(sceneId,x000000_g_scriptId,"建立自己to� 鸬 商店",6,0)
		--AddNumText(sceneId,x000000_g_scriptId,"管理自己to� 鸬 商店",6,1)
		--AddNumText(sceneId,x000000_g_scriptId,"查看所有商店",6,2)

		--AddNumText(sceneId,x000000_g_scriptId,"查看正准备盘出to� 鸬 店",6,3)

		--AddNumText(sceneId,x000000_g_scriptId,"建立挂T読 场景上to� 鸬 Th鄋h ph� ",6,6)
		--AddNumText(sceneId,x000000_g_scriptId,"删除挂T読 场景上to� 鸬 Th鄋h ph� ",6,7)

		--AddNumText(sceneId,x000000_g_scriptId,"进入本帮Th鄋h ph� 1",9,8)

	EndEvent(sceneId)

	DispatchEventList(sceneId,selfId,targetId)

end



--**********************************

--事件列表选中m祎 项

--**********************************

function x000000_OnEventRequest( sceneId, selfId, targetId, eventId )

		--0.建立自己to� 鸬 商店->显示建店条款->由客户端请求建店
		if	GetNumText()==0	then

			BeginEvent(sceneId)

				AddText(sceneId,"#{PS_OPEN_SHOP_NOTICE}")

			EndEvent(sceneId)

			DispatchMissionDemandInfo(sceneId,selfId,targetId,x000000_g_scriptId,0,1)


		--1.管理自己店铺
		elseif	GetNumText()==1	then

			--1.0通过店铺名来判定喧ng否此店已经打开
			strShop0Name = LuaFnGetShopName(sceneId, selfId, 0)
			strShop1Name = LuaFnGetShopName(sceneId, selfId, 1)

			--1.1没店铺直接发错误提示
			if((strShop0Name == "")and(strShop1Name == "")) then
				BeginEvent(sceneId)

					strText = "Xin l瞚, ng呓i h靚h nh� kh鬾g c� ti甿"

					AddText(sceneId,strText);

				EndEvent(sceneId)

				DispatchMissionTips(sceneId,selfId)

			--1.2有店铺根据不同情况不同处理
			else
				--1.2.1有两c醝店铺,等待进m祎 步选择
				if((strShop0Name ~= "") and (strShop1Name ~= "")) then
						BeginEvent(sceneId)

							AddText(sceneId,"H� h�, t� ra tr叻ng qu t緄 r癷, xin h鰅 c醕 h� mu痭 t緄 xem gian ti甿 n鄌?")

							AddNumText(sceneId,x000000_g_scriptId,"Ti甿 1  "..strShop0Name,-1,4)
							AddNumText(sceneId,x000000_g_scriptId,"Ti甿 2  "..strShop1Name,-1,5)

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
		end

		--6.
		if GetNumText() == 6 then
			CityApply(sceneId, selfId)
			--CityCreate(sceneId, selfId, 205)
			BeginUICommand(sceneId)
				UICommand_AddInt(sceneId,targetId) --调用Th鄋h ph� 入口组界面
			EndUICommand(sceneId)
			DispatchUICommand(sceneId,selfId, 101)

		--7.
		elseif GetNumText() == 7 then
			CityDelete(sceneId, selfId, 205, 0)

		--8.
		elseif GetNumText() == 8 then
			CityMoveTo(sceneId, selfId)
		end

end



--**********************************

--继续

--**********************************

function x000000_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )

	ApplyPlayerShop( sceneId, selfId, targetId )

end

