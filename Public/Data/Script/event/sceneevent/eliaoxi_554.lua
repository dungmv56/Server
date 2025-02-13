--Li陁 T鈟 重建牧场
--MisDescBegin
--脚本号
x212108_g_ScriptId = 212108

--任务号
x212108_g_MissionId = 554

--任务归类
x212108_g_MissionKind = 32

--衅ng c nhi甿 v� 
x212108_g_MissionLevel = 78

--喧ng否喧ngTinh英任务
x212108_g_IfMissionElite = 0

--下面几项喧ng动态显示to� 鸬 内容,用于T読 任务列表中动态显示任务情况**********************
--任务喧ng否已经完成
x212108_g_IsMissionOkFail = 0		--变量to� 鸬 第0位

--以上喧ng动态**************************************************************

--任务C  餴琺到to� 鸬 物品
--x212108_g_DemandItem={{id=40002112,num=1}}		--变量第1位

--任务文本描述
x212108_g_MissionName="X鈟 d駈g l読 trang tr読"
x212108_g_MissionInfo="#{Lua_liaoxi_002}"
x212108_g_MissionTarget="  T靘 th 10 vi阯 H鄋 thi猼 kho醤g th誧h, 10 vi阯 Kim kho醤g th誧h v� 10 鸢ng v鄋g, h銀 trao ch鷑g cho #RGia Lu Kim #W � #GLi陁 T鈟 Qu鋘g Ninh Tr #W#{_INFOAIM170,206,21, Gia Lu Kim}. "
x212108_g_ContinueInfo="  C醕 h� 疸 t靘 瘘 nguy阯 li畊 ch遖 ?"
x212108_g_MissionComplete="  衋 t� ng呓i 疸 gi鷓 疝, 瘙i khi tr読 ch錸 nu鬷 疬㧟 x鈟 d駈g l読, nh 鸶nh ta s� 疸i ng呓i m髇 s鎍 d� t呓i nh v� m髇 th竧 n呔ng th絤 ngon nh"

x212108_g_DemandItem={{id=20103004,num=10},{id=20103005,num=10}}		--从背包中计算

--奖励
x212108_g_MoneyBonus=46000
x212108_g_Exp = 65000
--x212108_g_ItemBonus={{id=10401031,num=1}}

x212108_g_RadioItemBonus={{id=10405067 ,num=1},{id=10401067,num=1},{id=10400068,num=1}}


--MisDescEnd
--**********************************
--任务入口函数
--**********************************
function x212108_OnDefaultEvent( sceneId, selfId, targetId )
	
	--如果已接此任务
	if IsMissionHaveDone( sceneId, selfId, x212108_g_MissionId ) > 0 then
		return 
	elseif IsHaveMission(sceneId,selfId,x212108_g_MissionId) > 0 then
--		if GetName(sceneId,targetId) == x212108_g_Name then
			--发送交任务前to� 鸬 需求信息
			BeginEvent(sceneId)
				AddText(sceneId,x212108_g_MissionName);
				AddText(sceneId,x212108_g_ContinueInfo);
			EndEvent(sceneId)
    		done = x212108_CheckSubmit( sceneId, selfId );
			DispatchMissionDemandInfo(sceneId,selfId,targetId,x212108_g_ScriptId,x212108_g_MissionId,done)
--		end
	--Th鯽 m鉵任务接收条件
	elseif GetLevel( sceneId, selfId ) >= 78 then
	
		--发送任务Ti猵 th毕允総o� 鸬 信息
		BeginEvent(sceneId)
			AddText(sceneId,x212108_g_MissionName);
			AddText(sceneId,x212108_g_MissionInfo);
			AddText(sceneId,"#{M_MUBIAO}");
			AddText(sceneId,x212108_g_MissionTarget);
			AddMoneyBonus( sceneId, x212108_g_MoneyBonus )
			for i, item in x212108_g_RadioItemBonus do
				AddRadioItemBonus( sceneId, item.id, item.num )
			end
		EndEvent(sceneId)
		DispatchMissionInfo(sceneId,selfId,targetId,x212108_g_ScriptId,x212108_g_MissionId)

	end
end

--**********************************
--列举事件
--**********************************
function x212108_OnEnumerate( sceneId, selfId, targetId )

	if IsMissionHaveDone( sceneId, selfId, x212108_g_MissionId ) > 0 then
		return 

	elseif IsHaveMission(sceneId,selfId,x212108_g_MissionId) > 0 then
		AddNumText(sceneId, x212108_g_ScriptId,x212108_g_MissionName, 2, -1)

	--Th鯽 m鉵任务接收条件
	elseif x212108_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x212108_g_MissionName then
			AddNumText(sceneId, x212108_g_ScriptId, x212108_g_MissionName, 1, -1);
		end
	end

end

--**********************************
--检测触发条件
--**********************************
function x212108_CheckAccept( sceneId, selfId )
	--C 60c才能接
	if GetLevel( sceneId, selfId ) >= 78 then
		return 1
	else
		return 0
	end
end

