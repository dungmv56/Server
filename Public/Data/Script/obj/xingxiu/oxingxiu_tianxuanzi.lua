--Tinh T鷆NPC
--天璇子
--普通

x016035_g_scriptId = 016035

--**********************************
--事件交互入口
--**********************************
function x016035_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"H鬽 tr呔c th呓ng long xu hi畁 tr阯 tr秈, Th M礳 V呓ng 酗nh c黙 s� ph� ph醫 ra ti猲g k陁 v� v�, d� 疬㧟 v� s� nh畁 l緉 皙n 疴y ch韓h l� th秈 c� 瓞 tu luy畁, c醕 h� c� mu痭 餴 xem kh鬾g?")
		AddNumText(sceneId,x016035_g_scriptId,"嗅nh nh畁 瓞 tu luy畁",10,0)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件列表选中m祎 项
--**********************************
function x016035_OnEventRequest( sceneId, selfId, targetId, eventId )
	if	GetNumText()==0	then
		if	GetLevel( sceneId, selfId)<51  then	
			BeginEvent( sceneId )
			local strText = "Ng叨i trong giang h� b呔c v鄌 tu luy畁, ph l緉 皤u t� c 51 tr� l阯, th v� c鬾g c黙 ng呓i c鹡g t th叨ng, ta kh鬾g d ng呓i 餴 疴u"
			AddText( sceneId, strText )
			EndEvent( sceneId )
			DispatchEventList(sceneId,selfId,targetId)
		else
			CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 146,91,144)
		end
	end
end
