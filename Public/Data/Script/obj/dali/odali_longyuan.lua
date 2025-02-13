--洛阳NPC
--燕青
--普通

--脚本号
x892004_g_ScriptId = 892004

--所拥有的事件ID列表
x892004_g_eventList={}

x892004_g_DarkSkillName = { [40] = {name = "N閙 羗 kh�", id = 274, needmoney = 20000},
                            [70] = {name = "羗 kh� 痄 huy畉", id = 275, needmoney = 100000},
                            [90] = {name = "羗 kh� h� th�", id = 276, needmoney = 500000},
                          }                
x892004_g_DarkSkillTips = { [40] = "#{FBSJ_090106_89}",
                            [70] = "#{FBSJ_090106_90}",
                            [90] = "#{FBSJ_090106_91}",
                          }  
x892004_g_DarkBreachPointNeedMoney = 
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

--**********************************
--事件列表
--**********************************
function x892004_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  Ch鷑g ta Long Th� tam huynh 甬 餰m su痶 鸲i tinh l馽 皤u 穑t � Long V錸 nghi阯 c製......#rMu痭 bi猼? B� m...... B� m......")
		for i, eventId in x892004_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
		
		AddNumText(sceneId,x892004_g_ScriptId,"H䅟 th鄋h C鈛 Thi阯 Th醝",6,7)
		AddNumText(sceneId,x892004_g_ScriptId,"#gFF0FA0Long v錸 m� r祅g thu礳 t韓h h鱟 t",6,8)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x892004_OnDefaultEvent( sceneId, selfId,targetId )
	x892004_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x892004_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x892004_g_eventList do
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
	elseif NumText == 7 then  --提升Long V錸 c 等级
		BeginEvent(sceneId)
			AddText(sceneId,"M瞚 2 c醝 鹌ng c t呓ng 疬絥g C鈛 Thi阯 Th醝 c� th� h䅟 th鄋h m祎 c醝 cao c C鈛 Thi阯 Th醝.#r C鈛 Thi阯 Th醝 c� th� t靘 ta huynh 甬 cho ng呓i Long V錸 ti猲 h鄋h th錸g c.")

			AddNumText(sceneId,x892004_g_ScriptId,"H䅟 th鄋h trung c C鈛 Thi阯 Th醝",6,12)
			AddNumText(sceneId,x892004_g_ScriptId,"H䅟 th鄋h cao c C鈛 Thi阯 Th醝",6,13)
			AddNumText(sceneId,x892004_g_ScriptId,"Quay l読",8,130)
	
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		
	elseif NumText == 8 then  --领悟技能
		BeginEvent(sceneId)
			AddText(sceneId,"S� d鴑g #GCh� Long Th誧h #Wc� th� l鄊 Long V錸 h鱟 t m祎 lo読 c tinh. C tinh Long V錸 c� 疬㧟 kh� m� r祅g thu礳 t韓h, c� th� t錸g l阯 Long V錸 c b. C� th� gi緄 thi畊 ng呓i c� th� t靘 ta. #GLong V錸 h鱟 t m祎 lo読 c tinh th� kh鬾g th� 鸨i 鸨i c tinh.#r#c00ffff(Thao t醕 n鄖 c 餰m Long V錸 疸 疬㧟 kh鋗 b鋙 th誧h th醥 xu痭g, n猽 kh鬾g b鋙 th誧h s� bi猲 m)")
			AddText(sceneId,"#cfff263M� r祅g thu礳 t韓h M醬 gi緄 h課 tr阯 c: #cFF0000Ch� Long Th誧h - Nguy阯")
			AddText(sceneId,"#cfff263M� r祅g thu礳 t韓h Gi鋗 Kh醤g c: #cFF0000Chu� Long Th誧h - B誳")
			AddText(sceneId,"#cfff263M� r祅g thu礳 t韓h C鬾g k韈h c: #cFF0000Ch� Long Th誧h - Th呓ng")
			AddText(sceneId,"Long v錸 m� r祅g thu礳 t韓h h鱟 t #Yph鋓 theo th� t� ti猲 h鄋h#W, 馥u ti阯 h鱟 t M醬 th唼ng h課, sau 痼 h鱟 t gi鋗 kh醤g, cu痠 c鵱g h鱟 t thu礳 t韓h c鬾g k韈h.")

			AddNumText(sceneId,x892004_g_ScriptId,"M� r祅g thu礳 t韓h M醬 gi緄 h課 tr阯",6,16)
			AddNumText(sceneId,x892004_g_ScriptId,"M� r祅g thu礳 t韓h Gi鋗 Kh醤g",6,17)
			AddNumText(sceneId,x892004_g_ScriptId,"M� r祅g thu礳 t韓h C鬾g k韈h",6,18)
			--AddNumText(sceneId,x892004_g_ScriptId,"H鱟 t #ccc33cc 鸬c c tinh",6,19)
			AddNumText(sceneId,x892004_g_ScriptId,"Quay l読",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 9 then   --Long V錸 c 扩展属性
		BeginEvent(sceneId)
			AddText(sceneId,"#{FBSJ_081209_31}")
			AddNumText(sceneId,x892004_g_ScriptId,"M� r祅g thu礳 t韓h Long V錸 (C 0)",6,19)
			AddNumText(sceneId,x892004_g_ScriptId,"M� r祅g thu礳 t韓h Long V錸 (C 1)",6,20)
			AddNumText(sceneId,x892004_g_ScriptId,"M� r祅g thu礳 t韓h Long V錸 (C 2)",6,21)
			AddNumText(sceneId,x892004_g_ScriptId,"M� r祅g thu礳 t韓h Long V錸 (C 3)",6,22)
			AddNumText(sceneId,x892004_g_ScriptId,"Quay l読",8,130)
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
			AddNumText(sceneId,x892004_g_ScriptId,"#{FBSJ_090311_03}",6,26)
			AddNumText(sceneId,x892004_g_ScriptId,"#{FBSJ_090311_04}",6,27)
			AddNumText(sceneId,x892004_g_ScriptId,"Quay l読",8,13)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 12 then                   --提升 冰 等级
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310177)
              if c0 >=5 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,20310177,5)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 20310178, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, trung c C鈛 Thi阯 Th醝 h䅟 th鄋h th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊!"
		     x892004_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 13 then                   --提升 火 等级
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310178)
              if c0 >=5 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,20310178,5)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 20310179, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, cao c C鈛 Thi阯 Th醝 h䅟 th鄋h th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊"
		     x892004_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end
		
	elseif NumText == 130 then
		x892004_OnDefaultEvent( sceneId, selfId,targetId )
	elseif NumText == 14 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910014)
              if c0 >=5 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,39910014,5)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 39910015, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, C鈛 Thi阯 Th醝 h䅟 th鄋h th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊!"
		     x892004_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 15 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910015)
              if c0 >=5 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,39910015,5)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 39910016, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, C鈛 Thi阯 Th醝 h䅟 th鄋h th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊!"
		     x892004_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 16 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157001)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310181)
              if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157001,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310181,1)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157002, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#H#W#{_INFOMSG%s}#H h鱟 xong m祎 lo読 thu礳 t韓h k� n錸g#H! Th唼ng c� th kh� l鈓 h鄋g thi阯 th醝 c� c鋘h, xem ra nh鈔 gian v譨 mu痭 ngh阯h 痼n m祎 h癷 huy猼 v� tinh phong!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#YCh鷆 m譶g ng呓i, long v錸 huy猼 th唼ng h課 thu礳 t韓h h鱟 t th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 nguy阯 li畊. Long v錸 thu礳 t韓h ph鋓 theo th� t� h鱟 t!"
		     x892004_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 17 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157002)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310182)
              if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157002,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310182,1)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157003, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#H#W#{_INFOMSG%s}#H h鱟 xong m祎 lo読 thu礳 t韓h k� n錸g#H! Th唼ng c� th kh� l鈓 h鄋g thi阯 th醝 c� c鋘h, xem ra nh鈔 gian v譨 mu痭 ngh阯h 痼n m祎 h癷 huy猼 v� tinh phong!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#YCh鷆 m譶g ng呓i, long v錸 gi鋗 kh醤g h課 cu痠 thu礳 t韓h h鱟 t th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 nguy阯 li畊. Long v錸 thu礳 t韓h ph鋓 theo th� t� h鱟 t!"
		     x892004_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 18 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157003)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310183)
              if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157003,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310183,1)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157004, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#H#W#{_INFOMSG%s}#H h鱟 xong m祎 lo読 thu礳 t韓h k� n錸g#H! Th唼ng c� th kh� l鈓 h鄋g thi阯 th醝 c� c鋘h, xem ra nh鈔 gian v譨 mu痭 ngh阯h 痼n m祎 h癷 huy猼 v� tinh phong!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, long v錸 thu礳 t韓h c鬾g k韈h h鱟 t th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 nguy阯 li畊. Long v錸 thu礳 t韓h ph鋓 theo th� t� h鱟 t!"
		     x892004_ShowNotice(sceneId, selfId, targetId, strNotice);
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
					
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, long v錸 th錸g c th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 nguy阯 li畊!"
		     x892004_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 20 then
		BeginEvent(sceneId)

			AddText(sceneId,"M秈 l馻 ch鱪 thu礳 t韓h m� r祅g!")
			AddNumText(sceneId,x892004_g_ScriptId,"Long V錸 c 1 (B錸g c tinh) m� r祅g thu礳 t韓h",6,51)
			AddNumText(sceneId,x892004_g_ScriptId,"Long V錸 c 1 (H鯽 c tinh) m� r祅g thu礳 t韓h",6,52)
			AddNumText(sceneId,x892004_g_ScriptId,"Long V錸 c 1 (Huy玭 c tinh) m� r祅g thu礳 t韓h",6,53)
			AddNumText(sceneId,x892004_g_ScriptId,"Long V錸 c 1 (械c c tinh) m� r祅g thu礳 t韓h",6,54)
			AddNumText(sceneId,x892004_g_ScriptId,"Quay l読",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 21 then
		BeginEvent(sceneId)

			AddText(sceneId,"M秈 l馻 ch鱪 thu礳 t韓h m� r祅g!")
			AddNumText(sceneId,x892004_g_ScriptId,"Long V錸 c 2 (B錸g c tinh) m� r祅g thu礳 t韓h",6,55)
			AddNumText(sceneId,x892004_g_ScriptId,"Long V錸 c 2 (H鯽 c tinh) m� r祅g thu礳 t韓h",6,56)
			AddNumText(sceneId,x892004_g_ScriptId,"Long V錸 c 2 (Huy玭 c tinh) m� r祅g thu礳 t韓h",6,57)
			AddNumText(sceneId,x892004_g_ScriptId,"Long V錸 c 2 (械c c tinh) m� r祅g thu礳 t韓h",6,58)
			AddNumText(sceneId,x892004_g_ScriptId,"Quay l読",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 22 then
		BeginEvent(sceneId)

			AddText(sceneId,"M秈 l馻 ch鱪 thu礳 t韓h m� r祅g!")
			AddNumText(sceneId,x892004_g_ScriptId,"Long V錸 c 3 (B錸g c tinh) m� r祅g thu礳 t韓h",6,59)
			AddNumText(sceneId,x892004_g_ScriptId,"Long V錸 c 3 (H鯽 c tinh) m� r祅g thu礳 t韓h",6,60)
			AddNumText(sceneId,x892004_g_ScriptId,"Long V錸 c 3 (Huy玭 c tinh) m� r祅g thu礳 t韓h",6,61)
			AddNumText(sceneId,x892004_g_ScriptId,"Long V錸 c 3 (械c c tinh) m� r祅g thu礳 t韓h",6,62)
			AddNumText(sceneId,x892004_g_ScriptId,"Quay l読",8,130)
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
			AddNumText(sceneId,x892004_g_ScriptId,"#{FBSJ_090304_02}",11,29)
			AddNumText(sceneId,x892004_g_ScriptId,"#{FBSJ_090304_01}",11,30)
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
function x892004_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x892004_g_eventList do
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
function x892004_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x892004_g_eventList do
		if missionScriptId == findId then
			x892004_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x892004_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x892004_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x892004_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x892004_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x892004_OnDie( sceneId, selfId, killerId )
end




--**********************************
--判断是否能够学习
--nSkillIndex参数可能值为：40，70，90，分别学习对应级别的技能
--**********************************
function x892004_CheckStudyDarkSkills( sceneId, selfId, targetId, nSkillIndex )
	
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
		x892004_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	--判断是否已经学会了对应技能
	if  (HaveSkill(sceneId, selfId, x892004_g_DarkSkillName[nSkillIndex].id) > 0 ) then
		if (nSkillIndex == 40) then
			strNotice = "#{FBSJ_081209_26}";
		elseif (nSkillIndex == 70) then
			strNotice = "#{FBSJ_081209_28}";
		elseif (nSkillIndex == 90) then
			strNotice = "#{FBSJ_081209_30}";
		end
		x892004_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	--判断玩家身上是否有足够的钱
	local nHaveMoney = GetMoney(sceneId, selfId) + GetMoneyJZ(sceneId, selfId);
	if (nHaveMoney < x892004_g_DarkSkillName[nSkillIndex].needmoney) then    --10金
		strNotice = "#{FBSJ_081209_25}";
		x892004_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	return 1;
	
end

--**********************************
--玩家找NPC学习暗器使用技能
--nSkillIndex参数可能值为：40，70，90，分别学习对应级别的技能
--**********************************
function x892004_StudyDarkSkills( sceneId, selfId, targetId, nSkillIndex )
	
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
		x892004_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	--判断是否已经学会了对应技能
	if  (HaveSkill(sceneId, selfId, x892004_g_DarkSkillName[nSkillIndex].id) > 0 ) then
		if (nSkillIndex == 40) then
			strNotice = "#{FBSJ_081209_26}";
		elseif (nSkillIndex == 70) then
			strNotice = "#{FBSJ_081209_28}";
		elseif (nSkillIndex == 90) then
			strNotice = "#{FBSJ_081209_30}";
		end
		x892004_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	--判断玩家身上是否有足够的钱
	local nHaveMoney = GetMoney(sceneId, selfId) + GetMoneyJZ(sceneId, selfId);
	if (nHaveMoney < x892004_g_DarkSkillName[nSkillIndex].needmoney) then    --10金
		strNotice = "#{FBSJ_081209_25}";
		x892004_ShowNotice(sceneId, selfId, targetId, strNotice);
		return
	end
	
	--上面判断都通过，可以扣钱给技能了
	local nRet, nRetJB = LuaFnCostMoneyWithPriority(sceneId, selfId, x892004_g_DarkSkillName[nSkillIndex].needmoney);
	if (nRet == -1) then
		strNotice = "#{FBSJ_081209_25}";
		x892004_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	AddSkill(  sceneId, selfId, x892004_g_DarkSkillName[nSkillIndex].id)
	x892004_ShowNotice(sceneId, selfId, targetId, x892004_g_DarkSkillTips[nSkillIndex]);
	x892004_NotifyTips( sceneId, selfId, x892004_g_DarkSkillTips[nSkillIndex] )
	
	x892004_StudySkillImpact(sceneId, selfId)
	DarkOperateResult(sceneId, selfId, 5, 1);    --让技能按钮闪烁
	
end


--**********************************
-- 屏幕中间信息提示
--**********************************
function x892004_NotifyTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end


--**********************************
--玩家是否满足暗器瓶颈条件
--返回值：0或者1，1为满足，0
--**********************************
function x892004_CheckDarkReachPoint(sceneId, selfId, targetId)
		
		local strInfo = "";
		--判断玩家身上是否装备有暗器
		local bHaveDarkEquip = HaveDarkEquiped(sceneId, selfId);
		if ( bHaveDarkEquip ~= 1) then
			strInfo = "#{FBSJ_081209_13}";
			x892004_ShowNotice(sceneId, selfId, targetId, strInfo);
			return 0;
		end
		
		--判断玩家身上暗器是否达到瓶颈
		local bNeedNPC = IsDarkNeedLevelUpByNpcNow(sceneId, selfId);
		if (bNeedNPC ~= 1) then
			strInfo = "#{FBSJ_081209_14}";
			x892004_ShowNotice(sceneId, selfId, targetId, strInfo);
			return 0;
		end
		
		--判断玩家等级是否和暗器等级相等或者没有暗器等级高
		local nDarkLevel = GetDarkLevel(sceneId, selfId);
		local nCharLevel = GetLevel(sceneId, selfId);
		if (nDarkLevel >= nCharLevel) then
			strInfo = "#{FBSJ_081209_15}";
			x892004_ShowNotice(sceneId, selfId, targetId, strInfo);
			return 0;
		end
		
		--判断玩家身上是否有足够的钱
		local nDarkLevel = GetDarkLevel(sceneId, selfId);
		local nNeedMoney = x892004_g_DarkBreachPointNeedMoney[nDarkLevel];
		if (nNeedMoney == nil or nNeedMoney <= 0) then
			nNeedMoney = 100000;         --以防万一，并没什么用
		end
		local nHaveMoney = GetMoney(sceneId, selfId) + GetMoneyJZ(sceneId, selfId);
		if (nHaveMoney < nNeedMoney) then    --10金
			strNotice = "#{FBSJ_081209_25}";
			x892004_ShowNotice(sceneId, selfId, targetId, strNotice);
			return 0;
		end
				
		return 1;
end


function x892004_BreachDarkPoint(sceneId, selfId, targetId)

	local strInfo = "";
	--判断玩家身上是否装备有暗器
	local bHaveDarkEquip = HaveDarkEquiped(sceneId, selfId);
	if ( bHaveDarkEquip ~= 1) then
		strInfo = "#{FBSJ_081209_13}";
		x892004_ShowNotice(sceneId, selfId, targetId, strInfo);
		return 0;
	end
		
	--判断玩家身上暗器是否达到瓶颈
	local bNeedNPC = IsDarkNeedLevelUpByNpcNow(sceneId, selfId);
	if (bNeedNPC ~= 1) then
		strInfo = "#{FBSJ_081209_14}";
		x892004_ShowNotice(sceneId, selfId, targetId, strInfo);
		return 0;
	end
		
	--判断玩家等级是否和暗器等级相等或者没有暗器等级高
	local nDarkLevel = GetDarkLevel(sceneId, selfId);
	local nCharLevel = GetLevel(sceneId, selfId);
	if (nDarkLevel >= nCharLevel) then
		strInfo = "#{FBSJ_081209_15}";
		x892004_ShowNotice(sceneId, selfId, targetId, strInfo);
		return 0;
	end
		
			--判断玩家身上是否有足够的钱
	local nDarkLevel = GetDarkLevel(sceneId, selfId);
	local nNeedMoney = x892004_g_DarkBreachPointNeedMoney[nDarkLevel];
	if (nNeedMoney == nil or nNeedMoney <= 0) then
		nNeedMoney = 100000;         --以防万一，并没什么用
	end
	local nHaveMoney = GetMoney(sceneId, selfId) + GetMoneyJZ(sceneId, selfId);
	if (nHaveMoney < nNeedMoney) then    --10金
		strNotice = "#{FBSJ_081209_25}";
		x892004_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	--上面判断都通过，可以扣钱突破了
	local nRet, nRetJB = LuaFnCostMoneyWithPriority(sceneId, selfId, nNeedMoney);
	if (nRet == -1) then
		strNotice = "#{FBSJ_081209_25}";
		x892004_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	--突破瓶颈，让暗器升级
	local bDarkLevelup = DarkLevelUp(sceneId, selfId);
	if (bDarkLevelup == 1) then
		x892004_ShowNotice(sceneId, selfId, targetId, "#{FBSJ_081209_18}");
		--突破成功，记录统计日志
			local guid = LuaFnObjId2Guid(sceneId, selfId);
			local sLog = format("dark level now: %d", nDarkLevel + 1); 
			ScriptGlobal_AuditGeneralLog(LUAAUDIT_ANQITUPO, guid, sLog);
	else
		x892004_ShowNotice(sceneId, selfId, targetId, "械t ph� th b読");
	end
	
	return
end

function x892004_ShowNotice( sceneId, selfId, targetId, strNotice)
	BeginEvent( sceneId )
		AddText( sceneId, strNotice )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

function x892004_StudySkillImpact(sceneId, playerId)
	--显示学习到新技能的特效 目前使用升级特效
	LuaFnSendSpecificImpactToUnit(sceneId, playerId, playerId, playerId, 32407, 0 )
end

