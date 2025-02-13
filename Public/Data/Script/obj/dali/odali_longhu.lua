--洛阳NPC
--燕青
--普通

--脚本号
x892005_g_ScriptId = 892005

--所拥有的事件ID列表
x892005_g_eventList={}


x892005_g_DarkSkillName = { [40] = {name = "N閙 羗 kh�", id = 274, needmoney = 20000},
                            [70] = {name = "羗 kh� 痄 huy畉", id = 275, needmoney = 100000},
                            [90] = {name = "羗 kh� h� th�", id = 276, needmoney = 500000},
                          }                
x892005_g_DarkSkillTips = { [40] = "#{FBSJ_090106_89}",
                            [70] = "#{FBSJ_090106_90}",
                            [90] = "#{FBSJ_090106_91}",
                          }  
x892005_g_DarkBreachPointNeedMoney = 
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
function x892005_UpdateEventList( sceneId, selfId,targetId )

	BeginEvent(sceneId)
		AddText(sceneId,"  Long V錸 H礽 t呓ng truy玭 ng鄋 n錷, duy c� b� t礳 n鄖 ch鈔 l�......#r ta t譶g c� h課h ch竨 qu� c� s鄌 b� t礳 h du� long th� tam huynh 甬 ch� 餴琺, 鸠i v緄 Long V錸 c� nghi阯 c製......")
		for i, eventId in x892005_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
		
		AddNumText(sceneId,x892005_g_ScriptId,"Th錸g c Long V錸",6,7)
		AddNumText(sceneId,x892005_g_ScriptId,"T thu礳 t韓h Long V錸",6,8)
		--AddNumText(sceneId,x892005_g_ScriptId,"M� r祅g thu礳 t韓h Long V錸",6,9)
		--AddNumText(sceneId,x892005_g_ScriptId,"Gi緄 thi畊 Long V錸",8,888)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x892005_OnDefaultEvent( sceneId, selfId,targetId )
	x892005_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x892005_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x892005_g_eventList do
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
			AddNumText(sceneId,x892005_g_ScriptId,"龙纹来由",6,666)
			AddNumText(sceneId,x892005_g_ScriptId,"怎样获得龙纹",6,667)
			AddNumText(sceneId,x892005_g_ScriptId,"龙纹怎样升级",6,668)
			AddNumText(sceneId,x892005_g_ScriptId,"怎样获得龙纹相关道具",6,669)
			AddNumText(sceneId,x892005_g_ScriptId,"龙纹扩展属性介绍",6,670)
			AddNumText(sceneId,x892005_g_ScriptId,"龙纹学习属性介绍",6,671)
			--AddNumText(sceneId,x892005_g_ScriptId,"属相相克效果",6,672)
			AddNumText(sceneId,x892005_g_ScriptId,"Quay l読",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 666 then  --提升龙纹等级
		BeginEvent(sceneId)
			AddText(sceneId,"有巢氏历经千年传承，秘境中宝藏虽万千，但更多古稀之物已罕见至极。制作龙纹所需的诸多辅料虽尚未绝迹，但其中一两种主要之物却已当世不多。当时各方世族涌入有巢秘境，觅得有巢氏制作龙纹之法，却苦于制作材料的稀少，所以惟有武功高绝且地位超群之人方能取得此龙纹，成为自己笑傲江湖的力证！")
			AddNumText(sceneId,x892005_g_ScriptId,"Quay l読",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif NumText == 667 then  --提升龙纹等级
		BeginEvent(sceneId)
			AddText(sceneId,"#cfabf8f怎样获得龙纹:#r　　#W在#G兵圣奇阵#W副本中打败BOSS，有一定几率获得#R龙纹：初级龙纹#W。")
			AddNumText(sceneId,x892005_g_ScriptId,"Quay l読",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif NumText == 668 then  --提升龙纹等级
		BeginEvent(sceneId)
			AddText(sceneId,"#cfabf8f龙纹怎样升级:#r　　#W使用#G3#W颗相应等级的#G玉龙髓#W可对龙纹进行升级。升级后的龙纹#R自身属性#W、#R携带等级#W和#R龙纹扩展属性值#W均会得到提高。#r#P(只有学习了属相的龙纹才能进行升级)")
			AddNumText(sceneId,x892005_g_ScriptId,"Quay l読",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif NumText == 669 then  --提升龙纹等级
		BeginEvent(sceneId)
			AddText(sceneId,"#cfabf8f#r怎样获得龙纹相关道具:#r#Y所有龙纹升级道具均可在兵圣奇阵中获得。")
			AddNumText(sceneId,x892005_g_ScriptId,"Quay l読",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif NumText == 670 then  --提升龙纹等级
		BeginEvent(sceneId)
			AddText(sceneId,"#cfabf8f龙纹扩展属性介绍:#r　　#W使用缀龙石对龙纹学习属相后，龙纹将自动获得一个对应属相的#G增益类#W扩展属性。一共有三个属性可以学习。")
			AddNumText(sceneId,x892005_g_ScriptId,"Quay l読",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif NumText == 671 then  --提升龙纹等级
		BeginEvent(sceneId)
			AddText(sceneId,"#cfabf8f龙纹升级介绍:#r#Y怎样获得属相:　　#r#W使用#G缀龙石#W可对无属相的龙纹进行学习属相。龙纹的属相有三种。龙纹注入属相后，可以使用玉龙髓和勾天彩升级。")
			AddNumText(sceneId,x892005_g_ScriptId,"Quay l読",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif NumText == 672 then  --提升龙纹等级
		BeginEvent(sceneId)
			AddText(sceneId,"#Y属相相克效果:　　#r#W属相相克的最终效果，在一定程度上受到龙纹等级的影响。#r　　假使A、B两个玩家分别装备有两个龙纹，A玩家的龙纹克制B玩家的龙纹。如果A玩家的龙纹合成等级高于B玩家的龙纹等级，伤害放大效果更加明显；如果A玩家的龙纹等级低于B玩家的龙纹等级，伤害放大效果将有所减弱。")
			AddNumText(sceneId,x892005_g_ScriptId,"Quay l読",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 7 then  --提升龙纹等级
		BeginEvent(sceneId)
			AddText(sceneId,"Mu痭 th錸g c Long V錸, tr呔c h猼 餰m Long V錸 #GC tinh#W, v� nh� th� n鄌 l� Long V錸 c tinh, ng呓i c� th� t靘 ng叨i huynh 甬 #GLong Vi阯 #Wgi鷓 ng呓i.")
			AddText(sceneId,"#cfff263Th錸g c Long V錸 th h絥 5, ng呓i c� th� ti陁 hao nh 鸶nh s� l唼ng #YNg鱟 Long Th鼀#W. Th錸g c Long V錸  t� 5 皙n 6 c ti陁 hao nh 鸶nh s� l唼ng #YNg鱟 Long Th鼀 #Wv� #YS� c C鈛 Thi阯 Th醝#W.")
			AddText(sceneId,"Th錸g c Long V錸 c 7 皙n 8, c ti陁 hao nh 鸶nh s� l唼ng #YNg鱟 Long Th鼀 #Wv� #YTrung c C鈛 Thi阯 Th醝#W. Long v錸 th錸g c l阯 9 c ti陁 hao nh 鸶nh s� l唼ng #YNg鱟 Long Th鼀 #Wv� #YCao c C鈛 Thi阯 Th醝#W.")
			AddText(sceneId,"#r#c00ffff(Thao t醕 n鄖 c 餰m Long V錸 疬㧟 kh鋗 b鋙 th誧h to鄋 b� th醥 xu痭g, n猽 kh鬾g b鋙 th誧h s� bi猲 m)")

			AddNumText(sceneId,x892005_g_ScriptId,"Th錸g c Long V錸 (B錸g)",6,12)
			AddNumText(sceneId,x892005_g_ScriptId,"Th錸g c Long V錸 (H鯽)",6,13)
			AddNumText(sceneId,x892005_g_ScriptId,"Th錸g c Long V錸 (Huy玭)",6,14)
			AddNumText(sceneId,x892005_g_ScriptId,"Th錸g c Long V錸 (械c)",6,15)
			AddNumText(sceneId,x892005_g_ScriptId,"Quay l読",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		
	elseif NumText == 8 then  --领悟技能
		BeginEvent(sceneId)
			AddText(sceneId,"    #cfff263T thu礳 t韓h Long V錸 c ti陁 hao nh 鸶nh s� l唼ng #GT竛h V鈔 Th鼀#cfff263.#r Long V錸 sau khi t thu礳 t韓h, kh� n錸g xu hi畁 thu礳 t韓h ng nhi阯, ch� c ng呓i nh鈔 ph t痶, c� th� ra 16 thu礳 t韓h c馽 ph.")
			AddText(sceneId,"#r#c00ffff(Thao t醕 n鄖 c 餰m Long V錸 疬㧟 kh鋗 b鋙 th誧h to鄋 b� th醥 xu痭g, n猽 kh鬾g b鋙 th誧h s� bi猲 m)")

			AddNumText(sceneId,x892005_g_ScriptId,"T thu礳 t韓h Long V錸 (B錸g) 属性",6,16)
			AddNumText(sceneId,x892005_g_ScriptId,"T thu礳 t韓h Long V錸 (H鯽)",6,17)
			AddNumText(sceneId,x892005_g_ScriptId,"T thu礳 t韓h Long V錸 (Huy玭)",6,18)
			AddNumText(sceneId,x892005_g_ScriptId,"T thu礳 t韓h Long V錸 (械c)",6,19)
			AddNumText(sceneId,x892005_g_ScriptId,"Quay l読",8,130)
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
			AddNumText(sceneId,x892005_g_ScriptId,"#{FBSJ_090311_03}",6,26)
			AddNumText(sceneId,x892005_g_ScriptId,"#{FBSJ_090311_04}",6,27)
			AddNumText(sceneId,x892005_g_ScriptId,"Quay l読",8,13)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 12 then                   --提升 冰 等级
		BeginEvent(sceneId)
			AddText(sceneId,"#cfff263Th錸g c Long V錸 th h絥 5, ng呓i c� th� ti陁 hao nh 鸶nh s� l唼ng #YNg鱟 Long Th鼀#W. Th錸g c Long V錸  t� 5 皙n 6 c ti陁 hao nh 鸶nh s� l唼ng #YNg鱟 Long Th鼀 #Wv� #YS� c C鈛 Thi阯 Th醝#W.")
			AddText(sceneId,"Th錸g c Long V錸 c 7 皙n 8, c ti陁 hao nh 鸶nh s� l唼ng #YNg鱟 Long Th鼀 #Wv� #YTrung c C鈛 Thi阯 Th醝#W. Long v錸 th錸g c l阯 9 c ti陁 hao nh 鸶nh s� l唼ng #YNg鱟 Long Th鼀 #Wv� #YCao c C鈛 Thi阯 Th醝#W.")
			AddText(sceneId,"#r#c00ffff(Thao t醕 n鄖 c 餰m Long V錸 疬㧟 kh鋗 b鋙 th誧h to鄋 b� th醥 xu痭g, n猽 kh鬾g b鋙 th誧h s� bi猲 m)")
			AddNumText(sceneId,x892005_g_ScriptId,"Th錸g c Long V錸 - B錸g (C 1)",6,23)
			AddNumText(sceneId,x892005_g_ScriptId,"Th錸g c Long V錸 - B錸g (C 2)",6,24)
			AddNumText(sceneId,x892005_g_ScriptId,"Th錸g c Long V錸 - B錸g (C 3)",6,25)
			AddNumText(sceneId,x892005_g_ScriptId,"Th錸g c Long V錸 - B錸g (C 4)",6,70)
			AddNumText(sceneId,x892005_g_ScriptId,"Th錸g c Long V錸 - B錸g (C 5)",6,71)
			AddNumText(sceneId,x892005_g_ScriptId,"Th錸g c Long V錸 - B錸g (C 6)",6,72)
			AddNumText(sceneId,x892005_g_ScriptId,"Th錸g c Long V錸 - B錸g (C 7)",6,73)
			AddNumText(sceneId,x892005_g_ScriptId,"Th錸g c Long V錸 - B錸g (C 8)",6,74)
			AddNumText(sceneId,x892005_g_ScriptId,"Th錸g c Long V錸 - B錸g (C 9)",6,75)
			AddNumText(sceneId,x892005_g_ScriptId,"Th錸g c Long V錸 - B錸g (C 10)",6,76)
			AddNumText(sceneId,x892005_g_ScriptId,"Long V錸 t鄆 li畊 thuy猼 minh",6,800)

			AddNumText(sceneId,x892005_g_ScriptId,"Quay l読",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 13 then                   --提升 火 等级
		BeginEvent(sceneId)
			AddText(sceneId,"#cfff263Th錸g c Long V錸 th h絥 5, ng呓i c� th� ti陁 hao nh 鸶nh s� l唼ng #YNg鱟 Long Th鼀#W. Th錸g c Long V錸  t� 5 皙n 6 c ti陁 hao nh 鸶nh s� l唼ng #YNg鱟 Long Th鼀 #Wv� #YS� c C鈛 Thi阯 Th醝#W.")
			AddText(sceneId,"Th錸g c Long V錸 c 7 皙n 8, c ti陁 hao nh 鸶nh s� l唼ng #YNg鱟 Long Th鼀 #Wv� #YTrung c C鈛 Thi阯 Th醝#W. Long v錸 th錸g c l阯 9 c ti陁 hao nh 鸶nh s� l唼ng #YNg鱟 Long Th鼀 #Wv� #YCao c C鈛 Thi阯 Th醝#W.")
			AddText(sceneId,"#r#c00ffff(Thao t醕 n鄖 c 餰m Long V錸 疬㧟 kh鋗 b鋙 th誧h to鄋 b� th醥 xu痭g, n猽 kh鬾g b鋙 th誧h s� bi猲 m)")
			AddNumText(sceneId,x892005_g_ScriptId,"Th錸g c Long V錸 - H鯽 (C 1)",6,26)
			AddNumText(sceneId,x892005_g_ScriptId,"Th錸g c Long V錸 - H鯽 (C 2)",6,27)
			AddNumText(sceneId,x892005_g_ScriptId,"Th錸g c Long V錸 - H鯽 (C 3)",6,28)
			AddNumText(sceneId,x892005_g_ScriptId,"Th錸g c Long V錸 - H鯽 (C 4)",6,77)
			AddNumText(sceneId,x892005_g_ScriptId,"Th錸g c Long V錸 - H鯽 (C 5)",6,78)
			AddNumText(sceneId,x892005_g_ScriptId,"Th錸g c Long V錸 - H鯽 (C 6)",6,79)
			AddNumText(sceneId,x892005_g_ScriptId,"Th錸g c Long V錸 - H鯽 (C 7)",6,80)
			AddNumText(sceneId,x892005_g_ScriptId,"Th錸g c Long V錸 - H鯽 (C 8)",6,81)
			AddNumText(sceneId,x892005_g_ScriptId,"Th錸g c Long V錸 - H鯽 (C 9)",6,82)
			AddNumText(sceneId,x892005_g_ScriptId,"Th錸g c Long V錸 - H鯽 (C 10)",6,83)
			AddNumText(sceneId,x892005_g_ScriptId,"Long V錸 t鄆 li畊 thuy猼 minh",6,800)

			AddNumText(sceneId,x892005_g_ScriptId,"Quay l読",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		
	elseif NumText == 130 then
		x892005_OnDefaultEvent( sceneId, selfId,targetId )
	elseif NumText == 14 then
		BeginEvent(sceneId)
			AddText(sceneId,"#cfff263Th錸g c Long V錸 th h絥 5, ng呓i c� th� ti陁 hao nh 鸶nh s� l唼ng #YNg鱟 Long Th鼀#W. Th錸g c Long V錸  t� 5 皙n 6 c ti陁 hao nh 鸶nh s� l唼ng #YNg鱟 Long Th鼀 #Wv� #YS� c C鈛 Thi阯 Th醝#W.")
			AddText(sceneId,"Th錸g c Long V錸 c 7 皙n 8, c ti陁 hao nh 鸶nh s� l唼ng #YNg鱟 Long Th鼀 #Wv� #YTrung c C鈛 Thi阯 Th醝#W. Long v錸 th錸g c l阯 9 c ti陁 hao nh 鸶nh s� l唼ng #YNg鱟 Long Th鼀 #Wv� #YCao c C鈛 Thi阯 Th醝#W.")
			AddText(sceneId,"#r#c00ffff(Thao t醕 n鄖 c 餰m Long V錸 疬㧟 kh鋗 b鋙 th誧h to鄋 b� th醥 xu痭g, n猽 kh鬾g b鋙 th誧h s� bi猲 m)")
			AddNumText(sceneId,x892005_g_ScriptId,"Th錸g c Long V錸 - Huy玭 (C 1)",6,29)
			AddNumText(sceneId,x892005_g_ScriptId,"Th錸g c Long V錸 - Huy玭 (C 2)",6,30)
			AddNumText(sceneId,x892005_g_ScriptId,"Th錸g c Long V錸 - Huy玭 (C 3)",6,31)
			AddNumText(sceneId,x892005_g_ScriptId,"Th錸g c Long V錸 - Huy玭 (C 4)",6,84)
			AddNumText(sceneId,x892005_g_ScriptId,"Th錸g c Long V錸 - Huy玭 (C 5)",6,85)
			AddNumText(sceneId,x892005_g_ScriptId,"Th錸g c Long V錸 - Huy玭 (C 6)",6,86)
			AddNumText(sceneId,x892005_g_ScriptId,"Th錸g c Long V錸 - Huy玭 (C 7)",6,87)
			AddNumText(sceneId,x892005_g_ScriptId,"Th錸g c Long V錸 - Huy玭 (C 8)",6,88)
			AddNumText(sceneId,x892005_g_ScriptId,"Th錸g c Long V錸 - Huy玭 (C 9)",6,89)
			AddNumText(sceneId,x892005_g_ScriptId,"Th錸g c Long V錸 - Huy玭 (C 10)",6,90)
			AddNumText(sceneId,x892005_g_ScriptId,"Long V錸 t鄆 li畊 thuy猼 minh",6,800)

			AddNumText(sceneId,x892005_g_ScriptId,"Quay l読",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 15 then
		BeginEvent(sceneId)
			AddText(sceneId,"#cfff263Th錸g c Long V錸 th h絥 5, ng呓i c� th� ti陁 hao nh 鸶nh s� l唼ng #YNg鱟 Long Th鼀#W. Th錸g c Long V錸  t� 5 皙n 6 c ti陁 hao nh 鸶nh s� l唼ng #YNg鱟 Long Th鼀 #Wv� #YS� c C鈛 Thi阯 Th醝#W.")
			AddText(sceneId,"Th錸g c Long V錸 c 7 皙n 8, c ti陁 hao nh 鸶nh s� l唼ng #YNg鱟 Long Th鼀 #Wv� #YTrung c C鈛 Thi阯 Th醝#W. Long v錸 th錸g c l阯 9 c ti陁 hao nh 鸶nh s� l唼ng #YNg鱟 Long Th鼀 #Wv� #YCao c C鈛 Thi阯 Th醝#W.")
			AddText(sceneId,"#r#c00ffff(Thao t醕 n鄖 c 餰m Long V錸 疬㧟 kh鋗 b鋙 th誧h to鄋 b� th醥 xu痭g, n猽 kh鬾g b鋙 th誧h s� bi猲 m)")
			AddNumText(sceneId,x892005_g_ScriptId,"Th錸g c Long V錸 - 械c (C 1)",6,32)
			AddNumText(sceneId,x892005_g_ScriptId,"Th錸g c Long V錸 - 械c (C 2)",6,33)
			AddNumText(sceneId,x892005_g_ScriptId,"Th錸g c Long V錸 - 械c (C 3)",6,34)
			AddNumText(sceneId,x892005_g_ScriptId,"Th錸g c Long V錸 - 械c (C 4)",6,91)
			AddNumText(sceneId,x892005_g_ScriptId,"Th錸g c Long V錸 - 械c (C 5)",6,92)
			AddNumText(sceneId,x892005_g_ScriptId,"Th錸g c Long V錸 - 械c (C 6)",6,93)
			AddNumText(sceneId,x892005_g_ScriptId,"Th錸g c Long V錸 - 械c (C 7)",6,94)
			AddNumText(sceneId,x892005_g_ScriptId,"Th錸g c Long V錸 - 械c (C 8)",6,95)
			AddNumText(sceneId,x892005_g_ScriptId,"Th錸g c Long V錸 - 械c (C 9)",6,96)
			AddNumText(sceneId,x892005_g_ScriptId,"Th錸g c Long V錸 - 械c (C 10)",6,97)
			AddNumText(sceneId,x892005_g_ScriptId,"Long V錸 t鄆 li畊 thuy猼 minh",6,800)

			AddNumText(sceneId,x892005_g_ScriptId,"Quay l読",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 16 then
		BeginEvent(sceneId)
			AddText(sceneId,"    #cfff263T thu礳 t韓h Long V錸 c ti陁 hao nh 鸶nh s� l唼ng #GT竛h V鈔 Th鼀#cfff263.#r Long V錸 sau khi t thu礳 t韓h, kh� n錸g xu hi畁 thu礳 t韓h ng nhi阯, ch� c ng呓i nh鈔 ph t痶, c� th� ra 16 thu礳 t韓h c馽 ph.")
			AddText(sceneId,"#r#c00ffff(Thao t醕 n鄖 c 餰m Long V錸 疬㧟 kh鋗 b鋙 th誧h to鄋 b� th醥 xu痭g, n猽 kh鬾g b鋙 th誧h s� bi猲 m)")
			AddNumText(sceneId,x892005_g_ScriptId,"T thu礳 t韓h Long V錸 B錸g (C 1)",6,35)
			AddNumText(sceneId,x892005_g_ScriptId,"T thu礳 t韓h Long V錸 B錸g (C 2)",6,36)
			AddNumText(sceneId,x892005_g_ScriptId,"T thu礳 t韓h Long V錸 B錸g (C 3)",6,37)
			AddNumText(sceneId,x892005_g_ScriptId,"T thu礳 t韓h Long V錸 B錸g (C 4)",6,38)
			AddNumText(sceneId,x892005_g_ScriptId,"T thu礳 t韓h Long V錸 B錸g (C 5)",6,98)
			AddNumText(sceneId,x892005_g_ScriptId,"T thu礳 t韓h Long V錸 B錸g (C 6)",6,99)
			AddNumText(sceneId,x892005_g_ScriptId,"T thu礳 t韓h Long V錸 B錸g (C 7)",6,100)
			AddNumText(sceneId,x892005_g_ScriptId,"T thu礳 t韓h Long V錸 B錸g (C 8)",6,101)
			AddNumText(sceneId,x892005_g_ScriptId,"T thu礳 t韓h Long V錸 B錸g (C 9)",6,102)
			AddNumText(sceneId,x892005_g_ScriptId,"T thu礳 t韓h Long V錸 B錸g (C 10)",6,103)
			AddNumText(sceneId,x892005_g_ScriptId,"Gi緄 thi畊 t thu礳 t韓h Long V錸",6,999)

			AddNumText(sceneId,x892005_g_ScriptId,"Quay l読",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 17 then
		BeginEvent(sceneId)
			AddText(sceneId,"    #cfff263T thu礳 t韓h Long V錸 c ti陁 hao nh 鸶nh s� l唼ng #GT竛h V鈔 Th鼀#cfff263.#r Long V錸 sau khi t thu礳 t韓h, kh� n錸g xu hi畁 thu礳 t韓h ng nhi阯, ch� c ng呓i nh鈔 ph t痶, c� th� ra 16 thu礳 t韓h c馽 ph.")
			AddText(sceneId,"#r#c00ffff(Thao t醕 n鄖 c 餰m Long V錸 疬㧟 kh鋗 b鋙 th誧h to鄋 b� th醥 xu痭g, n猽 kh鬾g b鋙 th誧h s� bi猲 m)")
			AddNumText(sceneId,x892005_g_ScriptId,"T thu礳 t韓h Long V錸 H鯽 (C 1)",6,39)
			AddNumText(sceneId,x892005_g_ScriptId,"T thu礳 t韓h Long V錸 H鯽 (C 2)",6,40)
			AddNumText(sceneId,x892005_g_ScriptId,"T thu礳 t韓h Long V錸 H鯽 (C 3)",6,41)
			AddNumText(sceneId,x892005_g_ScriptId,"T thu礳 t韓h Long V錸 H鯽 (C 4)",6,42)
			AddNumText(sceneId,x892005_g_ScriptId,"T thu礳 t韓h Long V錸 H鯽 (C 5)",6,104)
			AddNumText(sceneId,x892005_g_ScriptId,"T thu礳 t韓h Long V錸 H鯽 (C 6)",6,105)
			AddNumText(sceneId,x892005_g_ScriptId,"T thu礳 t韓h Long V錸 H鯽 (C 7)",6,106)
			AddNumText(sceneId,x892005_g_ScriptId,"T thu礳 t韓h Long V錸 H鯽 (C 8)",6,107)
			AddNumText(sceneId,x892005_g_ScriptId,"T thu礳 t韓h Long V錸 H鯽 (C 9)",6,108)
			AddNumText(sceneId,x892005_g_ScriptId,"T thu礳 t韓h Long V錸 H鯽 (C 10)",6,109)
			AddNumText(sceneId,x892005_g_ScriptId,"Gi緄 thi畊 t thu礳 t韓h Long V錸",6,999)

			AddNumText(sceneId,x892005_g_ScriptId,"Quay l読",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 18 then
		BeginEvent(sceneId)
			AddText(sceneId,"    #cfff263T thu礳 t韓h Long V錸 c ti陁 hao nh 鸶nh s� l唼ng #GT竛h V鈔 Th鼀#cfff263.#r Long V錸 sau khi t thu礳 t韓h, kh� n錸g xu hi畁 thu礳 t韓h ng nhi阯, ch� c ng呓i nh鈔 ph t痶, c� th� ra 16 thu礳 t韓h c馽 ph.")
			AddText(sceneId,"#r#c00ffff(Thao t醕 n鄖 c 餰m Long V錸 疬㧟 kh鋗 b鋙 th誧h to鄋 b� th醥 xu痭g, n猽 kh鬾g b鋙 th誧h s� bi猲 m)")
			AddNumText(sceneId,x892005_g_ScriptId,"T thu礳 t韓h Long V錸 Huy玭 (C 1)",6,43)
			AddNumText(sceneId,x892005_g_ScriptId,"T thu礳 t韓h Long V錸 Huy玭 (C 2)",6,44)
			AddNumText(sceneId,x892005_g_ScriptId,"T thu礳 t韓h Long V錸 Huy玭 (C 3)",6,45)
			AddNumText(sceneId,x892005_g_ScriptId,"T thu礳 t韓h Long V錸 Huy玭 (C 4)",6,46)
			AddNumText(sceneId,x892005_g_ScriptId,"T thu礳 t韓h Long V錸 Huy玭 (C 5)",6,110)
			AddNumText(sceneId,x892005_g_ScriptId,"T thu礳 t韓h Long V錸 Huy玭 (C 6)",6,111)
			AddNumText(sceneId,x892005_g_ScriptId,"T thu礳 t韓h Long V錸 Huy玭 (C 7)",6,112)
			AddNumText(sceneId,x892005_g_ScriptId,"T thu礳 t韓h Long V錸 Huy玭 (C 8)",6,113)
			AddNumText(sceneId,x892005_g_ScriptId,"T thu礳 t韓h Long V錸 Huy玭 (C 9)",6,114)
			AddNumText(sceneId,x892005_g_ScriptId,"T thu礳 t韓h Long V錸 Huy玭 (C 10)",6,115)
			AddNumText(sceneId,x892005_g_ScriptId,"Gi緄 thi畊 t thu礳 t韓h Long V錸",6,999)

			AddNumText(sceneId,x892005_g_ScriptId,"Quay l読",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 19 then
		BeginEvent(sceneId)
			AddText(sceneId,"    #cfff263T thu礳 t韓h Long V錸 c ti陁 hao nh 鸶nh s� l唼ng #GT竛h V鈔 Th鼀#cfff263.#r Long V錸 sau khi t thu礳 t韓h, kh� n錸g xu hi畁 thu礳 t韓h ng nhi阯, ch� c ng呓i nh鈔 ph t痶, c� th� ra 16 thu礳 t韓h c馽 ph.")
			AddText(sceneId,"#r#c00ffff(Thao t醕 n鄖 c 餰m Long V錸 疬㧟 kh鋗 b鋙 th誧h to鄋 b� th醥 xu痭g, n猽 kh鬾g b鋙 th誧h s� bi猲 m)")
			AddNumText(sceneId,x892005_g_ScriptId,"T thu礳 t韓h Long V錸 械c (C 1)",6,47)
			AddNumText(sceneId,x892005_g_ScriptId,"T thu礳 t韓h Long V錸 械c (C 2)",6,48)
			AddNumText(sceneId,x892005_g_ScriptId,"T thu礳 t韓h Long V錸 械c (C 3)",6,49)
			AddNumText(sceneId,x892005_g_ScriptId,"T thu礳 t韓h Long V錸 械c (C 4)",6,50)
			AddNumText(sceneId,x892005_g_ScriptId,"T thu礳 t韓h Long V錸 械c (C 5)",6,116)
			AddNumText(sceneId,x892005_g_ScriptId,"T thu礳 t韓h Long V錸 械c (C 6)",6,117)
			AddNumText(sceneId,x892005_g_ScriptId,"T thu礳 t韓h Long V錸 械c (C 7)",6,118)
			AddNumText(sceneId,x892005_g_ScriptId,"T thu礳 t韓h Long V錸 械c (C 8)",6,119)
			AddNumText(sceneId,x892005_g_ScriptId,"T thu礳 t韓h Long V錸 械c (C 9)",6,120)
			AddNumText(sceneId,x892005_g_ScriptId,"T thu礳 t韓h Long V錸 械c (C 10)",6,121)
			AddNumText(sceneId,x892005_g_ScriptId,"Gi緄 thi畊 t thu礳 t韓h Long V錸",6,999)

			AddNumText(sceneId,x892005_g_ScriptId,"Quay l読",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 20 then
		BeginEvent(sceneId)
			AddText(sceneId,"M秈 l馻 ch鱪 thu礳 t韓h m� r祅g!")
			AddNumText(sceneId,x892005_g_ScriptId,"M� r祅g thu礳 t韓h Long V錸 c 1 (B錸g)",6,51)
			AddNumText(sceneId,x892005_g_ScriptId,"M� r祅g thu礳 t韓h Long V錸 c 1 (H鯽)",6,52)
			AddNumText(sceneId,x892005_g_ScriptId,"M� r祅g thu礳 t韓h Long V錸 c 1 (Huy玭)",6,53)
			AddNumText(sceneId,x892005_g_ScriptId,"M� r祅g thu礳 t韓h Long V錸 c 1 (械c)",6,54)
			AddNumText(sceneId,x892005_g_ScriptId,"Quay l読",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 21 then
		BeginEvent(sceneId)
			AddText(sceneId,"M秈 l馻 ch鱪 thu礳 t韓h m� r祅g!")
			AddNumText(sceneId,x892005_g_ScriptId,"M� r祅g thu礳 t韓h Long V錸 c 2 (B錸g)",6,55)
			AddNumText(sceneId,x892005_g_ScriptId,"M� r祅g thu礳 t韓h Long V錸 c 2 (H鯽)",6,56)
			AddNumText(sceneId,x892005_g_ScriptId,"M� r祅g thu礳 t韓h Long V錸 c 2 (Huy玭)",6,57)
			AddNumText(sceneId,x892005_g_ScriptId,"M� r祅g thu礳 t韓h Long V錸 c 2 (械c)",6,58)
			AddNumText(sceneId,x892005_g_ScriptId,"Quay l読",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 22 then
		BeginEvent(sceneId)
			AddText(sceneId,"M秈 l馻 ch鱪 thu礳 t韓h m� r祅g!")
			AddNumText(sceneId,x892005_g_ScriptId,"M� r祅g thu礳 t韓h Long V錸 c 3 (B錸g)",6,59)
			AddNumText(sceneId,x892005_g_ScriptId,"M� r祅g thu礳 t韓h Long V錸 c 3 (H鯽)",6,60)
			AddNumText(sceneId,x892005_g_ScriptId,"M� r祅g thu礳 t韓h Long V錸 c 3 (Huy玭)",6,61)
			AddNumText(sceneId,x892005_g_ScriptId,"M� r祅g thu礳 t韓h Long V錸 c 3 (械c)",6,62)
			AddNumText(sceneId,x892005_g_ScriptId,"Quay l読",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 23 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157004)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310176)
              if c0 >=1 and c1 >=20 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157004,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310176,20)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157005, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, long v錸 th錸g c th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊. C Long V錸 c鵱g #Y20 c醝 #GNg鱟 Long Th鼀!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 24 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157005)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310176)
              if c0 >=1 and c1 >=20 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157005,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310176,20)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157009, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#H#W#{_INFOMSG%s}#W th錸g c! Thu nhi阯 gian t鈔 th鄋h L誧 D呓ng n礽 thi阯 h鬾 鸶a 醡, ch� th m鱥 ng叨i 皤u th鑝 nh� d鉯, t� nay v� sau l読 c� m祎 th binh l㱮 kh� r絠 xu痭g nh鈔 gian!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )

		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, long v錸 th錸g c th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊. C Long V錸 c鵱g #Y20 c醝 #GNg鱟 Long Th鼀!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 25 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157009)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310176)
              if c0 >=1 and c1 >=40 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157009,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310176,40)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157013, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#H#W#{_INFOMSG%s}#W th錸g c! Thu nhi阯 gian t鈔 th鄋h L誧 D呓ng n礽 thi阯 h鬾 鸶a 醡, ch� th m鱥 ng叨i 皤u th鑝 nh� d鉯, t� nay v� sau l読 c� m祎 th binh l㱮 kh� r絠 xu痭g nh鈔 gian!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, long v錸 th錸g c th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊. C Long V錸 c鵱g #Y40 c醝 #GNg鱟 Long Th鼀!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end


	elseif NumText == 70 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157013)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310176)
              if c0 >=1 and c1 >=80 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157013,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310176,80)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157017, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#H#W#{_INFOMSG%s}#W th錸g c! Thu nhi阯 gian t鈔 th鄋h L誧 D呓ng n礽 thi阯 h鬾 鸶a 醡, ch� th m鱥 ng叨i 皤u th鑝 nh� d鉯, t� nay v� sau l読 c� m祎 th binh l㱮 kh� r絠 xu痭g nh鈔 gian!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, long v錸 th錸g c th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊. C Long V錸 c鵱g #Y80 c醝 #GNg鱟 Long Th鼀!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 71 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157017)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310176)
		c2 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310177)
              if c0 >=1 and c1 >=160 and c2 >=30 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157017,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310176,160)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310177,30)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157021, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#H#W#{_INFOMSG%s}#W th錸g c! Thu nhi阯 gian t鈔 th鄋h L誧 D呓ng n礽 thi阯 h鬾 鸶a 醡, ch� th m鱥 ng叨i 皤u th鑝 nh� d鉯, t� nay v� sau l読 c� m祎 th binh l㱮 kh� r絠 xu痭g nh鈔 gian!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, long v錸 th錸g c th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊. C Long V錸 v� #Y160 c醝 #GNg鱟 Long Th鼀 c鵱g #Y30 c醝 #GS� c C鈛 Thi阯 Th醝!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 72 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157021)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310176)
		c2 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310177)
              if c0 >=1 and c1 >=240 and c2 >=30 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157021,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310176,240)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310177,30)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157025, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#H#W#{_INFOMSG%s}#W th錸g c! Thu nhi阯 gian t鈔 th鄋h L誧 D呓ng n礽 thi阯 h鬾 鸶a 醡, ch� th m鱥 ng叨i 皤u th鑝 nh� d鉯, t� nay v� sau l読 c� m祎 th binh l㱮 kh� r絠 xu痭g nh鈔 gian!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, long v錸 th錸g c th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊. C Long V錸 v� #Y240 c醝 #GNg鱟 Long Th鼀 c鵱g #Y30 c醝 #GS� c C鈛 Thi阯 Th醝!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 73 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157025)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310176)
		c2 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310178)
              if c0 >=1 and c1 >=300 and c2 >=30 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157025,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310176,300)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310178,30)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157029, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#H#W#{_INFOMSG%s}#W th錸g c! Thu nhi阯 gian t鈔 th鄋h L誧 D呓ng n礽 thi阯 h鬾 鸶a 醡, ch� th m鱥 ng叨i 皤u th鑝 nh� d鉯, t� nay v� sau l読 c� m祎 th binh l㱮 kh� r絠 xu痭g nh鈔 gian!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, long v錸 th錸g c th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊. C Long V錸 v� #Y300 c醝 #GNg鱟 Long Th鼀 c鵱g #Y30 c醝 #GTrung c C鈛 Thi阯 Th醝!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 74 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157029)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310176)
		c2 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310178)
              if c0 >=1 and c1 >=400 and c2 >=30 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157029,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310176,400)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310178,30)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157033, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#H#W#{_INFOMSG%s}#W th錸g c! Thu nhi阯 gian t鈔 th鄋h L誧 D呓ng n礽 thi阯 h鬾 鸶a 醡, ch� th m鱥 ng叨i 皤u th鑝 nh� d鉯, t� nay v� sau l読 c� m祎 th binh l㱮 kh� r絠 xu痭g nh鈔 gian!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, long v錸 th錸g c th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊. C Long V錸 v� #Y400 c醝 #GNg鱟 Long Th鼀 c鵱g #Y30 c醝 #GTrung c C鈛 Thi阯 Th醝!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 75 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157033)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310176)
		c2 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310179)
              if c0 >=1 and c1 >=450 and c2 >=30 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157033,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310176,450)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310179,30)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157037, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#H#W#{_INFOMSG%s}#W th錸g c! Thu nhi阯 gian t鈔 th鄋h L誧 D呓ng n礽 thi阯 h鬾 鸶a 醡, ch� th m鱥 ng叨i 皤u th鑝 nh� d鉯, t� nay v� sau l読 c� m祎 th binh l㱮 kh� r絠 xu痭g nh鈔 gian!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, long v錸 th錸g c th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊. C Long V錸 v� #Y450 c醝 #GNg鱟 Long Th鼀 c鵱g #Y30c醝 #GCao c C鈛 Thi阯 Th醝!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 76 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157037)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310176)
		c2 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310179)
              if c0 >=1 and c1 >=500 and c2 >=30 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157037,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310176,500)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310179,30)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157041, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#H#W#{_INFOMSG%s}#W th錸g c! Thu nhi阯 gian t鈔 th鄋h L誧 D呓ng n礽 thi阯 h鬾 鸶a 醡, ch� th m鱥 ng叨i 皤u th鑝 nh� d鉯, t� nay v� sau l読 c� m祎 th binh l㱮 kh� r絠 xu痭g nh鈔 gian!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, long v錸 th錸g c th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊. C Long V錸 v� #Y500 c醝 #GNg鱟 Long Th鼀 c鵱g #Y30c醝 #GCao c C鈛 Thi阯 Th醝!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 26 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157004)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310176)
              if c0 >=1 and c1 >=20 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157004,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310176,20)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157006, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, long v錸 th錸g c th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊. C Long V錸 c鵱g #Y20 c醝 #GNg鱟 Long Th鼀!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 27 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157006)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310176)
              if c0 >=1 and c1 >=20 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157006,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310176,20)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157010, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#H#W#{_INFOMSG%s}#W th錸g c! Thu nhi阯 gian t鈔 th鄋h L誧 D呓ng n礽 thi阯 h鬾 鸶a 醡, ch� th m鱥 ng叨i 皤u th鑝 nh� d鉯, t� nay v� sau l読 c� m祎 th binh l㱮 kh� r絠 xu痭g nh鈔 gian!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )

		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, long v錸 th錸g c th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊. C Long V錸 c鵱g #Y20 c醝 #GNg鱟 Long Th鼀!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 28 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157010)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310176)
              if c0 >=1 and c1 >=40 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157010,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310176,40)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157014, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#H#W#{_INFOMSG%s}#W th錸g c! Thu nhi阯 gian t鈔 th鄋h L誧 D呓ng n礽 thi阯 h鬾 鸶a 醡, ch� th m鱥 ng叨i 皤u th鑝 nh� d鉯, t� nay v� sau l読 c� m祎 th binh l㱮 kh� r絠 xu痭g nh鈔 gian!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, long v錸 th錸g c th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊. C Long V錸 c鵱g #Y40 c醝 #GNg鱟 Long Th鼀!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end


	elseif NumText == 77 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157014)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310176)
              if c0 >=1 and c1 >=80 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157014,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310176,80)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157018, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#H#W#{_INFOMSG%s}#W th錸g c! Thu nhi阯 gian t鈔 th鄋h L誧 D呓ng n礽 thi阯 h鬾 鸶a 醡, ch� th m鱥 ng叨i 皤u th鑝 nh� d鉯, t� nay v� sau l読 c� m祎 th binh l㱮 kh� r絠 xu痭g nh鈔 gian!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, long v錸 th錸g c th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊. C Long V錸 c鵱g #Y80 c醝 #GNg鱟 Long Th鼀!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 78 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157018)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310176)
		c2 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310177)
              if c0 >=1 and c1 >=160 and c2 >=30 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157018,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310176,160)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310177,30)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157022, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#H#W#{_INFOMSG%s}#W th錸g c! Thu nhi阯 gian t鈔 th鄋h L誧 D呓ng n礽 thi阯 h鬾 鸶a 醡, ch� th m鱥 ng叨i 皤u th鑝 nh� d鉯, t� nay v� sau l読 c� m祎 th binh l㱮 kh� r絠 xu痭g nh鈔 gian!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, long v錸 th錸g c th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊. C Long V錸 v� #Y160 c醝 #GNg鱟 Long Th鼀 c鵱g #Y30 c醝 #GS� c C鈛 Thi阯 Th醝!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 79 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157022)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310176)
		c2 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310177)
              if c0 >=1 and c1 >=240 and c2 >=30 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157022,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310176,240)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310177,30)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157026, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#H#W#{_INFOMSG%s}#W th錸g c! Thu nhi阯 gian t鈔 th鄋h L誧 D呓ng n礽 thi阯 h鬾 鸶a 醡, ch� th m鱥 ng叨i 皤u th鑝 nh� d鉯, t� nay v� sau l読 c� m祎 th binh l㱮 kh� r絠 xu痭g nh鈔 gian!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, long v錸 th錸g c th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊. C Long V錸 v� #Y240 c醝 #GNg鱟 Long Th鼀 c鵱g #Y30 c醝 #GS� c C鈛 Thi阯 Th醝!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 80 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157026)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310176)
		c2 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310178)
              if c0 >=1 and c1 >=300 and c2 >=30 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157026,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310176,300)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310178,30)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157030, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#H#W#{_INFOMSG%s}#W th錸g c! Thu nhi阯 gian t鈔 th鄋h L誧 D呓ng n礽 thi阯 h鬾 鸶a 醡, ch� th m鱥 ng叨i 皤u th鑝 nh� d鉯, t� nay v� sau l読 c� m祎 th binh l㱮 kh� r絠 xu痭g nh鈔 gian!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, long v錸 th錸g c th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊. C Long V錸 v� #Y300 c醝 #GNg鱟 Long Th鼀 c鵱g #Y30 c醝 #GTrung c C鈛 Thi阯 Th醝!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 81 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157030)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310176)
		c2 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310178)
              if c0 >=1 and c1 >=400 and c2 >=30 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157030,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310176,400)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310178,30)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157034, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#H#W#{_INFOMSG%s}#W th錸g c! Thu nhi阯 gian t鈔 th鄋h L誧 D呓ng n礽 thi阯 h鬾 鸶a 醡, ch� th m鱥 ng叨i 皤u th鑝 nh� d鉯, t� nay v� sau l読 c� m祎 th binh l㱮 kh� r絠 xu痭g nh鈔 gian!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, long v錸 th錸g c th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊. C Long V錸 v� #Y400 c醝 #GNg鱟 Long Th鼀 c鵱g #Y30 c醝 #GTrung c C鈛 Thi阯 Th醝!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 82 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157034)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310176)
		c2 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310179)
              if c0 >=1 and c1 >=450 and c2 >=30 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157034,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310176,450)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310179,30)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157038, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#H#W#{_INFOMSG%s}#W th錸g c! Thu nhi阯 gian t鈔 th鄋h L誧 D呓ng n礽 thi阯 h鬾 鸶a 醡, ch� th m鱥 ng叨i 皤u th鑝 nh� d鉯, t� nay v� sau l読 c� m祎 th binh l㱮 kh� r絠 xu痭g nh鈔 gian!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, long v錸 th錸g c th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊. C Long V錸 v� #Y450 c醝 #GNg鱟 Long Th鼀 c鵱g #Y30c醝 #GCao c C鈛 Thi阯 Th醝!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 83 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157038)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310176)
		c2 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310179)
              if c0 >=1 and c1 >=500 and c2 >=30 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157038,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310176,500)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310179,30)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157042, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#H#W#{_INFOMSG%s}#W th錸g c! Thu nhi阯 gian t鈔 th鄋h L誧 D呓ng n礽 thi阯 h鬾 鸶a 醡, ch� th m鱥 ng叨i 皤u th鑝 nh� d鉯, t� nay v� sau l読 c� m祎 th binh l㱮 kh� r絠 xu痭g nh鈔 gian!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, long v錸 th錸g c th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊. C Long V錸 v� #Y500 c醝 #GNg鱟 Long Th鼀 c鵱g #Y30c醝 #GCao c C鈛 Thi阯 Th醝!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 29 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157004)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310176)
              if c0 >=1 and c1 >=20 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157004,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310176,20)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157007, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, long v錸 th錸g c th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊. C Long V錸 c鵱g #Y20 c醝 #GNg鱟 Long Th鼀!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 30 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157007)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310176)
              if c0 >=1 and c1 >=20 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157007,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310176,20)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157011, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#H#W#{_INFOMSG%s}#W th錸g c! Thu nhi阯 gian t鈔 th鄋h L誧 D呓ng n礽 thi阯 h鬾 鸶a 醡, ch� th m鱥 ng叨i 皤u th鑝 nh� d鉯, t� nay v� sau l読 c� m祎 th binh l㱮 kh� r絠 xu痭g nh鈔 gian!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )

		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, long v錸 th錸g c th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊. C Long V錸 c鵱g #Y20 c醝 #GNg鱟 Long Th鼀!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 31 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157011)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310176)
              if c0 >=1 and c1 >=40 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157011,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310176,40)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157015, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#H#W#{_INFOMSG%s}#W th錸g c! Thu nhi阯 gian t鈔 th鄋h L誧 D呓ng n礽 thi阯 h鬾 鸶a 醡, ch� th m鱥 ng叨i 皤u th鑝 nh� d鉯, t� nay v� sau l読 c� m祎 th binh l㱮 kh� r絠 xu痭g nh鈔 gian!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, long v錸 th錸g c th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊. C Long V錸 c鵱g #Y40 c醝 #GNg鱟 Long Th鼀!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end


	elseif NumText == 84 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157015)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310176)
              if c0 >=1 and c1 >=80 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157015,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310176,80)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157019, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#H#W#{_INFOMSG%s}#W th錸g c! Thu nhi阯 gian t鈔 th鄋h L誧 D呓ng n礽 thi阯 h鬾 鸶a 醡, ch� th m鱥 ng叨i 皤u th鑝 nh� d鉯, t� nay v� sau l読 c� m祎 th binh l㱮 kh� r絠 xu痭g nh鈔 gian!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, long v錸 th錸g c th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊. C Long V錸 c鵱g #Y80 c醝 #GNg鱟 Long Th鼀!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 85 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157019)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310176)
		c2 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310177)
              if c0 >=1 and c1 >=160 and c2 >=30 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157019,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310176,160)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310177,30)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157023, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#H#W#{_INFOMSG%s}#W th錸g c! Thu nhi阯 gian t鈔 th鄋h L誧 D呓ng n礽 thi阯 h鬾 鸶a 醡, ch� th m鱥 ng叨i 皤u th鑝 nh� d鉯, t� nay v� sau l読 c� m祎 th binh l㱮 kh� r絠 xu痭g nh鈔 gian!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, long v錸 th錸g c th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊. C Long V錸 v� #Y160 c醝 #GNg鱟 Long Th鼀 c鵱g #Y30 c醝 #GS� c C鈛 Thi阯 Th醝!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 86 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157023)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310176)
		c2 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310177)
              if c0 >=1 and c1 >=240 and c2 >=30 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157023,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310176,240)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310177,30)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157027, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#H#W#{_INFOMSG%s}#W th錸g c! Thu nhi阯 gian t鈔 th鄋h L誧 D呓ng n礽 thi阯 h鬾 鸶a 醡, ch� th m鱥 ng叨i 皤u th鑝 nh� d鉯, t� nay v� sau l読 c� m祎 th binh l㱮 kh� r絠 xu痭g nh鈔 gian!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, long v錸 th錸g c th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊. C Long V錸 v� #Y240 c醝 #GNg鱟 Long Th鼀 c鵱g #Y30 c醝 #GS� c C鈛 Thi阯 Th醝!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 87 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157027)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310176)
		c2 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310178)
              if c0 >=1 and c1 >=300 and c2 >=30 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157027,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310176,300)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310178,30)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157031, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#H#W#{_INFOMSG%s}#W th錸g c! Thu nhi阯 gian t鈔 th鄋h L誧 D呓ng n礽 thi阯 h鬾 鸶a 醡, ch� th m鱥 ng叨i 皤u th鑝 nh� d鉯, t� nay v� sau l読 c� m祎 th binh l㱮 kh� r絠 xu痭g nh鈔 gian!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, long v錸 th錸g c th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊. C Long V錸 v� #Y300 c醝 #GNg鱟 Long Th鼀 c鵱g #Y30 c醝 #GTrung c C鈛 Thi阯 Th醝!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 88 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157031)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310176)
		c2 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310178)
              if c0 >=1 and c1 >=400 and c2 >=30 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157031,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310176,400)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310178,30)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157035, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#H#W#{_INFOMSG%s}#W th錸g c! Thu nhi阯 gian t鈔 th鄋h L誧 D呓ng n礽 thi阯 h鬾 鸶a 醡, ch� th m鱥 ng叨i 皤u th鑝 nh� d鉯, t� nay v� sau l読 c� m祎 th binh l㱮 kh� r絠 xu痭g nh鈔 gian!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, long v錸 th錸g c th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊. C Long V錸 v� #Y400 c醝 #GNg鱟 Long Th鼀 c鵱g #Y30 c醝 #GTrung c C鈛 Thi阯 Th醝!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 89 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157035)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310176)
		c2 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310179)
              if c0 >=1 and c1 >=450 and c2 >=30 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157035,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310176,450)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310179,30)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157039, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#H#W#{_INFOMSG%s}#W th錸g c! Thu nhi阯 gian t鈔 th鄋h L誧 D呓ng n礽 thi阯 h鬾 鸶a 醡, ch� th m鱥 ng叨i 皤u th鑝 nh� d鉯, t� nay v� sau l読 c� m祎 th binh l㱮 kh� r絠 xu痭g nh鈔 gian!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, long v錸 th錸g c th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊. C Long V錸 v� #Y450 c醝 #GNg鱟 Long Th鼀 c鵱g #Y30c醝 #GCao c C鈛 Thi阯 Th醝!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 90 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157039)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310176)
		c2 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310179)
              if c0 >=1 and c1 >=500 and c2 >=30 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157039,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310176,500)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310179,30)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157043, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#H#W#{_INFOMSG%s}#W th錸g c! Thu nhi阯 gian t鈔 th鄋h L誧 D呓ng n礽 thi阯 h鬾 鸶a 醡, ch� th m鱥 ng叨i 皤u th鑝 nh� d鉯, t� nay v� sau l読 c� m祎 th binh l㱮 kh� r絠 xu痭g nh鈔 gian!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, long v錸 th錸g c th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊. C Long V錸 v� #Y500 c醝 #GNg鱟 Long Th鼀 c鵱g #Y30c醝 #GCao c C鈛 Thi阯 Th醝!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 32 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157004)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310176)
              if c0 >=1 and c1 >=20 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157004,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310176,20)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157008, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, long v錸 th錸g c th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊. C Long V錸 c鵱g #Y20 c醝 #GNg鱟 Long Th鼀!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 33 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157008)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310176)
              if c0 >=1 and c1 >=20 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157008,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310176,20)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157012, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#H#W#{_INFOMSG%s}#W th錸g c! Thu nhi阯 gian t鈔 th鄋h L誧 D呓ng n礽 thi阯 h鬾 鸶a 醡, ch� th m鱥 ng叨i 皤u th鑝 nh� d鉯, t� nay v� sau l読 c� m祎 th binh l㱮 kh� r絠 xu痭g nh鈔 gian!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )

		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, long v錸 th錸g c th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊. C Long V錸 c鵱g #Y20 c醝 #GNg鱟 Long Th鼀!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 34 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157012)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310176)
              if c0 >=1 and c1 >=40 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157012,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310176,40)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157016, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#H#W#{_INFOMSG%s}#W th錸g c! Thu nhi阯 gian t鈔 th鄋h L誧 D呓ng n礽 thi阯 h鬾 鸶a 醡, ch� th m鱥 ng叨i 皤u th鑝 nh� d鉯, t� nay v� sau l読 c� m祎 th binh l㱮 kh� r絠 xu痭g nh鈔 gian!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, long v錸 th錸g c th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊. C Long V錸 c鵱g #Y40 c醝 #GNg鱟 Long Th鼀!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end


	elseif NumText == 91 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157016)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310176)
              if c0 >=1 and c1 >=80 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157016,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310176,80)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157020, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#H#W#{_INFOMSG%s}#W th錸g c! Thu nhi阯 gian t鈔 th鄋h L誧 D呓ng n礽 thi阯 h鬾 鸶a 醡, ch� th m鱥 ng叨i 皤u th鑝 nh� d鉯, t� nay v� sau l読 c� m祎 th binh l㱮 kh� r絠 xu痭g nh鈔 gian!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, long v錸 th錸g c th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊. C Long V錸 c鵱g #Y80 c醝 #GNg鱟 Long Th鼀!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 92 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157020)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310176)
		c2 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310177)
              if c0 >=1 and c1 >=160 and c2 >=30 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157020,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310176,160)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310177,30)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157024, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#H#W#{_INFOMSG%s}#W th錸g c! Thu nhi阯 gian t鈔 th鄋h L誧 D呓ng n礽 thi阯 h鬾 鸶a 醡, ch� th m鱥 ng叨i 皤u th鑝 nh� d鉯, t� nay v� sau l読 c� m祎 th binh l㱮 kh� r絠 xu痭g nh鈔 gian!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, long v錸 th錸g c th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊. C Long V錸 v� #Y160 c醝 #GNg鱟 Long Th鼀 c鵱g #Y30 c醝 #GS� c C鈛 Thi阯 Th醝!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 93 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157024)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310176)
		c2 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310177)
              if c0 >=1 and c1 >=240 and c2 >=30 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157024,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310176,240)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310177,30)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157028, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#H#W#{_INFOMSG%s}#W th錸g c! Thu nhi阯 gian t鈔 th鄋h L誧 D呓ng n礽 thi阯 h鬾 鸶a 醡, ch� th m鱥 ng叨i 皤u th鑝 nh� d鉯, t� nay v� sau l読 c� m祎 th binh l㱮 kh� r絠 xu痭g nh鈔 gian!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, long v錸 th錸g c th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊. C Long V錸 v� #Y240 c醝 #GNg鱟 Long Th鼀 c鵱g #Y30 c醝 #GS� c C鈛 Thi阯 Th醝!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 94 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157028)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310176)
		c2 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310178)
              if c0 >=1 and c1 >=300 and c2 >=30 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157028,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310176,300)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310178,30)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157032, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#H#W#{_INFOMSG%s}#W th錸g c! Thu nhi阯 gian t鈔 th鄋h L誧 D呓ng n礽 thi阯 h鬾 鸶a 醡, ch� th m鱥 ng叨i 皤u th鑝 nh� d鉯, t� nay v� sau l読 c� m祎 th binh l㱮 kh� r絠 xu痭g nh鈔 gian!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, long v錸 th錸g c th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊. C Long V錸 v� #Y300 c醝 #GNg鱟 Long Th鼀 c鵱g #Y30 c醝 #GTrung c C鈛 Thi阯 Th醝!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 95 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157032)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310176)
		c2 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310178)
              if c0 >=1 and c1 >=400 and c2 >=30 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157032,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310176,400)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310178,30)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157036, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#H#W#{_INFOMSG%s}#W th錸g c! Thu nhi阯 gian t鈔 th鄋h L誧 D呓ng n礽 thi阯 h鬾 鸶a 醡, ch� th m鱥 ng叨i 皤u th鑝 nh� d鉯, t� nay v� sau l読 c� m祎 th binh l㱮 kh� r絠 xu痭g nh鈔 gian!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, long v錸 th錸g c th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊. C Long V錸 v� #Y400 c醝 #GNg鱟 Long Th鼀 c鵱g #Y30 c醝 #GTrung c C鈛 Thi阯 Th醝!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 96 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157036)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310176)
		c2 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310179)
              if c0 >=1 and c1 >=450 and c2 >=30 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157036,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310176,450)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310179,30)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157040, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#H#W#{_INFOMSG%s}#W th錸g c! Thu nhi阯 gian t鈔 th鄋h L誧 D呓ng n礽 thi阯 h鬾 鸶a 醡, ch� th m鱥 ng叨i 皤u th鑝 nh� d鉯, t� nay v� sau l読 c� m祎 th binh l㱮 kh� r絠 xu痭g nh鈔 gian!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, long v錸 th錸g c th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊. C Long V錸 v� #Y450 c醝 #GNg鱟 Long Th鼀 c鵱g #Y30c醝 #GCao c C鈛 Thi阯 Th醝!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 97 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157040)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310176)
		c2 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310179)
              if c0 >=1 and c1 >=500 and c2 >=30 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157040,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310176,500)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310179,30)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157044, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#H#W#{_INFOMSG%s}#W th錸g c! Thu nhi阯 gian t鈔 th鄋h L誧 D呓ng n礽 thi阯 h鬾 鸶a 醡, ch� th m鱥 ng叨i 皤u th鑝 nh� d鉯, t� nay v� sau l読 c� m祎 th binh l㱮 kh� r絠 xu痭g nh鈔 gian!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, long v錸 th錸g c th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊. C Long V錸 v� #Y500 c醝 #GNg鱟 Long Th鼀 c鵱g #Y30c醝 #GCao c C鈛 Thi阯 Th醝!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 35 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157005)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310180)
              if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157005,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310180,1)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157005, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#W Th c th h呔ng long v錸 th唼ng g m祎 phen t竛h v鈔 th鼀, m祎 c醝 m緄 tinh #W#{_INFOMSG%s}#W xu hi畁 � tr呔c m!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, long v錸 tr鱪g t thu礳 t韓h th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊. C Long V錸 v� #Y1 c醝 #GT竛h V鈔 Th鼀!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end


	elseif NumText == 36 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157009)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310180)
              if c0 >=1 and c1 >=2 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157009,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310180,2)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157009, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#W Th c th h呔ng long v錸 th唼ng g m祎 phen t竛h v鈔 th鼀, m祎 c醝 m緄 tinh #W#{_INFOMSG%s}#W xu hi畁 � tr呔c m!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, long v錸 tr鱪g t thu礳 t韓h th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊. C Long V錸 v� #Y2 c醝 #GT竛h V鈔 Th鼀!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end


	elseif NumText == 37 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157013)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310180)
              if c0 >=1 and c1 >=3 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157013,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310180,3)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157013, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#W Th c th h呔ng long v錸 th唼ng g m祎 phen t竛h v鈔 th鼀, m祎 c醝 m緄 tinh #W#{_INFOMSG%s}#W xu hi畁 � tr呔c m!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, long v錸 tr鱪g t thu礳 t韓h th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊. C Long V錸 v� #Y3 c醝 #GT竛h V鈔 Th鼀!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end


	elseif NumText == 38 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157017)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310180)
              if c0 >=1 and c1 >=4 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157017,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310180,4)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157017, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#W Th c th h呔ng long v錸 th唼ng g m祎 phen t竛h v鈔 th鼀, m祎 c醝 m緄 tinh #W#{_INFOMSG%s}#W xu hi畁 � tr呔c m!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, long v錸 tr鱪g t thu礳 t韓h th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊. C Long V錸 v� #Y4 c醝 #GT竛h V鈔 Th鼀!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 98 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157021)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310180)
              if c0 >=1 and c1 >=5 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157021,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310180,5)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157021, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#W Th c th h呔ng long v錸 th唼ng g m祎 phen t竛h v鈔 th鼀, m祎 c醝 m緄 tinh #W#{_INFOMSG%s}#W xu hi畁 � tr呔c m!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, long v錸 tr鱪g t thu礳 t韓h th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊. C Long V錸 v� #Y5 c醝 #GT竛h V鈔 Th鼀!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 99 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157025)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310180)
              if c0 >=1 and c1 >=6 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157025,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310180,6)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157025, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#W Th c th h呔ng long v錸 th唼ng g m祎 phen t竛h v鈔 th鼀, m祎 c醝 m緄 tinh #W#{_INFOMSG%s}#W xu hi畁 � tr呔c m!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, long v錸 tr鱪g t thu礳 t韓h th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊. C Long V錸 v� #Y6 c醝 #GT竛h V鈔 Th鼀!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 100 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157029)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310180)
              if c0 >=1 and c1 >=7 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157029,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310180,7)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157029, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#W Th c th h呔ng long v錸 th唼ng g m祎 phen t竛h v鈔 th鼀, m祎 c醝 m緄 tinh #W#{_INFOMSG%s}#W xu hi畁 � tr呔c m!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, long v錸 tr鱪g t thu礳 t韓h th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊. C Long V錸 v� #Y7 c醝 #GT竛h V鈔 Th鼀!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 101 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157033)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310180)
              if c0 >=1 and c1 >=8 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157033,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310180,8)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157033, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#W Th c th h呔ng long v錸 th唼ng g m祎 phen t竛h v鈔 th鼀, m祎 c醝 m緄 tinh #W#{_INFOMSG%s}#W xu hi畁 � tr呔c m!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, long v錸 tr鱪g t thu礳 t韓h th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊. C Long V錸 v� #Y8 c醝 #GT竛h V鈔 Th鼀!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 102 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157037)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310180)
              if c0 >=1 and c1 >=9 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157037,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310180,9)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157037, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#W Th c th h呔ng long v錸 th唼ng g m祎 phen t竛h v鈔 th鼀, m祎 c醝 m緄 tinh #W#{_INFOMSG%s}#W xu hi畁 � tr呔c m!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, long v錸 tr鱪g t thu礳 t韓h th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊. C Long V錸 v� #Y9 c醝 #GT竛h V鈔 Th鼀!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 103 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157041)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310180)
              if c0 >=1 and c1 >=10 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157041,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310180,10)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157041, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#W Th c th h呔ng long v錸 th唼ng g m祎 phen t竛h v鈔 th鼀, m祎 c醝 m緄 tinh #W#{_INFOMSG%s}#W xu hi畁 � tr呔c m!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, long v錸 tr鱪g t thu礳 t韓h th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊. C Long V錸 v� #Y10 c醝 #GT竛h V鈔 Th鼀!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end



	elseif NumText == 39 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157006)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310180)
              if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157006,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310180,1)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157006, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#W Th c th h呔ng long v錸 th唼ng g m祎 phen t竛h v鈔 th鼀, m祎 c醝 m緄 tinh #W#{_INFOMSG%s}#W xu hi畁 � tr呔c m!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, long v錸 tr鱪g t thu礳 t韓h th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊. C Long V錸 v� #Y1 c醝 #GT竛h V鈔 Th鼀!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end


	elseif NumText == 40 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157010)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310180)
              if c0 >=1 and c1 >=2 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157010,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310180,2)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157010, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#W Th c th h呔ng long v錸 th唼ng g m祎 phen t竛h v鈔 th鼀, m祎 c醝 m緄 tinh #W#{_INFOMSG%s}#W xu hi畁 � tr呔c m!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, long v錸 tr鱪g t thu礳 t韓h th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊. C Long V錸 v� #Y2 c醝 #GT竛h V鈔 Th鼀!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end


	elseif NumText == 41 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157014)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310180)
              if c0 >=1 and c1 >=3 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157014,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310180,3)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157014, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#W Th c th h呔ng long v錸 th唼ng g m祎 phen t竛h v鈔 th鼀, m祎 c醝 m緄 tinh #W#{_INFOMSG%s}#W xu hi畁 � tr呔c m!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, long v錸 tr鱪g t thu礳 t韓h th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊. C Long V錸 v� #Y3 c醝 #GT竛h V鈔 Th鼀!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end


	elseif NumText == 42 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157018)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310180)
              if c0 >=1 and c1 >=4 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157018,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310180,4)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157018, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#W Th c th h呔ng long v錸 th唼ng g m祎 phen t竛h v鈔 th鼀, m祎 c醝 m緄 tinh #W#{_INFOMSG%s}#W xu hi畁 � tr呔c m!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, long v錸 tr鱪g t thu礳 t韓h th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊. C Long V錸 v� #Y4 c醝 #GT竛h V鈔 Th鼀!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 104 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157022)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310180)
              if c0 >=1 and c1 >=5 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157022,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310180,5)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157022, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#W Th c th h呔ng long v錸 th唼ng g m祎 phen t竛h v鈔 th鼀, m祎 c醝 m緄 tinh #W#{_INFOMSG%s}#W xu hi畁 � tr呔c m!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, long v錸 tr鱪g t thu礳 t韓h th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊. C Long V錸 v� #Y5 c醝 #GT竛h V鈔 Th鼀!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 105 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157026)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310180)
              if c0 >=1 and c1 >=6 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157026,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310180,6)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157026, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#W Th c th h呔ng long v錸 th唼ng g m祎 phen t竛h v鈔 th鼀, m祎 c醝 m緄 tinh #W#{_INFOMSG%s}#W xu hi畁 � tr呔c m!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, long v錸 tr鱪g t thu礳 t韓h th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊. C Long V錸 v� #Y6 c醝 #GT竛h V鈔 Th鼀!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 106 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157030)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310180)
              if c0 >=1 and c1 >=7 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157030,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310180,7)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157030, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#W Th c th h呔ng long v錸 th唼ng g m祎 phen t竛h v鈔 th鼀, m祎 c醝 m緄 tinh #W#{_INFOMSG%s}#W xu hi畁 � tr呔c m!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, long v錸 tr鱪g t thu礳 t韓h th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊. C Long V錸 v� #Y7 c醝 #GT竛h V鈔 Th鼀!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 107 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157034)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310180)
              if c0 >=1 and c1 >=8 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157034,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310180,8)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157034, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#W Th c th h呔ng long v錸 th唼ng g m祎 phen t竛h v鈔 th鼀, m祎 c醝 m緄 tinh #W#{_INFOMSG%s}#W xu hi畁 � tr呔c m!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, long v錸 tr鱪g t thu礳 t韓h th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊. C Long V錸 v� #Y8 c醝 #GT竛h V鈔 Th鼀!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 108 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157038)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310180)
              if c0 >=1 and c1 >=9 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157038,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310180,9)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157038, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#W Th c th h呔ng long v錸 th唼ng g m祎 phen t竛h v鈔 th鼀, m祎 c醝 m緄 tinh #W#{_INFOMSG%s}#W xu hi畁 � tr呔c m!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, long v錸 tr鱪g t thu礳 t韓h th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊. C Long V錸 v� #Y9 c醝 #GT竛h V鈔 Th鼀!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 109 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157042)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310180)
              if c0 >=1 and c1 >=10 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157042,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310180,10)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157042, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#W Th c th h呔ng long v錸 th唼ng g m祎 phen t竛h v鈔 th鼀, m祎 c醝 m緄 tinh #W#{_INFOMSG%s}#W xu hi畁 � tr呔c m!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, long v錸 tr鱪g t thu礳 t韓h th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊. C Long V錸 v� #Y10 c醝 #GT竛h V鈔 Th鼀!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 43 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157007)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310180)
              if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157007,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310180,1)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157007, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#W Th c th h呔ng long v錸 th唼ng g m祎 phen t竛h v鈔 th鼀, m祎 c醝 m緄 tinh #W#{_INFOMSG%s}#W xu hi畁 � tr呔c m!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, long v錸 tr鱪g t thu礳 t韓h th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊. C Long V錸 v� #Y1 c醝 #GT竛h V鈔 Th鼀!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end


	elseif NumText == 44 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157011)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310180)
              if c0 >=1 and c1 >=2 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157011,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310180,2)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157011, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#W Th c th h呔ng long v錸 th唼ng g m祎 phen t竛h v鈔 th鼀, m祎 c醝 m緄 tinh #W#{_INFOMSG%s}#W xu hi畁 � tr呔c m!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, long v錸 tr鱪g t thu礳 t韓h th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊. C Long V錸 v� #Y2 c醝 #GT竛h V鈔 Th鼀!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end


	elseif NumText == 45 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157015)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310180)
              if c0 >=1 and c1 >=3 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157015,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310180,3)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157015, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#W Th c th h呔ng long v錸 th唼ng g m祎 phen t竛h v鈔 th鼀, m祎 c醝 m緄 tinh #W#{_INFOMSG%s}#W xu hi畁 � tr呔c m!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, long v錸 tr鱪g t thu礳 t韓h th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊. C Long V錸 v� #Y3 c醝 #GT竛h V鈔 Th鼀!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end


	elseif NumText == 46 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157019)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310180)
              if c0 >=1 and c1 >=4 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157019,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310180,4)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157019, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#W Th c th h呔ng long v錸 th唼ng g m祎 phen t竛h v鈔 th鼀, m祎 c醝 m緄 tinh #W#{_INFOMSG%s}#W xu hi畁 � tr呔c m!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, long v錸 tr鱪g t thu礳 t韓h th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊. C Long V錸 v� #Y4 c醝 #GT竛h V鈔 Th鼀!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 110 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157023)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310180)
              if c0 >=1 and c1 >=5 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157023,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310180,5)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157023, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#W Th c th h呔ng long v錸 th唼ng g m祎 phen t竛h v鈔 th鼀, m祎 c醝 m緄 tinh #W#{_INFOMSG%s}#W xu hi畁 � tr呔c m!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, long v錸 tr鱪g t thu礳 t韓h th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊. C Long V錸 v� #Y5 c醝 #GT竛h V鈔 Th鼀!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 111 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157027)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310180)
              if c0 >=1 and c1 >=6 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157027,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310180,6)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157027, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#W Th c th h呔ng long v錸 th唼ng g m祎 phen t竛h v鈔 th鼀, m祎 c醝 m緄 tinh #W#{_INFOMSG%s}#W xu hi畁 � tr呔c m!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, long v錸 tr鱪g t thu礳 t韓h th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊. C Long V錸 v� #Y6 c醝 #GT竛h V鈔 Th鼀!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 112 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157031)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310180)
              if c0 >=1 and c1 >=7 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157031,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310180,7)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157031, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#W Th c th h呔ng long v錸 th唼ng g m祎 phen t竛h v鈔 th鼀, m祎 c醝 m緄 tinh #W#{_INFOMSG%s}#W xu hi畁 � tr呔c m!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, long v錸 tr鱪g t thu礳 t韓h th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊. C Long V錸 v� #Y7 c醝 #GT竛h V鈔 Th鼀!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 113 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157035)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310180)
              if c0 >=1 and c1 >=8 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157035,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310180,8)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157035, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#W Th c th h呔ng long v錸 th唼ng g m祎 phen t竛h v鈔 th鼀, m祎 c醝 m緄 tinh #W#{_INFOMSG%s}#W xu hi畁 � tr呔c m!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, long v錸 tr鱪g t thu礳 t韓h th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊. C Long V錸 v� #Y8 c醝 #GT竛h V鈔 Th鼀!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 114 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157039)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310180)
              if c0 >=1 and c1 >=9 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157039,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310180,9)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157039, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#W Th c th h呔ng long v錸 th唼ng g m祎 phen t竛h v鈔 th鼀, m祎 c醝 m緄 tinh #W#{_INFOMSG%s}#W xu hi畁 � tr呔c m!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, long v錸 tr鱪g t thu礳 t韓h th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊. C Long V錸 v� #Y9 c醝 #GT竛h V鈔 Th鼀!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 115 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157043)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310180)
              if c0 >=1 and c1 >=10 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157043,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310180,10)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157043, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#W Th c th h呔ng long v錸 th唼ng g m祎 phen t竛h v鈔 th鼀, m祎 c醝 m緄 tinh #W#{_INFOMSG%s}#W xu hi畁 � tr呔c m!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, long v錸 tr鱪g t thu礳 t韓h th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊. C Long V錸 v� #Y10 c醝 #GT竛h V鈔 Th鼀!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 47 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157008)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310180)
              if c0 >=1 and c1 >=1 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157008,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310180,1)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157008, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#W Th c th h呔ng long v錸 th唼ng g m祎 phen t竛h v鈔 th鼀, m祎 c醝 m緄 tinh #W#{_INFOMSG%s}#W xu hi畁 � tr呔c m!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, long v錸 tr鱪g t thu礳 t韓h th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊. C Long V錸 v� #Y1 c醝 #GT竛h V鈔 Th鼀!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end


	elseif NumText == 48 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157012)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310180)
              if c0 >=1 and c1 >=2 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157012,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310180,2)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157012, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#W Th c th h呔ng long v錸 th唼ng g m祎 phen t竛h v鈔 th鼀, m祎 c醝 m緄 tinh #W#{_INFOMSG%s}#W xu hi畁 � tr呔c m!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, long v錸 tr鱪g t thu礳 t韓h th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊. C Long V錸 v� #Y2 c醝 #GT竛h V鈔 Th鼀!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end


	elseif NumText == 49 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157016)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310180)
              if c0 >=1 and c1 >=3 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157016,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310180,3)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157016, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#W Th c th h呔ng long v錸 th唼ng g m祎 phen t竛h v鈔 th鼀, m祎 c醝 m緄 tinh #W#{_INFOMSG%s}#W xu hi畁 � tr呔c m!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, long v錸 tr鱪g t thu礳 t韓h th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊. C Long V錸 v� #Y3 c醝 #GT竛h V鈔 Th鼀!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end


	elseif NumText == 50 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157020)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310180)
              if c0 >=1 and c1 >=4 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157020,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310180,4)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157020, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#W Th c th h呔ng long v錸 th唼ng g m祎 phen t竛h v鈔 th鼀, m祎 c醝 m緄 tinh #W#{_INFOMSG%s}#W xu hi畁 � tr呔c m!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, long v錸 tr鱪g t thu礳 t韓h th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊. C Long V錸 v� #Y4 c醝 #GT竛h V鈔 Th鼀!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 116 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157024)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310180)
              if c0 >=1 and c1 >=5 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157024,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310180,5)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157024, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#W Th c th h呔ng long v錸 th唼ng g m祎 phen t竛h v鈔 th鼀, m祎 c醝 m緄 tinh #W#{_INFOMSG%s}#W xu hi畁 � tr呔c m!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, long v錸 tr鱪g t thu礳 t韓h th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊. C Long V錸 v� #Y5 c醝 #GT竛h V鈔 Th鼀!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 117 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157028)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310180)
              if c0 >=1 and c1 >=6 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157028,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310180,6)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157028, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#W Th c th h呔ng long v錸 th唼ng g m祎 phen t竛h v鈔 th鼀, m祎 c醝 m緄 tinh #W#{_INFOMSG%s}#W xu hi畁 � tr呔c m!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, long v錸 tr鱪g t thu礳 t韓h th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊. C Long V錸 v� #Y6 c醝 #GT竛h V鈔 Th鼀!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 118 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157032)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310180)
              if c0 >=1 and c1 >=7 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157032,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310180,7)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157032, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#W Th c th h呔ng long v錸 th唼ng g m祎 phen t竛h v鈔 th鼀, m祎 c醝 m緄 tinh #W#{_INFOMSG%s}#W xu hi畁 � tr呔c m!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, long v錸 tr鱪g t thu礳 t韓h th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊. C Long V錸 v� #Y7 c醝 #GT竛h V鈔 Th鼀!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 119 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157036)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310180)
              if c0 >=1 and c1 >=8 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157036,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310180,8)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157036, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#W Th c th h呔ng long v錸 th唼ng g m祎 phen t竛h v鈔 th鼀, m祎 c醝 m緄 tinh #W#{_INFOMSG%s}#W xu hi畁 � tr呔c m!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, long v錸 tr鱪g t thu礳 t韓h th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊. C Long V錸 v� #Y8 c醝 #GT竛h V鈔 Th鼀!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 120 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157040)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310180)
              if c0 >=1 and c1 >=9 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157040,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310180,9)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157040, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#W Th c th h呔ng long v錸 th唼ng g m祎 phen t竛h v鈔 th鼀, m祎 c醝 m緄 tinh #W#{_INFOMSG%s}#W xu hi畁 � tr呔c m!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, long v錸 tr鱪g t thu礳 t韓h th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊. C Long V錸 v� #Y9 c醝 #GT竛h V鈔 Th鼀!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 121 then
		c0 = LuaFnGetAvailableItemCount(sceneId, selfId, 10157044)
		c1 = LuaFnGetAvailableItemCount(sceneId, selfId, 20310180)
              if c0 >=1 and c1 >=10 then
				BeginEvent( sceneId ) 
					LuaFnDelAvailableItem(sceneId,selfId,10157044,1)--删除物品
					LuaFnDelAvailableItem(sceneId,selfId,20310180,10)--删除物品
					local bagpos01 = TryRecieveItem( sceneId, selfId, 10157044, 1)--给予物品
				       local szItemTransfer = GetBagItemTransfer( sceneId, selfId, bagpos01 )
					local name = GetName( sceneId, selfId )
					local message = format("#W#{_INFOUSR%s}#W Th c th h呔ng long v錸 th唼ng g m祎 phen t竛h v鈔 th鼀, m祎 c醝 m緄 tinh #W#{_INFOMSG%s}#W xu hi畁 � tr呔c m!", name, szItemTransfer)
					BroadMsgByChatPipe( sceneId, selfId, message, 4 )
		                     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
					strText = "#GCh鷆 m譶g ng呓i, long v錸 tr鱪g t thu礳 t韓h th鄋h c鬾g!"
					AddText( sceneId, strText )
				   EndEvent( sceneId )
               	          DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "#GThi猽 Nguy阯 li畊. C Long V錸 v� #Y10 c醝 #GT竛h V鈔 Th鼀!!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 800 then
		BeginEvent(sceneId)
			AddText(sceneId,"C t�: #G1~2#cfff263 c:#G20 c醝 #cfff263Ng鱟 Long Th鼀 #r c #G3#cfff263 c :#G40 c醝 #cfff263Ng鱟 Long Th鼀 #r c #G4#cfff263 c #G80 c醝 #cfff263Ng鱟 Long Th鼀")
			AddText(sceneId,"    #G5#cfff263 C: #G160 c醝 #cfff263Ng鱟 Long Th鼀, #G30 c醝 #cfff263S� c C鈛 Thi阯 Th醝#r    #G6#cfff263 C: #G240 c醝 #cfff263Ng鱟 Long Th鼀, #G30 c醝 #cfff263S� c C鈛 Thi阯 Th醝#r    #G7#cfff263 C: #G300 c醝 #cfff263Ng鱟 Long Th鼀, #G30 c醝 #cfff263Trung c C鈛 Thi阯 Th醝")
			AddText(sceneId,"    #G8#cfff263 C: #G400 c醝 #cfff263Ng鱟 Long Th鼀, #G30 c醝 #cfff263Trung c C鈛 Thi阯 Th醝#r    #G9#cfff263 C: #G450 c醝 #cfff263Ng鱟 Long Th鼀, #G30 c醝 #cfff263Cao c C鈛 Thi阯 Th醝#r    #G10#cfff263 C: #G500 c醝 #cfff263Ng鱟 Long Th鼀, #G30 c醝 #cfff263Cao c C鈛 Thi阯 Th醝")
			AddNumText(sceneId,x892005_g_ScriptId,"Quay l読",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 999 then
		BeginEvent(sceneId)
			AddText(sceneId,"#G1#cfff263 C: #G1 c醝 #cfff263T竛h V鈔 Th鼀#r    #G2#cfff263 C: #G2 c醝 #cfff263T竛h V鈔 Th鼀#r    #G3#cfff263 C: #G3 c醝 #cfff263T竛h V鈔 Th鼀#r    #G4#cfff263 C: #G4 c醝 #cfff263T竛h V鈔 Th鼀")
			AddText(sceneId,"    #G5#cfff263 C: #G5 c醝 #cfff263T竛h V鈔 Th鼀#r    #G5#cfff263 C: #G5 c醝 #cfff263T竛h V鈔 Th鼀#r    #G7#cfff263 C: #G7 c醝 #cfff263T竛h V鈔 Th鼀#r    #G8#cfff263 C: #G8 c醝 #cfff263T竛h V鈔 Th鼀")
			AddText(sceneId,"    #G9#cfff263 C: #G9 c醝 #cfff263T竛h V鈔 Th鼀#r    #G10#cfff263 C: #G10 c醝 #cfff263T竛h V鈔 Th鼀")
			AddNumText(sceneId,x892005_g_ScriptId,"Quay l読",8,130)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 53 then
		c0 = GetItemCount(sceneId, selfId, 10156108)
              if c0 >=1 then
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 25010, 0)
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh鷆 m譶g ng呓i, long v錸 m� r祅g thu礳 t韓h th鄋h c鬾g!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi猽 Nguy阯 li畊!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 54 then
		c0 = GetItemCount(sceneId, selfId, 10156109)
              if c0 >=1 then
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 25011, 0)
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh鷆 m譶g ng呓i, long v錸 m� r祅g thu礳 t韓h th鄋h c鬾g!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi猽 Nguy阯 li畊!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 55 then
		c0 = GetItemCount(sceneId, selfId, 10156110)
              if c0 >=1 then
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 25016, 0)
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh鷆 m譶g ng呓i, long v錸 m� r祅g thu礳 t韓h th鄋h c鬾g!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi猽 Nguy阯 li畊!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 56 then
		c0 = GetItemCount(sceneId, selfId, 10156111)
              if c0 >=1 then
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 25017, 0)
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh鷆 m譶g ng呓i, long v錸 m� r祅g thu礳 t韓h th鄋h c鬾g!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi猽 Nguy阯 li畊!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 57 then
		c0 = GetItemCount(sceneId, selfId, 10156112)
              if c0 >=1 then
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 25018, 0)
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh鷆 m譶g ng呓i, long v錸 m� r祅g thu礳 t韓h th鄋h c鬾g!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi猽 Nguy阯 li畊!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 58 then
		c0 = GetItemCount(sceneId, selfId, 10156113)
              if c0 >=1 then
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 25019, 0)
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh鷆 m譶g ng呓i, long v錸 m� r祅g thu礳 t韓h th鄋h c鬾g!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi猽 Nguy阯 li畊!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 59 then
		c0 = GetItemCount(sceneId, selfId, 10156114)
              if c0 >=1 then
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 25024, 0)
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh鷆 m譶g ng呓i, long v錸 m� r祅g thu礳 t韓h th鄋h c鬾g!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi猽 Nguy阯 li畊!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 60 then
		c0 = GetItemCount(sceneId, selfId, 10156115)
              if c0 >=1 then
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 25025, 0)
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh鷆 m譶g ng呓i, long v錸 m� r祅g thu礳 t韓h th鄋h c鬾g!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi猽 Nguy阯 li畊!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 61 then
		c0 = GetItemCount(sceneId, selfId, 10156116)
              if c0 >=1 then
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 25026, 0)
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh鷆 m譶g ng呓i, long v錸 m� r祅g thu礳 t韓h th鄋h c鬾g!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi猽 Nguy阯 li畊!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end

	elseif NumText == 62 then
		c0 = GetItemCount(sceneId, selfId, 10156117)
              if c0 >=1 then
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 25027, 0)
		       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
			BeginEvent( sceneId ) 
				strText = "#GCh鷆 m譶g ng呓i, long v錸 m� r祅g thu礳 t韓h th鄋h c鬾g!"
				AddText( sceneId, strText )
			EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
             else
		     strNotice = "Thi猽 Nguy阯 li畊!"
		     x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
	      end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x892005_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x892005_g_eventList do
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
function x892005_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x892005_g_eventList do
		if missionScriptId == findId then
			x892005_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x892005_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x892005_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x892005_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x892005_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x892005_OnDie( sceneId, selfId, killerId )