--**********************************
--Ti猵 th�
--**********************************
function x212108_OnAccept( sceneId, selfId )

	-- 检测玩家喧ng不喧ng已经完成过C醝 n鄖 任务
	if IsMissionHaveDone(sceneId, selfId, x212108_g_MissionId) > 0   then
		return
	end
	
	if x212108_CheckAccept(sceneId, selfId)  <= 0   then
		return
	end

	--加入任务到玩家列表
	local ret = AddMission( sceneId,selfId, x212108_g_MissionId, x212108_g_ScriptId, 0, 0, 0 )
	-- C 考虑玩家喧ng不喧ng能够Ti猵 th紺醝 n鄖 任务
	if ret <= 0      then
		Msg2Player(  sceneId, selfId,"#YNh k� nhi甿 v� c黙 c醕 h� 疸 馥y" , MSG2PLAYER_PARA )
		return
	end

	misIndex = GetMissionIndexByID(sceneId,selfId,x212108_g_MissionId)			-- 餴琺到任务to� 鸬 序列号
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)		--根据序列号把任务变量to� 鸬 第0位置1 (任务完成情况)
	
	-- 消息通知客户端
	Msg2Player(  sceneId, selfId,"#YTi猵 nh#W ".. x212108_g_MissionName, MSG2PLAYER_PARA )
	
	SetMissionEvent(sceneId, selfId, x212108_g_MissionId, 2)
	
	BeginEvent(sceneId)
		strText = "#YTi猵 nh#W ".. x212108_g_MissionName
		AddText(sceneId,strText);
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
end

--**********************************
--放弃
--**********************************
function x212108_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应to� 鸬 任务
	DelMission( sceneId, selfId, x212108_g_MissionId )
	
end

--**********************************
--已经接了任务再给出to� 鸬 提示
--**********************************
function x212108_OnContinue( sceneId, selfId, targetId )
	--提交任务时to� 鸬 � 餴琺餍畔�
	BeginEvent(sceneId)
		AddText(sceneId,x212108_g_MissionName)
		AddText(sceneId,x212108_g_MissionComplete)
		AddMoneyBonus( sceneId, x212108_g_MoneyBonus )
		for i, item in x212108_g_RadioItemBonus do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
	EndEvent(sceneId)
	DispatchMissionContinueInfo(sceneId,selfId,targetId,x212108_g_ScriptId,x212108_g_MissionId)
end

--**********************************
--检测喧ng否可以提交
--**********************************
function x212108_CheckSubmit( sceneId, selfId )
	--检测看玩家身上喧ng不喧ng够了这些物品
	if  GetItemCount( sceneId, selfId, 20103005 ) < 10   then
		return 0
	end
	
	if  GetItemCount( sceneId, selfId, 20103004 ) < 10   then
		return 0
	end
	
	if  GetMoney(sceneId, selfId)  < 100000   then 
		return 0
	end
	
	return 1
end

--**********************************
--提交(完成)
--**********************************
function x212108_OnSubmit( sceneId, selfId,targetId,selectRadioID )
	-- 安全性检测
	-- 1、检测玩家喧ng不喧ng有C醝 n鄖 任务
	if IsHaveMission(sceneId,selfId,x212108_g_MissionId) <= 0 then
		return
	end
	-- 2、其他检测
	if x212108_CheckSubmit( sceneId, selfId )  <= 0  then
		return
	end
	
	--检测钱喧ng不喧ng还够扣
	if  GetMoney(sceneId, selfId)  < 100000  then
		return
	end
	
	--检查材料喧ng不喧ng还T読 
	if  GetItemCount( sceneId, selfId, 20103005 ) < 10   then
		return 
	end
	
	if  GetItemCount( sceneId, selfId, 20103004 ) < 10   then
		return 
	end
	
	
	BeginAddItem(sceneId)
		for i, item in x212108_g_RadioItemBonus do
			if item.id == selectRadioID then
				AddItem( sceneId,item.id, item.num )
			end
		end
		
	ret = EndAddItem(sceneId,selfId)
	--添加任务奖励
	if ret > 0 then		
		--销毁材料
		DelItem( sceneId, selfId, 20103005, 10 )
		DelItem( sceneId, selfId, 20103004, 10 )
		
		AddExp(sceneId,selfId,x212108_g_Exp)
		
		--扣钱咯
		CostMoney(sceneId,selfId, 100000)

		--给钱
		AddMoney(sceneId,selfId,x212108_g_MoneyBonus );
				
		ret = DelMission( sceneId, selfId, x212108_g_MissionId )
		if ret > 0 then
			MissionCom( sceneId, selfId, x212108_g_MissionId )
				AddItemListToHuman(sceneId,selfId)
		end
	else
	--任务奖励没有加成功
		BeginEvent(sceneId)
			strText = "Kh鬾g th� Ho鄋 t nhi甿 v�"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x212108_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--进入区域事件
--**********************************
function x212108_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x212108_OnItemChanged( sceneId, selfId, itemdataId )

	if itemdataId == 20103005  then		-- 金矿石
		--  鹫t 疬㧟玩家身上有to� 鸬  金矿石 to� 鸬 数量,如果小鱼＝10 ,就提示
		if  GetItemCount( sceneId, selfId, 20103005 ) <= 10   then
			BeginEvent(sceneId)
				strText = "姓t 疬㧟 Kim kho醤g th誧h: " .. tostring(GetItemCount( sceneId, selfId, 20103005 )) .. "/10"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
	end
	
	if itemdataId == 20103004  then		-- 寒铁矿石
		--  鹫t 疬㧟玩家身上有to� 鸬  寒铁矿石 to� 鸬 数量,如果小鱼＝10 ,就提示
		if  GetItemCount( sceneId, selfId, 20103004 ) <= 10   then
			BeginEvent(sceneId)
				strText = "姓t 疬㧟 H鄋 Thi猼 kho醤g th誧h: " .. tostring(GetItemCount( sceneId, selfId, 20103004 )) .. "/10"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
	end

end

