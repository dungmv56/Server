--Thi阯 Long寺NPC
--盛如兰
--普通

--脚本号
x013011_g_ScriptId = 013011

--**********************************
--事件交互入口
--**********************************
function x013011_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  Ta c� th� truy玭 th� cho khinh c鬾g 穑c bi畉 c黙 b眓 ph醝, c� 餴玼 c t痭 50 #-03")
		AddNumText(sceneId, x013011_g_ScriptId, "H鱟 khinh c鬾g ph醝 Thi阯 Long",12,0)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件列表选中m祎 项
--**********************************
function x013011_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText()==0	then
		
		if GetMenPai(sceneId, selfId) == 6 then
			if	HaveSkill( sceneId, selfId, 29)<0	then
				-- 检查钱
				if GetMoney(sceneId, selfId)+GetMoneyJZ(sceneId, selfId) < STUDY_MENPAI_QINGGONG_SPEND  then
					BeginEvent(sceneId)
						AddText(sceneId,"  Ng鈔 l唼ng tr阯 ng叨i c醕 h� kh鬾g 瘘 50 #-03, v� v kh鬾g th� h鱟 khinh c鬾g b眓 m鬾")
					EndEvent(sceneId)
					DispatchEventList(sceneId,selfId,targetId)
					return
				end
				-- 扣钱
				LuaFnCostMoneyWithPriority(sceneId,selfId,STUDY_MENPAI_QINGGONG_SPEND)

				AddSkill( sceneId, selfId, 29 )
				DelSkill( sceneId, selfId, 34 )
				BeginEvent(sceneId)
					AddText(sceneId,"  Ch鷆 m譶g ng呓i 疸 h鱟 疬㧟 khinh c鬾g c黙 b眓 m鬾, hy v鱪g ng呓i ti猵 t鴆 n� l馽 瓞 ph醫 huy danh ti猲g b眓 m鬾.")
				EndEvent(sceneId)
				DispatchEventList(sceneId,selfId,targetId)
			else
				BeginEvent(sceneId)
					AddText(sceneId,"Ch苙g ph鋓 ng呓i 疸 h鱟 r癷 sao?")
				EndEvent(sceneId)
				DispatchEventList(sceneId,selfId,targetId)
			end
		elseif GetMenPai(sceneId, selfId) == 9 then
			BeginEvent(sceneId)
				AddText(sceneId,"Mu痭 h鱟 khinh c鬾g c黙 Thi阯 Long T� c nh ph醝 Thi阯 Long tr呔c")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		else
			BeginEvent(sceneId)
				AddText(sceneId,"Ng呓i kh鬾g ph鋓 l� 甬 t� c黙 b眓 m鬾 ph醝, ta kh鬾g th� d誽 ng呓i khinh c鬾g Thi阯 Long")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		end
	end	
end

--**********************************
--Ti猵 th薔PCto� 鸬 任务
--**********************************
function x013011_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
end

--**********************************
--拒绝此NPCto� 鸬 任务
--**********************************
function x013011_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后,要Tr� v玁PCto� 鸬 事件列表
end

--**********************************
--继续(已经接了任务)
--**********************************
function x013011_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
end

--**********************************
--提交已做完to� 鸬 任务
--**********************************
function x013011_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
end

--**********************************
--死亡事件
--**********************************
function x013011_OnDie( sceneId, selfId, killerId )
end
