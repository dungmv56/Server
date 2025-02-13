--修装备

function x801015_OnService( sceneId, selfId, itemId, platformType )
--m祎 些条件判断
--修理
--完成
	local tArray = {}
	tArray[1] = {0}
	tArray[2] = {1,2,3,4,5,14,15}
	tArray[3] = {6,7,11,12,13}
	
	local tArray_Text = {"朽i ch誱 kh鋗 ch� c� th� s豠 ch鎍 v� kh�","朽i may m ch� c� th� s豠 ch鎍 ph騨g c�","朽i c鬾g ngh� ch� c� th� s豠 ch鎍 鸢 trang s裞"}
	local tArray_Ability = {"瘊c khu鬾","May m","C鬾g ngh�"}
	local nLevel =GetBagItemLevel(sceneId, selfId,itemId)
	local EquipType = LuaFnGetBagEquipType(sceneId, selfId, itemId)
	local find = 0

	for i, item in tArray[platformType] do
		if item == EquipType then
			find =1
		end
	end
	
	if find == 0 then
		BeginEvent(sceneId)
		AddText(sceneId,tArray_Text[platformType])
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	if nLevel < 40 then
		BeginEvent(sceneId)
		AddText(sceneId,"Ch� c� th� s豠 ch鎍 trang b� c� 鹌ng c y陁 c >=40")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	ret = DoRepair( sceneId, selfId, itemId, platformType )

	if ret == -1 then
		BeginEvent(sceneId)
		AddText(sceneId,"Trang b� n鄖 kh鬾g th� 疬㧟 s豠 ch鎍 l n鎍")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	elseif ret == -2 then
		BeginEvent(sceneId)
		AddText(sceneId,"S� l唼ng "..tArray_Ability[platformType].."衅ng c k� n錸g kh鬾g 瘘")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	elseif ret == -3 then
		BeginEvent(sceneId)
		AddText(sceneId,"Kh鬾g 瘘 ho誸 l馽")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	elseif ret == -4 then
		BeginEvent(sceneId)
		AddText(sceneId,"Th kh鬾g may, trong qu� tr靚h s豠, do v may c黙 c醕 h� kh鬾g t痶, khi猲 chi猚 n鄖 #{_ITEM"..LuaFnGetItemTableIndexByIndex(sceneId,selfId,itemId).."} b� t眓 th nhi玼")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,-1)
	elseif ret == -5 then
		BeginEvent(sceneId)
		AddText(sceneId,"Trong qu� tr靚h s豠 xu hi畁 sai s髏 kh鬾g r� do 疴u")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	elseif ret == -6 then
		BeginEvent(sceneId)
		AddText(sceneId,"V ph kh鬾g c� v 皤 g�, kh鬾g c s豠")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	elseif ret == 0 then
		BeginEvent(sceneId)
		AddText(sceneId,"Tr鋓 qua tay c醕 h� t� m� tu ph鴆, chi猚 n鄖 #{_ITEM"..LuaFnGetItemTableIndexByIndex(sceneId,selfId,itemId).."} 疸 s豠 xong")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,-1)
		Msg2Player(  sceneId, selfId,"Ti陁 hao "..floor(nLevel/10+5).." Ho誸 l馽",MSG2PLAYER_PARA )
	end
	
end
