-- 夫妻回答问题
-- 脚本号
-- UI_COMMAND 888901

x888901_g_ScriptId = 888901  -- 代码中也使用C醝 n鄖 编号了.严禁修改
x888901_g_Item		 = 30505134

-- 问题表
x888901_g_FemaleType = 6
x888901_g_MaleType = 7

x888901_g_OptPos = {
	{1,2,3},{1,3,2},{2,1,3},{2,3,1},{3,1,2},{3,2,1}
}

-- 客户端动作表
x888901_g_ClientOp = {
	"answer","clientstop","askstop"
}

-- 上m祎 题to� 鸬 回答情况
x888901_g_AnswerState = {
	["start"]			= "开始",
	["timeout"]		= "超时",
	["oknext"]		= "正确",
	["failnext"]	= "错误",
	["cancel"]		= "未知",
}

--**********************************
-- 列举事件
--**********************************
function x888901_OnEnumerate( sceneId, selfId, targetId )
	local CurMonthDay = LuaFnGetDayOfThisMonth()
	if CurMonthDay and mod(CurMonthDay,2) == 0 then
		AddNumText( sceneId, x888901_g_ScriptId, "心有Linh犀", 2, 100 )
	end
	--AddNumText(sceneId,x888901_g_ScriptId,"直接结婚", 5, 2)
end

--**********************************
-- 事件列表选中m祎 项
--**********************************
function x888901_OnDefaultEvent( sceneId, selfId, targetId, eventId )
	local opt = GetNumText()
	if opt == 1 then
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
		x888901_BeginCoupleQuestion(sceneId,selfId,targetId)
	elseif opt == 2 then
		x888901_DirectMary(sceneId,selfId)
	elseif opt == 3 then
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
	elseif opt == 100 then
		BeginEvent( sceneId )
			local strText = "    贤伉俪想知道你们喧ng否心意相通吗?我这里有m祎 c醝小小to� 鸬 测试#R心有Linh犀#W,C 你们T読 短时间内各自对相同to� 鸬 问题做出回答,你们不妨试上m祎 试,看看你们做出to� 鸬 选择喧ng否m祎 致,该测试每两天只有m祎 次机会报名参加,要慎重对待啊.#r    你愿意参加心有Linh犀to� 鸬 测试吗?"
			AddText( sceneId, strText )
			AddNumText( sceneId, x888901_g_ScriptId, "Ta mu痭 tham gia", 2, 1)
			AddNumText( sceneId, x888901_g_ScriptId, "我再想想", 8, 3);
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
end

-- 方便结婚to� 鸬 功能,测试代码
function x888901_DirectMary(sceneId,selfId)
	--1.喧ng否组队
	local teamId = GetTeamId(sceneId,selfId)
	if teamId<0 then
		x888901_NotifySystemMsg(sceneId,selfId,"err_noteam")
		return
	end
	
	--2.喧ng否夫妻俩人
	if GetTeamSize(sceneId,selfId)~=2 then
		x888901_NotifySystemMsg(sceneId,selfId,"err_musttwo")
		return
	end
	
	--3.喧ng否T読 附近
	if GetNearTeamCount(sceneId,selfId) ~= 2 then
		x888901_NotifySystemMsg(sceneId,selfId,"err_mustnear")
		return
	end
	
	--4.喧ng否喧ng夫妻
	local tid1 = GetNearTeamMember(sceneId,selfId,0)
	local tid2 = GetNearTeamMember(sceneId,selfId,1)
	
	LuaFnMarry(sceneId, tid1, tid2, 1)
	x888901_NotifySystemMsg(sceneId,tid1,"directmarry")
	x888901_NotifySystemMsg(sceneId,tid2,"directmarry")
end

