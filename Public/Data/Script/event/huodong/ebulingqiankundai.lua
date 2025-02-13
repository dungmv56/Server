 
--补领干坤袋
----------------
--脚本号
x808129_g_ScriptId = 808129;
x808129_g_PlayerSlow_LVH = 70;   --最高L頽h 等c
x808129_g_QianKunDaiBuLingLv1 = 30008059 --m祎 c干坤袋
x808129_g_QianKunDaiBuLing = 30504118  --补领to� 鸬 70c干坤袋

 
--**********************************
--任务入口函数
--**********************************
function x808129_OnDefaultEvent( sceneId, selfId, targetId )
	local id = GetNumText();
	if id == 1 then 
		BeginEvent(sceneId)
			AddText(sceneId, "#{XRLB_090417_02}");	
			AddNumText(sceneId, x808129_g_ScriptId, "#{XRLB_090417_03}", 6, 2);		-- "L頽h "
			EndEvent()
		DispatchEventList(sceneId, selfId, targetId);

	elseif id == 2 then

		--防止玩家不通过 餴琺击事件进入
		local bCanSee = x808129_canSeeGainMenu(sceneId, selfId)
		if ( bCanSee == 0  ) then
			BeginEvent(sceneId)
				AddText(sceneId, "#{XRLB_090417_04}");
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId);
			return 
		end

		--检查背包空间
		BeginAddItem(sceneId)
		AddItem(sceneId, x808129_g_QianKunDaiBuLing, 1)
		local bBagOk = EndAddItem(sceneId, selfId)
		if bBagOk < 1 then
		  x808129_NotifyTips( sceneId, selfId, "#{XRLB_090417_05}" )
			return
		end

		-- 补给干坤袋,小于70cto� 鸬 给m祎 c袋,大于等于70cto� 鸬 给m祎 c醝70c特殊袋
		local nBagIndex = -1
		if LuaFnGetLevel( sceneId, selfId ) < x808129_g_PlayerSlow_LVH then
		  nBagIndex = TryRecieveItem( sceneId, selfId, x808129_g_QianKunDaiBuLingLv1, 1 );
		else
		  nBagIndex = TryRecieveItem( sceneId, selfId, x808129_g_QianKunDaiBuLing, 1 );
		end
		
		if nBagIndex == -1 then
		 return
		end

		--增加L頽h 标志
		SetMissionFlag(sceneId, selfId, MF_GetQianKunDai, 1)

		local guid = LuaFnObjId2Guid(sceneId, selfId)
		ScriptGlobal_AuditGeneralLog(LUAAUDIT_QIANKUNDAI_BULING_LEVEL1, guid)--这里给to� 鸬 喧ng70cto� 鸬 而不喧ngm祎 cto� 鸬 , 只喧ng用to� 鸬 大陆to� 鸬 占位.

--		BeginEvent(sceneId)
--			AddText(sceneId,"#{XRLB_090417_07}");
--		EndEvent(sceneId)
--		DispatchMissionTips(sceneId,selfId)
    x808129_NotifyTips( sceneId, selfId, "#{XRLB_090417_07}" )
    x808129_NotifyMsg( sceneId, selfId,  targetId, "#{XRLB_090417_07}" )
		return

	end

end

--**********************************
--列举事件
--**********************************
function x808129_OnEnumerate( sceneId, selfId, targetId )

	if ( x808129_canSeeGainMenu(sceneId, selfId) == 0  ) then
		return 0
	end

	-- "补领"
  AddNumText(sceneId, x808129_g_ScriptId, "#{XRLB_090417_01}", 6, 1 ) --补领江湖干坤袋
end

function x808129_NotifyTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

function x808129_NotifyMsg( sceneId, selfId,  targetId, Msg )
	BeginEvent( sceneId )
		AddText( sceneId, Msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--给新玩家发邮件
--**********************************
function x808129_OnPlayerLogin( sceneId, selfId )

	if x808129_canSeeGainMenu(sceneId, selfId) == 1 then
		LuaFnSendSystemMail( sceneId, GetName( sceneId, selfId ), "#{XRLB_090417_08}" )
	end

end

--**********************************
--判断玩家创建时间喧ng否T読 2009-03-26 00: 00: 00 前  而且等c不高于45c
--**********************************
function x808129_canSeeGainMenu( sceneId, selfId )

	--检测等c
--  if LuaFnGetLevel( sceneId, selfId ) < x808129_g_PlayerSlow_LVH then
--		return 0
--  end

  --检查喧ng否领过了
  if GetMissionFlag(sceneId, selfId, MF_GetQianKunDai)==1 then
    return 0
  end
    
	return 1;

end
