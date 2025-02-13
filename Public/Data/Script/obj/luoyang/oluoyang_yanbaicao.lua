--L誧 D呓ngNPC 采药技能NPC   包含功能: 1采药技能to� 鸬 学习 2讲解采药技能
--严百草
--普通

--脚本号
x000103_g_ScriptId = 000103

--商店编号
x000103_g_shoptableindex=73

--所拥有to� 鸬 事件Id列表
--estudy_caiyao = 713509
--elevelup_caiyao = 713568
--edialog_caiyao = 713608
--所拥有to� 鸬 事件ID列表
x000103_g_eventList={713509,713568,250501}--,713608
--**********************************
--事件列表
--**********************************
function x000103_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"  Mu痭 h鱟 t v� n鈔g cao k� n錸g h醝 thu痗 th� ph鋓 ch錷 t緄 ch� ta m� xem, mu痭 c� 疬㧟 c鄋g nhi玼 d唼c th鋙 hi猰 th� kh鬾g nh� th� n鄖 kh鬾g 疬㧟")
	AddText(sceneId,"  Li玬 h醝 thu痗 l� v d鴑g m瞚 ng叨i h醝 thu痗 皤u ph鋓 c�, 皙n khi c醕 h� ki猰 瘘 th鋙 d唼c t s� bi猼 ph鋓 t靘 b鱪 h� � 疴u")
	for i, eventId in x000103_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	--商店选项
	AddNumText(sceneId,x000103_g_ScriptId,"Mua c鬾g c�",7,ABILITY_TEACHER_SHOP)
	AddNumText( sceneId, x000103_g_ScriptId, "Gi緄 thi畊 h醝 thu痗", 11, 100 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x000103_OnDefaultEvent( sceneId, selfId,targetId )
	x000103_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中m祎 项
--**********************************
function x000103_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 100 then
		BeginEvent( sceneId )
			AddText( sceneId, "#{function_help_006}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end

	if	GetNumText() == ABILITY_TEACHER_SHOP	then
		DispatchShopItem( sceneId, selfId,targetId, x000103_g_shoptableindex )
	end
	for i, findId in x000103_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x000103_g_ScriptId )
		return
		end
	end
end

--**********************************
--Ti猵 th薔PCto� 鸬 任务
--**********************************
function x000103_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000103_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			end
			return
		end
	end
end

--**********************************
--拒绝此NPCto� 鸬 任务
--**********************************
function x000103_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后,要Tr� v玁PCto� 鸬 事件列表
	for i, findId in x000103_g_eventList do
		if missionScriptId == findId then
			x000103_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续(已经接了任务)
--**********************************
function x000103_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000103_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完to� 鸬 任务
--**********************************
function x000103_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x000103_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x000103_OnDie( sceneId, selfId, killerId )
end
