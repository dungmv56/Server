-- 寻找药草样苗任务
--MisDescBegin
-- 脚本号
x600021_g_ScriptId = 600021

--任务号
x600021_g_MissionId = 1108

--M鴆 ti陁 nhi甿 v鴑pc
x600021_g_Name = "M礳 D竎h"

--任务归类
x600021_g_MissionKind = 50

--衅ng c nhi甿 v� 
x600021_g_MissionLevel = 10000

--喧ng否喧ngTinh英任务
x600021_g_IfMissionElite = 0

--下面几项喧ng动态显示to� 鸬 内容,用于T読 任务列表中动态显示任务情况**********************
x600021_g_IsMissionOkFail = 0							-- Nhi甿 v� ho鄋 th鄋h标记

--以上喧ng动态**************************************************************

--任务变量第m祎 位用来存储随机 餴琺到to� 鸬 脚本号

--任务文本描述
x600021_g_MissionName = "Nhi甿 v� th呓ng nghi畃"
x600021_g_MissionInfo = ""												--任务描述
x600021_g_MissionTarget = "    T� %n � 痼 餺誸 l読 %i. "						--M鴆 ti陁 nhi甿 v�
x600021_g_ContinueInfo = "    Nhi甿 v� c黙 c醕 h� v鏽 ch遖 ho鄋 th鄋h �?"					--未Ho鄋 t nhi甿 v鴗o� 鸬 npc对话
x600021_g_SubmitInfo = "    S� t靚h ti猲 tri琻 nh� th� n鄌 r癷?"							--完成未提交时to� 鸬 npc对话
x600021_g_MissionComplete = "    L鄊 t痶 l, r t痶 r t痶. "					--Ho鄋 t nhi甿 v鴑pc说话to� 鸬 话

x600021_g_Parameter_Item_AllRandom = { { id = 6, num = 7 } }

x600021_g_StrForePart = 5

x600021_g_MissionRound = 44

-- 通用Th鄋h ph� 任务脚本
x600021_g_CityMissionScript = 600001
x600021_g_MarketScript = 600017

--任务奖励

--MisDescEnd

x600021_g_NpcIdx = x600021_g_StrForePart											-- MissionNpc 存储位置
x600021_g_ItemIdx = x600021_g_StrForePart + 1										-- 任务物品to� 鸬 存储位置
x600021_g_ItemCountIdx = x600021_g_StrForePart + 2									-- 任务物品数量to� 鸬 存储位置

-- 随机因子
x600021_g_RandomSeed = 100
-- 掉落几率
x600021_g_DropOdds = 20

x600021_g_missionItemsInfo = {}
x600021_g_missionItemsInfo[20 ] =
{
	[40003089] =
	{ 300219, 300209, 300220, 300221, 300222, 300224, 300223, 300225,
	  300226, 300228, 300227, 300229, 300240, 300241, 300242, 300243,
	  300244, 300246, 300245, 300260, 300247, 300248,
	}
}

x600021_g_missionItemsInfo[30 ] =
{
	[40003089] =
	{ 300261, 300249, 300262, 300263, 300264, 300265, 300266, 300268,
	  300267, 300269, 300272, 300270, 300273, 300271, 300274, 300276,
	  300275, 300278, 300277, 300280, 300279, 300281, 300282, 300284,
	}
}

x600021_g_missionItemsInfo[40 ] =
{
	[40003089] =
	{ 300286, 300283, 300285, 300288, 300287, 300289, 300290, 300291,
	  300292, 300296, 300293, 300294, 300297, 300295, 300298, 300299,
	  300300, 300301, 300302, 300304, 300303, 300305, 300312, 300306,
	}
}

x600021_g_missionItemsInfo[50 ] =
{
	[40003089] =
	{ 300313, 300310, 300307, 300311, 300308, 300314, 300309, 300315,
	  300316, 300317, 300318, 300320, 300322, 300319, 300321, 300323,
	  300324, 300325, 300326, 300327, 300328, 300332, 300330, 300329,
	}
}

x600021_g_missionItemsInfo[60 ] =
{
	[40003089] =
	{ 300333, 300331, 300334, 300336, 300335, 300337, 300338, 300339,
	  300340, 300344, 300342, 300341, 300345, 300343, 300346, 300348,
	  300347, 300349, 300350, 300351, 300352, 300353, 300354, 300356,
	}
}

