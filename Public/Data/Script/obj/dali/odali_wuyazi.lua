--洛阳NPC
--燕青
--普通

--脚本号
x892000_g_ScriptId = 892000

--所拥有的事件ID列表
x892000_g_eventList={}


x892000_g_DarkSkillName = { [40] = {name = "N閙 羗 kh�", id = 274, needmoney = 20000},
                            [70] = {name = "羗 kh� 痄 huy畉", id = 275, needmoney = 100000},
                            [90] = {name = "羗 kh� h� th�", id = 276, needmoney = 500000},
                          }                
x892000_g_DarkSkillTips = { [40] = "#{FBSJ_090106_89}",
                            [70] = "#{FBSJ_090106_90}",
                            [90] = "#{FBSJ_090106_91}",
                          }  
x892000_g_DarkBreachPointNeedMoney = 
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
function x892000_UpdateEventList( sceneId, selfId,targetId )
    local  PlayerName=GetName(sceneId,selfId)	
	local  PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex = "姑娘"
	else
		PlayerSex = "少侠"
	end
	BeginEvent(sceneId)
		AddText(sceneId,"Ng鄆 h鋙, thi猽 hi畃 hay kh鬾g c鹡g nghe qu�: V� ph� rg m鈟 瘀 kinh nh nguy畉, h皀 l鈓 thi阯 v� nhi猵 C鄋 Kh鬾. Ta 鸠i v� h皀 n鄖 b鋙 v xem nh� l唼c c� nghi阯 c製, n猽 ng鄆 mu痭 nghe 疬㧟, ta nh 鸶nh tri v� b ng鬾, ng鬾 v� b t鏽.")
		for i, eventId in x892000_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
		
		AddNumText(sceneId,x892000_g_ScriptId,"Th錸g c V� H皀",6,7)
		AddNumText(sceneId,x892000_g_ScriptId,"L頽h ng� k� n錸g V� H皀",6,8)
		AddNumText(sceneId,x892000_g_ScriptId,"M� r祅g thu礳 t韓h V� H皀",6,9)
		AddNumText(sceneId,x892000_g_ScriptId,"V� h皀 thuy猼 minh",8,888)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x892000_OnDefaultEvent( sceneId, selfId,targetId )
	x892000_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x892000_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x892000_g_eventList do
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
			AddNumText(sceneId,x892000_g_ScriptId,"V� H皀",6,666)
			AddNumText(sceneId,x892000_g_ScriptId,"L鄊 sao c� V� H皀",6,667)
			AddNumText(sceneId,x892000_g_ScriptId,"L鄊 sao th錸g c V� H皀",6,668)
			AddNumText(sceneId,x892000_g_ScriptId,"L鄊 th� n鄌 鹫t 疬㧟 V� H皀 t呓ng quan 鹫o c�",6,669)
			AddNumText(sceneId,x892000_g_ScriptId,"Gi緄 thi畊 m� r祅g thu礳 t韓h V� H皀",6,670)
			AddNumText(sceneId,x892000_g_ScriptId,"Gi緄 thi畊 V� H皀 c tinh",6,671)
			--AddNumText(sceneId,x892000_g_ScriptId,"C tinh t呓ng kh",6,672)
			AddNumText(sceneId,x892000_g_ScriptId,"Quay l読",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 666 then  --提升武魂等级
		BeginEvent(sceneId)
			AddText(sceneId,"Kh鬾g bi猼 qua bao nhi陁 n錷, Trung Nguy阯 v� l鈓 g 疬㧟 m祎 h癷 h誳 ki猵, � c叨ng 鹫i k� th� b阯 ngo鄆 ph韆 tr呔c, ch� t鬾 v� h皀 r痶 c鴆 th裞 t飊h, bi猲 鋙 ph鈔 th鈔 tr� th鄋h thi阯 thi阯 v課 v課 c醝 v� h皀 th� h� tu眎 tr� hi畃 s�, tr� th鄋h 鸢ng sinh c祅g t�. N猽 ng呓i may m chi猰 疬㧟 b鋙 v, ng呓i s� 鹫t 疬㧟 n錸g l馽 to鄋 di畁 m� r祅g c鵱g t錸g l阯, cho ng呓i 鹫t t緄 tr呔c nay ch遖 c� t鈔 c鋘h gi緄!")
			AddNumText(sceneId,x892000_g_ScriptId,"Quay l読",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif NumText == 667 then  --提升武魂等级
		BeginEvent(sceneId)
			AddText(sceneId,"#cfabf8fNh� th� n鄌 鹫t 疬㧟 v� h皀:#r #W � #G t� tuy畉 trang #W b鋘 sao trung 痄 b読 BOSS, c� nh 鸶nh t� l� 鹫t 疬㧟 #R v� h皀: Ng� dao b鄋 #W.")
			AddNumText(sceneId,x892000_g_ScriptId,"Quay l読",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif NumText == 668 then  --提升武魂等级
		BeginEvent(sceneId)
			AddText(sceneId,"#cfabf8fTh錸g c V� H皀:#r #WS� d鴑g #G3 #GH皀 B錸g Ch鈛 #Wc b t呓ng 裯g 瓞 ti猲 h鄋h th錸g c. V� H皀 sau khi th錸g c #RThu礳 t韓h#W, #RGi� tr� thu礳 t韓h V� H皀 m� r祅g.")
			AddNumText(sceneId,x892000_g_ScriptId,"Quay l読",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif NumText == 669 then  --提升武魂等级
		BeginEvent(sceneId)
			AddText(sceneId,"#cfabf8f#rNh� th� n鄌 鹫t 疬㧟 v� h皀 t呓ng quan 鹫o c�:#r#YC� th� � T� Tuy畉 Trang 瓞 ki猰 鹫o c� th錸g c V� H皀.")
			AddNumText(sceneId,x892000_g_ScriptId,"Quay l読",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif NumText == 670 then  --提升武魂等级
		BeginEvent(sceneId)
			AddText(sceneId,"#cfabf8fGi緄 thi畊 m� r祅g thu礳 t韓h V� H皀:#r #WS� d鴑g V� H皀 D竎h T呓ng 衋n, V� H皀 t� 鸬ng 鹫t 疬㧟 m祎 c醝 鸠i 裯g c tinh m� r祅g thu礳 t韓h #GGi鋗 kh醤g#W. V� h皀 c b c鄋g cao, m� r祅g thu礳 t韓h gi� tr� c鄋g l緉. C鄋g nhi玼  m� r祅g thu礳 t韓h 餰m t譶g b呔c 鸨i m緄 m� ra.")
			AddNumText(sceneId,x892000_g_ScriptId,"Quay l読",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif NumText == 671 then  --提升武魂等级
		BeginEvent(sceneId)
			AddText(sceneId,"#cfabf8fGi緄 thi畊 V� H皀 c tinh:#r#Y Nh� th� n鄌 鹫t 疬㧟 c tinh: #r#WS� d鴑g #GV� H皀 D竎h T呓ng 衋n #W瓞 ti猲 h鄋h c tinh. V� H皀 c tinh c� b錸g, h鯽, huy玭, 鸬c 4 lo読. C� th� t� do l馻 ch鱪 m祎 lo読, nh遪g v� h皀 疸 c tinh, kh鬾g th� 鸨i m緄 c tinh.")
			AddNumText(sceneId,x892000_g_ScriptId,"Quay l読",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif NumText == 672 then  --提升武魂等级
		BeginEvent(sceneId)
			AddText(sceneId,"#Y属相相克效果:　　#r#W属相相克的最终效果，在一定程度上受到武魂等级的影响。#r　　假使A、B两个玩家分别装备有两个武魂，A玩家的武魂克制B玩家的武魂。如果A玩家的武魂合成等级高于B玩家的武魂等级，伤害放大效果更加明显；如果A玩家的武魂等级低于B玩家的武魂等级，伤害放大效果将有所减弱。")
			AddNumText(sceneId,x892000_g_ScriptId,"Quay l読",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 7 then  --提升武魂等级
		BeginEvent(sceneId)
			AddText(sceneId,"Mu痭 Th錸g c V� H皀, tr呔c h猼 餰m v� h皀 #GCh� nh ch鷆 t呓ng#W, v� nh� th� n鄌 v� v� h皀 Ch� nh ch鷆 t呓ng, ng呓i c� th� t靘 ti瑄 鸢 nhi #GV� 邪ng #Wgi鷓 ng呓i.")
			AddText(sceneId,"Th錸g c V� H皀 #Gl緉 h絥 3#W, 皙n L� Th呓ng H鋓 ch� ti猲 h鄋h Th錸g c V� H皀 c cao.")
			AddText(sceneId,"#r#c00ffff(Thao t醕 Th錸g c V� H皀 ph鋓 th醥 g� b鋙 th誧h to鄋 b� xu痭g, n猽 kh鬾g b鋙 th誧h s� bi猲 m)")

			AddNumText(sceneId,x892000_g_ScriptId,"T錸g l阯 Ng� Dao B鄋 - B錸g",6,12)
			AddNumText(sceneId,x892000_g_ScriptId,"T錸g l阯 Ng� Dao B鄋 - H鯽",6,13)
			AddNumText(sceneId,x892000_g_ScriptId,"T錸g l阯 Ng� Dao B鄋 - Huy玭",6,14)
			AddNumText(sceneId,x892000_g_ScriptId,"T錸g l阯 Ng� Dao B鄋 - 械c",6,15)
			AddNumText(sceneId,x892000_g_ScriptId,"Quay l読",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		
	elseif NumText == 8 then  --领悟技能
		BeginEvent(sceneId)
			AddText(sceneId,"Ch� c� V� H皀 #Gc 1 h絥 #Wm緄 c� th� l頽h ng� k� n錸g, v� h皀 k� n錸g c鹡g chia l鄊 ba c b, 皤u c� 疬㧟 t� ch鷆 t呓ng k� n錸g, c鵱g c th鬾g qua t呓ng 裯g #GV� H皀 k� n錸g th� #Wc鵱g mang theo t呓ng 裯g #Rc b #Wc鵱g t呓ng 裯g #RCh鷆 T呓ng #Wv� h皀 t鄆 kh� l頽h ng�.")
			AddNumText(sceneId,x892000_g_ScriptId,"L頽h ng� V� H皀 k� n錸g (C 1)",6,16)
			AddNumText(sceneId,x892000_g_ScriptId,"L頽h ng� V� H皀 k� n錸g (C 2)",6,17)
			AddNumText(sceneId,x892000_g_ScriptId,"L頽h ng� V� H皀 k� n錸g (C 3)",6,18)
			AddNumText(sceneId,x892000_g_ScriptId,"Quay l読",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 9 then   --武魂扩展属性
		BeginEvent(sceneId)
			AddText(sceneId,"Ch� c� V� H皀 #Gc 1 h絥 #Wm緄 c� th� l頽h ng� k� n錸g, v� h皀 k� n錸g c鹡g chia l鄊 ba c b, 皤u c� 疬㧟 t� ch鷆 t呓ng k� n錸g, c鵱g c th鬾g qua t呓ng 裯g #GV� H皀 k� n錸g th� #Wc鵱g mang theo t呓ng 裯g #Rc b #Wc鵱g t呓ng 裯g #RCh鷆 T呓ng #Wv� h皀 t鄆 kh� l頽h ng�.")
			AddNumText(sceneId,x892000_g_ScriptId,"M� r祅g thu礳 t韓h V� H皀 (C 0)",6,19)
			AddNumText(sceneId,x892000_g_ScriptId,"M� r祅g thu礳 t韓h V� H皀 (C 1)",6,20)
			AddNumText(sceneId,x892000_g_ScriptId,"M� r祅g thu礳 t韓h V� H皀 (C 2)",6,21)
			AddNumText(sceneId,x892000_g_ScriptId,"M� r祅g thu礳 t韓h V� H皀 (C 3)",6,22)
			AddNumText(sceneId,x892000_g_ScriptId,"Quay l読",8,130)
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
			AddNumText(sceneId,x892000_g_ScriptId,"#{FBSJ_090311_03}",6,26)
			AddNumText(sceneId,x892000_g_ScriptId,"#{FBSJ_090311_04}",6,27)
			AddNumText(sceneId,x892000_g_ScriptId,"Quay l読",8,13)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 12 then                   --提升 冰 等级
		BeginEvent(sceneId)
			AddText(sceneId,"#{WH_NPC_3}")
			AddText(sceneId,"#r#c00ffff(Thao t醕 Th錸g c V� H皀 ph鋓 th醥 g� b鋙 th誧h to鄋 b� xu痭g, n猽 kh鬾g b鋙 th誧h s� bi猲 m)")
			AddNumText(sceneId,x892000_g_ScriptId,"T錸g l阯 Ng� Dao B鄋 - B錸g (C 1)",6,23)
			AddNumText(sceneId,x892000_g_ScriptId,"T錸g l阯 Ng� Dao B鄋 - B錸g (C 2)",6,24)
			AddNumText(sceneId,x892000_g_ScriptId,"T錸g l阯 Ng� Dao B鄋 - B錸g (C 3)",6,25)
			AddNumText(sceneId,x892000_g_ScriptId,"Quay l読",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 13 then                   --提升 火 等级
		BeginEvent(sceneId)
			AddText(sceneId,"#{WH_NPC_5}")
			AddText(sceneId,"#r#c00ffff(Thao t醕 Th錸g c V� H皀 ph鋓 th醥 g� b鋙 th誧h to鄋 b� xu痭g, n猽 kh鬾g b鋙 th誧h s� bi猲 m)")
			AddNumText(sceneId,x892000_g_ScriptId,"T錸g l阯 Ng� Dao B鄋 - H鯽 (C 1)",6,26)
			AddNumText(sceneId,x892000_g_ScriptId,"T錸g l阯 Ng� Dao B鄋 - H鯽 (C 2)",6,27)
			AddNumText(sceneId,x892000_g_ScriptId,"T錸g l阯 Ng� Dao B鄋 - H鯽 (C 3)",6,28)
			AddNumText(sceneId,x892000_g_ScriptId,"Quay l読",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		
	elseif NumText == 130 then
		x892000_OnDefaultEvent( sceneId, selfId,targetId )
	elseif NumText == 14 then
		BeginEvent(sceneId)
			AddText(sceneId,"Mu痭 thg c #RNg� Dao B鄋 - Huy玭#W, c s� d鴑g #G3#W c醝 #GH皀 B錸g Ch鈛 #Wm緄 疬㧟.#r T錸g l阯 t緄 (C 1) c #G3 #RH皀 B錸g Ch鈛 (C 1)#r#W t錸g l阯 t緄 (C 2) c #G3 #RH皀 B錸g Ch鈛 (C 2)#r#W t錸g l阯 t緄 (C 3) c #G3 #RH皀 B錸g Ch鈛 (C 3)")
			AddText(sceneId,"#r#c00ffff(Thao t醕 Th錸g c V� H皀 ph鋓 th醥 g� b鋙 th誧h to鄋 b� xu痭g, n猽 kh鬾g b鋙 th誧h s� bi猲 m)")
			AddNumText(sceneId,x892000_g_ScriptId,"T錸g l阯 Ng� Dao B鄋 - Huy玭 (C 1)",6,29)
			AddNumText(sceneId,x892000_g_ScriptId,"T錸g l阯 Ng� Dao B鄋 - Huy玭 (C 2)",6,30)
			AddNumText(sceneId,x892000_g_ScriptId,"T錸g l阯 Ng� Dao B鄋 - Huy玭 (C 3)",6,31)
			AddNumText(sceneId,x892000_g_ScriptId,"Quay l読",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 15 then
		BeginEvent(sceneId)
			AddText(sceneId,"Mu痭 thg c #RNg� Dao B鄋 - 械c#W, c s� d鴑g #G3#W c醝 #GH皀 B錸g Ch鈛 #Wm緄 疬㧟.#r T錸g l阯 t緄 (C 1) c #G3 #RH皀 B錸g Ch鈛 (C 1)#r#W t錸g l阯 t緄 (C 2) c #G3 #RH皀 B錸g Ch鈛 (C 2)#r#W t錸g l阯 t緄 (C 3) c #G3 #RH皀 B錸g Ch鈛 (C 3)")
			AddText(sceneId,"#r#c00ffff(Thao t醕 Th錸g c V� H皀 ph鋓 th醥 g� b鋙 th誧h to鄋 b� xu痭g, n猽 kh鬾g b鋙 th誧h s� bi猲 m)")
			AddNumText(sceneId,x892000_g_ScriptId,"T錸g l阯 Ng� Dao B鄋 - 械c (C 1)",6,32)
			AddNumText(sceneId,x892000_g_ScriptId,"T錸g l阯 Ng� Dao B鄋 - 械c (C 2)",6,33)
			AddNumText(sceneId,x892000_g_ScriptId,"T錸g l阯 Ng� Dao B鄋 - 械c (C 3)",6,34)
			AddNumText(sceneId,x892000_g_ScriptId,"Quay l読",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 16 then
		BeginEvent(sceneId)
			AddText(sceneId,"Ch� c� V� H皀 #Gc 1 h絥 #Wm緄 c� th� l頽h ng� k� n錸g, v� h皀 k� n錸g c鹡g chia l鄊 ba c b, 皤u c� 疬㧟 t� ch鷆 t呓ng k� n錸g, c鵱g c th鬾g qua t呓ng 裯g #GV� H皀 k� n錸g th� #Wc鵱g mang theo t呓ng 裯g #Rc b #Wc鵱g t呓ng 裯g #RCh鷆 T呓ng #Wv� h皀 t鄆 kh� l頽h ng�.")
			AddNumText(sceneId,x892000_g_ScriptId,"L頽h ng� k韈h - H鄋 B錸g",6,35)
			AddNumText(sceneId,x892000_g_ScriptId,"L頽h ng� k韈h - S� Di璵",6,36)
			AddNumText(sceneId,x892000_g_ScriptId,"L頽h ng� k韈h - Th呓ng Huy玭",6,37)
			AddNumText(sceneId,x892000_g_ScriptId,"L頽h ng� k韈h - Sang 械c",6,38)
			AddNumText(sceneId,x892000_g_ScriptId,"Quay l読",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 17 then
		BeginEvent(sceneId)
			AddText(sceneId,"Ch� c� V� H皀 #Gc 1 h絥 #Wm緄 c� th� l頽h ng� k� n錸g, v� h皀 k� n錸g c鹡g chia l鄊 ba c b, 皤u c� 疬㧟 t� ch鷆 t呓ng k� n錸g, c鵱g c th鬾g qua t呓ng 裯g #GV� H皀 k� n錸g th� #Wc鵱g mang theo t呓ng 裯g #Rc b #Wc鵱g t呓ng 裯g #RCh鷆 T呓ng #Wv� h皀 t鄆 kh� l頽h ng�.")
			AddNumText(sceneId,x892000_g_ScriptId,"L頽h ng� ph� - Ng遪g B錸g",6,39)
			AddNumText(sceneId,x892000_g_ScriptId,"L頽h ng� ph� - Li畉 Vi阭",6,40)
			AddNumText(sceneId,x892000_g_ScriptId,"L頽h ng� ph� - L誧 Huy玭",6,41)
			AddNumText(sceneId,x892000_g_ScriptId,"L頽h ng� ph� - Th� 械c",6,42)
			AddNumText(sceneId,x892000_g_ScriptId,"Quay l読",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 18 then
		BeginEvent(sceneId)
			AddText(sceneId,"Ch� c� V� H皀 #Gc 1 h絥 #Wm緄 c� th� l頽h ng� k� n錸g, v� h皀 k� n錸g c鹡g chia l鄊 ba c b, 皤u c� 疬㧟 t� ch鷆 t呓ng k� n錸g, c鵱g c th鬾g qua t呓ng 裯g #GV� H皀 k� n錸g th� #Wc鵱g mang theo t呓ng 裯g #Rc b #Wc鵱g t呓ng 裯g #RCh鷆 T呓ng #Wv� h皀 t鄆 kh� l頽h ng�.")
			AddNumText(sceneId,x892000_g_ScriptId,"L頽h ng� b誳 - Th痠 B錸g",6,43)
			AddNumText(sceneId,x892000_g_ScriptId,"L頽h ng� b誳 - L鏼 H鯽",6,44)
			AddNumText(sceneId,x892000_g_ScriptId,"L頽h ng� b誳 - Tr鵱g Huy玭",6,45)
			AddNumText(sceneId,x892000_g_ScriptId,"L頽h ng� b誳 - K竎h 械c",6,46)
			AddNumText(sceneId,x892000_g_ScriptId,"Quay l読",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 19 then
		BeginEvent(sceneId)
			AddText(sceneId,"M秈 l馻 ch鱪 thu礳 t韓h m� r祅g!")
			AddNumText(sceneId,x892000_g_ScriptId,"V� h皀 c 0 (B錸g) m� r祅g thu礳 t韓h",6,47)
			AddNumText(sceneId,x892000_g_ScriptId,"V� h皀 c 0 (H鯽) m� r祅g thu礳 t韓h",6,48)
			AddNumText(sceneId,x892000_g_ScriptId,"V� h皀 c 0 (Huy玭) m� r祅g thu礳 t韓h",6,49)
			AddNumText(sceneId,x892000_g_ScriptId,"V� h皀 c 0 (械c) m� r祅g thu礳 t韓h",6,50)
			AddNumText(sceneId,x892000_g_ScriptId,"Quay l読",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 20 then
		BeginEvent(sceneId)
			AddText(sceneId,"M秈 l馻 ch鱪 thu礳 t韓h m� r祅g!")
			AddNumText(sceneId,x892000_g_ScriptId,"V� h皀 c 1 (B錸g) m� r祅g thu礳 t韓h",6,51)
			AddNumText(sceneId,x892000_g_ScriptId,"V� h皀 c 1 (H鯽) m� r祅g thu礳 t韓h",6,52)
			AddNumText(sceneId,x892000_g_ScriptId,"V� h皀 c 1 (Huy玭) m� r祅g thu礳 t韓h",6,53)
			AddNumText(sceneId,x892000_g_ScriptId,"V� h皀 c 1 (械c) m� r祅g thu礳 t韓h",6,54)
			AddNumText(sceneId,x892000_g_ScriptId,"Quay l読",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 21 then
		BeginEvent(sceneId)
			AddText(sceneId,"M秈 l馻 ch鱪 thu礳 t韓h m� r祅g!")
			AddNumText(sceneId,x892000_g_ScriptId,"V� h皀 c 2 (B錸g) m� r祅g thu礳 t韓h",6,55)
			AddNumText(sceneId,x892000_g_ScriptId,"V� h皀 c 2 (H鯽) m� r祅g thu礳 t韓h",6,56)
			AddNumText(sceneId,x892000_g_ScriptId,"V� h皀 c 2 (Huy玭) m� r祅g thu礳 t韓h",6,57)
			AddNumText(sceneId,x892000_g_ScriptId,"V� h皀 c 2 (械c) m� r祅g thu礳 t韓h",6,58)
			AddNumText(sceneId,x892000_g_ScriptId,"Quay l読",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 22 then
		BeginEvent(sceneId)
			AddText(sceneId,"M秈 l馻 ch鱪 thu礳 t韓h m� r祅g!")
			AddNumText(sceneId,x892000_g_ScriptId,"V� h皀 c 3 (B錸g) m� r祅g thu礳 t韓h",6,59)
			AddNumText(sceneId,x892000_g_ScriptId,"V� h皀 c 3 (H鯽) m� r祅g thu礳 t韓h",6,60)
			AddNumText(sceneId,x892000_g_ScriptId,"V� h皀 c 3 (Huy玭) m� r祅g thu礳 t韓h",6,61)
			AddNumText(sceneId,x892000_g_ScriptId,"V� h皀 c 3 (械c) m� r祅g thu礳 t韓h",6,62)
			AddNumText(sceneId,x892000_g_ScriptId,"Quay l読",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 23 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10156102)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910012)
              if c0 >=1 and c1 >=3 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10156102,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,39910012,3)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10156106, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, v� h皀 th錸g c th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GKi琺 tra tay n鋓 xem 疸 c� V� H皀 v� 3 H皀 B錸g Ch鈛 hay kh鬾g, n猽 thi猽 th� s� kh鬾g th� th錸g c V� H皀!!"
		     x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 24 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10156106)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910013)
              if c0 >=1 and c1 >=3 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10156106,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,39910013,3)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10156110, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, v� h皀 th錸g c th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GKi琺 tra tay n鋓 xem 疸 c� V� H皀 v� H皀 B錸g Ch鈛 hay kh鬾g, n猽 thi猽 th� s� kh鬾g th� th錸g c V� H皀!!"
		     x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 25 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10156110)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910014)
              if c0 >=1 and c1 >=3 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10156110,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,39910014,3)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10156114, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, v� h皀 th錸g c th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GKi琺 tra tay n鋓 xem 疸 c� V� H皀 v� H皀 B錸g Ch鈛 hay kh鬾g, n猽 thi猽 th� s� kh鬾g th� th錸g c V� H皀!!"
		     x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 26 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10156103)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910012)
              if c0 >=1 and c1 >=3 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10156103,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,39910012,3)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10156107, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, v� h皀 th錸g c th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GKi琺 tra tay n鋓 xem 疸 c� V� H皀 v� H皀 B錸g Ch鈛 hay kh鬾g, n猽 thi猽 th� s� kh鬾g th� th錸g c V� H皀!!"
		     x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 27 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10156107)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910013)
              if c0 >=1 and c1 >=3 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10156107,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,39910013,3)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10156111, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, v� h皀 th錸g c th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GKi琺 tra tay n鋓 xem 疸 c� V� H皀 v� H皀 B錸g Ch鈛 hay kh鬾g, n猽 thi猽 th� s� kh鬾g th� th錸g c V� H皀!!"
		     x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 28 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10156111)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910014)
              if c0 >=1 and c1 >=3 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10156111,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,39910014,3)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10156115, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, v� h皀 th錸g c th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GKi琺 tra tay n鋓 xem 疸 c� V� H皀 v� H皀 B錸g Ch鈛 hay kh鬾g, n猽 thi猽 th� s� kh鬾g th� th錸g c V� H皀!!"
		     x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end


	elseif NumText == 29 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10156104)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910012)
              if c0 >=1 and c1 >=3 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10156104,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,39910012,3)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10156108, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, v� h皀 th錸g c th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GKi琺 tra tay n鋓 xem 疸 c� V� H皀 v� H皀 B錸g Ch鈛 hay kh鬾g, n猽 thi猽 th� s� kh鬾g th� th錸g c V� H皀!!"
		     x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end


	elseif NumText == 30 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10156108)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910013)
              if c0 >=1 and c1 >=3 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10156108,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,39910013,3)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10156112, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, v� h皀 th錸g c th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GKi琺 tra tay n鋓 xem 疸 c� V� H皀 v� H皀 B錸g Ch鈛 hay kh鬾g, n猽 thi猽 th� s� kh鬾g th� th錸g c V� H皀!!"
		     x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end


	elseif NumText == 31 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10156112)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910014)
              if c0 >=1 and c1 >=3 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10156112,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,39910014,3)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10156116, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, v� h皀 th錸g c th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GKi琺 tra tay n鋓 xem 疸 c� V� H皀 v� H皀 B錸g Ch鈛 hay kh鬾g, n猽 thi猽 th� s� kh鬾g th� th錸g c V� H皀!!"
		     x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 32 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10156105)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910012)
              if c0 >=1 and c1 >=3 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10156105,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,39910012,3)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10156109, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, v� h皀 th錸g c th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GKi琺 tra tay n鋓 xem 疸 c� V� H皀 v� H皀 B錸g Ch鈛 hay kh鬾g, n猽 thi猽 th� s� kh鬾g th� th錸g c V� H皀!!"
		     x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 33 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10156109)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910013)
              if c0 >=1 and c1 >=3 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10156109,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,39910013,3)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10156113, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, v� h皀 th錸g c th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GKi琺 tra tay n鋓 xem 疸 c� V� H皀 v� H皀 B錸g Ch鈛 hay kh鬾g, n猽 thi猽 th� s� kh鬾g th� th錸g c V� H皀!!"
		     x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 34 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10156113)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910014)
              if c0 >=1 and c1 >=3 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10156113,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,39910014,3)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10156117, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, v� h皀 th錸g c th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GKi琺 tra tay n鋓 xem 疸 c� V� H皀 v� H皀 B錸g Ch鈛 hay kh鬾g, n猽 thi猽 th� s� kh鬾g th� th錸g c V� H皀!!"
		     x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 35 then
		c0 = GetItemCount(sceneId, selfId, 10156106)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910017)
              if c0 >=1 and c1 >=1 then
		      if  HaveSkill(sceneId, selfId, 1700) > 0  then
		          strNotice = "#YNg呓i 疸 h鱟 k� n錸g n鄖 r癷!!"
		          x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
			   return
		      end
			AddSkill(  sceneId, selfId, 1700)
			LuaFnDelAvailableItem(sceneId,selfId,39910017,1)--删除物品
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh鷆 m譶g ng呓i, l頽h ng� k� n錸g v� h皀 th鄋h c鬾g!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi猽 nguy阯 li畊, kh鬾g th� l頽h ng� k� n錸g v� h皀!"
		     x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 36 then
		c0 = GetItemCount(sceneId, selfId, 10156107)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910018)
              if c0 >=1 and c1 >=1 then
		      if  HaveSkill(sceneId, selfId, 1701) > 0  then
		          strNotice = "#YNg呓i 疸 h鱟 k� n錸g n鄖 r癷!!"
		          x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
			   return
		      end
			AddSkill(  sceneId, selfId, 1701)
			LuaFnDelAvailableItem(sceneId,selfId,39910018,1)--删除物品
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh鷆 m譶g ng呓i, l頽h ng� k� n錸g v� h皀 th鄋h c鬾g!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi猽 nguy阯 li畊, kh鬾g th� l頽h ng� k� n錸g v� h皀!"
		     x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 37 then
		c0 = GetItemCount(sceneId, selfId, 10156108)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910019)
              if c0 >=1 and c1 >=1 then
		      if  HaveSkill(sceneId, selfId, 1702) > 0  then
		          strNotice = "#YNg呓i 疸 h鱟 k� n錸g n鄖 r癷!!"
		          x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
			   return
		      end
			AddSkill(  sceneId, selfId, 1702)
			LuaFnDelAvailableItem(sceneId,selfId,39910019,1)--删除物品
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh鷆 m譶g ng呓i, l頽h ng� k� n錸g v� h皀 th鄋h c鬾g!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi猽 nguy阯 li畊, kh鬾g th� l頽h ng� k� n錸g v� h皀!"
		     x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 38 then
		c0 = GetItemCount(sceneId, selfId, 10156109)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910020)
              if c0 >=1 and c1 >=1 then
		      if  HaveSkill(sceneId, selfId, 1703) > 0  then
		          strNotice = "#YNg呓i 疸 h鱟 k� n錸g n鄖 r癷!!"
		          x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
			   return
		      end
			AddSkill(  sceneId, selfId, 1703)
			LuaFnDelAvailableItem(sceneId,selfId,39910020,1)--删除物品
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh鷆 m譶g ng呓i, l頽h ng� k� n錸g v� h皀 th鄋h c鬾g!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi猽 nguy阯 li畊, kh鬾g th� l頽h ng� k� n錸g v� h皀!"
		     x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 39 then
		c0 = GetItemCount(sceneId, selfId, 10156110)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910021)
              if c0 >=1 and c1 >=1 then
		      if  HaveSkill(sceneId, selfId, 1704) > 0  then
		          strNotice = "#YNg呓i 疸 h鱟 k� n錸g n鄖 r癷!!"
		          x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
			   return
		      end
		      if  HaveSkill(sceneId, selfId, 1700) > 0  then
			   DelSkill(sceneId, selfId, 1700)
		      end
			AddSkill(  sceneId, selfId, 1704)
			LuaFnDelAvailableItem(sceneId,selfId,39910021,1)--删除物品
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh鷆 m譶g ng呓i, l頽h ng� k� n錸g v� h皀 th鄋h c鬾g!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi猽 nguy阯 li畊, kh鬾g th� l頽h ng� k� n錸g v� h皀!"
		     x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 40 then
		c0 = GetItemCount(sceneId, selfId, 10156111)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910022)
              if c0 >=1 and c1 >=1 then
		      if  HaveSkill(sceneId, selfId, 1705) > 0  then
		          strNotice = "#YNg呓i 疸 h鱟 k� n錸g n鄖 r癷!!"
		          x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
			   return
		      end
		      if  HaveSkill(sceneId, selfId, 1701) > 0  then
			   DelSkill(sceneId, selfId, 1701)
		      end
			AddSkill(  sceneId, selfId, 1705)
			LuaFnDelAvailableItem(sceneId,selfId,39910022,1)--删除物品
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh鷆 m譶g ng呓i, l頽h ng� k� n錸g v� h皀 th鄋h c鬾g!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi猽 nguy阯 li畊, kh鬾g th� l頽h ng� k� n錸g v� h皀!"
		     x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 41 then
		c0 = GetItemCount(sceneId, selfId, 10156112)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910023)
              if c0 >=1 and c1 >=1 then
		      if  HaveSkill(sceneId, selfId, 1706) > 0  then
		          strNotice = "#YNg呓i 疸 h鱟 k� n錸g n鄖 r癷!!"
		          x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
			   return
		      end
		      if  HaveSkill(sceneId, selfId, 1702) > 0  then
			   DelSkill(sceneId, selfId, 1702)
		      end
			AddSkill(  sceneId, selfId, 1706)
			LuaFnDelAvailableItem(sceneId,selfId,39910023,1)--删除物品
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh鷆 m譶g ng呓i, l頽h ng� k� n錸g v� h皀 th鄋h c鬾g!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi猽 nguy阯 li畊, kh鬾g th� l頽h ng� k� n錸g v� h皀!"
		     x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 42 then
		c0 = GetItemCount(sceneId, selfId, 10156113)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910024)
              if c0 >=1 and c1 >=1 then
		      if  HaveSkill(sceneId, selfId, 1707) > 0  then
		          strNotice = "#YNg呓i 疸 h鱟 k� n錸g n鄖 r癷!!"
		          x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
			   return
		      end
		      if  HaveSkill(sceneId, selfId, 1703) > 0  then
			   DelSkill(sceneId, selfId, 1703)
		      end
			AddSkill(  sceneId, selfId, 1707)
			LuaFnDelAvailableItem(sceneId,selfId,39910024,1)--删除物品
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh鷆 m譶g ng呓i, l頽h ng� k� n錸g v� h皀 th鄋h c鬾g!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi猽 nguy阯 li畊, kh鬾g th� l頽h ng� k� n錸g v� h皀!"
		     x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 43 then
		c0 = GetItemCount(sceneId, selfId, 10156114)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910025)
              if c0 >=1 and c1 >=1 then
		      if  HaveSkill(sceneId, selfId, 1708) > 0  then
		          strNotice = "#YNg呓i 疸 h鱟 k� n錸g n鄖 r癷!!"
		          x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
			   return
		      end
		      if  HaveSkill(sceneId, selfId, 1704) > 0  then
			   DelSkill(sceneId, selfId, 1704)
		      end
			AddSkill(  sceneId, selfId, 1708)
			LuaFnDelAvailableItem(sceneId,selfId,39910025,1)--删除物品
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh鷆 m譶g ng呓i, l頽h ng� k� n錸g v� h皀 th鄋h c鬾g!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi猽 nguy阯 li畊, kh鬾g th� l頽h ng� k� n錸g v� h皀!"
		     x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 44 then
		c0 = GetItemCount(sceneId, selfId, 10156115)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910026)
              if c0 >=1 and c1 >=1 then
		      if  HaveSkill(sceneId, selfId, 1709) > 0  then
		          strNotice = "#YNg呓i 疸 h鱟 k� n錸g n鄖 r癷!!"
		          x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
			   return
		      end
		      if  HaveSkill(sceneId, selfId, 1705) > 0  then
			   DelSkill(sceneId, selfId, 1705)
		      end
			AddSkill(  sceneId, selfId, 1709)
			LuaFnDelAvailableItem(sceneId,selfId,39910026,1)--删除物品
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh鷆 m譶g ng呓i, l頽h ng� k� n錸g v� h皀 th鄋h c鬾g!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi猽 nguy阯 li畊, kh鬾g th� l頽h ng� k� n錸g v� h皀!"
		     x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 45 then
		c0 = GetItemCount(sceneId, selfId, 10156116)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910027)
              if c0 >=1 and c1 >=1 then
		      if  HaveSkill(sceneId, selfId, 1710) > 0  then
		          strNotice = "#YNg呓i 疸 h鱟 k� n錸g n鄖 r癷!!"
		          x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
			   return
		      end
		      if  HaveSkill(sceneId, selfId, 1706) > 0  then
			   DelSkill(sceneId, selfId, 1706)
		      end
			AddSkill(  sceneId, selfId, 1710)
			LuaFnDelAvailableItem(sceneId,selfId,39910027,1)--删除物品
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh鷆 m譶g ng呓i, l頽h ng� k� n錸g v� h皀 th鄋h c鬾g!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi猽 nguy阯 li畊, kh鬾g th� l頽h ng� k� n錸g v� h皀!"
		     x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 46 then
		c0 = GetItemCount(sceneId, selfId, 10156117)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 39910028)
              if c0 >=1 and c1 >=1 then
		      if  HaveSkill(sceneId, selfId, 1711) > 0  then
		          strNotice = "#YNg呓i 疸 h鱟 k� n錸g n鄖 r癷!!"
		          x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
			   return
		      end
		      if  HaveSkill(sceneId, selfId, 1707) > 0  then
			   DelSkill(sceneId, selfId, 1707)
		      end
			AddSkill(  sceneId, selfId, 1711)
			LuaFnDelAvailableItem(sceneId,selfId,39910028,1)--删除物品
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh鷆 m譶g ng呓i, l頽h ng� k� n錸g v� h皀 th鄋h c鬾g!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi猽 nguy阯 li畊, kh鬾g th� l頽h ng� k� n錸g v� h皀!"
		     x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 47 then
		c0 = GetItemCount(sceneId, selfId, 10156102)
              if c0 >=1 then
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 25000, 0)
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh鷆 m譶g ng呓i, v� h皀 m� r祅g thu礳 t韓h th鄋h c鬾g!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi猽 nguy阯 li畊, kh鬾g th� m� r祅g thu礳 t韓h v� h皀!"
		     x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 48 then
		c0 = GetItemCount(sceneId, selfId, 10156103)
              if c0 >=1 then
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 25001, 0)
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh鷆 m譶g ng呓i, v� h皀 m� r祅g thu礳 t韓h th鄋h c鬾g!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi猽 nguy阯 li畊, kh鬾g th� m� r祅g thu礳 t韓h v� h皀!"
		     x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 49 then
		c0 = GetItemCount(sceneId, selfId, 10156104)
              if c0 >=1 then
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 25002, 0)
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh鷆 m譶g ng呓i, v� h皀 m� r祅g thu礳 t韓h th鄋h c鬾g!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi猽 nguy阯 li畊, kh鬾g th� m� r祅g thu礳 t韓h v� h皀!"
		     x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 50 then
		c0 = GetItemCount(sceneId, selfId, 10156105)
              if c0 >=1 then
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 25003, 0)
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh鷆 m譶g ng呓i, v� h皀 m� r祅g thu礳 t韓h th鄋h c鬾g!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi猽 nguy阯 li畊, kh鬾g th� m� r祅g thu礳 t韓h v� h皀!"
		     x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 51 then
		c0 = GetItemCount(sceneId, selfId, 10156106)
              if c0 >=1 then
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 25008, 0)
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh鷆 m譶g ng呓i, v� h皀 m� r祅g thu礳 t韓h th鄋h c鬾g!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi猽 nguy阯 li畊, kh鬾g th� m� r祅g thu礳 t韓h v� h皀!"
		     x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 52 then
		c0 = GetItemCount(sceneId, selfId, 10156107)
              if c0 >=1 then
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 25009, 0)
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh鷆 m譶g ng呓i, v� h皀 m� r祅g thu礳 t韓h th鄋h c鬾g!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi猽 nguy阯 li畊, kh鬾g th� m� r祅g thu礳 t韓h v� h皀!"
		     x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 53 then
		c0 = GetItemCount(sceneId, selfId, 10156108)
              if c0 >=1 then
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 25010, 0)
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh鷆 m譶g ng呓i, v� h皀 m� r祅g thu礳 t韓h th鄋h c鬾g!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi猽 nguy阯 li畊, kh鬾g th� m� r祅g thu礳 t韓h v� h皀!"
		     x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 54 then
		c0 = GetItemCount(sceneId, selfId, 10156109)
              if c0 >=1 then
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 25011, 0)
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh鷆 m譶g ng呓i, v� h皀 m� r祅g thu礳 t韓h th鄋h c鬾g!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi猽 nguy阯 li畊, kh鬾g th� m� r祅g thu礳 t韓h v� h皀!"
		     x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 55 then
		c0 = GetItemCount(sceneId, selfId, 10156110)
              if c0 >=1 then
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 25016, 0)
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh鷆 m譶g ng呓i, v� h皀 m� r祅g thu礳 t韓h th鄋h c鬾g!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi猽 nguy阯 li畊, kh鬾g th� m� r祅g thu礳 t韓h v� h皀!"
		     x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 56 then
		c0 = GetItemCount(sceneId, selfId, 10156111)
              if c0 >=1 then
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 25017, 0)
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh鷆 m譶g ng呓i, v� h皀 m� r祅g thu礳 t韓h th鄋h c鬾g!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi猽 nguy阯 li畊, kh鬾g th� m� r祅g thu礳 t韓h v� h皀!"
		     x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 57 then
		c0 = GetItemCount(sceneId, selfId, 10156112)
              if c0 >=1 then
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 25018, 0)
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh鷆 m譶g ng呓i, v� h皀 m� r祅g thu礳 t韓h th鄋h c鬾g!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi猽 nguy阯 li畊, kh鬾g th� m� r祅g thu礳 t韓h v� h皀!"
		     x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 58 then
		c0 = GetItemCount(sceneId, selfId, 10156113)
              if c0 >=1 then
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 25019, 0)
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh鷆 m譶g ng呓i, v� h皀 m� r祅g thu礳 t韓h th鄋h c鬾g!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi猽 nguy阯 li畊, kh鬾g th� m� r祅g thu礳 t韓h v� h皀!"
		     x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 59 then
		c0 = GetItemCount(sceneId, selfId, 10156114)
              if c0 >=1 then
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 25024, 0)
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh鷆 m譶g ng呓i, v� h皀 m� r祅g thu礳 t韓h th鄋h c鬾g!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi猽 nguy阯 li畊, kh鬾g th� m� r祅g thu礳 t韓h v� h皀!"
		     x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 60 then
		c0 = GetItemCount(sceneId, selfId, 10156115)
              if c0 >=1 then
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 25025, 0)
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh鷆 m譶g ng呓i, v� h皀 m� r祅g thu礳 t韓h th鄋h c鬾g!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi猽 nguy阯 li畊, kh鬾g th� m� r祅g thu礳 t韓h v� h皀!"
		     x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 61 then
		c0 = GetItemCount(sceneId, selfId, 10156116)
              if c0 >=1 then
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 25026, 0)
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh鷆 m譶g ng呓i, v� h皀 m� r祅g thu礳 t韓h th鄋h c鬾g!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi猽 nguy阯 li畊, kh鬾g th� m� r祅g thu礳 t韓h v� h皀!"
		     x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 62 then
		c0 = GetItemCount(sceneId, selfId, 10156117)
              if c0 >=1 then
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 25027, 0)
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh鷆 m譶g ng呓i, v� h皀 m� r祅g thu礳 t韓h th鄋h c鬾g!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi猽 nguy阯 li畊, kh鬾g th� m� r祅g thu礳 t韓h v� h皀!"
		     x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x892000_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x892000_g_eventList do
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
function x892000_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x892000_g_eventList do
		if missionScriptId == findId then
			x892000_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x892000_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x892000_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x892000_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x892000_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x892000_OnDie( sceneId, selfId, killerId )
