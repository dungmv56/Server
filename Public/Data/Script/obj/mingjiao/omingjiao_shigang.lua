--Minh Gi醥NPC
--石刚
--普通

x011035_g_scriptId = 011035

--**********************************
--事件交互入口
--**********************************
function x011035_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"Quan binh l読 皙n v鈟 疳nh Quang Minh 痫nh, th r r痠, c� 餴玼 b鱪 皙n ch� l� v� danh ti瑄 t痶, c醕 h� c� mu痭 ra luy畁 ch鷗 quy玭 c呔c ch錸g?")
		AddNumText(sceneId,x011035_g_scriptId,"衖 ch ph� bao v鈟",10,0)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件列表选中m祎 项
--**********************************
function x011035_OnEventRequest( sceneId, selfId, targetId, eventId )
	if	GetNumText()==0	then
		if	GetLevel( sceneId, selfId)<31  then	
			BeginEvent( sceneId )
			local strText = "D� l� v� danh ti瑄 t痶, c鹡g kh鬾g 疬㧟 khinh th叨ng, c醕 h� c騨 ch遖 鹫t c 31, v� s� an to鄋 c黙 c醕 h�, ta xem c� luy畁 t th阭 r癷 h莕g quay l読"
			AddText( sceneId, strText )
			EndEvent( sceneId )
			DispatchEventList(sceneId,selfId,targetId)
		else
			CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 141,97,157)
		end
	end
end
