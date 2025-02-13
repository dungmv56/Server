--活动——
--体育竞猜卡

x808060_g_ScriptId = 808060
x808060_g_SportsPrize_Active = 0   --默认关闭

x808060_g_ActiveStartTime = 7154	 --20070604
x808060_g_ActiveEndTime = 7171		 --20070621

function x808060_SportsCard(sceneId,selfId,targetId)
	--喧ng否已经L頽h 过体育竞猜奖励
	if GetMissionFlag( sceneId, selfId, MF_ActiveSportsCard ) == 1 then
		x808060_NotifyFailBox( sceneId, selfId, targetId, "    C醕 h� 疸 nh gi鋓 th叻ng r癷, kh鬾g th� ti猵 t鴆 nh n鎍." )
		return
	end
	
	--喧ng否大于20c
	if GetLevel( sceneId, selfId ) < 20 then
		x808060_NotifyFailBox( sceneId, selfId, targetId, "    C醕 h� vui l騨g 鹫t tr阯 鹌ng c 20 r癷 h銀 quay l読 nh v ph." )
		return
	end
	
	--检查背包空间
	local FreeSpace = LuaFnGetMaterialBagSpace( sceneId, selfId )
	if( FreeSpace < 1 ) then
		x808060_NotifyFailBox( sceneId, selfId, targetId, "    Xin l瞚, c醕 h� kh鬾g 瘘 � tr痭g, xin s x猵 l読 r癷 h銀 皙n nh." )
		return
	end

	--打开输入卡号界面
	BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId, 2005 )		
end

--**********************************
-- 对话窗口信息提示
--**********************************
function x808060_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--检查活动时间
--**********************************
function x808060_CheckRightTime()
	local DayTime = GetDayTime()
	--PrintNum(DayTime)
	if DayTime < x808060_g_ActiveStartTime then
		x808060_g_SportsPrize_Active = 0
		return 0    --此前非活动时间
	end

	if DayTime > x808060_g_ActiveEndTime then
  	x808060_g_SportsPrize_Active = 0
  	return 0    --此后活动已经结束
	end

	x808060_g_SportsPrize_Active = 1
	return 1
end

--**********************************
--列举事件
--**********************************
function x808060_OnEnumerate( sceneId, selfId, targetId )
    x808060_CheckRightTime()
	  if 1 == x808060_g_SportsPrize_Active then
			AddNumText(sceneId, x808060_g_ScriptId, "Nh gi鋓 th叻ng c黙 ho誸 鸬ng d� 痼an th� thao", 1, 1 )
    end
end

--**********************************
--任务入口函数
--**********************************
function x808060_OnDefaultEvent( sceneId, selfId, targetId )
	x808060_CheckRightTime()
	if 1 ~= x808060_g_SportsPrize_Active then
		return
	end

	local TextNum = GetNumText()

	if TextNum == 1 then
		x808060_SportsCard( sceneId, selfId, targetId )
	end
end