end




--**********************************
--判断是否能够学习
--nSkillIndex参数可能值为：40，70，90，分别学习对应级别的技能
--**********************************
function x892000_CheckStudyDarkSkills( sceneId, selfId, targetId, nSkillIndex )
	
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
		x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	--判断是否已经学会了对应技能
	if  (HaveSkill(sceneId, selfId, x892000_g_DarkSkillName[nSkillIndex].id) > 0 ) then
		if (nSkillIndex == 40) then
			strNotice = "#{FBSJ_081209_26}";
		elseif (nSkillIndex == 70) then
			strNotice = "#{FBSJ_081209_28}";
		elseif (nSkillIndex == 90) then
			strNotice = "#{FBSJ_081209_30}";
		end
		x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	--判断玩家身上是否有足够的钱
	local nHaveMoney = GetMoney(sceneId, selfId) + GetMoneyJZ(sceneId, selfId);
	if (nHaveMoney < x892000_g_DarkSkillName[nSkillIndex].needmoney) then    --10金
		strNotice = "#{FBSJ_081209_25}";
		x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	return 1;
	
end

--**********************************
--玩家找NPC学习暗器使用技能
--nSkillIndex参数可能值为：40，70，90，分别学习对应级别的技能
--**********************************
function x892000_StudyDarkSkills( sceneId, selfId, targetId, nSkillIndex )
	
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
		x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	--判断是否已经学会了对应技能
	if  (HaveSkill(sceneId, selfId, x892000_g_DarkSkillName[nSkillIndex].id) > 0 ) then
		if (nSkillIndex == 40) then
			strNotice = "#{FBSJ_081209_26}";
		elseif (nSkillIndex == 70) then
			strNotice = "#{FBSJ_081209_28}";
		elseif (nSkillIndex == 90) then
			strNotice = "#{FBSJ_081209_30}";
		end
		x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	--判断玩家身上是否有足够的钱
	local nHaveMoney = GetMoney(sceneId, selfId) + GetMoneyJZ(sceneId, selfId);
	if (nHaveMoney < x892000_g_DarkSkillName[nSkillIndex].needmoney) then    --10金
		strNotice = "#{FBSJ_081209_25}";
		x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
		return
	end
	
	--上面判断都通过，可以扣钱给技能了
	local nRet, nRetJB = LuaFnCostMoneyWithPriority(sceneId, selfId, x892000_g_DarkSkillName[nSkillIndex].needmoney);
	if (nRet == -1) then
		strNotice = "#{FBSJ_081209_25}";
		x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	AddSkill(  sceneId, selfId, x892000_g_DarkSkillName[nSkillIndex].id)
	x892000_ShowNotice(sceneId, selfId, targetId, x892000_g_DarkSkillTips[nSkillIndex]);
	x892000_NotifyTips( sceneId, selfId, x892000_g_DarkSkillTips[nSkillIndex] )
	
	x892000_StudySkillImpact(sceneId, selfId)
	DarkOperateResult(sceneId, selfId, 5, 1);    --让技能按钮闪烁
	
