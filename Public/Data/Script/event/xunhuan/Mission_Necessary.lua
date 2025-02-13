--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
--该脚本文件只供Nhi甿 v� s� m鬾而做, 其他任务如要引用, 后果自负!
--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
x500501_g_StartDayTime = 8030   --活动结束时间 2008-1-31
x500501_g_EndDayTime = 8044   --活动结束时间 2008-2-14

x500501_g_strDieNotice0 = "#{SMRW_20080118_01}"
x500501_g_strDieNotice1 = "#{SMRW_20080118_02}"

x500501_g_ItemId = {30501101, 30501102}

x500501_g_LingShouDanId = {30503034, 30503043, 30503052, 30503061} --Linh ThD

x500501_g_strHelpFinishedText = "  同门有难,理当相助,C黙 ng呓i 任务我已经安排其他同门去完成了.#r#GHo鄋 t nhi甿 v�!#W"

function x500501_ACT_Duanwu( sceneId, selfId, iDayHuan ) --端午活动
	
	local DayTime = GetDayTime()
	local Duanwu_Cyc = 20
	local Duanwu_Zongzi = 30501100            --粽子
	local Duanwu_GemDataGlobalIndex = 40
	local Duanwu_MaxGemCount = 2000
	
	local Duanwu_GemData  = LuaFnGetWorldGlobalData( Duanwu_GemDataGlobalIndex )
	local Duanwu_Daytime  = floor( Duanwu_GemData / 10000 )
	local Duanwu_GemCount = mod( Duanwu_GemData, 10000 )
	
	local DuanwuGemList = { 50101001, 50101002, 50102001, 50102002, 50102003, 50102004, 
	                        50103001, 50104002, 50111001, 50111002, 50112001, 50112002, 
	                        50112003, 50112004, 50113001, 50113002, 50113003, 50113004, 
	                        50113005, 50114001 }
	                        
	if iDayHuan <= 0 then
		return
	end
	if DayTime < 7168 or DayTime > 7175 then
		return --不T読 活动时间内
	end
	
	local ModHuan = mod( iDayHuan, Duanwu_Cyc )
	if 0 ~= ModHuan then
		return  --不喧ng给奖励to� 鸬 环数
	end
		
	BeginAddItem(sceneId)
		AddItem( sceneId, Duanwu_Zongzi, 1 )    --给予玩家粽子
	local AddRet = EndAddItem(sceneId,selfId)
	if AddRet > 0 then
		AddItemListToHuman(sceneId,selfId)  --给予粽子完毕
		
		local Gemable = random(100)  -- 1/5 鹫t 疬㧟宝石
		if Gemable > 20 then
			return
		end
		
		if DayTime ~= Duanwu_Daytime then
			Duanwu_Daytime = DayTime
			Duanwu_GemCount = 0   --宝石计数清零
		end
		
		if Duanwu_GemCount >= Duanwu_MaxGemCount then
			return     --宝石数量超过了每天送出to� 鸬 最大数量
		end

		local GemListSize = getn(DuanwuGemList)
		local RandomGem = DuanwuGemList[ random( GemListSize ) ]
		BeginAddItem(sceneId)
			AddItem( sceneId, RandomGem, 1 )    --给予玩家宝石
		local GemRet = EndAddItem(sceneId,selfId)
		if GemRet > 0 then
			AddItemListToHuman(sceneId,selfId)
			local GemInfo = GetItemTransfer(sceneId,selfId,0)
			local strformat	= "#{_INFOUSR%s}#Trong ho誸 鸬ng Ti猼 衞an Ng�, do h騛n th鄋h 20 nhi甿 v� s� m鬾, kh鬾g nh鎛g nh 疬㧟 1 c醝 b醤h �, m� c騨 nh 疬㧟 th阭 1#Y#{_INFOMSG%s}."
			local strText = format(strformat, GetName(sceneId,selfId),GemInfo)
			--公告Tinh简,去除此公告
			--BroadMsgByChatPipe(sceneId, selfId, strText, 4)
			
			--存入全局数据
			Duanwu_GemData = DayTime * 10000 + Duanwu_GemCount + 1
			LuaFnSetWorldGlobalData( Duanwu_GemDataGlobalIndex, Duanwu_GemData )

		end
		
	end	

	
end


