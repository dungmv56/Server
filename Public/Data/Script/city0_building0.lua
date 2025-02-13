--城市NPC
--武具

x805007_g_scriptId=805007
x805007_g_BuildingID15 = 6

--**********************************
--事件交互入口
--**********************************
function x805007_OnDefaultEvent( sceneId, selfId,targetId )
	
	local guildid 		= GetHumanGuildID(sceneId,selfId)
	local cityguildid = GetCityGuildID(sceneId, selfId, sceneId)
	local strText
	
	if(guildid ~= cityguildid) then
		BeginEvent(sceneId)
			strText = "    Kh鬾g ph鋓 l� ng叨i c黙 ta, kh鬾g b醤 ra ngo鄆 t c� c醕 lo読 binh kh�"
			AddText(sceneId,strText)
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	BeginEvent(sceneId)
		strText = "    Ta l� ch� c豠 h鄋g binh kh�, b鋙 ki猰 餴 v緄 anh h鵱g, nh鎛g vi甤 li阯 quan 皙n binh kh� trong thi阯 h� 皤u c� th� t靘 ta, 皤u l� ng叨i m祎 nh� m�.."
		AddText(sceneId,strText)
		AddNumText(sceneId,x805007_g_scriptId,"C豠 h鄋g b� m�",7,8)
		AddNumText(sceneId,x805007_g_scriptId,"Nh� ch� t誳",6,9)
		AddNumText(sceneId,x805007_g_scriptId,"Gi緄 thi畊 c豠 h鄋g binh c�",11,7)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件列表选中一项
--**********************************
function x805007_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 1 then
		CityBuildingChange(sceneId, selfId, x805007_g_BuildingID15, 0)
	elseif GetNumText() == 2 then
		CityBuildingChange(sceneId, selfId, x805007_g_BuildingID15, 1)
	elseif GetNumText() == 3 then
		CityBuildingChange(sceneId, selfId, x805007_g_BuildingID15, 2)
	elseif GetNumText() == 4 then
		CityBuildingChange(sceneId, selfId, x805007_g_BuildingID15, 3)
	elseif GetNumText() == 5 then
		CityBuildingChange(sceneId, selfId, x805007_g_BuildingID15, 4)
	elseif GetNumText() == 6 then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId) --调用城市商店界面
			UICommand_AddInt(sceneId,x805007_g_BuildingID15)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 104)
	elseif GetNumText() == 7 then
		BeginEvent(sceneId)
		AddText( sceneId, "#{City_Intro_WuJuFang}" )		
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

