--玉溪NPC
--索姆拉
--普通

--**********************************
--事件交互入口
--**********************************
function x027001_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  L鉶 phu n錷  tr� trung c叨ng tr醤g, t譶g l鄊 m祎 鬾g Th Chung Qu� bi猼 b chu祎 cho Th 鹫i nh鈔 xem. Kh鬾g bi猼 l� c醕 h� th 皓p th hay c� t靚h b陁 gi猽 ta, chuy畁 n鄖 疸 疬㧟 c醕 h� ghi ch閜 trong M祅g kh� b鷗 疣m. B鈟 gi� nh靚 l読 鬾g Th Chung Qu� 痼, th ch苙g kh醕 g� 鸢 ch絠 c黙 tr� con...")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