--**********************************
--提交
--**********************************
function x500501_OnSubmit_Necessary( sceneId, selfId, targetId, isHelpFinish )
	local Level =GetLevel(sceneId, selfId)
	--begin modified by zhangguoxin 090208
	local iDayCount=GetMissionData(sceneId,selfId,MD_SHIMEN_DAYCOUNT)
	--local iTime = mod(iDayCount,100000)
	local iTime = GetMissionData(sceneId,selfId,MD_SHIMEN_DAYTIME)
	local iDayTime = floor(iTime/100)	--上m祎 次放弃任务to� 鸬 时间(天数)
	local iQuarterTime = mod(iTime,100)	--上m祎 次放弃任务to� 鸬 时间(刻)
	--local iDayHuan = floor(iDayCount/100000) --当天内完成to� 鸬 S� l nhi甿 v� 
	local iDayHuan = iDayCount --当天内完成to� 鸬 S� l nhi甿 v� 

	--local CurTime = GetHourTime()		--当前时间
	local CurTime = GetQuarterTime()		--当前时间
	local CurDaytime = floor(CurTime/100)	--当前时间(天)
	local CurQuarterTime = mod(CurTime,100)	--当前时间(刻)

	if CurDaytime==iDayTime then 	--上次Ho鄋 t nhi甿 v鷑g同m祎 天内
		iDayHuan = iDayHuan+1
	else							--上次Ho鄋 t nhi甿 v籘読 同m祎 天,重置
		iDayTime = CurDaytime
		iQuarterTime = 99
		iDayHuan = 1
	end
	--end modified by zhangguoxin 090208
	
	-- ========================================================
	-- 冰天雪地活动
	
	--  鹫t 疬㧟50挂鞭炮
	if iDayHuan==20 or iDayHuan==40 or iDayHuan==60  then
		local curDayTime = GetDayTime()
		if curDayTime >= x500501_g_StartDayTime and curDayTime <= x500501_g_EndDayTime then
			BeginAddItem(sceneId)
				AddItem( sceneId, 30505166 , 20 )
			local canAdd1 = EndAddItem(sceneId,selfId)
			
			if canAdd1 == 0  then
				BeginEvent( sceneId )
					AddText( sceneId, "C祎 v ph c黙 c醕 h� kh鬾g c騨 ch� tr痭g, l sau l鷆 giao nhi甿 v� xin h銀 瓞 c祎 ph v 瘘 ch� tr痭g." )
				EndEvent( sceneId )
				DispatchMissionTips( sceneId, selfId )
			else
				AddItemListToHuman(sceneId,selfId)
				local transfer = GetItemTransfer(sceneId,selfId,0)
				
				local str1 = format( "#{_INFOUSR%s}", GetName(sceneId, selfId))
				local str2 = format("#W#{_INFOMSG%s}", transfer)
				local strMsg = str1..x500501_g_strDieNotice0..str2..x500501_g_strDieNotice1				
				BroadMsgByChatPipe(sceneId, selfId, strMsg, 4)		
			end
		end	

--改成不可能Th鯽 m鉵to� 鸬 条件来Hu� b鯨inh Tho� 鸬 奖励,by zhangqiang 2009.6.18
--		if GetLevel(sceneId, selfId) >= 50 and iDayHuan == 20 then --50c以上才 鹫t 疬㧟,只有第m祎 c醝20环才给,而不喧ng每20环都给
		if 0 > 1 then
			local randomIndex = random(getn(x500501_g_LingShouDanId))
			BeginAddItem(sceneId)
				AddItem( sceneId, x500501_g_LingShouDanId[randomIndex], 1 )
			local canAdd = EndAddItem(sceneId,selfId)
			if canAdd == 0  then
				BeginEvent( sceneId )
					AddText( sceneId, "#{JNHC_081128_01}"..GetItemName(sceneId, x500501_g_LingShouDanId[randomIndex]).."#{HSLJJF_2}" )
				EndEvent( sceneId )
				DispatchMissionTips( sceneId, selfId )
			
			else
				AddItemListToHuman(sceneId,selfId)
				
				--给自己发送 餴琺到物品to� 鸬 消息....
				local strMsg = format("C醕 h� 疸 鹫t 疬㧟 #H#{_ITEM%d}#W.", x500501_g_LingShouDanId[randomIndex])
				Msg2Player(sceneId, selfId, strMsg, MSG2PLAYER_PARA)
			--[tx42684]	
			  local myStrMsg = format("#{BSJH_81106_10}#H#{_ITEM%d}#W.", x500501_g_LingShouDanId[randomIndex])
			  BeginEvent(sceneId)
				  AddText(sceneId, myStrMsg);
			  EndEvent(sceneId)
			  DispatchMissionTips(sceneId,selfId)
			--[/tx42684]			
					
				--5%几率 鹫t 疬㧟2c醝
				if random(100) <= 5  then
					BeginAddItem(sceneId)
						AddItem( sceneId, x500501_g_LingShouDanId[randomIndex], 1 )
					canAdd = EndAddItem(sceneId,selfId)
					
					if canAdd == 0  then
						BeginEvent( sceneId )
							AddText( sceneId, "#{JNHC_081128_02}"..GetItemName(sceneId, x500501_g_LingShouDanId[randomIndex]).."#{HSLJJF_2}" )
						EndEvent( sceneId )
						DispatchMissionTips( sceneId, selfId )
					
					else
						AddItemListToHuman(sceneId,selfId)
						local transfer = GetItemTransfer(sceneId,selfId,0)
						local str = format("#{_INFOUSR%s}#{JNHC_081128_03}#{_INFOMSG%s}#{JNHC_081128_04}",GetName(sceneId,selfId), transfer)
						BroadMsgByChatPipe(sceneId, selfId, str, 4)
	
						--给自己发送 餴琺到物品to� 鸬 消息....
						strMsg = format("C醕 h� 疸 鹫t 疬㧟 #H#{_ITEM%d}#W.", x500501_g_LingShouDanId[randomIndex])
						Msg2Player(sceneId, selfId, strMsg, MSG2PLAYER_PARA)
						
					end
				end
			end
		end
		
	end
	
	--给易容丹
	if iDayHuan==10 or iDayHuan==30 or iDayHuan==50 then
		if random(100) <= 30  then
			local randomIndex = random(2)
			BeginAddItem(sceneId)
				AddItem( sceneId, x500501_g_ItemId[randomIndex], 1 )
			local canAdd = EndAddItem(sceneId,selfId)
			
			if canAdd == 0  then
				BeginEvent( sceneId )
					AddText( sceneId, "C祎 v ph c黙 c醕 h� kh鬾g c騨 ch� tr痭g, l sau l鷆 giao nhi甿 v� xin h銀 瓞 c祎 ph v 瘘 ch� tr痭g." )
				EndEvent( sceneId )
				DispatchMissionTips( sceneId, selfId )
			
			else
				AddItemListToHuman(sceneId,selfId)