-- 检查开始答题条件
function x888901_BeginCoupleQuestion(sceneId,selfId,targetId)
	--1.喧ng否组队
	local teamId = GetTeamId(sceneId,selfId)
	if teamId<0 then
		x888901_NotifySystemMsg(sceneId,selfId,"err_noteam")
		return
	end
	
	--2.喧ng否俩人
	if GetTeamSize(sceneId,selfId)~=2 then
		x888901_NotifySystemMsg(sceneId,selfId,"err_musttwo")
		return
	end
	
	--3.喧ng否T読 附近
	if GetNearTeamCount(sceneId,selfId) ~= 2 then
		x888901_NotifySystemMsg(sceneId,selfId,"err_mustnear")
		return
	end
	
	--4.喧ng否喧ng夫妻
	local tid1 = GetNearTeamMember(sceneId,selfId,0)
	local tid2 = GetNearTeamMember(sceneId,selfId,1)
	if LuaFnIsMarried(sceneId,tid1)<=0 or LuaFnIsMarried(sceneId,tid2)<=0 then
		x888901_NotifySystemMsg(sceneId,selfId,"err_nomarry")
		return
	else
		if LuaFnGetSpouseGUID(sceneId,tid1) ~= LuaFnGetGUID(sceneId,tid2) or LuaFnGetSpouseGUID(sceneId,tid2) ~= LuaFnGetGUID(sceneId,tid1) then
			x888901_NotifySystemMsg(sceneId,selfId,"err_mustcouple")
			return
		end
	end
	
	--5.喧ng否MAC相同
	if IsSameMAC(sceneId,tid1,tid2) > 0 then
		x888901_NotifySystemMsg(sceneId,selfId,"err_samemac")
		return
	end
	
	--6.喧ng否队长
	if LuaFnIsTeamLeader(sceneId,selfId)<=0 then
		x888901_NotifySystemMsg(sceneId,selfId,"err_mustleader")
		return
	end
	
	local CurDayTime = GetDayTime()
	local LastCoupleQuestionDayTime1 = GetMissionData(sceneId, tid1, MD_COUPLEQUESTION_DAYTIME)
	local LastCoupleQuestionDayTime2 = GetMissionData(sceneId, tid2, MD_COUPLEQUESTION_DAYTIME)
	
	--7.今天喧ng否未参加
	if CurDayTime <= LastCoupleQuestionDayTime1 or CurDayTime <= LastCoupleQuestionDayTime2 then
		x888901_NotifySystemMsg(sceneId,selfId,"err_already")
		return
	end
	
	--8.今天喧ng否喧ng双日
	local CurMonthDay = LuaFnGetDayOfThisMonth()
	if not CurMonthDay or mod(CurMonthDay,2) > 0 then
		x888901_NotifySystemMsg(sceneId,selfId,"err_notday")
		return
	end
	
	--检测成功,可以开始初始化答题了
	SetMissionData( sceneId, tid1, MD_COUPLEQUESTION_DAYTIME, CurDayTime )
	SetMissionData( sceneId, tid2, MD_COUPLEQUESTION_DAYTIME, CurDayTime )
	
	local FriendPoint = LuaFnGetFriendPoint(sceneId,tid1,tid2)
	local MaxQuestion = 25

	if FriendPoint >=9000 then
		MaxQuestion = 100
	elseif FriendPoint >=6000 then
		MaxQuestion = 75
	elseif FriendPoint >= 3000 then
		MaxQuestion = 50
	end
	
	--设� gi鈟饺宋飔o� 鸬 属性
	StopCoupleQuestion(sceneId,tid1)
	StopCoupleQuestion(sceneId,tid2)
	
	StartCoupleQuestion(sceneId,tid1,tid2,targetId,MaxQuestion)
	SetMissionData(sceneId, tid1, MD_COUPLEQUESTION_DAYTIME,CurDayTime)
	StartCoupleQuestion(sceneId,tid2,tid1,targetId,MaxQuestion)
	SetMissionData(sceneId, tid2, MD_COUPLEQUESTION_DAYTIME,CurDayTime)

	--记录统计日志
	x888901_LogCoupleAction(sceneId,tid1,tid2,COUPLE_LOG_STARTQUESTION)

	local question,qtype = x888901_RandomQuestion(sceneId,tid1)	
	x888901_SendCoupleQuestion(sceneId,tid1,targetId,question,qtype,"start")
	x888901_SendCoupleQuestion(sceneId,tid2,targetId,question,qtype,"start")
