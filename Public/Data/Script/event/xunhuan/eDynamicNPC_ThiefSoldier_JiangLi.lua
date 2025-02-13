
--************************************************************************
--MisDescBegin
--脚本号
x050015_g_ScriptId	= 050015

--MisDescEnd
--************************************************************************


x050015_ScoreMin = 100

x050015_TitleLevel1 = 131
x050015_TitleLevel2 = 132
x050015_TitleLevel3 = 133
x050015_TitleLevel4 = 134
x050015_TitleLevel5 = 135

--烫金名帖ID	--add by xindefeng
x050015_g_TangJinMingTieID = 30505205
--m祎 次删除烫金名帖数量	--add by xindefeng
x050015_g_DelMingTieCount = 1

--**********************************
--任务入口函数
--**********************************
function x050015_OnDefaultEvent( sceneId, selfId, targetId )
	local SelNum = GetNumText()		
	if SelNum == 1 then	
		x050015_DuiHuan( sceneId, selfId, targetId )
	elseif SelNum == 2 then
		x050015_ChaXun( sceneId, selfId, targetId )
	elseif SelNum == 3 then	--秏祎 话锘嶙远ㄒ宄坪�--add by xindefeng
		x050015_ZiDingYi(sceneId, selfId, targetId)
	elseif SelNum == 22 then	--关于L頽h 帮会自定义称号--add by xindefeng
		x050015_MsgBox(sceneId, selfId, targetId, "#{TangJinMingTie_Help}")
	elseif SelNum == 255 then
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
	end
end

--**********************************
--列举事件
--**********************************
function x050015_OnEnumerate( sceneId, selfId, targetId )
	AddNumText(sceneId,x050015_g_ScriptId,"Ta ph鋓 鸨i danh x遪g c黙 ta",6,1)
	AddNumText(sceneId,x050015_g_ScriptId,"Ta mu痭 tra 餴琺 t韈h l鹹 c黙 ta",6,2)	
	AddNumText(sceneId,x050015_g_ScriptId,"Nh l頽h danh hi畊 bang h礽 t� l",6,3)--add by  xindefeng
	AddNumText(sceneId,x050015_g_ScriptId,"Li阯 quan nh l頽h danh hi畊 bang h礽 t� l", 11, 22 )--add by xindefeng
  AddNumText(sceneId,x050015_g_ScriptId,"R秈 b�........",8, 255 )
end

function x050015_GetCurTitle( sceneId, selfId )    --根据积分取 餴琺称号(称号编号)
    local Score = GetMissionData( sceneId, selfId, MD_ThiefSoldierInvade )
    
    
    local Title = 0
    
    if Score >= 100 and Score < 500 then
        Title = x050015_TitleLevel1
        
    end
    
    if Score >= 500 and Score < 5000 then
        Title = x050015_TitleLevel2
    end
    
    if Score >= 5000 and Score < 30000 then
        Title = x050015_TitleLevel3
    end
    
    if Score >= 30000 and Score < 65000 then
        Title =  x050015_TitleLevel4
    end
    
    if Score >= 65000 then
        Title =  x050015_TitleLevel5
    end
  
    return Title
     
end

function x050015_GetTitleName( Title )    --根据称号编号取 餴琺称号名称

    local TitleName = ""

    if Title == x050015_TitleLevel1 then
        TitleName = "B靚h T Binh S�"
    elseif Title == x050015_TitleLevel2 then
        TitleName = "B靚h T 械i Tr叻ng"
    elseif Title == x050015_TitleLevel3 then
        TitleName = "B靚h T Th痭g L頽h"
    elseif Title == x050015_TitleLevel4 then
        TitleName = "秀ng Kh T呔ng Qu鈔"
    elseif Title == x050015_TitleLevel5 then
        TitleName = "秀ng Kh Nguy阯 So醝"
    elseif Title > x050015_TitleLevel5 then
        TitleName = "秀ng Kh Nguy阯 So醝"
    else
        TitleName = "B靚h T Binh S�"
    end

    return TitleName
end


--**********************************
--Ta ph鋓 鸨i danh x遪g c黙 ta
--**********************************
function x050015_DuiHuan( sceneId, selfId, targetId )
	local score = GetMissionData( sceneId, selfId, MD_ThiefSoldierInvade )	--获取帮贡数量
  if score < 100 then
   x050015_MsgBox( sceneId, selfId, targetId,"  C痭g hi猲 c黙 c醕 h� v鏽 kh鬾g 瘘 v緄 danh x遪g 鹫t 疬㧟. Xin ti猵 t鴆 n� l馽" )
   return
  end  
  
  local OldTitle = GetTitle(sceneId, selfId, 6)
  local CurTitle = x050015_GetCurTitle( sceneId, selfId )
  
  local strText = ""
  if OldTitle == x050015_TitleLevel5 then
      strText = format( "  Ng呓i 疸 c� danh hi畊 cao nh r癷!" )
  elseif( CurTitle > OldTitle  ) then
      AwardTitle( sceneId, selfId,  6, CurTitle )  --把原来to� 鸬 称号替换
      DispatchAllTitle( sceneId, selfId )          --刷新客户端称号
      local TitleName = x050015_GetTitleName( CurTitle )
      strText = format( "  Kh� l, Tri玼 痨nh c鹡g 疬㧟 an 黫 v� c痭g hi猲 c黙 Vu ch� s�, 穑c bi畉 鼀 th醕 ta nh danh x遪g %s. Hy v鱪g c醕 h� c� th� ti猵 t鴆 ra s裞 c痭g hi猲 d﹑ t",  TitleName )      
  else
      strText = format( "  C痭g hi猲 c黙 c醕 h� v鏽 kh鬾g 瘘 v緄 danh x遪g 鹫t 疬㧟. Xin ti猵 t鴆 n� l馽" )
  end
  
  x050015_MsgBox( sceneId, selfId, targetId, strText )	

