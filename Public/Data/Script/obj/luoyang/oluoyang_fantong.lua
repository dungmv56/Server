--L誧 D呓ngNPC
--范统
--饭店老板

x000059_g_ShopTabId	= 15

x000059_g_ScriptId	= 000059

--**********************************
--事件交互入口
--**********************************
function x000059_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  H銀 皙n th� n猰 c醕 th� ch� Minh Tr鈔 L鈛 � L誧 D呓ng, 痄m b鋙 c醕 h� 錸 r癷 s� kh鬾g mu痭 r秈 xa L誧 D呓ng n鎍")
		AddNumText(sceneId,x000059_g_ScriptId,"Mua th裞 錸",7,0)
--		AddNumText(sceneId,x000059_g_ScriptId,"Tinh力打工",6,1)
--		AddNumText(sceneId,x000059_g_ScriptId,"活力打工",6,2)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件列表选中m祎 项
--**********************************
function x000059_OnEventRequest( sceneId, selfId, targetId, eventId )
	local	key	= GetNumText()
	local	ene	= GetHumanEnergy( sceneId, selfId )	--Tinh力
	local	vig	= GetHumanVigor( sceneId, selfId )	--活力
	
	if key == 0 then
		DispatchShopItem( sceneId, selfId, targetId, x000059_g_ShopTabId )
		
	elseif key == 1 then
		if ene >= 40 then
			SetHumanEnergy( sceneId, selfId, ene-40 )
			AddMoney( sceneId, selfId, 3000 )
			x000059_MsgBox( sceneId, selfId, "C醕 h� l鄊 th阭 ti陁 hao 40 tinh l馽, 鹫t 疬㧟 30 鸢ng b誧" );
		else
			x000059_MsgBox( sceneId, selfId, "Tinh l馽 c黙 c醕 h� kh鬾g 瘘 40 餴琺, 鬾g ch� kh鬾g mu痭 c醕 h� ph鋓 l鄊 th阭" );
		end
	elseif key == 2 then
		if vig >= 40 then
			SetHumanVigor( sceneId, selfId, vig-40 )
			AddMoney( sceneId, selfId, 3000 )
			x000059_MsgBox( sceneId, selfId, "C醕 h� l鄊 th阭 ti陁 hao 40 ho誸 l馽, 鹫t 疬㧟 30 鸢ng b誧" );
		else
			x000059_MsgBox( sceneId, selfId, "Ho誸 l馽 c騨 ch遖 鹫t 40, 鬾g ch� kh鬾g mu痭 cho c醕 h� l鄊 th阭" );
		end
	end
end

--**********************************
--消息提示
--**********************************
function x000059_MsgBox( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
