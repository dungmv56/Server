--洛阳NPC
--燕青
--普通

--脚本号
x892003_g_ScriptId = 892003

--所拥有的事件ID列表
x892003_g_eventList={}

x892003_g_strGongGaoInfo = {
  "#{_INFOUSR%s}#H Tr鋓 qua m祎 phen c� gg, r痶 c鴆 thu th 疬㧟 v ph nhu祄 m鄒 trang ph鴆 th秈 trang. #YY Thi阯 Th醝 #W穑c 疬a tg m祎 c醝 #{_INFOMSG%s}!", 
  "#{_INFOUSR%s} #cff99ccV� #YY Thi阯 Th醝 #cff99ccl鄊 cho nhu祄 m鄒 #YTrang ph鴆 th秈 trang#cff99cc, linh h皀 trang b� s� gi� d鈔g l阯 #{_INFOMSG%s} l鄊 c鋗 t�!", 
  "#{_INFOUSR%s}#H � #YY Thi阯 Th醝 #Wti猲 h鄋h #RNhu祄 m鄒 trang ph鴆 th秈 trang #Ith錸g c trung, m祎 疬秐g qu� quan tr鋗 t呔ng, kh鬾g h� l� c鬾g phu kh鬾g ph� l騨g ng叨i, 穑c tg c鵱g #{_INFOMSG%s}!",
  "#{_INFOUSR%s}#H Tr鋓 qua kh鬾g ng譶g c� gg thu th #RThu痗 nhu祄 trang ph鴆 th秈 trang #Is� h鎢 v ph, 鹫t 疬㧟 #W#{_INFOMSG%s}#H, th s� l� l鄊 ng叨i ta h鈓 m�!", 
}

-----染色时装ID
x892003_XUEYU = { 10553167, 10553168, 10553169, 10553170,10553171, 10553172, 10553173, 10553174, }
x892003_XIANLV = { 10553176, 10553177, 10553178, 10553179, 10553180, 10553181, 10553182, 10553183, }
x892003_ANDAN = { 10553185, 10553186, 10553187, 10553188, 10553189, 10553190, 10553191, 10553192, }
x892003_SHUKUANG = { 10553194, 10553195, 10553196, 10553197, 10553198, 10553199, 10553200, 10553201, }
x892003_CHUNFENG = { 10553203, 10553204, 10553205, 10553206, 10553207, 10553208, 10553209, 10553210, }
x892003_QINGFENG = { 10553212, 10553213, 10553214, 10553215, 10553216, 10553217, 10553218, 10553219, }


