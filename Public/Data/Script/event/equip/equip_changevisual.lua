--装备改变外形
--脚本号
x809264_g_ScriptId = 809264

--装备改变外形UI 1010

--**********************************
--列举事件
--**********************************
function x809264_OnEnumerate( sceneId, selfId, targetId )

end


--**********************************
--装备改变外形
--**********************************
function x809264_ChangeVisual( sceneId, selfId, nItemIndex1, nItemIndex2, nVisualIndex)
	local text="Thay 鸨i ngo読 h靚h th鄋h c鬾g"

	local ret = LuaFnIsItemAvailable( sceneId, selfId, nItemIndex1 )
	if ret ~= 1 then
		BeginEvent(sceneId)
		AddText(sceneId,"Xin 穑t v鄌 trang b� c� th� bi猲 h靚h");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	ret = LuaFnIsItemAvailable( sceneId, selfId, nItemIndex2 )
	if ret ~= 1 then
		BeginEvent(sceneId)
		AddText(sceneId,"Xin 穑t v鄌 ph� bi猲 h靚h");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	sy_index = LuaFnGetItemTableIndexByIndex( sceneId, selfId, nItemIndex2 )
	if sy_index ~= 30900004 then
		--变形符
		BeginEvent(sceneId)
		AddText(sceneId,"Thay 鸨i ngo読 h靚h trang b� c ph� bi猲 h靚h");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	money = GetMoney( sceneId, selfId )
	need_money = GetBagItemLevel( sceneId, selfId, nItemIndex1 ) * 20000
	if money < need_money then
		text="Ngo読 h靚h trang b� l鄊 m課h c #{_MONEY%d}, ng鈔 l唼ng tr阯 ng叨i c醕 h� kh鬾g 瘘"
		text=format( text, need_money )
		BeginEvent(sceneId)
		AddText(sceneId,text);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end

	ret, arg0 = LuaFnChangeVisual( sceneId, selfId, nItemIndex1, nItemIndex2, nVisualIndex )

	if ret == 0 then
		LuaFnCostMoney( sceneId, selfId, need_money )
		LuaFnEraseItem( sceneId, selfId, nItemIndex2 )
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 49, 0);
	end
	
	if ret == -1 then
		text="Trang b� n鄖 kh鬾g th� bi猲 h靚h"
	end

	if ret == -2 then
		text="Kh鬾g d鵱g 疬㧟 trang b� n鄖"
	end
	
	if ret == -3 then
		text="Kh鬾g d鵱g 疬㧟 ph� bi猲 h靚h"
	end

	if ret == -4 then
		text="Kh鬾g th� thay 鸨i ngo読 h靚h t呓ng 鸢ng"
	end

	if ret == -5 then
		text="Kh鬾g t皀 t読 ngo読 h靚h 疸 thay 鸨i"
	end

	BeginEvent(sceneId)
	AddText(sceneId,text)
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
end
