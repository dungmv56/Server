--生长 餴琺
--对应生活技能: -1
--地宫宝物掉落器
--脚本号******(712533)

--m祎 c醝宝箱里含有几c醝物品
x712533_g_DropNumTable  = {
	{num = 1, odd = 1.0},	--1c醝to� 鸬 几率
}

x712533_g_TickCreate_Msg = "秦皇地宫会落下物品 疬a cho 大家!"

--每种物品喧ng哪类物品,且此类物品堆叠数量喧ng几c醝
x712533_g_DropTable = {
	--宝石类
	{
		itemType = 7, 	--宝石类to� 鸬 类型标识
	 	odd = 1.0, 		--出现几率
	 	numOdd = {
							{num = 1, odd = 1.0},				--1c醝to� 鸬 几率
						 },
		idx = {	--物品序列号表
						20310004, --zchw 秦皇珠
					},
	},
}

--宝物回收时间2006-8-21 17:33 修改为由管理器传递进来

--根据本次随机数来找到表中对应to� 鸬 索引
function x712533_GetTableIndexByOdd(tb)
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
function x712533_OnCreate( sceneId, growPointType, x, y, dur)
	local ItemBoxId = nil
	local delDur = dur - 60000;	--宝箱to� 鸬 消失时间
	
	-- 宝箱里有几c醝物品
	local numIdx = x712533_GetTableIndexByOdd(x712533_g_DropNumTable)
	if(numIdx) then
		for i = 1, x712533_g_DropNumTable[numIdx].num do
			--C醝 n鄖 物品喧ng什么类型to� 鸬 物品
			local showIdx = x712533_GetTableIndexByOdd(x712533_g_DropTable)
			local dropNumIdx = nil
			local itemId = nil
			if(showIdx) then
				--C醝 n鄖 类型to� 鸬 物品数量喧ng几c醝
				dropNumIdx = x712533_GetTableIndexByOdd(x712533_g_DropTable[showIdx].numOdd)
				if(dropNumIdx and 9 ~= x712533_g_DropTable[showIdx].itemType) then
					local itemNum = getn(x712533_g_DropTable[showIdx].idx)
					if(itemNum and 1<=itemNum) then
						local itemIdx = floor(random(1, itemNum))
						itemId = x712533_g_DropTable[showIdx].idx[itemIdx]
						--添加掉落箱和物品到场景
						for k = 1, x712533_g_DropTable[showIdx].numOdd[dropNumIdx].num do
							if(nil == ItemBoxId) then
								ItemBoxId = ItemBoxEnterScene( x, y, growPointType, sceneId, QUALITY_MUST_BE_CHANGE,1, itemId )
								print( sceneId .. " Tr叨ng c鋘h s� (" .. x .. ", " .. y .. ") t誳 ra m祎 v ph "..
											 "("..x712533_g_DropNumTable[numIdx].num..")" )
							else
								AddItemToBox( sceneId, ItemBoxId, QUALITY_MUST_BE_CHANGE,1, itemId )
							end 
						end
					end
				elseif(dropNumIdx and 9 == x712533_g_DropTable[showIdx].itemType) then
					local petIdx = floor(random(1, getn(x712533_g_DropTable[showIdx].idx)))
					local petId = x712533_g_DropTable[showIdx].idx[petIdx]
					--添加珍兽到场景
					for k = 1, x712533_g_DropTable[showIdx].numOdd[dropNumIdx].num do
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
				if(9 ~= x712533_g_DropTable[showIdx].itemType) then
					local itemName;
					_,itemName,_ = GetItemInfoByItemId(itemId)
					print("V ph b阯 trong c� (lo読 "..x712533_g_DropTable[showIdx].itemType..")"..
								x712533_g_DropTable[showIdx].numOdd[dropNumIdx].num..
								" m祎 ["..itemName.."].")
					itemNum = x712533_g_DropTable[showIdx].numOdd[dropNumIdx].num;
					LuaFnAuditItemCreate(sceneId, -1, itemNum, itemId, itemName, "T� b鋙 s呓ng t誳 ra");
				end
			end
			
		end -- end of for i = 1, x712533_g_DropNumTable[numIdx].num do
		
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
function x712533_OnTickCreateFinish( sceneId, growPointType, tickCount )
	if(strlen(x712533_g_TickCreate_Msg) > 0) then
		--2006-8-22 14:37 等待晓健to� 鸬 server对话平台
		print( sceneId .. " Tr叨ng c鋘h s� "..x712533_g_TickCreate_Msg)
	end
end
--m祎 次创建多c醝宝箱to� 鸬 完成函数结束****************************************************

--打开前函数开始
function x712533_OnOpen( sceneId, selfId, targetId )
--Tr� v嘈�
-- 0 表示打开成功
end
--打开前函数结束


--回收函数开始
function x712533_OnRecycle( sceneId, selfId, targetId )
--Tr� v�1,生长 餴琺回收
	return 1
end
--回收函数结束

--打开后函数开始
function x712533_OnProcOver( sceneId, selfId, targetId )
end

--打开后函数结束
function x712533_OpenCheck( sceneId, selfId, AbilityId, AblityLevel )
	return OR_OK
end
