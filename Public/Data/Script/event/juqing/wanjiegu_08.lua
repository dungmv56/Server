
-- 再T読 副本内完成杀怪任务

--************************************************************************
--MisDescBegin
--脚本号
x200008_g_ScriptId = 200008

--副本名称
x200008_g_CopySceneName="V課 Ki猵 C痗"

--任务号
x200008_g_MissionId = 8
--任务号
x200008_g_PreMissionId = 7

--目标NPC
x200008_g_Name = "衞鄋 Ch韓h Minh"

--喧ng否喧ngTinh英任务
x200008_g_IfMissionElite = 1

--任务归类
x200008_g_MissionKind = 51

--衅ng c nhi甿 v� 
x200008_g_MissionLevel = 20

--任务文本描述
x200008_g_MissionName="H� khi猽 long ng鈓"
x200008_g_MissionInfo="#{Mis_juqing_0008}"
x200008_g_MissionTarget="#{Mis_juqing_Tar_0008}"
x200008_g_MissionComplete="  T痶 qu�, 餫 t� 絥 gi鷓 疝, t� nay 姓i L� Qu痗 coi ng呓i nh� qu� kh醕h, d鵱g l� ti猼 cao nh tr鱪g 疸i ng呓i!"
x200008_g_MissionContinue="  Ng呓i 疸 c製 疬㧟 D� Nhi ch遖?"

x200008_g_MoneyBonus=21600
x200008_g_exp=24000

x200008_g_RadioItemBonus={{id=10423001 ,num=1},{id=10423002,num=1},{id=10423003,num=1},{id=10423004,num=1}}

x200008_g_Custom	= { {id="秀 c製 tho醫 衞鄋 D�",num=1} }

--MisDescEnd
--************************************************************************

--**********************************
--任务入口函数
--**********************************
function x200008_OnDefaultEvent( sceneId, selfId, targetId )
	
	if GetNumText() == 888   then
		-- 检测玩家身上喧ng不喧ng有钥匙
		if  GetItemCount( sceneId, selfId, 40001001 ) > 0   then
			-- C 创建衞鄋 D癯隼� 439
			local nMonsterNum = GetMonsterCount(sceneId)
	
			local ii = 0
			local bHaveMonster = 0
			local bHave=0
			for ii=0, nMonsterNum-1 do
				local nMonsterId = GetMonsterObjID(sceneId,ii)
			
				if GetName(sceneId, nMonsterId)  == "衞鄋 D�"  then
					bHave = 1
				end
			end
			
			if bHave == 0  then
				local nNpcId = LuaFnCreateMonster(sceneId, 439, 51, 90, 3, 0, 118020)
				SetCharacterName(sceneId, nNpcId, "衞鄋 D�")
			end
			
			-- 设置任务完成标志,删除钥匙,
			local misIndex = GetMissionIndexByID(sceneId,selfId,x200008_g_MissionId)
			SetMissionByIndex(sceneId,selfId,misIndex,0,1)
			DelItem( sceneId, selfId, 40001001, 1 )
			
			BeginUICommand(sceneId)
			EndUICommand(sceneId)
			DispatchUICommand(sceneId,selfId, 1000)

		end
		return
	end
	
	--如果已接此任务
	if IsHaveMission(sceneId,selfId,x200008_g_MissionId) > 0 then
		--发送任务需求to� 鸬 信息
		BeginEvent(sceneId)
			AddText(sceneId,x200008_g_MissionName)
			AddText(sceneId,x200008_g_MissionContinue)
			--AddMoneyBonus( sceneId, x200008_g_MoneyBonus )
		EndEvent( )
		bDone = x200008_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x200008_g_ScriptId,x200008_g_MissionId,bDone)
    --Th鯽 m鉵任务接收条件
  elseif x200008_CheckAccept(sceneId,selfId) > 0 then
		--发送任务Ti猵 th毕允総o� 鸬 信息
		BeginEvent(sceneId)
			AddText(sceneId,x200008_g_MissionName)
			AddText(sceneId,x200008_g_MissionInfo)
			AddText(sceneId, "#{M_MUBIAO}#r")
			AddText(sceneId,x200008_g_MissionTarget)
			AddText(sceneId,"#{M_SHOUHUO}#r")
			AddMoneyBonus( sceneId, x200008_g_MoneyBonus )
			for i, item in x200008_g_RadioItemBonus do
				AddRadioItemBonus( sceneId, item.id, item.num )
			end
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x200008_g_ScriptId,x200008_g_MissionId)
  end

