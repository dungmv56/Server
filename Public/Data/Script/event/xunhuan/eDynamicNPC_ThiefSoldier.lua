--��������
--K� th� x�m l��c
--

--************************************************************************
--MisDescBegin
--�ű���
x050013_g_ScriptId	= 050013

--MisDescEnd
--************************************************************************

x050013_g_CopySceneType			= FUBEN_ZEIBINGRUQIN	--��������,����T�i ScriptGlobal.lua����
x050013_g_LimitMembers			= 3		--���Խ�����to� � ��С��������
x050013_g_TickTime					= 5		--�ص��ű�to� � ʱ��ʱ��(��λ:  gi�y/��)
x050013_g_LimitTotalHoldTime= 360	--�������Դ��to� � ʱ��(��λ: ����),�����ʱ�䵽��,�����񽫻�th�t b�i
x050013_g_LimitTimeSuccess	= 500	--����ʱ������(��λ: ����),�����ʱ�䵽��,�������
x050013_g_CloseTick					= 6		--�����ر�ǰ����ʱ(��λ: ����)
x050013_g_NoUserTime				= 300	--������û���˺���Լ�������to� � ʱ��(��λ:  gi�y)
x050013_g_Fuben_X						= 76	--���븱��to� � λ��X
x050013_g_Fuben_Z						= 110	--���븱��to� � λ��Z
x050013_g_BossGroupID= 1		--C�n ɱ��to� � Bossto� � GroupID
x050013_g_TotalNeedKillBoss	= 31	--C�n ɱ��Boss����

--����������������
x050013_g_keySD					= {}
x050013_g_keySD["typ"]	= 0		--���ø�������
x050013_g_keySD["spt"]	= 1		--���ø��������¼��ű���
x050013_g_keySD["tim"]	= 2		--���ö�ʱ�����ô���
x050013_g_keySD["scn"]	= 3		--���ø�����ڳ�����, ��ʼ��
x050013_g_keySD["cls"]	= 4		--���ø����رձ�־, 0����,1�ر�
x050013_g_keySD["dwn"]	= 5		--�����뿪����ʱ����
x050013_g_keySD["tem"]	= 6		--��������
x050013_g_keySD["x"]	= 7		--X����
x050013_g_keySD["z"]	= 8		--Z����

x050013_g_keySD["ObjKilled"] = 9     --��ǰɱ������
x050013_g_keySD["MyLevel"] = 10     --������c�p
x050013_g_keySD["FlagThielf"] = 11     --��������to� � ��־ �ѷ���
x050013_paramonce 	= 28


--x050013_g_Monster	= {}
--x050013_g_Monster[1]	= { 3, 100, 100 }
--x050013_g_Monster[2]	= { 4, 100, 100 }

--��ȡ����to� � ��͵�c�p
x050013_g_minLevel			= 20
--BOSS ����
x050013_g_typMonster0		= 3650
x050013_g_typMonster1		= 3659

x050013_Monster_Boss = {
                        3650,
                        3651,
                        3652,
                        3653,
                        3654,
                        3655,
                        3656,
                        3657,
                        3658,
                        3659
                        }

--x050013_NianShou_Boss = {
--												12200,
--												12201,
--												12202,
--												12203,
--												12204,
--												12205,
--												12206,
--												12207,
--												12208,
--												12209,
--												12210,
--												12211
--                        }
--                        
--x050013_NianShou_Pos = {
--												{x=83,z=45},{x=93,z=34},{x=53,z=30},{x=27,z=24},{x=34,z=41},
--												}

--**********************************
--������ں���
--**********************************
function x050013_OnDefaultEvent( sceneId, selfId, targetId )
    --�رս���
 	BeginUICommand( sceneId )
	UICommand_AddInt( sceneId, targetId )
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId, 1000 )
    
    local CanAccept = x050013_OnAccept( sceneId, selfId )
    
    if( 1 == CanAccept ) then
        LuaFnDeleteMonster( sceneId, targetId)
    end
