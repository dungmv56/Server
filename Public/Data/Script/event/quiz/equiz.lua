x311100_g_ScriptId = 311100

--Ti猵 th挝馧PC属性
x311100_g_Position_X=147.4986
x311100_g_Position_Z=146.2925
x311100_g_SceneID=2
x311100_g_AccomplishNPC_Name="Ti玭 Long"

x311100_g_MissionName="Ta h鰅, ng呓i 疳p"

-- 问题UI 	2

--1.client弹出NPC第m祎 c醝对话界面
--2.给client出题
--3.告诉client答错了.
--4.告诉答够了10道题,结束.
x311100_g_Quiz_Hortation = {}
x311100_g_Quiz_Newbie_Hortation = {}

x311100_g_Quiz_Hortation[1] = 36
x311100_g_Quiz_Hortation[2] = 72
x311100_g_Quiz_Hortation[3] = 109
x311100_g_Quiz_Hortation[4] = 145
x311100_g_Quiz_Hortation[5] = 181
x311100_g_Quiz_Hortation[6] = 218
x311100_g_Quiz_Hortation[7] = 254
x311100_g_Quiz_Hortation[8] = 290
x311100_g_Quiz_Hortation[9] = 330
x311100_g_Quiz_Hortation[10] = 365

x311100_g_Quiz_Newbie_Hortation[1] = 4 
x311100_g_Quiz_Newbie_Hortation[2] = 7 
x311100_g_Quiz_Newbie_Hortation[3] = 10
x311100_g_Quiz_Newbie_Hortation[4] = 14
x311100_g_Quiz_Newbie_Hortation[5] = 18
x311100_g_Quiz_Newbie_Hortation[6] = 21
x311100_g_Quiz_Newbie_Hortation[7] = 25
x311100_g_Quiz_Newbie_Hortation[8] = 29
x311100_g_Quiz_Newbie_Hortation[9] = 33
x311100_g_Quiz_Newbie_Hortation[10] = 36

x311100_g_AccomplishCircumstance = 1

--**********************************
function x311100_OnDefaultEvent( sceneId, selfId, targetId )
		local TransportNPCName=GetName(sceneId,targetId);
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,1)
			UICommand_AddString(sceneId,"#gFF0FA0Kh鋙 th� tr� th裞 giang h�")
			UICommand_AddString(sceneId,"#{function_help_084}")
			UICommand_AddInt(sceneId,targetId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 2)
		SetMissionData(sceneId,selfId,MD_QUIZ_TARGET,targetId)

		return
end

--**********************************
--列举事件
--**********************************
function x311100_OnEnumerate( sceneId, selfId, targetId )
	if	LuaFnGetLevel( sceneId, selfId)>=2 and LuaFnGetLevel( sceneId, selfId)<=20 then
			AddNumText(sceneId,x311100_g_ScriptId,x311100_g_MissionName , 6, -1);
    end
end

--**********************************
--提问
--**********************************
function x311100_AskQuestion( sceneId, selfId, Question_Sequence)
	if Question_Sequence == 1 and x311100_OnAccept_Quiz( sceneId, selfId ) <= 0 then
		return
	end
	if Question_Sequence > 5 then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,4)
			UICommand_AddString(sceneId,"Ch鷆 m譶g c醕 h� tr� l秈 瘊ng t c� c醕 c鈛 h鰅!#rL sau 鹱ng qu阯 nh� ti猵 t鴆 tham gia ^_^")
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 2)
		if( IsHaveMission(sceneId,selfId,447) > 0)  then			
			local misIndex = GetMissionIndexByID(sceneId,selfId,447)
			SetMissionByIndex(sceneId,selfId,misIndex,1,1)
			
			BeginEvent(sceneId)
				strText = "N猽 疳p 瘊ng 5 c鈛, nhi甿 v� 疸 ho鄋 th鄋h"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			local targetId=GetMissionData(sceneId,selfId,MD_QUIZ_TARGET)
			CallScriptFunction( 002031, "OnDefaultEvent", sceneId, selfId, targetId )
			return			
		end
		
		
		return
	end

--随机出m祎 c醝号码
	
	local wenti = GetRandomQuestionsIndex(1)

	local con,opt0,opt1,opt2,opt3,opt4,opt5,key0,key1,key2,key3,key4,key5,sztype=GetQuestionsRecord(wenti)

	if con=="" then		--注意这里如果选项喧ng空则用  ==""   来判断
		Msg2Player( sceneId,selfId,"Kh鬾g t靘 疬㧟 c鈛 h鰅",MSG2PLAYER_PARA)
	end
	
	local key_position = {}
	--把他们位� gi鈟婊�
	x311100_g_rand = random(0,2)
	if x311100_g_rand == 0 then
		key_position[0] = 1
		key_position[1] = 2
		key_position[2] = 0
		key_position[3] = -1
		key_position[4] = -1
		key_position[5] = -1
	elseif x311100_g_rand == 1 then
		key_position[0] = 2
		key_position[1] = 0
		key_position[2] = 1
		key_position[3] = -1
		key_position[4] = -1
		key_position[5] = -1
	else
		key_position[0] = 0
		key_position[1] = 1
		key_position[2] = 2
		key_position[3] = -1
		key_position[4] = -1
		key_position[5] = -1
	end

	local asktime = LuaFnGetCurrentTime();
	SetMissionData(sceneId,selfId,MD_QUIZ_ASKTIME,asktime)
	
	BeginUICommand(sceneId)
		UICommand_AddInt(sceneId,2)
		UICommand_AddInt(sceneId,Question_Sequence)
		UICommand_AddInt(sceneId,wenti)		
		UICommand_AddString(sceneId,con)
		UICommand_AddString(sceneId,opt0)
		UICommand_AddString(sceneId,opt1)
		UICommand_AddString(sceneId,opt2)
		UICommand_AddString(sceneId,opt3)
		UICommand_AddString(sceneId,opt4)
		UICommand_AddString(sceneId,opt5)
		UICommand_AddInt(sceneId,key_position[0])
		UICommand_AddInt(sceneId,key_position[1])
		UICommand_AddInt(sceneId,key_position[2])
		UICommand_AddInt(sceneId,key_position[3])
		UICommand_AddInt(sceneId,key_position[4])
		UICommand_AddInt(sceneId,key_position[5])
		UICommand_AddInt(sceneId,-1 )
		UICommand_AddString(sceneId,sztype)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 2)
	return

