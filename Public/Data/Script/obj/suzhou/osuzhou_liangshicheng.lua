
-- 修改[褚少微 2008.5.29 添加,魔兵天将,极品装备放出.]

-- 001067 套装秏祎 籒PC

-- 梁师成

--脚本号
x001067_g_ScriptId = 001067

--所拥有to� 鸬 事件ID列表
x001067_g_eventList={889058, 889061}

--解决流失率秏祎 幻排商鬃笆录疟�
x001067_g_MenPaiTaoScriptId = 500617

x001067_g_EquipList={	
--       衣服－－－－－－－－腰带－－－－－－－－铠甲－－－－－
{n=1100,id=10413007},{n=1200,id=10421007},{n=1300,id=10412007},{n=1400,id=10411007},
{n=1100,id=10413001},{n=1200,id=10421001},{n=1300,id=10412001},{n=1400,id=10411001},

-- 30c别to� 鸬 
{n=2100,id=10413008},{n=2200,id=10421008},{n=2300,id=10412008},{n=2400,id=10411008},
{n=2100,id=10413002},{n=2200,id=10421002},{n=2300,id=10412002},{n=2400,id=10411002},

-- 40c别to� 鸬 
{n=3100,id=10413009},{n=3200,id=10421009},{n=3300,id=10412009},{n=3400,id=10411009},{n=3500,id=10414024},
{n=3100,id=10413003},{n=3200,id=10421003},{n=3300,id=10412003},{n=3400,id=10411003},{n=3500,id=10414020},

-- 50c别to� 鸬 
{n=4100,id=10413010},{n=4200,id=10421010},{n=4300,id=10412010},{n=4400,id=10411010},{n=4500,id=10414025},
{n=4100,id=10413004},{n=4200,id=10421004},{n=4300,id=10412004},{n=4400,id=10411004},{n=4500,id=10414021},

-- 60c别to� 鸬 
{n=5100,id=10413011},{n=5200,id=10421011},{n=5300,id=10412011},{n=5400,id=10411011},{n=5500,id=10414026},{n=5600,id=10415018},
{n=5100,id=10413005},{n=5200,id=10421005},{n=5300,id=10412005},{n=5400,id=10411005},{n=5500,id=10414022},{n=5600,id=10415016},

-- 70c别to� 鸬 
{n=6100,id=10413012},{n=6200,id=10421012},{n=6300,id=10412012},{n=6400,id=10411012},{n=6500,id=10414027},{n=6600,id=10415019},
{n=6100,id=10413006},{n=6200,id=10421006},{n=6300,id=10412006},{n=6400,id=10411006},{n=6500,id=10414023},{n=6600,id=10415017},
-- 80c别to� 鸬 
{n=7100,id=10413017},{n=7200,id=10421014},{n=7300,id=10412017},{n=7400,id=10411014},{n=7500,id=10414028},{n=7600,id=10415020},
{n=7100,id=10413018},{n=7200,id=10421015},{n=7300,id=10412018},{n=7400,id=10411015},{n=7500,id=10414029},{n=7600,id=10415021},
-- 90c别to� 鸬 
{n=8100,id=10413019},{n=8200,id=10421016},{n=8300,id=10412019},{n=8400,id=10411016},{n=8500,id=10414030},{n=8600,id=10415022},
{n=8100,id=10413020},{n=8200,id=10421017},{n=8300,id=10412020},{n=8400,id=10411017},{n=8500,id=10414031},{n=8600,id=10415023},

-- 褚少微,2008.5.29.极品装备放出.两c醝装备: 10422016--重楼戒	10423024--重楼玉
{n=9100,id=10422016},
{n=9100,id=10423024},
}

