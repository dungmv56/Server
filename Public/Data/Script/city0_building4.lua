--城市NPC
--防具

x805011_g_scriptId=805011
x805011_g_BuildingID5 = 4

--**********************************
--事件交互入口
--**********************************
function x805011_OnDefaultEvent( sceneId, selfId,targetId )

	local guildid 		= GetHumanGuildID(sceneId,selfId)
	local cityguildid = GetCityGuildID(sceneId, selfId, sceneId)
	local strText
	
	if(guildid ~= cityguildid) then
		BeginEvent(sceneId)
			strText = "    Kh鬾g ph鋓 l� ng叨i c黙 ta, kh鬾g b醤 t c� c醕 qu鈔 trang ho鄋 m�"
			AddText(sceneId,strText)
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end

	BeginEvent(sceneId)
		strText = "    Ta l� ch� ti甿 d鴑g c� ph騨g th鈔, c� vi甤 g� ch� gi醥? N猽 c� vi甤 g� li阯 quan 皙n d鴑g c� ph騨g th鈔, t靘 Ch鈛 V� K� ta nh 鸶nh kh鬾g sai 疴u"
		AddText(sceneId,strText);
		AddNumText(sceneId,x805011_g_scriptId,"C豠 h鄋g b� m",7,7)
		AddNumText(sceneId,x805011_g_scriptId,"Nh� ch� t誳",6,8)
		AddNumText(sceneId,x805011_g_scriptId,"Trang ph鴆 bang h礽",6,9)
		AddNumText(sceneId,x805011_g_scriptId,"Gi緄 thi畊 ph騨g c� ph叨ng",11,6)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
--**********************************
--事件列表选中一项
--**********************************
function x805011_OnEventRequest( sceneId, selfId, targetId, eventId )
	
	if GetNumText() == 1 then
		CityBuildingChange(sceneId, selfId, x805011_g_BuildingID5, 0)
	elseif GetNumText() == 2 then
		CityBuildingChange(sceneId, selfId, x805011_g_BuildingID5, 1)
	elseif GetNumText() == 3 then
		CityBuildingChange(sceneId, selfId, x805011_g_BuildingID5, 2)
	elseif GetNumText() == 4 then
		CityBuildingChange(sceneId, selfId, x805011_g_BuildingID5, 3)
	elseif GetNumText() == 5 then
		CityBuildingChange(sceneId, selfId, x805011_g_BuildingID5, 4)
	elseif GetNumText() == 6 then
		BeginEvent(sceneId)
		AddText( sceneId, "#{City_Intro_FangJuFang}" )		
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 7 then
		BeginEvent(sceneId)
		AddText( sceneId, "Ch裞 n錸g n鄖 s 疬㧟 th馽 hi畁" )		
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 8 then
		BeginEvent(sceneId)
		AddText( sceneId, "Ch裞 n錸g n鄖 s 疬㧟 th馽 hi畁" )		
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 9 then
		BeginEvent(sceneId)
		AddText( sceneId, "Ch裞 n錸g n鄖 s 疬㧟 th馽 hi畁" )		
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
	
end
