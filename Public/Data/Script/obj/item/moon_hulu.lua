--------------------------------------------
--Nguy畉 L鉶葫芦道具脚本
--Created By 左春伟
--------------------------------------------

--脚本ID
x335908_g_scriptId = 335908
-- 收集情报任务号
x335908_g_MissionId = 1144;

--场景信息表
x335908_g_select_sceneId = 
{
	[1]=  {6, 	"V� L唼ng S絥 B誧h vi阯 th誧h tr", 	53,264, },
	[2]=  {7, 	"Ki猰 c醕 Ki猰 m鬾 餴畃 th鷜",   	130,135, },
	[3]=  {8, 	"恤n Ho鄋g H鉵 h鋓 c ph",			260,260, },
	[4]=  {5, 	"K韓h h� Ng鱟 疳i l鈓 phong",			39,261, },
	[5]=  {4, 	"Th醝 h� V� t� ca 疣i",			160,252, },
	[6]=  {3, 	"Tung s絥 Giang s絥 餫 ki玼",			275,85, },
	[7]=  {30, 	"T鈟 h� Nh v鱪g h� b鄌",     170,235, },
	[8]=  {24, 	"Nh� h鋓 B醕h kh� l遳 tranh",     260,270, },
	[9]=  {18, 	"Nh課 Nam Phong ki玼 t竎h chi猽",     150,250, },
	[10]= {31, 	"Long Tuy玭 Phi l遳 tr馽 h�",     270,280, },
	[11]= {25, 	"Th呓ng S絥 T� th鼀 ni阯 hoa",     258,73, },
	[12]= {19, 	"Nh課 B B韈h l thi阯 nh",     283,179, },
	[13]= {32, 	"V� Di Y阯 t鯽 nh� ki玼",     54,182, },
	[14]= {26, 	"Th誧h L鈓 Phong loan nh t�",     195,53, },
	[15]= {20, 	"Th鋙 Nguy阯 Lang V呓ng th誧h tr",     143,254, },
	[16]= {33, 	"Mai L頽h Mai l頽h ph quang",     284,82, },
	[17]= {27, 	"Ng鱟 Kh� Thanh mi nh� 皈u",     268,116, },
	[18]= {21, 	"Li陁 T鈟 Ngao bao t呓ng h礽",     277,117, },
	[19]= {34, 	"Nam H鋓 Thi阯 Nam nh tr�",     61,225, },
	[20]= {23,	"Ho鄋g Long Ph� Thi阯 tr� tuy猼 c鋘h",   289,66, },
}

--**********************************
--事件交互入口
--**********************************
function x335908_OnDefaultEvent( sceneId, selfId, bagIndex )	
end

--**********************************
--C醝 n鄖 物品to� 鸬 使用过程喧ng否类似于技能: 
--H� th痭g会T読 执行开始时检测C醝 n鄖 函数to� 鸬 Tr� v�,如果Tr� v玹h b読则忽略后面to� 鸬 类似技能to� 鸬 执行.
--Tr� v�1: 技能类似to� 鸬 物品,可以继续类似技能to� 鸬 执行；Tr� v�0: 忽略后面to� 鸬 操作.
--**********************************
function x335908_IsSkillLikeScript( sceneId, selfId)
	return 1
end

--**********************************
--直接Hu� b鲂Ч�: 
--H� th痭g会直接调用C醝 n鄖 接口,并根据C醝 n鄖 函数to� 鸬 Tr� v礨醕 nh以后to� 鸬 流程喧ng否执行.
--Tr� v�1: 已经Hu� b龆杂πЧ�,不再执行后续操作；Tr� v�0: 没有检测到相关效果,继续执行.
--**********************************
function x335908_CancelImpacts( sceneId, selfId )
	return 0;
end

--**********************************
--条件检测入口: 
--H� th痭g会T読 技能检测to� 鸬 时间 餴琺调用C醝 n鄖 接口,并根据C醝 n鄖 函数to� 鸬 Tr� v礨醕 nh以后to� 鸬 流程喧ng否执行.
--Tr� v�1: 条件检测通过,可以继续执行；Tr� v�0: 条件检测th b読,中断后续执行.
--**********************************
function x335908_OnConditionCheck( sceneId, selfId )
	--校验使用to� 鸬 物品
	if IsHaveMission(sceneId, selfId, x335908_g_MissionId) ==  1 then	
		if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
			return 0;
		end	
		local ret, msg = x335908_IsFitCondition(sceneId, selfId);
		if ret == 0 then
			x335908_MsgBox( sceneId, selfId, msg );
			return 0;
		end
		--pass
		return 1;
	end
	return 0;
end

--**********************************
--聚气技能开始回调接口: 
--H� th痭g会T読 技能开始to� 鸬 时间 餴琺调用C醝 n鄖 接口,并根据C醝 n鄖 函数to� 鸬 Tr� v礨醕 nh以后to� 鸬 流程喧ng否执行.
--Tr� v�1: 处理通过,可以继续执行；Tr� v�0: th b読,中断后续执行.
--**********************************
function x335908_OnStartCharging( sceneId, selfId )	
	x335908_MsgBox(sceneId, selfId, "#{JZSJ_081119}");
	return 1;
end