end

--**********************************
--列举事件
--**********************************
function x200008_OnEnumerate( sceneId, selfId, targetId )
	if GetName(sceneId, targetId) == "V課 Ki猵 C痗 Th誧h c鋗 疬絥g"   then
		-- 检测玩家身上喧ng不喧ng有钥匙,
		if  GetItemCount( sceneId, selfId, 40001001 ) > 0   then
			AddNumText(sceneId,x200008_g_ScriptId,"M� c豠 th誧h m鬾",6,888);
		end
		return
	end
	
  --如果玩家完成过C醝 n鄖 任务
  if IsMissionHaveDone(sceneId,selfId,x200008_g_MissionId) > 0 then
		return
	end
    --如果已接此任务
	if IsHaveMission(sceneId,selfId,x200008_g_MissionId) > 0 then
		AddNumText(sceneId,x200008_g_ScriptId,x200008_g_MissionName,2,-1);
		--Th鯽 m鉵任务接收条件
	elseif x200008_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x200008_g_ScriptId,x200008_g_MissionName,1,-1);
	end

end

--**********************************
--检测Ti猵 th跫�
--**********************************
function x200008_CheckAccept( sceneId, selfId )
	--C 4c才能接
	if GetLevel( sceneId, selfId ) < 20 then
		return 0
	end
	
	if IsMissionHaveDone(sceneId,selfId,x200008_g_PreMissionId) < 1 then
		return 0
	end
	
	return 1
end

--**********************************
--Ti猵 th�
--**********************************
function x200008_OnAccept( sceneId, selfId )
	--加入任务到玩家列表
	local ret = AddMission( sceneId,selfId, x200008_g_MissionId, x200008_g_ScriptId, 0, 0, 0 )
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#YNh k� nhi甿 v� c黙 c醕 h� 疸 馥y" , MSG2PLAYER_PARA )
		return
	end

	local misIndex = GetMissionIndexByID(sceneId,selfId,x200008_g_MissionId)			-- 餴琺到任务to� 鸬 序列号
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)						--根据序列号把任务变量to� 鸬 第0位置0
	SetMissionByIndex(sceneId,selfId,misIndex,1,0)						--根据序列号把任务变量to� 鸬 第1位置0
	Msg2Player(  sceneId, selfId,"#YNh nhi甿 v�#W: H� khi猽 long ng鈓",MSG2PLAYER_PARA )
	
	-- 接任务后,把相关to� 鸬 怪设置为可以Cu礳 chi猲 
	-- C 遍历所有to� 鸬 怪,改变他们to� 鸬 阵营
	local nMonsterNum = GetMonsterCount(sceneId)
	
	local ii = 0
	local bHaveMonster = 0
	for ii=0, nMonsterNum-1 do
		local nMonsterId = GetMonsterObjID(sceneId,ii)
		
		if GetName(sceneId, nMonsterId)  == "衞鄋 Di阯 Kh醤h"  then
			SetUnitReputationID(sceneId, selfId, nMonsterId, 29)
			SetNPCAIType(sceneId, nMonsterId, 1)
		end
	end
	
	-- 设置任务关系to� 鸬 事件
	SetMissionEvent(sceneId, selfId, x200008_g_MissionId, 0)
	SetMissionEvent(sceneId, selfId, x200008_g_MissionId, 2)

end

--**********************************
--放弃
--**********************************
function x200008_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应to� 鸬 任务
  DelMission( sceneId, selfId, x200008_g_MissionId )
--	CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x200008_g_SignPost.tip )
	DelItem( sceneId, selfId, 40001001, 1 )
end

--**********************************
--继续
--**********************************
function x200008_OnContinue( sceneId, selfId, targetId )
	--提交任务时to� 鸬 � 餴琺餍畔�
    BeginEvent(sceneId)
		AddText(sceneId,x200008_g_MissionName)
		AddText(sceneId,x200008_g_MissionComplete)
		AddMoneyBonus( sceneId, x200008_g_MoneyBonus )
		for i, item in x200008_g_RadioItemBonus do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x200008_g_ScriptId,x200008_g_MissionId)
end

--**********************************
--检测喧ng否可以提交
--**********************************
function x200008_CheckSubmit( sceneId, selfId )

	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x200008_g_MissionId )
	if bRet ~= 1 then
		return 0
	end
	local misIndex = GetMissionIndexByID(sceneId,selfId,x200008_g_MissionId)
	
	local Kill1 = GetMissionParam(sceneId,selfId,misIndex,0)

	if Kill1~=1 			then
		return 0
	end

	return 1
