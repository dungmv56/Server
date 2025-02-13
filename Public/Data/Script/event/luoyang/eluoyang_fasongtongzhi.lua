					
--找人任务
--发送通知
--MisDescBegin
--脚本号
x250551_g_ScriptId = 250551

--任务号
x250551_g_MissionId = 721

--上m祎 c醝任务to� 鸬 ID
--g_MissionIdPre = 

--目标NPC
x250551_g_Name	="Kh鈛 H鄋h L誧"

--任务归类 
x250551_g_MissionKind = 11

--衅ng c nhi甿 v� 
x250551_g_MissionLevel = 10000

--喧ng否喧ngTinh英任务
x250551_g_IfMissionElite = 0

--任务C  餴琺到to� 鸬 物品
--g_DemandItem={{id=30701021,num=1}}


--任务名
x250551_g_MissionName="Truy玭 kh t韓"
x250551_g_MissionInfo="H銀 gi鷓 ta th鬾g b醥 %s %s [%d,%d], 鹫i h礽 嗅 C s b 馥u"
x250551_g_MissionTarget="%f"
x250551_g_ContinueInfo="L鄊 t痶 l"		--未Ho鄋 t nhi甿 v鴗o� 鸬 npc对话
x250551_g_MissionComplete="Ta bi猼, 疴y l� tg th叻ng cho ng呓i"

--用来保存字符串格式化to� 鸬 数据
x250551_g_FormatList = {
								"T靘 疬㧟 %n",
								}
								
--格式字符串中对应于g_StringList中字符串to� 鸬 索引, 表示从4开始,后多少位视SetMissionByIndexEx(...)to� 鸬 多少而定
x250551_g_StrForePart=4

--MisDescEnd

x250551_g_fasongtongzhiNpcIndex = 5

