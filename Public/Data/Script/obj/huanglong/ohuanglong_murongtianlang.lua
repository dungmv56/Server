--黄龙NPC
--慕容天狼
--普通

--**********************************
--事件交互入口
--**********************************
function x023004_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  T竎h Nhan n鄖 lai l竎h m� 醡, kh鬾g ph鋓 ng叨i t礳 ta, l騨g d� t kh醕! Ta 疸 cho A V錸 ch� � h鄋h tung c黙 n�, nh遪g A V錸 l n鄌 c鹡g b醥 c醥 kh鬾g c� g� kh醕 th叨ng... Ta ngh� ta nh靚 ng叨i kh鬾g h� sai, nh 鸶nh c� x鋣 ra chuy畁 g� kh醕.")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
