--姓i L齆PC
--珍兽猫
--普通

--**********************************
--事件交互入口
--**********************************
function x002066_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local roll = random(0,2)
	if roll <= 0 then
			AddText(sceneId,"  V鈔 Phi Phi t� t� l� th t唼ng c黙 t c� tr鈔 th� ch鷑g ta. Phi Phi, ta y陁 t�, nh� chu祎 y陁 g誳!")
	elseif roll <= 1 then
			AddText(sceneId,"  凶ng t叻ng rg ch鷑g ta kh鬾g bi猼 n骾, Phi Phi t� t� 疸 d誽 ch鷑g ta t� l鈛 r癷. Kh鬾g tin, ch鷑g ta th� thi 瘅 xem sao")
	else
			AddText(sceneId,"  C醕 h� bi猼 kh鬾g? Nghe n骾 Phi Phi t� t� c� 2 ch� em, gi痭g h畉 nhau")
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