end




--**********************************
--判断是否能够学习
--nSkillIndex参数可能值为：40，70，90，分别学习对应级别的技能
--**********************************
function x892005_CheckStudyDarkSkills( sceneId, selfId, targetId, nSkillIndex )
	
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
		x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	--判断是否已经学会了对应技能
	if  (HaveSkill(sceneId, selfId, x892005_g_DarkSkillName[nSkillIndex].id) > 0 ) then
		if (nSkillIndex == 40) then
			strNotice = "#{FBSJ_081209_26}";
		elseif (nSkillIndex == 70) then
			strNotice = "#{FBSJ_081209_28}";
		elseif (nSkillIndex == 90) then
			strNotice = "#{FBSJ_081209_30}";
		end
		x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	--判断玩家身上是否有足够的钱
	local nHaveMoney = GetMoney(sceneId, selfId) + GetMoneyJZ(sceneId, selfId);
	if (nHaveMoney < x892005_g_DarkSkillName[nSkillIndex].needmoney) then    --10金
		strNotice = "#{FBSJ_081209_25}";
		x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	return 1;
	
end

--**********************************
--玩家找NPC学习暗器使用技能
--nSkillIndex参数可能值为：40，70，90，分别学习对应级别的技能
--**********************************
function x892005_StudyDarkSkills( sceneId, selfId, targetId, nSkillIndex )
	
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
		x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	--判断是否已经学会了对应技能
	if  (HaveSkill(sceneId, selfId, x892005_g_DarkSkillName[nSkillIndex].id) > 0 ) then
		if (nSkillIndex == 40) then
			strNotice = "#{FBSJ_081209_26}";
		elseif (nSkillIndex == 70) then
			strNotice = "#{FBSJ_081209_28}";
		elseif (nSkillIndex == 90) then
			strNotice = "#{FBSJ_081209_30}";
		end
		x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	--判断玩家身上是否有足够的钱
	local nHaveMoney = GetMoney(sceneId, selfId) + GetMoneyJZ(sceneId, selfId);
	if (nHaveMoney < x892005_g_DarkSkillName[nSkillIndex].needmoney) then    --10金
		strNotice = "#{FBSJ_081209_25}";
		x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
		return
	end
	
	--上面判断都通过，可以扣钱给技能了
	local nRet, nRetJB = LuaFnCostMoneyWithPriority(sceneId, selfId, x892005_g_DarkSkillName[nSkillIndex].needmoney);
	if (nRet == -1) then
		strNotice = "#{FBSJ_081209_25}";
		x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	AddSkill(  sceneId, selfId, x892005_g_DarkSkillName[nSkillIndex].id)
	x892005_ShowNotice(sceneId, selfId, targetId, x892005_g_DarkSkillTips[nSkillIndex]);
	x892005_NotifyTips( sceneId, selfId, x892005_g_DarkSkillTips[nSkillIndex] )
	
	x892005_StudySkillImpact(sceneId, selfId)
	DarkOperateResult(sceneId, selfId, 5, 1);    --让技能按钮闪烁
	