end

--**********************************
--�о��¼�
--**********************************
function x050013_OnEnumerate( sceneId, selfId, targetId )

    local	lev	= GetLevel( sceneId, selfId )
	if lev < x050013_g_minLevel then
	  AddText( sceneId, "��ng c�p c�a ng߽i qu� th�p, c� b�n kh�ng l�t v�o m�t ta. ��i sau khi ��t c�p 20, h�y t�i t�m ta" )
		return
	end
	
	if LuaFnHasTeam( sceneId, selfId ) == 0 then
		AddText( sceneId, "Ng߽i mu�n t�i th� ta, nh�ng c� b�n ta kh�ng mu�n �ng th� v�i ng߽i" )
		return 
	end
	
	
	if GetTeamSize( sceneId, selfId ) < x050013_g_LimitMembers then
	  AddText( sceneId, "Mu�n th� th�ch ta ch� �t c�ng ph�i t�i 3 ng߶i. C� t� ng߶i th� n�y, qu� coi th߶ng ta" )
	  return
	end
	
	if LuaFnIsTeamLeader( sceneId, selfId ) == 0 then
		AddText( sceneId, "Mu�n th� th�ch ta? G�i nh�m tr߷ng c�a c�c ng߽i ra ��y" )		
		return
	end

	--ȡ �i�m��Ҹ���to� � ��������(�����Լ�)
	leaderObjId = selfId;

  local TeammateCount = 0    --�������� Steven.Han 2006-12-27 11:34
  local TeammateID = 0       --����ID
  local NearCount = 0        --������������
  
  NearCount = GetNearTeamCount( sceneId, leaderObjId )
  TeammateCount = GetTeamMemberCount( sceneId, leaderObjId )
   	
	local namenum = 0;
	local notifyString = "Trong �i ng� c�a c�c h� c� th�nh vi�n (";
	for i=0, NearCount-1  do
		local nPlayerId = GetNearTeamMember(sceneId,selfId, i)
		local	lev	= GetLevel( sceneId, nPlayerId )
		local	nam	= GetName( sceneId, nPlayerId )
		
		if(lev<20) then
			notifyString = notifyString..nam.." ";
			namenum = 1;
		end
	end
	notifyString = notifyString..") ��ng c�p kh�ng ��.";	
	if(namenum>0) then
	  BeginEvent( sceneId )
			AddText( sceneId, notifyString )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end
 	  
  for i=0, NearCount-1 do
      TeammateID = GetNearTeamMember( sceneId, leaderObjId, i )
      if( -1 == TeammateID ) then    --���Ϸ�ID
          return
      end
      
      local Level = GetLevel( sceneId, TeammateID )
      if( Level < 20 ) then
        BeginEvent( sceneId )
					AddText( sceneId, "Trong nh�m c�a ng߽i c� ng߶i c� ��ng c�p kh�ng �� c�p 20!" )
					EndEvent( sceneId )
				DispatchEventList( sceneId, selfId, targetId )
				return
      end
            
  end
  
	
	BeginEvent( sceneId )
		AddText( sceneId, "N�u c�c ng߽i �� kh�ng s� ch�t, ta c�ng kh�ng c�n thi�t ph�i l�u t�nh. L� o�t kia, � ta cho c�c ng߽i n�m m�i l�i h�i" )
		AddNumText( sceneId, x050013_g_ScriptId, "L� n�o ta l�i s� ng߽i..",10,-1 )
    EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
 
 
end

--**********************************
--���Ti�p th�����
--**********************************
function x050013_CheckAccept( sceneId, selfId )	
	return 1
end