x600021_g_missionItemsInfo[70 ] =
{
	[40003089] =
	{ 300355, 300358, 300357, 300359, 300360, 300361, 300362, 300363,
	  300364, 300365, 300366, 300368, 300367, 300370, 300369, 300372,
	  300371, 300373, 300374, 300375, 300376, 300380, 300378, 300377,
	}
}

x600021_g_missionItemsInfo[80 ] =
{
	[40003089] =
	{ 300382, 300381, 300379, 300383, 300384, 300385, 300386, 300387,
	  300388, 300392, 300389, 300390, 300394, 300393, 300391, 300395,
	  300396, 300397, 300398, 300400, 300399, 300401, 300404, 300402,
	}
}

x600021_g_missionItemsInfo[90 ] =
{
	[40003089] =
	{ 300405, 300403, 300406, 300408, 300407, 300409, 300410, 300414,
	  300411, 300412, 300416, 300415, 300413, 300417, 300418, 300419,
	  300420, 300422, 300426, 300421, 300423, 300427, 300428, 300424,
	  300429,
	}
}

x600021_g_missionItemsInfo[100] =
{
	[40003089] =
	{ 300425, 300430, 300434, 300431, 300432, 300435, 300436, 300433,
	  300437, 300438, 300439, 300440, 300444, 300441, 300442, 300445,
	  300446, 300443, 300447, 300448, 300449, 300450, 300454, 300451,
	  300452,
	}
}

--**********************************
--任务入口函数
--**********************************
function x600021_OnDefaultEvent( sceneId, selfId, targetId )	-- 餴琺击该任务后执行此脚本
	if GetName( sceneId, targetId ) ~= x600021_g_Name then		--判断该npc喧ng否喧ng对应任务to� 鸬 npc
		return
	end

	--如果已接此任务
	if IsHaveMission( sceneId, selfId, x600021_g_MissionId ) > 0 then
		--发送任务需求to� 鸬 信息
		local bDone = x600021_CheckSubmit( sceneId, selfId )
		local strText

		if bDone == 1 then
			strText = x600021_g_SubmitInfo
		else
			strText = x600021_g_ContinueInfo
		end

		--发送任务需求to� 鸬 信息
		BeginEvent( sceneId )
			AddText( sceneId, x600021_g_MissionName )
			AddText( sceneId, strText )
		EndEvent( )
		DispatchMissionDemandInfo( sceneId, selfId, targetId, x600021_g_ScriptId, x600021_g_MissionId, bDone )
	--Th鯽 m鉵任务接收条件
	elseif x600021_CheckAccept( sceneId, selfId ) > 0 then
		local nTemp = CallScriptFunction( x600021_g_CityMissionScript, "CanDoMisToDay", sceneId, selfId )
		if nTemp == 1   then
			x600021_OnAccept( sceneId, selfId, targetId )
		end
	end
end

