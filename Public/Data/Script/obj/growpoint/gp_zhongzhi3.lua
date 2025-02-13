--生长 餴琺脚本,果实系列

--脚本号
--g_ScriptId = 711002

-- 生长 餴琺信息
x711002_g_GPInfo = {}

-- 生长 餴琺类型号为索引号

-- abilityId: 生长 餴琺对应技能
-- needLevel: 学习此配方C to� 鸬 相应生活技能c别

x711002_g_GPInfo[	503	] = { abilityId = ABILITY_ZHONGZHI, needLevel =	1	}
x711002_g_GPInfo[	506	] = { abilityId = ABILITY_ZHONGZHI, needLevel =	2	}
x711002_g_GPInfo[	509	] = { abilityId = ABILITY_ZHONGZHI, needLevel =	3	}
x711002_g_GPInfo[	512	] = { abilityId = ABILITY_ZHONGZHI, needLevel =	4	}
x711002_g_GPInfo[	515	] = { abilityId = ABILITY_ZHONGZHI, needLevel =	5	}
x711002_g_GPInfo[	518	] = { abilityId = ABILITY_ZHONGZHI, needLevel =	6	}
x711002_g_GPInfo[	521	] = { abilityId = ABILITY_ZHONGZHI, needLevel =	7	}
x711002_g_GPInfo[	524	] = { abilityId = ABILITY_ZHONGZHI, needLevel =	8	}
x711002_g_GPInfo[	527	] = { abilityId = ABILITY_ZHONGZHI, needLevel =	9	}
x711002_g_GPInfo[	530	] = { abilityId = ABILITY_ZHONGZHI, needLevel =	10	}
x711002_g_GPInfo[	533	] = { abilityId = ABILITY_ZHONGZHI, needLevel =	11	}
x711002_g_GPInfo[	536	] = { abilityId = ABILITY_ZHONGZHI, needLevel =	12	}
x711002_g_GPInfo[	539	] = { abilityId = ABILITY_ZHONGZHI, needLevel =	1	}
x711002_g_GPInfo[	542	] = { abilityId = ABILITY_ZHONGZHI, needLevel =	2	}
x711002_g_GPInfo[	545	] = { abilityId = ABILITY_ZHONGZHI, needLevel =	3	}
x711002_g_GPInfo[	548	] = { abilityId = ABILITY_ZHONGZHI, needLevel =	4	}
x711002_g_GPInfo[	551	] = { abilityId = ABILITY_ZHONGZHI, needLevel =	5	}
x711002_g_GPInfo[	554	] = { abilityId = ABILITY_ZHONGZHI, needLevel =	6	}
x711002_g_GPInfo[	557	] = { abilityId = ABILITY_ZHONGZHI, needLevel =	7	}
x711002_g_GPInfo[	560	] = { abilityId = ABILITY_ZHONGZHI, needLevel =	8	}
x711002_g_GPInfo[	563	] = { abilityId = ABILITY_ZHONGZHI, needLevel =	9	}
x711002_g_GPInfo[	566	] = { abilityId = ABILITY_ZHONGZHI, needLevel =	10	}
x711002_g_GPInfo[	569	] = { abilityId = ABILITY_ZHONGZHI, needLevel =	11	}
x711002_g_GPInfo[	572	] = { abilityId = ABILITY_ZHONGZHI, needLevel =	12	}

