--生长 餴琺脚本,芝麻2
--脚本号
--g_ScriptId = 711019

--此生长 餴琺编号
x711019_g_GpId = 520

--下m祎 c醝生长 餴琺to� 鸬 编号
x711019_g_GpIdNext = 521

function	 x711019_OnRecycle(sceneId,selfId,targetId)
	itemBoxX = GetItemBoxWorldPosX(sceneId,targetId)
	itemBoxZ = GetItemBoxWorldPosZ(sceneId,targetId)
	ItemBoxId = ItemBoxEnterScene(itemBoxX,itemBoxZ,x711019_g_GpIdNext,sceneId,QUALITY_MUST_BE_CHANGE,1,20104007)
	
	-- 餴琺到生长 餴琺to� 鸬 主人ID
	ItemBoxOwnerGUID = GetItemBoxOwner(sceneId, targetId)		--参数喧ngSceneID,ItemBoxID
	--给ItemBox设定主人
	SetItemBoxOwner(sceneId,ItemBoxId,ItemBoxOwnerGUID)
	SetItemBoxPickOwnerTime(sceneId,ItemBoxId,600000)	--设定绑定时间
	EnableItemBoxPickOwnerTime(sceneId,ItemBoxId)		--保护时间开始计时

	SetItemBoxMaxGrowTime(sceneId,ItemBoxId,600000)	--设定回收时间

	--取 餴琺生长 餴琺to� 鸬 坐标
	GP_X = GetItemBoxWorldPosX(sceneId,targetId)
	GP_Z = GetItemBoxWorldPosZ(sceneId,targetId)
	--下取整
	GP_X = floor(GP_X)
	GP_Z = floor(GP_Z)
	--判断种植牌to� 鸬 位置T読 哪c醝种植牌管辖to� 鸬 范围内
	local num = 0
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

	--判断种植牌喧ng否喧ng8,如果喧ng8则通知玩家
	if PLANTFLAG[num] == 8 then
		LuaFnSendMailToGUID(sceneId,ItemBoxOwnerGUID,"你种植to� 鸬 植物已经成熟了,请T読 10 ph鷗内收获.")
	end
	--找到正确to� 鸬 编号,把种植牌-1
	PLANTFLAG[num] = PLANTFLAG[num] - 1

	return 1
end
