--梅岭NPC
--银叶
--普通

--**********************************
--事件交互入口
--**********************************
function x033006_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  Nghe nh鎛g l秈 c黙 Kinh C鷆 鹫i h� ph醦, m緄 bi猼 m ch鴆 n錷 nay s痭g v� 韈h. Sau n鄖 m鱥 ng叨i 餴 theo Kinh C鷆 鹫i h� ph醦, d s鬷 l豠 b鰊g c鹡g nguy畁 m祎 l騨g.")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
