--洛阳NPC
--燕青
--普通

--脚本号
x892002_g_ScriptId = 892002

--所拥有的事件ID列表
x892002_g_eventList={}


x892002_g_DarkSkillName = { [40] = {name = "N閙 羗 kh�", id = 274, needmoney = 20000},
                            [70] = {name = "羗 kh� 痄 huy畉", id = 275, needmoney = 100000},
                            [90] = {name = "羗 kh� h� th�", id = 276, needmoney = 500000},
                          }                
x892002_g_DarkSkillTips = { [40] = "#{FBSJ_090106_89}",
                            [70] = "#{FBSJ_090106_90}",
                            [90] = "#{FBSJ_090106_91}",
                          }  
x892002_g_DarkBreachPointNeedMoney = 
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
function x892002_UpdateEventList( sceneId, selfId,targetId )
    local  PlayerName=GetName(sceneId,selfId)	
	local  PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex = " C� n呓ng"
	else
		PlayerSex = " Thi猽 hi畃"
	end
	BeginEvent(sceneId)
		AddText(sceneId,"S� huynh t譶g c鵱g ta 呔c h﹏ tho醝  giang h�,  c� trong n鷌 v� l唼ng. 衖nh Xu鈔 Thu 鸬c h読 s� huynh 疬a h t緄 v醕h n鷌 餰n, nay kh鬾g bi猼 sinh t�...")
		AddText(sceneId,"Xin ch鄌"..PlayerSex..", ng呓i nh� th� n鄌 ki玬 gi� Ng� Dao B鄋? C� ph鋓 hay kh鬾g s� huynh c騨 s痭g? Th飊h b醥 cho bi猼, ta s� hi畃 tr� ng呓i ph呓ng ph醦 c� 疬㧟 Ng� Dao B鄋.")
		for i, eventId in x892002_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
		
		AddNumText(sceneId,x892002_g_ScriptId,"Th錸g c 鹌ng c V� H皀",6,7)
		AddNumText(sceneId,x892002_g_ScriptId,"M� r祅g k� n錸g V� H皀",6,8)
		AddNumText(sceneId,x892002_g_ScriptId,"Th錸g c V� H皀 m� r祅g k� n錸g",6,9)
		AddNumText(sceneId,x892002_g_ScriptId,"M� r祅g thu礳 t韓h V� H皀",6,10)
		--AddNumText(sceneId,x892002_g_ScriptId,"Thuy猼 minh V� H皀",8,888)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x892002_OnDefaultEvent( sceneId, selfId,targetId )
	x892002_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x892002_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x892002_g_eventList do
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

	elseif NumText == 888 then  --说明
		BeginEvent(sceneId)
			AddNumText(sceneId,x892002_g_ScriptId,"武魂来由",6,666)
			AddNumText(sceneId,x892002_g_ScriptId,"怎样获得武魂",6,667)
			AddNumText(sceneId,x892002_g_ScriptId,"武魂怎样升级",6,668)
			AddNumText(sceneId,x892002_g_ScriptId,"怎样获得武魂相关道具",6,669)
			AddNumText(sceneId,x892002_g_ScriptId,"武魂扩展属性介绍",6,670)
			AddNumText(sceneId,x892002_g_ScriptId,"武魂属相介绍",6,671)
			AddNumText(sceneId,x892002_g_ScriptId,"属相相克效果",6,672)
			AddNumText(sceneId,x892002_g_ScriptId,"Quay l読",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 666 then  --提升武魂等级
		BeginEvent(sceneId)
			AddText(sceneId,"不知过了多少年，中原武林遭遇一场浩劫，在强大的外敌前面，至尊武魂终于觉醒，幻化分身成为千千万万个武魂守护着年轻的侠士们，成为他们同生共死的伙伴。如果你有幸得到了这至高无上的宝物，你将会获得能力的全面拓展和提升，让你达到前所未有的新境界！")
			AddNumText(sceneId,x892002_g_ScriptId,"Quay l読",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif NumText == 667 then  --提升武魂等级
		BeginEvent(sceneId)
			AddText(sceneId,"#cfabf8f怎样获得武魂:#r　　#W在#G四绝庄#W副本中打败BOSS，有一定几率获得#R武魂：御瑶盘#W。")
			AddNumText(sceneId,x892002_g_ScriptId,"Quay l読",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif NumText == 668 then  --提升武魂等级
		BeginEvent(sceneId)
			AddText(sceneId,"#cfabf8f武魂怎样升级:#r　　#W使用#G3#W颗相应等级的#G魂冰珠#W可对武魂进行升级。升级后的武魂#R自身属性#W、#R携带等级#W和#R武魂扩展属性值#W均会得到提高。#r#P(只有注入了属相的武魂才能进行升级)")
			AddNumText(sceneId,x892002_g_ScriptId,"Quay l読",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif NumText == 669 then  --提升武魂等级
		BeginEvent(sceneId)
			AddText(sceneId,"#cfabf8f#r怎样获得武魂相关道具:#r#Y所有武魂升级道具均可在四绝庄获得。")
			AddNumText(sceneId,x892002_g_ScriptId,"Quay l読",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif NumText == 670 then  --提升武魂等级
		BeginEvent(sceneId)
			AddText(sceneId,"#cfabf8f武魂扩展属性介绍:#r　　#W使用武魂易相丹对武魂注入属相后，武魂将自动获得一个对应属相的#G减抗下限类#W扩展属性。武魂等级越高，其扩展属性值则越大。更多的扩展属性将逐步更新开放。")
			AddNumText(sceneId,x892002_g_ScriptId,"Quay l読",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif NumText == 671 then  --提升武魂等级
		BeginEvent(sceneId)
			AddText(sceneId,"#cfabf8f武魂属相介绍:#r#Y怎样获得属相:　　#r#W使用#G武魂易相丹#W可对无属相的御瑶盘进行注入属相。武魂的属相有冰、火、玄、毒四种。玩家可自由选择注入一种，但武魂注入属相后，将不能更换属相。")
			AddNumText(sceneId,x892002_g_ScriptId,"Quay l読",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif NumText == 672 then  --提升武魂等级
		BeginEvent(sceneId)
			AddText(sceneId,"#Y属相相克效果:　　#r#W属相相克的最终效果，在一定程度上受到武魂等级的影响。#r　　假使A、B两个玩家分别装备有两个武魂，A玩家的武魂克制B玩家的武魂。如果A玩家的武魂合成等级高于B玩家的武魂等级，伤害放大效果更加明显；如果A玩家的武魂等级低于B玩家的武魂等级，伤害放大效果将有所减弱。")
			AddNumText(sceneId,x892002_g_ScriptId,"Quay l読",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 7 then  --提升武魂等级
		BeginEvent(sceneId)
			AddText(sceneId,"C b V� H皀 鹫t t緄 3 c, m緄 c� th� ti猲 giai v� h皀 c b. Ph痠 h䅟 s� d鴑g H皀 B錸g Ch鈛 c鵱g Nhu H皀 Th誧h 餰m ng� dao b鄋 鸬t ph� t緄 c 4, V� H皀 sau khi 鸬t ph� th鄋h c鬾g m� ra thu礳 t韓h #GTh� hai, th� 3 #Wc鵱g #Gm� r祅g k� n錸g#W, h絥 n鎍 m� r祅g thu礳 t韓h c鵱g m� r祅g k� n錸g hi畊 qu� t鵼 v� h皀 c b m� n鈔g cao.")
			AddText(sceneId,"#{WH_NPC_4}")

			AddNumText(sceneId,x892002_g_ScriptId,"Th錸g c Ng� Dao B鄋 - B錸g",6,12)
			AddNumText(sceneId,x892002_g_ScriptId,"Th錸g c Ng� Dao B鄋 - H鯽",6,13)
			AddNumText(sceneId,x892002_g_ScriptId,"Th錸g c Ng� Dao B鄋 - Huy玭",6,14)
			AddNumText(sceneId,x892002_g_ScriptId,"Th錸g c Ng� Dao B鄋 - 械c",6,15)
			AddNumText(sceneId,x892002_g_ScriptId,"Quay l読",8,130)
	
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		
	elseif NumText == 8 then  --L頽h ng导寄�
		BeginEvent(sceneId)
			AddText(sceneId,"V� h皀 c b 4, c� th� th鬾g qua t呓ng 裯g V� H皀 m� r祅g k� n錸g th� h鱟 t k� n錸g m� r祅g th� hai.")
			AddText(sceneId,"V� h皀 c b 5, c� th� th鬾g qua t呓ng 裯g V� H皀 m� r祅g k� n錸g th� h鱟 t k� n錸g m� r祅g th� ba, s� d鴑g t呓ng 裯g k� n錸g th� th錸g c th� hai m� r祅g k� n錸g.")
			AddText(sceneId,"V� h皀 th錸g c m� r祅g k� n錸g t鵼 v� h皀 c b m� n鈔g cao.")

			AddNumText(sceneId,x892002_g_ScriptId,"H鱟 t k� n錸g m� r祅g V� H皀 (C 4)",6,16)
			AddNumText(sceneId,x892002_g_ScriptId,"H鱟 t k� n錸g m� r祅g V� H皀 (C 5)",6,17)
			AddNumText(sceneId,x892002_g_ScriptId,"Quay l読",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 9 then   --武魂扩展属性
		BeginEvent(sceneId)
			AddText(sceneId,"V� h皀 c b 4, c� th� th鬾g qua t呓ng 裯g V� H皀 m� r祅g k� n錸g th� h鱟 t k� n錸g m� r祅g th� hai.")
			AddText(sceneId,"V� h皀 c b 5, c� th� th鬾g qua t呓ng 裯g V� H皀 m� r祅g k� n錸g th� h鱟 t k� n錸g m� r祅g th� ba, s� d鴑g t呓ng 裯g k� n錸g th� th錸g c th� hai m� r祅g k� n錸g.")
			AddText(sceneId,"V� h皀 th錸g c m� r祅g k� n錸g t鵼 v� h皀 c b m� n鈔g cao.")
			AddNumText(sceneId,x892002_g_ScriptId,"Th錸g c k� n錸g C鬾g k韈h",6,19)
			AddNumText(sceneId,x892002_g_ScriptId,"Th錸g c k� n錸g Ph騨g th�",6,20)
			AddNumText(sceneId,x892002_g_ScriptId,"Quay l読",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 10 then  --重洗暗器技能
		BeginEvent(sceneId)
			AddText(sceneId,"C b V� H皀 鹫t t緄 3 c, m緄 c� th� ti猲 giai v� h皀 c b. Ph痠 h䅟 s� d鴑g H皀 B錸g Ch鈛 c鵱g Nhu H皀 Th誧h 餰m ng� dao b鄋 鸬t ph� t緄 c 4, V� H皀 sau khi 鸬t ph� th鄋h c鬾g m� ra thu礳 t韓h #GTh� hai, th� 3 #Wc鵱g #Gm� r祅g k� n錸g#W, h絥 n鎍 m� r祅g thu礳 t韓h c鵱g m� r祅g k� n錸g hi畊 qu� t鵼 v� h皀 c b m� n鈔g cao.")
			AddNumText(sceneId,x892002_g_ScriptId,"H鱟 t k� n錸g m� r祅g V� H皀 (C 4)",6,21)
			AddNumText(sceneId,x892002_g_ScriptId,"H鱟 t k� n錸g m� r祅g V� H皀 (C 5)",6,22)
			AddNumText(sceneId,x892002_g_ScriptId,"Quay l読",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 11 then  --重置暗器
		BeginEvent(sceneId)
			AddText(sceneId,"#{FBSJ_081209_84}")
			AddNumText(sceneId,x892002_g_ScriptId,"#{FBSJ_090311_03}",6,26)
			AddNumText(sceneId,x892002_g_ScriptId,"#{FBSJ_090311_04}",6,27)
			AddNumText(sceneId,x892002_g_ScriptId,"Quay l読",8,13)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 12 then                   --提升 冰 等级
		BeginEvent(sceneId)
			AddText(sceneId,"械t ph� c b V� H皀 c ph痠 h䅟 s� d鴑g #G3 c醝 #Wc b t呓ng 裯g #GH皀 B錸g Ch鈛 #Wv� #YNhu H皀 Th誧h.")
			AddText(sceneId,"T錸g l阯 t緄 (C 4) c #G3 c醝 H皀 B錸g Ch鈛 (C 4) #Wv� #YNhu H皀 Th誧h - Ng�")
			AddText(sceneId,"T錸g l阯 t緄 (C 5) c #G3 c醝 H皀 B錸g Ch鈛 (C 5) #Wv� #YNhu H皀 Th誧h - Ph�")
			AddText(sceneId,"#{WH_NPC_4}")

			AddNumText(sceneId,x892002_g_ScriptId,"Th錸g c Ng� Dao B鄋 - B錸g (C 4)",6,23)
			AddNumText(sceneId,x892002_g_ScriptId,"Th錸g c Ng� Dao B鄋 - B錸g (C 5)",6,24)
			AddNumText(sceneId,x892002_g_ScriptId,"Quay l読",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 13 then                   --提升 火 等级
		BeginEvent(sceneId)
			AddText(sceneId,"械t ph� c b V� H皀 c ph痠 h䅟 s� d鴑g #G3 c醝 #Wc b t呓ng 裯g #GH皀 B錸g Ch鈛 #Wv� #YNhu H皀 Th誧h.")
			AddText(sceneId,"T錸g l阯 t緄 (C 4) c #G3 c醝 H皀 B錸g Ch鈛 (C 4) #Wv� #YNhu H皀 Th誧h - Ng�")
			AddText(sceneId,"T錸g l阯 t緄 (C 5) c #G3 c醝 H皀 B錸g Ch鈛 (C 5) #Wv� #YNhu H皀 Th誧h - Ph�")
			AddText(sceneId,"#{WH_NPC_4}")

			AddNumText(sceneId,x892002_g_ScriptId,"Th錸g c Ng� Dao B鄋 - H鯽 (C 4)",6,25)
			AddNumText(sceneId,x892002_g_ScriptId,"Th錸g c Ng� Dao B鄋 - H鯽 (C 5)",6,26)
			AddNumText(sceneId,x892002_g_ScriptId,"Quay l読",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		
	elseif NumText == 130 then
		x892002_OnDefaultEvent( sceneId, selfId,targetId )
	elseif NumText == 14 then
		BeginEvent(sceneId)
			AddText(sceneId,"械t ph� c b V� H皀 c ph痠 h䅟 s� d鴑g #G3 c醝 #Wc b t呓ng 裯g #GH皀 B錸g Ch鈛 #Wv� #YNhu H皀 Th誧h.")
			AddText(sceneId,"T錸g l阯 t緄 (C 4) c #G3 c醝 H皀 B錸g Ch鈛 (C 4) #Wv� #YNhu H皀 Th誧h - Ng�")
			AddText(sceneId,"T錸g l阯 t緄 (C 5) c #G3 c醝 H皀 B錸g Ch鈛 (C 5) #Wv� #YNhu H皀 Th誧h - Ph�")
			AddText(sceneId,"#{WH_NPC_4}")

			AddNumText(sceneId,x892002_g_ScriptId,"Th錸g c Ng� Dao B鄋 - Huy玭 (C 4)",6,27)
			AddNumText(sceneId,x892002_g_ScriptId,"Th錸g c Ng� Dao B鄋 - Huy玭 (C 5)",6,28)
			AddNumText(sceneId,x892002_g_ScriptId,"Quay l読",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 15 then
		BeginEvent(sceneId)
			AddText(sceneId,"械t ph� c b V� H皀 c ph痠 h䅟 s� d鴑g #G3 c醝 #Wc b t呓ng 裯g #GH皀 B錸g Ch鈛 #Wv� #YNhu H皀 Th誧h.")
			AddText(sceneId,"T錸g l阯 t緄 (C 4) c #G3 c醝 H皀 B錸g Ch鈛 (C 4) #Wv� #YNhu H皀 Th誧h - Ng�")
			AddText(sceneId,"T錸g l阯 t緄 (C 5) c #G3 c醝 H皀 B錸g Ch鈛 (C 5) #Wv� #YNhu H皀 Th誧h - Ph�")
			AddText(sceneId,"#{WH_NPC_4}")

			AddNumText(sceneId,x892002_g_ScriptId,"Th錸g c Ng� Dao B鄋 - 械c (C 4)",6,29)
			AddNumText(sceneId,x892002_g_ScriptId,"Th錸g c Ng� Dao B鄋 - 械c (C 5)",6,30)
			AddNumText(sceneId,x892002_g_ScriptId,"Quay l読",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)


	elseif NumText == 16 then
		BeginEvent(sceneId)
			AddText(sceneId,"V� h皀 c b 4, c� th� th鬾g qua t呓ng 裯g V� H皀 m� r祅g k� n錸g th� h鱟 t k� n錸g m� r祅g th� hai.")
			AddText(sceneId,"V� h皀 c b 5, c� th� th鬾g qua t呓ng 裯g V� H皀 m� r祅g k� n錸g th� h鱟 t k� n錸g m� r祅g th� ba, s� d鴑g t呓ng 裯g k� n錸g th� th錸g c th� hai m� r祅g k� n錸g.")
			AddText(sceneId,"V� h皀 th錸g c m� r祅g k� n錸g t鵼 v� h皀 c b m� n鈔g cao.")

			AddNumText(sceneId,x892002_g_ScriptId,"H鱟 t Ng� - Thu鏽 Gi醦 (C 1)",6,31)
			AddNumText(sceneId,x892002_g_ScriptId,"Quay l読",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 17 then
		BeginEvent(sceneId)
			AddText(sceneId,"V� h皀 c b 4, c� th� th鬾g qua t呓ng 裯g V� H皀 m� r祅g k� n錸g th� h鱟 t k� n錸g m� r祅g th� hai.")
			AddText(sceneId,"V� h皀 c b 5, c� th� th鬾g qua t呓ng 裯g V� H皀 m� r祅g k� n錸g th� h鱟 t k� n錸g m� r祅g th� ba, s� d鴑g t呓ng 裯g k� n錸g th� th錸g c th� hai m� r祅g k� n錸g.")
			AddText(sceneId,"V� h皀 th錸g c m� r祅g k� n錸g t鵼 v� h皀 c b m� n鈔g cao.")

			AddNumText(sceneId,x892002_g_ScriptId,"H鱟 t H� - Tr� Ho鉵 (C 1)",6,32)
			AddNumText(sceneId,x892002_g_ScriptId,"H鱟 t H� - M課 L馽 (C 1)",6,33)
			AddNumText(sceneId,x892002_g_ScriptId,"H鱟 t H� - Ph� Gi醦 (C 1)",6,34)
			AddNumText(sceneId,x892002_g_ScriptId,"H鱟 t H� - H骯 Kh� (C 1)",6,35)
			AddNumText(sceneId,x892002_g_ScriptId,"Quay l読",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 18 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{WH_NPC_8}")
			AddNumText(sceneId,x892002_g_ScriptId,"L頽h ng� B誳 - Th痠 B錸g",6,43)
			AddNumText(sceneId,x892002_g_ScriptId,"L頽h ng� B誳 - L鏼 H鯽",6,44)
			AddNumText(sceneId,x892002_g_ScriptId,"L頽h ng� B誳 - Tr鵱g Huy玭",6,45)
			AddNumText(sceneId,x892002_g_ScriptId,"L頽h ng� B誳 - K竎h 械c",6,46)
			AddNumText(sceneId,x892002_g_ScriptId,"Quay l読",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 19 then
		BeginEvent(sceneId)
			AddText(sceneId,"M秈 l馻 ch鱪 th錸g c V� H皀 k� n錸g!")
			AddText(sceneId,"V� h皀 c b 4, c� th� th鬾g qua t呓ng 裯g V� H皀 m� r祅g k� n錸g th� h鱟 t k� n錸g m� r祅g th� hai.")
			AddText(sceneId,"V� h皀 c b 5, c� th� th鬾g qua t呓ng 裯g V� H皀 m� r祅g k� n錸g th� h鱟 t k� n錸g m� r祅g th� ba, s� d鴑g t呓ng 裯g k� n錸g th� th錸g c th� hai m� r祅g k� n錸g.")
			AddText(sceneId,"V� h皀 th錸g c m� r祅g k� n錸g t鵼 v� h皀 c b m� n鈔g cao.")

			AddNumText(sceneId,x892002_g_ScriptId,"Th錸g c L誧 - Ng遪g S呓ng (C 4)",6,36)
			AddNumText(sceneId,x892002_g_ScriptId,"Th錸g c L誧 - Nghi畃 H鯽 (C 4)",6,37)
			AddNumText(sceneId,x892002_g_ScriptId,"Th錸g c L誧 - S L鬷 (C 4)",6,38)
			AddNumText(sceneId,x892002_g_ScriptId,"Th錸g c L誧 - Ph� C痶 (C 4)",6,39)
			AddNumText(sceneId,x892002_g_ScriptId,"Th錸g c Di畉 - L鏼 S呓ng (C 5)",6,40)
			AddNumText(sceneId,x892002_g_ScriptId,"Th錸g c Di畉 - 懈a H鯽 (C 5)",6,41)
			AddNumText(sceneId,x892002_g_ScriptId,"Th錸g c Di畉 - Thi阯 L鬷 (C 5)",6,42)
			AddNumText(sceneId,x892002_g_ScriptId,"Th錸g c Di畉 - Ch 械c (C 5)",6,43)
			AddNumText(sceneId,x892002_g_ScriptId,"Quay l読",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 20 then
		BeginEvent(sceneId)
			AddText(sceneId,"V� h皀 c b 4, c� th� th鬾g qua t呓ng 裯g V� H皀 m� r祅g k� n錸g th� h鱟 t k� n錸g m� r祅g th� hai.")
			AddText(sceneId,"V� h皀 c b 5, c� th� th鬾g qua t呓ng 裯g V� H皀 m� r祅g k� n錸g th� h鱟 t k� n錸g m� r祅g th� ba, s� d鴑g t呓ng 裯g k� n錸g th� th錸g c th� hai m� r祅g k� n錸g.")
			AddText(sceneId,"V� h皀 th錸g c m� r祅g k� n錸g t鵼 v� h皀 c b m� n鈔g cao.")
			AddNumText(sceneId,x892002_g_ScriptId,"Th錸g c Ng� - V� Gi醦 (C 2)",6,44)
			AddNumText(sceneId,x892002_g_ScriptId,"Quay l読",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 21 then
		BeginEvent(sceneId)
			AddText(sceneId,"C b V� H皀 鹫t t緄 3 c, m緄 c� th� ti猲 giai v� h皀 c b. Ph痠 h䅟 s� d鴑g H皀 B錸g Ch鈛 c鵱g Nhu H皀 Th誧h 餰m ng� dao b鄋 鸬t ph� t緄 c 4, V� H皀 sau khi 鸬t ph� th鄋h c鬾g m� ra thu礳 t韓h #GTh� hai, th� 3 #Wc鵱g #Gm� r祅g k� n錸g#W, h絥 n鎍 m� r祅g thu礳 t韓h c鵱g m� r祅g k� n錸g hi畊 qu� t鵼 v� h皀 c b m� n鈔g cao.")
			AddNumText(sceneId,x892002_g_ScriptId,"M� r祅g thu礳 t韓h V� H皀 c 4 (B錸g)",6,45)
			AddNumText(sceneId,x892002_g_ScriptId,"M� r祅g thu礳 t韓h V� H皀 c 4 (H鯽)",6,46)
			AddNumText(sceneId,x892002_g_ScriptId,"M� r祅g thu礳 t韓h V� H皀 c 4 (Huy玭)",6,47)
			AddNumText(sceneId,x892002_g_ScriptId,"M� r祅g thu礳 t韓h V� H皀 c 4 (械c)",6,48)
			AddNumText(sceneId,x892002_g_ScriptId,"Quay l読",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 22 then
		BeginEvent(sceneId)
			AddText(sceneId,"C b V� H皀 鹫t t緄 3 c, m緄 c� th� ti猲 giai v� h皀 c b. Ph痠 h䅟 s� d鴑g H皀 B錸g Ch鈛 c鵱g Nhu H皀 Th誧h 餰m ng� dao b鄋 鸬t ph� t緄 c 4, V� H皀 sau khi 鸬t ph� th鄋h c鬾g m� ra thu礳 t韓h #GTh� hai, th� 3 #Wc鵱g #Gm� r祅g k� n錸g#W, h絥 n鎍 m� r祅g thu礳 t韓h c鵱g m� r祅g k� n錸g hi畊 qu� t鵼 v� h皀 c b m� n鈔g cao.")
			AddNumText(sceneId,x892002_g_ScriptId,"M� r祅g thu礳 t韓h V� H皀 c 5 (B錸g)",6,49)
			AddNumText(sceneId,x892002_g_ScriptId,"M� r祅g thu礳 t韓h V� H皀 c 5 (H鯽)",6,50)
			AddNumText(sceneId,x892002_g_ScriptId,"M� r祅g thu礳 t韓h V� H皀 c 5 (Huy玭)",6,51)
			AddNumText(sceneId,x892002_g_ScriptId,"M� r祅g thu礳 t韓h V� H皀 c 5 (械c)",6,52)
			AddNumText(sceneId,x892002_g_ScriptId,"Quay l読",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 23 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10156114)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910015)
		c2 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910035)
              if c0 >=1 and c1 >=3 and c2 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10156114,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,39910015,3)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,39910035,1)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10156118, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, v� h皀 th錸g c th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊!"
		     x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 24 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10156118)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910016)
		c2 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910034)
              if c0 >=1 and c1 >=3 and c2 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10156118,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,39910016,3)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,39910034,1)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10156122, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, v� h皀 th錸g c th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊!"
		     x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 25 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10156115)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910015)
		c2 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910035)
              if c0 >=1 and c1 >=3 and c2 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10156115,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,39910015,3)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,39910035,1)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10156119, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, v� h皀 th錸g c th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊!"
		     x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 26 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10156119)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910016)
		c2 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910034)
              if c0 >=1 and c1 >=3 and c2 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10156119,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,39910016,3)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,39910034,1)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10156123, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, v� h皀 th錸g c th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊!"
		     x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 27 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10156116)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910015)
		c2 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910035)
              if c0 >=1 and c1 >=3 and c2 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10156116,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,39910015,3)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,39910035,1)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10156120, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, v� h皀 th錸g c th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊!"
		     x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 28 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10156120)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910016)
		c2 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910034)
              if c0 >=1 and c1 >=3 and c2 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10156120,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,39910016,3)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,39910034,1)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10156124, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, v� h皀 th錸g c th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊!"
		     x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 29 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10156117)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910015)
		c2 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910035)
              if c0 >=1 and c1 >=3 and c2 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10156117,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,39910015,3)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,39910035,1)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10156121, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, v� h皀 th錸g c th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊!"
		     x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 30 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10156121)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910016)
		c2 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910034)
              if c0 >=1 and c1 >=3 and c2 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10156121,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,39910016,3)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,39910034,1)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10156125, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, v� h皀 th錸g c th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊!"
		     x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 31 then
		c0 = GetItemCount(sceneId, selfId, 10156118)
		c1 = GetItemCount(sceneId, selfId, 10156119)
		c2 = GetItemCount(sceneId, selfId, 10156120)
		c3 = GetItemCount(sceneId, selfId, 10156121)
              if c0 >=1 or c1 >=1 or c2 >=1 or c1 >=1 then
		      c4 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910029)
		      if  c4 < 1  then
		          strNotice = "#YNg鄆 kh鬾g V� H皀 k� n錸g th�, kh鬾g th� h鱟 t!!"
		          x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
			   return
		      end
		      if  HaveSkill(sceneId, selfId, 1720) > 0  then
		          strNotice = "#YNg呓i 疸 h鱟 t k� n錸g n鄖, kh鬾g c h鱟 l読!!"
		          x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
			   return
		      end
		      --if  HaveSkill(sceneId, selfId, 1702) > 0  then
			   --DelSkill(sceneId, selfId, 1702)
		      --end
			AddSkill(  sceneId, selfId, 1720)
			LuaFnDelAvailableItem(sceneId,selfId,39910029,1)--删除物品
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh鷆 m譶g ng呓i, v� h皀 k� n錸g l頽h ng� th鄋h c鬾g!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi猽 Nguy阯 li畊!"
		     x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 32 then
		c0 = GetItemCount(sceneId, selfId, 10156122)
		c1 = GetItemCount(sceneId, selfId, 10156123)
		c2 = GetItemCount(sceneId, selfId, 10156124)
		c3 = GetItemCount(sceneId, selfId, 10156125)
              if c0 >=1 or c1 >=1 or c2 >=1 or c1 >=1 then
		      c4 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910030)
		      if  c4 < 1  then
		          strNotice = "#YNg鄆 kh鬾g V� H皀 k� n錸g th�, kh鬾g th� h鱟 t!!"
		          x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
			   return
		      end
		      if  HaveSkill(sceneId, selfId, 1722) > 0  then
		          strNotice = "#YNg呓i 疸 h鱟 t k� n錸g n鄖, kh鬾g c h鱟 l読!!"
		          x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
			   return
		      end
		      --if  HaveSkill(sceneId, selfId, 1702) > 0  then
			   --DelSkill(sceneId, selfId, 1702)
		      --end
			AddSkill(  sceneId, selfId, 1722)
			LuaFnDelAvailableItem(sceneId,selfId,39910030,1)--删除物品
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh鷆 m譶g ng呓i, v� h皀 k� n錸g l頽h ng� th鄋h c鬾g!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi猽 Nguy阯 li畊!"
		     x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 33 then
		c0 = GetItemCount(sceneId, selfId, 10156122)
		c1 = GetItemCount(sceneId, selfId, 10156123)
		c2 = GetItemCount(sceneId, selfId, 10156124)
		c3 = GetItemCount(sceneId, selfId, 10156125)
              if c0 >=1 or c1 >=1 or c2 >=1 or c1 >=1 then
		      c4 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910031)
		      if  c4 < 1  then
		          strNotice = "#YNg鄆 kh鬾g V� H皀 k� n錸g th�, kh鬾g th� h鱟 t!!"
		          x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
			   return
		      end
		      if  HaveSkill(sceneId, selfId, 1723) > 0  then
		          strNotice = "#YNg呓i 疸 h鱟 t k� n錸g n鄖, kh鬾g c h鱟 l読!!"
		          x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
			   return
		      end
		      --if  HaveSkill(sceneId, selfId, 1702) > 0  then
			   --DelSkill(sceneId, selfId, 1702)
		      --end
			AddSkill(  sceneId, selfId, 1723)
			LuaFnDelAvailableItem(sceneId,selfId,39910031,1)--删除物品
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh鷆 m譶g ng呓i, v� h皀 k� n錸g l頽h ng� th鄋h c鬾g!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi猽 Nguy阯 li畊!"
		     x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 34 then
		c0 = GetItemCount(sceneId, selfId, 10156122)
		c1 = GetItemCount(sceneId, selfId, 10156123)
		c2 = GetItemCount(sceneId, selfId, 10156124)
		c3 = GetItemCount(sceneId, selfId, 10156125)
              if c0 >=1 or c1 >=1 or c2 >=1 or c1 >=1 then
		      c4 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910032)
		      if  c4 < 1  then
		          strNotice = "#YNg鄆 kh鬾g V� H皀 k� n錸g th�, kh鬾g th� h鱟 t!!"
		          x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
			   return
		      end
		      if  HaveSkill(sceneId, selfId, 1724) > 0  then
		          strNotice = "#YNg呓i 疸 h鱟 t k� n錸g n鄖, kh鬾g c h鱟 l読!!"
		          x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
			   return
		      end
		      --if  HaveSkill(sceneId, selfId, 1702) > 0  then
			   --DelSkill(sceneId, selfId, 1702)
		      --end
			AddSkill(  sceneId, selfId, 1724)
			LuaFnDelAvailableItem(sceneId,selfId,39910032,1)--删除物品
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh鷆 m譶g ng呓i, v� h皀 k� n錸g l頽h ng� th鄋h c鬾g!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi猽 Nguy阯 li畊!"
		     x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 35 then
		c0 = GetItemCount(sceneId, selfId, 10156122)
		c1 = GetItemCount(sceneId, selfId, 10156123)
		c2 = GetItemCount(sceneId, selfId, 10156124)
		c3 = GetItemCount(sceneId, selfId, 10156125)
              if c0 >=1 or c1 >=1 or c2 >=1 or c1 >=1 then
		      c4 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910033)
		      if  c4 < 1  then
		          strNotice = "#YNg鄆 kh鬾g V� H皀 k� n錸g th�, kh鬾g th� h鱟 t!!"
		          x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
			   return
		      end
		      if  HaveSkill(sceneId, selfId, 1725) > 0  then
		          strNotice = "#YNg呓i 疸 h鱟 t k� n錸g n鄖, kh鬾g c h鱟 l読!!"
		          x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
			   return
		      end
		      --if  HaveSkill(sceneId, selfId, 1702) > 0  then
			   --DelSkill(sceneId, selfId, 1702)
		      --end
			AddSkill(  sceneId, selfId, 1725)
			LuaFnDelAvailableItem(sceneId,selfId,39910033,1)--删除物品
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh鷆 m譶g ng呓i, v� h皀 k� n錸g l頽h ng� th鄋h c鬾g!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi猽 Nguy阯 li畊!"
		     x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 36 then
		c0 = GetItemCount(sceneId, selfId, 10156118)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910041)
              if c0 >=1 and c1 >=1 then
		      if  HaveSkill(sceneId, selfId, 1712) > 0  then
		          strNotice = "#YNg呓i 疸 h鱟 t k� n錸g n鄖, kh鬾g c h鱟 l読!!"
		          x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
			   return
		      end
		      if  HaveSkill(sceneId, selfId, 1708) > 0  then
			   DelSkill(sceneId, selfId, 1708)
		      end
			AddSkill(  sceneId, selfId, 1712)
			LuaFnDelAvailableItem(sceneId,selfId,39910041,1)--删除物品
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh鷆 m譶g ng呓i, v� h皀 k� n錸g l頽h ng� th鄋h c鬾g!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi猽 Nguy阯 li畊!"
		     x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 37 then
		c0 = GetItemCount(sceneId, selfId, 10156119)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910042)
              if c0 >=1 and c1 >=1 then
		      if  HaveSkill(sceneId, selfId, 1713) > 0  then
		          strNotice = "#YNg呓i 疸 h鱟 t k� n錸g n鄖, kh鬾g c h鱟 l読!!"
		          x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
			   return
		      end
		      if  HaveSkill(sceneId, selfId, 1709) > 0  then
			   DelSkill(sceneId, selfId, 1709)
		      end
			AddSkill(  sceneId, selfId, 1713)
			LuaFnDelAvailableItem(sceneId,selfId,39910042,1)--删除物品
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh鷆 m譶g ng呓i, v� h皀 k� n錸g l頽h ng� th鄋h c鬾g!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi猽 Nguy阯 li畊!"
		     x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 38 then
		c0 = GetItemCount(sceneId, selfId, 10156120)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910043)
              if c0 >=1 and c1 >=1 then
		      if  HaveSkill(sceneId, selfId, 1714) > 0  then
		          strNotice = "#YNg呓i 疸 h鱟 t k� n錸g n鄖, kh鬾g c h鱟 l読!!"
		          x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
			   return
		      end
		      if  HaveSkill(sceneId, selfId, 1710) > 0  then
			   DelSkill(sceneId, selfId, 1710)
		      end
			AddSkill(  sceneId, selfId, 1714)
			LuaFnDelAvailableItem(sceneId,selfId,39910043,1)--删除物品
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh鷆 m譶g ng呓i, v� h皀 k� n錸g l頽h ng� th鄋h c鬾g!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi猽 Nguy阯 li畊!"
		     x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 39 then
		c0 = GetItemCount(sceneId, selfId, 10156121)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910044)
              if c0 >=1 and c1 >=1 then
		      if  HaveSkill(sceneId, selfId, 1715) > 0  then
		          strNotice = "#YNg呓i 疸 h鱟 t k� n錸g n鄖, kh鬾g c h鱟 l読!!"
		          x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
			   return
		      end
		      if  HaveSkill(sceneId, selfId, 1711) > 0  then
			   DelSkill(sceneId, selfId, 1711)
		      end
			AddSkill(  sceneId, selfId, 1715)
			LuaFnDelAvailableItem(sceneId,selfId,39910044,1)--删除物品
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh鷆 m譶g ng呓i, v� h皀 k� n錸g l頽h ng� th鄋h c鬾g!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi猽 Nguy阯 li畊!"
		     x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 40 then
		c0 = GetItemCount(sceneId, selfId, 10156122)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910045)
              if c0 >=1 and c1 >=1 then
		      if  HaveSkill(sceneId, selfId, 1716) > 0  then
		          strNotice = "#YNg呓i 疸 h鱟 t k� n錸g n鄖, kh鬾g c h鱟 l読!!"
		          x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
			   return
		      end
		      if  HaveSkill(sceneId, selfId, 1712) > 0  then
			   DelSkill(sceneId, selfId, 1712)
		      end
			AddSkill(  sceneId, selfId, 1716)
			LuaFnDelAvailableItem(sceneId,selfId,39910045,1)--删除物品
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh鷆 m譶g ng呓i, v� h皀 k� n錸g l頽h ng� th鄋h c鬾g!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi猽 Nguy阯 li畊!"
		     x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 41 then
		c0 = GetItemCount(sceneId, selfId, 10156123)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910046)
              if c0 >=1 and c1 >=1 then
		      if  HaveSkill(sceneId, selfId, 1717) > 0  then
		          strNotice = "#YNg呓i 疸 h鱟 t k� n錸g n鄖, kh鬾g c h鱟 l読!!"
		          x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
			   return
		      end
		      if  HaveSkill(sceneId, selfId, 1713) > 0  then
			   DelSkill(sceneId, selfId, 1713)
		      end
			AddSkill(  sceneId, selfId, 1717)
			LuaFnDelAvailableItem(sceneId,selfId,39910046,1)--删除物品
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh鷆 m譶g ng呓i, v� h皀 k� n錸g l頽h ng� th鄋h c鬾g!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi猽 Nguy阯 li畊!"
		     x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 42 then
		c0 = GetItemCount(sceneId, selfId, 10156124)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910047)
              if c0 >=1 and c1 >=1 then
		      if  HaveSkill(sceneId, selfId, 1718) > 0  then
		          strNotice = "#YNg呓i 疸 h鱟 t k� n錸g n鄖, kh鬾g c h鱟 l読!!"
		          x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
			   return
		      end
		      if  HaveSkill(sceneId, selfId, 1714) > 0  then
			   DelSkill(sceneId, selfId, 1714)
		      end
			AddSkill(  sceneId, selfId, 1718)
			LuaFnDelAvailableItem(sceneId,selfId,39910047,1)--删除物品
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh鷆 m譶g ng呓i, v� h皀 k� n錸g l頽h ng� th鄋h c鬾g!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi猽 Nguy阯 li畊!"
		     x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 43 then
		c0 = GetItemCount(sceneId, selfId, 10156125)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910048)
              if c0 >=1 and c1 >=1 then
		      if  HaveSkill(sceneId, selfId, 1719) > 0  then
		          strNotice = "#YNg呓i 疸 h鱟 t k� n錸g n鄖, kh鬾g c h鱟 l読!!"
		          x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
			   return
		      end
		      if  HaveSkill(sceneId, selfId, 1715) > 0  then
			   DelSkill(sceneId, selfId, 1715)
		      end
			AddSkill(  sceneId, selfId, 1719)
			LuaFnDelAvailableItem(sceneId,selfId,39910048,1)--删除物品
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh鷆 m譶g ng呓i, v� h皀 k� n錸g l頽h ng� th鄋h c鬾g!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi猽 Nguy阯 li畊!"
		     x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 44 then
		c0 = GetItemCount(sceneId, selfId, 10156122)
		c1 = GetItemCount(sceneId, selfId, 10156123)
		c2 = GetItemCount(sceneId, selfId, 10156124)
		c3 = GetItemCount(sceneId, selfId, 10156125)
              if c0 >=1 or c1 >=1 or c2 >=1 or c1 >=1 then
		      c4 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910040)
		      if  c4 < 1  then
		          strNotice = "#YNg鄆 kh鬾g V� H皀 k� n錸g th�, kh鬾g th� h鱟 t!!"
		          x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
			   return
		      end
		      if  HaveSkill(sceneId, selfId, 1721) > 0  then
		          strNotice = "#YNg呓i 疸 h鱟 t k� n錸g n鄖, kh鬾g c h鱟 l読!!"
		          x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
			   return
		      end
		      if  HaveSkill(sceneId, selfId, 1720) <= 0  then
		          strNotice = "#Y您必须先H鱟 t Ng� - Thu鏽 Gi醦 ，才能升级此技能！！"
		          x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
			   return
		      end
		      if  HaveSkill(sceneId, selfId, 1720) > 0  then
			   DelSkill(sceneId, selfId, 1720)
		      end
			AddSkill(  sceneId, selfId, 1721)
			LuaFnDelAvailableItem(sceneId,selfId,39910040,1)--删除物品
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh鷆 m譶g ng呓i, v� h皀 k� n錸g l頽h ng� th鄋h c鬾g!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi猽 Nguy阯 li畊!"
		     x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 45 then
		c0 = GetItemCount(sceneId, selfId, 10156118)
              if c0 >=1 then
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 25032, 0)
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh鷆 m譶g ng呓i, v� h皀 m� r祅g thu礳 t韓h th鄋h c鬾g!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi猽 Nguy阯 li畊!"
		     x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 46 then
		c0 = GetItemCount(sceneId, selfId, 10156119)
              if c0 >=1 then
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 25033, 0)
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh鷆 m譶g ng呓i, v� h皀 m� r祅g thu礳 t韓h th鄋h c鬾g!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi猽 Nguy阯 li畊!"
		     x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 47 then
		c0 = GetItemCount(sceneId, selfId, 10156120)
              if c0 >=1 then
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 25034, 0)
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh鷆 m譶g ng呓i, v� h皀 m� r祅g thu礳 t韓h th鄋h c鬾g!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi猽 Nguy阯 li畊!"
		     x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 48 then
		c0 = GetItemCount(sceneId, selfId, 10156121)
              if c0 >=1 then
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 25035, 0)
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh鷆 m譶g ng呓i, v� h皀 m� r祅g thu礳 t韓h th鄋h c鬾g!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi猽 Nguy阯 li畊!"
		     x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 49 then
		c0 = GetItemCount(sceneId, selfId, 10156122)
              if c0 >=1 then
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 25040, 0)
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh鷆 m譶g ng呓i, v� h皀 m� r祅g thu礳 t韓h th鄋h c鬾g!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi猽 Nguy阯 li畊!"
		     x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 50 then
		c0 = GetItemCount(sceneId, selfId, 10156123)
              if c0 >=1 then
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 25041, 0)
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh鷆 m譶g ng呓i, v� h皀 m� r祅g thu礳 t韓h th鄋h c鬾g!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi猽 Nguy阯 li畊!"
		     x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 51 then
		c0 = GetItemCount(sceneId, selfId, 10156124)
              if c0 >=1 then
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 25042, 0)
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh鷆 m譶g ng呓i, v� h皀 m� r祅g thu礳 t韓h th鄋h c鬾g!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi猽 Nguy阯 li畊!"
		     x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 52 then
		c0 = GetItemCount(sceneId, selfId, 10156125)
              if c0 >=1 then
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 25043, 0)
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh鷆 m譶g ng呓i, v� h皀 m� r祅g thu礳 t韓h th鄋h c鬾g!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi猽 Nguy阯 li畊!"
		     x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x892002_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x892002_g_eventList do
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
function x892002_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x892002_g_eventList do
		if missionScriptId == findId then
			x892002_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x892002_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x892002_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x892002_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x892002_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x892002_OnDie( sceneId, selfId, killerId )
