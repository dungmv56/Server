--Linh西NPC
--武吉
--5级打造图纸商

x021007_g_scriptId = 021007
x021007_g_shoptableindex = 107

--**********************************
--事件交互入口
--**********************************
function x021007_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "    G 疴y kh醕h 皙n l鄊 b鋘 鸢 ng鄖 c鄋g nhi玼, sao, Trung Nguy阯 l読 s giao tranh r癷 h�?" )
		AddNumText( sceneId, x021007_g_scriptId, "Ng呓i mu痭 mua g� n鄌?", 7, 0 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中m祎 项
--**********************************
function x021007_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 0 then
		DispatchShopItem( sceneId, selfId, targetId, x021007_g_shoptableindex )
	end
end
