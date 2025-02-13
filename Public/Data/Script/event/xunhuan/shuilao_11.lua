--水牢任务
--找人

--MisDescBegin
--脚本号
x232001_g_ScriptId	= 232001

--Ti猵 th挝馧PC属性
x232001_g_Position_X=66.5252
x232001_g_Position_Z=76.7254
x232001_g_SceneID=4
x232001_g_AccomplishNPC_Name="H� Di阯 Kh醤h"

--任务号
x232001_g_MissionId	= 1212
--M鴆 ti陁 nhi甿 v鴑pc
x232001_g_Name			= "H� Di阯 B醥"
--任务归类
x232001_g_MissionKind			= 1
--衅ng c nhi甿 v� 
x232001_g_MissionLevel		= 10000
--喧ng否喧ngTinh英任务
x232001_g_IfMissionElite	= 0
--任务喧ng否已经完成
x232001_g_IsMissionOkFail	= 0		--变量to� 鸬 第0位
--任务文本描述
x232001_g_MissionName			= "B靚h 鸶nh Thu� lao ph鋘 lo課"
--任务描述
x232001_g_MissionInfo			= "#{event_xunhuan_0005}"
--M鴆 ti陁 nhi甿 v�
x232001_g_MissionTarget		= "  衖 v鄌 Th醝 H� th鼀 tr読 t靘 H� Di阯 Kh醤h#{_INFOAIM67,77,4,H� Di阯 Kh醤h}."
--未Ho鄋 t nhi甿 v鴗o� 鸬 npc对话
x232001_g_ContinueInfo		= "  Thi猽 hi畃 疸 ho鄋 t nhi甿 v� Thu� lao ch遖?"
--Ho鄋 t nhi甿 v鴑pc说话to� 鸬 话
x232001_g_MissionComplete	= "  R c鋗 t� s� gi鷓 疝 c黙 c醕 h�, b誳 鸬ng c黙 ph誱 nh鈔 trong Thu� lao 疸 lg"
--控制脚本
x232001_g_ControlScript		= 232000
--MisDescEnd


--**********************************
--任务入口函数
--**********************************
function x232001_OnDefaultEvent( sceneId, selfId, targetId )	-- 餴琺击该任务后执行此脚本

	--判断该npc喧ng否喧ng对应任务to� 鸬 npc
	if LuaFnGetName( sceneId, targetId ) ~= x232001_g_Name then
		return
	end

	--如果已接此任务
	if IsHaveMission( sceneId, selfId, x232001_g_MissionId ) > 0 then

		--发送任务需求to� 鸬 信息
		BeginEvent( sceneId )
			AddText( sceneId, x232001_g_MissionName )
			AddText( sceneId, x232001_g_ContinueInfo )
		EndEvent( )
		local	bDone	= x232001_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo( sceneId, selfId, targetId, x232001_g_ScriptId, x232001_g_MissionId, bDone )

	--未接,且Th鯽 m鉵任务接收条件
	elseif x232001_CheckAccept( sceneId, selfId ) > 0 then

		--发送任务Ti猵 th毕允総o� 鸬 信息
		BeginEvent( sceneId )
			AddText( sceneId, x232001_g_MissionName )
			AddText( sceneId, x232001_g_MissionInfo )
			AddText( sceneId, "#{M_MUBIAO}" )
			AddText( sceneId, x232001_g_MissionTarget )
		EndEvent( )
		DispatchMissionInfo( sceneId, selfId, targetId, x232001_g_ScriptId, x232001_g_MissionId )

	end

end

--**********************************
--列举事件
--**********************************
function x232001_OnEnumerate( sceneId, selfId, targetId )

	--判断该npc喧ng否喧ng对应任务to� 鸬 npc
 	if LuaFnGetName( sceneId, targetId ) ~= x232001_g_Name then
		return
	end

   --如果已接此任务
	if IsHaveMission( sceneId, selfId, x232001_g_MissionId ) > 0 or x232001_CheckAccept( sceneId, selfId ) > 0 then
		AddNumText( sceneId, x232001_g_ScriptId, x232001_g_MissionName,3,-1 )
	end

end

--**********************************
--检测Ti猵 th跫�
--**********************************
function x232001_CheckAccept( sceneId, selfId )

	if CallScriptFunction( x232001_g_ControlScript, "CheckAccept", sceneId, selfId ) == 1 then
		--检测玩家喧ng否符合Ti猵 th挝駎o� 鸬 条件
		return 1
	else
		return 0
	end

end

--**********************************
--Ti猵 th�
--**********************************
function x232001_OnAccept( sceneId, selfId, targetId )

	--判断该npc喧ng否喧ng对应任务to� 鸬 npc
 	if LuaFnGetName( sceneId, targetId ) ~= x232001_g_Name then
		return
	end

	--加入任务到玩家列表
	CallScriptFunction( x232001_g_ControlScript, "OnAccept", sceneId, selfId, targetId, x232001_g_ScriptId )

	if IsHaveMission( sceneId, selfId, x232001_g_MissionId ) <= 0 then
		return
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x232001_g_MissionId )
	--根据序列号把任务变量to� 鸬 第6位置1 (任务完成情况)
	SetMissionByIndex( sceneId, selfId, misIndex, 6, 1 )

	--显示内容告诉玩家已经Ti猵 th巳挝�
	BeginEvent( sceneId )
		AddText( sceneId, x232001_g_MissionInfo )
		AddText( sceneId, "#rNg呓i nh nhi甿 v�: #r  "..x232001_g_MissionName )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

end

--**********************************
--放弃
--**********************************
function x232001_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应to� 鸬 任务
	CallScriptFunction( x232001_g_ControlScript, "OnAbandon", sceneId, selfId )
end

--**********************************
--继续
--**********************************
function x232001_OnContinue( sceneId, selfId, targetId )
	--提交任务时to� 鸬 � 餴琺餍畔�
	BeginEvent( sceneId )
	AddText( sceneId, x232001_g_MissionName )
	AddText( sceneId, x232001_g_MissionComplete )
	EndEvent()
	DispatchMissionContinueInfo( sceneId, selfId, targetId, x232001_g_ScriptId, x232001_g_MissionId )
end

--**********************************
--检测喧ng否可以提交
--**********************************
function x232001_CheckSubmit( sceneId, selfId )
	return CallScriptFunction( x232001_g_ControlScript, "CheckSubmit", sceneId, selfId )
end

--**********************************
--提交
--**********************************
function x232001_OnSubmit( sceneId, selfId, targetId, selectRadioId )

	--判断该npc喧ng否喧ng对应任务to� 鸬 npc
 	if LuaFnGetName( sceneId, targetId ) ~= x232001_g_Name then
		return
	end
	CallScriptFunction( x232001_g_ControlScript, "OnSubmit", sceneId, selfId, targetId, selectRadioId )

end

--**********************************
--杀死怪物或玩家
--**********************************
--参数意思: 场景号、玩家objId、怪物表位置号、怪物objId
function x232001_OnKillObject( sceneId, selfId, objdataId , objId )
end

--**********************************
--进入区域事件
--**********************************
function x232001_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x232001_OnItemChanged( sceneId, selfId, itemdataId )
end