x001067_g_StoneList={
-- 1c石头
{n=1,id=20309010,num=6,str="V課 Linh Th誧h c 1"},
-- 2c石头
{n=2,id=20309011,num=8,str="V課 Linh Th誧h c 2"},
-- 3c石头
{n=3,id=20309012,num=10,str="V課 Linh Th誧h c 3"},
-- 4c石头
{n=4,id=20309013,num=12,str="V課 Linh Th誧h c 4"},
-- 5c石头
{n=5,id=20309014,num=14,str="V課 Linh Th誧h c 5"},
-- 6c石头
{n=6,id=20309015,num=16,str="V課 Linh Th誧h c 6"},
--80,90c 装备 C to� 鸬 石头
{n=7,id=20309016,num=32,str="V課 Linh Th誧h c 7"},
{n=8,id=20309017,num=48,str="V課 Linh Th誧h c 8"},	--由64改为48	--modify by xindefeng

-- 褚少微,2008.5.29.极品装备放出.两c醝秏祎 籆 to� 鸬 物品: 20310101--Tr鵱g l鈛 chi l�	20310102--Tr鵱g l鈛 chi mang
{n=9,id=20310101,num=1,str="Tr鵱g l鈛 chi l�"},
{n=10,id=20310102,num=1,str="Tr鵱g l鈛 chi mang"},

}

x001067_g_Stone2ID = 20309018 --新增二c万Linh石(绑定) 
--**********************************
--事件列表
--**********************************
function x001067_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  #{JPZB_0610_01}")
		for i, eventId in x001067_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
		
		AddNumText( sceneId, x001067_g_MenPaiTaoScriptId, "斜i l b� th秈 trang m鬾 ph醝", 6, 846 )
		
		AddNumText( sceneId, x001067_g_ScriptId, "斜i l b� trang b� c 18", 6, 1000 )
		AddNumText( sceneId, x001067_g_ScriptId, "斜i l b� trang b� c 30", 6, 2000 )
		AddNumText( sceneId, x001067_g_ScriptId, "斜i l b� trang b� c 40", 6, 3000 )
		AddNumText( sceneId, x001067_g_ScriptId, "斜i l b� trang b� c 50", 6, 4000 )
		AddNumText( sceneId, x001067_g_ScriptId, "斜i l b� trang b� c 60", 6, 5000 )
		AddNumText( sceneId, x001067_g_ScriptId, "斜i l b� trang b� c 70", 6, 6000 )
		AddNumText( sceneId, x001067_g_ScriptId, "斜i l b� trang b� c 80", 6, 7000 )
		AddNumText( sceneId, x001067_g_ScriptId, "斜i l b� trang b� c 90", 6, 8000 )

		AddNumText( sceneId, x001067_g_ScriptId, "#GGi緄 thi畊 鸨i tr鵱g l鈛", 11, 10000 )		
		-- 褚少微,2008.5.29.极品装备放出.
		AddNumText( sceneId, x001067_g_ScriptId, "斜i Tr鵱g L鈛", 6, 9000 )

		
		AddNumText( sceneId, x001067_g_ScriptId, "R秈 餴..", 0, 0 )

	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x001067_OnDefaultEvent( sceneId, selfId,targetId )
	x001067_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中m祎 项
