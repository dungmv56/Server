--琼州NPC
--凌忆慈
--普通

--**********************************
--事件交互入口
--**********************************
function x035003_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  L鉶 Tam l鷆 n鄌 c鹡g mu痭 ta 皙n Qu蟦h Ch鈛, nh遪g b醕h t韈h c黙 L遳 C 餫ng ch竨 鬾 d竎h ho鄋h h鄋h, ta th馽 s� kh鬾g th� b� m m� 餴. #r#rL n鄖 ta 皙n Qu蟦h Ch鈛, ch� y猽 v� nghe T� Kh鈓 n骾 Nam H鋓 c� m祎 v� th y Nh誧 Tr鱪g Th�, d鵱g v� gi痭g c鈟 l� ch鎍 疬㧟 鬾 d竎h. 玄i ta n v鎛g 疬㧟 k� thu n鄖 c騨 ph鋓 quay v� L遳 C ch鎍 b畁h cho b� t韓h.")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