--				if randomIndex == 1  then
--					-- 发世界公告
--					local transfer = GetItemTransfer(sceneId,selfId,0)
--					local str = format("#W#{_INFOUSR%s}#cffffcc h鬽 nay v� l鷆 c� gg ho鄋 th鄋h 20 l nhi甿 v� s� m鬾, do qu� m畉 m鰅 ng癷 d呔i g痗 c鈟 ngh� ng絠, th� tr阯 c鈟 r絠 xu痭g 1 vi阯 #W#{_INFOMSG%s}.",GetName(sceneId,selfId), transfer)
--					--公告Tinh简,去除此公告
--					--BroadMsgByChatPipe(sceneId, selfId, str, 4)
--					
--				elseif randomIndex == 2  then
--					-- 发世界公告
--					local transfer = GetItemTransfer(sceneId,selfId,0)
--					local str = format("#W#{_INFOUSR%s}#cffffcc h鬽 nay v� l鷆 c� gg ho鄋 th鄋h 20 l nhi甿 v� s� m鬾, do qu� m畉 m鰅 疸 ng癷 ngh� d呔i 黏t, t� trong t鷌 r絠 ra 1 vi阯 #W#{_INFOMSG%s} l l醤h.",GetName(sceneId,selfId), transfer)
--					----公告Tinh简,去除此公告
--					--BroadMsgByChatPipe(sceneId, selfId, str, 4)
--					
--				end
				
				--给自己发送 餴琺到物品to� 鸬 消息....
				local strMsg = format("C醕 h� 疸 鹫t 疬㧟 #c00FFFF#{_ITEM%d}#W.", x500501_g_ItemId[randomIndex])
				Msg2Player(sceneId, selfId, strMsg, MSG2PLAYER_PARA)

			end
		end
	end
	-- ========================================================

  -- ========================================================
	-- 圣诞活动 完成Nhi甿 v� s� m鬾 鹫t 疬㧟符节
	x500501_ACT_Christmas( sceneId, selfId,iDayHuan )	
	
	-- ========================================================

	--PrintNum(iDayHuan)
	--iDayHuan = 60

