-- 001090
-- 高太公 匪寨传送人

--脚本号
x001090_g_scriptId = 001090

--所拥有的事件ID列表
x001090_g_eventList={893063}

--**********************************
--事件列表
--**********************************
function x001090_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"Ngh頰 ph� Phan X� c黙 ta v痭 l� k� ngh� th� gia 甬 t�, trong nh� c鹡g c� tuy畉 th� k� ngh� b� b鋙. Nh遪g l c k� th� h鱝 n眎 ti猲g giang h�  t� tuy畉 trang l読 d鵱g c醕 lo読 hi琺 醕 th� 餺課 餰m b� b鋙 c呔p 餴, c騨 ngh� phan gia di畉 m鬾. Ta ngh頰 ph� nh鈔 r絠 xu痭g v醕h n鷌 餰n c� th� 疣o tho醫, nh遪g r絠 v鄌 hai ch鈔 t鄋 t. Nay, ta ngh頰 ph� 餰m kh鬾g l鈛 cho nh鈔 th�, ta v痭 鸶nh 餰m b� b鋙 餺誸 l読  n鄖 t鈓 nguy畁, b 稹c d� l馽 b t騨g t鈓, l鷆 n鄖 kh c ch� v� 鹫i hi畃 tr� ta 餺誸 l読 b� b鋙, l鄊 cho ti瑄 n� t� c� th� t鏽 ph鈔 hi猽 t鈓.")
	AddText(sceneId,"#B蝎 ngh� t� 鸬i n阯 c� Thi阯 S絥. B阯 trong gi醥 馥u c� s裞 m課h phi th叨ng l㱮 h読, c s� d鴑g k� n錸g Qu th� t鄋g h靚h Th Di畁 Mai Ph鴆 t鄋g h靚h m緄 c� th� qua.")

	AddNumText( sceneId, x001090_g_scriptId, "歇n T� Tuy畉 Trang",0 ,2  )
	
	for i, eventId in x001090_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x001090_OnDefaultEvent( sceneId, selfId,targetId )
	x001090_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x001090_OnEventRequest( sceneId, selfId, targetId, eventId )
	
	if GetNumText() == 2 then
	BeginEvent(sceneId)
	    AddText(sceneId,"T� Tuy畉 Trang ph� b鋘 ch� y猽 r絠 xu痭g nguy阯 li畊 Th錸g C V� H皀. M瞚 ng鄖 3 l唼t, sau khi gi猼 ch猼 Boss � m鄋 cu痠 s� th m祎 c醝 T� Tuy畉 Trang B鋙 S呓ng.#r#YCh� �: K� n錸g c黙 Boss c馽 k� l㱮 h読. C th nha. 蝎 ngh� 皙n c b th韈h h䅟 m緄 tham gia ph� b鋘.")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
		return
	end

	for i, findId in x001090_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x001090_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001090_g_eventList do
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
--拒绝此NPC的任务
--**********************************
function x001090_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x001090_g_eventList do
		if missionScriptId == findId then
			x001090_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x001090_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001090_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x001090_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x001090_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x001090_OnDie( sceneId, selfId, killerId )
end

--**********************************
-- 对话窗口信息提示
--**********************************
function x001090_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
