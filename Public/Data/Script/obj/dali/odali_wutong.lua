--洛阳NPC
--燕青
--普通

--脚本号
x892001_g_ScriptId = 892001

--所拥有的事件ID列表
x892001_g_eventList={}


x892001_g_DarkSkillName = { [40] = {name = "N閙 羗 kh�", id = 274, needmoney = 20000},
                            [70] = {name = "羗 kh� 痄 huy畉", id = 275, needmoney = 100000},
                            [90] = {name = "羗 kh� h� th�", id = 276, needmoney = 500000},
                          }                
x892001_g_DarkSkillTips = { [40] = "#{FBSJ_090106_89}",
                            [70] = "#{FBSJ_090106_90}",
                            [90] = "#{FBSJ_090106_91}",
                          }  
x892001_g_DarkBreachPointNeedMoney = 
{
	[39] = 40000,
	[49] = 50000,
	[59] = 60000,
	[69] = 70000,
	[79] = 80000,
	[89] = 90000,
	[99] = 100000,
	[109] = 110000,
	[119] = 120000,
	[129] = 130000,
}  --突破瓶颈需要金钱

x892001_g_strGongGaoInfo = {
  "#{_INFOUSR%s}#HTr鋓 qua m祎 phen c� gg, r痶 c鴆 ho鄋 th鄋h thu th h䅟 th鄋h V� H皀. #YV� 邪ng #W疬a tg m祎 c醝 #{_INFOMSG%s} c 1!", 
  "#{_INFOUSR%s} #cff99ccV� #YV� 邪ng #cff99ccl鄊 cho 皤u #YLinh H皀 trang b� tinh hoa#cff99cc, linh h皀 trang b� s� gi� d鈔g l阯 #{_INFOMSG%s} l鄊 c鋗 t�!", 
  "#{_INFOUSR%s}#H� #YV� 邪ng ti猲 h鄋h #RV� H皀 #Ith錸g c, m祎 疬秐g qu� quan tr鋗 t呔ng, kh鬾g h� l� c鬾g phu kh鬾g ph� l騨g ng叨i, 穑c tg c鵱g #{_INFOMSG%s}!",
  "#{_INFOUSR%s}#HKh鬾g ng譶g c� gg thu th #RV� H皀 trang b� th錸g c #Iv ph, 鹫t 疬㧟 #W#{_INFOMSG%s}#H, th s� l� l鄊 ng叨i ta h鈓 m�!", 
}

