--Creator 左春伟
--收集签名
----------------
--MisDescBegin
--脚本号
x808038_g_ScriptId = 808038;
--Ti猵 th挝馧PC属性
x808038_g_Position_X=170.5004
x808038_g_Position_Z=122.5593

x808038_g_AccomplishNPC_Name="C黱g Th醝 V鈔"

--任务号
x808038_g_MissionId = 1130;

--M鴆 ti陁 nhi甿 v鴑pc
x808038_g_Name 					= "C黱g Th醝 V鈔"
--任务归类
x808038_g_MissionKind			= 13 --姓i L�
--衅ng c nhi甿 v� 
x808038_g_MissionLevel		= 10000
--喧ng否喧ngTinh英任务
x808038_g_IfMissionElite	= 0
--任务喧ng否已经完成
x808038_g_IsMissionOkFail	= 0		--任务参数to� 鸬 第0位

--任务文本描述
x808038_g_MissionName			= "Thu Th Thi琺 Danh"
--任务描述
x808038_g_MissionInfo			= "Thu th 15 H鉶 H鎢 Thi琺 Danh, sau 痼 皙n C黱g Th醝 V鈔 nh th叻ng!"
--M鴆 ti陁 nhi甿 v�
x808038_g_MissionTarget		= "#{SJQM_8825_20}"
--未Ho鄋 t nhi甿 v鴗o� 鸬 npc对话
x808038_g_ContinueInfo		= "Xem ra ng呓i v鏽 ch遖 ho鄋 th鄋h �!"
--Ho鄋 t nhi甿 v鴑pc说to� 鸬 话
x808038_g_MissionComplete	= "L鄊  t痶 l!"

x808038_g_city 				 	= 1		 --任务参数to� 鸬 第1位

-- 任务完成情况,内容动态刷新,占用任务参数to� 鸬 第1位

x808038_g_Custom	= { {id="秀 thu th H鋙 H鎢 Thi琺 Danh",num=15} }
--MisDescEnd
----------------

--签名录道具ID
x808038_g_SignatureList_id = 40004451; 
--签名道具ID
x808038_g_Signature_id = 40004452; 
--奖励大礼包ID
x808038_g_Gift_id = 30008052; 
--秏祎 唤崩匦D
x808038_g_Impact_id = 47;
--Kinh nghi甿奖励值
x808038_g_Exp_Prize = 
{
18308,19336,20337,21344,22392,23412,24437,25505,26543,27624,  										-- 10->19
56219,58703,61269,63851,66448,68992,71619,74262,76921,79526,											-- 20->29
132458,136815,141197,145491,149923,154380,158861,163253,167784,172339,						-- 30->39
258033,264744,271376,278159,284979,291718,298610,305538,312384,319384,						-- 40->49
326421,333374,340483,347628,354809,361905,369159,376448,383652,391013,						-- 50->59
398411,405722,413192,420699,428117,435695,443310,450835,458522,466245,						-- 60->69
474004,481673,489504,497371,505147,513087,521063,528946,536994,545078,						-- 70->79
553069,561225,569418,577647,585780,594081,602418,610659,619069,627514,						-- 80->89
635862,644380,652934,661390,670016,678678,687241,695975,704745,713552,						-- 90->99
722258,731000,739915,748866,757714,766738,775797,784753,793885,803052,						-- 100->109
812116,821356,830632,839802,849151,858535,867813,877269,886762,896148,						-- 110->119
905712,915314,924806,934479,944189,953789,963570,973388,983242,992985,						-- 120->129
1002911,1012874,1022724,1032759,1042829,1052787,1062930,1073109,1083174,1093425,	-- 130->139
1103713,1113885,1124244,1134640,1144920,1155387,1165892,1176278,1186855,1197467,	-- 140->149
1207961,
}
 
