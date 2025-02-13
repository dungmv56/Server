--问答任务
--钱龙要你连续答对12c醝问题
--MisDescBegin
--脚本号
x210207_g_ScriptId = 210207

--Ti猵 th挝馧PC属性
x210207_g_Position_X=266
x210207_g_Position_Z=234
x210207_g_SceneID=2
x210207_g_AccomplishNPC_Name="Ti玭 Long"

--任务号
x210207_g_MissionId = 447

--上m祎 c醝任务to� 鸬 ID
x210207_g_MissionIdPre = 445

--目标NPC
x210207_g_Name	="Ti玭 Long"

--任务道具编号
--g_ItemId = 20101001

--任务道具需求数量
--g_ItemNeedNum = 1

--任务归类
x210207_g_MissionKind = 13

--衅ng c nhi甿 v� 
x210207_g_MissionLevel = 2

--喧ng否喧ngTinh英任务
x210207_g_IfMissionElite = 0

--下面几项喧ng动态显示to� 鸬 内容,用于T読 任务列表中动态显示任务情况**********************
--任务喧ng否已经完成
x210207_g_IsMissionOkFail = 0		--变量to� 鸬 第0位
x210207_g_Custom	= { {id="秀 li阯 t鴆 疳p 瘊ng 5 c鈛 h鰅 c黙 Ti玭 Long",num=1} }

--以上喧ng动态**************************************************************

--任务名
x210207_g_MissionName="L 馥u h鰅 疳p"
x210207_g_MissionInfo="#{event_dali_0010}"
x210207_g_MissionTarget="Li阯 t鴆 疳p 瘊ng 5 c鈛 h鰅 c黙 #RTi玭 Long #W#{_INFOAIM145,138,2, Ti玭 Long}."
x210207_g_MissionComplete="  Ch鷆 m譶g c醕 h� 疸 qua 鋓 ! S� ti玭 n鄖 ta tg cho c醕 h� 瓞 h鄋h t giang h�."
x210207_g_MoneyBonus=2010
x210207_g_SignPost = {x = 266, z = 234, tip = "Ti玭 Long"}
x210207_g_ItemBonus={{id=10110000,num=1}}

--MisDescEnd
--**********************************
--任务入口函数
--**********************************
function x210207_OnDefaultEvent( sceneId, selfId, targetId )
	--如果玩家完成过C醝 n鄖 任务(实际上如果完成了任务这里就不会显示,但喧ng再检测m祎 次比较安全)
    --if IsMissionHaveDone(sceneId,selfId,x210207_g_MissionId) > 0 then
	--	return
	--end
    --如果已接此任务
		if IsHaveMission(sceneId,selfId,x210207_g_MissionId) > 0 then
			misIndex = GetMissionIndexByID(sceneId,selfId,x210207_g_MissionId)
			num = GetMissionParam(sceneId,selfId,misIndex,1)
			if num < 1 then
				CallScriptFunction( 311100, "OnDefaultEvent",sceneId, selfId, targetId )
			else
				--发送任务需求to� 鸬 信息
				BeginEvent(sceneId)
				AddText(sceneId,x210207_g_MissionName)
				AddText(sceneId,x210207_g_MissionComplete)
				AddMoneyBonus( sceneId, x210207_g_MoneyBonus )
				EndEvent( )
				bDone = x210207_CheckSubmit( sceneId, selfId )
				DispatchMissionDemandInfo(sceneId,selfId,targetId,x210207_g_ScriptId,x210207_g_MissionId,bDone)
			end
		--Th鯽 m鉵任务接收条件
		elseif x210207_CheckAccept(sceneId,selfId) > 0 then
			--发送任务Ti猵 th毕允総o� 鸬 信息
			BeginEvent(sceneId)
				AddText(sceneId,x210207_g_MissionName)
				AddText(sceneId,x210207_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}")
				AddText(sceneId,x210207_g_MissionTarget)
				for i, item in x210207_g_ItemBonus do
					AddItemBonus( sceneId, item.id, item.num )
				end
				AddMoneyBonus( sceneId, x210207_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x210207_g_ScriptId,x210207_g_MissionId)
		end