--**********************************
function x001067_OnEventRequest( sceneId, selfId, targetId, eventId )
	local nNumText = GetNumText()
	
	for i, findId in x001067_g_eventList do
		if eventId == findId then			
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
	
	if eventId == x001067_g_MenPaiTaoScriptId then
		if nNumText == 846 then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		elseif nNumText == 2500 or nNumText == 2600 or nNumText == 2700 then
			CallScriptFunction( eventId, "OnEventRequest",sceneId, selfId, targetId )
			return
		end
	end
	
	if nNumText == 0  then
		-- 关闭窗口
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1000)
		return
	end
	
	if nNumText == 1000 or nNumText == 2000 or nNumText == 3000 or nNumText == 4000 or nNumText == 5000 or nNumText == 6000 or nNumText == 7000 or nNumText == 8000  then
		BeginEvent(sceneId)
			AddText(sceneId, "  #{JPZB_0610_02}")
			AddNumText(sceneId, x001067_g_ScriptId, "斜i l y ph鴆", 0, nNumText+100)
			AddNumText(sceneId, x001067_g_ScriptId, "斜i l y陁 疳i", 0, nNumText+200)
			AddNumText(sceneId, x001067_g_ScriptId, "斜i l h� th�", 0, nNumText+300)
			AddNumText(sceneId, x001067_g_ScriptId, "斜i l h鄆 t�", 0, nNumText+400)
			if nNumText > 2000  then
				AddNumText(sceneId, x001067_g_ScriptId, "斜i l h� uy琻", 0, nNumText+500)
				if nNumText > 4000  then
					AddNumText(sceneId, x001067_g_ScriptId, "斜i l s ki阯", 0, nNumText+600)
				end
			end
			AddNumText( sceneId, x001067_g_ScriptId, "R秈 餴..", 0, 0 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	if nNumText > 1000 and nNumText < 9000  then
		BeginEvent(sceneId)
			AddText(sceneId, "  #{JPZB_0610_03}")
			
			local nLevel = 0
			if nNumText > 1000 then
				nLevel = 1
			end
			if nNumText > 2000 then
				nLevel = 2
			end
			if nNumText > 3000 then
				nLevel = 3
			end
			if nNumText > 4000 then
				nLevel = 4
			end
			if nNumText > 5000 then
				nLevel = 5
			end
			if nNumText > 6000 then
				nLevel = 6
			end
			if nNumText > 7000 then
				nLevel = 7
			end
			if nNumText > 8000 then
				nLevel = 8
			end
			
			local szStr = "  Mu痭 nh 疬㧟 b� trang b� n鄖, ng呓i c ph鋓 疬a cho ta\"" .. x001067_g_StoneList[nLevel].str 
										.. "\" \"".. tostring(x001067_g_StoneList[nLevel].num) .. " C醝"
			AddText(sceneId, szStr)
			
			for i, item in x001067_g_EquipList do
				if item.n == nNumText  then
					AddRadioItemBonus( sceneId, item.id, 4 )
				end
			end
    EndEvent(sceneId)
    --DispatchMissionDemandInfo(sceneId,selfId,targetId, x001067_g_ScriptId, x210200_g_MissionId)
    DispatchMissionContinueInfo(sceneId,selfId,targetId, x001067_g_ScriptId, 0)
		
	end
		
	-- 褚少微,2008.5.29.极品装备放出.添加两c醝按钮to� 鸬 处理事件
	if nNumText == 9000 then
		BeginEvent(sceneId)	
				local szStr = "  #{JPZB_0610_06}"
				AddText(sceneId, szStr)
				for i, item in x001067_g_EquipList do
					if item.n == 9100  then
						AddRadioItemBonus( sceneId, item.id, 4 )
					end
				end
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		DispatchMissionContinueInfo(sceneId,selfId,targetId, x001067_g_ScriptId, 0)
	end
	-- 魔兵天降介绍
	if nNumText == 10000 then
		BeginEvent(sceneId)	
			AddText( sceneId, "#{JPZB_20080523_01}" )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end
	
end

--**********************************
--Ti猵 th薔PCto� 鸬 任务
--**********************************
function x001067_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001067_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			end
			return
		end
	end
	for i, findId in g_eventListTest do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			end
			return
		end
	end
end

--**********************************
--拒绝此NPCto� 鸬 任务
--**********************************
function x001067_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后,要Tr� v玁PCto� 鸬 事件列表
	for i, findId in x001067_g_eventList do
		if missionScriptId == findId then
			x001067_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
	for i, findId in g_eventListTest do
		if missionScriptId == findId then
			x001067_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续(已经接了任务)
--**********************************
function x001067_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001067_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
	for i, findId in g_eventListTest do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完to� 鸬 任务
--**********************************
function x001067_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )

	for i, findId in x001067_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
	
	--处理提交后to� 鸬 显示情况
	--为了安全,这里要仔细,不能出错
	local nItemIndex = -1
	
	if missionScriptId == x001067_g_MenPaiTaoScriptId then
		CallScriptFunction( missionScriptId, "OnMissionSubmit", sceneId, selfId, targetId, missionScriptId, selectRadioId )
		return 0
	end
	
	for i, item in x001067_g_EquipList do
		if item.id == selectRadioId  then
			nItemIndex = i
		end
	end
	
	if nItemIndex == -1  then
		return
	end
	
	-- 看完家喧ng不喧ng够材料提交
	local nLevel = 0
	if x001067_g_EquipList[nItemIndex].n > 1000 then
		nLevel = 1
	end
	if x001067_g_EquipList[nItemIndex].n > 2000 then
		nLevel = 2
	end
	if x001067_g_EquipList[nItemIndex].n > 3000 then
		nLevel = 3
	end
	if x001067_g_EquipList[nItemIndex].n > 4000 then
		nLevel = 4
	end
	if x001067_g_EquipList[nItemIndex].n > 5000 then
		nLevel = 5
	end
	if x001067_g_EquipList[nItemIndex].n > 6000 then
		nLevel = 6
	end
	if x001067_g_EquipList[nItemIndex].n > 7000 then
		nLevel = 7
	end
	if x001067_g_EquipList[nItemIndex].n > 8000 then
		nLevel = 8
	end
	
	-- 褚少微,2008.5.29.极品装备放出.
	if x001067_g_EquipList[nItemIndex].n == 9100 then
		if selectRadioId == 10422016 then
			nLevel = 9
		else 
			if selectRadioId == 10423024 then
				nLevel = 10
			end
		end
	end
	
	local bStoneOk = 0
	if GetItemCount(sceneId, selfId, x001067_g_StoneList[nLevel].id) >= x001067_g_StoneList[nLevel].num  then
		bStoneOk = 1
	end
	--新增二c万Linh石检测
  if nLevel == 2 then 
	  if GetItemCount(sceneId, selfId, x001067_g_StoneList[nLevel].id) + GetItemCount(sceneId, selfId, x001067_g_Stone2ID)>= x001067_g_StoneList[nLevel].num  then
			bStoneOk = 1
		end
  end
	
	if  bStoneOk == 0 then
		BeginEvent(sceneId)
			if nLevel == 9 then
				strText = "#{JPZB_0610_07}"
			elseif nLevel == 10 then 
					strText = "#{JPZB_0610_08}"
			else
				strText = "#{JPZB_0610_09}"
			end
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	-- 检查喧ng不喧ng有足够to� 鸬 石头可以扣除
	local StoneCount = LuaFnGetAvailableItemCount(sceneId, selfId, x001067_g_StoneList[nLevel].id)
	local Stone2Count = LuaFnGetAvailableItemCount(sceneId, selfId, x001067_g_Stone2ID)
	
	if (nLevel == 2 and StoneCount + Stone2Count < x001067_g_StoneList[nLevel].num) or 
	   (nLevel ~= 2 and StoneCount < x001067_g_StoneList[nLevel].num) then
	    
		BeginEvent(sceneId)
			-- 褚少微,2008.5.29.极品装备放出.
			if nLevel == 9 then
				strText = "#{JPZB_0610_07}"
			elseif nLevel == 10 then 
					strText = "#{JPZB_0610_08}"
			else
				strText = "#{JPZB_0610_10}"
			end
			
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
		
	end
	
	-- 检查背包空间
	BeginAddItem(sceneId)
		AddItem(sceneId, selectRadioId, 1)
	local bBagOk = EndAddItem(sceneId, selfId)
	
	if bBagOk < 1 then
		BeginEvent(sceneId)
			strText = "#{JPZB_0610_11}"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	
	local nItemBagIndexStone = 0  
 
   --增加二c绑定万Linh石判断
	if  nLevel == 2 then
     nItemBagIndexStone = GetBagPosByItemSn(sceneId, selfId, x001067_g_Stone2ID)
     if nItemBagIndexStone == -1 then --没有二c绑定万Linh石
     	 nItemBagIndexStone = GetBagPosByItemSn(sceneId, selfId, x001067_g_StoneList[nLevel].id)
     end
  else 
  	 nItemBagIndexStone = GetBagPosByItemSn(sceneId, selfId, x001067_g_StoneList[nLevel].id)
  end
  
  local szTransferStone = ""
  if nItemBagIndexStone ~= -1 then
	   szTransferStone = GetBagItemTransfer(sceneId,selfId, nItemBagIndexStone)
  end
	
	local bDelOk = 0
	-- 删除相关to� 鸬 石头
	if nLevel == 2 and Stone2Count > 0 then --优先扣除绑定to� 鸬 万Linh石
		if Stone2Count >= x001067_g_StoneList[nLevel].num then
			bDelOk = LuaFnDelAvailableItem(sceneId,selfId, x001067_g_Stone2ID, x001067_g_StoneList[nLevel].num)
		else 
		  bDelOk = LuaFnDelAvailableItem(sceneId,selfId, x001067_g_Stone2ID,Stone2Count) and 
		           LuaFnDelAvailableItem(sceneId,selfId, x001067_g_StoneList[nLevel].id, x001067_g_StoneList[nLevel].num - Stone2Count)
	  end
	else 
		bDelOk = LuaFnDelAvailableItem(sceneId,selfId, x001067_g_StoneList[nLevel].id, x001067_g_StoneList[nLevel].num)
  end
	
	if bDelOk < 1  then
		BeginEvent(sceneId)
			strText = "#{JPZB_0610_12}"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	else
		--给完家东西,完成
		-- AddItemListToHuman(sceneId,selfId)
		--
		local nBagIndex = TryRecieveItem( sceneId, selfId, x001067_g_EquipList[nItemIndex].id, 1 );
		
		-- 褚少微,2008.5.29.极品装备放出.这两c醝极品装备无法打孔,强制刻铭
		-- LuaFnEquipLock( sceneId, selfId, nBagIndex )
		
		BeginEvent(sceneId)
			strText = "#{JPZB_0610_13}"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		
		local message;	
		local randMessage = random(3);
		local sItemName = GetItemName(sceneId, x001067_g_EquipList[nItemIndex].id)
		
		local szTransferEquip = GetBagItemTransfer(sceneId,selfId, nBagIndex)
		
		if randMessage == 1 then
		   	message = format("#W#{_INFOUSR%s}#W#{WLS_08}#Y%d#W#{WLS_09}#{_INFOMSG%s}#{WLS_10}#{_INFOMSG%s}#{WLS_11}", LuaFnGetName(sceneId, selfId), x001067_g_StoneList[nLevel].num, szTransferStone, szTransferEquip);
		elseif randMessage == 2 then
			message = format("#W#{_INFOUSR%s}#W#{WLS_03}#Y%d#W#{WLS_04}#{_INFOMSG%s}#{WLS_05}#{_INFOMSG%s}#{WLS_06}#{_INFOMSG%s}#{WLS_07}", LuaFnGetName(sceneId, selfId), x001067_g_StoneList[nLevel].num, szTransferStone, szTransferStone, szTransferEquip);
		else
			message = format("#W#{WLS_00}#Y%d# qu�#W#{_INFOMSG%s}#I khen rg: \#W#{_INFOUSR%s}#{WLS_01}#{_INFOMSG%s}#{WLS_02}", x001067_g_StoneList[nLevel].num, szTransferStone, LuaFnGetName(sceneId, selfId), szTransferEquip);
		end
		
		-- 褚少微,2008.5.29.极品装备放出.
		if nLevel == 9 then
			message = format("#I#{_INFOUSR%s}#{JPZB_0610_14}#Y#{_INFOMSG%s}#{JPZB_0610_15}", GetName(sceneId, selfId), szTransferEquip);
		end
		if nLevel == 10 then
			message = format("#I#{_INFOUSR%s}#{JPZB_0610_14}#Y#{_INFOMSG%s}#{JPZB_0610_15}", GetName(sceneId, selfId), szTransferEquip);
		end
		
		BroadMsgByChatPipe(sceneId, selfId, message, 4);
		
		--秏祎 怀晒�,播放特效
		LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,18,0)
		
		return
	end

	for i, findId in g_eventListTest do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x001067_OnDie( sceneId, selfId, killerId )
end
