--随身NPC相关功能,目前提供元宝相关to� 鸬 随身操作

x888898_g_scriptId = ALONENPC_SCRIPT_ID

x888898_g_op		= {}
x888898_g_op[1]	=	181003		--随身元宝相关

--**********************************
-- 检查此随身NPCto� 鸬 功能
-- op喧ng请求类别,比如1代表元宝相关to� 鸬 随身操作……
--**********************************
function	x888898_AloneNpcEvent( sceneId, selfId, op )
	if nil == op or 1 > op then return end
	local bCheck = x888898_AloneNpcCheckOp(sceneId,selfId,op);
	
	if x888898_g_op[op] and bCheck > 0 then
		CallScriptFunction( x888898_g_op[op], "OnDefaultEvent", sceneId, selfId, ALONENPC_TARGET_ID )
	end
end

function x888898_AloneNpcCheckOp(sceneId,selfId,op)
	if nil == op or 1 > op then return 0 end
	--地府
	if sceneId == 77 then 
		BroadMsgByChatPipe(sceneId, selfId, "@*;SrvMsg;DBD:Trong 懈a Ph� kh鬾g th� t鵼 ti畁 s� d鴑g c鬾g n錸g", 0);
		return 0
	end
	
	--组队跟随
	local selfHasTeamFlag = LuaFnHasTeam(sceneId, selfId);
	if selfHasTeamFlag and selfHasTeamFlag == 1 then
		local teamFollowFlag = IsTeamFollow(sceneId,selfId);
		local teamLeaderFlag = LuaFnIsTeamLeader(sceneId,selfId);
		if not teamLeaderFlag or not teamFollowFlag then
			return 0
		end
		if teamFollowFlag ~= 0 and teamLeaderFlag ~= 1 then
			return 0
		end
	end
	
	--双人骑乘
	local selfHasDRideFlag = LuaFnGetDRideFlag(sceneId, selfId);
	if selfHasDRideFlag and selfHasDRideFlag == 1 then
		local selfIsDRideMountOwner = LuaFnIsDRideMountOwner(sceneId, selfId);
		if not selfIsDRideMountOwner or selfIsDRideMountOwner ~= 1 then
			--处于双人骑乘状态,且喧ng被动to� 鸬 ,交给主动方来处理
			return 0
		end
	end
	
	--随身元宝商店条件检查
	if op == 1 then
		--15c以上
		local level = GetLevel(sceneId,selfId);
		if nil == level or level < 15 then
			BroadMsgByChatPipe(sceneId, selfId, "@*;SrvMsg;DBD:C鬾g n錸g n鄖 ch� c� th� s� d鴑g khi 鹌ng c c黙 c醕 h� l緉 h絥 ho bg 15 m緄 c� th� s� d鴑g", 0);
			return 0
		end

		return 1
	end
	return 0
end
