--检测植物能否显示T読 列表中和能否种植to� 鸬 脚本

--脚本号
x713551_g_scriptId = 713551

--检测植物能否显示T読 列表中和能否种植to� 鸬 函数
v_ZhongZhiId = {20104001,20104002,20104003,20104004,20104005,20104006,20104007,20104008,20104009,20104010,
				20104011,20104012,20105001,20105002,20105003,20105004,20105005,20105006,20105007,20105008,
				20105009,20105010,20105011,20105012}		--数组,用来存放种植物to� 鸬 Id
v_ZhongZhiNeedLevel = {1,2,3,4,5,6,7,8,9,10,
						11,12,1,2,3,4,5,6,7,8,
						9,10,11,12}				--数组,用来存放种植物对应to� 鸬 等c
v_ZhongZhiName = {"Ti瑄 M誧h","姓i M�","Ng鱟 M�","Hoa Sinh","H皀g Th�","Cao L呓ng","Chi Ma","L鴆 效u","Ho鄋g 效u","T鄊 效u",
					"M� Linh Th�","Vu 啸u","Ma","Mi阯","Chu","L鴄","Quy阯","Ty","衞課","L錸g",
					"La","Nhung","Sa","C"}		--数组,用来存放种植物对应名称
v_ItemBoxTypeId = {501,504,507,510,513,516,519,522,525,528,
					531,534,537,540,543,546,549,552,555,558,
					561,564,567,570}				--用来查找ItemBoxto� 鸬 类型
function x713551_CheckZhiWuValid(sceneId,selfId,zhiwuId)
	v_AbilityLevel = QueryHumanAbilityLevel(sceneId, selfId, ABILITY_ZHONGZHI) 
	for k, findId in v_ZhongZhiId do	--遍历所有种植物to� 鸬 Id
		if zhiwuId == findId then		--如果传过来to� 鸬 Id==遍历到to� 鸬 Id
			if v_AbilityLevel >= v_ZhongZhiNeedLevel[k] then	--如果玩家种植技能等c>=该植物要求技能等c]
				return k
			else
			return 0
			end
			return -1  --没有这种植物
		end
	end
end


function x713551_FindItemBoxTypeId(sceneId,selfId,zhiwuId)

	for m, findId in v_ZhongZhiId do	
		if zhiwuId == findId then
			return v_ItemBoxTypeId[m]
		end
	end

	return 0
end

function x713551_FindZhiWuLevel(sceneId,selfId,zhiwuId)
	for n, findId in v_ZhongZhiId do	
		if zhiwuId == findId then
			return v_ZhongZhiNeedLevel[n]
		end
	end

	return 0
end
