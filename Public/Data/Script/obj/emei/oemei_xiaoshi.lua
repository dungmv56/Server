--Nga MyNPC
--小诗
--普通

--**********************************
--事件交互入口
--**********************************
function x015005_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  Ch叻ng m鬾 t� t� g 疴y lu鬾 nh t緄 m祎 ng叨i t阯 l� H鄋 Th� Trung, n骾 anh ta l� m祎 鹫i anh h鵱g, c� th� s醤h v緄 \"B Ki玼 Phong\" v� \"Nam M� Dung\"")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