--**********************************
--事件列表
--**********************************
function x892001_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"#{WH_NPC_17}")
		for i, eventId in x892001_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
		
		AddNumText(sceneId,x892001_g_ScriptId,"H䅟 th鄋h H皀 B錸g Ch鈛",6,7)
		AddNumText(sceneId,x892001_g_ScriptId,"C tinh V� H皀",6,8)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x892001_OnDefaultEvent( sceneId, selfId,targetId )
	x892001_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x892001_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x892001_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
	
	local NumText = GetNumText();
	if NumText == 6 then  --取消了
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1000)
	elseif NumText == 7 then  --提升武魂等级
		BeginEvent(sceneId)
			AddText(sceneId,"C� 5 H皀 B錸g Ch鈛 c鵱g 鹌ng c c� th� h䅟 th鄋h m祎 c醝 H皀 B錸g Ch鈛 c cao h絥.#r H皀 B錸g Ch鈛 c� th� t靘 s� ph� Ti陁 Dao T� cho ng呓i ti猲 h鄋h th錸g c V� H皀 c tinh.")

			AddNumText(sceneId,x892001_g_ScriptId,"H䅟 th鄋h H皀 B錸g Ch鈛 c 2",6,12)
			AddNumText(sceneId,x892001_g_ScriptId,"H䅟 th鄋h H皀 B錸g Ch鈛 c 3",6,13)
			AddNumText(sceneId,x892001_g_ScriptId,"H䅟 th鄋h H皀 B錸g Ch鈛 c 4",6,14)
			AddNumText(sceneId,x892001_g_ScriptId,"H䅟 th鄋h H皀 B錸g Ch鈛 c 5",6,15)
			AddNumText(sceneId,x892001_g_ScriptId,"#{FBSJ_081209_12}",8,130)
	
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		
	elseif NumText == 8 then  --领悟技能
		BeginEvent(sceneId)
			AddText(sceneId,"S� d鴑g #GV� H皀 D竎h T呓ng 衋n #Wc� th� c tinh V� H皀. C tinh v� h皀 c� 疬㧟 kh� n錸g m� r祅g thu礳 t韓h, c� th� h鱟 t k� n錸g v� h皀, c� th� t錸g l阯 v� h皀 c b. C� th� gi緄 thi畊 ng呓i c� th� t靘 s� ph� Ti陁 Dao T�.#r #GV� h皀 c tinh xong kh鬾g th� 鸨i 鸨i c tinh.#r#c00ffff(Thao t醕 n鄖 c th醥 g� b鋙 th誧h ra, n猽 kh鬾g b鋙 th誧h s� bi猲 m)")
			AddNumText(sceneId,x892001_g_ScriptId,"C tinh h� #GB錸g",6,16)
			AddNumText(sceneId,x892001_g_ScriptId,"C tinh h� #cFF0000H鯽",6,17)
			AddNumText(sceneId,x892001_g_ScriptId,"C tinh h� #YHuy玭",6,18)
			AddNumText(sceneId,x892001_g_ScriptId,"C tinh h� #ccc33cc械c",6,19)
			AddNumText(sceneId,x892001_g_ScriptId,"#{FBSJ_081209_12}",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 9 then   --武魂扩展属性
		BeginEvent(sceneId)
			AddText(sceneId,"#{FBSJ_081209_31}")
			AddNumText(sceneId,x892001_g_ScriptId,"M� r祅g thu礳 t韓h V� H皀 (C 0)",6,19)
			AddNumText(sceneId,x892001_g_ScriptId,"M� r祅g thu礳 t韓h V� H皀 (C 1)",6,20)
			AddNumText(sceneId,x892001_g_ScriptId,"M� r祅g thu礳 t韓h V� H皀 (C 2)",6,21)
			AddNumText(sceneId,x892001_g_ScriptId,"M� r祅g thu礳 t韓h V� H皀 (C 3)",6,22)
			AddNumText(sceneId,x892001_g_ScriptId,"#{FBSJ_081209_12}",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 10 then  --重洗暗器技能
		BeginUICommand(sceneId)
		UICommand_AddInt( sceneId, 6 )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 800034)

	elseif NumText == 11 then  --重置暗器
		BeginEvent(sceneId)
			AddText(sceneId,"#{FBSJ_081209_84}")
			AddNumText(sceneId,x892001_g_ScriptId,"#{FBSJ_090311_03}",6,26)
			AddNumText(sceneId,x892001_g_ScriptId,"#{FBSJ_090311_04}",6,27)
			AddNumText(sceneId,x892001_g_ScriptId,"#{FBSJ_081209_12}",8,13)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 12 then                   --提升 冰 等级
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910012)
              if c0 >=5 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,39910012,5)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 39910013, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x892001_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, h皀 b錸g ch鈛 h䅟 th鄋h th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
				x892001_ShowNotice(sceneId, selfId, targetId, strText);
             else
		     strNotice = "#GThi猽 Nguy阯 li畊"
		     x892001_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 13 then                   --提升 火 等级
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910013)
              if c0 >=5 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,39910013,5)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 39910014, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x892001_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, h皀 b錸g ch鈛 h䅟 th鄋h th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
				x892001_ShowNotice(sceneId, selfId, targetId, strText);
             else
		     strNotice = "#GThi猽 Nguy阯 li畊"
		     x892001_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end
		
	elseif NumText == 130 then
		x892001_OnDefaultEvent( sceneId, selfId,targetId )
	elseif NumText == 14 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910014)
              if c0 >=5 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,39910014,5)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 39910015, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x892001_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, h皀 b錸g ch鈛 h䅟 th鄋h th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
				x892001_ShowNotice(sceneId, selfId, targetId, strText);
             else
		     strNotice = "#GThi猽 Nguy阯 li畊"
		     x892001_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 15 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910015)
              if c0 >=5 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,39910015,5)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 39910016, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x892001_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, h皀 b錸g ch鈛 h䅟 th鄋h th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
				x892001_ShowNotice(sceneId, selfId, targetId, strText);
             else
		     strNotice = "#GThi猽 Nguy阯 li畊"
		     x892001_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 16 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10156101)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910011)
              if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10156101,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,39910011,1)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10156102, 1)--给予物品
				    local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x892001_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
		            LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, v� h皀 th錸g c th鄋h c鬾g!"
					AddText( sceneId, strText )
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
				x892001_ShowNotice(sceneId, selfId, targetId, strText);
             else
		     strNotice = "#GThi猽 Nguy阯 li畊"
		     x892001_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 17 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10156101)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910011)
              if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10156101,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,39910011,1)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10156103, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x892001_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, v� h皀 th錸g c th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊"
		     x892001_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 18 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10156101)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910011)
              if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10156101,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,39910011,1)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10156104, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x892001_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, v� h皀 th錸g c th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊"
		     x892001_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 19 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10156101)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910011)
              if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10156101,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,39910011,1)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10156105, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x892001_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, v� h皀 th錸g c th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊"
		     x892001_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 20 then
		BeginEvent(sceneId)

			AddText(sceneId,"M秈 l馻 ch鱪 thu礳 t韓h m� r祅g, s� 鸠i 裯g gi痭g nhau V� H皀 thu礳 t韓h!")
			AddNumText(sceneId,x892001_g_ScriptId,"M� r祅g thu礳 t韓h V� h皀 c 1 (B錸g c tinh)",6,51)
			AddNumText(sceneId,x892001_g_ScriptId,"M� r祅g thu礳 t韓h V� h皀 c 1 (H鯽 c tinh)",6,52)
			AddNumText(sceneId,x892001_g_ScriptId,"M� r祅g thu礳 t韓h V� h皀 c 1 (Huy玭 c tinh)",6,53)
			AddNumText(sceneId,x892001_g_ScriptId,"M� r祅g thu礳 t韓h V� h皀 c 1 (械c c tinh)",6,54)
			AddNumText(sceneId,x892001_g_ScriptId,"#{FBSJ_081209_12}",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 21 then
		BeginEvent(sceneId)

			AddText(sceneId,"M秈 l馻 ch鱪 thu礳 t韓h m� r祅g, s� 鸠i 裯g gi痭g nhau V� H皀 thu礳 t韓h!")
			AddNumText(sceneId,x892001_g_ScriptId,"M� r祅g thu礳 t韓h V� h皀 c 2 (B錸g c tinh)",6,55)
			AddNumText(sceneId,x892001_g_ScriptId,"M� r祅g thu礳 t韓h V� h皀 c 2 (H鯽 c tinh)",6,56)
			AddNumText(sceneId,x892001_g_ScriptId,"M� r祅g thu礳 t韓h V� h皀 c 2 (Huy玭 c tinh)",6,57)
			AddNumText(sceneId,x892001_g_ScriptId,"M� r祅g thu礳 t韓h V� h皀 c 2 (械c c tinh)",6,58)
			AddNumText(sceneId,x892001_g_ScriptId,"#{FBSJ_081209_12}",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 22 then
		BeginEvent(sceneId)

			AddText(sceneId,"M秈 l馻 ch鱪 thu礳 t韓h m� r祅g, s� 鸠i 裯g gi痭g nhau V� H皀 thu礳 t韓h!")
			AddNumText(sceneId,x892001_g_ScriptId,"M� r祅g thu礳 t韓h V� h皀 c 3 (B錸g c tinh)",6,59)
			AddNumText(sceneId,x892001_g_ScriptId,"M� r祅g thu礳 t韓h V� h皀 c 3 (H鯽 c tinh)",6,60)
			AddNumText(sceneId,x892001_g_ScriptId,"M� r祅g thu礳 t韓h V� h皀 c 3 (Huy玭 c tinh)",6,61)
			AddNumText(sceneId,x892001_g_ScriptId,"M� r祅g thu礳 t韓h V� h皀 c 3 (械c c tinh)",6,62)
			AddNumText(sceneId,x892001_g_ScriptId,"#{FBSJ_081209_12}",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 23 then
		BeginUICommand(sceneId)
		UICommand_AddInt( sceneId, 3 )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 800034)
	elseif NumText == 24 then
		BeginUICommand(sceneId)
		UICommand_AddInt( sceneId, 4 )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 800034)
	elseif NumText == 25 then
		BeginUICommand(sceneId)
		UICommand_AddInt( sceneId, 5 )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 800034)
	elseif NumText == 26 then
	 	BeginUICommand(sceneId)
		UICommand_AddInt( sceneId, 7 )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 800034)
	elseif NumText == 27 then
		BeginUICommand(sceneId)
		UICommand_AddInt( sceneId, 8 )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 800034)
	elseif NumText == 28 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{FBSJ_081209_69}")
			AddNumText(sceneId,x892001_g_ScriptId,"#{FBSJ_090304_02}",11,29)
			AddNumText(sceneId,x892001_g_ScriptId,"#{FBSJ_090304_01}",11,30)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif NumText == 29 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{FBSJ_090304_03}")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif NumText == 30 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{FBSJ_090304_04}")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif NumText == 31 then
		BeginUICommand(sceneId)
		UICommand_AddInt( sceneId, 9 )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 800034)
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x892001_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x892001_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId, targetId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId, targetId, missionScriptId )
			end
			return
		end
	end