end




--**********************************
--判断是否能够学习
--nSkillIndex参数可能值为：40，70，90，分别学习对应级别的技能
--**********************************
function x892002_CheckStudyDarkSkills( sceneId, selfId, targetId, nSkillIndex )
	
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
		x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	--判断是否已经学会了对应技能
	if  (HaveSkill(sceneId, selfId, x892002_g_DarkSkillName[nSkillIndex].id) > 0 ) then
		if (nSkillIndex == 40) then
			strNotice = "#{FBSJ_081209_26}";
		elseif (nSkillIndex == 70) then
			strNotice = "#{FBSJ_081209_28}";
		elseif (nSkillIndex == 90) then
			strNotice = "#{FBSJ_081209_30}";
		end
		x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	--判断玩家身上是否有足够的钱
	local nHaveMoney = GetMoney(sceneId, selfId) + GetMoneyJZ(sceneId, selfId);
	if (nHaveMoney < x892002_g_DarkSkillName[nSkillIndex].needmoney) then    --10金
		strNotice = "#{FBSJ_081209_25}";
		x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	return 1;
	
end

--**********************************
--玩家找NPC学习暗器使用技能
--nSkillIndex参数可能值为：40，70，90，分别学习对应级别的技能
--**********************************
function x892002_StudyDarkSkills( sceneId, selfId, targetId, nSkillIndex )
	
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
		x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	--判断是否已经学会了对应技能
	if  (HaveSkill(sceneId, selfId, x892002_g_DarkSkillName[nSkillIndex].id) > 0 ) then
		if (nSkillIndex == 40) then
			strNotice = "#{FBSJ_081209_26}";
		elseif (nSkillIndex == 70) then
			strNotice = "#{FBSJ_081209_28}";
		elseif (nSkillIndex == 90) then
			strNotice = "#{FBSJ_081209_30}";
		end
		x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	--判断玩家身上是否有足够的钱
	local nHaveMoney = GetMoney(sceneId, selfId) + GetMoneyJZ(sceneId, selfId);
	if (nHaveMoney < x892002_g_DarkSkillName[nSkillIndex].needmoney) then    --10金
		strNotice = "#{FBSJ_081209_25}";
		x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
		return
	end
	
	--上面判断都通过，可以扣钱给技能了
	local nRet, nRetJB = LuaFnCostMoneyWithPriority(sceneId, selfId, x892002_g_DarkSkillName[nSkillIndex].needmoney);
	if (nRet == -1) then
		strNotice = "#{FBSJ_081209_25}";
		x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	AddSkill(  sceneId, selfId, x892002_g_DarkSkillName[nSkillIndex].id)
	x892002_ShowNotice(sceneId, selfId, targetId, x892002_g_DarkSkillTips[nSkillIndex]);
	x892002_NotifyTips( sceneId, selfId, x892002_g_DarkSkillTips[nSkillIndex] )
	
	x892002_StudySkillImpact(sceneId, selfId)
	DarkOperateResult(sceneId, selfId, 5, 1);    --让技能按钮闪烁
	
