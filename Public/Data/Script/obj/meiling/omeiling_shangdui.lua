--梅岭NPC
--商队
--普通

--**********************************
--事件交互入口
--**********************************
function x033010_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  械i bu鬾 d譶g l読 Mai L頽h 疸 kh� nhi玼 ng鄖, h鄋g h骯 b醤 g h猼 c�, chuy猲 n鄖 餴 m鱥 ng叨i chia 疬㧟 kh鬾g 韙. #r#r詎g ch� Th qu� l� m祎 thi阯 t鄆 kinh doanh, 餴 bu鬾 c鵱g 鬾g  qu� l� ph鷆 ph t� ki猵 tr呔c.")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