end

--**********************************
--拒绝此NPC的任务
--**********************************
function x892001_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x892001_g_eventList do
		if missionScriptId == findId then
			x892001_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x892001_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x892001_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x892001_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x892001_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x892001_OnDie( sceneId, selfId, killerId )
end




--**********************************
--判断是否能够学习
--nSkillIndex参数可能值为：40，70，90，分别学习对应级别的技能
--**********************************
function x892001_CheckStudyDarkSkills( sceneId, selfId, targetId, nSkillIndex )
	
	if (nSkillIndex ~= 40 and nSkillIndex ~= 70 and nSkillIndex ~= 90) then
		return 0;
	end
	
	--判断玩家等级是否够了
	local strNotice = "";
	local nLevel = GetLevel(sceneId, selfId);
	if ( nLevel < nSkillIndex) then
		if (nSkillIndex == 40) then
			strNotice = "#{FBSJ_081209_24}";
		elseif (nSkillIndex == 70) then
			strNotice = "#{FBSJ_081209_27}";
		elseif (nSkillIndex == 90) then
			strNotice = "#{FBSJ_081209_29}";
		end
		x892001_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	--判断是否已经学会了对应技能
	if  (HaveSkill(sceneId, selfId, x892001_g_DarkSkillName[nSkillIndex].id) > 0 ) then
		if (nSkillIndex == 40) then
			strNotice = "#{FBSJ_081209_26}";
		elseif (nSkillIndex == 70) then
			strNotice = "#{FBSJ_081209_28}";
		elseif (nSkillIndex == 90) then
			strNotice = "#{FBSJ_081209_30}";
		end
		x892001_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	--判断玩家身上是否有足够的钱
	local nHaveMoney = GetMoney(sceneId, selfId) + GetMoneyJZ(sceneId, selfId);
	if (nHaveMoney < x892001_g_DarkSkillName[nSkillIndex].needmoney) then    --10金
		strNotice = "#{FBSJ_081209_25}";
		x892001_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	return 1;
	
