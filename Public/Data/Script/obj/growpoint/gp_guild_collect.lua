--生长 餴琺
--Created by zchw
--脚本号712534

--每次打开必定 鹫t 疬㧟to� 鸬 产品

x712534_g_NumOdds =
{
	{num = 1, odd = 85},		--1c醝to� 鸬 几率
	{num = 2, odd = 10},		--2c醝to� 鸬 几率
	{num = 3, odd = 5},			--3c醝to� 鸬 几率
}
--任务M� ra 时间
x712534_g_weekDay			= 0;
x712534_g_StartTime 	= 1900;
x712534_g_EndTime 		= 2000;

x712534_g_GPInfo = {};
x712534_g_GPInfo[791] = { name = "L竎h Th誧h", misId = 1140, itemId = 40004464}
x712534_g_GPInfo[792] = { name = "縩g Linh", misId = 1141, itemId = 40004462}
x712534_g_GPInfo[793] = { name = "Th Di畃 Li阯", misId = 1142, itemId = 40004463}

--生成函数开始************************************************************************
--每c醝ItemBox中最多10c醝物品
function	x712534_OnCreate(sceneId,growPointType,x,y)

	local item_id = x712534_g_GPInfo[growPointType].itemId
	local ItemBoxId = ItemBoxEnterScene(x,y,growPointType,sceneId,QUALITY_MUST_BE_CHANGE,1,item_id)	
	
	local rdm = random(100);
	local num = 0;
	if rdm < x712534_g_NumOdds[1].odd then
		num = x712534_g_NumOdds[1].num;
	elseif rdm < x712534_g_NumOdds[1].odd+x712534_g_NumOdds[2].odd then
		num = x712534_g_NumOdds[2].num;
	else
		num = x712534_g_NumOdds[3].num;
	end
	
	while num > 1 do
		AddItemToBox( sceneId, ItemBoxId, QUALITY_MUST_BE_CHANGE, 1 , item_id )
		num = num -1;
	end
	
end
--生成函数结束**********************************************************************


--打开前函数开始&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
function	x712534_OnOpen(sceneId,selfId,targetId)
	local growPointType = LuaFnGetItemBoxGrowPointType( sceneId, targetId );
	local misId = x712534_g_GPInfo[growPointType].misId;
	if IsHaveMission(sceneId, selfId, misId) ~= 1 then
		local msg = format("#{BHSJ_081014_15}%s #{BHSJ_081014_16}", x712534_g_GPInfo[growPointType].name);
		x712534_Tips(sceneId, selfId, msg);
		return -29; 
	end 
	--时间m祎 致?
	local misIndex = GetMissionIndexByID(sceneId, selfId, misId);
	if GetMissionParam(sceneId, selfId, misIndex, 2) ~= GetWeekTime() then
		x712534_Tips(sceneId, selfId, "#{BHSJ_081014_18}");
		return -29;	
	end
	--活动期内?
	local time = GetHour()*100 + GetMinute(); 
	if GetTodayWeek() ~= x712534_g_weekDay  then
		x712534_Tips(sceneId, selfId, "#{BHSJ_081014_11}");
		return -29;
	elseif  time < x712534_g_StartTime then
		x712534_Tips(sceneId, selfId, "#{BHSJ_081014_11}");
		return -29;
	elseif time > x712534_g_EndTime then
		x712534_Tips(sceneId, selfId, "#{BHSJ_081014_18}");
		return -29;
	end
	--任务完成?
	if GetMissionParam(sceneId, selfId, misIndex, 0) == 1 then
		x712534_Tips(sceneId, selfId, "#{BHSJ_081014_17}");
		return -29;			
	end
	return 0; --OR_OK
end
--打开前函数结束&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&


--回收函数开始########################################################################
function	x712534_OnRecycle(sceneId,selfId,targetId)
	--Tr� v�1,生长 餴琺回收
	local growPointType = LuaFnGetItemBoxGrowPointType( sceneId, targetId );
	local misId = x712534_g_GPInfo[growPointType].misId;
	local count = LuaFnGetItemCount(sceneId, selfId, x712534_g_GPInfo[growPointType].itemId);
	if count > 0 then
		local misIndex = GetMissionIndexByID(sceneId, selfId, misId);
		SetMissionByIndex(sceneId, selfId, misIndex, 0, 1);
		SetMissionByIndex(sceneId, selfId, misIndex, 1, count);
		x712534_Tips(sceneId, selfId, "#{YD_20080421_180}");
	end
	return 1
end
--回收函数结束########################################################################



--打开后函数开始@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
function	x712534_OnProcOver(sceneId,selfId,targetId)
	return 0
end
--打开后函数结束@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

function x712534_OnTickCreateFinish( sceneId, growPointType, tickCount )
end

--**********************************
--ReturnTips
--**********************************
function x712534_Tips(sceneId, selfId, msg)
	BeginEvent(sceneId)
		AddText(sceneId, msg);
	EndEvent()
	DispatchMissionTips(sceneId, selfId)
end
