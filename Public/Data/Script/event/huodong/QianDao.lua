--签到(Thi阯 Long向前冲活动)
--xiehong

x889053_g_ScriptId	= 889053;

--活动BUFFid
x889053_g_Buff_Id	= 20003

--开始结束日期
--注意: 如果要新开活动,m祎 定要改开始日期大于上m祎 次to� 鸬 结束日期,否则记录玩家参加计数to� 鸬 MD不会重置
x889053_g_BeginTime	= 20090709
x889053_g_EndTime	= 20090816


--等c限制
x889053_g_MinLevel	= 10

--可以 鹫t 疬㧟奖励to� 鸬 次数
x889053_g_AwardInfo	= {

{Cycle = 7,	AwardItemId1 = 30008002, AwardCount1 = 1, NeedBagSpace1 = 1, AwardItemId2 = 10124141, AwardCount2 = 1, NeedBagSpace2 = 1}, 

{Cycle = 14, AwardItemId1 = 30008002, AwardCount1 = 1, NeedBagSpace1 = 1, AwardItemId2 = 50313004, AwardCount2 = 1, NeedBagSpace2 = 1},--材料栏

{Cycle = 28, AwardItemId1 = 30008002, AwardCount1 = 1, NeedBagSpace1 = 1, AwardItemId2 = 30900045, AwardCount2 = 1, NeedBagSpace2 = 1},

{Cycle = 35, AwardItemId1 = 30008002, AwardCount1 = 1, NeedBagSpace1 = 1, AwardItemId2 = 50313004, AwardCount2 = 2, NeedBagSpace2 = 2},--材料栏
							
  }


--**********************************
--列举事件
--**********************************
function x889053_OnEnumerate( sceneId, selfId, targetId )

	if x889053_IsInActTime() > 0 then
		AddNumText( sceneId, x889053_g_ScriptId, "#{TLXQC_090306_2}", 6, 1 );
	end
	
end

--**********************************
--任务入口函数
--**********************************
function x889053_OnDefaultEvent( sceneId, selfId, targetId )	-- 餴琺击Thi阯 Long向前冲

	local opt = GetNumText();
	if opt == 1 then
		
		BeginEvent(sceneId)
			local playerName = GetName( sceneId,selfId )
			local msg = format( "    #{_INFOUSR%s}#{TLXQC_090306_3}", playerName )
			
			local insertMsg = x889053_InsertMsg( sceneId, selfId, 1 )

			AddText( sceneId, msg.."#r #r    "..insertMsg );							--对话
			
			AddNumText( sceneId, x889053_g_ScriptId, "#{TLXQC_090306_4}", 6, 11 );		--按钮: Ta mu痭 tham gia《Thi阯 Long向前冲》
			AddNumText( sceneId, x889053_g_ScriptId, "#{TLXQC_090306_5}", 6, 12 );		--按钮: 查询参加次数
			AddNumText( sceneId, x889053_g_ScriptId, "#{TLXQC_090306_6}", 6, 13 );		--按钮: Thi阯 Long向前冲� 餴琺�
		EndEvent()
		DispatchEventList( sceneId, selfId, targetId )
		
	elseif opt == 11 then																-- 餴琺击按钮: Ta mu痭 tham gia《Thi阯 Long向前冲》
		
		if x889053_CheckCanJoinAndNotice( sceneId, selfId, targetId ) == 1 then
			x889053_Join( sceneId, selfId, targetId )
		end
		
	elseif opt == 12 then																-- 餴琺击按钮: 查询参加次数
			
		insertMsg = x889053_InsertMsg( sceneId, selfId, 1 )
		
		BeginEvent(sceneId)
			AddText( sceneId, "    "..insertMsg );
		EndEvent()
		DispatchEventList( sceneId, selfId, targetId )
		
	elseif opt == 13 then																-- 餴琺击按钮: Thi阯 Long向前冲� 餴琺�
		
		BeginEvent(sceneId)
			AddText( sceneId,  "    #{TLXQC_090306_7}");
		EndEvent()
		DispatchEventList( sceneId, selfId, targetId )
		
	end
end