--if mod(iDayHuan, 10) >= 1 and mod(iDayHuan, 10) < 5 then
--elseif mod(iDayHuan, 10) >= 5 and mod(iDayHuan, 10) < 8 then
--	SetHumanMenpaiPoint(sceneId, selfId, GetHumanMenpaiPoint(sceneId, selfId)+1	)
--	Msg2Player(  sceneId, selfId,"你 餴琺到了#Y1#W 餴琺门派贡献度." ,MSG2PLAYER_PARA )
--elseif mod(iDayHuan, 10) >= 8 and mod(iDayHuan, 10) < 10 then
--	SetHumanMenpaiPoint(sceneId, selfId, GetHumanMenpaiPoint(sceneId, selfId)+2	)
--	Msg2Player(  sceneId, selfId,"你 餴琺到了#Y2#W 餴琺门派贡献度." ,MSG2PLAYER_PARA )
--else --mod(iDayHuan, 10) must return 0
--	SetHumanMenpaiPoint(sceneId, selfId, GetHumanMenpaiPoint(sceneId, selfId)+3	)
--	Msg2Player(  sceneId, selfId,"你 餴琺到了#Y3#W 餴琺门派贡献度." ,MSG2PLAYER_PARA )
--end

	--实际奖励贡献度=(玩家等c-基础等c)* 等c影响参数 + 基础贡献度
	--menpaipoint = (playerlvl - 10)*0.05 + X
	local baseMenpaiPoint = 0
	if iDayHuan < 10 then
		baseMenpaiPoint = 1
	elseif iDayHuan < 15 then
		baseMenpaiPoint = 2
	elseif iDayHuan < 19 then
		baseMenpaiPoint = 3
	elseif iDayHuan == 19 then
		baseMenpaiPoint = 4
	elseif iDayHuan == 20 then
		baseMenpaiPoint = 5
	end
	local menpaiPoint = floor((GetLevel(sceneId, selfId) - 10)*0.05) + baseMenpaiPoint
	SetHumanMenpaiPoint(sceneId, selfId, GetHumanMenpaiPoint(sceneId, selfId) + menpaiPoint)
	Msg2Player(  sceneId, selfId,"C醕 h� 鹫t 疬㧟 #Y" .. menpaiPoint .. "#W餴琺 鸬 c痭g hi猲 m鬾 ph醝" ,MSG2PLAYER_PARA )

	--iDayCount = iDayHuan*100000+iDayTime*100+iQuarterTime --注释 by zhangguoxin 090208
	local Reward_Append = 1

	local playerLevel = GetLevel(sceneId, selfId)
	if playerLevel < 20 then
		if iDayHuan <= 10 then
			Reward_Append = 2
		end
	elseif playerLevel >= 20 and playerLevel < 30 then
		if iDayHuan <= 15 then
			Reward_Append = 2
		end
	elseif playerLevel >= 30 and playerLevel < 100 then
	  if iDayHuan <= 20 then
			Reward_Append = 2
		end
	elseif playerLevel >= 100 and playerLevel < 120 then
		if iDayHuan <= 20 then
			Reward_Append = 2
		end
	end

	--//////////////////////////////////////////////////
	--有10%to� 鸬 几率 鹫t 疬㧟m祎 c醝低c宝石合成符
	--AAA今日为师门做任务勇往直前,奋不顾身,T読 完成第20次
	--多倍时,终因太累m祎 跤摔倒T読 路边,爬起来to� 鸬 时候,脸上
	--居然粘着m祎 张皱巴巴to� 鸬 [低c宝石合成符].
	--ID: 30900015
	--?	玩家等c必须 >=40c
	--?	当天第20次师门奖励为多倍奖励
	if playerLevel >= 40 and iDayHuan == 20 then
		local ret = random(100)
		--PrintNum(ret)
		if ret <= 10 then
			local szItemTransfer = ""
			BeginAddItem(sceneId)
				AddItem( sceneId, 30900015, 1 )
			local canAdd = EndAddItem(sceneId,selfId)
			if canAdd > 0 then
				AddItemListToHuman(sceneId,selfId)
				szItemTransfer = GetItemTransfer(sceneId,selfId,0)
				local strformat	= "#W#{_INFOUSR%s}#cffffcc h鬽 nay v� l鷆 c� gg ho鄋 th鄋h 20 l nhi甿 v� s� m鬾, cu痠 c鵱g do qu� m畉 m鰅 疸 ng� b阯 疬秐g, l鷆 鹧ng d, th� tr阯 m b� d醤 1 t #W#{_INFOMSG%s} nh錸 nheo."
				local strText = format(strformat, GetName(sceneId,selfId),szItemTransfer)
				
				BroadMsgByChatPipe(sceneId, selfId, strText, 4)
			end
		end
	end
	--//////////////////////////////////////////////////

	local MijiActive = 1
	local AwardID = 30505078    --天书残卷to� 鸬 ID
	local AwardCyc = 20         --奖励环数( 做多少次任务会给m祎 次奖励 )

	local DayTime = GetDayTime()
	if DayTime < 7104 then      --07年107天(4月15号)
       MijiActive = 0
    end

    if DayTime >= 7115 then      --07年115天(4月26号)
       MijiActive = 0
    end


	if playerLevel > 19 then
		if iDayHuan > 0 then
			local ModHuan = mod( iDayHuan, AwardCyc )
			if 0 == ModHuan then
				if 1 == MijiActive then
					BeginAddItem(sceneId)        --给予玩家东西
						AddItem( sceneId, AwardID, 1 )
					local AddRet = EndAddItem(sceneId,selfId)
					if AddRet > 0 then
						AddItemListToHuman(sceneId,selfId)
					end
				end
			end

		end
	end

	local skyrockets = { 30505081, 30505082, 30505083, 30505084 }
	local count = 2
	local cycle = 20

	if DayTime >= 7128 and DayTime <= 7150 then		-- 07.5.9 ~ 07.5.31
		if ( iDayHuan / cycle ) == floor( iDayHuan / cycle ) then
			local skyrocket = skyrockets[random( getn(skyrockets) )]
			BeginAddItem( sceneId )					--给予玩家东西
				AddItem( sceneId, skyrocket, 2 )
			local AddRet = EndAddItem( sceneId, selfId )
			if AddRet > 0 then
				AddItemListToHuman( sceneId, selfId )
			else
				local strText = "V� t鷌 瘃ng 鸢 c黙 c醕 h� kh鬾g 瘘, c醕 h� m m祎 l nh 疬㧟 #{_ITEM" .. skyrocket .. "} c� h礽"

				BeginEvent( sceneId )
					AddText( sceneId, strText )
				EndEvent( sceneId )
				DispatchMissionTips( sceneId, selfId )

				Msg2Player( sceneId, selfId, strText, MSG2PLAYER_PARA )
			end

		end
	end

	x500501_ACT_Duanwu( sceneId, selfId, iDayHuan )
	
	--设置循环任务to� 鸬 环数
	--begin modified by zhangguoxin 090208
	iDayCount = iDayHuan
	local newTime = iDayTime*100+iQuarterTime
	
	SetMissionData(sceneId,selfId,MD_SHIMEN_DAYTIME,newTime)
	SetMissionData(sceneId,selfId,MD_SHIMEN_DAYCOUNT,iDayCount)
	--end modified by zhangguoxin 090208
	x500501_g_MissionRound = GetMissionData(sceneId,selfId,MD_SHIMEN_HUAN)

	--衰减系数
	--l_Exp = 0.75 * 0.75
	--l_Money = 0.75 * ( 49 + Level ) / ( 160 + 40 * Level )
	--计算奖励Kinh nghi甿to� 鸬 数量
	--if mod(x500501_g_MissionRound,10) == 0 then
	--	x500501_g_Exp = 2400*(Level+4) * 10 * l_Exp / 120						--等c+环数函数,受Kinh nghi甿调节常数to� 鸬 影响
		--x500501_g_Money = 2400*(Level+4) * 10 * l_Money /120						--等c+环数函数,受Kinh nghi甿调节常数to� 鸬 影响
	--else
	--	x500501_g_Exp = 2400*(Level+4) * mod(x500501_g_MissionRound,10) * l_Exp / 120						--等c+环数函数,受Kinh nghi甿调节常数to� 鸬 影响
		--x500501_g_Money = 2400*(Level+4) * mod(x500501_g_MissionRound,10) * l_Money /120						--等c+环数函数,受Kinh nghi甿调节常数to� 鸬 影响
	--end

	-- 1+等c影响*当前等c/10 {等c影响=0.035,影响指数=1}
	local levelfactor = 0.035
	local refix = 1 + levelfactor*playerLevel/10

	local strHuashan = ""
	local strHuashan2 = ""
	if Reward_Append == 2 then
		if GetHuashanV(sceneId,selfId) == GetMenPai(sceneId,selfId) then
			local addMoney = floor(GetMoneyMultipleByRound(x500501_g_MissionRound) * floor(GetMoneyBonusByLevel(Level)/2))
			--local addExp = floor(GetExpMultipleByRound(x500501_g_MissionRound) * floor(GetExpBonusByLevel(Level)/2)*refix)
			local addExp = floor(GetExpMultipleByRound(x500501_g_MissionRound) * floor(GetExpBonusByLevel(Level))*refix)
			x500501_g_Money = addMoney * 3
			x500501_g_Exp = addExp * 3
			strHuashan = "#cff99ccV� b眓 m鬾 ph醝 鹫t 疬㧟 Lu Ki猰 Hoa S絥 h課g nh c黙 k� n鄖, n阯 c� th� nh 疬㧟 th阭 #Yph th叻ng kinh nghi甿#W c黙 s� m鬾." .. addExp .. "#cff99cc, ti玭#{_MONEY" .. addMoney .. "}#cff99cc."
			strHuashan2 = "#cff99cc nh 疬㧟 th阭 #Yph th叻ng kinh nghi甿#W c黙 s� m鬾 (Lu Ki猰 Hoa S絥 h課g nh) " .. addExp .. ", ti玭#Y#{_MONEY" .. addMoney .. "}#cff99cc."
		else
			x500501_g_Money = floor( (GetMoneyMultipleByRound(x500501_g_MissionRound) * GetMoneyBonusByLevel(Level)) )
			--local x500501_g_Exp = floor( (GetExpMultipleByRound(x500501_g_MissionRound) * GetExpBonusByLevel(Level))*refix)
			x500501_g_Exp = floor( (GetExpMultipleByRound(x500501_g_MissionRound) * GetExpBonusByLevel(Level)*2)*refix)
		end
	else
		x500501_g_Money = GetMoneyMultipleByRound(x500501_g_MissionRound) * floor(GetMoneyBonusByLevel(Level)/2)
		x500501_g_Exp = GetExpMultipleByRound(x500501_g_MissionRound) * floor(GetExpBonusByLevel(Level)/2)
	end

	--if	floor((x500501_g_MissionRound - 1) / 10) >=1  then
	--	x500501_g_Exp = 2400*(Level+4) * l_Exp / 120 + x500501_g_Exp						--11~20环任务,每环额外增加m祎 定Kinh nghi甿增量,金钱没有增量
	--end


	--x500501_g_Exp = x500501_g_Exp * Reward_Append

	x500501_g_Exp = floor(x500501_g_Exp)
	x500501_g_Money = floor(x500501_g_Money)

	--增加Kinh nghi甿值和钱
	--添加任务奖励
	AddExp( sceneId,selfId,x500501_g_Exp)
	AddMoney(sceneId,selfId,x500501_g_Money)
	--显示对话框
	BeginEvent(sceneId)
		--如果喧ng同门相助完成to� 鸬 ....则加入相关对话....
		if isHelpFinish and isHelpFinish == 1 then
			AddText(sceneId, x500501_g_strHelpFinishedText)
		end
		AddText(sceneId,"  L鄊 r kh�, � 疴y c� "..x500501_g_Exp.." 餴琺 tr� gi� kinh nghi甿 v� #{_MONEY"..x500501_g_Money.."}, coi nh� tg th叻ng cho ng呓i")
		AddText(sceneId, strHuashan)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

	Msg2Player(  sceneId, selfId, strHuashan2,MSG2PLAYER_PARA )
	--Msg2Player(  sceneId, selfId,"你 餴琺到了#{_MONEY" .. tostring(x500501_g_Money) .. "}" ,MSG2PLAYER_PARA )
	--Msg2Player(  sceneId, selfId,"你 餴琺到了" .. tostring(x500501_g_Exp) .. " 餴琺Kinh nghi甿值" ,MSG2PLAYER_PARA )

	--T読 m祎 定条件下可以 餴琺到额外to� 鸬 奖励
	if Reward_Append == 2 and mod(iDayHuan, 5) == 0 and random(1000) <= 5 then

		local ItemSn, ItemName, _, bBroadCast = GetOneMissionBonusItem(27)
		local szItemTransfer = ""
		BeginAddItem(sceneId)
			AddItem( sceneId, ItemSn, 1 )
		local canAdd = EndAddItem(sceneId,selfId)

		if canAdd > 0 then
			AddItemListToHuman(sceneId,selfId)
			szItemTransfer = GetItemTransfer(sceneId,selfId,0)
			local strText = format("Ng呓i 疸 鹫t 疬㧟 %s", ItemName)
			BeginEvent(sceneId)
				AddText(sceneId, strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)

			local strformatList	= {
						"#W#{_INFOUSR%s}#cffffcc trong l鷆 l鄊 nhi甿 v� s� m鬾, v� qu� v v�, s� ph� 疸 th叻ng 1 #W#{_INFOMSG%s}. ",
						"#W#{_INFOUSR%s}#cffffcc v譨 ho鄋 th鄋h nhi甿 v� s� m鬾 b呔c ra c豠 th� b� v ph鋓 th玬 c豠, ph醫 hi畁 1 #W#{_INFOMSG%s}. ",
						"#cffffccV� #W#{_INFOUSR%s}#cffffcc trong l鷆 giao nhi甿 v� s� m鬾, s� ph� th� 餫ng n眎 gi n阯 b� s� ph� s莕 tay l 1 #W#{_INFOMSG%s}#cffffcc n閙 tr鷑g 馥u.",
						"#W#{_INFOUSR%s}#cffffcc trong l鷆 giao nhi甿 v� s� m鬾, b瞡g tr阯 tr秈 r絠 xu痭g 1 #W#{_INFOMSG%s}#cffffcc tr鷑g v鄌 馥u.",
						}
			local index = random(4)
			local PlayName = GetName(sceneId,selfId)
			strText = format(strformatList[index], PlayName, szItemTransfer)
			
			--公告Tinh简,去除
			--BroadMsgByChatPipe(sceneId, selfId, strText, bBroadCast)
			
		end

	end

	BeginEvent(sceneId)
		AddText(sceneId, "#GH鬽 nay#W ng呓i 疸 ho鄋 th鄋h xong " .. iDayHuan .. "#G v騨g nhi甿 v� s� m鬾#W");
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)

	--Nhi甿 v� s� m鬾统计
	LuaFnAuditShiMenRenWu(sceneId, selfId, x500501_g_MissionRound, GetLevel(sceneId, selfId))
	LuaFnAuditShiMenRenWu_Day(sceneId, selfId, iDayHuan, GetLevel(sceneId, selfId))           --当天Nhi甿 v� s� m鬾统计
	return Reward_Append, x500501_g_MissionRound

