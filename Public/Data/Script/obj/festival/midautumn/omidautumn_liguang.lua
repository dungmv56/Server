-- 中秋NPC
-- 李光

x050005_g_scriptId = 050005

--**********************************
--事件交互入口
--**********************************
function x050005_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		local strText = "    械c b呔c tr阯 tr叨ng ki玼, 痍m nay l� Trung thu. 嗅m kia th m ta c� s�, 餴 v� C� 衋m Ch鈛. Gi� ng譶g n呔c lg t馻 g呓ng, m鈟 tan tr錸g s醤g nh� ng鄖, m祎 m靚h vui tr阯 thuy玭 nh�. C叨i m祎 chung r唼u, ti猲g n呔c l鏽 cu皀g ca. Thi猽 ni阯 m祎 thu�, ngh頰 kim lan, t b誧 馥u. Nh靚 d ng鄋 xa, bu皀 ta 疸 qua ch鴆 n錷 tr叨ng. Mu祅 g Ng鱟 ti陁 ti阯 t�, tg cho V呓ng 痗 k� th�, ch� 疬秐g v� B皀g Kh鈛. Kh鬾g c c咿i gi�, b醫 c馽 kh� th du"
		AddText( sceneId, "Th鼀 餴畊 ca 馥u" )
		AddText( sceneId, strText )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
