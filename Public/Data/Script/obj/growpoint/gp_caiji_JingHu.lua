-- 生长 餴琺 采集[采矿采药]

-- 脚本号
x710531_g_ScriptId = 710531

-- 生长 餴琺信息
x710531_g_GPInfo = {}

-- 随机因子
x710531_g_RandNum = 10000

-- abilityId: 生长 餴琺对应技能 name: 生长 餴琺to� 鸬 T阯
-- mainId: 主要掉出物 mExtraCountOdds: 主要掉出物额外掉出数量to� 鸬 几率
-- associatedId: 副产品列表,aOdds 几率出现时随机出m祎 c醝,列表可以为空 aOdds: 副产品掉出率 aExtraCountOdds: 出现副产品后额外数量几率
-- rareId: 稀有物品,稀有物品可以没有,填 -1, rOdds: 稀有物品掉出率
-- needLevel: 采集此生长 餴琺C to� 鸬 c别

-- 以下部分为草药

x710531_g_GPInfo[776] = { abilityId = ABILITY_CAIYAO, name = "K韓h H� Thi阯 Ni阯 Th鋙", mainId = 40004414 }

-- 以上部分为草药

-- 长生长 餴琺
function x710531_OnCreate( sceneId, growPointType, x, y )
	
	
	-------------------------------------------------------------------	
	--活动喧ng否开始
	local actId = 36;	
	local bActStatus = GetActivityParam( sceneId, actId, 0 );
	
	if bActStatus <= 0 then
		return -1;
	end
	
	--草药喧ng否已经产生
	local bQianNianCaoGen = GetActivityParam( sceneId, actId, 1 );

	if bQianNianCaoGen > 0 then
		return -1;
	end
	-------------------------------------------------------------------

	
	PrintStr("growPointType".."x:"..x.."y:"..y);

	-- 每c醝生长 餴琺最少能 餴琺到m祎 c醝物品,这里直接放入 itembox 中m祎 c醝
	local ItemBoxId = ItemBoxEnterScene( x, y, growPointType, sceneId, QUALITY_MUST_BE_CHANGE,1, 40004414 )	
	SetItemBoxMaxGrowTime(sceneId,ItemBoxId,30*60*1000)	--设定回收时间
	
	SetActivityParam( sceneId, actId, 1, 1 );
	
--	local message = format("@*;SrvMsg;SCA:#{JingHu_LingYao_00}" );	
--	AddGlobalCountNews( sceneId, message )

end

--  餴琺击生长 餴琺时
function x710531_OnOpen( sceneId, selfId, targetId )



	return OR_OK
end

-- 进度条走完了
function x710531_OnProcOver( sceneId, selfId, targetId )
	local growPointType = LuaFnGetItemBoxGrowPointType( sceneId, targetId )
	

	-- 消耗Tinh力
--	CallScriptFunction( ABILITYLOGIC_ID, "EnergyCostCaiJi", sceneId, selfId, GPInfo.abilityId, GPInfo.needLevel )
	return OR_OK
end

-- 箱子捡完了,回收
function x710531_OnRecycle( sceneId, selfId, targetId)
	local growPointType = LuaFnGetItemBoxGrowPointType( sceneId, targetId )
	

	--统计数据
	LuaFnAuditHDXianCaoZhengDuo(sceneId, selfId, "H醝 thu th Ti阯 th鋙");

--	LuaFnAuditAbility(sceneId, selfId, GPInfo.abilityId, -1, -1)
	-- 增加熟练度
--	CallScriptFunction( ABILITYLOGIC_ID, "GainExperience", sceneId, selfId, GPInfo.abilityId, GPInfo.needLevel )
	--Tr� v�1,生长 餴琺回收
	return 1
end

function x710531_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

function x710531_OnTickCreateFinish( sceneId, growPointType, tickCount )
end