end

function x888901_RandomQuestion(sceneId,userId)
	local coupleId = GetCoupleID(sceneId,userId)
	local nm = ""
	
	if coupleId>=0 then
		--男女判断
		local maleId = userId
		local femaleId = coupleId
		if GetSex(sceneId,userId) == 0 then
			maleId = coupleId
			femaleId = userId
		end
		
		--根据男女不同构造名称和题号
		local rp = random(1,2)
		if rp == 1 then
			nm = format("#G%s#W",GetName(sceneId,femaleId))
			return GetRandomQuestionsIndex(x888901_g_FemaleType),nm
		else
			nm = format("#G%s#W",GetName(sceneId,maleId))
			return GetRandomQuestionsIndex(x888901_g_MaleType),nm
		end
	else
		return GetRandomQuestionsIndex(x888901_g_FemaleType),nm
	end
end

-- 发送m祎 c醝问题给客户端
function x888901_SendCoupleQuestion(sceneId,userId,targetId,question,qtype,act)
	local bStart,qmax,qcur,privity,maxprivity,samenum = GetCoupleQuestionState(sceneId,userId)
	if bStart > 0 then
		local con,opt0,opt1,opt2=GetQuestionsRecord(question)
		con = format(con,qtype)
		local coupleId = GetCoupleID(sceneId,userId)
		
		local rpos = random(1,getn(x888901_g_OptPos))
		local pt = x888901_g_OptPos[rpos]
	
		if act == "timeout" then privity=0 end
		if act == "oknext" then 
			privity=privity+1
			samenum=samenum+1
			LuaFnSendSpecificImpactToUnit(sceneId,userId,userId,userId,51,100)
		end
		if act == "failnext" then privity=0 end
		if act == "start" then qcur=0 else qcur=qcur+1 end
	
		--已经没有题可答了
		if qcur == qmax then
			--发送特殊奖励
				if qmax == 100 and privity == 100 and bStart > 0 then
				x888901_SendCoupleQuestionPrize(sceneId,userId,coupleId)
			end
			--通知客户端结束答题
			NextCoupleQuestion(sceneId,userId,qcur,privity,samenum)
			x888901_StopCoupleQuestionScript(sceneId,userId,coupleId,"finish")
			return
		end
	
		--上m祎 题to� 鸬 回答情况
		local premsg = x888901_g_AnswerState[act]
		if not premsg then
			premsg = x888901_g_AnswerState["cancel"]
		end
		
		--通知客户端显示题目
		BeginUICommand(sceneId)
			UICommand_AddString(sceneId,act)
			UICommand_AddInt(sceneId,targetId)
			UICommand_AddInt(sceneId,qmax) --总题数
			UICommand_AddInt(sceneId,qcur+1) --当前题数
			UICommand_AddInt(sceneId,privity) --默契度
			UICommand_AddString(sceneId,con)	--问题
			UICommand_AddInt(sceneId,3)			--答案数量
			UICommand_AddString(sceneId,opt0)	--答案1
			UICommand_AddString(sceneId,opt1)	--答案2
			UICommand_AddString(sceneId,opt2)	--答案3
			UICommand_AddInt(sceneId,pt[1])	--显示位置1
			UICommand_AddInt(sceneId,pt[2]) --显示位置2
			UICommand_AddInt(sceneId,pt[3]) --显示位置3
			UICommand_AddString(sceneId,premsg)	--上m祎 题to� 鸬 回答情况
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,userId, x888901_g_ScriptId)
	
		--修改服务器端数据状态
		NextCoupleQuestion(sceneId,userId,qcur,privity,samenum)
		SetCurCoupleQuestion(sceneId,userId,question,3,-1)
	end