--**********************************
--任务入口函数
--**********************************
function x808038_OnDefaultEvent( sceneId, selfId, targetId )
	local id = GetNumText();
	if id == 1 then 
		BeginEvent(sceneId)
			AddText(sceneId, "#{SJQM_8815_02}");	
			AddNumText(sceneId, x808038_g_ScriptId, "Tham gia ho誸 鸬ng Thu Th Thi琺 Danh", 6, 3);
			AddNumText(sceneId, x808038_g_ScriptId, "斜i ph th叻ng", 6, 4);
			EndEvent()
		DispatchEventList(sceneId, selfId, targetId);
	elseif id == 2 then --帮助
		BeginEvent(sceneId)
			AddText(sceneId, "#{SJQM_8815_08}");
		EndEvent()
		DispatchEventList(sceneId, selfId, targetId);
	elseif id == 3 then --参加活动
		-- 等c>10?
		local lvl = GetLevel(sceneId, selfId);
		if lvl < 10 then
			x808038_ReturnMsg(sceneId, selfId, targetId, "#{SJQM_8815_03}");
			return
		end
		-- 已接签名任务?
		if IsHaveMission(sceneId, selfId, x808038_g_MissionId) > 0 then
			x808038_ReturnMsg(sceneId, selfId, targetId, "#{SJQM_8815_04}");
			return		
		end
		-- Nhi甿 v� qu� h課?
		if IsMissionFull(sceneId, selfId) == 1 then
			x808038_ReturnMsg(sceneId, selfId, targetId, "#{SJQM_8815_05}");
			return			
		end
		-- 背包任务栏有空间?
		if LuaFnGetTaskItemBagSpace(sceneId, selfId) == 0 then
			x808038_ReturnMsg(sceneId, selfId, targetId, "#{SJQM_8815_06}");
			return		
		end
		-- 收到任务
		local ret = AddMission( sceneId,selfId, x808038_g_MissionId, x808038_g_ScriptId, 0, 0, 0 );
		if ret < 1 then
			return
		end	
		-- 条件Th鯽 m鉵,给签名录道具
		ret = TryRecieveItem( sceneId, selfId, x808038_g_SignatureList_id, QUALITY_MUST_BE_CHANGE);
		if ret == -1 then
			return  -- 给道具th b読	
		end	
		--日志
		AuditJoinCollectSignature(sceneId, selfId);
		-- Tr� v畔�
		BeginEvent(sceneId, selfId)
			AddText(sceneId, "#{SJQM_8815_07}");
		EndEvent()
		DispatchEventList(sceneId, selfId, targetId);	
	elseif id == 4 then
		-- 本周兑奖过?
		local weekTime = GetWeekTime();
		local diJiTian = GetTodayWeek();
		if diJiTian == 0 then  -- 星期m祎 作为m祎 周开始
			weekTime = weekTime - 1;
		end
		if GetMissionData(sceneId, selfId, MD_SIGNATURE_GETPRIZE_TIME) == weekTime then
			x808038_ReturnMsg(sceneId, selfId, targetId, "#{SJQM_8815_16}");
			return					
		end
		-- 参加活动了吗?
		if IsHaveMission(sceneId, selfId, x808038_g_MissionId) == 0 then
			x808038_ReturnMsg(sceneId, selfId, targetId, "#{SJQM_8815_17}");
			return		
		end
		-- 够15c醝签名?、
		if GetItemCount(sceneId, selfId, x808038_g_Signature_id) < 15 then
		  x808038_ReturnMsg(sceneId, selfId, targetId, "#{SJQM_8815_18}");
		  return
		end
		-- 上锁?
		if LuaFnGetAvailableItemCount(sceneId, selfId, x808038_g_Signature_id) < 15 then
		  x808038_ReturnMsg(sceneId, selfId, targetId, "#{ResultText_158}");
		  return			
		end
		-- 背包� 鹫o c� 疸 馥y赣锌占�?
		if LuaFnGetPropertyBagSpace(sceneId, selfId) == 0 then
			x808038_ReturnMsg(sceneId, selfId, targetId, "#{SJQM_8819_20}");
			return		
		end
		--扣除签名
		if LuaFnDelAvailableItem(sceneId, selfId, x808038_g_Signature_id, 15) == 0 then
			x808038_ShowMsg(sceneId, selfId, "Kh tr� Thi琺 Danh th b読!");
		  return
		end
		--扣除签名簿
		if LuaFnDelAvailableItem(sceneId, selfId, x808038_g_SignatureList_id, 1) == 0 then
			x808038_ShowMsg(sceneId, selfId, "Kh tr� Thi琺 Danh L鴆 th b読!");
		  return
		end		
		-- 奖励Kinh nghi甿
		local lvl = GetLevel(sceneId, selfId);
		if lvl > 9 and lvl < 119 then
			LuaFnAddExp(sceneId, selfId, x808038_g_Exp_Prize[lvl-9]);
		end
		-- 给大礼包
		ret = TryRecieveItem( sceneId, selfId, x808038_g_Gift_id, QUALITY_MUST_BE_CHANGE);
		if ret == -1 then
			x808038_ShowMsg(sceneId, selfId, "Nh th叻ng th b読!");		
			return  -- 道具th b読	
		end
		-- 播放特效
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x808038_g_Impact_id, 0);
		-- 设置兑奖时间
		SetMissionData(sceneId, selfId, MD_SIGNATURE_GETPRIZE_TIME, weekTime);
		-- 删除任务
		DelMission(sceneId, selfId, x808038_g_MissionId);

		-- Tr� v�
		BeginEvent(sceneId)
			AddText(sceneId, "#{SJQM_8815_19}");
		EndEvent()
		DispatchEventList(sceneId, selfId, targetId);
		-- 广播
		local playerName = GetName(sceneId, selfId);
		if playerName ~= nil then
			str = format("#{_INFOUSR%s}#{SJQM_8815_01}", playerName); 
			AddGlobalCountNews( sceneId, str )
		end		
	end