end

--**********************************
--回答
--**********************************
function x311100_AnswerQuestion( sceneId, selfId, Question, Answer1,  Question_Sequence)

	local Answer_List={}
	local Player_Level = GetLevel( sceneId, selfId );

	local con,opt0,opt1,opt2,opt3,opt4,opt5,key0,key1,key2,key3,key4,key5=GetQuestionsRecord(Question)
	Answer_List[0] = key0;
	Answer_List[1] = key1;
	Answer_List[2] = key2;
	Answer_List[3] = key3;
	Answer_List[4] = key4;
	Answer_List[5] = key5;
	
	if con=="" then		--注意这里如果选项喧ng空则用  ==""   来判断
		Msg2Player( sceneId,selfId,"Kh鬾g t靘 疬㧟 c鈛 h鰅",MSG2PLAYER_PARA)
	end
	
	local asktime = GetMissionData(sceneId,selfId,MD_QUIZ_ASKTIME)
	
	if Answer_List[Answer1-1] == 1 and LuaFnGetCurrentTime() - asktime < 305 then

		--没有任务才奖励金钱
		if( IsHaveMission(sceneId,selfId,447) <= 0)  then
			--奖励金钱
			if Question_Sequence > 0 and Question_Sequence < 11 then
				if Player_Level > 9 then
					x311100_g_Money = x311100_g_Quiz_Hortation[Question_Sequence]
				else
				 	x311100_g_Money = x311100_g_Quiz_Newbie_Hortation[Question_Sequence]
				end
			else
				--x311100_g_Money = 10 * Question_Sequence
				x311100_g_Money = 1
			end
			--AddMoney(sceneId,selfId,x311100_g_Money)
			--Msg2Player( sceneId,selfId,"你 餴琺到#{_MONEY"..x311100_g_Money.."}",MSG2PLAYER_PARA)
		end
	--告诉他答对了
		x311100_AskQuestion( sceneId, selfId, Question_Sequence + 1)
	else
	--告诉他答错了
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,3)
			UICommand_AddString(sceneId,"Th 疳ng ti猚, c鈛 tr� l秈 c黙 c醕 h� 疸 sai. Th鬷 鹱ng n鋘 l騨g, c� gg l sau nh�")
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 2)
	end

end

function x311100_OnAccept_Quiz( sceneId, selfId )

	if( IsHaveMission(sceneId,selfId,447) > 0)  then
		return 1
	end
	
	local Max_Time_EveryDay =5
	--begin modified by zhangguoxin 090207
	local iDayCount=GetMissionData(sceneId,selfId,MD_QUIZ_DAYCOUNT)
	local iTime = mod(iDayCount,100000)
	--local iDayTime = floor(iTime/100)	--上m祎 次交任务to� 鸬 时间(天数)
	local iDayTime = iTime	--上m祎 次交任务to� 鸬 时间(天数)
	--local iQuarterTime = mod(iTime,100)	--上m祎 次交任务to� 鸬 时间(刻)
	local iDayHuan = floor(iDayCount/100000) --当天内完成to� 鸬 S� l nhi甿 v� 

	--local CurTime = GetHourTime()		--当前时间
	--local CurDaytime = floor(CurTime/100)	--当前时间(天)
	local CurDaytime = GetDayTime()	--当前时间(天)
	--local CurQuarterTime = mod(CurTime,100)	--当前时间(刻)
		
	if CurDaytime==iDayTime then 	--上次Ho鄋 t nhi甿 v鷑g同m祎 天内
		if iDayHuan >= Max_Time_EveryDay then

			BeginEvent(sceneId)
				strText = format("V 疳p tr� l馽 m祎 l l鄊 疬㧟 nhi玼 nh l� %d l, c醕 h� 疸 th� %d l r癷.", Max_Time_EveryDay,iDayHuan )	
				AddText(sceneId,strText)
 			EndEvent(sceneId)
 			DispatchMissionTips(sceneId,selfId)
 			
			return -1
		end
		iDayHuan = iDayHuan+1
	else							--上次Ho鄋 t nhi甿 v籘読 同m祎 天,重置
		iDayTime = CurDaytime
		iDayHuan = 1
	end
	
	--iDayCount = iDayHuan*100000+CurDaytime*100+CurQuarterTime 
	iDayCount = iDayHuan*100000 + CurDaytime;
		
	SetMissionData(sceneId,selfId,MD_QUIZ_DAYCOUNT,iDayCount)
	--begin modified by zhangguoxin 090207
	return 1
	
end

function x311100_OnOverTime( sceneId, selfId )
	BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,3)
			UICommand_AddString(sceneId,"Th 疳ng ti猚, c鈛 tr� l秈 c黙 c醕 h� 疸 sai. Th鬷 鹱ng n鋘 l騨g, c� gg l sau nh�")
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 2)
end