end

function x888901_SendCoupleQuestionPrize(sceneId,userId,coupleId)
	if coupleId>=0 then
		--发userId物品
		LuaFnBeginAddItem( sceneId )
		LuaFnAddItem( sceneId, x888901_g_Item, 1)
		local uret = LuaFnEndAddItem( sceneId, userId )
		if 1 == uret then
			AddItemListToHuman(sceneId,userId)
		end
		--发coupleId物品
		LuaFnBeginAddItem( sceneId )
		LuaFnAddItem( sceneId, x888901_g_Item, 1)
		local oret = LuaFnEndAddItem( sceneId, coupleId )
		if 1 == oret then
			AddItemListToHuman(sceneId,coupleId)
		end
		--发公告
		if 1 == oret and 1 == uret then
			local uname = format("#{_INFOUSR%s}",GetName(sceneId,userId))
			local oname = format("#{_INFOUSR%s}",GetName(sceneId,coupleId))
			local itemt = format("#{_INFOMSG%s}",GetItemTransfer(sceneId,coupleId,0))
			local str = format("%s#I与%s#IT読 Nguy畉 L鉶处进行#R心有Linh犀#Ito� 鸬 测试中,m祎 路过关斩将、高歌猛进,不愧喧ng夫妻同心其利断金.特赠与%s.",uname,oname,itemt)
			BroadMsgByChatPipe(sceneId, userId, str, 4)
		end
	end
end

-- 夫妻答题客户端接口(客户端调用)
function x888901_CoupleQuestion_ClientAction(sceneId,selfId,op,num,sequence)--modi:lby 增加题号检验检验当前问题喧ng否喧ng正T読 答题
	if nil == op or 1 > op then return end
	local client_op = x888901_g_ClientOp[op]
	
	if client_op == "answer" then
		x888901_ClientAnswerCoupleQuestion(sceneId,selfId,num,sequence)
	elseif client_op == "clientstop" then
		x888901_ClientStopCoupleQuestion(sceneId,selfId)
	elseif client_op == "askstop" then
		x888901_AskClientRealStop(sceneId,selfId)
	end
end

-- 客户端回答问题
function x888901_ClientAnswerCoupleQuestion(sceneId,selfId, num, sequence)--modi:lby 增加题号检验检验当前问题喧ng否喧ng正T読 答to� 鸬 题
	local bStart,_,qcur,privity = GetCoupleQuestionState(sceneId,selfId)
	if bStart>0 then
		local cq,_,_ = GetCurCoupleQuestion(sceneId,selfId)
		local ca = num
		local coupleId = GetCoupleID(sceneId,selfId)
		
		if coupleId>=0 and cq>=0 then
			local _,_,ocur,_ = GetCoupleQuestionState(sceneId,coupleId)
			local oq,_,oa = GetCurCoupleQuestion(sceneId,coupleId)
			--检查题喧ng否相同
			if oq ~= cq or sequence ~= qcur+1 or ocur ~= qcur then		--modi:lby 增加题号检验
				--x888901_StopCoupleQuestionScript(sceneId,selfId,coupleId) --modi:lby 因为可能多次提交会有题to� 鸬 能容不相同不能退出
				return
			end
			
			local act = "failnext"
			--检查答案喧ng否相同
			if oa <= 0 then
				SetCurCoupleQuestion(sceneId,selfId,cq,3,ca)
				return
			elseif oa == ca then
				act = "oknext"
			end
			-- 鹫t 疬㧟Kinh nghi甿值
			if act == "oknext" then
				local cexp = floor(x888901_CaculPrivityExp(sceneId,selfId,privity))
				AddExp(sceneId,selfId,cexp)
				local oexp = floor(x888901_CaculPrivityExp(sceneId,coupleId,privity))
				AddExp(sceneId,coupleId,oexp)

				local tip_part1 = "Ch鷆 m譶g,你们to� 鸬 答案相同,你 鹫t 疬㧟Kinh nghi甿"
				local tip_part2 = " 餴琺."
				
				x888901_NotifySystemMsg(sceneId,selfId,act,tip_part1..tostring(cexp)..tip_part2)
				x888901_NotifySystemMsg(sceneId,coupleId,act,tip_part1..tostring(oexp)..tip_part2)
			else
				x888901_NotifySystemMsg(sceneId,selfId,act)
				x888901_NotifySystemMsg(sceneId,coupleId,act)
			end
			--继续发送问题
			local question,qtype = x888901_RandomQuestion(sceneId,selfId)	
			x888901_SendCoupleQuestion(sceneId,selfId,-1,question,qtype,act)
			x888901_SendCoupleQuestion(sceneId,coupleId,-1,question,qtype,act)
		else
			--对方已经结束答题,则自己也要结束
			x888901_StopCoupleQuestionScript(sceneId,selfId,coupleId)
		end
	end