end


--**********************************
-- 屏幕中间信息提示
--**********************************
function x892000_NotifyTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end


--**********************************
--玩家是否满足暗器瓶颈条件
--返回值：0或者1，1为满足，0
--**********************************
function x892000_CheckDarkReachPoint(sceneId, selfId, targetId)
		
		local strInfo = "";
		--判断玩家身上是否装备有暗器
		local bHaveDarkEquip = HaveDarkEquiped(sceneId, selfId);
		if ( bHaveDarkEquip ~= 1) then
			strInfo = "#{FBSJ_081209_13}";
			x892000_ShowNotice(sceneId, selfId, targetId, strInfo);
			return 0;
		end
		
		--判断玩家身上暗器是否达到瓶颈
		local bNeedNPC = IsDarkNeedLevelUpByNpcNow(sceneId, selfId);
		if (bNeedNPC ~= 1) then
			strInfo = "#{FBSJ_081209_14}";
			x892000_ShowNotice(sceneId, selfId, targetId, strInfo);
			return 0;
		end
		
		--判断玩家等级是否和暗器等级相等或者没有暗器等级高
		local nDarkLevel = GetDarkLevel(sceneId, selfId);
		local nCharLevel = GetLevel(sceneId, selfId);
		if (nDarkLevel >= nCharLevel) then
			strInfo = "#{FBSJ_081209_15}";
			x892000_ShowNotice(sceneId, selfId, targetId, strInfo);
			return 0;
		end
		
		--判断玩家身上是否有足够的钱
		local nDarkLevel = GetDarkLevel(sceneId, selfId);
		local nNeedMoney = x892000_g_DarkBreachPointNeedMoney[nDarkLevel];
		if (nNeedMoney == nil or nNeedMoney <= 0) then
			nNeedMoney = 100000;         --以防万一，并没什么用
		end
		local nHaveMoney = GetMoney(sceneId, selfId) + GetMoneyJZ(sceneId, selfId);
		if (nHaveMoney < nNeedMoney) then    --10金
			strNotice = "#{FBSJ_081209_25}";
			x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
			return 0;
		end
				
		return 1;