--生成插入对话
function x889053_InsertMsg( sceneId, selfId, query )
	
	local insertMsg = ""
	local joinCount = x889053_GetJoinCount( sceneId, selfId )
	if joinCount == 0 then
		insertMsg = "#{TLXQC_090306_8}"
	else
	
		local awardLeftCount = x889053_AwardLeftCount( sceneId, selfId, joinCount )
		
		if awardLeftCount == 1 then
			if query == 1 then 
				insertMsg = "#{TLXQC_090306_9}"..joinCount.."#{TLXQC_090306_10}"..awardLeftCount.."#{TLXQC_090306_11}"
			else
				insertMsg = "#{TLXQC_090306_9}"..joinCount.."#{TLXQC_090306_10}"..awardLeftCount.."#{TLXQC_090306_22}"
			end
		elseif awardLeftCount ~= 0 then
			if query == 1 then 
				insertMsg = "#{TLXQC_090306_9}"..joinCount.."#{TLXQC_090306_10}"..awardLeftCount.."#{TLXQC_090306_12}"
			else
				insertMsg = "#{TLXQC_090306_9}"..joinCount.."#{TLXQC_090306_10}"..awardLeftCount.."#{TLXQC_090306_22}"
			end
		elseif awardLeftCount == 0 then
			if query == 1 then
				insertMsg = "#{TLXQC_090306_9}"..joinCount.."#{TLXQC_090306_23}"
			else
				insertMsg = "#{TLXQC_090306_13}"
			end
		end
	end
	
	return insertMsg
	
end


--喧ng否活动时间
function x889053_IsInActTime( )	

	local curDate = GetTime2Day( )
	
	--如果喧ng活动时间则Tr� v裉烊掌�
	if curDate >= x889053_g_BeginTime and curDate <= x889053_g_EndTime then
		return curDate
	end
	
	--否则Tr� v�0
	return 0
	
end

--取 餴琺当前参加活动次数
function x889053_GetJoinCount( sceneId, selfId )
	
	local lastJoinDate = GetMissionData( sceneId, selfId, MD_TW_QIANDAO_LAST_JOIN_TIME )
	if lastJoinDate < x889053_g_BeginTime or lastJoinDate > x889053_g_EndTime then
		return 0
	end
	
	local joinCount = GetMissionData( sceneId, selfId, MD_TW_QIANDAO_JOIN_COUNT )
	
	return joinCount
	
end

--取 餴琺还C 多少次可以领奖,都领完了就Tr� v�0
function x889053_AwardLeftCount( sceneId, selfId, joinCount )
	
	local awardLeftCount = 0
	for i, awrad in x889053_g_AwardInfo do
		if awrad.Cycle > joinCount then
			awardLeftCount = awrad.Cycle - joinCount
			break
		end
	end
	
	return awardLeftCount
end

function x889053_CheckCanJoinAndNotice( sceneId, selfId, targetId )
	
	--喧ng否T読 活动时间内(正常应该通过)
	local curDate = x889053_IsInActTime( )
	if curDate == 0 then
		x889053_ReturnDlg( sceneId, selfId, targetId, "#{TLXQC_090306_25}" )
		return 0
	end
	
	--判断等c
	if GetLevel( sceneId, selfId ) < x889053_g_MinLevel then
		x889053_ReturnDlg( sceneId, selfId, targetId, "    #{TLXQC_090306_14}" )
		return 0
	end
	
	--判断今日喧ng否参加过
	local lastJoinDate = GetMissionData( sceneId, selfId, MD_TW_QIANDAO_LAST_JOIN_TIME )
	if curDate <= lastJoinDate then
		x889053_ReturnDlg( sceneId, selfId, targetId, "    #{TLXQC_090306_15}" )
		return 0
	end
	
	--判断BUFF喧ng否T読 
	if LuaFnHaveImpactOfSpecificDataIndex( sceneId, selfId, x889053_g_Buff_Id ) == 1 then
		x889053_ReturnDlg( sceneId, selfId, targetId, "    #{TLXQC_090306_16}" )
		return 0
	end
	
	return 1
end