end

--**********************************
--Ti猵 th�
--**********************************
function x500501_CheckAccept_Necessary( sceneId, selfId )

	--begin modified by zhangguoxin 090208
	local iDayCount=GetMissionData(sceneId,selfId,MD_SHIMEN_DAYCOUNT)
	--local iTime = mod(iDayCount,100000)
	local iTime = GetMissionData(sceneId,selfId,MD_SHIMEN_DAYTIME)
	local iDayTime = floor(iTime/100)	--上m祎 次放弃任务to� 鸬 时间(天数)
	local iQuarterTime = mod(iTime,100)	--上m祎 次放弃任务to� 鸬 时间(m祎 刻种)
	--local iDayHuan = floor(iDayCount/100000) --当天内完成to� 鸬 S� l nhi甿 v� 
	local iDayHuan = iDayCount --当天内完成to� 鸬 S� l nhi甿 v� 

	--local CurTime = GetHourTime()		--当前时间
	local CurTime = GetQuarterTime()		--当前时间
	local CurDaytime = floor(CurTime/100)	--当前时间(天)
	local CurQuarterTime = mod(CurTime,100) 	--当前时间(m祎 刻钟)
	--print(iDayCount,iTime,iDayTime,iQuarterTime,iDayHuan)
	--print(CurQuarterTime,iQuarterTime)
	--print(iDayCount,CurTime)
	if iDayTime == CurDaytime then
		--如果当天做该S� l nhi甿 v� 达到60则不允许再接
		if iDayHuan >= 60 then
			return -2;
		end
		if CurQuarterTime == iQuarterTime then
			return -1;
		end
	else
		iDayHuan = 1
		--iDayCount = iDayHuan*100000+iDayTime*100+iQuarterTime
		iDayCount = iDayHuan;
		local newTime = iDayTime*100+iQuarterTime
		SetMissionData(sceneId, selfId, MD_SHIMEN_DAYTIME, newTime)
		SetMissionData(sceneId, selfId, MD_SHIMEN_DAYCOUNT, iDayCount)
	end
	--end modified by zhangguoxin 090208
	local playerLevel = GetLevel(sceneId, selfId)
	if playerLevel < 20 then
		if iDayHuan < 10 then
			SetMissionData(sceneId, selfId, MD_SHIMEN_DOUBLE_EXP, 1)
		else
			SetMissionData(sceneId, selfId, MD_SHIMEN_DOUBLE_EXP, 0)
		end
	elseif playerLevel >= 20 and playerLevel < 30 then
		if iDayHuan < 15 then
			SetMissionData(sceneId, selfId, MD_SHIMEN_DOUBLE_EXP, 1)
		else
			SetMissionData(sceneId, selfId, MD_SHIMEN_DOUBLE_EXP, 0)
		end
	elseif playerLevel >= 30 and playerLevel < 100 then
    if iDayHuan < 20 then
		  SetMissionData(sceneId, selfId, MD_SHIMEN_DOUBLE_EXP, 1)
	  else
		  SetMissionData(sceneId, selfId, MD_SHIMEN_DOUBLE_EXP, 0)
	  end
	elseif playerLevel >= 100 and playerLevel < 120 then
	  if iDayHuan < 20 then
		  SetMissionData(sceneId, selfId, MD_SHIMEN_DOUBLE_EXP, 1)
	  else
		  SetMissionData(sceneId, selfId, MD_SHIMEN_DOUBLE_EXP, 0)
	  end
	end

	return 1;