end

--**********************************
--列举事件
--**********************************
function x210207_OnEnumerate( sceneId, selfId, targetId )
    --如果玩糾祎 刮赐瓿缮蟤祎 c醝任务
    if 	IsMissionHaveDone(sceneId,selfId,x210207_g_MissionIdPre) <= 0 then
    	return
    end
    --如果玩家完成过C醝 n鄖 任务
    if IsMissionHaveDone(sceneId,selfId,x210207_g_MissionId) > 0 then
    	return
	end
    --如果已接此任务
	if IsHaveMission(sceneId,selfId,x210207_g_MissionId) > 0 then
		AddNumText(sceneId,x210207_g_ScriptId,x210207_g_MissionName,2,-1);
	--Th鯽 m鉵任务接收条件
	elseif x210207_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x210207_g_ScriptId,x210207_g_MissionName,1,-1);
	end
end

--**********************************
--检测Ti猵 th跫�
--**********************************
function x210207_CheckAccept( sceneId, selfId )
	--C 1c才能接
	if GetLevel( sceneId, selfId ) >= 2 then
		return 1
	else
		return 0
	end
end

--**********************************
--Ti猵 th�
--**********************************
function x210207_OnAccept( sceneId, selfId, targetId )
	--加入任务到玩家列表
	AddMission( sceneId,selfId, x210207_g_MissionId, x210207_g_ScriptId, 0, 0, 0 )
	CallScriptFunction( 311100, "OnDefaultEvent",sceneId, selfId, targetId )
	Msg2Player(  sceneId, selfId,"#YNh nhi甿 v�#W: l tr� l秈 1",MSG2PLAYER_PARA )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, x210207_g_SignPost.x, x210207_g_SignPost.z, x210207_g_SignPost.tip )
end

--**********************************
--放弃
--**********************************
function x210207_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应to� 鸬 任务
    DelMission( sceneId, selfId, x210207_g_MissionId )
	CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x210207_g_SignPost.tip )
end

--**********************************
--继续
--**********************************
function x210207_OnContinue( sceneId, selfId, targetId )
	--提交任务时to� 鸬 � 餴琺餍畔�
    BeginEvent(sceneId)
		AddText(sceneId,x210207_g_MissionName)
		AddText(sceneId,x210207_g_MissionComplete)
		AddMoneyBonus( sceneId, x210207_g_MoneyBonus )
		for i, item in x210207_g_ItemBonus do
			AddItemBonus( sceneId, item.id, item.num )
		end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x210207_g_ScriptId,x210207_g_MissionId)
end

--**********************************
--检测喧ng否可以提交
--**********************************
function x210207_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x210207_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	misIndex = GetMissionIndexByID(sceneId,selfId,x210207_g_MissionId)
	num = GetMissionParam(sceneId,selfId,misIndex,1)
	if num < 1 then
		return 0
	else
		return 1
	end
end

--**********************************
--提交
--**********************************
function x210207_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x210207_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
    	BeginAddItem(sceneId)
			for i, item in x210207_g_ItemBonus do
				AddItem( sceneId, item.id, item.num )
			end
		ret = EndAddItem(sceneId,selfId)
		if ret > 0 then
			AddMoney(sceneId,selfId,x210207_g_MoneyBonus );
			LuaFnAddExp(sceneId, selfId,100)
			ret = DelMission( sceneId, selfId, x210207_g_MissionId )
			if ret > 0 then
				MissionCom( sceneId, selfId, x210207_g_MissionId )
				AddItemListToHuman(sceneId,selfId)
				Msg2Player(  sceneId, selfId,"#YHo鄋 t nhi甿 v�#W: l tr� l秈 1",MSG2PLAYER_PARA )
				CallScriptFunction( 210208, "OnDefaultEvent",sceneId, selfId, targetId)
			end
		else
			BeginEvent(sceneId)
				strText = "Kh鬾g th� Ho鄋 t nhi甿 v�"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x210207_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--进入区域事件
--**********************************
function x210207_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x210207_OnItemChanged( sceneId, selfId, itemdataId )
end
