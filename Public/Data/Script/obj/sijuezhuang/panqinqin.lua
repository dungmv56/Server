-- 领奖NPC

x893080_g_scriptId = 893080
x893080_g_FuBenScriptId = 893063

--**********************************
--事件交互入口
--**********************************
function x893080_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"H� v� trong T� Tuy畉 Trang phi th叨ng l㱮 h読, nh遪g ta c� th� khi猲 m鬾 ph醝 c chi猲 trong 鸬i ng� c黙 c醕 ng呓i  th鈔, nh� v l� c� th� tho鋓 m醝 l雗 v鄌 T� Tuy畉 衖畁 疳nh chu鬾g. Sau khi nghe ti猲g chu鬾g, c醕 h� v� c鵱g gi醥 馥u s� r秈 餴, l鷆 痼 c� th� t� do x鬾g v鄌 r癷.#r#G Ch� �: Tr鈔 th� s� kh鬾g 鋘h h叻ng b穒 hi畊 qu�  th鈔, 皤 ngh� 餰m thu h癷 tr鈔 th� r癷 h銀 nh hi畊 qu� n鄖.")
		AddNumText( sceneId, x893080_g_scriptId, "#c00ff00Ta mu痭  th鈔", 6, 200)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
--**********************************
--事件列表选中一项
--**********************************
function x893080_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 200 then

		if GetMenPai(sceneId,selfId) ~= MP_SHAOLIN and GetMenPai(sceneId,selfId) ~= MP_MINGJIAO and GetMenPai(sceneId,selfId) ~= MP_GAIBANG and GetMenPai(sceneId,selfId) ~= MP_TIANSHAN then
			BeginEvent(sceneId)
	   			AddText( sceneId,"Hi畊 qu�  th鈔 ch� th馽 s� c� t醕 d鴑g v緄 m鬾 ph醝 c chi猲, ng呓i kh鬾g ph鋓 m鬾 ph醝 c chi猲 n阯 kh� c� th� 鹫t 疬㧟 hi畊 qu�.")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		else 
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 22211, 0 )
			BeginEvent(sceneId)
	   			AddText( sceneId, "Ng呓i 疸 nh 疬㧟 tr課g th醝  th鈔. Ch� � thu h癷 tr鈔 th� n猽 kh鬾g hi畊 qu� s� m t醕 d鴑g ngay khi ng呓i ti猲 v鄌." )
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		end

	end
end
