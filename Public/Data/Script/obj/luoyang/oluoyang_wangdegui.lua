--L誧 D呓ngNPC
--王德贵
--普通

--脚本号
x000050_g_ScriptId			= 000050

--武器店
x000050_g_shoptableindex= 11

--**********************************
--事件交互入口
--**********************************
function x000050_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
	AddText( sceneId, "  T緄 xem 餴, binh kh� c黙 ta � 疴y 皤u l� lo読 t痶 nh th鄋h L誧 D呓ng" )
	AddNumText( sceneId, x000050_g_ScriptId, "Mua binh kh�", 7, 100 )
	AddNumText( sceneId, x000050_g_ScriptId, "Gi醡 鸶nh ch l唼ng", 6, 101 )
	AddNumText( sceneId, x000050_g_ScriptId, "Gi醡 鸶nh t� ch trang b� l読 t� 馥u", 6, 102 )
	AddNumText( sceneId, x000050_g_ScriptId, "Gi醡 鸶nh ch l唼ng trang b�", 11, 105 )
	AddNumText( sceneId, x000050_g_ScriptId, "Gi緄 thi畊 v� gi醡 鸶nh t� ch trang b� l読 t� 馥u", 11, 106 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中m祎 项
--**********************************
function x000050_OnEventRequest( sceneId, selfId, targetId, eventId )

	if GetNumText() == 105 then
		BeginEvent( sceneId )
			AddText( sceneId, "#{function_help_081}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end
	
	if GetNumText() == 106 then
		BeginEvent( sceneId )
			AddText( sceneId, "#{function_help_097}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end

	local	key	= GetNumText()
	if key == 100 then
		DispatchShopItem( sceneId, selfId, targetId, x000050_g_shoptableindex )
	elseif key == 101 then
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1001 )
	elseif key == 102 then
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 112233 )
	end
end
