--城市NPC
--酒店

x805018_g_scriptId=805018
x805018_g_BuildingID13 = 2

--**********************************
--事件交互入口
--**********************************
function x805018_OnDefaultEvent( sceneId, selfId,targetId )

	local guildid 		= GetHumanGuildID(sceneId,selfId)
	local cityguildid = GetCityGuildID(sceneId, selfId, sceneId)
	local strText
	
	if(guildid ~= cityguildid) then
		BeginEvent(sceneId)
			strText = "    Kh鬾g ph鋓 l� ng叨i c黙 ta, kh鬾g ti猵 r唼u th竧"
			AddText(sceneId,strText)
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	BeginEvent(sceneId)
		strText = "    Ta l� ch� ti甿 r唼u, h騛 kh� sinh t鄆, m鱥 ng叨i 皤u l� ng叨i quen, c� vi甤 g� li阯 quan 皙n n n呔ng 鹱ng ng読 皙n t靘 ta"
		AddText(sceneId,strText);
		AddNumText(sceneId,x805018_g_scriptId,"Th馽 鸾n m髇 n n呔ng",7,6)
		AddNumText(sceneId,x805018_g_scriptId,"Gi緄 thi畊 ti甿 r唼u",8,7)
		--life 添加这个建筑物的相应生活技能选项
		CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "AddCityLifeAbilityOpt",sceneId, selfId, x805018_g_scriptId,x805018_g_BuildingID13,8)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件列表选中一项
--**********************************
function x805018_OnEventRequest( sceneId, selfId, targetId, eventId )
	--处理这个建筑物的相应生活技能选项
	if eventId ~= x805018_g_scriptId then
		CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnDefaultEvent",sceneId, selfId, targetId, eventId, x805018_g_scriptId, x805018_g_BuildingID13 )
		return
	end
	
	if GetNumText() == 1 then
		CityBuildingChange(sceneId, selfId, x805018_g_BuildingID13, 0)
	elseif GetNumText() == 2 then
		CityBuildingChange(sceneId, selfId, x805018_g_BuildingID13, 1)
	elseif GetNumText() == 3 then
		CityBuildingChange(sceneId, selfId, x805018_g_BuildingID13, 2)
	elseif GetNumText() == 4 then
		CityBuildingChange(sceneId, selfId, x805018_g_BuildingID13, 3)
	elseif GetNumText() == 5 then
		CityBuildingChange(sceneId, selfId, x805018_g_BuildingID13, 4)
	elseif GetNumText() == 6 then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId) --调用城市商店界面
			UICommand_AddInt(sceneId,x805018_g_BuildingID13)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 104)
	elseif GetNumText() == 7 then
		BeginEvent(sceneId)
		AddText( sceneId, "#{City_Intro_JiuSi}" )		
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 8 then
		BeginEvent(sceneId)
		--life 添加这个建筑物的相应生活技能选项
		CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnEnumerate",sceneId, selfId, targetId, x805018_g_BuildingID13 )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
	end
end
