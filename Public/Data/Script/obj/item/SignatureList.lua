--------------------------------------------
--签名录道具脚本
--Created By 左春伟
--------------------------------------------

--脚本ID
x335806_g_scriptId = 335806
--签名道具ID
x335806_g_signatureId = 40004452; 
--需收集数量
x335806_g_FullNum = 15;
-- 收集签名任务号
x335806_g_MissionId = 1130;

--**********************************
--事件交互入口
--**********************************
function x335806_OnDefaultEvent( sceneId, selfId, bagIndex )	

end

--**********************************
--C醝 n鄖 物品to� 鸬 使用过程喧ng否类似于技能: 
--H� th痭g会T読 执行开始时检测C醝 n鄖 函数to� 鸬 Tr� v�,如果Tr� v玹h b読则忽略后面to� 鸬 类似技能to� 鸬 执行.
--Tr� v�1: 技能类似to� 鸬 物品,可以继续类似技能to� 鸬 执行；Tr� v�0: 忽略后面to� 鸬 操作.
--**********************************
function x335806_IsSkillLikeScript( sceneId, selfId)
	return 1
end

--**********************************
--直接Hu� b鲂Ч�: 
--H� th痭g会直接调用C醝 n鄖 接口,并根据C醝 n鄖 函数to� 鸬 Tr� v礨醕 nh以后to� 鸬 流程喧ng否执行.
--Tr� v�1: 已经Hu� b龆杂πЧ�,不再执行后续操作；Tr� v�0: 没有检测到相关效果,继续执行.
--**********************************
function x335806_CancelImpacts( sceneId, selfId )
	return 0;
end

--**********************************
--条件检测入口: 
--H� th痭g会T読 技能检测to� 鸬 时间 餴琺调用C醝 n鄖 接口,并根据C醝 n鄖 函数to� 鸬 Tr� v礨醕 nh以后to� 鸬 流程喧ng否执行.
--Tr� v�1: 条件检测通过,可以继续执行；Tr� v�0: 条件检测th b読,中断后续执行.
--**********************************
function x335806_OnConditionCheck( sceneId, selfId )
	--校验使用to� 鸬 物品
	if 1 ~= LuaFnVerifyUsedItem(sceneId, selfId) then
		return 0;
	end
	if x335806_IsFitCondition(sceneId, selfId) == 0 then
		return 0;
	end
	-- 检测通过
	local targetId = LuaFnGetTargetObjID(sceneId, selfId);
	local myName = GetName(sceneId, selfId);
	BeginEvent(sceneId)
		local text = format("#{_INFOUSR%s}Ng呓i 餫ng thu th ch� k�, kh鬾g 疬㧟 r秈 餴 ph誱 vi ph� c.", myName);
		AddText(sceneId, text);
	EndEvent()
	DispatchMissionTips(sceneId, targetId);
	return 1;
end

--**********************************
--消耗检测及处理入口: 
--H� th痭g会T読 技能消耗to� 鸬 时间 餴琺调用C醝 n鄖 接口,并根据C醝 n鄖 函数to� 鸬 Tr� v礨醕 nh以后to� 鸬 流程喧ng否执行.
--Tr� v�1: 消耗处理通过,可以继续执行；Tr� v�0: 消耗检测th b読,中断后续执行.
--注意: 这不光负责消耗to� 鸬 检测也负责消耗to� 鸬 执行.
--**********************************
function x335806_OnDeplete( sceneId, selfId )	
	return 1;
end

--**********************************
--只会执行m祎 次入口: 
--聚气和瞬发技能会T読 消耗完成后调用C醝 n鄖 接口(聚气结束并且各种条件都Th鯽 m鉵to� 鸬 时候),而引导
--技能也会T読 消耗完成后调用C醝 n鄖 接口(技能to� 鸬 m祎 开始,消耗成功执行之后).
--Tr� v�1: 处理成功；Tr� v�0: 处理th b読.
--注: 这里喧ng技能生效m祎 次to� 鸬 入口
--**********************************
function x335806_OnActivateOnce( sceneId, selfId )
	if IsHaveMission(sceneId, selfId, x335806_g_MissionId) == 1 then
		local misIndex = GetMissionIndexByID(sceneId, selfId, x335806_g_MissionId);
		SetMissionByIndex(sceneId, selfId, misIndex, 2, 1);
	end	
	return 1;
end

