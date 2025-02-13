--活动——
--中秋活动-团圆欢庆月饼活动

--脚本号
x050020_g_ScriptId = 050020

--x050020_g_EndDayTime = 7290   --活动结束时间 2007-10-18
x050020_g_EndDayTime = 8304   --活动结束时间 2008-10-31,包含当日

x050020_g_PingFengSn = 40004428			--屏风ID
x050020_g_BianShenPieSn = 30505132	--易容丹月饼ID

x050020_g_strBianShenPieInfo = "#{ZHONGQIUBIANSHEN_001}"
x050020_g_strGongGaoInfo = {

	"#Y Nh誧 Th叨ng Vi阯#cff99cc c叨i to n骾: #{_INFOUSR%s}#cff99cc anh h鵱g, 3 c醝#W#{_INFOMSG%s}#cff99cc n鄖 c� ph鋓 ch錸g 餺誸 t� trong tay #YD� 械c#cff99cc kh鬾g? Ta s� kh鬾g th t韓, c醝 #{_INFOMSG%s}#cff99cc n鄖 s� l� c黙 ng呓i! ",
	"#Y Nh誧 Th叨ng Vi阯#cff99cckinh h鉯: #{_INFOUSR%s}#cff99cc, c醕 h� th s� t� trong tay #YH皀g H鵱g V呓ng#cff99cc 餺誸 疬㧟 3 mi猲g #{_INFOMSG%s}#cff99cc! Vi阯 #{_INFOMSG%s}#cff99cc n鄖 n骾 sao th� c鹡g nh l 餴! ",
	"#Y Nh誧 Th叨ng Vi阯#cff99cc nh靚#{_INFOUSR%s}#cff99cc t� trong tay #YC醫 Vinh#cff99cc 餺誸 疬㧟 3 mi猲g #{_INFOMSG%s}#cff99cc vui m譶g v� c鵱g, l ra 1 vi阯 #{_INFOMSG%s}#cff99cc 瓞 皤n 疳p. ",

}

--**********************************
--任务入口函数
--**********************************
function x050020_OnDefaultEvent( sceneId, selfId, targetId )

	local isTime = x050020_CheckRightTime()
	if 1 ~= isTime then
		return
	end

	local NumText = GetNumText()

	if NumText == 101 then

		BeginEvent(sceneId)
			AddText(sceneId, x050020_g_strBianShenPieInfo)
			AddNumText(sceneId, x050020_g_ScriptId, "斜i", 6, 201 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 201 then

		--领易容丹月饼....
		x050020_GivePlayerPie( sceneId, selfId, targetId )
	elseif NumText == 102 then
	
		BeginEvent(sceneId)
			AddText(sceneId, "#{ZQHD_20070916_013}")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	end

end

--**********************************
--列举事件
--**********************************
function x050020_OnEnumerate( sceneId, selfId, targetId )

	local isTime = x050020_CheckRightTime()
	if 1 ~= isTime then
		return
	end

	AddNumText(sceneId, x050020_g_ScriptId, "Ta mu痭 bi猲 th鈔 th鄋h b醤h Trung Thu", 6, 101 )													
end

--**********************************
--检测活动喧ng否已结束
--**********************************
function x050020_CheckRightTime()

	local curDayTime = GetDayTime()
	if curDayTime <= x050020_g_EndDayTime then
		return 1
	else
		return 0
	end

end

--**********************************
--给玩家易容丹月饼
--**********************************
function x050020_GivePlayerPie( sceneId, selfId, targetId )

	--关闭对话窗口....
	BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId, 1000 )

	--喧ng否有3c醝....
	local itemCount = LuaFnGetAvailableItemCount(sceneId, selfId, x050020_g_PingFengSn)
	if itemCount < 3 then
		BeginEvent(sceneId)
			AddText( sceneId, "Nhi甿 v� 鹫o c� kh鬾g 瘘, kh鬾g th� 鸨i" )
		EndEvent(sceneId)
		DispatchMissionTips( sceneId, selfId )
		return
	end
	
	--删除前获取屏风to� 鸬 Transfer....
	local pingFengPos = GetItemBagPos( sceneId, selfId, x050020_g_PingFengSn, 0 )
	if pingFengPos < 0 then
		BeginEvent(sceneId)
			AddText( sceneId, "Nhi甿 v� 鹫o c� kh鬾g 瘘, kh鬾g th� 鸨i" )
		EndEvent(sceneId)
		DispatchMissionTips( sceneId, selfId )
	end
	local pingFengTransfer = GetBagItemTransfer(sceneId,selfId,pingFengPos)

	--检测背包喧ng否有地方....
	if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 1 then
		BeginEvent(sceneId)
			AddText( sceneId, "Ch� tr痭g trong t鷌 x醕h kh鬾g 瘘" )
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end

	--喧ng否删除th b読....
	if 0 == DelItem(sceneId, selfId, x050020_g_PingFengSn, 3) then
		BeginEvent(sceneId)
			AddText( sceneId, "Nhi甿 v� 鹫o c� kh鬾g 瘘, kh鬾g th� 鸨i" )
		EndEvent(sceneId)
		DispatchMissionTips( sceneId, selfId )
		return
	end

	--给物品并公告....
	local BagIndex = TryRecieveItem( sceneId, selfId, x050020_g_BianShenPieSn, QUALITY_MUST_BE_CHANGE )
	if BagIndex ~= -1 then

		BeginEvent( sceneId )
			AddText( sceneId, "C醕 h� 鸨i 疬㧟 1 D竎h Dung 衋n: B醤h Trung Thu" )
		EndEvent( sceneId )
		DispatchMissionTips( sceneId, selfId )

		--世界公告....
		local ItemTransfer = GetBagItemTransfer(sceneId,selfId,BagIndex)
		local PlayerName = GetName(sceneId, selfId)
		local nMsgIndex = random(3)
		local str
		if nMsgIndex == 1 then
			str = format( x050020_g_strGongGaoInfo[1], PlayerName, pingFengTransfer, ItemTransfer )
		elseif nMsgIndex == 2 then
			str = format( x050020_g_strGongGaoInfo[2], PlayerName, pingFengTransfer, ItemTransfer )
		else
			str = format( x050020_g_strGongGaoInfo[3], PlayerName, pingFengTransfer, ItemTransfer )
		end
		BroadMsgByChatPipe( sceneId, selfId, str, 4 )

	end

end

--**********************************
--检测Ti猵 th跫�
--**********************************
function x050020_CheckAccept( sceneId, selfId )
end

--**********************************
--Ti猵 th�
--**********************************
function x050020_OnAccept( sceneId, selfId )
end

--**********************************
--放弃
--**********************************
function x050020_OnAbandon( sceneId, selfId )
end

--**********************************
--继续
--**********************************
function x050020_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--检测喧ng否可以提交
--**********************************
function x050020_CheckSubmit( sceneId, selfId )
end

--**********************************
--提交
--**********************************
function x050020_OnSubmit( sceneId, selfId, targetId, selectRadioId )
end

--**********************************
--杀死怪物或玩家
--**********************************
function x050020_OnKillObject( sceneId, selfId, objdataId ,objId )
end

--**********************************
--进入区域事件
--**********************************
function x050020_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x050020_OnItemChanged( sceneId, selfId, itemdataId )
end