end

--**********************************
--放弃
--**********************************
function x500501_Abandon_Necessary( sceneId, selfId )

	--begin modified by zhangguoxin 090208
	--local iDayCount=GetMissionData(sceneId,selfId,MD_SHIMEN_DAYCOUNT)
	--local iTime = mod(iDayCount,100000)
	local iTime = GetMissionData(sceneId,selfId,MD_SHIMEN_DAYTIME)
	local iDayTime = floor(iTime/100)	--上m祎 次放弃任务to� 鸬 时间(天数)
	--local iDayHuan = floor(iDayCount/100000) --当天内完成to� 鸬 S� l nhi甿 v� 

	--local CurTime = GetHourTime()		--当前时间
	local CurTime = GetQuarterTime()		--当前时间
	local CurDaytime = floor(CurTime/100)	--当前时间(天)

	if iDayTime ~= CurDaytime then
		--iDayHuan = 0
		SetMissionData(sceneId,selfId,MD_SHIMEN_DAYCOUNT,0)
	end

	--设置循环任务to� 鸬 时间
	--iDayCount = iDayHuan*100000+CurTime
	--SetMissionData(sceneId,selfId,MD_SHIMEN_DAYCOUNT,iDayCount)
	SetMissionData(sceneId,selfId,MD_SHIMEN_DAYTIME,CurTime)
	--end modified by zhangguoxin 090208

	local menpaiPoint = GetHumanMenpaiPoint(sceneId, selfId)
	if menpaiPoint == 1 then
		SetHumanMenpaiPoint(sceneId, selfId, menpaiPoint-1 )
		Msg2Player(  sceneId, selfId,"Ng呓i 疸 ti陁 hao #Y1 #W餴琺 c痭g hi猲 m鬾 ph醝" ,MSG2PLAYER_PARA )
	elseif menpaiPoint >= 2 then
		SetHumanMenpaiPoint(sceneId, selfId, menpaiPoint-2 )
		Msg2Player(  sceneId, selfId,"Ng呓i 疸 ti陁 hao #Y2 #W餴琺 c痭g hi猲 m鬾 ph醝" ,MSG2PLAYER_PARA )
	end