--**********************************
--任务入口函数
--**********************************
function x250551_OnDefaultEvent( sceneId, selfId, targetId )
  --如果玩家完成过C醝 n鄖 任务
  if( IsHaveMission(sceneId,selfId,x250551_g_MissionId) > 0)  then
  	if GetName(sceneId, targetId) == x250551_g_Name then
  		local misIndex = GetMissionIndexByID(sceneId,selfId,x250551_g_MissionId)
  		local npcId = GetMissionParam(sceneId, selfId, misIndex, x250551_g_StrForePart+1)
  		local _, npcName, npcScene, x, z = GetNpcInfoByNpcId(sceneId,npcId)
  		local strText = format("L秈 nh c黙 c醕 h� 疸 疬㧟 chuy琻 ch遖? %s %s ch韓h � (%d, %d). C醕 h� c� th� nh Alt+Q ki琺 tra m鴆 ti陁 nhi甿 v�", npcScene, npcName, x, z)
			BeginEvent(sceneId)
				AddText(sceneId, strText)
			EndEvent()
			DispatchEventList(sceneId, selfId, -1)
  	else
	  	if x250551_CheckSubmit( sceneId, selfId ) > 0 then
		 		BeginEvent(sceneId)
					AddText(sceneId,x250551_g_MissionName)
					local BonusMoney = 500	--90 + (GetLevel(sceneId, selfId) - 10) * 5
					local BonusExp = 200
					AddText(sceneId, "Th叻ng cho c醕 h� " .. tostring(BonusExp) .. " 餴琺 kinh nghi甿 v� " .. "#{_MONEY" .. tostring(BonusMoney) .. "}, h銀 mau 餴 b醥 cho Kh鈛 H鄋h L誧, 疸 nh 疬㧟 l秈 nh, xin 餫 t�")
					SetMissionCacheData(sceneId, selfId, 0, BonusMoney)
					SetMissionCacheData(sceneId, selfId, 1, BonusExp)
				EndEvent( )
				DispatchMissionContinueInfo(sceneId, selfId, targetId, x250551_g_ScriptId, x250551_g_MissionId,x250551_g_ScriptId)
			end	
		end
		--DispatchMissionDemandInfo(sceneId,selfId,targetId,x250551_g_ScriptId,x250551_g_MissionId,bDone,x250551_g_ScriptId)
    --Th鯽 m鉵任务接收条件
  elseif x250551_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) == x250551_g_Name then
			--///////////////////////////////////////////////////
			--local playerLevel = GetLevel(sceneId, selfId)
			--if playerLevel >= 21 then
			--	BeginEvent(sceneId)
			--		AddText(sceneId, "C黙 ng呓i 等c已经超过20c了,去做m祎 些更有前途to� 鸬 任务吧.")
			--	EndEvent( )
			--	DispatchEventList(sceneId, selfId, -1)
			--	return 
			--end
			--///////////////////////////////////////////////////
			--begin modified by zhangguoxin 090207
			local iDayCount = GetMissionData(sceneId,selfId,MD_FASONGTONGZHI_DAYCOUNT)
			--local iTime = mod(iDayCount,100000)
			local iTime = GetMissionData(sceneId,selfId,MD_FASONGTONGZHI_DAYTIME)
			local iDayTime = floor(iTime/100)					--上m祎 次放弃任务to� 鸬 时间(天数)
			local iQuarterTime = mod(iTime,100)				--上m祎 次放弃任务to� 鸬 时间(m祎 刻种)
			--local iDayHuan = floor(iDayCount/100000) 	--当天内完成to� 鸬 S� l nhi甿 v� 
			local iDayHuan = iDayCount 	--当天内完成to� 鸬 S� l nhi甿 v� 
			--print("iDayHuan ... is ... " .. iDayHuan)
			
			--local CurTime = GetHourTime()							--当前时间
			local CurTime = GetQuarterTime()							--当前时间
			local CurDaytime = floor(CurTime/100)			--当前时间(天)
			local CurQuarterTime = mod(CurTime,100) 	--当前时间(m祎 刻钟)
			--end modified by zhangguoxin 090207
			
			if iDayTime ~= CurDaytime  then
				iDayHuan = 0
				CurQuarterTime = 99
			end

			if iDayHuan >= 10 then
				BeginEvent(sceneId)
					AddText(sceneId, "H鬽 nay c醕 h� 疸 gi鷓 ta 疬a 10 l kh t韓 r癷, ng鄖 mai h銀 皙n nh�.")
				EndEvent( )
				DispatchEventList(sceneId, selfId, -1)
				return
				
			end

			if iDayTime == CurDaytime then
				if CurQuarterTime == iQuarterTime then
					BeginEvent(sceneId)
						AddText(sceneId, x250551_g_MissionName)
						AddText(sceneId, "  Do c醕 h� 疸 b� qua nhi甿 v�, trong v騨g 15 ph鷗 kh鬾g th� ti猵 nh nhi甿 v� m緄!")
					EndEvent( )
					DispatchEventList(sceneId, selfId, -1)
					return
				end
			end
			--/////////////////////////////////////////////////// end
			
			--发送任务Ti猵 th毕允総o� 鸬 信息
			BeginEvent(sceneId)
				--加入任务到玩家列表
				local bAdd = AddMission( sceneId,selfId, x250551_g_MissionId, x250551_g_ScriptId, 0, 0, 0 )
				if bAdd < 1 then
					return
				end	
				--寻物, 送信则设� gi鈟勘闚PCto� 鸬 事件Flag
				SetMissionEvent(sceneId, selfId, x250551_g_MissionId, 4)
				
				local nNpcId, strNpcName, strNpcScene, nSceneId, nPosX, nPosZ, strNPCDesc = GetOneMissionNpc(x250551_g_fasongtongzhiNpcIndex)
				print(nNpcId, strNpcName, strNpcScene, nSceneId, nPosX, nPosZ)
				--print(nNpcId, strNpcName, strNpcScene, nSceneId, nPosX, nPosZ, strNPCDesc)
				Msg2Player(  sceneId, selfId,"#YNh nhi甿 v�#W: nhi甿 v� ng叨i m緄 ki猰 ti玭", MSG2PLAYER_PARA )
				CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, nSceneId, nPosX, nPosZ, strNpcName)

				-- 餴琺到任务T読 20c醝任务中to� 鸬 序列号
				local misIndex = GetMissionIndexByID(sceneId,selfId,x250551_g_MissionId)
				
				SetMissionByIndex(sceneId, selfId, misIndex, 0, 0) --设置任务喧ng否完成(未完成)
				
				SetMissionByIndex(sceneId, selfId, misIndex, x250551_g_StrForePart, 0)
				SetMissionByIndex(sceneId, selfId, misIndex, x250551_g_StrForePart+1, nNpcId)
				--////////////////////////////////////////////////////////////
				AddText(sceneId,x250551_g_MissionName)
				local str = format("H銀 gi鷓 ta th鬾g b醥 %s %s [%d,%d], 鹫i h礽 嗅 C s b 馥u", strNpcScene, strNpcName, nPosX, nPosZ)
				AddText(sceneId, str)
				AddText(sceneId,"#{M_MUBIAO}")
				local strMissionTarget = format("T靘 疬㧟 %s%s [%d,%d]", strNpcScene, strNpcName, nPosX, nPosZ)
				AddText(sceneId, strMissionTarget)
				
			EndEvent( )
			DispatchEventList(sceneId,selfId,targetId)
		end
  end
  