end

--**********************************
--列举事件
--**********************************
function x808038_OnEnumerate( sceneId, selfId, targetId )	
	AddNumText(sceneId, x808038_g_ScriptId, "Ho誸 鸬ng Thu Th Thi琺 Danh", 6, 1);
	AddNumText(sceneId, x808038_g_ScriptId, "V� ho誸 鸬ng Thu Th Thi琺 Danh", 0, 2);
end

--**********************************
--放弃,仅供子任务调用
--**********************************
function x808038_OnAbandon( sceneId, selfId )
	local itemNum = LuaFnGetAvailableItemCount(sceneId, selfId, x808038_g_SignatureList_id);
	local itemNum2 = LuaFnGetAvailableItemCount(sceneId, selfId, x808038_g_Signature_id);
	if itemNum >= 1 then
		LuaFnDelAvailableItem( sceneId, selfId, x808038_g_SignatureList_id, itemNum );
	end
	if itemNum2 >= 1 then
		LuaFnDelAvailableItem( sceneId, selfId, x808038_g_Signature_id, itemNum2 );
	end
  if IsHaveMission(sceneId, selfId, x808038_g_MissionId) > 0 then
  	DelMission( sceneId, selfId, x808038_g_MissionId )
  end
  return 0;
end

--**********************************
--信息提示
--**********************************
function x808038_ShowMsg( sceneId, selfId, msg )
	BeginEvent(sceneId)
		AddText(sceneId, msg);
	EndEvent()
	DispatchMissionTips(sceneId, selfId);
end

--**********************************
--NPCTr� v�
--**********************************

function x808038_ReturnMsg(sceneId, selfId, targetId, msg)
	BeginEvent(sceneId)
		AddText(sceneId, msg);
	EndEvent()
	DispatchEventList(sceneId, selfId, targetId);
end