--**********************************
--引导心跳处理入口: 
--引导技能会T読 每次心跳结束时调用C醝 n鄖 接口.
--Tr� v�: 1继续下次心跳；0: 中断引导.
--注: 这里喧ng技能生效m祎 次to� 鸬 入口
--**********************************
function x335806_OnActivateEachTick( sceneId, selfId)
	--检测好友喧ng否超距离
	local targetId = LuaFnGetTargetObjID(sceneId, selfId);
	local cur_x, cur_y = LuaFnGetWorldPos(sceneId, selfId);
	local cur_x2, cur_y2 = LuaFnGetWorldPos(sceneId, targetId);
	if (cur_x2-cur_x)*(cur_x2-cur_x) + (cur_y2-cur_y)*(cur_y2-cur_y) > 30 then 	
		x335806_MsgBox(sceneId, selfId, "#{SJQM_8815_14}");
		return 0;	
	end
	if IsHaveMission(sceneId, selfId, x335806_g_MissionId) == 1 then
		local misIndex = GetMissionIndexByID(sceneId, selfId, x335806_g_MissionId);
		local tickCount = GetMissionParam(sceneId, selfId, misIndex, 2)
		if tickCount >= 60 then --1 ph鷗时间到,进度条走完
			--条件检查
			if x335806_IsFitCondition(sceneId, selfId) == 0 then
				return 0;
			end		
			--给好友签名道具
			local bagPos = TryRecieveItem(sceneId, selfId, x335806_g_signatureId, QUALITY_MUST_BE_CHANGE);
			if bagPos == -1 then
				x335806_MsgBox(sceneId, selfId, "C 鹫o c� ch� k� h鋙 h鎢 th b読!");
				return 0;
			end
			--签名
			local targetId = LuaFnGetTargetObjID(sceneId, selfId);
			local friendName = GetName(sceneId, targetId);
			LuaFnSetItemCreator(sceneId, selfId, bagPos, friendName);
			local num = GetItemCount(sceneId, selfId, x335806_g_signatureId);
			SetMissionByIndex(sceneId, selfId, misIndex, 1, num);
			if num >= x335806_g_FullNum then
				SetMissionByIndex(sceneId, selfId, misIndex, 0, 1);
			end
			local text = format("秀 th鄋h c鬾g thu th 疬㧟 %d/15 c醝 ch� k�.", num);
			x335806_MsgBox(sceneId, selfId, text);	
		end		
		SetMissionByIndex(sceneId, selfId, misIndex, 2, tickCount+1);
	end		
	return 1;   
end

--**********************************
--信息提示
--**********************************
function x335806_MsgBox( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
-- 条件检查 
-- 成功: 1  th b読: 0
--**********************************
function x335806_IsFitCondition(sceneId, selfId)
	--收集已满?
	local text = "";
	if LuaFnGetItemCount(sceneId, selfId, x335806_g_signatureId) >= x335806_g_FullNum then
		x335806_MsgBox(sceneId, selfId, "#{SJQM_8815_09}");
		return 0;
	end
	--选择使用对象了?
	local targetId = LuaFnGetTargetObjID(sceneId, selfId);
	if targetId < 0 or targetId == selfId then
		x335806_MsgBox(sceneId, selfId, "#{YRJ_SelfUseTip}");	
		return 0;
	end	
	--只能给玩家使用
	local objType = GetCharacterType( sceneId, targetId )--对象类型
	if(objType ~= 1)then	--对象不喧ngHuman
		x335806_MsgBox( sceneId, selfId, "#{ResultText_8}")	--无效目标
		return 0
	end	
	--喧ng好友?
	if LuaFnIsFriend(sceneId, selfId, targetId) == 1 then
		if LuaFnGetFriendPoint(sceneId, selfId, targetId) < 200 then --200友好度?
			x335806_MsgBox(sceneId, selfId, "#{SJQM_8815_10}");
			return 0;
		end
	else --非好友
		x335806_MsgBox(sceneId, selfId, "#{SJQM_8815_11}");
		return 0;
	end	
	--超过距离
	local cur_x, cur_y = LuaFnGetWorldPos(sceneId, selfId);
	local cur_x2, cur_y2 = LuaFnGetWorldPos(sceneId, targetId);
	if (cur_x2-cur_x)*(cur_x2-cur_x) + (cur_y2-cur_y)*(cur_y2-cur_y) > 30 then 	
		x335806_MsgBox(sceneId, selfId, "V唼t qua ph誱 vi!");
		return 0;	
	end
	--已有该好友签名?
	local friendName = GetName(sceneId, targetId);
	local taskBagStartPos	= LuaFnGetMaterialEndBagPos(sceneId, selfId) + 1;
	for i=taskBagStartPos, taskBagStartPos+19 do
		local bSucc, Creator = LuaFnGetItemCreator(sceneId, selfId, i);
		if friendName == Creator then
			x335806_MsgBox(sceneId, selfId, "#{SJQM_8815_12}");
			return 0;
		end
	end
	--任务栏有空间?
	if LuaFnGetTaskItemBagSpace(sceneId, selfId) == 0 then
		x335806_MsgBox(sceneId, selfId, "#{SJQM_8815_13}");
		return 0;		
	end
	--放弃任务
	if IsHaveMission(sceneId, selfId, x335806_g_MissionId) == 0 then
		x335806_MsgBox(sceneId, selfId, "Ng呓i 疸 v裻 b� nhi甿 v� ch� k�, n阯 鹫o c� kh鬾g th� d鵱g!");
		return 0;		
	end
	--OK
	return 1;
end
