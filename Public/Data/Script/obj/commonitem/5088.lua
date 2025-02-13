--注意

--物品技能to� 鸬 逻辑只能使用基础技能和脚本来实现


--脚本:

--以下喧ng脚本样例:


--5088.lua
------------------------------------------------------------------------------------------
--九州神龙to� 鸬 默认脚本

--脚本号
 x335088_g_scriptId = 335088 --临时写C醝 n鄖 ,真正用to� 鸬 时候m祎 定要改.

--4801	坐骑: 虎		447	骑术: 虎  			456	骑术: 白虎
--4802	坐骑: 黄骠马	448	骑术: 黄骠马		457	骑术: 青白骢马
--4803	坐骑: 骆驼		449	骑术: 骆驼			458	骑术: 白骆驼
--4804	坐骑: 鹤		450	骑术: 鹤			459	骑术: 金翼鹤
--4805	坐骑: 青凤		451	骑术: 青凤			460	骑术: 红白凤
--4806	坐骑: 牦牛		452	骑术: 牦牛			461	骑术: 白牦牛
--4807	坐骑: 鹿		453	骑术: 鹿			462	骑术: 白鹿
--4808	坐骑: 雕		454	骑术: 雕			463	骑术: 白雕
--4809	坐骑: 灰狼		455	骑术: 灰狼			464	骑术: 白狼
--4810	坐骑: 白虎		456	骑术: 白虎    
--4811	坐骑: 青白骢马  457	骑术: 青白骢马
--4812	坐骑: 白骆驼    458	骑术: 白骆驼  
--4813	坐骑: 金翼鹤    459	骑术: 金翼鹤  
--4814	坐骑: 红白凤    460	骑术: 红白凤  
--4815	坐骑: 白牦牛    461	骑术: 白牦牛  
--4816	坐骑: 白鹿      462	骑术: 白鹿    
--4817	坐骑: 白雕      463	骑术: 白雕    
--4912	坐骑: 白狼      464	骑术: 白狼  
--4952  坐骑: 大象      443	骑术: 大象
--4914  坐骑: 白象      444	骑术: 白象
--4948									437	骑术: 蜘蛛
--4952									438	骑术: 熊
--4951									439	骑术: 木牛流马
--4981									440	骑术: 陆吾
--4949									441	骑术: 玄龟
--4946									442	骑术: 犀牛

--注: 两c醝骑术会m祎 c醝就可以骑了
 x335088_g_Equitation1 = 1119 --C to� 鸬 骑术
 x335088_g_Equitation2 = -1 --C to� 鸬 骑术
--效果to� 鸬 ID
 x335088_g_Impact1 = 4744 --临时写C醝 n鄖 
 x335088_g_Impact2 = -1 --不用

--**********************************
--事件交互入口
--**********************************
function  x335088_OnDefaultEvent( sceneId, selfId, bagIndex )
-- 骑乘不C C醝 n鄖 接口,但要保留空函数
end

--**********************************
--C醝 n鄖 物品to� 鸬 使用过程喧ng否类似于技能: 
--H� th痭g会T読 执行开始时检测C醝 n鄖 函数to� 鸬 Tr� v�,如果Tr� v玹h b読则忽略后面to� 鸬 类似技能to� 鸬 执行.
--Tr� v�1: 技能类似to� 鸬 物品,可以继续类似技能to� 鸬 执行；Tr� v�0: 忽略后面to� 鸬 操作.
--**********************************
function  x335088_IsSkillLikeScript( sceneId, selfId)
	return 1; --C醝 n鄖 脚本C 动作支持
end

--**********************************
--直接Hu� b鲂Ч�: 
--H� th痭g会直接调用C醝 n鄖 接口,并根据C醝 n鄖 函数to� 鸬 Tr� v礨醕 nh以后to� 鸬 流程喧ng否执行.
--Tr� v�1: 已经Hu� b龆杂πЧ�,不再执行后续操作；Tr� v�0: 没有检测到相关效果,继续执行.
--**********************************
function  x335088_CancelImpacts( sceneId, selfId )
	nRet = 0;
	nRet = LuaFnCancelSpecificImpact(sceneId, selfId,  x335088_g_Impact1)
	if(0<nRet) then
		return 1;
	end
	return 0;
end

--**********************************
--条件检测入口: 
--H� th痭g会T読 技能检测to� 鸬 时间 餴琺调用C醝 n鄖 接口,并根据C醝 n鄖 函数to� 鸬 Tr� v礨醕 nh以后to� 鸬 流程喧ng否执行.
--Tr� v�1: 条件检测通过,可以继续执行；Tr� v�0: 条件检测th b読,中断后续执行.
--**********************************
function  x335088_OnConditionCheck( sceneId, selfId )
	--校验使用to� 鸬 物品
	--if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		--return 0
	--end
	--两c醝骑术,会m祎 c醝就可以了
	if(-1~= x335088_g_Equitation1) then
		if(1==LuaFnHaveSpecificEquitation(sceneId, selfId,  x335088_g_Equitation1)) then
			return 1
		end
	end
	if(-1~= x335088_g_Equitation2) then
		if(1==LuaFnHaveSpecificEquitation(sceneId, selfId,  x335088_g_Equitation2)) then
			return 1
		end
	end
	LuaFnSendOResultToPlayer(sceneId, selfId, OR_NEED_EQUITATION_FIRST)
	return 0; 
end

--**********************************
--消耗检测及处理入口: 
--H� th痭g会T読 技能消耗to� 鸬 时间 餴琺调用C醝 n鄖 接口,并根据C醝 n鄖 函数to� 鸬 Tr� v礨醕 nh以后to� 鸬 流程喧ng否执行.
--Tr� v�1: 消耗处理通过,可以继续执行；Tr� v�0: 消耗检测th b読,中断后续执行.
--注意: 这不光负责消耗to� 鸬 检测也负责消耗to� 鸬 执行.
--**********************************
function  x335088_OnDeplete( sceneId, selfId )
	return 1; --骑乘不消耗
end

--**********************************
--只会执行m祎 次入口: 
--聚气和瞬发技能会T読 消耗完成后调用C醝 n鄖 接口(聚气结束并且各种条件都Th鯽 m鉵to� 鸬 时候),而引导
--技能也会T読 消耗完成后调用C醝 n鄖 接口(技能to� 鸬 m祎 开始,消耗成功执行之后).
--Tr� v�1: 处理成功；Tr� v�0: 处理th b読.
--注: 这里喧ng技能生效m祎 次to� 鸬 入口
--**********************************
function  x335088_OnActivateOnce( sceneId, selfId )
	if(-1~= x335088_g_Impact1) then
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,  x335088_g_Impact1, 0)
	end
	Msg2Player( sceneId,selfId,"Ng呓i 疸 kh鬾g � khu v馽 v chuy琻.",MSG2PLAYER_PARA) --通知玩家
	return 1;
end

--**********************************
--引导心跳处理入口: 
--引导技能会T読 每次心跳结束时调用C醝 n鄖 接口.
--Tr� v�: 1继续下次心跳；0: 中断引导.
--注: 这里喧ng技能生效m祎 次to� 鸬 入口
--**********************************
function  x335088_OnActivateEachTick( sceneId, selfId)
	return 1; --骑乘不喧ng引导性脚本, 只保留空函数.
end
