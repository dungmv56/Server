--新的元宝商店

x888902_g_scriptId = 888902
--元宝商店列表 要与客户端界面对应
x888902_g_shoplist = {}
x888902_g_shoplist[1]	= {217, 218, 219,222}				--大卖场
x888902_g_shoplist[2]	= {149, 150, 198, 193, 209}			--宝石商城,添加"大理宝石斋--149",czf,2009.07.21
x888902_g_shoplist[3]	= {136, 137, 144, 194, 135, 152, 195, 240}			--珍兽商城
x888902_g_shoplist[4]	= {231, 232, 233, 234, 235, 236, 237, 238}				--南北杂货
x888902_g_shoplist[5]	= {120, 181, 145, 182, 134}			--形象广场
x888902_g_shoplist[6]	= {250,239}				--花舞人间
--x888902_g_shoplist[7]	= {225, 226, 227, 228, 229, 230}						--武功秘籍
x888902_g_shoplist[7]	= {225,146,244}
x888902_g_shoplist[8]	= {156, 157, 158, 159, 160, 161, 162, 163}	--打造图
x888902_g_shoplist[9]	= {149,150, 178, 198, 194, 136}			--我要更强大
x888902_g_shoplist[10]	= {134, 120, 181, 145, 182}			--我要更有魅力
x888902_g_shoplist[11]	= {149,150, 178, 193, 137}			--我要打造极品装备
x888902_g_shoplist[12]	= {194, 135, 152, 195}				--我要打造极品珍兽
x888902_g_shoplist[13]	= {134, 144}					--我要移动的更快
x888902_g_shoplist[14]	= {191, 192, 133, 120, 134}			--我要向别人表白
x888902_g_shoplist[15]	= {146, 135, 152}				--我要学习新技能

x888902_g_shoplist[101]	= {245, 247,251,246, 241,242 ,253 }		--大卖场(新品,热卖，超级神器，时装,坐骑，骑术,武功1，武功2,神兵利器220BOSS卡)
x888902_g_shoplist[102]	= {178,211,210}				--宝石商城
x888902_g_shoplist[103]	= {243}				--珍兽商城
x888902_g_shoplist[104]	= {284}				--南北奇货
x888902_g_shoplist[105]	= {252,223,224}				--我要变强(进阶武功，暗器武魂，打架斗殴，武功秘籍，武功秘籍)
x888902_g_shoplist[106]	= {190, 191, 249,192,133}				--花舞人间

--**********************************
-- 检查此随身NPC的功能
-- op是请求类别，比如1代表元宝相关的随身操作……
--**********************************
function x888902_OpenYuanbaoShop( sceneId, selfId, targetId , shopA ,shopB,param1,param2 )
	if targetId == 1001 and shopA == 1001 then
		x300053_GoldToZD( sceneId, selfId, shopB)
		return
	elseif targetId == 1002 and shopA == 1002 then
		x300053_MRXinFa(sceneId,selfId,shopB,param1,param2)
		return
	end

	local bCheck = x888902_YuanbaoShopCheckOp(sceneId,selfId);
	
	if bCheck > 0 then
		if shopA > 0 and shopA < 200 and x888902_g_shoplist[shopA][shopB] ~= nil then
			--PrintStr(x888902_g_shoplist[shopA][shopB])
			if targetId == -1 then
				DispatchYuanbaoShopItem( sceneId, selfId, x888902_g_shoplist[shopA][shopB])
			else
				DispatchNpcYuanbaoShopItem( sceneId, selfId, targetId , x888902_g_shoplist[shopA][shopB])
			end
		end
	end
end

function x888902_YuanbaoShopCheckOp(sceneId,selfId)
	--地府
	if sceneId == 77 then 
		BroadMsgByChatPipe(sceneId, selfId, "@*;SrvMsg;DBD:地府里不能使用随身功能", 0);
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
			--处于双人骑乘状态，且是被动的，交给主动方来处理
			return 0
		end
	end
	--15级以上
	local level = GetLevel(sceneId,selfId);
	if nil == level or level < 15 then
		BroadMsgByChatPipe(sceneId, selfId, "@*;SrvMsg;DBD:此功能只有当您的等级大于等于15级的时候方可使用", 0);
		return 0
	else

		return 1
	end
	return 0
end