function x889053_Join( sceneId, selfId, targetId )
	
	local joinCount = x889053_GetJoinCount( sceneId, selfId )
	--joinCount = joinCount + 1
	
	local getAward = 0
	for i, awrad in x889053_g_AwardInfo do
		if awrad.Cycle == joinCount+1 then
			
			--判断背包喧ng否够
			local error = 0
			if awrad.Cycle == 7 or awrad.Cycle == 28 then
				if LuaFnGetPropertyBagSpace( sceneId, selfId ) < awrad.NeedBagSpace1 + awrad.NeedBagSpace2 then
					x889053_Tips( sceneId, selfId, "#{TLXQC_090306_19}"..(awrad.NeedBagSpace1+awrad.NeedBagSpace2).. "#{TLXQC_090306_20}" )
					error = 1
				end
			end
			if awrad.Cycle == 14 or awrad.Cycle == 35 then
				if LuaFnGetPropertyBagSpace( sceneId, selfId ) < awrad.NeedBagSpace1 then
					x889053_Tips( sceneId, selfId, "#{TLXQC_090306_19}"..awrad.NeedBagSpace1.. "#{TLXQC_090306_20}" )
					error = 1
				end
				if LuaFnGetMaterialBagSpace( sceneId, selfId ) < awrad.NeedBagSpace2 then
					x889053_Tips( sceneId, selfId, "#{TLXQC_090703_1}"..awrad.NeedBagSpace2.. "#{TLXQC_090306_20}" )
					error = 1
				end
			end
			if error == 1 then
				--若背包空格不足时,只Tr� v涯刻崾�,不Tr� v玭pc对话,直接关闭对话框.
				x889053_CloseDlg( sceneId, selfId, targetId )
				return
			end
			
			--给予
			local bIsSuccess = 1
	
			for i = 1, awrad.AwardCount1 do
				local ret1 = TryRecieveItem( sceneId, selfId, awrad.AwardItemId1, QUALITY_CREATE_DEFAULT)
				if ret1 == -1 then
					bIsSuccess = 0
				else
					LuaFnItemBind(sceneId, selfId,ret1)
				end
			end
			for j = 1, awrad.AwardCount2 do
				local ret2= TryRecieveItem( sceneId, selfId, awrad.AwardItemId2, QUALITY_CREATE_DEFAULT)
				if ret2 == -1 then
					bIsSuccess = 0
				else
					LuaFnItemBind(sceneId, selfId,ret2)
				end
			end
			
			if bIsSuccess == 1 then 
				--统计L頽h 奖励
				AuditQianDao( sceneId, selfId, 1, awrad.AwardCount1 )
				AuditQianDao( sceneId, selfId, 1, awrad.AwardCount2 )
				x889053_Tips( sceneId, selfId, "#{TLXQC_090306_17}"..awrad.AwardCount1.."#{TLXQC_090306_24}#{_ITEM"..awrad.AwardItemId1.."}#{TLXQC_090306_18}" )
				x889053_Tips( sceneId, selfId, "#{TLXQC_090306_17}"..awrad.AwardCount2.."#{TLXQC_090306_24}#{_ITEM"..awrad.AwardItemId2.."}#{TLXQC_090306_18}" )
				--L頽h 奖励后关闭对话框
				x889053_CloseDlg( sceneId, selfId, targetId )
				getAward = 1
			end
			break
		end
	end
	joinCount = joinCount + 1
	--加BUFF
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x889053_g_Buff_Id, 0 )
	
	local curDate = GetTime2Day( )
	SetMissionData( sceneId, selfId, MD_TW_QIANDAO_LAST_JOIN_TIME, curDate )
	SetMissionData( sceneId, selfId, MD_TW_QIANDAO_JOIN_COUNT, joinCount )
	
	--统计参加活动
	AuditQianDao( sceneId, selfId, 0, 0 )
	
	--如果不喧ngL頽h 奖励to� 鸬 次数就让NPC告诉他还剩多少次可以领
	if getAward ~= 1 then
		local msg = x889053_InsertMsg( sceneId, selfId, 0 )
		x889053_ReturnDlg( sceneId, selfId, targetId, "    "..msg )
	end
end

--**********************************
--Tr� v曰�
--**********************************
function x889053_ReturnDlg(sceneId, selfId, targetId, msg)
	BeginEvent(sceneId)
		AddText(sceneId, msg);
	EndEvent()
	DispatchEventList(sceneId, selfId, targetId)
end

--**********************************
--ReturnTips
--**********************************
function x889053_Tips(sceneId, selfId, msg)
	BeginEvent(sceneId)
		AddText(sceneId, msg);
	EndEvent()
	DispatchMissionTips(sceneId, selfId)
end

--**********************************
--关闭对话框
--**********************************
function x889053_CloseDlg(sceneId, selfId, targetId)
	BeginUICommand( sceneId )
	UICommand_AddInt( sceneId, targetId )
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId, 1000 )	
end

--**********************************
--Ti猵 th�
--**********************************
function x889053_OnAccept( sceneId, selfId )


end

--**********************************
--放弃
--**********************************
function x889053_OnAbandon( sceneId, selfId )

end

--**********************************
--继续
--**********************************
function x889053_OnContinue( sceneId, selfId, targetId )

end

--**********************************
--检测喧ng否可以提交
--**********************************
function x889053_CheckSubmit( sceneId, selfId )

end

--**********************************
--提交
--**********************************
function x889053_OnSubmit( sceneId, selfId, targetId,selectRadioId )

end

--**********************************
--杀死怪物或玩家
--**********************************
function x889053_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--进入区域事件
--**********************************
function x889053_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x889053_OnItemChanged( sceneId, selfId, itemdataId )
end