end

--**********************************
--玩家提交to� 鸬 普通物品
--**********************************
function x500501_OnMissionCheck_Necessary( sceneId, selfId, index1, index2, index3, Needindex )

	if Needindex == nil or Needindex == -1 then
		return 0;
	end

	if index1 >= 0 and index1 < 60  then
		SerialNum = LuaFnGetItemTableIndexByIndex( sceneId, selfId, index1 )

		if SerialNum == Needindex then
			return index1;
		end
	end

	if index2 >= 0 and index2 < 60  then
		SerialNum = LuaFnGetItemTableIndexByIndex( sceneId, selfId, index2 )

		if SerialNum == Needindex then
			return index2;
		end
	end

	if index3 >= 0 and index3 < 60  then
		SerialNum = LuaFnGetItemTableIndexByIndex( sceneId, selfId, index3 )

		if SerialNum == Needindex then
			return index3;
		end
	end

	BeginEvent(sceneId)
		AddText(sceneId,"Nhi甿 v� c黙 ng呓i kh鬾g th� ho鄋 th鄋h, v ph ng呓i giao kh鬾g ch韓h x醕")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,-1)
	return -1;

end

--**********************************
--玩家提交to� 鸬 装备类物品
--**********************************
function x500501_OnMissionCheckName_Necessary( sceneId, selfId, index1, index2, index3, Needindex )

	if Needindex == nil or Needindex == -1 then
		return 0;
	end

	if index1 >= 0 and index1 < 60  then
		SerialNum = LuaFnGetItemTableIndexByIndex( sceneId, selfId, index1 )
		ItemNameId = GetItemNameID(SerialNum)

		if ItemNameId == Needindex then
			return index1;
		end
	end

	if index2 >= 0 and  index2 < 60 then
		SerialNum = LuaFnGetItemTableIndexByIndex( sceneId, selfId, index2 )
		ItemNameId = GetItemNameID(SerialNum)

		if ItemNameId == Needindex then
			return index2;
		end
	end

	if index3 >= 0 and  index3 < 60 then
		SerialNum = LuaFnGetItemTableIndexByIndex( sceneId, selfId, index3 )
		ItemNameId = GetItemNameID(SerialNum)

		if ItemNameId == Needindex then
			return index3;
		end
	end
	BeginEvent(sceneId)
		AddText(sceneId,"Nhi甿 v� c黙 ng呓i kh鬾g th� ho鄋 th鄋h, v ph ng呓i giao kh鬾g ch韓h x醕")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,-1)
	return -1;
