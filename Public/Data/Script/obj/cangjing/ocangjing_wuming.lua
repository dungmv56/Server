--藏经阁NPC
--无名老僧
--普通

x122001_g_ScriptId	= 122001



--**********************************
--事件交互入口
--**********************************
function x122001_OnDefaultEvent( sceneId, selfId,targetId )

	BeginEvent( sceneId )
		AddText( sceneId, "  A Di 朽 Ph, thi畁 tai thi畁 tai. #r#rT c� 皤u tr� th鄋h Ph ph醦, 皤u tr� th鄋h bong b髇g m祅g 鋙 m� th鬷. #r#rNh� s呓ng c鹡g nh� 餴畁, c鹡g ch� 瓞 nh靚 nh� th� m� th鬷. #r#rNh鎛g n絠 $N 疸 t譶g 餴, 皤u l� h� 鋙 c�, kh鬾g bg 瓞 l鉶 t錸g ch� gi醥 cho ng呓i th." )
		AddNumText( sceneId, x122001_g_ScriptId, "Th鄋h th� - T� Ch鈛", 9, 1001 )
		AddNumText( sceneId, x122001_g_ScriptId, "Th鄋h th� - 姓i L�", 9, 1002 )
		AddNumText( sceneId, x122001_g_ScriptId, "Th鄋h th� - L誧 D呓ng", 9, 1003 )

	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中m祎 项
--**********************************
function x122001_OnEventRequest( sceneId, selfId, targetId, eventId )
	--队伍相关
	if GetTeamId(sceneId,selfId)>=0 and 
		IsTeamFollow(sceneId, selfId)==1 and
		LuaFnIsTeamLeader(sceneId,selfId)==1 then
		num=LuaFnGetFollowedMembersCount( sceneId, selfId)
		local mems = {}
		for	i=0,num-1 do
			mems[i] = GetFollowedMember(sceneId, selfId, i)
			if mems[i] == -1 then
				return
			end
			if IsHaveMission(sceneId,mems[i],4021) > 0 then
				x122001_MsgBox( sceneId, selfId, targetId, "  Th鄋h vi阯 trong nh髆 ng呓i c� ng叨i c� nhi甿 v� ch� h鄋g bg 疬秐g thu�, d竎h tr誱 ch鷑g ta kh鬾g th� cung c d竎h v� cho ng呓i" )
				return
			end
		end
	end

	--漕运相关
	if IsHaveMission(sceneId,selfId,4021) > 0 then
		x122001_MsgBox( sceneId, selfId, targetId, "  Ng呓i c� nhi甿 v� ch� h鄋g bg 疬秐g thu�, d竎h tr誱 ch鷑g ta kh鬾g th� cung c d竎h v� cho ng呓i." )
		return
	end

	--顺利传送
	local	arg	= GetNumText()

	if arg == 1001 then		--T� Ch鈛
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 1, 114,162 )
		return
	end
	if arg == 1002 then		--姓i L�
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 2, 241, 141 )
		return
	end
	if arg == 1003 then		--L誧 D呓ng
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 0, 132, 183 )
		return
	end

end

--**********************************
--对话窗口信息提示
--**********************************
function x122001_MsgBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