end

--**********************************
--玩家找NPC学习暗器使用技能
--nSkillIndex参数可能值为：40，70，90，分别学习对应级别的技能
--**********************************
function x892001_StudyDarkSkills( sceneId, selfId, targetId, nSkillIndex )
	
	if (nSkillIndex ~= 40 and nSkillIndex ~= 70 and nSkillIndex ~= 90) then
		return
	end
	
	--判断玩家等级是否够了
	local strNotice = "";
	local nLevel = GetLevel(sceneId, selfId);
	if ( nLevel < nSkillIndex) then
		if (nSkillIndex == 40) then
			strNotice = "#{FBSJ_081209_24}";
		elseif (nSkillIndex == 70) then
			strNotice = "#{FBSJ_081209_27}";
		elseif (nSkillIndex == 90) then
			strNotice = "#{FBSJ_081209_29}";
		end
		x892001_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	--判断是否已经学会了对应技能
	if  (HaveSkill(sceneId, selfId, x892001_g_DarkSkillName[nSkillIndex].id) > 0 ) then
		if (nSkillIndex == 40) then
			strNotice = "#{FBSJ_081209_26}";
		elseif (nSkillIndex == 70) then
			strNotice = "#{FBSJ_081209_28}";
		elseif (nSkillIndex == 90) then
			strNotice = "#{FBSJ_081209_30}";
		end
		x892001_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	--判断玩家身上是否有足够的钱
	local nHaveMoney = GetMoney(sceneId, selfId) + GetMoneyJZ(sceneId, selfId);
	if (nHaveMoney < x892001_g_DarkSkillName[nSkillIndex].needmoney) then    --10金
		strNotice = "#{FBSJ_081209_25}";
		x892001_ShowNotice(sceneId, selfId, targetId, strNotice);
		return
	end
	
	--上面判断都通过，可以扣钱给技能了
	local nRet, nRetJB = LuaFnCostMoneyWithPriority(sceneId, selfId, x892001_g_DarkSkillName[nSkillIndex].needmoney);
	if (nRet == -1) then
		strNotice = "#{FBSJ_081209_25}";
		x892001_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	AddSkill(  sceneId, selfId, x892001_g_DarkSkillName[nSkillIndex].id)
	x892001_ShowNotice(sceneId, selfId, targetId, x892001_g_DarkSkillTips[nSkillIndex]);
	x892001_NotifyTips( sceneId, selfId, x892001_g_DarkSkillTips[nSkillIndex] )
	
	x892001_StudySkillImpact(sceneId, selfId)
	DarkOperateResult(sceneId, selfId, 5, 1);    --让技能按钮闪烁
	
