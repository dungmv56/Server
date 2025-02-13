--------------------------------------------
--五m祎 L頽h Chi陁 b鄆活动脚本
--Created By 信德峰
--------------------------------------------

--脚本号
x808090_g_ScriptId = 808090

--活动参与玩家等c下限
x808090_g_LowerLimitLevel = 30

--发送活动通知邮件时间域
x808090_g_MailStartDayTime = 8121		--发送邮件开始时间 2008-05-01
x808090_g_MailEndDayTime = 8127			--发送邮件结束时间 2008-05-07

--Chi陁 b鄆ID表
x808090_g_ZhaoPaiIDT = {
													{30008021,	"Chi陁 b鄆: Ngh� h皀g 疱ng"},
													{30008022,	"Chi陁 b鄆: 衋o ki猰 tranh phong"},
													{30008023,	"Chi陁 b鄆: Thi猼 gi醦 鸢ng b韈h"},
													{30008024,	"Chi陁 b鄆: Tr鈔 c d� th�"},
													{30008025,	"Chi陁 b鄆: Kim t� chi陁 b鄆"}
												}

--可供L頽h Chi陁 b鄆种类
x808090_g_ZhaoPaiType = 5												

--每次L頽h Chi陁 b鄆to� 鸬 数量
x808090_g_ZhaoPaiCount = 1

--L頽h Chi陁 b鄆时候效果ID(该效果包含音效)
x808090_g_GetZhaoPaiImpactID = 49


--**********************************
--任务入口函数
--**********************************
function x808090_OnDefaultEvent( sceneId, selfId, targetId )
	local ItemID = GetNumText()
	if(ItemID == 10) then	--大家m祎 起来摆摊
		BeginEvent(sceneId)
			AddText(sceneId,"#{LQZP_INTRO}")
			AddNumText( sceneId, x808090_g_ScriptId, "L頽h Chi陁 b鄆", 6, 12 )
			AddNumText( sceneId, x808090_g_ScriptId, "Hu� b�", 6, 13 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)		
	elseif(ItemID == 11) then	--帮助
		BeginEvent(sceneId)
			AddText(sceneId,"#{LQZP_HELP}")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif(ItemID == 12) then
		--发放Chi陁 b鄆
		x808090_GeiZhaoPai(sceneId, selfId, targetId)
	elseif(ItemID == 13) then	--"我再想想"
		--关闭界面
		DispatchUICommand(sceneId, selfId, 1000)
	end	
end

--**********************************
--列举事件
--**********************************
function x808090_OnEnumerate( sceneId, selfId, targetId )
	if x808090_CheckRightTime() == 1 then	--正确to� 鸬 活动时间
		AddNumText(sceneId, x808090_g_ScriptId, "M鱥 ng叨i c鵱g 皙n b鄖 b醤", 6, 10 )
		AddNumText(sceneId, x808090_g_ScriptId, "V� ho誸 鸬ng M鱥 ng叨i c鵱g 皙n b鄖 b醤", 11, 11 )
	end
end

--**********************************
--检测当前喧ng否喧ng活动时间
--**********************************
function x808090_CheckRightTime()
	if GetDayTime() >= x808090_g_MailStartDayTime then
		return 1
	else
		return 0
	end
end

--**********************************
--发放Chi陁 b鄆
--**********************************
function x808090_GeiZhaoPai(sceneId, selfId, targetId)	
	--检测等c喧ng否达到要求
	if GetLevel( sceneId, selfId ) < x808090_g_LowerLimitLevel then
		BeginEvent( sceneId )
			AddText( sceneId, "#{LQZP_LOWERLIMITLEVEL}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )		
		return
	end
	
	--检测当天喧ng否L頽h 过"Chi陁 b鄆":每天只能领1次.	
	local LastDayValue = GetMissionData(sceneId, selfId, MD_LINGQUZHAOPAI_LASTDATE)--上次L頽h to� 鸬 日期值(以天为单位)
	local CurDayValue = GetDayTime()--当前时间值(以天为单位)
	if(CurDayValue <= LastDayValue) then	--领过m祎 次了
		BeginEvent( sceneId )
			AddText( sceneId, "#{LQZP_ONCEPERDAY}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end	
	
	--检测背包喧ng否有地方
	if (LuaFnGetPropertyBagSpace( sceneId, selfId ) < x808090_g_ZhaoPaiCount) then
		BeginEvent( sceneId )
			AddText( sceneId, "#{LQZP_BAGFULL}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )--窗口显示"空间不足"

		BeginEvent( sceneId )
			AddText( sceneId, "#{LQZP_BAGFULLTIP}" )
		EndEvent( sceneId )
		DispatchMissionTips( sceneId, selfId )	--醒目提示"空间不足"
		return
	end	
	
	--条件通过	
	--记录L頽h to� 鸬 时间,保证m祎 天m祎 次
	SetMissionData(sceneId, selfId, MD_LINGQUZHAOPAI_LASTDATE, CurDayValue)
	
	--随机发放m祎 c醝"Chi陁 b鄆"
	local randValue = random(x808090_g_ZhaoPaiType)							--随即值
	local randZhaoPaiID = x808090_g_ZhaoPaiIDT[randValue][1]		--随即获取to� 鸬 Chi陁 b鄆ID
	local randZhaoPaiName = x808090_g_ZhaoPaiIDT[randValue][2]	--随机获取to� 鸬 Chi陁 b鄆名称
	
	BeginAddItem(sceneId)
		AddItem(sceneId, randZhaoPaiID, x808090_g_ZhaoPaiCount)
	EndAddItem(sceneId, selfId)
	AddItemListToHuman(sceneId, selfId)--加物品给玩家
	
	--加m祎 c醝包含声音to� 鸬 特效
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x808090_g_GetZhaoPaiImpactID, 0 )
	
	--完事了,新界面:您就收下吧:)
	local str = format("    C醝 n鄖 #G%s#W ng呓i nh l 餴! Khi b鄖 b醤 s� d鴑g, s� c� hi畊 qu� kh鬾g t叻ng 疬㧟!", randZhaoPaiName)
	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )	
	
	--醒目提示
	str = format("你 鹫t 疬㧟m祎 c醝%s.", randZhaoPaiName)	
	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
	
	--公告玩家自己
	BroadMsgByChatPipe( sceneId, selfId, str, MSG2PLAYER_PARA )
	
	--统计"Chi陁 b鄆"L頽h 人次
	AuditGeiZhaoPai(sceneId, selfId, tostring(randZhaoPaiName))
end

--**********************************
--给新玩家发邮件
--**********************************
function x808090_OnPlayerLogin( sceneId, selfId )
	local curDayTime = GetDayTime()	
	if curDayTime >= x808090_g_MailStartDayTime and curDayTime <= x808090_g_MailEndDayTime then	--T読 发邮件时间
	
		local HaveMail = GetMissionData(sceneId, selfId, MD_LINGQUZHAOPAI_HAVESENDMAIL)	--获取记录值
		if(HaveMail == 0)then		--保证玩家T読 五m祎 期间登陆,只会收到m祎 封邮件
			LuaFnSendSystemMail( sceneId, GetName(sceneId,selfId), "#{LQZP_HUODONGMAIL}" )
			SetMissionData(sceneId, selfId, MD_LINGQUZHAOPAI_HAVESENDMAIL, 1)	--记录收到过邮件了
		end
	end	
end