end


--**********************************
-- 屏幕中间信息提示
--**********************************
function x892002_NotifyTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end


--**********************************
--玩家是否满足暗器瓶颈条件
--返回值：0或者1，1为满足，0
--**********************************
function x892002_CheckDarkReachPoint(sceneId, selfId, targetId)
		
		local strInfo = "";
		--判断玩家身上是否装备有暗器
		local bHaveDarkEquip = HaveDarkEquiped(sceneId, selfId);
		if ( bHaveDarkEquip ~= 1) then
			strInfo = "#{FBSJ_081209_13}";
			x892002_ShowNotice(sceneId, selfId, targetId, strInfo);
			return 0;
		end
		
		--判断玩家身上暗器是否达到瓶颈
		local bNeedNPC = IsDarkNeedLevelUpByNpcNow(sceneId, selfId);
		if (bNeedNPC ~= 1) then
			strInfo = "#{FBSJ_081209_14}";
			x892002_ShowNotice(sceneId, selfId, targetId, strInfo);
			return 0;
		end
		
		--判断玩家等级是否和暗器等级相等或者没有暗器等级高
		local nDarkLevel = GetDarkLevel(sceneId, selfId);
		local nCharLevel = GetLevel(sceneId, selfId);
		if (nDarkLevel >= nCharLevel) then
			strInfo = "#{FBSJ_081209_15}";
			x892002_ShowNotice(sceneId, selfId, targetId, strInfo);
			return 0;
		end
		
		--判断玩家身上是否有足够的钱
		local nDarkLevel = GetDarkLevel(sceneId, selfId);
		local nNeedMoney = x892002_g_DarkBreachPointNeedMoney[nDarkLevel];
		if (nNeedMoney == nil or nNeedMoney <= 0) then
			nNeedMoney = 100000;         --以防万一，并没什么用
		end
		local nHaveMoney = GetMoney(sceneId, selfId) + GetMoneyJZ(sceneId, selfId);
		if (nHaveMoney < nNeedMoney) then    --10金
			strNotice = "#{FBSJ_081209_25}";
			x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
			return 0;
		end
				
		return 1;