end


function x892000_BreachDarkPoint(sceneId, selfId, targetId)

	local strInfo = "";
	--判断玩家身上是否装备有暗器
	local bHaveDarkEquip = HaveDarkEquiped(sceneId, selfId);
	if ( bHaveDarkEquip ~= 1) then
		strInfo = "#{FBSJ_081209_13}";
		x892000_ShowNotice(sceneId, selfId, targetId, strInfo);
		return 0;
	end
		
	--判断玩家身上暗器是否达到瓶颈
	local bNeedNPC = IsDarkNeedLevelUpByNpcNow(sceneId, selfId);
	if (bNeedNPC ~= 1) then
		strInfo = "#{FBSJ_081209_14}";
		x892000_ShowNotice(sceneId, selfId, targetId, strInfo);
		return 0;
	end
		
	--判断玩家等级是否和暗器等级相等或者没有暗器等级高
	local nDarkLevel = GetDarkLevel(sceneId, selfId);
	local nCharLevel = GetLevel(sceneId, selfId);
	if (nDarkLevel >= nCharLevel) then
		strInfo = "#{FBSJ_081209_15}";
		x892000_ShowNotice(sceneId, selfId, targetId, strInfo);
		return 0;
	end
		
			--判断玩家身上是否有足够的钱
	local nDarkLevel = GetDarkLevel(sceneId, selfId);
	local nNeedMoney = x892000_g_DarkBreachPointNeedMoney[nDarkLevel];
	if (nNeedMoney == nil or nNeedMoney <= 0) then
		nNeedMoney = 100000;         --以防万一，并没什么用
	end
	local nHaveMoney = GetMoney(sceneId, selfId) + GetMoneyJZ(sceneId, selfId);
	if (nHaveMoney < nNeedMoney) then    --10金
		strNotice = "#{FBSJ_081209_25}";
		x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	--上面判断都通过，可以扣钱突破了
	local nRet, nRetJB = LuaFnCostMoneyWithPriority(sceneId, selfId, nNeedMoney);
	if (nRet == -1) then
		strNotice = "#{FBSJ_081209_25}";
		x892000_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	--突破瓶颈，让暗器升级
	local bDarkLevelup = DarkLevelUp(sceneId, selfId);
	if (bDarkLevelup == 1) then
		x892000_ShowNotice(sceneId, selfId, targetId, "#{FBSJ_081209_18}");
		--突破成功，记录统计日志
			local guid = LuaFnObjId2Guid(sceneId, selfId);
			local sLog = format("dark level now: %d", nDarkLevel + 1); 
			ScriptGlobal_AuditGeneralLog(LUAAUDIT_ANQITUPO, guid, sLog);
	else
		x892000_ShowNotice(sceneId, selfId, targetId, "械t ph� th b読");
	end
	
	return
end

function x892000_ShowNotice( sceneId, selfId, targetId, strNotice)
	BeginEvent( sceneId )
		AddText( sceneId, strNotice )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

function x892000_StudySkillImpact(sceneId, playerId)
	--显示学习到新技能的特效 目前使用升级特效
	LuaFnSendSpecificImpactToUnit(sceneId, playerId, playerId, playerId, 32407, 0 )
end
