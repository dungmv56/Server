--Minh Gi醥NPC
--方七佛
--普通

x011003_g_scriptId=011003


--门派信息(门派名称,SceneID,PosX,PosY,门派ID)
x011003_g_mpInfo		= {}
x011003_g_mpInfo[0]	= { "Tinh T鷆", 16,  96, 152, MP_XINGSU }
x011003_g_mpInfo[1]	= { "Ti陁 Dao", 14,  67, 145, MP_XIAOYAO }
x011003_g_mpInfo[2]	= { "Thi猽 L鈓",  9,  95, 137, MP_SHAOLIN }
x011003_g_mpInfo[3]	= { "Thi阯 S絥", 17,  95, 120, MP_TIANSHAN }
x011003_g_mpInfo[4]	= { "Thi阯 Long", 13,  96, 120, MP_DALI }
x011003_g_mpInfo[5]	= { "Nga My", 15,  89, 144, MP_EMEI }
x011003_g_mpInfo[6]	= { "V� 衋ng", 12, 103, 140, MP_WUDANG }
x011003_g_mpInfo[7]	= { "Minh Gi醥", 11,  98, 167, MP_MINGJIAO }
x011003_g_mpInfo[8]	= { "C醝 Bang", 10,  91, 116, MP_GAIBANG }

x011003_g_xuanWuDaoId=400918 --[tx42913]
--**********************************
--事件交互入口
--**********************************
function x011003_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"#{MPXL_090113_05}")
		if	GetLevel( sceneId, selfId)>=10  then	
			AddNumText(sceneId,x011003_g_scriptId,"L誧 D呓ng",9,0)
			AddNumText(sceneId,x011003_g_scriptId,"T� Ch鈛",9,1)
			AddNumText( sceneId, x011003_g_scriptId, "L誧 D呓ng - C豼 Ch鈛 th呓ng h礽", 9, 3 )
			AddNumText( sceneId, x011003_g_scriptId, "T� Ch鈛 - Thi猼 T叨ng Ph�", 9, 4 )
		end
		
		--add by WTT
		if	GetLevel( sceneId, selfId)>=20  then	
			AddNumText( sceneId, x011003_g_scriptId, "Th鷆 h� C眓g Tr", 9, 6 )
		end
		
		if	GetLevel( sceneId, selfId)>=75  then	
			AddNumText( sceneId, x011003_g_scriptId, "#{MPCSLL_80925_01}", 9, 5 )
		end
		AddNumText(sceneId,x011003_g_scriptId,"姓i L�",9,2)
		
    --[tx42913]
    CallScriptFunction( x011003_g_xuanWuDaoId, "OnEnumerate",sceneId, selfId, targetId )
		--[/tx42913]
		
		AddNumText(sceneId,x011003_g_scriptId,"歇n ta 皙n nh鎛g m鬾 ph醝 kh醕",9,11)

		-- 我怎样才能去恤n Ho鄋g和Tung S絥
		AddNumText( sceneId, x011003_g_scriptId, "歇n 恤n Ho鄋g v� Tung S絥?", 11, 2000 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end


--**********************************
--事件列表选中m祎 项
--**********************************
function x011003_OnEventRequest( sceneId, selfId, targetId, eventId )
------------------------------------------------------------------------------------------
--[tx42913]
	if eventId == x011003_g_xuanWuDaoId then --去玄武岛
		CallScriptFunction( x011003_g_xuanWuDaoId, "OnDefaultEvent",sceneId, selfId, targetId )
		return
	end
--[/tx42913]		
	if GetNumText() == 2000 then		--
		BeginEvent( sceneId )
			AddText( sceneId, "#{GOTO_DUNHUANF_SONGSHAN}" ) 
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		
		return
	end
  
    if  GetNumText() == 11 then
        
		BeginEvent(sceneId)
		    
		    for i=0, 8 do
				AddNumText( sceneId, x011003_g_scriptId, "M鬾 ph醝 - "..x011003_g_mpInfo[i][1], 9, i+12 )
			end			
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)	
		return 
    end
    
    num = GetNumText()

 	if num > 11 then
 		-- 检测玩家身上喧ng不喧ng有113号BUFF
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 113) == 1   then
			BeginEvent( sceneId )
				AddText( sceneId, "  衋ng l鄊 T鄌 v ho th呓ng nh鈔 th� kh鬾g th� di chuy琻 � ch� t読 h� 疬㧟." ) 
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			
			return
 		end
 	
 	    i = num - 12
		CallScriptFunction( (400900), "TransferFuncFromNpc", sceneId, selfId, x011003_g_mpInfo[i][2], x011003_g_mpInfo[i][3], x011003_g_mpInfo[i][4] )
		return
	end
------------------------------------------------------------------------------------------ 


	if	GetNumText()==0	then
		CallScriptFunction((400900), "TransferFuncFromNpc",sceneId, selfId, 0,132,183, 10)
	elseif	GetNumText()==1	then
		CallScriptFunction((400900), "TransferFuncFromNpc",sceneId, selfId, 1,114,162, 10)
	elseif	GetNumText()==3	then
		CallScriptFunction((400900), "TransferFuncFromNpc",sceneId, selfId, 0,234,132, 10)
	elseif	GetNumText()==4	then
		CallScriptFunction((400900), "TransferFuncFromNpc",sceneId, selfId, 1,235,132, 10)
	elseif	GetNumText()==2	then
		CallScriptFunction((400900), "TransferFuncFromNpc",sceneId, selfId, 2,241,141)
	elseif  GetNumText()==5	then
		CallScriptFunction((400900), "TransferFuncFromNpc",sceneId, selfId, 186,288,136,75)
	end
	
	--add by WTT
	if GetNumText()== 6 then					--Th鷆 H� C� Tr		
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId, x011003_g_scriptId);			
			UICommand_AddInt(sceneId, targetId);
			UICommand_AddString(sceneId, "GotoShuHeGuZhen");
			UICommand_AddString(sceneId, "Th鷆 H� C� Tr l� n絠 PK s� kh鬾g b� s醫 kh�. Xin ch� � an to鄋. C醕 h� c� x醕 nh ti猲 v鄌 kh鬾g?");
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 24)
		return
	end

end

--add by WTT
function x011003_GotoShuHeGuZhen( sceneId, selfId, targetId )
	CallScriptFunction((400900), "TransferFuncFromNpc", sceneId, selfId, 420, 200, 211, 20 );
	return
end