--**********************************
--Ti�p th�
--**********************************
function x050013_OnAccept( sceneId, selfId )

  --����ǰ,Ҫ�����ж�m�t �ν������� Steven.Han 2006-12-27 13:53
	local	lev	= GetLevel( sceneId, selfId )
	if lev < x050013_g_minLevel then
	  x050013_NotifyTip( sceneId, selfId, "��ng c�p c�a ng߽i qu� th�p" )
		return -1
	end
	
	if LuaFnHasTeam( sceneId, selfId ) == 0 then
		x050013_NotifyTip( sceneId, selfId, "Ng߽i v�n ch�a c� nh�m" )
		return -1 
	end
	
	if GetTeamSize( sceneId, selfId ) < x050013_g_LimitMembers then
	  x050013_NotifyTip( sceneId, selfId, "Nh�m kh�ng �� "..(x050013_g_LimitMembers).." Nh�n" )
	  return -1
	end
	
	if LuaFnIsTeamLeader( sceneId, selfId ) == 0 then
		x050013_NotifyTip( sceneId, selfId, "Ng߽i kh�ng ph�i l� �i tr߷ng" )		
		return -1
	end
		  
	  
  local TeammateCount = 0    --�������� Steven.Han 2006-12-27 11:34
  local TeammateID = 0       --����ID
  local NearCount = 0        --������������
  
  NearCount = GetNearTeamCount( sceneId, selfId )
  TeammateCount = GetTeamMemberCount( sceneId, selfId )
  
  if( NearCount < TeammateCount ) then          --�ж���ûT�i ����,Tr� v�
    	--��ʾ��Ŀ��ʾ
		  BeginEvent(sceneId)
		      strText = "еi h�u c�a ng߽i kh�ng � g�n ��y"
		  AddText(sceneId,strText)
	    EndEvent(sceneId)
	    DispatchMissionTips(sceneId,selfId)
      return -1
  end
  
  for i=0, TeammateCount-1 do
      TeammateID = GetNearTeamMember( sceneId, selfId, i )
      if( -1 == TeammateID ) then    --���Ϸ�ID
          return -1
      end
      
      local Level = GetLevel( sceneId, TeammateID )
      if( Level < 20 ) then
        BeginEvent( sceneId )
			AddText( sceneId, "Trong nh�m c�a ng߽i c� ng߶i c� ��ng c�p kh�ng �� c�p 20!" )
			EndEvent( sceneId )
		DispatchMissionTips(sceneId,selfId)
		return -1
      end
            
  end
  --����ǰ,Ҫ�����ж�m�t �ν������� Steven.Han 2006-12-27 13:53



	--ȡ �i�m��Ҹ���to� � ��������(�����Լ�)
	local numMem	= GetNearTeamCount( sceneId, selfId )

	x050013_MakeCopyScene( sceneId, selfId, numMem )
	
	return 1
	--LuaFnDeleteMonster( sceneId, targetId)
	--PrintStr( tostring( targetId ) )
	
	
end

--**********************************
--����
--**********************************
function x050013_OnAbandon( sceneId, selfId )

end

--**********************************
--��������
--**********************************
function x050013_CreateBoss( sceneId, iniLevel )
    if( iniLevel < x050013_g_minLevel ) then
        iniLevel = x050013_g_minLevel
    end
    local PlayerMaxLevel = GetHumanMaxLevelLimit()
    if( iniLevel > PlayerMaxLevel ) then
        iniLevel = PlayerMaxLevel
    end
    
    
    --PrintStr( "x050013_CreateBoss" )
	local	ini		= floor( iniLevel / 10 )
	if ini <= 0 then
		ini	= 1
	elseif ini > 10 then
		ini	= 10
	end
	local	typ		= x050013_Monster_Boss[ini]	--������
	objId = LuaFnCreateMonster( sceneId, typ, 19.4121, 102.2840, 14, 76, 50013 )
	
	SetMonsterGroupID( sceneId, objId, x050013_g_BossGroupID )
	
	SetLevel( sceneId, objId, iniLevel )
	
	local szName = LuaFnGetName(sceneId, objId)
	if szName == "T�c Binh Хu M�c"   then
		SetCharacterTitle(sceneId, objId, "")
	end
	local DataID = GetMonsterDataID( sceneId, objId )
	local strMonsterName = GetMonsterNamebyDataId( DataID )
	
	CallScriptFunction((200060), "Paopao",sceneId, strMonsterName, "T�c Kh�u doanh �a", "Thi�n �߶ng c� �߶ng ng߽i kh�ng �i, �a ng�c kh�ng c�a ng߽i x�ng t�i! D� sao �� t�i r�i, ��ng h�ng tho�t ���c. Ng�y n�y n�m sau l� ng�y gi� c�a ng߽i")
	
