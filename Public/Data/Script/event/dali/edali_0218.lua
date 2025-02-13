--特殊任务 给新手m祎 只兔子
--角色等c小于10c就给m祎 只兔子,m祎 c醝角色m祎 次
--MisDescBegin
--脚本号
x210218_g_ScriptId = 210218

--任务号
x210218_g_MissionId = 458

--M鴆 ti陁 nhi甿 v鴑pc
x210218_g_Name	="V鈔 Phi陁 Phi陁"

--任务归类
x210218_g_MissionKind = 13

--衅ng c nhi甿 v� 
x210218_g_MissionLevel = 1

--喧ng否喧ngTinh英任务
x210218_g_IfMissionElite = 0

--下面几项喧ng动态显示to� 鸬 内容,用于T読 任务列表中动态显示任务情况**********************
--任务喧ng否已经完成
x210218_g_IsMissionOkFail = 0		--变量to� 鸬 第0位

--以上喧ng动态**************************************************************

x210218_g_PetDataID = 3000

--任务文本描述
x210218_g_MissionName="Ta mu痭 1 con th�"
x210218_g_MissionInfo="羞㧟 r癷, nh靚 ng呓i l� ng叨i m緄 皙n, cho ng呓i 1 con ti瑄 th�, ng呓i ph鋓 y陁 th呓ng n�. "  --任务描述
x210218_g_MissionTarget="    G鱥 ta 1 ti猲g ch� Phi陁 Phi陁. "		--M鴆 ti陁 nhi甿 v�
x210218_g_ContinueInfo="锈y l� con th� ta nu鬷 d誽 疳ng y陁 nh, ng呓i ph鋓 ch錷 s骳 n� c th. "		--未Ho鄋 t nhi甿 v鴗o� 鸬 npc对话
x210218_g_MissionComplete="Ch絠 vui v� � 姓i L�. "					--Ho鄋 t nhi甿 v鴑pc说话to� 鸬 话

--MisDescEnd
--**********************************
--任务入口函数
--**********************************
function x210218_OnDefaultEvent( sceneId, selfId, targetId )	-- 餴琺击该任务后执行此脚本
	--如果玩家完成过C醝 n鄖 任务(实际上如果完成了任务这里就不会显示,但喧ng再检测m祎 次比较安全)
    if IsMissionHaveDone(sceneId,selfId,x210218_g_MissionId) > 0 then
		return
	end
	
	ret, retGUID_H, retGUID_L = LuaFnCreatePetToHuman(sceneId, selfId, x210218_g_PetDataID, -1, 0) --给玩家生成m祎 只珍兽
	if ret == 1 then 
		--下c醝窗口,提示玩家m祎 些话
		BeginEvent(sceneId)
		AddText(sceneId,x210218_g_ContinueInfo)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		--Ho鄋 t nhi甿 v�
		MissionCom( sceneId,selfId, x210218_g_MissionId )
	else
		BeginEvent(sceneId)
			AddText(sceneId,"C醕 h� kh鬾g th� mang qu� nhi玼 tr鈔 th�")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end
end

--**********************************
--列举事件
--**********************************
function x210218_OnEnumerate( sceneId, selfId, targetId )

  --如果玩家完成过C醝 n鄖 任务
  if IsMissionHaveDone(sceneId,selfId,x210218_g_MissionId) > 0 then
   	return 
	end
  --如果已接此任务
  --else
  if IsHaveMission(sceneId,selfId,x210218_g_MissionId) > 0 then
		AddNumText(sceneId,x210218_g_ScriptId,x210218_g_MissionName,2,-1);
    --Th鯽 m鉵任务接收条件
    elseif x210218_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x210218_g_ScriptId,x210218_g_MissionName,1,-1);
  end
end

--**********************************
--检测Ti猵 th跫�
--**********************************
function x210218_CheckAccept( sceneId, selfId )
	--C 8c才能接
	if GetLevel( sceneId, selfId ) >= 8  then
		return 1
	else
		return 0
	end
end

--**********************************
--Ti猵 th�
--**********************************
function x210218_OnAccept( sceneId, selfId )
end

--**********************************
--放弃
--**********************************
function x210218_OnAbandon( sceneId, selfId )
end

--**********************************
--继续
--**********************************
function x210218_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--检测喧ng否可以提交
--**********************************
function x210218_CheckSubmit( sceneId, selfId )
end

--**********************************
--提交
--**********************************
function x210218_OnSubmit( sceneId, selfId, targetId,selectRadioId )
end

--**********************************
--杀死怪物或玩家
--**********************************
function x210218_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--进入区域事件
--**********************************
function x210218_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x210218_OnItemChanged( sceneId, selfId, itemdataId )
end
