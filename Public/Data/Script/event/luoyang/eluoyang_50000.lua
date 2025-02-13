--出售珍兽
--MisDescBegin
--脚本号
x250000_g_ScriptId = 250000

--任务号
x250000_g_MissionId = 720

--M鴆 ti陁 nhi甿 v鴑pc
x250000_g_Name	="Sa Ch鈛 L鉵h" 

--存储随机数
x250000_g_rand = 0					--变量第1位

--任务文本描述
x250000_g_MissionName="Ta mu痭 b醤 tr鈔 th�"
x250000_g_MissionInfo="    Xin h銀 gi鷓 ti瑄 th� nh� ta b tr鈔 th�."  --任务描述
x250000_g_MissionTarget="    Ho鄋 th鄋h nhi甿 v� Sa Ch鈛 L鉵h."		--M鴆 ti陁 nhi甿 v�
x250000_g_ContinueInfo="Nhi甿 v� 疸 l鄊 xong ch遖 ?"		--未Ho鄋 t nhi甿 v鴗o� 鸬 npc对话
x250000_g_MissionComplete="Th l� c醡 絥 c醕 h�!"					--Ho鄋 t nhi甿 v鴑pc说to� 鸬 话

--任务奖励


--**********************************
--任务入口函数
--**********************************
function x250000_OnDefaultEvent( sceneId, selfId, targetId )	-- 餴琺击该任务后执行此脚本
    
    DispatchMissionDemandInfo(sceneId,selfId,targetId,x250000_g_ScriptId,x250000_g_MissionId, 2)
    --petdataid = LuaFnGetPet_DataID(sceneId, selfId, indexpet )
end

--**********************************
--如果玩家  有  任务所作to� 鸬 处理
--**********************************
function x250000_HaveMissionToDo( sceneId, selfId,targetId )
 
end

--**********************************
--如果玩家没有任务所作to� 鸬 处理
--**********************************
function x250000_NoMissionToDo( sceneId, selfId, targetId )
 
end

--**********************************
--列举事件
--**********************************
function x250000_OnEnumerate( sceneId, selfId, targetId )
 		
 		if GetName(sceneId,targetId) == x250000_g_Name then		--如果喧ng发任务to� 鸬 npc		  
			AddNumText(sceneId,x250000_g_ScriptId,x250000_g_MissionName,6,-1)
		end
		
end

--**********************************
--检测Ti猵 th跫�
--**********************************
function x250000_CheckAccept( sceneId, selfId )
		return 1
end

--**********************************
--Ti猵 th�
--**********************************
function x250000_OnAccept( sceneId, selfId )
end

--**********************************
--放弃
--**********************************
function x250000_OnAbandon( sceneId, selfId )
 
end

--**********************************
--继续
--**********************************
function x250000_OnContinue( sceneId, selfId, targetId )
 
end

--**********************************
--检测喧ng否可以提交
--**********************************
function x250000_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x250000_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

end

--**********************************
--提交
--**********************************
function x250000_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	
end

--**********************************
--杀死怪物或玩家
--**********************************
function x250000_OnKillObject( sceneId, selfId, objdataId )

end

--**********************************
--进入区域事件
--**********************************
function x250000_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x250000_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--接任务后显示to� 鸬 界面
--**********************************
function x250000_AcceptDialog(sceneId, selfId,x250000_g_rand,g_Dialog,targetId)
 
end

--**********************************
--交任务后显示to� 鸬 界面
--**********************************
function x250000_SubmitDialog(sceneId, selfId,x250000_g_rand)

end

--**********************************
--把信送到后显示to� 鸬 界面
--**********************************
function x250000_SubmitDialog(sceneId, selfId,x250000_g_rand)

end

function x250000_DisplayMissionTips(sceneId,selfId,g_MissionTip)
	BeginEvent(sceneId)
		strText = g_MissionTip
		AddText(sceneId,strText)
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
end

--**********************************
--取 餴琺本事件to� 鸬 MissionId,用于obj文件中对话情景to� 鸬 判断
--**********************************
function x250000_GetEventMissionId(sceneId, selfId)
	return x250000_g_MissionId
end

function x250000_PetValue( PetLevel )

    local MoneyNum = 0
    if PetLevel > 0  and PetLevel <=5 then		    
        MoneyNum = 225
    end
		    
    if PetLevel > 5  and PetLevel <=15 then
        MoneyNum = 595
    end

    if PetLevel > 15  and PetLevel <=25 then
        MoneyNum = 1191
    end
		    
    if PetLevel > 25  and PetLevel <=35 then
        MoneyNum = 1779
    end
		    
    if PetLevel > 35  and PetLevel <=45 then
        MoneyNum = 2450
    end
		    
    if PetLevel > 45  and PetLevel <=55 then
        MoneyNum = 3205
 	  end
		    
    if PetLevel > 55  and PetLevel <=65 then
        MoneyNum = 4042
    end
		    
    if PetLevel > 65  and PetLevel <=75 then
        MoneyNum = 4964
    end
		    
    if PetLevel > 75  and PetLevel <=85 then
        MoneyNum = 5968
    end
		    
    if PetLevel > 85  and PetLevel <=95 then
		    MoneyNum = 7056
		end
		    		    		
    if PetLevel > 95 then
        MoneyNum = 7056
		end

    return MoneyNum
end
--**********************************
--玩家提交to� 鸬 物品及珍兽
--**********************************
function x250000_OnMissionCheck( sceneId, selfId, npcid, scriptId, index1, index2, index3, indexpet )
  --PrintNum( indexpet )           
  --indexpet 此索引为"绝对索引值",即T読 0-5 这6c醝栏位中to� 鸬 序号.
  
	if indexpet == 255 then --索引值Tr� v�255表示空,没提交珍兽
		BeginEvent(sceneId)
			strText = "H銀 餰m tr鈔 th� v鄌 trong c豠 s�"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	else	
	
	  ValidIndex = indexpet
    if 255 == ValidIndex then        
        return        
    end
	
    local PetLevel = LuaFnGetPet_Level( sceneId, selfId, ValidIndex )		    -- 餴琺到珍兽c别				    
		
		local DataID = LuaFnGetPet_DataID( sceneId, selfId, ValidIndex )       -- 餴琺到珍兽ID
		local PetName = GetPetName( DataID )  
				
    --PrintNum( PetLevel )				
				
				
		ret1 = LuaFnDeletePet(sceneId, selfId, ValidIndex ) --删除珍兽				
		if ret1 > 0 then     --成功删除珍兽		    		    
		    --PrintStr( "删除成功拉" )
		    --删除珍兽后,将根据珍兽等c计算玩家所 餴琺金钱数目
		    local MoneyNum = x250000_PetValue( PetLevel )
		    AddMoney( sceneId, selfId, MoneyNum )
		    
		    --PrintNum( PetLevel )
		    Msg2Player(  sceneId, selfId,"C醕 h� 疸 b醤 r癷"..PetName..", 鹫t 疬㧟 #{_MONEY"..MoneyNum.."}",MSG2PLAYER_PARA )
		    
		end
		

	end
end