end

--**********************************
--列举事件
--**********************************
function x250551_OnEnumerate( sceneId, selfId, targetId )
    --如果已接此任务
    if IsHaveMission(sceneId,selfId,x250551_g_MissionId) > 0 then
    	AddNumText(sceneId,x250551_g_ScriptId,x250551_g_MissionName,3,-1);
	  --Th鯽 m鉵任务接收条件
    elseif x250551_CheckAccept(sceneId,selfId) > 0 then
			if GetName(sceneId,targetId) == x250551_g_Name then
				AddNumText(sceneId,x250551_g_ScriptId,x250551_g_MissionName,4,-1);
			end
    end
end

--**********************************
--检测Ti猵 th跫�
--**********************************
function x250551_CheckAccept( sceneId, selfId )
		return 1
end

--**********************************
--Ti猵 th�
--**********************************
function x250551_OnAccept( sceneId, selfId )

end

--**********************************
--放弃
--**********************************
function x250551_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应to� 鸬 任务
	local misIndex = GetMissionIndexByID(sceneId,selfId,x250551_g_MissionId)
	local npcId = GetMissionParam(sceneId, selfId, misIndex, x250551_g_StrForePart+1)
	local  _, strNpcName, strNpcScene, x, z, desc, scene = GetNpcInfoByNpcId(sceneId,npcId)
	
  DelMission( sceneId, selfId, x250551_g_MissionId )
	CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, scene, strNpcName, x250551_g_MissionId)
	
	-- T読 这里还喧ng要检测C醝 n鄖 任务里头存to� 鸬 时间喧ng不喧ng过去m祎 天了,如果过去了,就先更新
	--begin modified by zhangguoxin 090207
	local iDayCount=GetMissionData(sceneId,selfId,MD_FASONGTONGZHI_DAYCOUNT)
	--local iTime = mod(iDayCount,100000)
	local iTime = GetMissionData(sceneId,selfId,MD_FASONGTONGZHI_DAYTIME)
	local iDayTime = floor(iTime/100)		--上m祎 次放弃任务to� 鸬 时间(天数)
	local iQuarterTime = mod(iTime,100)	--上m祎 次放弃任务to� 鸬 时间(刻)
	--local iDayHuan = floor(iDayCount/100000) --当天内完成to� 鸬 S� l nhi甿 v� 
	local iDayHuan = iDayCount --当天内完成to� 鸬 S� l nhi甿 v� 

	--local CurTime = GetHourTime()		--当前时间
	local CurTime = GetQuarterTime()		--当前时间
	local CurDaytime = floor(CurTime/100)	--当前时间(天)
	
	if CurDaytime~=iDayTime then 	--上次Ho鄋 t nhi甿 v鷑g同m祎 天内
		iDayHuan = 0
	end
	
	--iDayCount = iDayHuan*100000 + CurTime 

	--设置循环任务to� 鸬 时间
	--SetMissionData(sceneId,selfId,MD_FASONGTONGZHI_DAYCOUNT,iDayCount)
	SetMissionData(sceneId,selfId,MD_FASONGTONGZHI_DAYCOUNT,iDayHuan)
	SetMissionData(sceneId,selfId,MD_FASONGTONGZHI_DAYTIME,CurTime)
	--end modified by zhangguoxin 090207
end

--**********************************
--检测喧ng否可以提交
--**********************************
function x250551_CheckSubmit( sceneId, selfId )
	if IsHaveMission(sceneId,selfId,x250551_g_MissionId) > 0 then
		local misIndex = GetMissionIndexByID(sceneId,selfId,x250551_g_MissionId)
		if GetMissionParam(sceneId, selfId, misIndex, 0) == 1 then
			return 1
		end
	else
		return 0	
	end
end