end

-- 答题Kinh nghi甿值计算
-- 基础奖励=c*LV*LV
-- 每题实 餴琺奖励=基础奖励*(1+N*a)
-- c为奖励值计算参数,默认为0.573
-- LV为答题者等c
-- N为答该题时to� 鸬 默契指数值
-- a为答题时to� 鸬 Kinh nghi甿加成系数,默认为0.01

function x888901_CaculPrivityExp(sceneId,userId,privity)
	local c = 0.573
	local a = 0.01
	local LV = GetLevel(sceneId,userId)
	local N = privity
	
	local baseExp=c*LV*LV
	local Exp=baseExp*(1+N*0.01)
	
	--print("x888901_CaculPrivityExp selfId="..tostring(userId).." baseExp="..tostring(baseExp).." Exp="..tostring(Exp))
	return Exp;
end
-- 询问客户端喧ng否结束
function x888901_AskClientRealStop(sceneId,selfId)
	BeginUICommand(sceneId)
		UICommand_AddInt(sceneId,x888901_g_ScriptId);
		UICommand_AddInt(sceneId,2)
		UICommand_AddString(sceneId,"CoupleQuestion_ClientAction");
		UICommand_AddString(sceneId,"退出后该次测试将就此结束,你确认要退出吗?");
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 24)
end
-- 客户端结束
function x888901_ClientStopCoupleQuestion(sceneId,selfId)
	local coupleId = GetCoupleID(sceneId,selfId)
	x888901_StopCoupleQuestionScript(sceneId,selfId,coupleId,"clientstop")
end

-- 答题超时
function x888901_AnswerQuestionTimeOut(sceneId,selfId,coupleId)
	local question,qtype = x888901_RandomQuestion(sceneId,selfId)
	
	x888901_NotifySystemMsg(sceneId,selfId,"timeout")
	x888901_SendCoupleQuestion(sceneId,selfId,-1,question,qtype,"timeout")
	
	x888901_NotifySystemMsg(sceneId,coupleId,"timeout")
	x888901_SendCoupleQuestion(sceneId,coupleId,-1,question,qtype,"timeout")
	--print("x888901_AnswerQuestionTimeOut "..tostring(selfId))
end

-- 停止夫妻双方答题
function x888901_StopCoupleQuestionScript(sceneId,selfId,coupleId,act)
	local bStart,qmax,_,_,maxprivity,samenum = GetCoupleQuestionState(sceneId,selfId)
	local tipm = ""
	
	if bStart > 0 then
		tipm = format("该次测试共%d题,你们夫妻共答对%d题,最高默契指数达到%d.", qmax,samenum,maxprivity)
	end
	
	--统计所有结束to� 鸬 信息
	if coupleId >= 0 then
		if act == "finish" then
			x888901_LogCoupleAction(sceneId,selfId,coupleId,COUPLE_LOG_FINISHQUESTION)
		else
			x888901_LogCoupleAction(sceneId,selfId,coupleId,COUPLE_LOG_STOPQUESTION)
		end
	end
	
	StopCoupleQuestion(sceneId,selfId)
	x888901_SendStopCoupleQuestion(sceneId,selfId,act,tipm)
	
	if coupleId>=0 then 
		StopCoupleQuestion(sceneId,coupleId)
		x888901_SendStopCoupleQuestion(sceneId,coupleId,act,tipm)
	end