end

--**********************************
--��������
--**********************************
function x050013_MakeCopyScene( sceneId, selfId, nearmembercount )
	
	--ָ������
	local	param0	= 4;
	local	param1	= 3;

	--���ս��
	local	mylevel	= 0;

	--��ʱ����
	local mems		= {};
	local	tempMemlevel = 0;
	local	level0 = 0;
	local	level1 = 0;
	for	i = 0, nearmembercount - 1 do
		mems[i]	= GetNearTeamMember(sceneId, selfId, i);
		tempMemlevel = GetLevel(sceneId, mems[i]);
		level0	= level0 + (tempMemlevel ^ param0);
		level1	= level1 + (tempMemlevel ^ param1);
	end

	if level1 == 0 then
		mylevel = x050013_g_minLevel;
	else
		mylevel = level0/level1;
	end

	local leaderguid = LuaFnObjId2Guid( sceneId, selfId )
	--��ͼ��ng����ѡȡto� � ,���ұ���T�i Config/SceneInfo.ini�����ú�
	LuaFnSetSceneLoad_Map( sceneId, "zeiying.nav" )
	LuaFnSetCopySceneData_TeamLeader( sceneId, leaderguid )
	LuaFnSetCopySceneData_NoUserCloseTime( sceneId, x050013_g_NoUserTime * 1000 )
	LuaFnSetCopySceneData_Timer( sceneId, x050013_g_TickTime * 1000 )
	LuaFnSetCopySceneData_Param( sceneId, x050013_g_keySD["typ"], x050013_g_CopySceneType )
	LuaFnSetCopySceneData_Param( sceneId, x050013_g_keySD["spt"], x050013_g_ScriptId )
	LuaFnSetCopySceneData_Param( sceneId, x050013_g_keySD["tim"], 0 )
	LuaFnSetCopySceneData_Param( sceneId, x050013_g_keySD["scn"], sceneId )
	LuaFnSetCopySceneData_Param( sceneId, x050013_g_keySD["cls"], 0 )
	LuaFnSetCopySceneData_Param( sceneId, x050013_g_keySD["dwn"], 0 )
	LuaFnSetCopySceneData_Param( sceneId, x050013_g_keySD["tem"], GetTeamId( sceneId, selfId ) )
	LuaFnSetCopySceneData_Param( sceneId, x050013_g_keySD["FlagThielf"], 800 )
	
	local x,z = GetWorldPos( sceneId, selfId )	
	
	
	LuaFnSetCopySceneData_Param( sceneId, x050013_g_keySD["x"], x )
	LuaFnSetCopySceneData_Param( sceneId, x050013_g_keySD["z"], z )
	
	LuaFnSetCopySceneData_Param( sceneId, x050013_g_keySD["ObjKilled"], 0 )  --����ɱ������

  local PlayerMaxLevel = GetHumanMaxLevelLimit()
	local iniLevel;
	if mylevel < 10 then
		iniLevel = 10;
	elseif mylevel < PlayerMaxLevel then
		iniLevel = floor(mylevel/10) * 10;
	else
		iniLevel = PlayerMaxLevel;
	end
	
	LuaFnSetCopySceneData_Param( sceneId, x050013_g_keySD["MyLevel"], mylevel )
	
	LuaFnSetSceneLoad_Monster( sceneId, "zeiying_monster_" .. iniLevel .. ".ini" )
	
    local CopyScene_LevelGap = 31
	LuaFnSetCopySceneData_Param(sceneId, CopyScene_LevelGap, mylevel - iniLevel) --c�p���,CopyScene_LevelGap T�i  scene.lua �и�ֵ
	
	LuaFnSetCopySceneData_Param(sceneId, x050013_paramonce, 0)
	
	local bRetSceneID = LuaFnCreateCopyScene( sceneId )						--��ʼ����ɺ���ô�����������
	if bRetSceneID > 0 then
		x050013_NotifyTip( sceneId, selfId, "D�ch chuy�n th�nh c�ng!" )
	else
		x050013_NotifyTip( sceneId, selfId, "S� l��ng b�n sao �� �n gi�i h�n, � ngh� l�t n�a th� l�i!" )
	end


