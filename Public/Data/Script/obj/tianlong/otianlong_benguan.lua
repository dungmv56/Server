--Thi阯 LongNPC
--本观
--普通

x013003_g_scriptId = 013003

--**********************************
--事件交互入口
--**********************************
function x013003_OnDefaultEvent( sceneId, selfId,targetId )
	x013003_g_MenPai = GetMenPai(sceneId, selfId)
	if x013003_g_MenPai == 6 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{TYJZ_081103_02}")
			AddNumText(sceneId, x013003_g_scriptId, "K� n錸g h鱟 t",12,0)
			AddNumText(sceneId, x013003_g_scriptId, "Gi緄 thi畊 v� t鈓 ph醦",11,10)
			--AddNumText(sceneId, x013003_g_scriptId, "#{JZBZ_081031_02}",11,11)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	else
			BeginEvent(sceneId)
			
			AddText(sceneId,"L鉶 n誴 b眓 quan, th� ch� t靘 b t錸g c� vi甤 g�?")
			
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end
end

--**********************************
--事件列表选中m祎 项
--**********************************
function x013003_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 10 then
			BeginEvent(sceneId)	
					
				AddText( sceneId, "#{function_xinfajieshao_001}" )
								
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
	elseif GetNumText() == 11 then
		BeginEvent(sceneId)					
			AddText( sceneId, "#{JZBZ_081031_01}" )							
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	DispatchXinfaLevelInfo( sceneId, selfId, targetId, 6 );
end