end


--**********************************
-- 屏幕中间信息提示
--**********************************
function x892001_NotifyTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end


--**********************************
--玩家是否满足暗器瓶颈条件
--返回值：0或者1，1为满足，0
--**********************************
function x892001_CheckDarkReachPoint(sceneId, selfId, targetId)
		
		local strInfo = "";
		--判断玩家身上是否装备有暗器
		local bHaveDarkEquip = HaveDarkEquiped(sceneId, selfId);
		if ( bHaveDarkEquip ~= 1) then
			strInfo = "#{FBSJ_081209_13}";
			x892001_ShowNotice(sceneId, selfId, targetId, strInfo);
			return 0;
		end
		
		--判断玩家身上暗器是否达到瓶颈
		local bNeedNPC = IsDarkNeedLevelUpByNpcNow(sceneId, selfId);
		if (bNeedNPC ~= 1) then
			strInfo = "#{FBSJ_081209_14}";
			x892001_ShowNotice(sceneId, selfId, targetId, strInfo);
			return 0;
		end
		
		--判断玩家等级是否和暗器等级相等或者没有暗器等级高
		local nDarkLevel = GetDarkLevel(sceneId, selfId);
		local nCharLevel = GetLevel(sceneId, selfId);
		if (nDarkLevel >= nCharLevel) then
			strInfo = "#{FBSJ_081209_15}";
			x892001_ShowNotice(sceneId, selfId, targetId, strInfo);
			return 0;
		end
		
		--判断玩家身上是否有足够的钱
		local nDarkLevel = GetDarkLevel(sceneId, selfId);
		local nNeedMoney = x892001_g_DarkBreachPointNeedMoney[nDarkLevel];
		if (nNeedMoney == nil or nNeedMoney <= 0) then
			nNeedMoney = 100000;         --以防万一，并没什么用
		end
		local nHaveMoney = GetMoney(sceneId, selfId) + GetMoneyJZ(sceneId, selfId);
		if (nHaveMoney < nNeedMoney) then    --10金
			strNotice = "#{FBSJ_081209_25}";
			x892001_ShowNotice(sceneId, selfId, targetId, strNotice);
			return 0;
		end
				
		return 1;
