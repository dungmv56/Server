-- 宝石合成

-- 脚本号
x006673_g_scriptId = 006673

-- 脚本名称
x006673_g_scriptName = "H䅟 th鄋h B鋙 Th誧h"
x006673_g_Impact1 = 4918 --临时写C醝 n鄖 

--**********************************************************************
-- 任务入口函数
--**********************************************************************
function x006673_OnDefaultEvent( sceneId, selfId, targetId )

	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 23)

end

--**********************************************************************
-- 列举事件
--**********************************************************************
function x006673_OnEnumerate( sceneId, selfId, targetId )


end

function x006673_GiveRose( sceneId, selfId, targetId )

local nObjID = LuaFnGuid2ObjId( sceneId, targetId )
local szName = GetName( sceneId, nObjID );

	
	local nSexSelf = LuaFnGetSex(sceneId, selfId)
    local nSexTarget = LuaFnGetSex(sceneId, nObjID)                
    if( nSexSelf == nSexTarget ) then
      LuaFnSendOResultToPlayer(sceneId, selfId, OR_INVALID_TARGET)      
      return 0;                                            
    end 
    
    if LuaFnIsFriend(sceneId, nObjID, selfId) ~= 1 then
			LuaFnSendOResultToPlayer(sceneId, selfId, OR_INVALID_TARGET)
			return 0;
	end
    
	local nYaoDingCount = GetItemCount(sceneId, selfId, 30509011);
	if nYaoDingCount <= 0 then
		x006673_NotifyTip(sceneId, selfId, "C醕 h� kh鬾g c� Hoa H皀g, xin h銀 皙n ti甿 Nguy阯 B鋙 mua.");
		return 0;
	end
	
	local msg = format("C醕 h� ph鋓 ch錸g mu痭 tg #G999 痼a hoa h皀g#Y cho #G%s#Y?", szName);
	BeginUICommand(sceneId)
		UICommand_AddInt(sceneId,x006673_g_scriptId);		
		UICommand_AddInt(sceneId, nObjID);
		UICommand_AddString(sceneId,"DoUseItemReal");
		UICommand_AddString(sceneId, msg);
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 24)

end



function x006673_DoUseItemReal( sceneId, selfId, param1, param2 )

	local szNameTarget = GetName( sceneId, param1 );
	local szNameSelf = GetName( sceneId, selfId );

	local targetId = param1;
	if LuaFnGetPropertyBagSpace( sceneId, param1 ) < 1 then
		x006673_NotifyTip( sceneId, selfId, "Tay n鋓 鸠i ph呓ng 疸 馥y, kh鬾g th� ti猵 nh hoa tg!" )
		return 0
	end
	
	local nItemBagIndex = GetBagPosByItemSn(sceneId, selfId, 30509011);
	local szTransfer = GetBagItemTransfer(sceneId,selfId, nItemBagIndex);
	local bRet = DelItem(sceneId, selfId, 30509011, 1);
	if bRet <= 0 then
		x006673_NotifyTip( sceneId, selfId, "H鼀 b� 鹫o c� th b読, xin ki琺 tra l読 ph鋓 ch錸g kh骯 r癷!" )
		return 0;
	end
	
	if LuaFnIsFriend(sceneId, targetId, selfId) > 0 then
	
			LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, targetId, 66, 0);
			LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, targetId, x006673_g_Impact1, 0);
				
			local nFriendPoint = LuaFnGetFriendPoint( sceneId, selfId, targetId );
			if nFriendPoint >= 9999 then
			
				BeginEvent(sceneId)
					AddText(sceneId, "械 h鋙 h鎢 c黙 c醕 h� v� 鸠i ph呓ng 疸 鹫t m裞 c馽 h課.");
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)		
				
			else
			
				BeginEvent(sceneId)
				AddText(sceneId, "械 th鈔 thi畁 gi鎍 c醕 h� v� 鸠i ph呓ng t錸g 5000");
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				
			end
			
			
			local	namSelf		= GetName( sceneId, selfId )
			local	namTarget	= GetName( sceneId, targetId )
			
			--给对方用光效
			--LuaFnSendSpecificImpactToUnit(sceneId, targetId, targetId, targetId, 18, 0);

			
			local randMessage = random(3);
			local message;

			if randMessage == 1 then
	   			message = format("@*;SrvMsg;SCA:#{_INFOUSR%s}#{GiveRose_00}#{_INFOMSG%s}#{GiveRose_01}#{_INFOUSR%s}#{GiveRose_02}", szNameSelf, szTransfer, szNameTarget );
			elseif randMessage == 2 then		
				message = format("@*;SrvMsg;SCA:#{_INFOUSR%s}#{GiveRose_03}#{_INFOMSG%s}#{GiveRose_04}#{_INFOUSR%s}#{GiveRose_05}", szNameSelf, szTransfer, szNameTarget );
			else		
				message = format("@*;SrvMsg;SCA:#{_INFOUSR%s}#{GiveRose_03}#{_INFOMSG%s}#{GiveRose_06}#{_INFOUSR%s}#{GiveRose_07}", szNameSelf, szTransfer, szNameTarget );
			end
			
			AddGlobalCountNews( sceneId, message )
			
			
			--奖励
			local	lstBounty	=
			{
				[0]	= { 10124021,	228, "Mai qu� ti阯 t�" },		--女装
				[1]	= { 10124020,	227, "T靚h th醤h" },				--男装
			}
			
			local	untBounty
			
			if GetSex( sceneId, selfId ) == 0 then
				untBounty	= lstBounty[0]
			else
				untBounty	= lstBounty[1]
			end
			
			if TryRecieveItem( sceneId, selfId, untBounty[1], 1 ) >= 0 then
				x006673_NotifyTip( sceneId, selfId, "C醕 h� nh 疬㧟 m祎 "..GetItemName( sceneId, untBounty[1] ) )
			end
			 
			AwardTitle( sceneId, selfId, 8, untBounty[2] )
			LuaFnDispatchAllTitle( sceneId, selfId )		--更新所有称号到CLIENT
			 x006673_NotifyTip( sceneId, selfId, "C醕 h� nh 疬㧟 danh hi畊 ["..untBounty[3].."]." )

			 if GetSex( sceneId, targetId ) == 0 then
			 	untBounty	= lstBounty[0]
			 else
			 	untBounty	= lstBounty[1]
			 end
			 if TryRecieveItem( sceneId, targetId, untBounty[1], 1 ) >= 0 then
			 	x006673_NotifyTip( sceneId, targetId, "C醕 h� nh 疬㧟 m祎 "..GetItemName( sceneId, untBounty[1] ) )
			 end
			 AwardTitle( sceneId, targetId, 8, untBounty[2] )
			 LuaFnDispatchAllTitle( sceneId, targetId )	--更新所有称号到CLIENT
			 x006673_NotifyTip( sceneId, targetId, "C醕 h� nh 疬㧟 danh hi畊 ["..untBounty[3].."]." )
	end
	

end


--**********************************
--醒目提示
--**********************************
function x006673_NotifyTip( sceneId, selfId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end
