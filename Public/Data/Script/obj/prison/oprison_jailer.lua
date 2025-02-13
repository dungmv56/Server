--监狱NPC
--狱卒
--普通

x077011_g_ScriptId	= 077011

--操作集
x077011_g_Key				=
{
	["dlg"]	= 10,	--这里喧ng哪儿?
	["out"]	= 11,	--我要出去
	["sn0"]	= 0,	--去L誧 D呓ng
	["sn1"]	= 1,	--去T� Ch鈛
	["sn2"]	= 2,	--去姓i L�
}

--获释条件,最小杀气值
x077011_g_PKMinVal	= 8--[tx43640]由4改为8

--**********************************
--事件交互入口
--**********************************
function x077011_OnDefaultEvent( sceneId, selfId, targetId )

	BeginEvent( sceneId )
			AddText(sceneId, "#{PRISON_081120_01}")
			AddNumText( sceneId, x077011_g_ScriptId, "Ta mu痭 餴", 9, x077011_g_Key["out"] )
			AddNumText( sceneId, x077011_g_ScriptId, "锈y l� 疴u?", 11, x077011_g_Key["dlg"] )
			AddNumText( sceneId, x077011_g_ScriptId, "Ta mu痭 gi鋓 oan", 9, 21 )
			AddNumText( sceneId, x077011_g_ScriptId, "Ta c� 穑c x� l畁h.", 9, 15 )
			AddNumText( sceneId, x077011_g_ScriptId, "C醝 g� l� gi鋓 oan?", 11, 22 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

end

--**********************************
--事件列表选中m祎 项
--**********************************
function x077011_OnEventRequest( sceneId, selfId, targetId, eventId )

	local	key	= GetNumText()
	local	val	= LuaFnGetHumanPKValue( sceneId, selfId )	--杀气值
	
	if key == 15 then
		
				
		local nItemCount = GetItemCount(sceneId, selfId, 30008019);
		if nItemCount <= 0 then
			x077011_MsgBox( sceneId, selfId, targetId, "#{TeSheLing_00}" )
			return 0;
		end
		
		if IsWaiGuaUser( sceneId, selfId ) > 0 then
			x077011_MsgBox( sceneId, selfId, targetId, "Do c醕 h� s� d鴑g ch呓ng tr靚h kh鬾g cho ph閜 b� b v鄌 Gi醡 ng鴆, n阯 kh鬾g th� s� d鴑g 穑c x� l畁h." )
			return 0;
		end
		
		local bRet = 0;
		
		local	bagpos = GetItemBagPos( sceneId, selfId, 30008019, 0 )
	
		if LuaFnLockCheck( sceneId, selfId, bagpos, 0 ) < 0 then
			local nItemNum = LuaFnGetAvailableItemCount( sceneId, selfId, 30008019 );		
			if nItemNum <= 0 then
				x077011_MsgBox( sceneId, selfId, targetId, "V ph n鄖 疸 b� kh骯!" )
				return 0;
			end
		end

		bRet = 1;
		
		if bRet > 0 then
			BeginEvent( sceneId )
				AddText( sceneId, "  Xin ch鷆 m譶g, cu痠 c鵱g ng呓i c鹡g c� th� ra 疬㧟, nh� sau khi ra kh鬾g 疬㧟 s醫 h読 v� t礽, n猽 kh鬾g ta l� s� kh鬾g tha cho ng呓i, ng呓i mu痭 t緄 th鄋h th� n鄌?" )
				AddNumText( sceneId, x077011_g_ScriptId, "L誧 D呓ng", 9, 3 )
				AddNumText( sceneId, x077011_g_ScriptId, "T� Ch鈛", 9, 4 )
				AddNumText( sceneId, x077011_g_ScriptId, "姓i L�", 9, 5 )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			
			
			
		end
		
		return 0;
	end
	
	if key == 21 then
		x077011_ShenYuan( sceneId, selfId, targetId )
		return 0
	elseif key == 22 then
		x077011_MsgBox( sceneId, selfId, targetId, "#{PRISON_SHENYUAN_00}" )
		return 0
	end
	
	--这里喧ng哪儿?
	if key == x077011_g_Key["dlg"]	then
			x077011_MsgBox( sceneId, selfId, targetId, "#{function_help_087}" )
			return 0

	--我要出去
	elseif key == x077011_g_Key["out"] then
		if val > x077011_g_PKMinVal then
			x077011_MsgBox( sceneId, selfId, targetId, "  S醫 kh� c黙 c醕 h� hi畁 l� "..val..", ch� c� th h絥 ho bg "..x077011_g_PKMinVal.." 餴琺 th� m緄 c� th� ra" )
			return 0
		end

		BeginEvent( sceneId )
			AddText( sceneId, "  Xin ch鷆 m譶g, cu痠 c鵱g ng呓i c鹡g c� th� ra 疬㧟, nh� sau khi ra kh鬾g 疬㧟 s醫 h読 v� t礽, n猽 kh鬾g ta l� s� kh鬾g tha cho ng呓i, ng呓i mu痭 t緄 th鄋h th� n鄌?" )
			AddNumText( sceneId, x077011_g_ScriptId, "L誧 D呓ng", 9, x077011_g_Key["sn0"] )
			AddNumText( sceneId, x077011_g_ScriptId, "T� Ch鈛", 9, x077011_g_Key["sn1"] )
			AddNumText( sceneId, x077011_g_ScriptId, "姓i L�", 9, x077011_g_Key["sn2"] )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	--去L誧 D呓ng
	elseif key == x077011_g_Key["sn0"] then
		--获释
		PrisonGoOut( sceneId, selfId )
		--回城
		NewWorld( sceneId, selfId, 0,132,183 )

	--去T� Ch鈛
	elseif key == x077011_g_Key["sn1"] then
		--获释
		PrisonGoOut( sceneId, selfId )
		--回城
		NewWorld( sceneId, selfId, 1,114,162 )

	--去姓i L�
	elseif key == x077011_g_Key["sn2"] then
		--获释
		PrisonGoOut( sceneId, selfId )
		--回城
		NewWorld( sceneId, selfId, 2,241,141 )
	
	elseif key == 3 then
			
		local	bagpos1 = GetItemBagPos( sceneId, selfId, 30008019, 0 )
		if LuaFnLockCheck( sceneId, selfId, bagpos1, 0 ) < 0 then
			local nItemNum = LuaFnGetAvailableItemCount( sceneId, selfId, 30008019 );		
			if nItemNum <= 0 then
				x077011_MsgBox( sceneId, selfId, targetId, "V ph n鄖 疸 b� kh骯!" )
				return 0;
			end
		end
	
		--获释
		PrisonGoOut( sceneId, selfId )
		--回城
		NewWorld( sceneId, selfId, 0, 132, 183 )
		
		LuaFnDelAvailableItem(sceneId, selfId, 30008019, 1);

	elseif key == 4 then
	
		local	bagpos2 = GetItemBagPos( sceneId, selfId, 30008019, 0 )
		if LuaFnLockCheck( sceneId, selfId, bagpos2, 0 ) < 0 then
			local nItemNum = LuaFnGetAvailableItemCount( sceneId, selfId, 30008019 );		
			if nItemNum <= 0 then
				x077011_MsgBox( sceneId, selfId, targetId, "V ph n鄖 疸 b� kh骯!" )
				return 0;
			end
		end
	
		--获释
		PrisonGoOut( sceneId, selfId )
		--回城
		NewWorld( sceneId, selfId, 1, 114,162 )
		
		LuaFnDelAvailableItem(sceneId, selfId, 30008019, 1);

	elseif key == 5 then
	
		local	bagpos3 = GetItemBagPos( sceneId, selfId, 30008019, 0 )
		if LuaFnLockCheck( sceneId, selfId, bagpos3, 0 ) < 0 then
			local nItemNum = LuaFnGetAvailableItemCount( sceneId, selfId, 30008019 );		
			if nItemNum <= 0 then
				x077011_MsgBox( sceneId, selfId, targetId, "V ph n鄖 疸 b� kh骯!" )
				return 0;
			end
		end
	
		--获释
		PrisonGoOut( sceneId, selfId )
		--回城
		NewWorld( sceneId, selfId, 2, 241, 138 )
		
		LuaFnDelAvailableItem(sceneId, selfId, 30008019, 1);

	end
	
	if val > x077011_g_PKMinVal then --[tx43640]原为>= 5,应改为>x077011_g_PKMinVal,其实应该喧ng[8,10]中to� 鸬 m祎 c醝值 
		LuaFnSetHumanPKValue(sceneId, selfId, x077011_g_PKMinVal)--[tx43640]原为4,应改为x077011_g_PKMinVal
		
		-- [ QUFEI 2007-11-09 15:36 UPDATE BugID 27611 ]		
		local LogInfo	= format( "[ChangePKValue]:Prison sceneId=%d, GUID=%0X, PKValueBgn=%d, PKValueEnd=%d",
				sceneId,
				LuaFnObjId2Guid( sceneId, selfId ),			
				val,
				LuaFnGetHumanPKValue(sceneId, selfId) )
		WriteCheckLog( sceneId, selfId, LogInfo )
		
	end
	
	return 1

end

--**********************************
--事件列表选中m祎 项
--**********************************
function x077011_MsgBox( sceneId, selfId, targetId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

end


--**********************************
--伸冤
--**********************************
function x077011_ShenYuan( sceneId, selfId, targetId )

	--判断杀气....
	if LuaFnGetHumanPKValue( sceneId, selfId ) > x077011_g_PKMinVal then
		x077011_MsgBox( sceneId, selfId, targetId, "#{PRISON_SHENYUAN_01}" )
		return
	end
	
	--判断当前喧ng否禁止伸冤....
	if GetMissionFlag( sceneId, selfId, MF_CannotPrisonShenyuan ) == 1 then
		x077011_MsgBox( sceneId, selfId, targetId, "#{PRISON_SHENYUAN_02}" )
		return
	end
	
	--判断今天喧ng否已经用过伸冤了....
	local lastDayTime = GetMissionData( sceneId, selfId, MD_PRISON_SHENYUAN_DAYTIME )
	local CurDayTime = GetDayTime()
	if CurDayTime <= lastDayTime then
		x077011_MsgBox( sceneId, selfId, targetId, "#{PRISON_SHENYUAN_03}" )
		return
	end
	
	--设置今天已经用过伸冤了....
	SetMissionData( sceneId, selfId, MD_PRISON_SHENYUAN_DAYTIME, CurDayTime )
	
	--弹出图形验证让玩糾祎 卮鹞侍�....
	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)

	LuaFnSendGuajiQuestion( sceneId, selfId )

end

