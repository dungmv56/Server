-- 领奖NPC

x899995_g_scriptId = 899995

--**********************************
--事件交互入口
--**********************************
function x899995_OnDefaultEvent( sceneId, selfId, targetId )
		local	lev	= GetLevel( sceneId, selfId )
		if lev < 10 then
			BeginEvent(sceneId)
	   			AddText( sceneId, "Thi阯 quan kh� kh錸 th m課h, xin 瘙i c 鹫t t緄 c 10 l読 皙n!" )
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		else 
			BeginEvent(sceneId)
		   		AddText( sceneId, "#YTa l� #YThanh Long c醕 #W truy玭 t痭g s�!" )
		   		AddText( sceneId, "#YTr阯 ng叨i ph鋓 mang theo ch靉 kho�#cFF0000T� Tuy畉 #W--#G B誧h H�,#Y ta m緄 c� th� ng呓i 疬a 皙n T� Tuy畉 Trang tg ti猵 theo --#G B誧h H� C醕!" )
		   		AddText( sceneId, "Ch靉 kho� #cFF0000T� Tuy畉 #W--#G B誧h H� #Y c� th� r総 ra t� 疳nh qu醝 v � #YThanh Long C醕#W!" )
				AddNumText( sceneId, x899995_g_scriptId, "#c00ff00Ta 餴 qua", 5, 200)
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		end
end
--**********************************
--事件列表选中m祎 项
--**********************************
function x899995_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 210 then
		BeginEvent( sceneId )
   		local n = GetMonsterCount(sceneId)
		if n>170 then
   		strText = "Tr呔c m s� l唼ng qu醝 v l�: "..n..", l鄊 gi鋗 s� l唼ng qu醝 xu痭g 170 th� n� s� h癷 sinh con kh醕,!"
  		AddText( sceneId, strText )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
   		else 
		BeginEvent( sceneId )
		LuaFnCreateMonster(531, 39339, 30, 30, 17, 0, 402030)
                AddText( sceneId, "G鱥 qu醝 v m緄 th鄋h c鬾g! B眓 quan c鵱g qu醝 v t眓g s� l唼ng l�: "..n.."!" )
           	AddText( sceneId, strText )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		end
          elseif GetNumText() == 200 then

	local nCount = GetMonsterCount(sceneId)
	for i=0, nCount-1  do
		local nObjId = GetMonsterObjID(sceneId, i)
		local MosDataID = GetMonsterDataID( sceneId, nObjId )
		--if MosDataID == 42100 then
		if MosDataID == 42100 or MosDataID == 42101 or MosDataID == 42102 or MosDataID == 42103 or MosDataID == 42104 or MosDataID == 42105 or MosDataID == 42106 or MosDataID == 42107 or MosDataID == 42108
                 or MosDataID == 42109 or MosDataID == 42110 or MosDataID == 42111 or MosDataID == 42112 or MosDataID == 42113 or MosDataID == 42114 or MosDataID == 42115 or MosDataID == 42116 or MosDataID == 42117
                 or MosDataID == 42118 or MosDataID == 42119 or MosDataID == 42180 then
               	        BeginEvent( sceneId ) 
	        	           AddText( sceneId, "#GThanh long C醕 qu醝 v c騨 ch遖 b� ti陁 di畉 s誧h s�, xin h銀 ti陁 di畉 to鄋 b� r癷 皙n truy玭 t痭g!" )
              	           EndEvent( sceneId )
               	        DispatchEventList( sceneId, selfId, targetId )
			return 
		end
	end

	       	local nStoneId0 = 39901039
		       c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
                          if c0 >=1 then
			         BeginEvent( sceneId ) 
			         LuaFnDelAvailableItem(sceneId,selfId,39901039,300)--删除物品
			         CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 540, 36,86,10 )--传送
			         EndEvent( sceneId )
               	         DispatchEventList( sceneId, selfId, targetId )
                          else
               	        BeginEvent( sceneId ) 
	        	           AddText( sceneId, "#G凶ng t鵼 t鵼 ti畁 皙n l譨 d痠 ta! Ng呓i tr阯 ng叨i c錸 b鋘 kh鬾g c� s� h鎢 v ph, c th ta 痼!" )
              	           EndEvent( sceneId )
               	        DispatchEventList( sceneId, selfId, targetId )
       	            end
	    end
end
