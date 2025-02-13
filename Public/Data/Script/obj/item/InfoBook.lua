--------------------------------------------
--情报簿道具脚本
--Created By 左春伟
--------------------------------------------

--脚本ID
x335807_g_scriptId = 335807
-- 收集情报任务号
x335807_g_MissionId = 1121;

--**********************************
--事件交互入口
--**********************************
function x335807_OnDefaultEvent( sceneId, selfId, bagIndex )	
end

--**********************************
--C醝 n鄖 物品to� 鸬 使用过程喧ng否类似于技能: 
--H� th痭g会T読 执行开始时检测C醝 n鄖 函数to� 鸬 Tr� v�,如果Tr� v玹h b読则忽略后面to� 鸬 类似技能to� 鸬 执行.
--Tr� v�1: 技能类似to� 鸬 物品,可以继续类似技能to� 鸬 执行；Tr� v�0: 忽略后面to� 鸬 操作.
--**********************************
function x335807_IsSkillLikeScript( sceneId, selfId)
	return 1
end

--**********************************
--直接Hu� b鲂Ч�: 
--H� th痭g会直接调用C醝 n鄖 接口,并根据C醝 n鄖 函数to� 鸬 Tr� v礨醕 nh以后to� 鸬 流程喧ng否执行.
--Tr� v�1: 已经Hu� b龆杂πЧ�,不再执行后续操作；Tr� v�0: 没有检测到相关效果,继续执行.
--**********************************
function x335807_CancelImpacts( sceneId, selfId )
	return 0;
end

--**********************************
--条件检测入口: 
--H� th痭g会T読 技能检测to� 鸬 时间 餴琺调用C醝 n鄖 接口,并根据C醝 n鄖 函数to� 鸬 Tr� v礨醕 nh以后to� 鸬 流程喧ng否执行.
--Tr� v�1: 条件检测通过,可以继续执行；Tr� v�0: 条件检测th b読,中断后续执行.
--**********************************
function x335807_OnConditionCheck( sceneId, selfId )
	--校验使用to� 鸬 物品
	if IsHaveMission(sceneId, selfId, x335807_g_MissionId) ==  1 then	
		if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
			return 0;
		end	
		if x335807_IsFitCondition(sceneId, selfId) == 0 then
			return 0;
		end
		local misIndex = GetMissionIndexByID(sceneId, selfId, x335807_g_MissionId);	
		local flag = GetMissionParam(sceneId, selfId, misIndex, 5);
		if flag == 0 then
			x335807_MsgBox(sceneId, selfId, "Ng呓i 餫ng thu th t靚h b醥, th飊h kh鬾g r秈 餴 v鵱g ph� c, n猽 kh鬾g thu th t靚h b醥 th b読."); 
			SetMissionByIndex(sceneId, selfId, misIndex, 5, 1);		
		end
		return 1;
	end
	return 0;
end

--**********************************
--消耗检测及处理入口: 
--H� th痭g会T読 技能消耗to� 鸬 时间 餴琺调用C醝 n鄖 接口,并根据C醝 n鄖 函数to� 鸬 Tr� v礨醕 nh以后to� 鸬 流程喧ng否执行.
--Tr� v�1: 消耗处理通过,可以继续执行；Tr� v�0: 消耗检测th b読,中断后续执行.
--注意: 这不光负责消耗to� 鸬 检测也负责消耗to� 鸬 执行.
--**********************************
function x335807_OnDeplete( sceneId, selfId )	
	return 1;
end

