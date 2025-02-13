--捉珍兽任务

--************************************************************************
--MisDescBegin

--脚本号
x210221_g_ScriptId = 210221

--上m祎 c醝任务to� 鸬 ID
x210221_g_MissionIdPre = 700

--任务号
x210221_g_MissionId = 701

--M鴆 ti陁 nhi甿 v鴑pc
x210221_g_Name	="V鈔 Phi陁 Phi陁"

--任务归类
x210221_g_MissionKind = 13

--衅ng c nhi甿 v� 
x210221_g_MissionLevel = 7

--喧ng否喧ngTinh英任务
x210221_g_IfMissionElite = 0

--********下面几项喧ng动态显示to� 鸬 内容,用于T読 任务列表中动态显示任务情况******
--任务喧ng否已经完成
x210221_g_IsMissionOkFail = 0		--变量to� 鸬 第0位
--**********************************以上喧ng动态****************************

--任务文本描述
x210221_g_MissionName="B 疬㧟 tr鈔 th� r癷"
x210221_g_MissionInfo="#{event_dali_0029}"  --任务描述
x210221_g_MissionTarget="#{event_dali_0030}"		--M鴆 ti陁 nhi甿 v�
x210221_g_ContinueInfo="C醕 h� 疸 b 疬㧟 v竧 con r癷?"		--未Ho鄋 t nhi甿 v鴗o� 鸬 npc对话
x210221_g_MissionComplete="#{event_dali_0031}"					--Ho鄋 t nhi甿 v鴑pc说话to� 鸬 话
x210221_g_SignPost = {x = 275, z = 50, tip = "Ho鄋g Mi T錸g"}

--任务奖励
x210221_g_MoneyBonus=20

--MisDescEnd
--************************************************************************

--角色Mission变量� 餴琺�
x210221_g_Param_ok=0	--0号: 当前任务喧ng否完成(0未完成；1完成)
--1号: 未用
--2号: 未用
--3号: 未用
--4号: 未用
--5号: 未用
--6号: 未用
--7号: 未用
x210221_g_PetDataID=558	--任务珍兽to� 鸬 编号


--任务入口函数
--**********************************
function x210221_OnDefaultEvent( sceneId, selfId, targetId )	-- 餴琺击该任务后执行此脚本
	if IsHaveMission(sceneId,selfId,x210221_g_MissionId) > 0 then	--如果已接此任务
		--发送任务需求to� 鸬 信息
		BeginEvent(sceneId)
			AddText(sceneId,x210221_g_MissionName)
			AddText(sceneId,x210221_g_ContinueInfo)
			AddMoneyBonus( sceneId, x210221_g_MoneyBonus )
		EndEvent( )
		bDone = x210221_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x210221_g_ScriptId,x210221_g_MissionId,bDone)
	elseif x210221_CheckAccept(sceneId,selfId) > 0 then		--Th鯽 m鉵任务接收条件
		--发送任务Ti猵 th毕允総o� 鸬 信息
			BeginEvent(sceneId)
				AddText(sceneId,x210221_g_MissionName)
				AddText(sceneId,x210221_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}")
				AddText(sceneId,x210221_g_MissionTarget)
				--for i, item in g_ItemBonus do
				--	AddItemBonus( sceneId, item.id, item.num )
				--end
				AddMoneyBonus( sceneId, x210221_g_MoneyBonus )
				EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x210221_g_ScriptId,x210221_g_MissionId)
	end
end

--**********************************
--列举事件
--**********************************
function x210221_OnEnumerate( sceneId, selfId, targetId )
    --如果玩糾祎 刮赐瓿缮蟤祎 c醝任务
    if 	IsMissionHaveDone(sceneId,selfId,x210221_g_MissionIdPre) <= 0 then
    	return
    end
    --如果玩家完成过C醝 n鄖 任务
	if IsMissionHaveDone(sceneId,selfId,x210221_g_MissionId) > 0 then
		return
	end
    if IsHaveMission(sceneId,selfId,x210221_g_MissionId) > 0 then
			AddNumText(sceneId,x210221_g_ScriptId,x210221_g_MissionName,2,-1);
		--Th鯽 m鉵任务接收条件
	elseif x210221_CheckAccept(sceneId,selfId) > 0 then
			AddNumText(sceneId,x210221_g_ScriptId,x210221_g_MissionName,1,-1);
	end
end

--**********************************
--检测Ti猵 th跫�
--**********************************
function x210221_CheckAccept( sceneId, selfId )
	--接收条件
	if GetLevel( sceneId, selfId ) >= x210221_g_MissionLevel then
		return 1
	else
		return 0
	end
end