end

--**********************************
--提交
--**********************************
function x200008_OnSubmit( sceneId, selfId, targetId,selectRadioId )

	if x200008_CheckSubmit(sceneId, selfId) ~= 1   then
		return
	end

	BeginAddItem(sceneId)
	for i, item in x200008_g_RadioItemBonus do
		if item.id == selectRadioId then
			AddItem( sceneId,item.id, item.num )
		end
	end
	ret = EndAddItem(sceneId,selfId)
	--添加任务奖励
	if ret < 1 then
		--任务奖励没有加成功
		BeginEvent(sceneId)
			strText = "Kh鬾g th� Ho鄋 t nhi甿 v�"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	AddItemListToHuman(sceneId,selfId)

	AddMoney(sceneId,selfId,x200008_g_MoneyBonus );
	LuaFnAddExp( sceneId, selfId,x200008_g_exp)

	DelMission( sceneId, selfId, x200008_g_MissionId )
	MissionCom( sceneId, selfId, x200008_g_MissionId )
	Msg2Player( sceneId, selfId,"#YHo鄋 t nhi甿 v�#W: H� khi猽 long ng鈓",MSG2PLAYER_PARA )
	
	Msg2Player( sceneId, selfId,"C醕 h� 疸 ho鄋 th鄋h xong m祎 lo誸 nhi甿 v� #GV課 Ki猵 C痗 #W",MSG2PLAYER_PARA )
	local selfGuid = LuaFnObjId2Guid(sceneId, selfId)
	LuaFnSendMailToGUID(sceneId, selfGuid, "C醕 h� 疸 ho鄋 th鄋h xong m祎 lo誸 nhi甿 v� #GV課 Ki猵 C痗 #W. Sau khi 鹫t 疬㧟 c 30, h銀 t緄 th鄋h 姓i L� t靘 Tri畊 Thi阯 S�, M� nhi甿 v� #GY猲 T� � #W")
	
	-- 完成万劫谷剧情,给10 餴琺剧情 餴琺
	local nPoint = GetHumanJuqingPoint(sceneId, selfId)
	SetHumanJuqingPoint(sceneId, selfId, nPoint+10)
	
	-- 通知玩家,可以做剧情循环任务了
	local nPoint = GetHumanJuqingPoint(sceneId, selfId)
	SetHumanJuqingPoint(sceneId, selfId, nPoint+10)

	-- 通知玩家,可以做剧情循环任务了
	-- 您现T読 可以去AA城to� 鸬 [bb,cc]找到DD,Ti猵 th鳧D循环任务.
	local strText1 = "C醕 h� b鈟 gi� c� th� 餴 to� 鸬 [232,227]th鄋h 姓i L� t靘 M礳 Uy琻 Thanh, ti猵 nh M礳 Uy琻 Thanh."
	LuaFnSendSystemMail(sceneId, GetName(sceneId,selfId), strText1)
	
	BeginEvent(sceneId)
		AddText(sceneId,strText1);
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	
end

--**********************************
--杀死怪物或玩家
--**********************************
function x200008_OnKillObject( sceneId, selfId, objdataId ,objId)

	if GetName(sceneId,objId) == "衞鄋 Di阯 Kh醤h"	  then
		local num = GetMonsterOwnerCount(sceneId,objId)
		for j=0,num-1  do
			-- 取 餴琺拥有分配权to� 鸬 人to� 鸬 objId
			local humanObjId = GetMonsterOwnerID(sceneId,objId,j)
			-- 看C醝 n鄖 人喧ng不喧ng有C醝 n鄖 任务
			if IsHaveMission(sceneId, humanObjId, x200008_g_MissionId) > 0 then
				BeginEvent(sceneId)
				AddText(sceneId,"秀 gi猼 ch猼 衞鄋 Di阯 Kh醤h: 1/1");
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,humanObjId)
				AddMonsterDropItem(sceneId,objId,humanObjId,40001001)    --给C醝 n鄖 人任务道具(道具会出现T読 尸体包里)
			end
		end
	end	
end

--**********************************
--进入区域事件
--**********************************
function x200008_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x200008_OnItemChanged( sceneId, selfId, itemdataId )
	if itemdataId == 40001001    then
	 	BeginEvent(sceneId)
			AddText(sceneId, "秀 鹫t 疬㧟 ch靉 kh骯 Th誧h �: 1/1")
	  EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	end
end