end
--**********************************
--Ta mu痭 tra 餴琺 t韈h l鹹 c黙 ta
--**********************************
function x050015_ChaXun( sceneId, selfId, targetId )
	score = GetMissionData( sceneId, selfId, MD_ThiefSoldierInvade )
	local strText = format( " 衖琺 t韈h l鹹 c黙 c醕 h� hi畁 l� %d, Xin ti猵 t鴆 n� l馽", score )
	x050015_MsgBox( sceneId, selfId, targetId, strText )
end

--**************************************************
--秏祎 晃襱o� 鸬 自定义帮会称号	--add by xindefeng
--**************************************************
function x050015_ZiDingYi( sceneId, selfId, targetId )
  --检测玩家喧ng否加入帮派
  local guildid	= GetHumanGuildID(sceneId, selfId)  
  if(guildid == -1)then
  	x050015_MsgBox(sceneId, selfId, targetId, "    Trao 鸨i th b読, c醕 h� v鏽 ch遖 gia nh b k� bang ph醝 n鄌.#W")
  	return
  end
	
	--检测玩家喧ng否有"烫金名帖"
  local count = GetItemCount(sceneId, selfId, x050015_g_TangJinMingTieID)
  if(count < 1)then
  	x050015_MsgBox(sceneId, selfId, targetId, "    斜i th b読, c #YN錸g kim danh thi猵#W")
  	return
  end
  count = LuaFnGetAvailableItemCount(sceneId, selfId, x050015_g_TangJinMingTieID)
  if(count < 1)then
  	x050015_MsgBox(sceneId, selfId, targetId, "    斜i th b読, ki琺 tra #YN錸g kim danh thi猵 #Wc� b� kho� hay kh鬾g!")
  	return
  end
  
  --通知Server可以L頽h 称号了
  LuaFnDrawGuildPositionName(sceneId, selfId, targetId)
end

--**************************************************
--供Server直接调用	--add by xindefeng
--**************************************************
function x050015_OnDrawPositonName_Succ( sceneId, selfId )  
  --删除"烫金名帖"
  local ret = LuaFnDelAvailableItem(sceneId, selfId, x050015_g_TangJinMingTieID, x050015_g_DelMingTieCount)
	if ret < 1  then
		x050015_MsgBox(sceneId, selfId, -1, "    斜i th b読, ki琺 tra #YN錸g kim danh thi猵 #Wc� b� kho� hay kh鬾g!")
		return 0
	end
	
	return 1
end
--**********************************
--事件列表选中m祎 项
--**********************************
function x050015_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 1 then
		x050015_DuiHuan( sceneId, selfId, targetId )
	elseif GetNumText() == 2 then
		x050015_ChaXun( sceneId, selfId, targetId )
	elseif GetNumText() == 3 then	--秏祎 话锘嶙远ㄒ宄坪�--add by xindefeng
		x050015_ZiDingYi(sceneId, selfId, targetId)
	elseif GetNumText() == 22 then	--关于L頽h 帮会自定义称号--add by xindefeng
		x050015_MsgBox(sceneId, selfId, targetId, "#{TangJinMingTie_Help}")	
	elseif GetNumText() == 255 then
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
	end	
end

--**********************************
--检测Ti猵 th跫�
--**********************************
function x050015_CheckAccept( sceneId, selfId )

	return
end

--**********************************
--Ti猵 th�
--**********************************
function x050015_OnAccept( sceneId, selfId )


end

--**********************************
--放弃
--**********************************
function x050015_OnAbandon( sceneId, selfId )


end

--**********************************
--创建副本
--**********************************
function x050015_MakeCopyScene( sceneId, selfId, nearmembercount )


end

--**********************************
--继续
--**********************************
function x050015_OnContinue( sceneId, selfId, targetId )

end

--**********************************
--检测喧ng否可以提交
--**********************************
function x050015_CheckSubmit( sceneId, selfId, selectRadioId )


end

--**********************************
--提交
--**********************************
function x050015_OnSubmit( sceneId, selfId, targetId, selectRadioId )

end

--**********************************
--杀死怪物或玩家
--**********************************
function x050015_OnKillObject( sceneId, selfId, objdataId, objId )


end

--**********************************
--进入区域事件
--**********************************
function x050015_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x050015_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--副本事件
--**********************************
function x050015_OnCopySceneReady( sceneId, destsceneId )


end

--**********************************
--有玩家进入副本事件
--**********************************
function x050015_OnPlayerEnter( sceneId, selfId )

end

--**********************************
--有玩家T読 副本中死亡事件
--**********************************
function x050015_OnHumanDie( sceneId, selfId, killerId )
--	x = LuaFnGetCopySceneData_Param( sceneId, x050015_g_keySD["x"] )
--	z = LuaFnGetCopySceneData_Param( sceneId, x050015_g_keySD["z"] )
--	NewWorld( sceneId, selfId, oldsceneId, x, z )
end

--**********************************
--副本场景定时器事件
--**********************************
function x050015_OnCopySceneTimer( sceneId, nowTime )

end

--**********************************
--醒目提示
--**********************************
function x050015_NotifyTip( sceneId, selfId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end

--**********************************
--对话窗口信息提示
--**********************************
function x050015_MsgBox( sceneId, selfId, targetId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
		AddNumText(sceneId,x050015_g_ScriptId,"R秈 b�........",8, 255 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

end