--**********************************
--消耗检测及处理入口: 
--H� th痭g会T読 技能消耗to� 鸬 时间 餴琺调用C醝 n鄖 接口,并根据C醝 n鄖 函数to� 鸬 Tr� v礨醕 nh以后to� 鸬 流程喧ng否执行.
--Tr� v�1: 消耗处理通过,可以继续执行；Tr� v�0: 消耗检测th b読,中断后续执行.
--注意: 这不光负责消耗to� 鸬 检测也负责消耗to� 鸬 执行.
--**********************************
function x335908_OnDeplete( sceneId, selfId )	
	return 1;
end

--**********************************
--只会执行m祎 次入口: 
--聚气和瞬发技能会T読 消耗完成后调用C醝 n鄖 接口(聚气结束并且各种条件都Th鯽 m鉵to� 鸬 时候),而引导
--技能也会T読 消耗完成后调用C醝 n鄖 接口(技能to� 鸬 m祎 开始,消耗成功执行之后).
--Tr� v�1: 处理成功；Tr� v�0: 处理th b読.
--注: 这里喧ng技能生效m祎 次to� 鸬 入口
--**********************************
function x335908_OnActivateOnce( sceneId, selfId )
	if IsHaveMission(sceneId, selfId, x335908_g_MissionId) == 1 then
		local misIndex = GetMissionIndexByID(sceneId, selfId, x335908_g_MissionId);
		local ringNum = GetMissionParam(sceneId, selfId, misIndex, 1) + 1;	
		SetMissionByIndex(sceneId, selfId, misIndex, 1, ringNum);  							--任务环数加1
		--只C 保存前2c醝打探过to� 鸬 场景号.任务第四位做特殊用途. x808010_g_StrForePart = 4
		if ringNum < 3 then
			SetMissionByIndex(sceneId, selfId, misIndex, ringNum+1, sceneId); 		--该场景已打探过	
		end		
		local msg = format("#{YHJZ_081007_35}Ti猲 鸬 nhi甿 v�: %d/3", ringNum);
		x335908_MsgBox(sceneId, selfId, msg);	 --收集成功,Ng呓i 鹫t 疬㧟 m祎 些仙Linh之气.
		if ringNum >= 3 then 																										-- 设置任务完成
			SetMissionByIndex(sceneId, selfId, misIndex, 0, 1);
			x335908_MsgBox(sceneId, selfId, "Ho鄋 t nhi甿 v�!");
		end
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
function x335908_OnActivateEachTick( sceneId, selfId)
	return 1;
end

--**********************************
--信息提示
--**********************************
function x335908_MsgBox( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
-- 条件检查 
-- 成功: 1  th b読: 0
--**********************************
function x335908_IsFitCondition(sceneId, selfId)
 	--已收集3处仙气?
 	local misIndex = GetMissionIndexByID(sceneId, selfId, x335908_g_MissionId);
 	local ringNum = GetMissionParam(sceneId, selfId, misIndex, 1)
 	if ringNum >= 3 then
		return 0, "#{YHJZ_081007_31}" 		
 	end
 	--场景正确?
 	local param = {}; 	
 	param[1] = GetMissionParam(sceneId, selfId, misIndex, 5);
 	param[2] = GetMissionParam(sceneId, selfId, misIndex, 6);
 	param[3] = GetMissionParam(sceneId, selfId, misIndex, 7);
 	local bFlag = 0;
 	local index = 0;
 	for i=1, 3 do
 		if x335908_g_select_sceneId[param[i]+1][1] == sceneId then
 			index = param[i]+1;
 			bFlag = 1;
 			break
 		end
 	end 
 	if bFlag == 0 then
 		return 0, "#{YHJZ_081007_32}";
 	end
 	--已收集过?
 	for i=2, 3 do
 		if sceneId == GetMissionParam(sceneId, selfId, misIndex, i) then
 			return 0, "#{YHJZ_081007_33}";
 		end
 	end
 	--位置正确?
 	local pos_x, pos_z = LuaFnGetWorldPos(sceneId, selfId);
 	local distance =
 	(x335908_g_select_sceneId[index][3]-pos_x) * (x335908_g_select_sceneId[index][3]-pos_x) + 
 	(x335908_g_select_sceneId[index][4]-pos_z) * (x335908_g_select_sceneId[index][4]-pos_z);	
 	if distance > 18 then
 		return 0, "Ng呓i c醕h 鸶a 餴琺 thu th qu� xa!";
 	end
 	--夫妻组队?
 	--1.喧ng否组队
	local teamId = GetTeamId(sceneId,selfId)
	if teamId<0 then
		return 0, "#{YHJZ_081007_34}";
	end	
	--2.喧ng否俩人
	if GetTeamSize(sceneId,selfId)~=2 then
		return 0, "#{YHJZ_081007_34}";
	end	
	--3.喧ng否T読 附近
	if GetNearTeamCount(sceneId,selfId) ~= 2 then
		return 0, "#{YHJZ_081007_34}";
	end	
	--4.喧ng否喧ng夫妻
	local tid1 = GetNearTeamMember(sceneId,selfId,0)
	local tid2 = GetNearTeamMember(sceneId,selfId,1)
	if LuaFnIsMarried(sceneId,tid1)<=0 or LuaFnIsMarried(sceneId,tid2)<=0 then
		return 0, "#{YHJZ_081007_34}";
	else
		if LuaFnGetSpouseGUID(sceneId,tid1) ~= LuaFnGetGUID(sceneId,tid2) or LuaFnGetSpouseGUID(sceneId,tid2) ~= LuaFnGetGUID(sceneId,tid1) then
			return 0, "#{YHJZ_081007_34}";
		end
	end	
	-- OK
	return 1, "ok";
end