--**********************************
--事件列表
--**********************************
function x892003_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"Ch醤 gh閠 trang ph鴆 c� 鸾n 餴畊 s th醝? Ch醤 gh閠 ch韓h l� trang ph鴆 鋗 鹫m quang mang? Mu痭 theo 饀眎 ch韓h m靚h m緄 m� c鋗 c鵱g c� t韓h, ta c� th� gi鷓 ng呓i gi m祅g tr� th鄋h s� th.")
		AddText(sceneId,"Trang ph鴆 th秈 trang nhu祄 m鄒 c� th� cho ng呓i thay 鸨i s th醝 trang ph鴆 th秈 trang, m ra mu鬾 t韆 ngh靚 h皀g.")
		AddText(sceneId,"H鎢 t靚h n陁 l阯: Th飊h 餰m nhu祄 m鄒 trang ph鴆 th秈 穑t � tay n鋓.")

		for i, eventId in x892003_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
		AddNumText(sceneId,x892003_g_ScriptId,"Test",6,6)
		AddNumText(sceneId,x892003_g_ScriptId,"Nhu祄 m鄒",6,7)
		AddNumText(sceneId,x892003_g_ScriptId,"Gi緄 thi猽 nhu祄 m鄒",6,8)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x892003_OnDefaultEvent( sceneId, selfId,targetId )
	x892003_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x892003_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x892003_g_eventList do
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
			AddText(sceneId,"M瞚 lo読 trang ph鴆 th秈 trang 皤u c� #Gnhi玼 lo読 ki瑄 d醤g phong c醕h kh醕 nhau#W, c ti陁 hao m祎 c醝 #cFF0000H皀g Di畊 Th誧h #W瓞 nhu祄 m鄒 m祎 l. Sau khi nhu祄 m鄒 t鵼 c� 鹫t 疬㧟 m祎 lo読 ki瑄 d醤g phong c醕h trang ph鴆 th秈 trang.")
			AddText(sceneId,"Sau khi nhu祄 m鄒 trang ph鴆 th秈 trang v� ngo鄆 c鵱g thu礳 t韓h 疬㧟 t錸g l阯, nh遪g trang ph鴆 th秈 trang 疬㧟 kh鋗 b鋙 th誧h, t� ch, c叨ng h骯 c b s� b� m, c th醥 xu痭g b鋙 th誧h 疬㧟 kh鋗.")

			AddNumText(sceneId,x892003_g_ScriptId,"Nhu祄 m鄒 Tuy猼 v� s呓ng y",6,12)
			AddNumText(sceneId,x892003_g_ScriptId,"Nhu祄 m鄒 Ti阯 l� t靚h duy阯",6,13)
			AddNumText(sceneId,x892003_g_ScriptId,"Nhu祄 m鄒 膍 鹫m 餴陁 linh",6,14)
			AddNumText(sceneId,x892003_g_ScriptId,"Nhu祄 m鄒 S� Cu皀g 羗 H呓ng",6,15)
			AddNumText(sceneId,x892003_g_ScriptId,"Nhu祄 m鄒 Xu鈔 phong d� tuy猼",6,16)
			AddNumText(sceneId,x892003_g_ScriptId,"Nhu祄 m鄒 Thanh phong di giang",6,17)

			AddNumText(sceneId,x892003_g_ScriptId,"#{FBSJ_081209_12}",8,130)
	
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		
	elseif NumText == 8 then  --领悟技能
		BeginEvent(sceneId)
			AddText(sceneId,"#YB 鸢ng  s th醝 ch呓ng hi琻 ng呓i 鸬c 疳o  m緄 th叻ng th裞, hoa m� s th醝 cho ng呓i v� h課  th� gi醕 h叻ng th�!")
			AddText(sceneId,"Trang ph鴆 th秈 trang nhu祄 m鄒 s� d鴑g H皀g Di畊 Th誧h c� th� bi猲 h骯 nhan s, m瞚 l nhu祄 m鄒 皤u t鵼 c� nhu祄 m鄒 th鄋h m祎 kho鋘 h靚h th裞, c騨 kh� n錸g th b読. Sau khi th b読 trang ph鴆 m痶 c鵱g h皀g di畊 th誧h 皤u bi猲 m.")
			AddText(sceneId,"C騨 kh鬾g bi猼 trang ph鴆 th秈 trang c� th� nhu祄 m鄒 sao? Xem ra ch韓h m靚h trang ph鴆 th秈 trang ph韆 d呔i bi瑄 hi畁 thuy猼 minh l� c� th� bi猼, c� th� nhu祄 m鄒 trang ph鴆 th秈 trang ph韆 d呔i c� ch� d鏽.")

		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 9 then   --武魂扩展属性
		BeginEvent(sceneId)
			AddText(sceneId,"#{FBSJ_081209_31}")
			AddNumText(sceneId,x892003_g_ScriptId,"获取 武魂（0级） 扩展属性",6,19)
			AddNumText(sceneId,x892003_g_ScriptId,"获取 武魂（1级） 扩展属性",6,20)
			AddNumText(sceneId,x892003_g_ScriptId,"获取 武魂（2级） 扩展属性",6,21)
			AddNumText(sceneId,x892003_g_ScriptId,"获取 武魂（3级） 扩展属性",6,22)
			AddNumText(sceneId,x892003_g_ScriptId,"#{FBSJ_081209_12}",8,130)
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
			AddNumText(sceneId,x892003_g_ScriptId,"#{FBSJ_090311_03}",6,26)
			AddNumText(sceneId,x892003_g_ScriptId,"#{FBSJ_090311_04}",6,27)
			AddNumText(sceneId,x892003_g_ScriptId,"#{FBSJ_081209_12}",8,13)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 12 then                   --Tuy猼 v� s呓ng y
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10124069)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 30503140)
              if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10124069,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30503140,1)--删除物品
			              local GemListSize = getn(x892003_XUEYU)
			              local RandomGem = x892003_XUEYU[ random( GemListSize ) ]
			              local bagpos01 = TryRecieveItem( sceneId, selfId, RandomGem, 1)--给予物品
			              --local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					--x892003_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, trang ph鴆 nhu祄 m鄒 th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 nguy阯 li畊!"
		     x892003_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 13 then                   --Ti阯 l� t靚h duy阯
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10124072)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 30503140)
              if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10124072,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30503140,1)--删除物品
			              local GemListSize = getn(x892003_XIANLV)
			              local RandomGem = x892003_XIANLV[ random( GemListSize ) ]
			              local bagpos01 = TryRecieveItem( sceneId, selfId, RandomGem, 1)--给予物品
			              local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x892003_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, trang ph鴆 nhu祄 m鄒 th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 nguy阯 li畊!"
		     x892003_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end
		
	elseif NumText == 130 then
		x892003_OnDefaultEvent( sceneId, selfId,targetId )
	elseif NumText == 14 then        ---膍 鹫m 餴陁 linh
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10124100)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 30503140)
              if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10124100,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30503140,1)--删除物品
			              local GemListSize = getn(x892003_ANDAN)
			              local RandomGem = x892003_ANDAN[ random( GemListSize ) ]
			              local bagpos01 = TryRecieveItem( sceneId, selfId, RandomGem, 1)--给予物品
			              local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x892003_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, trang ph鴆 nhu祄 m鄒 th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 nguy阯 li畊!"
		     x892003_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 15 then       ----疏狂暗香
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10124133)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 30503140)
              if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10124133,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30503140,1)--删除物品
			              local GemListSize = getn(x892003_SHUXIANG)
			              local RandomGem = x892003_SHUXIANG[ random( GemListSize ) ]
			              local bagpos01 = TryRecieveItem( sceneId, selfId, RandomGem, 1)--给予物品
			              local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x892003_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, trang ph鴆 nhu祄 m鄒 th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 nguy阯 li畊!"
		     x892003_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 16 then         ----春风余雪
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10124140)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 30503140)
              if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10124140,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30503140,1)--删除物品
			              local GemListSize = getn(x892003_CHUNFENG)
			              local RandomGem = x892003_CHUNFENG[ random( GemListSize ) ]
			              local bagpos01 = TryRecieveItem( sceneId, selfId, RandomGem, 1)--给予物品
			              local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x892003_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, trang ph鴆 nhu祄 m鄒 th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 nguy阯 li畊!"
		     x892003_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 17 then         ----清风怡江
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10124103)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 30503140)
              if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10124103,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,30503140,1)--删除物品
			              local GemListSize = getn(x892003_QINGFENG)
			              local RandomGem = x892003_QINGFENG[ random( GemListSize ) ]
			              local bagpos01 = TryRecieveItem( sceneId, selfId, RandomGem, 1)--给予物品
			              local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					x892003_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, trang ph鴆 nhu祄 m鄒 th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 nguy阯 li畊!"
		     x892003_ShowNotice(sceneId, selfId, targetId, strNotice);
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
					x892003_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#G恭喜你，武魂升级成功！"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#G请检查您包裹的武魂和 武魂易相丹 是否齐全，要材料想对应放在包裹内才可以注入属相哦！！"
		     x892003_ShowNotice(sceneId, selfId, targetId, strNotice);
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
					x892003_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#G恭喜你，武魂升级成功！"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#G请检查您包裹的武魂和 武魂易相丹 是否齐全，要材料想对应放在包裹内才可以注入属相哦！！"
		     x892003_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 20 then
		BeginEvent( sceneId ) 
			AddText(sceneId,"请选择要获取的扩展属性，要对应相同的武魂属性哦！")
			AddNumText(sceneId,x892003_g_ScriptId,"武魂1级（冰属相）扩展属性",6,51)
			AddNumText(sceneId,x892003_g_ScriptId,"武魂1级（火属相）扩展属性",6,52)
			AddNumText(sceneId,x892003_g_ScriptId,"武魂1级（玄属相）扩展属性",6,53)
			AddNumText(sceneId,x892003_g_ScriptId,"武魂1级（毒属相）扩展属性",6,54)
			AddNumText(sceneId,x892003_g_ScriptId,"#{FBSJ_081209_12}",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 21 then
		BeginEvent( sceneId ) 
			AddText(sceneId,"请选择要获取的扩展属性，要对应相同的武魂属性哦！")
			AddNumText(sceneId,x892003_g_ScriptId,"武魂2级（冰属相）扩展属性",6,55)
			AddNumText(sceneId,x892003_g_ScriptId,"武魂2级（火属相）扩展属性",6,56)
			AddNumText(sceneId,x892003_g_ScriptId,"武魂2级（玄属相）扩展属性",6,57)
			AddNumText(sceneId,x892003_g_ScriptId,"武魂2级（毒属相）扩展属性",6,58)
			AddNumText(sceneId,x892003_g_ScriptId,"#{FBSJ_081209_12}",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 22 then
		BeginEvent( sceneId ) 
			AddText(sceneId,"请选择要获取的扩展属性，要对应相同的武魂属性哦！")
			AddNumText(sceneId,x892003_g_ScriptId,"武魂3级（冰属相）扩展属性",6,59)
			AddNumText(sceneId,x892003_g_ScriptId,"武魂3级（火属相）扩展属性",6,60)
			AddNumText(sceneId,x892003_g_ScriptId,"武魂3级（玄属相）扩展属性",6,61)
			AddNumText(sceneId,x892003_g_ScriptId,"武魂3级（毒属相）扩展属性",6,62)
			AddNumText(sceneId,x892003_g_ScriptId,"#{FBSJ_081209_12}",8,130)
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
			AddNumText(sceneId,x892003_g_ScriptId,"#{FBSJ_090304_02}",11,29)
			AddNumText(sceneId,x892003_g_ScriptId,"#{FBSJ_090304_01}",11,30)
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
function x892003_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x892003_g_eventList do
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
function x892003_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x892003_g_eventList do
		if missionScriptId == findId then
			x892003_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x892003_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x892003_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x892003_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x892003_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x892003_OnDie( sceneId, selfId, killerId )
end




--**********************************
--判断是否能够学习
--nSkillIndex参数可能值为：40，70，90，分别学习对应级别的技能
--**********************************
function x892003_CheckStudyDarkSkills( sceneId, selfId, targetId, nSkillIndex )
	
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
		x892003_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	--判断是否已经学会了对应技能
	if  (HaveSkill(sceneId, selfId, x892003_g_DarkSkillName[nSkillIndex].id) > 0 ) then
		if (nSkillIndex == 40) then
			strNotice = "#{FBSJ_081209_26}";
		elseif (nSkillIndex == 70) then
			strNotice = "#{FBSJ_081209_28}";
		elseif (nSkillIndex == 90) then
			strNotice = "#{FBSJ_081209_30}";
		end
		x892003_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	--判断玩家身上是否有足够的钱
	local nHaveMoney = GetMoney(sceneId, selfId) + GetMoneyJZ(sceneId, selfId);
	if (nHaveMoney < x892003_g_DarkSkillName[nSkillIndex].needmoney) then    --10金
		strNotice = "#{FBSJ_081209_25}";
		x892003_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	return 1;
	
end

--**********************************
--玩家找NPC学习暗器使用技能
--nSkillIndex参数可能值为：40，70，90，分别学习对应级别的技能
--**********************************
function x892003_StudyDarkSkills( sceneId, selfId, targetId, nSkillIndex )
	
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
		x892003_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	--判断是否已经学会了对应技能
	if  (HaveSkill(sceneId, selfId, x892003_g_DarkSkillName[nSkillIndex].id) > 0 ) then
		if (nSkillIndex == 40) then
			strNotice = "#{FBSJ_081209_26}";
		elseif (nSkillIndex == 70) then
			strNotice = "#{FBSJ_081209_28}";
		elseif (nSkillIndex == 90) then
			strNotice = "#{FBSJ_081209_30}";
		end
		x892003_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	--判断玩家身上是否有足够的钱
	local nHaveMoney = GetMoney(sceneId, selfId) + GetMoneyJZ(sceneId, selfId);
	if (nHaveMoney < x892003_g_DarkSkillName[nSkillIndex].needmoney) then    --10金
		strNotice = "#{FBSJ_081209_25}";
		x892003_ShowNotice(sceneId, selfId, targetId, strNotice);
		return
	end
	
	--上面判断都通过，可以扣钱给技能了
	local nRet, nRetJB = LuaFnCostMoneyWithPriority(sceneId, selfId, x892003_g_DarkSkillName[nSkillIndex].needmoney);
	if (nRet == -1) then
		strNotice = "#{FBSJ_081209_25}";
		x892003_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	AddSkill(  sceneId, selfId, x892003_g_DarkSkillName[nSkillIndex].id)
	x892003_ShowNotice(sceneId, selfId, targetId, x892003_g_DarkSkillTips[nSkillIndex]);
	x892003_NotifyTips( sceneId, selfId, x892003_g_DarkSkillTips[nSkillIndex] )
	
	x892003_StudySkillImpact(sceneId, selfId)
	DarkOperateResult(sceneId, selfId, 5, 1);    --让技能按钮闪烁
	
end


--**********************************
-- 屏幕中间信息提示
--**********************************
function x892003_NotifyTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end


--**********************************
--玩家是否满足暗器瓶颈条件
--返回值：0或者1，1为满足，0
--**********************************
function x892003_CheckDarkReachPoint(sceneId, selfId, targetId)
		
		local strInfo = "";
		--判断玩家身上是否装备有暗器
		local bHaveDarkEquip = HaveDarkEquiped(sceneId, selfId);
		if ( bHaveDarkEquip ~= 1) then
			strInfo = "#{FBSJ_081209_13}";
			x892003_ShowNotice(sceneId, selfId, targetId, strInfo);
			return 0;
		end
		
		--判断玩家身上暗器是否达到瓶颈
		local bNeedNPC = IsDarkNeedLevelUpByNpcNow(sceneId, selfId);
		if (bNeedNPC ~= 1) then
			strInfo = "#{FBSJ_081209_14}";
			x892003_ShowNotice(sceneId, selfId, targetId, strInfo);
			return 0;
		end
		
		--判断玩家等级是否和暗器等级相等或者没有暗器等级高
		local nDarkLevel = GetDarkLevel(sceneId, selfId);
		local nCharLevel = GetLevel(sceneId, selfId);
		if (nDarkLevel >= nCharLevel) then
			strInfo = "#{FBSJ_081209_15}";
			x892003_ShowNotice(sceneId, selfId, targetId, strInfo);
			return 0;
		end
		
		--判断玩家身上是否有足够的钱
		local nDarkLevel = GetDarkLevel(sceneId, selfId);
		local nNeedMoney = x892003_g_DarkBreachPointNeedMoney[nDarkLevel];
		if (nNeedMoney == nil or nNeedMoney <= 0) then
			nNeedMoney = 100000;         --以防万一，并没什么用
		end
		local nHaveMoney = GetMoney(sceneId, selfId) + GetMoneyJZ(sceneId, selfId);
		if (nHaveMoney < nNeedMoney) then    --10金
			strNotice = "#{FBSJ_081209_25}";
			x892003_ShowNotice(sceneId, selfId, targetId, strNotice);
			return 0;
		end
				
		return 1;
end


function x892003_BreachDarkPoint(sceneId, selfId, targetId)

	local strInfo = "";
	--判断玩家身上是否装备有暗器
	local bHaveDarkEquip = HaveDarkEquiped(sceneId, selfId);
	if ( bHaveDarkEquip ~= 1) then
		strInfo = "#{FBSJ_081209_13}";
		x892003_ShowNotice(sceneId, selfId, targetId, strInfo);
		return 0;
	end
		
	--判断玩家身上暗器是否达到瓶颈
	local bNeedNPC = IsDarkNeedLevelUpByNpcNow(sceneId, selfId);
	if (bNeedNPC ~= 1) then
		strInfo = "#{FBSJ_081209_14}";
		x892003_ShowNotice(sceneId, selfId, targetId, strInfo);
		return 0;
	end
		
	--判断玩家等级是否和暗器等级相等或者没有暗器等级高
	local nDarkLevel = GetDarkLevel(sceneId, selfId);
	local nCharLevel = GetLevel(sceneId, selfId);
	if (nDarkLevel >= nCharLevel) then
		strInfo = "#{FBSJ_081209_15}";
		x892003_ShowNotice(sceneId, selfId, targetId, strInfo);
		return 0;
	end
		
			--判断玩家身上是否有足够的钱
	local nDarkLevel = GetDarkLevel(sceneId, selfId);
	local nNeedMoney = x892003_g_DarkBreachPointNeedMoney[nDarkLevel];
	if (nNeedMoney == nil or nNeedMoney <= 0) then
		nNeedMoney = 100000;         --以防万一，并没什么用
	end
	local nHaveMoney = GetMoney(sceneId, selfId) + GetMoneyJZ(sceneId, selfId);
	if (nHaveMoney < nNeedMoney) then    --10金
		strNotice = "#{FBSJ_081209_25}";
		x892003_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	--上面判断都通过，可以扣钱突破了
	local nRet, nRetJB = LuaFnCostMoneyWithPriority(sceneId, selfId, nNeedMoney);
	if (nRet == -1) then
		strNotice = "#{FBSJ_081209_25}";
		x892003_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	--突破瓶颈，让暗器升级
	local bDarkLevelup = DarkLevelUp(sceneId, selfId);
	if (bDarkLevelup == 1) then
		x892003_ShowNotice(sceneId, selfId, targetId, "#{FBSJ_081209_18}");
		--突破成功，记录统计日志
			local guid = LuaFnObjId2Guid(sceneId, selfId);
			local sLog = format("dark level now: %d", nDarkLevel + 1); 
			ScriptGlobal_AuditGeneralLog(LUAAUDIT_ANQITUPO, guid, sLog);
	else
		x892003_ShowNotice(sceneId, selfId, targetId, "械t ph� th b読");
	end
	
	return
end

function x892003_ShowNotice( sceneId, selfId, targetId, strNotice)
	BeginEvent( sceneId )
		AddText( sceneId, strNotice )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

function x892003_StudySkillImpact(sceneId, playerId)
	--显示学习到新技能的特效 目前使用升级特效
	LuaFnSendSpecificImpactToUnit(sceneId, playerId, playerId, playerId, 32407, 0 )
end

function x892003_ShowRandomSystemNotice( sceneId, selfId, strItemInfo )
	
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