end

--**********************************
--����
--**********************************
function x050013_OnContinue( sceneId, selfId, targetId )

end

--**********************************
--�����ng������ύ
--**********************************
function x050013_CheckSubmit( sceneId, selfId, selectRadioId )


end

--**********************************
--�ύ
--**********************************
function x050013_OnSubmit( sceneId, selfId, targetId, selectRadioId )

end


function x050013_OnDie(sceneId, objId, killerId)
    --PrintStr( "x050013_OnDie [objId]"..objId.." [killerId]"..killerId.."[sceneId]"..sceneId )
    local DataID = GetMonsterDataID( sceneId, objId )
    x050013_OnKillObject( sceneId, killerId, DataID, objId )
    
end

--**********************************
--ɱ����������
--**********************************
function x050013_OnKillObject( sceneId, selfId, objdataId, objId )

--	for i=1,10 do
--		if (objdataId == x050013_NianShou_Boss[i]) then
--			return
--		end
--	end
	
	--��ng����ng����
	local sceneType = LuaFnGetSceneType( sceneId )
	if sceneType ~= 1 then
		return
	end

	--��ng����ng��C�n to� � ����
	local fubentype = LuaFnGetCopySceneData_Param( sceneId, 0 )
	if fubentype ~= x050013_g_CopySceneType then
		return
	end

	--�����رձ�־
	local leaveFlag = LuaFnGetCopySceneData_Param( sceneId, 4 )
	--��������Ѿ����óɹر�״̬,��ɱ����Ч
	if leaveFlag == 1 then
		return
	end

	--ȡ �i�m��ǰ������to� � ����
	local num = LuaFnGetCopyScene_HumanCount( sceneId )
	

	--ȡ �i�mɱ������to� � GroupID,�����ж���ng����ng��C�n ɱ��to� � Boss
	--local GroupID = GetMonsterGroupID( sceneId, objId )
	
	--local msgStr = format( "sceneId: %d, objId: %d, GroupID: %d", sceneId, objId, objdataId )
	--PrintStr( msgStr )
	
	--����ng��C�n to� � Boss
	local bIsBoss=0;
	
	local GroupID = GetMonsterGroupID( sceneId, objId )
	if GroupID == x050013_g_BossGroupID then
	    bIsBoss = 1
	end
	--if  objdataId >= x050013_g_typMonster0 and objdataId <= x050013_g_typMonster1 then
	--	bIsBoss = 1;
	--end

	-------------------------------------------------------------------------------
	local membercount = LuaFnGetCopyScene_HumanCount(sceneId);
	local memId
	local teamLeaderName;
	local firstMemName;
	local firstMemId;
	
	for	i = 0, membercount - 1 do
		memId = LuaFnGetCopyScene_HumanObjId(sceneId, i);
		if LuaFnIsObjValid( sceneId, memId ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, memId ) == 1 then	
			local teamLeaderFlag = LuaFnIsTeamLeader(sceneId, memId);
			if teamLeaderFlag and teamLeaderFlag == 1 then
				teamLeaderName = LuaFnGetName(sceneId, memId);
				break;
			end
		end
	end

	if bIsBoss==1 then	
			local message;
			
			local randMessage = random(3);
			if teamLeaderName ~= nil then		
				if randMessage == 1 then			
		   			message = format("#{ItemMsg_08}#B#{_INFOUSR%s}#{ItemMsg_09}", teamLeaderName );
				elseif randMessage == 2 then		
					message = format("#B#{_INFOUSR%s}#cff0000#{ItemMsg_11}", teamLeaderName );
				else
					message = format("#{ItemMsg_12}#B#{_INFOUSR%s}#cff0000#{ItemMsg_13}", teamLeaderName );
				end
			
				BroadMsgByChatPipe(sceneId, selfId, message, 4);
			end
	end
	-------------------------------------------------------------------------------



	local killedbossnumber = LuaFnGetCopySceneData_Param( sceneId, x050013_g_keySD["ObjKilled"] )			--ɱ��Bossto� � ����
	killedbossnumber = killedbossnumber + 1
	LuaFnSetCopySceneData_Param( sceneId, x050013_g_keySD["ObjKilled"] , killedbossnumber )					--����ɱ��Bossto� � ����

	local i
	local misIndex
	local humanObjId
	local score = 0
		
	for i=0, num-1 do

		local ServerID = LuaFnGetCopyScene_HumanObjId( sceneId, i )	  --ȡ �i�m��ǰ��������to� � objId

		if LuaFnIsObjValid( sceneId, ServerID ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, ServerID ) == 1 then			  --��T�i ����to� � �����˲���

			--��������
			score = GetMissionData( sceneId, ServerID, MD_ThiefSoldierInvade ) --ȡ����ǰ����

			if score < 65000 then

				if bIsBoss == 1 then
					score = score + 5
					if LuaFnIsTeamLeader( sceneId, selfId ) ~= 0 then
						local strLeaderName = GetName( sceneId, ServerID )
						local strMonsterName = GetMonsterNamebyDataId( objdataId )
					end  			    
				else
					score = score + 1
				end
	
				if score > 65000 then
					score = 65000    --�������Ƶ�65000
				end
				
				SetMissionData( sceneId, ServerID, MD_ThiefSoldierInvade, score )  --���õ�ǰ����

			end

			local ScoreStr = format( "�i�m t�ch l�y hi�n t�i %d", score)
			x050013_NotifyTip( sceneId, ServerID, ScoreStr ) --��ʾ������Ϣ

			local KillStr = format( "�� gi�t t�n �c t�c t�o ph�n: %d/%d", killedbossnumber, x050013_g_TotalNeedKillBoss )
			x050013_NotifyTip( sceneId, ServerID, KillStr ) --��ʾɱ������

		end

	end
	
	if killedbossnumber >= x050013_g_TotalNeedKillBoss then
		LuaFnSetCopySceneData_Param( sceneId, 4, 1 )  --����������ɱ�־
	end

    if killedbossnumber == ( x050013_g_TotalNeedKillBoss - 1 ) then    --ɱ��������С��,ˢboss
    --if killedbossnumber == ( x050013_g_TotalNeedKillBoss - 0 ) then    --ɱ��������С��,ˢboss	
		local CurLevel = LuaFnGetCopySceneData_Param( sceneId, x050013_g_keySD["MyLevel"] )
		--PrintStr( ""..level1..",c="..nearmembercount )
		x050013_CreateBoss( sceneId, CurLevel )
	end