end

--**********************************
--玩家提交to� 鸬 物品
--**********************************
function x500501_OnMissionCheck_NecessaryEx( sceneId, selfId, index1, index2, index3, Needindex )
	if Needindex == nil or Needindex <= 0 then
		return -1
	end

	local indices = { index1, index2, index3 }
	for i = 1, getn( indices ) do
		if indices[i] and indices[i] >=0 and indices[i] < 80 then	-- 合法to� 鸬 背包格子
			if LuaFnGetItemTableIndexByIndex( sceneId, selfId, indices[i] ) == Needindex then
				return indices[i]
			end
		end
	end

	return -1
end

-- 圣诞活动 完成Nhi甿 v� s� m鬾 鹫t 疬㧟符节
function x500501_ACT_Christmas( sceneId, selfId, DayHuan )
  
  if DayHuan ~=20 and DayHuan ~=40 and DayHuan ~=60  then
     return
  end
	--检测时间	
	if CallScriptFunction( 050025, "CheckRightTime", sceneId) == 1 then
			
			--如果玩家等c小于25不给予贺卡
	  if	GetLevel( sceneId, selfId) < 25 then
		  return
	  end
	  
	  --检测材料包喧ng否有地方....
	  if LuaFnGetMaterialBagSpace( sceneId, selfId ) < 1 then
		  return
	  end
	  
	  local x500501_HeKaId = {
	                 20310011,
	                 20310017,
	                 20310012,
	                 20310019,
	                 20310014,
	                 20310018,
	                 20310015,
	                 20310016,
	                 20310013,	
           }			                                   --贺卡ID
    local menpaiId = LuaFnGetMenPai( sceneId, selfId )
    local hekaid = 0
    local strtext = ""
	  --给门派贺帖
	  if menpaiId == MP_SHAOLIN then
	     strtext = "C醕 h� thu 疬㧟 1 t Thi畃 ch鷆 ng鄖 l� ph醝 Thi猽 L鈓."
	     hekaid = x500501_HeKaId[1]
	  elseif menpaiId == MP_MINGJIAO then
	     strtext = "C醕 h� thu 疬㧟 1 t Thi畃 ch鷆 ng鄖 l� ph醝 Minh Gi醥."
	     hekaid = x500501_HeKaId[2]
	  elseif menpaiId == MP_GAIBANG then
	     strtext = "C醕 h� thu 疬㧟 1 t Thi畃 ch鷆 ng鄖 l� ph醝 C醝 Bang."
	     hekaid = x500501_HeKaId[3]
	  elseif menpaiId == MP_WUDANG then
	     strtext = "C醕 h� thu 疬㧟 1 t Thi畃 ch鷆 ng鄖 l� ph醝 V� 衋ng."
	     hekaid = x500501_HeKaId[4]
	  elseif menpaiId == MP_EMEI then
	     strtext = "C醕 h� thu 疬㧟 1 t Thi畃 ch鷆 ng鄖 l� ph醝 Nga My."
	     hekaid = x500501_HeKaId[5]
	  elseif menpaiId == MP_XINGSU then
	     strtext = "C醕 h� thu 疬㧟 1 t Thi畃 ch鷆 ng鄖 l� ph醝 Tinh T鷆."
	     hekaid = x500501_HeKaId[6]
	  elseif menpaiId == MP_DALI then
	     strtext = "C醕 h� thu 疬㧟 1 t Thi畃 ch鷆 ng鄖 l� ph醝 Thi阯 Long."
	     hekaid = x500501_HeKaId[7]
	  elseif menpaiId == MP_TIANSHAN then
	     strtext = "C醕 h� thu 疬㧟 1 t Thi畃 ch鷆 ng鄖 l� ph醝 Thi阯 S絥."
	     hekaid = x500501_HeKaId[8]
	  elseif menpaiId == MP_XIAOYAO then
	     strtext = "C醕 h� thu 疬㧟 1 t Thi畃 ch鷆 ng鄖 l� ph醝 Ti陁 Dao."
	     hekaid = x500501_HeKaId[9]
	  end

	  local BagIndex = TryRecieveItem( sceneId, selfId, hekaid, QUALITY_MUST_BE_CHANGE )
	  if BagIndex ~= -1 then
		  BeginEvent( sceneId )
			  AddText( sceneId, strtext )
		  EndEvent( sceneId )
		  DispatchMissionTips( sceneId, selfId )
	  end	  
	  
	end
	
end