end


function x892001_BreachDarkPoint(sceneId, selfId, targetId)

	local strInfo = "";
	--判断玩家身上是否装备有暗器
	local bHaveDarkEquip = HaveDarkEquiped(sceneId, selfId);
	if ( bHaveDarkEquip ~= 1) then
		strInfo = "#{FBSJ_081209_13}";
		x892001_ShowNotice(sceneId, selfId, targetId, strInfo);
		return 0;
	end
		
	--判断玩家身上暗器是否达到瓶颈
	local bNeedNPC = IsDarkNeedLevelUpByNpcNow(sceneId, selfId);
	if (bNeedNPC ~= 1) then
		strInfo = "#{FBSJ_081209_14}";
		x892001_ShowNotice(sceneId, selfId, targetId, strInfo);
		return 0;
	end
		
	--判断玩家等级是否和暗器等级相等或者没有暗器等级高
	local nDarkLevel = GetDarkLevel(sceneId, selfId);
	local nCharLevel = GetLevel(sceneId, selfId);
	if (nDarkLevel >= nCharLevel) then
		strInfo = "#{FBSJ_081209_15}";
		x892001_ShowNotice(sceneId, selfId, targetId, strInfo);
		return 0;
	end
		
			--判断玩家身上是否有足够的钱
	local nDarkLevel = GetDarkLevel(sceneId, selfId);
	local nNeedMoney = x892001_g_DarkBreachPointNeedMoney[nDarkLevel];
	if (nNeedMoney == nil or nNeedMoney <= 0) then
		nNeedMoney = 100000;         --以防万一，并没什么用
	end
	local nHaveMoney = GetMoney(sceneId, selfId) + GetMoneyJZ(sceneId, selfId);
	if (nHaveMoney < nNeedMoney) then    --10金
		strNotice = "#{FBSJ_081209_25}";
		x892001_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	--上面判断都通过，可以扣钱突破了
	local nRet, nRetJB = LuaFnCostMoneyWithPriority(sceneId, selfId, nNeedMoney);
	if (nRet == -1) then
		strNotice = "#{FBSJ_081209_25}";
		x892001_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	--突破瓶颈，让暗器升级
	local bDarkLevelup = DarkLevelUp(sceneId, selfId);
	if (bDarkLevelup == 1) then
		x892001_ShowNotice(sceneId, selfId, targetId, "#{FBSJ_081209_18}");
		--突破成功，记录统计日志
			local guid = LuaFnObjId2Guid(sceneId, selfId);
			local sLog = format("dark level now: %d", nDarkLevel + 1); 
			ScriptGlobal_AuditGeneralLog(LUAAUDIT_ANQITUPO, guid, sLog);
	else
		x892001_ShowNotice(sceneId, selfId, targetId, "械t ph� th b読");
	end
	
	return
end

function x892001_ShowNotice( sceneId, selfId, targetId, strNotice)
	BeginEvent( sceneId )
		AddText( sceneId, strNotice )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

function x892001_StudySkillImpact(sceneId, playerId)
	--显示学习到新技能的特效 目前使用升级特效
	LuaFnSendSpecificImpactToUnit(sceneId, playerId, playerId, playerId, 32407, 0 )
end

function x892001_ShowRandomSystemNotice( sceneId, selfId, strItemInfo )
	
	local PlayerName = GetName(sceneId,selfId)
	local nMsgIndex = random( 1, 4 )
	local str
	if nMsgIndex == 1 then
		str = format( x210531_g_strGongGaoInfo[1], PlayerName, strItemInfo )
	elseif nMsgIndex == 2 then
		str = format( x210531_g_strGongGaoInfo[2], PlayerName, strItemInfo )
	elseif nMsgIndex == 3 then
		str = format( x210531_g_strGongGaoInfo[3], PlayerName, strItemInfo )
	else
		str = format( x210531_g_strGongGaoInfo[4], PlayerName, strItemInfo )
	end
	BroadMsgByChatPipe( sceneId, selfId, str, 4 )
	
end