end

--**********************************
--���������¼�
--**********************************
function x050013_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x050013_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--�����¼�
--**********************************
function x050013_OnCopySceneReady( sceneId, destsceneId )
    
	--���ø�����ڳ�����
	LuaFnSetCopySceneData_Param( destsceneId, 3, sceneId )
	local leaderguid = LuaFnGetCopySceneData_TeamLeader( destsceneId )
	local leaderObjId = LuaFnGuid2ObjId( sceneId, leaderguid )

	--�Ҳ��������
	if leaderObjId == -1 then
		return
	end

	--�����޷�ִ���߼�to� � ״̬
	if LuaFnIsCanDoScriptLogic( sceneId, leaderObjId ) ~= 1 then
		return
	end

	--ȡ �i�m��Ҹ���to� � ��������(�����Լ�)
	local numMem	= GetNearTeamCount( sceneId, leaderObjId )

	local member
	local misIndex
	
	NewWorld( sceneId, leaderObjId, destsceneId, x050013_g_Fuben_X, x050013_g_Fuben_Z )
	-- ����m�t ͳ��
	LuaFnAuditQuest(sceneId, leaderObjId, "K� th� x�m l��c")
	--PrintStr( "x050013_OnCopySceneReady" )		
	for	i=0, numMem-1 do
		member = GetNearTeamMember( sceneId, leaderObjId, i )

		if LuaFnIsCanDoScriptLogic( sceneId, member ) == 1 then			-- ���ڿ���ִ���߼�to� � ״̬
				NewWorld( sceneId, member, destsceneId, x050013_g_Fuben_X, x050013_g_Fuben_Z )
			-- ����m�t ͳ��
			LuaFnAuditQuest(sceneId, member, "K� th� x�m l��c")
		end
	end
	    