--**********************************
--只会执行m祎 次入口: 
--聚气和瞬发技能会T読 消耗完成后调用C醝 n鄖 接口(聚气结束并且各种条件都Th鯽 m鉵to� 鸬 时候),而引导
--技能也会T読 消耗完成后调用C醝 n鄖 接口(技能to� 鸬 m祎 开始,消耗成功执行之后).
--Tr� v�1: 处理成功；Tr� v�0: 处理th b読.
--注: 这里喧ng技能生效m祎 次to� 鸬 入口
--**********************************
function x335807_OnActivateOnce( sceneId, selfId )
	if IsHaveMission(sceneId, selfId, x335807_g_MissionId) == 1 then
		local misIndex = GetMissionIndexByID(sceneId, selfId, x335807_g_MissionId);
		local ringNum = GetMissionParam(sceneId, selfId, misIndex, 1) + 1;	
		SetMissionByIndex(sceneId, selfId, misIndex, 1, ringNum);  				--任务环数加1
		SetMissionByIndex(sceneId, selfId, misIndex, ringNum+1, sceneId); --该场景已打探过	
		SetMissionByIndex(sceneId, selfId, misIndex, 5, 0);								--提示信息标识
		if ringNum >= 3 then 																							-- 设置任务完成
			SetMissionByIndex(sceneId, selfId, misIndex, 0, 1);
		end
		local msg = "";
		msg = format("#{DT_80815_23}%d/3#{DT_80815_24}", ringNum);
		x335807_MsgBox(sceneId, selfId, msg);	
		return 1;
	end
	return 0;
end

--**********************************
--引导心跳处理入口: 
--引导技能会T読 每次心跳结束时调用C醝 n鄖 接口.
--Tr� v�: 1继续下次心跳；0: 中断引导.
--注: 这里喧ng技能生效m祎 次to� 鸬 入口
--**********************************
function x335807_OnActivateEachTick( sceneId, selfId)
	return 1;
end

--**********************************
--信息提示
--**********************************
function x335807_MsgBox( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
-- 条件检查 
-- 成功: 1  th b読: 0
--**********************************
function x335807_IsFitCondition(sceneId, selfId)
	--T読 玩家帮派Th鄋h th�?
	if GetCityGuildID(sceneId, selfId, sceneId) == -1 then
		x335807_MsgBox(sceneId, selfId, "#{DTGX_080822_8}");
		return 0;
	elseif GetCityGuildID(sceneId, selfId, sceneId) == GetHumanGuildID(sceneId, selfId) then -- 本帮派
		x335807_MsgBox(sceneId, selfId, "#{DTGX_080822_9}");
		return 0;	
	end
	--已打探过?
	local misIndex = GetMissionIndexByID(sceneId, selfId, x335807_g_MissionId);
 	for i=2, 3 do 	--2,3位保存打探to� 鸬 第m祎 ,二c醝Th鄋h th窱D
 		local city = GetMissionParam(sceneId, selfId, misIndex, i);
 		if city == sceneId then
			x335807_MsgBox(sceneId, selfId, "#{DTGX_080822_10}");
			return 0;	 			
 		end
 	end
 	--组队?
 	if LuaFnHasTeam(sceneId, selfId) == 0 then
		x335807_MsgBox(sceneId, selfId, "#{DTGX_080822_11}");
		return 0;	 		
 	elseif GetTeamSize(sceneId, selfId) < 2 then
 		x335807_MsgBox(sceneId, selfId, "#{DTGX_080822_11}");
		return 0;	 		
 	end
 	local teamSize = GetTeamSize(sceneId, selfId);
 	--械i vi阯 都T読 附近
 	if GetNearTeamCount(sceneId, selfId) < teamSize then
 		x335807_MsgBox(sceneId, selfId, "#{DTGX_080822_13}");
		return 0;	 		
 	end 	
 	--队伍都喧ng本帮成员?
 	local guildId = GetHumanGuildID(sceneId, selfId);
 	for i=0, teamSize-1 do
 		local memGuid = GetTeamMemberGuid(sceneId, selfId, i);
 		local objId = LuaFnGuid2ObjId(sceneId, memGuid);
 		if objId ~= -1 then
			if GetHumanGuildID(sceneId, objId) ~= guildId then
				x335807_MsgBox(sceneId, selfId, "#{DTGX_080822_12}");
				return 0;	 			
			end
	 	end
 	end
 	--已打探完三Th鄋h th�?
 	local ringNum = GetMissionParam(sceneId, selfId, misIndex, 1)
 	if ringNum >= 3 then
		x335807_MsgBox(sceneId, selfId, "#{DTGX_080822_14}");
		return 0;	  		
 	end
	-- OK
	return 1;
end