end


--**********************************
-- 屏幕中间信息提示
--**********************************
function x892005_NotifyTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end


--**********************************
--玩家是否满足暗器瓶颈条件
--返回值：0或者1，1为满足，0
--**********************************
function x892005_CheckDarkReachPoint(sceneId, selfId, targetId)
		
		local strInfo = "";
		--判断玩家身上是否装备有暗器
		local bHaveDarkEquip = HaveDarkEquiped(sceneId, selfId);
		if ( bHaveDarkEquip ~= 1) then
			strInfo = "#{FBSJ_081209_13}";
			x892005_ShowNotice(sceneId, selfId, targetId, strInfo);
			return 0;
		end
		
		--判断玩家身上暗器是否达到瓶颈
		local bNeedNPC = IsDarkNeedLevelUpByNpcNow(sceneId, selfId);
		if (bNeedNPC ~= 1) then
			strInfo = "#{FBSJ_081209_14}";
			x892005_ShowNotice(sceneId, selfId, targetId, strInfo);
			return 0;
		end
		
		--判断玩家等级是否和暗器等级相等或者没有暗器等级高
		local nDarkLevel = GetDarkLevel(sceneId, selfId);
		local nCharLevel = GetLevel(sceneId, selfId);
		if (nDarkLevel >= nCharLevel) then
			strInfo = "#{FBSJ_081209_15}";
			x892005_ShowNotice(sceneId, selfId, targetId, strInfo);
			return 0;
		end
		
		--判断玩家身上是否有足够的钱
		local nDarkLevel = GetDarkLevel(sceneId, selfId);
		local nNeedMoney = x892005_g_DarkBreachPointNeedMoney[nDarkLevel];
		if (nNeedMoney == nil or nNeedMoney <= 0) then
			nNeedMoney = 100000;         --以防万一，并没什么用
		end
		local nHaveMoney = GetMoney(sceneId, selfId) + GetMoneyJZ(sceneId, selfId);
		if (nHaveMoney < nNeedMoney) then    --10金
			strNotice = "#{FBSJ_081209_25}";
			x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
			return 0;
		end
				
		return 1;