end

--**********************************
--����ҽ��븱���¼�
--**********************************
function x050013_OnPlayerEnter( sceneId, selfId )
	--��� gi�y����󸴻� �i�mλ��
	SetPlayerDefaultReliveInfo( sceneId, selfId, "%10", -1, "0", sceneId, x050013_g_Fuben_X, x050013_g_Fuben_Z )
end

--**********************************
--�����T�i �����������¼�
--**********************************
function x050013_OnHumanDie( sceneId, selfId, killerId )

end

--**********************************
--��ĳ��Ҵ��ͳ�����,�ص�����ʱto� � λ��
--**********************************
function x050013_KickOut( sceneId, objId )
    local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )	--ȡ �i�m������ڳ�����
	local x = LuaFnGetCopySceneData_Param( sceneId, x050013_g_keySD["x"] ) --����ʱto� � ����X
	local z = LuaFnGetCopySceneData_Param( sceneId, x050013_g_keySD["z"] ) --����ʱto� � ����Z
	
	if LuaFnIsObjValid( sceneId, objId ) == 1 then
	    NewWorld( sceneId, objId, oldsceneId, x, z )
	end
	
end

--**********************************
--����������ʱ���¼�
--**********************************
function x050013_OnCopySceneTimer( sceneId, nowTime )

	local once = LuaFnGetCopySceneData_Param( sceneId, x050013_paramonce )

