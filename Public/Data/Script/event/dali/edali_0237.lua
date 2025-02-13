--了解九大门派特色

--脚本号
x210237_g_ScriptId	= 210237

--门派信息(门派名称,特色描述,接引人坐标,接引人名称,传送坐标)
x210237_g_mpInfo		= {}
x210237_g_mpInfo[0]	= { " [Thi阯 Long]", "#{OBJ_dali_0045}", 189, 124, "Ph� Tham",    185, 128 }
x210237_g_mpInfo[1]	= { " [Nga My]", "#{OBJ_dali_0046}", 192, 129, "L� Tam N呓ng",  185, 128 }
x210237_g_mpInfo[2]	= { " [C醝 Bang]", "#{OBJ_dali_0047}", 126, 135, "Gi鋘 Ninh",    133, 130 }
x210237_g_mpInfo[3]	= { " [Minh Gi醥]", "#{OBJ_dali_0048}", 130, 121, "Th誧h B鋙",    133, 130 }
x210237_g_mpInfo[4]	= { " [Thi猽 L鈓]", "#{OBJ_dali_0049}", 187, 122, "Tu� D竎h",    185, 128 }
x210237_g_mpInfo[5]	= { " [Thi阯 S絥]", "#{OBJ_dali_0050}", 131, 124, "Tr靚h Thanh S呓ng",  133, 130 }
x210237_g_mpInfo[6]	= { " [V� 衋ng]", "#{OBJ_dali_0051}", 127, 131, "Tr呓ng Ho誧h",    133, 130 }
x210237_g_mpInfo[7]	= { " [Ti陁 Dao]", "#{OBJ_dali_0052}", 188, 133, "朽m 朽i T� V�",185, 128 }
x210237_g_mpInfo[8]	= { " [Tinh T鷆]", "#{OBJ_dali_0053}", 134, 120, "H鋓 Phong T�",  133, 130 }

--任务入口函数
--**********************************
function x210237_OnDefaultEvent( sceneId, selfId, targetId )
	local	key	= GetNumText()
	local	mp
	local	i		= 0
	
	--了解门派特色
	if key == 100 then
		BeginEvent( sceneId )
			AddText( sceneId, "  C豼 鹫i m鬾 ph醝" )
			for i, mp in x210237_g_mpInfo do
				AddNumText( sceneId, x210237_g_ScriptId, mp[1], 11, i+1 )
			end
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	--选择各门派
	elseif key >= 1 and key <= 9 then
		mp	= x210237_g_mpInfo[key-1]
		BeginEvent( sceneId )
			AddText( sceneId, mp[2] )
			AddNumText( sceneId, x210237_g_ScriptId, "羞a ta 餴 g ng叨i truy玭 th鬾g", 9, -1*key )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	--羞a ta 餴见传送人
	elseif key >= -9 and key <= -1 then
		mp	= x210237_g_mpInfo[-1*key-1]
		CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, mp[3], mp[4], mp[5] )
		SetPos( sceneId, selfId, mp[6], mp[7] )
		
		--关闭界面
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )

	--其他
	else
		return
	end
end

--**********************************
--列举事件
--**********************************
function x210237_OnEnumerate( sceneId, selfId, targetId )
	if GetLevel( sceneId, selfId ) >= 10 and GetMenPai( sceneId, selfId ) == MP_WUMENPAI then
		AddNumText( sceneId, x210237_g_ScriptId, "T靘 hi瑄 穑c tr遪g C豼 鹫i m鬾 ph醝", 11, 100 )
	end
end

--**********************************
--检测Ti猵 th跫�
--**********************************
function x210237_CheckAccept( sceneId, selfId )
	--C 10c才能接
	if GetLevel( sceneId, selfId ) >= 10 and GetMenPai( sceneId, selfId ) == MP_WUMENPAI then
		return 1
	else
		return 0
	end
end

--**********************************
--Ti猵 th�
--**********************************
function x210237_OnAccept( sceneId, selfId )
end

--**********************************
--放弃
--**********************************
function x210237_OnAbandon( sceneId, selfId )
end

--**********************************
--继续
--**********************************
function x210237_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--检测喧ng否可以提交
--**********************************
function x210237_CheckSubmit( sceneId, selfId )
	return 1
end

--**********************************
--提交
--**********************************
function x210237_OnSubmit( sceneId, selfId, targetId, selectRadioId )
end

--**********************************
--杀死怪物或玩家
--**********************************
function x210237_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--进入区域事件
--**********************************
function x210237_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x210237_OnItemChanged( sceneId, selfId, itemdataId )
end
