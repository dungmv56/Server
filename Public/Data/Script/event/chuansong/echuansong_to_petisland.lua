--事件
--传送到珍兽岛

--脚本号
x400918_g_ScriptId = 400918

--任务文本描述
x400918_g_MissionName="歇n Huy玭 V� 袖o"
x400918_g_MissionInfo="Chuy琻 皙n Tr鈔 th� 痄o"  --任务描述
x400918_g_MissionTarget="Chuy琻 皙n Tr鈔 th� 痄o"		--M鴆 ti陁 nhi甿 v�
x400918_g_ContinueInfo="Chuy琻 皙n Tr鈔 th� 痄o"		--未Ho鄋 t nhi甿 v鴗o� 鸬 npc对话
x400918_g_MissionComplete="Chuy琻 皙n Tr鈔 th� 痄o"					--Ho鄋 t nhi甿 v鴑pc说话to� 鸬 话

--**********************************
--入口函数
--**********************************
function x400918_OnDefaultEvent( sceneId, selfId, targetId )	-- 餴琺击该任务后执行此脚本

	-- 检测玩家身上喧ng不喧ng有“银票”C醝 n鄖 东西,有就不能使用这里to� 鸬 功能
	if GetItemCount(sceneId, selfId, 40002000) >= 1 then
		BeginEvent( sceneId )
			AddText( sceneId, "  Xin th� l瞚 tr阯 ng叨i c醕 h� 餫ng gi� ng鈔 phi猽 ta kh鬾g th� gi鷓 疬㧟." )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end

	--漕运相关
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
				BeginEvent( sceneId )
					AddText( sceneId, "  Trong 鸬i ng� c黙 c醕 h� c� ng叨i 餫ng l鄊 nhi甿 v� v chuy琻, th呓ng nh鈔 ta kh鬾g th� cung c d竎h v� cho c醕 h� 疬㧟." )
				EndEvent( sceneId )
				DispatchEventList( sceneId, selfId, targetId )
				return
			end
		end
	end

	if IsHaveMission(sceneId,selfId,4021) > 0 then
		BeginEvent( sceneId )
			AddText( sceneId, "  Xin th� l瞚! C醕 h� 餫ng mang trong m靚h nhi甿 v� v chuy琻, th呓ng nh鈔 ta kh鬾g th� cung c d竎h v� cho c醕 h�." )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end

	CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 39, 109, 25)

end

--**********************************
--列举事件
--**********************************
function x400918_OnEnumerate( sceneId, selfId, targetId )
	--等c达到10c就显示传送选项
	if GetLevel( sceneId, selfId ) >= 10 then
		AddNumText(sceneId,x400918_g_ScriptId,x400918_g_MissionName, 9, -1)
	else
		return
	end
end
