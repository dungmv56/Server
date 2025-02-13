--生长 餴琺脚本,花生3
--脚本号
--g_ScriptId = 711011

--此生长 餴琺编号
x711011_g_GpId = 512

--生长 餴琺C to� 鸬 等c
x711011_g_ItemBoxNeedLevel = 4

function	x711011_OnOpen(sceneId,selfId,targetId)
	-- 餴琺到生长 餴琺to� 鸬 主人GUID
	ItemBoxOwnerGUID = GetItemBoxOwner(sceneId, targetId)		--参数喧ngSceneID,ItemBoxID
	-- 餴琺到 餴琺击生长 餴琺to� 鸬 玩家to� 鸬 guid
	PlayerGuid = GetHumanGUID(sceneId,selfId)
	if ItemBoxOwnerGUID~= PlayerGuid then
		BeginEvent(sceneId)
	  		AddText(sceneId,"随便收割别人种to� 鸬 庄稼可不行呦!");
	  	EndEvent(sceneId)
	  	DispatchMissionTips(sceneId,selfId)
		return OR_INVALID_TARGET_POS
	end
	-- 餴琺到技能等c
	AbilityLevel = QueryHumanAbilityLevel( sceneId, selfId, ABILITY_ZHONGZHI)
	if AbilityLevel >= x711011_g_ItemBoxNeedLevel then
		return OR_OK
	else
		return OR_NO_LEVEL
	end
end

function	x711011_OnProcOver(sceneId,selfId,targetId)
	return OR_OK
end

function	 x711011_OnRecycle(sceneId,selfId,targetId)
	local num = 0
	--取 餴琺生长 餴琺to� 鸬 坐标
	GP_X = GetItemBoxWorldPosX(sceneId,targetId)
	GP_Z = GetItemBoxWorldPosZ(sceneId,targetId)
	--下取整
	GP_X = floor(GP_X)
	GP_Z = floor(GP_Z)
	--判断种植牌to� 鸬 位置T読 哪c醝种植牌管辖to� 鸬 范围内
	for i, findid in PLANTNPC_ADDRESS do
		if	(GP_X >= findid.X_MIN)  and (GP_Z >= findid.Z_MIN) and (GP_X <= findid.X_MAX)  and (GP_Z <= findid.Z_MAX) and (sceneId == findid.Scene) then
			num = i	
			break
		end
	end
	
	--如果找不到正确to� 鸬 位置则Tr� v�
	if num == 0 then
		return
	end
	--找到正确to� 鸬 编号,把种植牌-1
	PLANTFLAG[num] = PLANTFLAG[num] - 1
	return 1
end