--**********************************
--Ti猵 th�
--**********************************
function x210221_OnAccept( sceneId, selfId )
	--加入任务到玩家列表
	AddMissionEx( sceneId,selfId, x210221_g_MissionId, x210221_g_ScriptId )		--添加任务
	SetMissionEvent(sceneId,selfId, x210221_g_MissionId,3)	--设置任务事件,3表示珍兽变化事件

	misIndex = GetMissionIndexByID(sceneId,selfId,x210221_g_MissionId)	-- 餴琺到任务to� 鸬 序列号
	SetMissionByIndex(sceneId,selfId,misIndex,x210221_g_Param_ok,0)	--根据序列号把任务变量to� 鸬 第0位置0
	Msg2Player(  sceneId, selfId,"#YNh nhi甿 v�#W: B tr鈔 th�",MSG2PLAYER_PARA )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, x210221_g_SignPost.x, x210221_g_SignPost.z, x210221_g_SignPost.tip )
end

--**********************************
--放弃
--**********************************
function x210221_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应to� 鸬 任务
    DelMission( sceneId, selfId, x210221_g_MissionId )
	petcount = LuaFnGetPetCount(sceneId, selfId) --取 餴琺珍兽数量
	for	i=0,petcount-1 do
		petdataid = LuaFnGetPet_DataID(sceneId, selfId, i) --取 餴琺珍兽编号
		if petdataid==x210221_g_PetDataID then
			LuaFnDeletePet(sceneId, selfId, i)
		end
	end
	CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x210221_g_SignPost.tip )
end

--**********************************
--继续
--**********************************
function x210221_OnContinue( sceneId, selfId, targetId )
	--提交任务时to� 鸬 � 餴琺餍畔�
    BeginEvent(sceneId)
		AddText(sceneId,x210221_g_MissionName)
		AddText(sceneId,x210221_g_MissionComplete)
		AddMoneyBonus( sceneId, x210221_g_MoneyBonus )
		--for i, item in g_ItemBonus do
		--	AddItemBonus( sceneId, item.id, item.num )
		--end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x210221_g_ScriptId,x210221_g_MissionId)
end

--**********************************
--检测喧ng否可以提交
--**********************************
function x210221_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x210221_g_MissionId )
	if bRet ~= 1 then
		return 0
	end
	
	-- 检查玩家身上喧ng不喧ng有这样to� 鸬 宠物
	local nPetCount = LuaFnGetPetCount(sceneId, selfId)
	
	for i=0, nPetCount-1  do
		local nPetId = LuaFnGetPet_DataID(sceneId, selfId, i)
		
		if nPetId==558   then
			return 1
		end
	end

	return 0
end

--**********************************
--提交
--**********************************
function x210221_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	--
	if x210221_CheckSubmit( sceneId, selfId ) < 1  then
		return
	end	
	
--	local ret1 = LuaFnDeletePet(sceneId, selfId, selectRadioId ) --删除珍兽
--	if ret1 > 0 then
		local ret0 = DelMission( sceneId, selfId, x210221_g_MissionId ) --删除任务
		if ret0>0  then
			AddMoney(sceneId,selfId,x210221_g_MoneyBonus );
			LuaFnAddExp( sceneId, selfId,700)
			MissionCom( sceneId,selfId, x210221_g_MissionId )
			Msg2Player(  sceneId, selfId,"#YHo鄋 t nhi甿 v�#W: B tr鈔 th�",MSG2PLAYER_PARA )
			CallScriptFunction( 210223, "OnDefaultEvent",sceneId, selfId, targetId)
			BeginEvent(sceneId)
				strText = "Ho鄋 t nhi甿 v�: B 疬㧟 tr鈔 th�"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
--	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x210221_OnKillObject( sceneId, selfId, objdataId, objId )
end

--**********************************
--进入区域事件
--**********************************
function x210221_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x210221_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--珍兽改变
--**********************************
function x210221_OnPetChanged( sceneId, selfId, petdataId )
	if petdataId==x210221_g_PetDataID then --喧ng任务珍兽
		misIndex = GetMissionIndexByID(sceneId,selfId,x210221_g_MissionId)	-- 餴琺到任务to� 鸬 序列号
		SetMissionByIndex(sceneId,selfId,misIndex,x210221_g_Param_ok,1)	--根据序列号把任务变量to� 鸬 第0位置1

		BeginEvent(sceneId)
			strText = "B 疬㧟 tr鈔 th� r癷, ho鄋 t nhi甿 v�!"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	end
end

--**********************************
--玩家提交to� 鸬 物品及珍兽
--**********************************
function x210221_OnMissionCheck( sceneId, selfId, npcid, scriptId, index1, index2, index3, indexpet )
end

--**********************************
--玩家提交to� 鸬 物品及珍兽
--**********************************
function x210221_OnMissionCheck( sceneId, selfId, npcid, scriptId, index1, index2, index3, indexpet )
	
end