end

-- Hu� b隹突Ф藅o� 鸬 显示
function x888901_SendStopCoupleQuestion(sceneId,userId,act,tip)
	if act then
		x888901_NotifySystemMsg(sceneId,userId,act,tip)
	else
		x888901_NotifySystemMsg(sceneId,userId,"cancel",tip)
	end
	
	BeginUICommand(sceneId)
		UICommand_AddString(sceneId,"cancel")
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,userId, x888901_g_ScriptId)
end

-- H� th痭g提示
function x888901_NotifySystemMsg(sceneId,selfId,txtId,tip)
	BeginEvent(sceneId)
	if txtId == "err_noteam" then
		AddText(sceneId,"你必须组队才能参加")
	elseif txtId == "err_musttwo" then
		AddText(sceneId,"必须夫妻两人组队")
	elseif txtId == "err_mustnear" then
		AddText(sceneId,"夫妻两人必须都T読 附近")
	elseif txtId == "err_nomarry" then
		AddText(sceneId,"必须夫妻两人组队")
	elseif txtId == "err_mustcouple" then
		AddText(sceneId,"必须夫妻两人组队")
	elseif txtId == "err_mustleader" then
		AddText(sceneId,"必须喧ng队长才能报名参加")
	elseif txtId == "err_already" then
		AddText(sceneId,"你们今天已经参加过心有Linh犀了")
	elseif txtId == "timeout" then
		AddText(sceneId,"回答超时.")
	elseif txtId == "directmarry" then
		AddText(sceneId,"直接结婚成功�.�")
	elseif txtId == "cancel" then
		AddText(sceneId,"天有不测风云,测试意外结束了."..tip)
	elseif txtId == "finish" then
		AddText(sceneId,"你们已完成测试."..tip)
	elseif txtId == "clientstop" then
		AddText(sceneId,"你们终止了测试."..tip)
	elseif txtId == "oknext" then
		AddText(sceneId,tip)
	elseif txtId == "failnext" then
		AddText(sceneId,"很遗憾,你们夫妻to� 鸬 答案不同.")
	elseif txtId == "err_notday" then
		AddText(sceneId,"今天没有心有Linh犀")
	elseif txtId == "err_samemac" then
		AddText(sceneId,"你们夫妻用同m祎 台机器可没法进行测试")
	end
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
end

--统计信息
function x888901_LogCoupleAction(sceneId,tid1,tid2,logid)
	local bStart,qmax,_,_,maxprivity = GetCoupleQuestionState(sceneId,tid1)
	--print(tostring(bStart).." "..tostring(logid).." "..tostring(COUPLE_LOG_DETAIL[logid]))
	if bStart > 0 and logid and COUPLE_LOG_DETAIL[logid] then		
		local maleId = tid1
		local femaleId = tid2
		if GetSex(sceneId,tid1) == 0 then
			maleId = tid2
			femaleId = tid1
		end
		
		--CPL:编号,� 餴琺�,GUID1,GUID2,总题数,最大默契数,时间
		local logstr = format("CPL:%d,%s,0x%X,0x%X,%d,%d",
									 				logid,
									 				COUPLE_LOG_DETAIL[logid],
									 				LuaFnGetGUID(sceneId,maleId),
									 				LuaFnGetGUID(sceneId,femaleId),
									 				qmax,
									 				maxprivity)
		LogCouple(logstr)
	end
end