--**********************************
--列举事件
--**********************************
function x600021_OnEnumerate( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x600021_g_Name then		--判断该npc喧ng否喧ng对应任务to� 鸬 npc
		return
	end

   --如果已接此任务
	if IsHaveMission( sceneId, selfId, x600021_g_MissionId ) > 0 then
		AddNumText( sceneId, x600021_g_ScriptId, x600021_g_MissionName,3,-1 )
	end
end

--**********************************
--检测Ti猵 th跫�
--**********************************
function x600021_CheckAccept( sceneId, selfId )
	local ret = CallScriptFunction( x600021_g_MarketScript, "CheckAccept", sceneId, selfId )
	return ret
end

--**********************************
--Ti猵 th�
--**********************************
function x600021_OnAccept( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x600021_g_Name then		--判断该npc喧ng否喧ng对应任务to� 鸬 npc
		return
	end

	if GetLevel( sceneId, selfId ) < 40 then
		CallScriptFunction( x600021_g_CityMissionScript, "NotifyFailTips", sceneId, selfId, "Kh鬾g 瘘 鹌ng c" )
		return
	end

	--加入任务到玩家列表
	AddMission( sceneId, selfId, x600021_g_MissionId, x600021_g_ScriptId, 1, 0, 1 )	-- kill、area、item
	if IsHaveMission( sceneId, selfId, x600021_g_MissionId ) <= 0 then
		return
	end

	CallScriptFunction( x600021_g_MarketScript, "OnAccept", sceneId, selfId, targetId, x600021_g_ScriptId )

	local misIndex = GetMissionIndexByID( sceneId, selfId, x600021_g_MissionId )

	-- 找到玩家适合to� 鸬 c别
	local idx, value, level, myLevel
	level = 0
	myLevel = LuaFnGetLevel( sceneId, selfId )

	for idx, value in x600021_g_missionItemsInfo do
		if idx > level and idx <= myLevel then
			level = idx
		end
	end

	local validMissions = x600021_g_missionItemsInfo[level]
	if not validMissions then
		x600021_OnAbandon( sceneId, selfId )
		CallScriptFunction( x600021_g_CityMissionScript, "NotifyFailTips", sceneId, selfId, "Kh鬾g th� t靘 疬㧟 nhi甿 v� th韈h h䅟" )
		return
	end

	local missionArray = {}
	local i = 1

	for idx, value in validMissions do
		missionArray[i] = idx
		i = i + 1
	end

	-- 随机挑出m祎 c醝适用to� 鸬 物品
	local missionItem = missionArray[random( getn(missionArray) )]

	-- 再随机挑出m祎 c醝适用掉落该物品to� 鸬 怪物 NpcId 号
	local missionNpc = validMissions[missionItem][random( getn(validMissions[missionItem]) )]

	local itemCount = 1

	SetMissionByIndex( sceneId, selfId, misIndex, x600021_g_NpcIdx, missionNpc )
	SetMissionByIndex( sceneId, selfId, misIndex, x600021_g_ItemIdx, missionItem )
	SetMissionByIndex( sceneId, selfId, misIndex, x600021_g_ItemCountIdx, itemCount )

	local _, strDemandItemName = GetItemInfoByItemId( missionItem )
	local _, strNpcName, strNpcSceneDesc = GetNpcInfoByNpcId(sceneId, missionNpc )

	--显示内容告诉玩家已经Ti猵 th巳挝�
	BeginEvent( sceneId )
		local missionInfo
		if random(2) == 1 then
			missionInfo = format( "    詎g nh鈔 vi阯 thu chi c黙 B鋘 Th鄋h, khi 餴 qua %s th� b� %s � 痼 t c鬾g, #Y%s#W m t韈h th l� phi玭 to醝 qu�, c醕 h� gi鷓 ta t靘 v� 餴",
				strNpcSceneDesc, strNpcName, strDemandItemName )
		else
			missionInfo = format( "    � %s c� m祎 疳m %s th叨ng xuy阯 t c鬾g ng叨i 餴 疬秐g, h鬽 qua c騨 d醡 鸬ng 皙n c� 鬾g nh鈔 vi阯 thu chi c黙 B鋘 Th鄋h, m� xem, #Y%s#W c鹡g m t韈h r癷, ch� c騨 bi猼 phi玭 c醕 h� th鬷",
				strNpcSceneDesc, strNpcName, strDemandItemName )
		end

		AddText( sceneId, missionInfo )
		AddText( sceneId, "    C醕 h� 疸 nh nhi甿 v�: " .. x600021_g_MissionName )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--放弃
--**********************************
function x600021_OnAbandon( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x600021_g_MissionId ) <= 0 then
		return
	end

	-- 删除物品
	local misIndex = GetMissionIndexByID( sceneId, selfId, x600021_g_MissionId )
	local demandItemId = GetMissionParam( sceneId, selfId, misIndex, x600021_g_ItemIdx )
	local nItemNum = GetItemCount( sceneId, selfId, demandItemId )

	if nItemNum > 0 then
		DelItem( sceneId, selfId, demandItemId, nItemNum )
	end

	--删除玩家任务列表中对应to� 鸬 任务
	CallScriptFunction( x600021_g_MarketScript, "OnAbandon", sceneId, selfId )
end

--**********************************
--继续
--**********************************
function x600021_OnContinue( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, x600021_g_MissionName )
		AddText( sceneId, x600021_g_MissionComplete )
	EndEvent( )
	DispatchMissionContinueInfo( sceneId, selfId, targetId, x600021_g_ScriptId, x600021_g_MissionId )
end

--**********************************
--检测喧ng否可以提交
--**********************************
function x600021_CheckSubmit( sceneId, selfId )
	local ret = CallScriptFunction( x600021_g_MarketScript, "CheckSubmit", sceneId, selfId )

	if ret == 1 then
		local misIndex = GetMissionIndexByID( sceneId, selfId, x600021_g_MissionId )
		local demandItemId = GetMissionParam( sceneId, selfId, misIndex, x600021_g_ItemIdx )
		local demandItemCount = GetMissionParam( sceneId, selfId, misIndex, x600021_g_ItemCountIdx )
		local nItemNum = GetItemCount( sceneId, selfId, demandItemId )

		if nItemNum < demandItemCount then
			ret = 0
		end
	end

	return ret
end

--**********************************
--提交
--**********************************
function x600021_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if GetName( sceneId, targetId ) ~= x600021_g_Name then		--判断该npc喧ng否喧ng对应任务to� 鸬 npc
		return
	end

	if x600021_CheckSubmit( sceneId, selfId ) == 1 then
		-- 扣东西
		local misIndex = GetMissionIndexByID( sceneId, selfId, x600021_g_MissionId )
		local demandItemId = GetMissionParam( sceneId, selfId, misIndex, x600021_g_ItemIdx )
		local demandItemCount = GetMissionParam( sceneId, selfId, misIndex, x600021_g_ItemCountIdx )
		local nItemNum = GetItemCount( sceneId, selfId, demandItemId )

		if nItemNum >= demandItemCount then
			DelItem( sceneId, selfId, demandItemId, demandItemCount )
		else											-- 只作为容错,理论上不可能发生
			SetMissionByIndex( sceneId, selfId, misIndex, x600021_g_IsMissionOkFail, 0 )
			return
		end

		CallScriptFunction( x600021_g_MarketScript, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x600021_OnKillObject( sceneId, selfId, objdataId, objId )	--参数意思: 场景号、玩家objId、怪物表位置号、怪物objId
	local allOwnersCount = GetMonsterOwnerCount( sceneId, objId )		--取 餴琺C醝 n鄖 怪物死后拥有分配权to� 鸬 人数
	local i
	local curOwner
	local misIndex
	local nNpcId
	local strNpcName
	local MonsterName = GetName( sceneId, objId )
	local demandItemId
	local demandItemCount

	for i = 0, allOwnersCount - 1 do
		curOwner = GetMonsterOwnerID( sceneId, objId, i )				--取 餴琺拥有分配权to� 鸬 人to� 鸬 objId
		if IsHaveMission( sceneId, curOwner, x600021_g_MissionId ) > 0 and
		   GetScriptIDByMissionID( sceneId, curOwner, x600021_g_MissionId ) == x600021_g_ScriptId then		--如果C醝 n鄖 人拥有任务
			misIndex = GetMissionIndexByID( sceneId, curOwner, x600021_g_MissionId )
			nNpcId = GetMissionParam( sceneId, curOwner, misIndex, x600021_g_NpcIdx )
			_, strNpcName = GetNpcInfoByNpcId(sceneId, nNpcId )
			demandItemId = GetMissionParam( sceneId, curOwner, misIndex, x600021_g_ItemIdx )
			demandItemCount = GetMissionParam( sceneId, curOwner, misIndex, x600021_g_ItemCountIdx )

			if MonsterName == strNpcName then
			-- m祎 定几率打出任务所需物品
				if GetItemCount( sceneId, curOwner, demandItemId ) < demandItemCount then
					--if random( x600021_g_RandomSeed ) > x600021_g_DropOdds then
						--return
					--end

					AddMonsterDropItem( sceneId, objId, curOwner, demandItemId )
				end
			end
		end
	end
end

--**********************************
--进入区域事件
--**********************************
function x600021_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x600021_OnItemChanged( sceneId, selfId, itemdataId )
	local misIndex = GetMissionIndexByID( sceneId, selfId, x600021_g_MissionId )
	local demandItemId = GetMissionParam( sceneId, selfId, misIndex, x600021_g_ItemIdx )
	local demandItemCount = GetMissionParam( sceneId, selfId, misIndex, x600021_g_ItemCountIdx )
	local nItemNum = GetItemCount( sceneId, selfId, demandItemId )

	if demandItemId == itemdataId then
		local strText = nil
		local _, strItemName = GetItemInfoByItemId( itemdataId )

		if nItemNum >= demandItemCount then
			strText = format( "秀 c� 疬㧟 %s", strItemName )
			SetMissionByIndex( sceneId, selfId, misIndex, x600021_g_IsMissionOkFail, 1 )
		elseif nItemNum > 0 then
			strText = format( "L 疬㧟 %s", strItemName )
		end

		if strText then
			CallScriptFunction( x600021_g_CityMissionScript, "NotifyFailTips", sceneId, selfId, strText )
		end
	end
end