--**********************************
--提交
--**********************************
function x250551_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	
	if x250551_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		--begin modified by zhangguoxin 090207
		local iDayCount=GetMissionData(sceneId,selfId,MD_FASONGTONGZHI_DAYCOUNT)
		--local iTime = mod(iDayCount,100000)
		local iTime = GetMissionData(sceneId,selfId,MD_FASONGTONGZHI_DAYTIME)
		local iDayTime = floor(iTime/100)		--上m祎 次放弃任务to� 鸬 时间(天数)
		local iQuarterTime = mod(iTime,100)	--上m祎 次放弃任务to� 鸬 时间(刻)
		--local iDayHuan = floor(iDayCount/100000)	--当天内完成to� 鸬 S� l nhi甿 v� 
		local iDayHuan = iDayCount 									--当天内完成to� 鸬 S� l nhi甿 v� 
	
		--local CurTime = GetHourTime()		--当前时间
		local CurTime = GetQuarterTime()		--当前时间
		local CurDaytime = floor(CurTime/100)	--当前时间(天)
		local CurQuarterTime = mod(CurTime,100)	--当前时间(刻)
		
		if CurDaytime==iDayTime then 	--上次Ho鄋 t nhi甿 v鷑g同m祎 天内
			iDayHuan = iDayHuan+1
		else							--上次Ho鄋 t nhi甿 v籘読 同m祎 天,重置
			iDayTime = CurDaytime
			iDayHuan = 1
		end
		
		-- 只要玩家交了任务,就让放弃任务to� 鸬 数据无效
		iQuarterTime = 99
		
		--iDayCount = iDayHuan*100000+iDayTime*100+iQuarterTime 
		iDayCount = iDayHuan;
		local newTime = CurDaytime * 100 + iQuarterTime;
		--设置循环任务to� 鸬 DAYCOUNT
		SetMissionData(sceneId,selfId,MD_FASONGTONGZHI_DAYCOUNT,iDayCount)
		SetMissionData(sceneId,selfId,MD_FASONGTONGZHI_DAYTIME,newTime)
		--end modified by zhangguoxin 090207
		
		local BonusMoney = GetMissionCacheData(sceneId, selfId, 0)
		local BonusExp = GetMissionCacheData(sceneId, selfId, 1)
		AddMoney(sceneId,selfId,BonusMoney )
		AddExp(sceneId,selfId,BonusExp )
		
		----------------------------------------changed by xindefeng-------------------------------------------------
		--AddMoney()&AddExp()本身会T読 H� th痭g频道提示,所以将以下两句提示注释掉
		----Msg2Player(  sceneId, selfId, "C醕 h� 疸 nh 疬㧟 " .. tostring(BonusExp) .. " 餴琺Kinh nghi甿", MSG2PLAYER_PARA )
		----Msg2Player(  sceneId, selfId, "C醕 h� 疸 nh 疬㧟 #{_MONEY" .. tostring(BonusMoney) .. "}", MSG2PLAYER_PARA )
		----------------------------------------changed by xindefeng-------------------------------------------------
		
		DelMission( sceneId,selfId, x250551_g_MissionId )
		Msg2Player(  sceneId, selfId,"#YHo鄋 t nhi甿 v�#W: th鬾g b醥 mi畁g",MSG2PLAYER_PARA )
		-- 当每天完成第10次和第20次to� 鸬 时候,启动防外挂提问
		if iDayHuan == 5 or iDayHuan == 10   then
			LuaFnSendGuajiQuestion(sceneId,selfId)
		end
	end
end

function x250551_OnLockedTarget(sceneId, selfId, objId )
	-- 判断喧ng不喧ng锁定to� 鸬 Npc
	if IsHaveMission(sceneId, selfId, x250551_g_MissionId) > 0 then
		local misIndex = GetMissionIndexByID(sceneId,selfId,x250551_g_MissionId)		-- 餴琺到任务T読 20c醝任务中to� 鸬 序列号
		local missionType = GetMissionParam(sceneId, selfId, misIndex, 1)
		
		local nNpcId = GetMissionParam(sceneId, selfId, misIndex, x250551_g_StrForePart+1)
		local _, strNpcName, strNpcScene, PosX, PosZ, desc = GetNpcInfoByNpcId(sceneId,nNpcId)
			 
		if GetName(sceneId, objId) == strNpcName then
			TAddNumText(sceneId, x250551_g_ScriptId,x250551_g_MissionName,4,-1,x250551_g_ScriptId);
			SetMissionByIndex(sceneId, selfId, misIndex, 0, 1)
		end	
	end 
	
	return 0;

end
	
											
