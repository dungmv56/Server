--生长 餴琺
--对应生活技能: -1
--Tung S絥宝物掉落器
--脚本号******(712506)

--m祎 c醝宝箱里含有几c醝物品
x712506_g_DropNumTable  = {
	{num = 1, odd = 0.2},	--1c醝to� 鸬 几率
	{num = 2, odd = 0.4},	--2c醝to� 鸬 几率
	{num = 3, odd = 0.2},	--3c醝to� 鸬 几率
	{num = 4, odd = 0.15},	--4c醝to� 鸬 几率
	{num = 5, odd = 0.05},	--5c醝to� 鸬 几率
}

x712506_g_TickCreate_Msg = ""

--每种物品喧ng哪类物品,且此类物品堆叠数量喧ng几c醝
x712506_g_DropTable = {
	--血药类
	{
		itemType = 1, 	--血药类to� 鸬 类型标识
	 	odd = 0.293, 			--出现几率
	 	numOdd = {
							{num = 1, odd = 0.2},				--1c醝to� 鸬 几率
							{num = 2, odd = 0.4},				--2c醝to� 鸬 几率
							{num = 3, odd = 0.2},				--3c醝to� 鸬 几率
							{num = 4, odd = 0.15},			--4c醝to� 鸬 几率
							{num = 5, odd = 0.05},			--5c醝to� 鸬 几率
						 },
		idx = {	--物品序列号表
						30001003,30003003,30101033,
					},
	},
	--蓝药类
	{
		itemType = 2, 	--蓝药类to� 鸬 类型标识
	 	odd = 0.294, 			--出现几率
	 	numOdd = {
							{num = 1, odd = 0.2},				--1c醝to� 鸬 几率
							{num = 2, odd = 0.4},				--2c醝to� 鸬 几率
							{num = 3, odd = 0.2},				--3c醝to� 鸬 几率
							{num = 4, odd = 0.15},			--4c醝to� 鸬 几率
							{num = 5, odd = 0.05},			--5c醝to� 鸬 几率
						 },
		idx = {	--物品序列号表
						30002003,30101043,
					},
	},
	--口粮
	{
		itemType = 3, 	--口粮to� 鸬 类型标识
	 	odd = 0.2, 		--出现几率
	 	numOdd = {
							{num = 1, odd = 0.2},				--1c醝to� 鸬 几率
							{num = 2, odd = 0.4},				--2c醝to� 鸬 几率
							{num = 3, odd = 0.2},				--3c醝to� 鸬 几率
							{num = 4, odd = 0.15},			--4c醝to� 鸬 几率
							{num = 5, odd = 0.05},			--5c醝to� 鸬 几率
						 },
		idx = {	--物品序列号表
						30602003,30603003,30604003,30605003,
					},
	},
	--材料类
	{
		itemType = 4, 	--材料类to� 鸬 类型标识
	 	odd = 0.1, 			--出现几率
	 	numOdd = {
							{num = 2, odd = 0.2},				--2c醝to� 鸬 几率
							{num = 4, odd = 0.4},				--4c醝to� 鸬 几率
							{num = 6, odd = 0.2},				--6c醝to� 鸬 几率
							{num = 8, odd = 0.15},			--8c醝to� 鸬 几率
							{num = 10, odd = 0.05},			--10c醝to� 鸬 几率
						 },
		idx = {	--物品序列号表
						20101005,20101006,20101007,20102003,20102015,20103003,20104003,20105003,
					},
	},
	--伴生类
	{
		itemType = 12, 	--伴生类to� 鸬 类型标识
	 	odd = 0.02, 			--出现几率
	 	numOdd = {
							{num = 1, odd = 0.3},				--1c醝to� 鸬 几率
							{num = 2, odd = 0.4},				--2c醝to� 鸬 几率
							{num = 3, odd = 0.3},				--3c醝to� 鸬 几率
						 },
		idx = {	--物品序列号表
						20102027,20103015,20103027,20103039,20103051,20105015,
					},
	},
	--白色武器类
	{
		itemType = 5, 	--白色武器类to� 鸬 类型标识
	 	odd = 0.045, 		--出现几率
	 	numOdd = {
							{num = 1, odd = 1.0},				--1c醝to� 鸬 几率
						 },
		idx = {	--物品序列号表
						10100003,10101003,10102003,10103003,10104003,10105003,
					},
	},
	--蓝色武器类
	{
		itemType = 10, 	--蓝色武器类to� 鸬 类型标识
	 	odd = 0, 		--出现几率
	 	numOdd = {
							{num = 1, odd = 1.0},				--1c醝to� 鸬 几率
						 },
		idx = {	--物品序列号表
						 10200003,10201003,10202003,10203003,10204003,10205003,
					},
	},
	--白色装备类
	{
		itemType = 6, 	--白色装备类to� 鸬 类型标识
	 	odd = 0.045, 		--出现几率
	 	numOdd = {
							{num = 1, odd = 1.0},				--1c醝to� 鸬 几率
						 },
		idx = {	--物品序列号表
						10110006,10110007,10110008,10111006,10111007,10111008,10112006,10112007,10112008,10113006,10113007,10113008,10120003,10121003,10122003,
					},
	},
	--蓝色装备类
	{
		itemType = 11, 	--蓝色装备类to� 鸬 类型标识
	 	odd = 0, 		--出现几率
	 	numOdd = {
							{num = 1, odd = 1.0},				--1c醝to� 鸬 几率
						 },
		idx = {	--物品序列号表
						 10210005,10211005,10212005,10213005,10220003,10221003,10222003,
					},
	},
	--宝石类
	{
		itemType = 7, 	--宝石类to� 鸬 类型标识
	 	odd = 0.001, 		--出现几率
	 	numOdd = {
							{num = 1, odd = 1.0},				--1c醝to� 鸬 几率
						 },
		idx = {	--物品序列号表
						50101001,50101002,50102001,50102002,50102003,50102004,50103001,50104002,50111001,50111002,50112001,50112002,50112003,50112004,50113001,50113002,50113003,50113004,50113005,50114001,
					},
	},
	--配方类
	{
		itemType = 8, 	--配方类to� 鸬 类型标识
	 	odd = 0.002, 			--出现几率
	 	numOdd = {
							{num = 1, odd = 1.0},				--1c醝to� 鸬 几率
						 },
		idx = {	--物品序列号表
						30303054,30304039,30304040,30304041,30304042,30304043,30304044,
					},
	},
	--珍兽
	{
		itemType = 9, 	--珍兽to� 鸬 类型标识
	 	odd = -1.0, 		--出现几率
	 	numOdd = {
							{num = 1, odd = 0.0},				--1c醝to� 鸬 几率
						 },
		idx = {	--珍兽序列号表
						3009,3019,3029,
					},
	},
}

