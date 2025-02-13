-- T� Ch�uNPC
-- ������
-- m�t ��

-- �ű���
x001037_g_scriptId = 001037

x001037_g_shoptableindex = 25

x001037_g_ControlScript = 050009
x001037_g_ExchangeList = { id = 40004304, name = "H߽ng li�u lo�i ngon", cost = 30 }
x001037_g_yiexihuFlag = 1;

--**********************************
--�¼��������
--**********************************
function x001037_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "#{BSR_80919_1}" )
		AddNumText( sceneId, x001037_g_scriptId, "Ng߽i mu�n mua g� n�o?", 7, 0 )
		--if x001037_g_yiexihuFlag == 1 then
		--	AddNumText( sceneId, x001037_g_scriptId, "ȥҹT�y H�", 6, 3 )
			AddNumText( sceneId, x001037_g_scriptId, "Gi�i thi�u b�t �om ��m", 11, 14 )
			AddNumText( sceneId, x001037_g_scriptId, "Gi�i thi�u ho�t �ng Tuy�t c�u, L�c Чu Thang, n߾c D�a H�u", 11, 15 )
		--end

		if CallScriptFunction( x001037_g_ControlScript, "IsMidAutumnPeriod", sceneId, selfId ) > 0 then
			--AddNumText( sceneId, x001037_g_scriptId, "��ȡʳ��", 6, 1 )
			--AddNumText( sceneId, x001037_g_scriptId, "ʳ����ʲô��", 11, 2 )
		end
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��m�t ��
--**********************************
function x001037_OnEventRequest( sceneId, selfId, targetId, eventId )
	if eventId == x001037_g_scriptId then
		local selectItem = GetNumText();
		if selectItem == 0 then
			DispatchShopItem( sceneId, selfId, targetId, x001037_g_shoptableindex )
		end
		
		if x001037_g_yiexihuFlag == 1 then
			if selectItem == 3 then
				--CallScriptFunction((400900), "TransferFuncFromNpc",sceneId, selfId, 121, 40, 52);
			elseif selectItem == 14 then
				BeginEvent(sceneId)
					AddText( sceneId, "#{function_help_091}" )
				EndEvent(sceneId)
				DispatchEventList( sceneId, selfId, targetId )
			elseif selectItem == 15 then
				BeginEvent(sceneId)
					AddText( sceneId, "#{function_help_092}" )
				EndEvent(sceneId)
				DispatchEventList( sceneId, selfId, targetId )
			end
		end
	end

	if CallScriptFunction( x001037_g_ControlScript, "IsMidAutumnPeriod", sceneId, selfId ) > 0 then
		if GetNumText() == 1 then
			local score = GetMissionData( sceneId, selfId, MD_MIDAUTUMN_SCORE )
			if score < x001037_g_ExchangeList.cost then
				x001037_NotifyFailBox( sceneId, selfId, targetId, "    C�n ph�i �i 1 ph�n " .. x001037_g_ExchangeList.name ..
				", c�n t�ch �i�m " .. x001037_g_ExchangeList.cost .. " �i�m, hi�n gi� ng߽i ch� c� " .. score .. " �i�m, h�nh nh� kh�ng ��." )
				return
			end

			BeginEvent( sceneId )
				AddText( sceneId, "  �i�m t�ch l�y trung thu c�a ng߽i hi�n " .. score .. " �i�m, �i l�y m�t ph�n" ..
					x001037_g_ExchangeList.name .. ", c�n t�ch �i�m " .. x001037_g_ExchangeList.cost .. " �i�m, ng߽i x�c �nh �i kh�ng?" )

				AddNumText( sceneId, x001037_g_scriptId, "X�c �nh mu�n �i", -1, 3 )
				AddNumText( sceneId, x001037_g_scriptId, "Ta ch� �i qua", -1, 4 )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
		elseif GetNumText() == 2 then
			x001037_NotifyFailBox( sceneId, selfId, targetId, "    Kh߽ng L� � L�c D߽ng [127, " ..
				"154], Bao Th� Vinh � T� Ch�u [190,168], в T� Тng � ��i L� [109,170] � �i" ..
				"Sau khi �� c� 3 lo�i nguy�n li�u � �n kh�c nhau, h�y t�m Nh�c Th߶ng Vi�n � T� Ch�u [193,148] ��a t�i T�y H� �i l�y B�nh Trung thu" ..
				"V�t ph�m �c bi�t" )
			return
		elseif GetNumText() == 3 then
			local score = GetMissionData( sceneId, selfId, MD_MIDAUTUMN_SCORE )
			if score < x001037_g_ExchangeList.cost then
				return
			end

			if LuaFnTryRecieveItem( sceneId, selfId, x001037_g_ExchangeList.id, QUALITY_MUST_BE_CHANGE ) < 0 then
				x001037_NotifyFailBox( sceneId, selfId, targetId, "    Kh�ng gian trong tay n�i �� �y" )
			end

			score = score - x001037_g_ExchangeList.cost
			SetMissionData( sceneId, selfId, MD_MIDAUTUMN_SCORE, score )
			x001037_NotifyFailBox( sceneId, selfId, targetId, "    �i�m t�ch l�y d� th�a: " .. score .. "." )
			return
		elseif GetNumText() == 4 then
			BeginUICommand( sceneId )
			EndUICommand( sceneId )
			DispatchUICommand( sceneId, selfId, 1000 )
		end
		return
	end
end

--**********************************
--�Ի�������Ϣ��ʾ
--**********************************
function x001037_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
