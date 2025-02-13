-- created by 左春伟

x400956_g_ScriptId = 400956; --脚本号
x400956_g_name	="车传义";

--传送目标
x400956_g_transfer_target =
{
	[1] = {x = 235, z = 156, scene_num = 1}, 		--T� Ch鈛
	[2] = {x = 246, z = 106, scene_num = 2}, 		--姓i L�
	[3] = {x = 294, z = 90, scene_num = 186}, 	--L鈛 Lan
	[4] = {x = 206, z = 266, scene_num = 34}, 	--Nam H鋓
	[5] = {x = 186, z = 43, scene_num = 28},		--Nam Chi陁
	[6] = {x = 158, z = 113, scene_num = 22}, 	--Tr叨ng B誧h S絥
}

-- 收费金额
x400956_g_transfer_cost = 5000; -- 50银交子

--**********************************
--事件交互入口
--**********************************
function x400956_OnDefaultEvent( sceneId, selfId, targetId )
	x400956_UpdateEventList( sceneId, selfId, targetId );
end

--**********************************
--事件列表
--**********************************
function x400956_UpdateEventList( sceneId, selfId, targetId )
	BeginEvent(sceneId);
		AddText( sceneId, "#{SFCS_80828_01}" );
		AddNumText(sceneId, x400956_g_ScriptId, "T� Ch鈛", 9, 1);
		AddNumText(sceneId, x400956_g_ScriptId, "姓i L�", 9, 2);
		AddNumText(sceneId, x400956_g_ScriptId, "L鈛 Lan", 9, 3);
		AddNumText(sceneId, x400956_g_ScriptId, "Nam H鋓", 9, 4);
		AddNumText(sceneId, x400956_g_ScriptId, "Nam Chi陁", 9, 5);
		AddNumText(sceneId, x400956_g_ScriptId, "Tr叨ng B誧h S絥", 9, 6);
	EndEvent()
	DispatchEventList(sceneId, selfId, targetId);
end

--**********************************
--事件列表选中m祎 项
--**********************************
function x400956_OnEventRequest( sceneId, selfId, targetId, eventId )
	--跑商相关
	if GetItemCount(sceneId, selfId, 40002000)>=1  then
		BeginEvent( sceneId )
			AddText( sceneId, "  Xin th� l瞚 tr阯 ng叨i c醕 h� 餫ng gi� ng鈔 phi猽 ta kh鬾g th� gi鷓 疬㧟." )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end
	--队伍相关
	if GetTeamId(sceneId,selfId)>=0 and 
		IsTeamFollow(sceneId, selfId)==1 and
		LuaFnIsTeamLeader(sceneId,selfId)==1 then
		BeginEvent( sceneId )
			AddText( sceneId, "  Xin l瞚! v� 疬緉g x� qu� xa, n錸g l馽 c黙 ch鷑g t鬷 h課 ch� v� v kh鬾g ch nh 鸬i l鄊 nhi甿 v� v chuy琻 th呓ng nh鈔, vui l騨g 瓞 l読 鸬i th呓ng nh鈔 v� d竎h chuy琻 m祎 m靚h." )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end
	--漕运相关
	if IsHaveMission(sceneId,selfId,4021) > 0 then
		BeginEvent(sceneId)
			AddText(sceneId, "  Xin th� l瞚! C醕 h� 餫ng mang trong m靚h nhi甿 v� v chuy琻, th呓ng nh鈔 ta kh鬾g th� cung c d竎h v� cho c醕 h�.")
		EndEvent()
		DispatchEventList(sceneId, selfId, targetId)
		return
	end
	--
	local id = GetNumText();
	if id >=1 and id <= 6 then
		BeginEvent(sceneId)
			--"本次传送收取50银交子,你要传送吗?"
			AddText(sceneId, "#{FFCS_081210_1}")
			if id == 1 then	
				AddNumText(sceneId, x400956_g_ScriptId, "Duy畉", 0, 11);
			elseif id == 2 then
				AddNumText(sceneId, x400956_g_ScriptId, "Duy畉", 0, 21);
			elseif id == 3 then
				AddNumText(sceneId, x400956_g_ScriptId, "Duy畉", 0, 31);
			elseif id == 4 then
				AddNumText(sceneId, x400956_g_ScriptId, "Duy畉", 0, 41);
			elseif id == 5 then
				AddNumText(sceneId, x400956_g_ScriptId, "Duy畉", 0, 51);
			elseif id == 6 then
				AddNumText(sceneId, x400956_g_ScriptId, "Duy畉", 0, 61);
			end
			AddNumText(sceneId, x400956_g_ScriptId, "H鼀", 0, 100);
		EndEvent()
		DispatchEventList(sceneId, selfId, targetId);
	elseif id == 100 then
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )		
	else
		local index = floor(id/10);
		--L鈛 Lan75c限制
		if index == 3 then
			if GetLevel(sceneId, selfId) < 75 then
				BeginEvent(sceneId)
					AddText(sceneId, "  C 鸬 ch遖 瘘 75 kh鬾g th� d竎h chuy琻")
				EndEvent()
				DispatchEventList(sceneId, selfId, targetId)
				return
			end
			--同骑带小号限制
			if LuaFnGetDRideFlag(sceneId, selfId) == 1 then
				local objId = LuaFnGetDRideTargetID(sceneId, selfId);
				if objId ~= -1 and GetLevel(sceneId, objId) < 75 then
					BeginEvent(sceneId)
						AddText(sceneId, "#{SRCS_090203_1}")
					EndEvent()
					DispatchEventList(sceneId, selfId, targetId)
					return					
				end
			end
		end
		--[tx44121]bug这里没有设置最低c别,导致低c别可通过双骑乘进高c别场景
		local minLevel = 10
		if index == 3 then
			minLevel = 75
		end
		if LuaFnGetDRideFlag(sceneId, selfId) == 1 then
			local objId = LuaFnGetDRideTargetID(sceneId, selfId);
			if objId ~= -1 and GetLevel(sceneId, objId) < minLevel then
				local Tip = format("#{CQTS_90227_1}%d#{CQTS_90227_2}", minLevel)
				x400956_NotifyFailTips( sceneId, selfId, targetId, Tip )
				return					
			end
		end	
		--[/tx44121]	
			
		local pos_x = x400956_g_transfer_target[index]["x"];
		local pos_z = x400956_g_transfer_target[index]["z"];
		local scene_num = x400956_g_transfer_target[index]["scene_num"];
			
		local nMoneyJZ = GetMoneyJZ (sceneId, selfId)
		local nMoney = GetMoney (sceneId, selfId)

		--钱够吗?
		if (nMoneyJZ + nMoney) >= x400956_g_transfer_cost then 
				
			-- 收费
			-- 使用带优先cto� 鸬 金钱消耗函数
			if LuaFnCostMoneyWithPriority (sceneId, selfId, x400956_g_transfer_cost) == -1 then
				BeginEvent(sceneId)
					AddText(sceneId, "Thu l� ph� kh鬾g th鄋h c鬾g");
				EndEvent()
				DispatchMissionTips(sceneId, selfId)
				return
			else
				CallScriptFunction((400900), "TransferFunc",sceneId, selfId, scene_num, pos_x, pos_z, minLevel); 
			end

		-- 钱不够
		else
			BeginEvent(sceneId)
				AddText(sceneId, "Kh鬾g 瘘 ng鈔 l唼ng");
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
			return

		end
	end	
end
--**********************************
-- 屏幕中间信息提示
--**********************************
function x400956_NotifyFailTips( sceneId, selfId, targetId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