--宝物回收时间2006-8-21 17:33 修改为由管理器传递进来

--根据本次随机数来找到表中对应to� 鸬 索引
function x712506_GetTableIndexByOdd(tb)
	local oddNow = random();
	
	local base = 0.0;
	for i = 1, getn(tb) do
		if(tb[i].odd + base >= oddNow) then
			return i;
		end
		base = base + tb[i].odd;
	end
	
	return nil;
end

--生成函数开始************************************************************************
--每c醝ItemBox中最多10c醝物品,Tr� v� -1 直接回收生长 餴琺,不占用
function x712506_OnCreate( sceneId, growPointType, x, y, dur)
	local ItemBoxId = nil
	local delDur = dur - 60000;	--宝箱或珍兽to� 鸬 消失时间
	
	-- 宝箱里有几c醝物品
	local numIdx = x712506_GetTableIndexByOdd(x712506_g_DropNumTable)
	if(numIdx) then
		for i = 1, x712506_g_DropNumTable[numIdx].num do
			--C醝 n鄖 物品喧ng什么类型to� 鸬 物品
			local showIdx = x712506_GetTableIndexByOdd(x712506_g_DropTable)
			local dropNumIdx = nil
			local itemId = nil
			if(showIdx) then
				--C醝 n鄖 类型to� 鸬 物品数量喧ng几c醝
				dropNumIdx = x712506_GetTableIndexByOdd(x712506_g_DropTable[showIdx].numOdd)
				if(dropNumIdx and 9 ~= x712506_g_DropTable[showIdx].itemType) then
					local itemNum = getn(x712506_g_DropTable[showIdx].idx)
					if(itemNum and 1<=itemNum) then
						local itemIdx = floor(random(1, itemNum))
						itemId = x712506_g_DropTable[showIdx].idx[itemIdx]
						--添加掉落箱和物品到场景
						for k = 1, x712506_g_DropTable[showIdx].numOdd[dropNumIdx].num do
							if(nil == ItemBoxId) then
								ItemBoxId = ItemBoxEnterScene( x, y, growPointType, sceneId, QUALITY_MUST_BE_CHANGE,1, itemId )
								print( sceneId .. " Tr叨ng c鋘h s� (" .. x .. ", " .. y .. ") t誳 ra m祎 v ph "..
											 "("..x712506_g_DropNumTable[numIdx].num..")" )
							else
								AddItemToBox( sceneId, ItemBoxId, QUALITY_MUST_BE_CHANGE,1, itemId )
							end
						end
					end
				elseif(dropNumIdx and 9 == x712506_g_DropTable[showIdx].itemType) then
					local petIdx = floor(random(1, getn(x712506_g_DropTable[showIdx].idx)))
					local petId = x712506_g_DropTable[showIdx].idx[petIdx]
					--添加珍兽到场景
					for k = 1, x712506_g_DropTable[showIdx].numOdd[dropNumIdx].num do
						local PetObjId = nil
						PetObjId = CreatePetOnScene( sceneId, petId, x, y )
						SetCharacterDieTime( sceneId, PetObjId, delDur )
						print( sceneId .. " Tr叨ng c鋘h s� (" .. x .. ", " .. y .. ") t誳 ra m祎 Tr鈔 th� "..
									 GetName( sceneId, PetObjId ) .. "." )
					end 
				end
			end --end of if(showIdx) then
			
			--记录物品掉落包所包含to� 鸬 内容
			if(showIdx and dropNumIdx and itemId ~= nil) then
				if(9 ~= x712506_g_DropTable[showIdx].itemType) then
					local itemName;
					_,itemName,_ = GetItemInfoByItemId(itemId)
					print("V ph b阯 trong c� (lo読 "..x712506_g_DropTable[showIdx].itemType..")"..
								x712506_g_DropTable[showIdx].numOdd[dropNumIdx].num..
								" m祎 ["..itemName.."].")
					itemNum = x712506_g_DropTable[showIdx].numOdd[dropNumIdx].num;
					LuaFnAuditItemCreate(sceneId, -1, itemNum, itemId, itemName, "T� b鋙 s呓ng t誳 ra");
				end
			end
			
		end -- end of for i = 1, x712506_g_DropNumTable[numIdx].num do
		
		--设定回收时间
		if(ItemBoxId) then
			SetItemBoxMaxGrowTime( sceneId, ItemBoxId, delDur )
			return 0	--C醝 n鄖 坐标被宝箱占用了
		end
	end
	
	return -1	--C醝 n鄖 坐标没有被占用
end
--生成函数结束**********************************************************************

--m祎 次创建多c醝宝箱to� 鸬 完成函数开始****************************************************
function x712506_OnTickCreateFinish( sceneId, growPointType, tickCount )
	if(strlen(x712506_g_TickCreate_Msg) > 0) then
		--2006-8-22 14:37 等待晓健to� 鸬 server对话平台
		print( sceneId .. " Tr叨ng c鋘h s� "..x712506_g_TickCreate_Msg)
	end
end
--m祎 次创建多c醝宝箱to� 鸬 完成函数结束****************************************************

--打开前函数开始
function x712506_OnOpen( sceneId, selfId, targetId )
--Tr� v嘈�
-- 0 表示打开成功
end
--打开前函数结束


--回收函数开始
function x712506_OnRecycle( sceneId, selfId, targetId )
--Tr� v�1,生长 餴琺回收
	return 1
end
--回收函数结束

--打开后函数开始
function x712506_OnProcOver( sceneId, selfId, targetId )
end

--打开后函数结束
function x712506_OpenCheck( sceneId, selfId, AbilityId, AblityLevel )
	return OR_OK
end
