--对话事件 npc白颖明

--脚本号
x713616_g_ScriptId = 713512

--对话内容
x713616_g_dialog = {"N猽 c醕 h� c� m祎 t鈓 h皀 thanh cao, s� th h醝 thu痗 l� c鬾g vi甤 疳ng m猲, c theo chi猚 li玬 nh�, lang thang trong n鷌 c鵱g b� b課 v緄 m鵬 h呓ng v� ti猲g chim, trong kho鋘h kh ph醫 hi畁 ra c鈟 thu痗 qu�, c鋗 gi醕 h課h ph鷆 痼 kh鬾g ph鋓 ng叨i n鄌 c鹡g c� 疬㧟, b穒 v� nh鎛g ng叨i 痼 trong l騨g ch� bi猼 皙n ti玭, vi甤 t痶 皓p 皙n m trong m h� c鹡g ch� c� ngh頰 l� 疳ng nhi玼 ti玭 h絥",
			"C鈛 n骾 th� hai",
			"Ch� c huynh h鱟 k� n錸g tr皀g tr鱰 l� c� th� tr皀g ngay. T nhi阯, 鹌ng c c黙 huynh c鄋g cao, ch黱g lo読 c鈟 疬㧟 tr皀g c鄋g nhi玼",
			"Ch� c h鱟 疬㧟 k� n錸g tr皀g tr鱰, t緄 m祎 m鋘h ru祅g ch遖 tr皀g tr鱰, h鰅 ng叨i coi ru祅g, r癷 l馻 ch鱪 gi痭g c鈟 tr皀g l� 疬㧟",
			"Sau khi b 馥u tr皀g tr鱰, s� nh靚 th tr阯 鸢ng hi畁 ra nh鎛g m non, c醕 h� c� th� tranh th� 餴 l鄊 vi甤 kh醕, kh鬾g c ph鋓 tr鬾g coi. Nh遪g 鹱ng qu阯 sau 40 ph鷗 ph鋓 quay l読 thu ho誧h, n猽 qu� 50 ph鷗 ng叨i kh醕 s� thu ho誧h m c黙 c醕 h�."}
x713616_g_button = {"羞㧟 r癷, 疬㧟 r癷, n骾 g� th馽 t� 餴",
			"T読 h� l鄊 th� n鄌 瓞 tr皀g tr鱰 疬㧟?",
			"Sau 痼 th� sao?",
			"Thu ho誧h ra sao?",
			}

--**********************************
--任务入口函数
--**********************************
function x713616_OnDefaultEvent( sceneId, selfId, targetId, MessageNum )	--MessageNum喧ng对话编号,用于调用不同对话
		BeginEvent(sceneId)
			AddText(sceneId, x713616_g_dialog[MessageNum])
			if MessageNum ~= 5 then
				AddNumText(sceneId,MessageNum, x713616_g_button[MessageNum],11,-1)
			end
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
end

--**********************************
--列举事件
--**********************************
function x713616_OnEnumerate( sceneId, selfId, targetId )
		AddNumText(sceneId,x713616_g_ScriptId,"T読 h� mu痭 t靘 hi瑄 tr皀g tr鱰",11,-1)
end

--**********************************
--检测Ti猵 th跫�
--**********************************
function x713616_CheckAccept( sceneId, selfId )
end

--**********************************
--Ti猵 th�
--**********************************
function x713616_OnAccept( sceneId, selfId, AbilityId )
end