end


function x892005_BreachDarkPoint(sceneId, selfId, targetId)

	local strInfo = "";
	--判断玩家身上是否装备有暗器
	local bHaveDarkEquip = HaveDarkEquiped(sceneId, selfId);
	if ( bHaveDarkEquip ~= 1) then
		strInfo = "#{FBSJ_081209_13}";
		x892005_ShowNotice(sceneId, selfId, targetId, strInfo);
		return 0;
	end
		
	--判断玩家身上暗器是否达到瓶颈
	local bNeedNPC = IsDarkNeedLevelUpByNpcNow(sceneId, selfId);
	if (bNeedNPC ~= 1) then
		strInfo = "#{FBSJ_081209_14}";
		x892005_ShowNotice(sceneId, selfId, targetId, strInfo);
		return 0;
	end
		
	--判断玩家等级是否和暗器等级相等或者没有暗器等级高
	local nDarkLevel = GetDarkLevel(sceneId, selfId);
	local nCharLevel = GetLevel(sceneId, selfId);
	if (nDarkLevel >= nCharLevel) then
		strInfo = "#{FBSJ_081209_15}";
		x892005_ShowNotice(sceneId, selfId, targetId, strInfo);
		return 0;
	end
		
			--判断玩家身上是否有足够的钱
	local nDarkLevel = GetDarkLevel(sceneId, selfId);
	local nNeedMoney = x892005_g_DarkBreachPointNeedMoney[nDarkLevel];
	if (nNeedMoney == nil or nNeedMoney <= 0) then
		nNeedMoney = 100000;         --以防万一，并没什么用
	end
	local nHaveMoney = GetMoney(sceneId, selfId) + GetMoneyJZ(sceneId, selfId);
	if (nHaveMoney < nNeedMoney) then    --10金
		strNotice = "#{FBSJ_081209_25}";
		x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	--上面判断都通过，可以扣钱突破了
	local nRet, nRetJB = LuaFnCostMoneyWithPriority(sceneId, selfId, nNeedMoney);
	if (nRet == -1) then
		strNotice = "#{FBSJ_081209_25}";
		x892005_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	--突破瓶颈，让暗器升级
	local bDarkLevelup = DarkLevelUp(sceneId, selfId);
	if (bDarkLevelup == 1) then
		x892005_ShowNotice(sceneId, selfId, targetId, "#{FBSJ_081209_18}");
		--突破成功，记录统计日志
			local guid = LuaFnObjId2Guid(sceneId, selfId);
			local sLog = format("dark level now: %d", nDarkLevel + 1); 
			ScriptGlobal_AuditGeneralLog(LUAAUDIT_ANQITUPO, guid, sLog);
	else
		x892005_ShowNotice(sceneId, selfId, targetId, "械t ph� th b読");
	end
	
	return
end

function x892005_ShowNotice( sceneId, selfId, targetId, strNotice)
	BeginEvent( sceneId )
		AddText( sceneId, strNotice )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

function x892005_StudySkillImpact(sceneId, playerId)
	--显示学习到新技能的特效 目前使用升级特效
	LuaFnSendSpecificImpactToUnit(sceneId, playerId, playerId, playerId, 32407, 0 )
end
