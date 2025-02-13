--商店
--门派商店
--Thi阯 S絥 玄冰术

--脚本号
x701612_g_ScriptId = 701612

--商店号
x701612_g_shoptableindex=58

--商店名称
x701612_g_ShopName = "Mua ph呓ng th裞 huy玭 b錸g"

--**********************************
--任务入口函数
--**********************************
function x701612_OnDefaultEvent( sceneId, selfId, targetId )	-- 餴琺击该任务后执行此脚本
	DispatchShopItem( sceneId, selfId,targetId, x701612_g_shoptableindex )
end

--**********************************
--列举事件
--**********************************
function x701612_OnEnumerate( sceneId, selfId, targetId )
	--判断喧ng否喧ng本派弟子
	if GetMenPai(sceneId,selfId) == MP_TIANSHAN then
		AddNumText(sceneId,x701612_g_ScriptId,x701612_g_ShopName,7,-1)
    end
	return
end

--**********************************
--检测Ti猵 th跫�
--**********************************
function x701612_CheckAccept( sceneId, selfId )
end

--**********************************
--Ti猵 th�
--**********************************
function x701612_OnAccept( sceneId, selfId )
end

--**********************************
--放弃
--**********************************
function x701612_OnAbandon( sceneId, selfId )
end

--**********************************
--继续
--**********************************
function x701612_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--检测喧ng否可以提交
--**********************************
function x701612_CheckSubmit( sceneId, selfId )
end

--**********************************
--提交
--**********************************
function x701612_OnSubmit( sceneId, selfId, targetId,selectRadioId )
end

--**********************************
--杀死怪物或玩家
--**********************************
function x701612_OnKillObject( sceneId, selfId, objdataId,objId)
end

--**********************************
--进入区域事件
--**********************************
function x701612_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x701612_OnItemChanged( sceneId, selfId, itemdataId )
end
