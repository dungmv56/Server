--Thi阯 S絥NPC
--邓婆
--普通

x017035_g_scriptId = 017035

--**********************************
--事件交互入口
--**********************************
function x017035_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"Ph醝 Thi阯 S絥 c黙 ta v� Tuy猼 qu醝 t� tr呔c 皙n gi� n呔c s鬾g kh鬾g ph誱 n呔c gi猲g, nh遪g b鱪 ch鷑g c鄋g l鷆 c鄋g b誳 ng唼c, L鉶 L鉶 疸 d鵱g k� d� ch鷑g 皙n Linh Th製 Phong, b鈟 gi� m鱥 vi甤 tr鬾g ch� v鄌 ng呓i 黏y")
		AddNumText(sceneId,x017035_g_scriptId,"衖 ti陁 di畉 Tuy猼 qu醝",10,0)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件列表选中m祎 项
--**********************************
function x017035_OnEventRequest( sceneId, selfId, targetId, eventId )
	if	GetNumText()==0	then
		if	GetLevel( sceneId, selfId)<61  then	
			BeginEvent( sceneId )
			local strText = "S裞 m課h c黙 疳m Tuy猼 qu醝 n鄖 v� c鵱g gh� g緈, 鹌ng c c黙 ng呓i ch遖 鹫t 皙n c 61, 疬a ng呓i 餴 nh� v, qu� th馽 r nguy hi琺"
			AddText( sceneId, strText )
			EndEvent( sceneId )
			DispatchEventList(sceneId,selfId,targetId)
		else
			CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 147,94,145)
		end
	end
end