--	if (once == 0) then
--	
--		LuaFnSetCopySceneData_Param(sceneId, x050013_paramonce, 1)
--		--��������
--		local mylevel = LuaFnGetCopySceneData_Param( sceneId, x050013_g_keySD["MyLevel"] )
--	
--		local PlayerMaxLevel = GetHumanMaxLevelLimit()
--		local iniLevel;
--		if mylevel < 10 then
--			iniLevel = 10;
--		elseif mylevel < PlayerMaxLevel then
--			iniLevel = floor(mylevel/10) * 10;
--		else
--			iniLevel = PlayerMaxLevel;
--		end
--	
--		local iNianShouIdx = iniLevel / 10
--	
--		for i=1, 5 do
--			local objId = LuaFnCreateMonster( sceneId, x050013_NianShou_Boss[iNianShouIdx], x050013_NianShou_Pos[i].x, x050013_NianShou_Pos[i].z, 1, 272, -1)
--			SetLevel( sceneId, objId, mylevel )
--			LuaFnSendSpecificImpactToUnit(sceneId, objId, objId, objId, 10472, 0); -- zchw
--		end  
--	end
	
	
	--����ʱ�Ӷ�ȡ������
	--ȡ �i�m�Ѿ�ִ��to� � ��ʱ����
	local TickCount = LuaFnGetCopySceneData_Param( sceneId, 2 )
	TickCount = TickCount + 1
	--������to� � ��ʱ�����ô���
	LuaFnSetCopySceneData_Param( sceneId, 2, TickCount )

	--�����رձ�־
	local leaveFlag = LuaFnGetCopySceneData_Param( sceneId, 4 )

	local membercount = LuaFnGetCopyScene_HumanCount( sceneId )
	local mems = {}
	local i

	for	i=0, membercount-1 do
		mems[i] = LuaFnGetCopyScene_HumanObjId( sceneId, i )
	end

	--C�n �뿪
	if leaveFlag == 1 then
		--�뿪����ʱ��to� � ��ȡ������
		local leaveTickCount = LuaFnGetCopySceneData_Param( sceneId, 5 )
		leaveTickCount = leaveTickCount + 1
		LuaFnSetCopySceneData_Param( sceneId, 5, leaveTickCount )

		if leaveTickCount == x050013_g_CloseTick then										--����ʱ�䵽,��Ҷ���ȥ��
			local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )	--ȡ �i�m������ڳ�����

			--����ǰ����������to� � �����˴��ͻ�ԭ������ʱ��to� � ����
			for	i=0, membercount-1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					x050013_KickOut( sceneId, mems[i] )				
				end
			end
						
		elseif leaveTickCount < x050013_g_CloseTick then
			--֪ͨ��ǰ����������to� � ������,�����رյ���ʱ��
			local strText = format( "C�c h� s� r�i kh�i ��y sau %d gi�y!", (x050013_g_CloseTick-leaveTickCount) * x050013_g_TickTime )

			for	i=0, membercount-1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					x050013_NotifyTip( sceneId, mems[i], strText )
				end
			end
		end
	elseif TickCount == x050013_g_LimitTimeSuccess then
		--�˴�������ʱ������to� � ������ɴ���
		local misIndex
		for	i=0, membercount-1 do
			if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
				x050013_NotifyTip( sceneId, mems[i], "Th�i gian ho�n t�t nhi�m v� �� t�i, ho�n th�nh!" )
			end
		end

		--���ø����رձ�־
		LuaFnSetCopySceneData_Param( sceneId, 4, 1 )
	elseif TickCount == x050013_g_LimitTotalHoldTime then						--������ʱ�����Ƶ���
		--�˴����ø���������ʱ������to� � ���,��ʱ�䵽����...
		for	i=0, membercount-1 do
			if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
				x050013_NotifyTip( sceneId, mems[i], "Nhi�m v� th�t b�i, qu� gi�!" )
			end
		end

		--���ø����رձ�־
		LuaFnSetCopySceneData_Param( sceneId, 4, 1 )
	else
	
		--��ʱ�������Աto� � �����,���������,���߳�����
		local oldteamid = LuaFnGetCopySceneData_Param( sceneId, 6 )		--ȡ �i�m����to� � �����
		local oldsceneId

		for	i=0, membercount-1 do
			if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
				if oldteamid ~= GetTeamId( sceneId, mems[i] ) then
					x050013_NotifyTip( sceneId, mems[i], "Ng߽i kh�ng � trong �i!" )
					x050013_KickOut( sceneId, mems[i] )
				end
			end
		end

	end

end

--**********************************
--�Ի�������Ϣ��ʾ
--**********************************
function x050013_MsgBox( sceneId, selfId, targetId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

end

--**********************************
--��Ŀ��ʾ
--**********************************
function x050013_NotifyTip( sceneId, selfId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end
