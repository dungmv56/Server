--太湖NPC
--造反恶贼
--普通

--脚本号
x005112_g_ScriptId	= 005112

--**********************************
--事件交互入口
--**********************************
function x005112_OnDefaultEvent( sceneId, selfId,targetId )
	
	x005112_UpdateEventList( sceneId, selfId, targetId )
	
	
end


--**********************************
--事件列表
--**********************************
function x005112_UpdateEventList( sceneId, selfId, targetId )
	
	local nYaoDingCount = GetItemCount(sceneId, selfId, 40004415);
	
	if nYaoDingCount <= 0 then
		BeginEvent(sceneId)

			AddText(sceneId,"Linh d唼c 疸 ch� luy畁 th鄋h c鬾g, ch� c� ng叨i luy畁 疬㧟 m緄 c� linh d唼c - 姓i ho鄋 鸾n.")
		
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		
	elseif nYaoDingCount >= 1 then
	
		local nItemBagIndex = GetBagPosByItemSn(sceneId, selfId, 40004415);
				
		local actId = 36;
		
		local status = GetActivityParam( sceneId, actId, 0 );
				
		local YaoDing_LianYao_TimeCur = GetActivityParam( sceneId, actId, 4 );	
		local YaoDing_LianYao_TimeItem = GetBagItemParam( sceneId, selfId, nItemBagIndex, 3, 2 );
		
		if YaoDing_LianYao_TimeCur ~= YaoDing_LianYao_TimeItem then
			DelItem(sceneId, selfId, 40004415, 1)
			return 0;
		end
		
		BeginEvent(sceneId)

			AddText(sceneId,"Linh d唼c - 姓i ho鄋 鸾n 疸 ch� luy畁 th鄋h c鬾g, xin h鰅 c醕 h� li畊 mu痭 nh b鈟 gi�?")
			AddNumText(sceneId, x005112_g_ScriptId, "Nh 鹫i ho鄋 鸾n", 2, 0)

		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	
	end 
	
end


--**********************************
--事件列表选中m祎 项
--**********************************
function x005112_OnEventRequest( sceneId, selfId, targetId, eventId )

	if	GetNumText()==0 then
	
		if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 1 then
			x808004_MsgBox( sceneId, selfId, targetId, "  Kh鬾g gian trong H鄋h trang c黙 c醕 h� kh鬾g 瘘. Ch飊h l� xong h銀 t緄 t靘 t読 h�." )
			return 0;
		end
		
		
		if TryRecieveItem( sceneId, selfId, 30505076, 1 ) >= 0 then
			str		= "#YC醕 h� 疸 nh 疬㧟 "..GetItemName( sceneId, 30505076 ).."."
			Msg2Player( sceneId, selfId, str, MSG2PLAYER_PARA )
			x005112_NotifyTip( sceneId, selfId, str )
			
			DelItem(sceneId, selfId, 40004415, 1)
			
			BeginEvent(sceneId)
				AddText(sceneId,"C醕 h� c� 疬㧟 鹫i ho鄋 鸾n r癷!")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			
			LuaFnDeleteMonster(sceneId, targetId)
			
			--统计信息
			local guidSelf = 
			LuaFnAuditHDXianCaoZhengDuo(sceneId, selfId, "姓i Ho鄋 衋n th鄋h");

		end		
		
		
	end
	
end

--**********************************
--醒目提示
--**********************************
function x005112_NotifyTip( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