end


function x892002_BreachDarkPoint(sceneId, selfId, targetId)

	local strInfo = "";
	--判断玩家身上是否装备有暗器
	local bHaveDarkEquip = HaveDarkEquiped(sceneId, selfId);
	if ( bHaveDarkEquip ~= 1) then
		strInfo = "#{FBSJ_081209_13}";
		x892002_ShowNotice(sceneId, selfId, targetId, strInfo);
		return 0;
	end
		
	--判断玩家身上暗器是否达到瓶颈
	local bNeedNPC = IsDarkNeedLevelUpByNpcNow(sceneId, selfId);
	if (bNeedNPC ~= 1) then
		strInfo = "#{FBSJ_081209_14}";
		x892002_ShowNotice(sceneId, selfId, targetId, strInfo);
		return 0;
	end
		
	--判断玩家等级是否和暗器等级相等或者没有暗器等级高
	local nDarkLevel = GetDarkLevel(sceneId, selfId);
	local nCharLevel = GetLevel(sceneId, selfId);
	if (nDarkLevel >= nCharLevel) then
		strInfo = "#{FBSJ_081209_15}";
		x892002_ShowNotice(sceneId, selfId, targetId, strInfo);
		return 0;
	end
		
			--判断玩家身上是否有足够的钱
	local nDarkLevel = GetDarkLevel(sceneId, selfId);
	local nNeedMoney = x892002_g_DarkBreachPointNeedMoney[nDarkLevel];
	if (nNeedMoney == nil or nNeedMoney <= 0) then
		nNeedMoney = 100000;         --以防万一，并没什么用
	end
	local nHaveMoney = GetMoney(sceneId, selfId) + GetMoneyJZ(sceneId, selfId);
	if (nHaveMoney < nNeedMoney) then    --10金
		strNotice = "#{FBSJ_081209_25}";
		x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	--上面判断都通过，可以扣钱突破了
	local nRet, nRetJB = LuaFnCostMoneyWithPriority(sceneId, selfId, nNeedMoney);
	if (nRet == -1) then
		strNotice = "#{FBSJ_081209_25}";
		x892002_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	--突破瓶颈，让暗器升级
	local bDarkLevelup = DarkLevelUp(sceneId, selfId);
	if (bDarkLevelup == 1) then
		x892002_ShowNotice(sceneId, selfId, targetId, "#{FBSJ_081209_18}");
		--突破成功，记录统计日志
			local guid = LuaFnObjId2Guid(sceneId, selfId);
			local sLog = format("dark level now: %d", nDarkLevel + 1); 
			ScriptGlobal_AuditGeneralLog(LUAAUDIT_ANQITUPO, guid, sLog);
	else
		x892002_ShowNotice(sceneId, selfId, targetId, "械t ph� th b読");
	end
	
	return
end

function x892002_ShowNotice( sceneId, selfId, targetId, strNotice)
	BeginEvent( sceneId )
		AddText( sceneId, strNotice )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

function x892002_StudySkillImpact(sceneId, playerId)
	--显示学习到新技能的特效 目前使用升级特效
	LuaFnSendSpecificImpactToUnit(sceneId, playerId, playerId, playerId, 32407, 0 )
end

