--���Nhi�m v� s� m�n

--�ű���
x806009_g_ScriptId	= 806009

--���ʦ��
x806009_g_ExpelPrentice					= {}
x806009_g_ExpelPrentice["Id"]		= 1006
x806009_g_ExpelPrentice["Name"]	= "Khai tr� ra kh�i s� m�n"

--��ʾ��Ϣ
x806009_g_msg				=
{
	["gld"]= "  а � mu�n ra kh�i s� m�n c�n ph�i n�p #{_EXCHG%d}.",
	["con"]= "  Khai tr� � � s� b� tr� #{_EXCHG%d}, c� th�t c�c h� mu�n khai tr� ng߶i � �: %s",
}

--����ͽ��,�۳���Ǯ
x806009_g_Gold			= 25000

--**********************************
--������ں���
--**********************************
function x806009_OnDefaultEvent( sceneId, selfId, targetId )
	local	key	= GetNumText()
	local guid
	local PrenticeName
	local	log	= 0
	local	str

	if key == -1 then
		BeginEvent( sceneId )
		for i=0, 7 do
			guid = LuaFnGetPrenticeGUID( sceneId, selfId, i )
			if guid ~= -1 then
				log	= 1
				PrenticeName	= LuaFnGetFriendName( sceneId, selfId, guid )
				AddNumText( sceneId, x806009_g_ScriptId, "S� "..PrenticeName.." B� �u�i ra kh�i s� m�n", 6, i )
			end
		end

		if log == 0 then
			AddText( sceneId, "  Ng߽i kh�ng c� � �" )
		end
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
	
	if key >= 0 and key <=7 then
		guid	= LuaFnGetPrenticeGUID( sceneId, selfId, key )
		if guid ~= -1 then
			PrenticeName	= LuaFnGetFriendName( sceneId, selfId, guid )
		end
		str	= format( x806009_g_msg["con"], x806009_g_Gold, PrenticeName )
		BeginEvent( sceneId )
			AddText( sceneId, str )
			AddNumText( sceneId, x806009_g_ScriptId, "C�", 6, (key+1)*100 )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end

	if key >= 100 then
		if x806009_CheckAccept( sceneId, selfId, targetId ) > 0 then
			x806009_OnAccept( sceneId, selfId, targetId, floor(key/100)-1 )
		end
	end

end

--**********************************
--�о��¼�
--**********************************
function x806009_OnEnumerate( sceneId, selfId, targetId )
	AddNumText( sceneId, x806009_g_ScriptId, x806009_g_ExpelPrentice["Name"], 6, -1 )
end

--**********************************
--���Ti�p th�����
--**********************************
function x806009_CheckAccept( sceneId, selfId, targetId )
	--���ʦ�����Ͻ�Ǯ
	--if LuaFnGetMoney( sceneId, selfId ) < x806009_g_Gold then
	--hzp 2008-12-9
	local nMoneyJZ = GetMoneyJZ(sceneId, selfId);
	local nMoneyJB = LuaFnGetMoney(sceneId, selfId);
	local nMoneySelf = nMoneyJZ + nMoneyJB;
	if nMoneySelf < x806009_g_Gold then
		str	= format( x806009_g_msg["gld"], x806009_g_Gold )
		x806009_MsgBox( sceneId, selfId, targetId, str )
		return 0
	end

	return 1
end

--**********************************
--Ti�p th�
--**********************************
function x806009_OnAccept( sceneId, selfId, targetId, nIndex )
	
	-- [ QUFEI 2007-08-16 16:53 UPDATE BugID 23624 ]
	local PrenticeGUID = LuaFnGetPrenticeGUID( sceneId, selfId, nIndex )
	if PrenticeGUID == -1 then
		BeginEvent( sceneId )
		AddText( sceneId, "  Ng߽i kh�ng c� � �" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end
		
	local PrenticeName	= LuaFnGetFriendName( sceneId, selfId, PrenticeGUID )
	local selfName	= LuaFnGetName( sceneId, selfId )

	--�۳����Ͻ�Ǯ
	--LuaFnCostMoney( sceneId, selfId, x806009_g_Gold )
	--str	= format( "B� quan h� s�-� b� ph�t #{_MONEY%d}.", x806009_g_Gold )
	--Msg2Player( sceneId, selfId, str, MSG2PLAYER_PARA )
	
	--hzp 2008-12-9
	local nMoneyJZ, nMoneyJB = LuaFnCostMoneyWithPriority( sceneId, selfId, x806009_g_Gold )
	--���ֻ�۳����
	if nMoneyJZ == 0 then
		str	= format( "B� quan h� s�-� b� ph�t #{_MONEY%d}.", x806009_g_Gold )
		Msg2Player( sceneId, selfId, str, MSG2PLAYER_PARA )
	end
	--���ֻ�۳�����
	if nMoneyJB == 0 then
		str	= format( "B� quan h� s�-� b� ph�t #{_EXCHG%d}.", x806009_g_Gold )
		Msg2Player( sceneId, selfId, str, MSG2PLAYER_PARA )
	end
	--������н������н��
	if nMoneyJB ~= 0 and nMoneyJZ ~= 0 then
		str	= format( "B� quan h� s�-� b� ph�t #{_EXCHG%d}: #{_MONEY%d}.", nMoneyJZ, nMoneyJB )
		Msg2Player( sceneId, selfId, str, MSG2PLAYER_PARA )
	end
	x806009_MsgBox( sceneId, selfId, targetId, "  Ng߽i �� b� quan h� v�i "..PrenticeName.."Quan h� s� � c�a" )

	--����ͨ�ʼ���ͽ��
	LuaFnSendSystemMail( sceneId, PrenticeName, "S� ph� c�a ng߽i, " .. selfName .. ", kh�ng ti�p t�c d�y b�o v� �� tho�t kh�i quan h� s� � v�i ng߽i." )
	--LuaFnSendNormalMail( sceneId, selfId, PrenticeName, "C�a ng߽i ʦ��" .. selfName .. "�����ڼ����̵���,������������ʦͽ��ϵ." )
	--����ִ���ʼ���ͽ��
	LuaFnSendScriptMail( sceneId, PrenticeName, MAIL_EXPELPRENTICE, 0, 0, 0 )

	--���������Ż�
	LuaFnExpelPrentice( sceneId, selfId, PrenticeGUID )
end

--**********************************
--�Ի�������Ϣ��ʾ
--**********************************
function x806009_MsgBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
