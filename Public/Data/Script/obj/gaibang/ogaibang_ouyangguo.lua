--C醝 BangNPC
--欧阳果
--普通

x010035_g_scriptId = 010035

--**********************************
--事件交互入口
--**********************************
function x010035_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"L� kh� d� 痼 quen th骾 v鄌 h r唼u 錸 tr祄 r唼u, th 疳ng gh閠, ch鷑g ta 疸 cho ch鷑g v鄆 b鄆 h鱟, l読 kh鬾g bi猼 ng nh� d醡 皙n t c鬾g t眓g 疣 c黙 C醝 Bang, c� mu痭 餴 \"d m\" b鱪 ch鷑g kh鬾g?")
		AddNumText(sceneId,x010035_g_scriptId,"衖 ng錸 ch kh� d�",10,0)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件列表选中m祎 项
--**********************************
function x010035_OnEventRequest( sceneId, selfId, targetId, eventId )
	if	GetNumText()==0	then
		if	GetLevel( sceneId, selfId)<11  then	
			BeginEvent( sceneId )
			local strText = "Kh鬾g 疬㧟 coi th叨ng l� kh� 痼, ta th ng呓i n阯 瘙i v唼t qua c 11 h莕g quay l読 t靘 ta"
			AddText( sceneId, strText )
			EndEvent( sceneId )
			DispatchEventList(sceneId,selfId,targetId)
		else
			CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 140,91,151)
		end
	end
end