x711002_g_GPInfo[	703	] = { abilityId = ABILITY_ZHONGZHI, needLevel =	1	}
x711002_g_GPInfo[	706	] = { abilityId = ABILITY_ZHONGZHI, needLevel =	2	}
x711002_g_GPInfo[	709	] = { abilityId = ABILITY_ZHONGZHI, needLevel =	3	}
x711002_g_GPInfo[	712	] = { abilityId = ABILITY_ZHONGZHI, needLevel =	4	}
x711002_g_GPInfo[	715	] = { abilityId = ABILITY_ZHONGZHI, needLevel =	5	}
x711002_g_GPInfo[	718	] = { abilityId = ABILITY_ZHONGZHI, needLevel =	6	}
x711002_g_GPInfo[	721	] = { abilityId = ABILITY_ZHONGZHI, needLevel =	7	}
x711002_g_GPInfo[	724	] = { abilityId = ABILITY_ZHONGZHI, needLevel =	8	}
x711002_g_GPInfo[	727	] = { abilityId = ABILITY_ZHONGZHI, needLevel =	9	}
x711002_g_GPInfo[	730	] = { abilityId = ABILITY_ZHONGZHI, needLevel =	10	}
x711002_g_GPInfo[	733	] = { abilityId = ABILITY_ZHONGZHI, needLevel =	11	}
x711002_g_GPInfo[	736	] = { abilityId = ABILITY_ZHONGZHI, needLevel =	12	}
x711002_g_GPInfo[	739	] = { abilityId = ABILITY_ZHONGZHI, needLevel =	1	}
x711002_g_GPInfo[	742	] = { abilityId = ABILITY_ZHONGZHI, needLevel =	2	}
x711002_g_GPInfo[	745	] = { abilityId = ABILITY_ZHONGZHI, needLevel =	3	}
x711002_g_GPInfo[	748	] = { abilityId = ABILITY_ZHONGZHI, needLevel =	4	}
x711002_g_GPInfo[	751	] = { abilityId = ABILITY_ZHONGZHI, needLevel =	5	}
x711002_g_GPInfo[	754	] = { abilityId = ABILITY_ZHONGZHI, needLevel =	6	}
x711002_g_GPInfo[	757	] = { abilityId = ABILITY_ZHONGZHI, needLevel =	7	}
x711002_g_GPInfo[	760	] = { abilityId = ABILITY_ZHONGZHI, needLevel =	8	}
x711002_g_GPInfo[	763	] = { abilityId = ABILITY_ZHONGZHI, needLevel =	9	}
x711002_g_GPInfo[	766	] = { abilityId = ABILITY_ZHONGZHI, needLevel =	10	}
x711002_g_GPInfo[	769	] = { abilityId = ABILITY_ZHONGZHI, needLevel =	11	}
x711002_g_GPInfo[	772	] = { abilityId = ABILITY_ZHONGZHI, needLevel =	12	}

function x711002_OnOpen( sceneId, selfId, targetId )
	
	local growPointType = LuaFnGetItemBoxGrowPointType( sceneId, targetId )
	local GPInfo = x711002_g_GPInfo[growPointType]
	if not GPInfo then
		return 1
	end

	-- 餴琺到生长 餴琺to� 鸬 主人GUID
	local ItemBoxOwnerGUID = GetItemBoxOwner( sceneId, targetId )		--参数喧ngSceneID,ItemBoxID

	-- 餴琺到 餴琺击生长 餴琺to� 鸬 玩家to� 鸬 guid
	local PlayerGuid = GetHumanGUID( sceneId, selfId )
	if ItemBoxOwnerGUID ~= PlayerGuid then
	  	x711002_NotifyFailTips( sceneId, selfId, "Tuy ti畁 thu l鷄 g誳 c黙 ng叨i kh醕 l� kh鬾g 疬㧟!" )
		return OR_INVALID_TARGET_POS
	end

	-- 餴琺到技能等c
	local AbilityLevel = QueryHumanAbilityLevel( sceneId, selfId, GPInfo.abilityId )
	if AbilityLevel >= GPInfo.needLevel then
		return OR_OK
	else
		return OR_NO_LEVEL
	end
end

function x711002_OnProcOver( sceneId, selfId, targetId )
	return OR_OK
end

function x711002_OnRecycle( sceneId, selfId, targetId )
	local growPointType = LuaFnGetItemBoxGrowPointType( sceneId, targetId )
	local GPInfo = x711002_g_GPInfo[growPointType]
	if not GPInfo then
		return 1
	end

	--取 餴琺生长 餴琺to� 鸬 坐标
	local GP_X = GetItemBoxWorldPosX( sceneId, targetId )
	local GP_Z = GetItemBoxWorldPosZ( sceneId, targetId )

	--下取整
	GP_X = floor( GP_X )
	GP_Z = floor( GP_Z )

	--判断种植牌to� 鸬 位置T読 哪c醝种植牌管辖to� 鸬 范围内
	local num = 0
	local i = 0
	for i, findid in PLANTNPC_ADDRESS do
		if GP_X >= findid.X_MIN
		 and GP_Z >= findid.Z_MIN
		 and GP_X <= findid.X_MAX
		 and GP_Z <= findid.Z_MAX
		 and sceneId == findid.Scene then
			num = i
			break
		end
	end

	--如果找不到正确to� 鸬 位置则Tr� v�
	if num == 0 then
		return 1
	end

	--找到正确to� 鸬 编号,把种植牌-1
	PLANTFLAG[num] = PLANTFLAG[num] - 1

	return 1
end

function x711002_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
