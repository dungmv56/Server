--参加婚礼

x250038_g_ScriptId = 250038;

x250038_g_eventId_updateJoinList = -1;				-- 刷新能加入to� 鸬 列表(要保证此值不会与玩家to� 鸬 GUID相同)

x250038_g_invitationDataId_level1  = 30303100;		-- 普通请帖ID
x250038_g_invitationDataId_level2  = 30303101;		-- 高c请帖ID
x250038_g_invitationDataId_level3  = 30303102;		-- 豪华请帖ID

--**********************************
--任务入口函数
--**********************************
function x250038_OnDefaultEvent(sceneId, selfId, targetId)	-- 餴琺击该任务后执行此脚本
	local selectEventId = GetNumText();
	if selectEventId then
		if selectEventId == x250038_g_eventId_updateJoinList then
			x250038_OnUpdateJoinList(sceneId, selfId, targetId);
		else
			local creatorGUID = GetNumText();
			x250038_OnJoin(sceneId, selfId, targetId, creatorGUID);
		end
	end
end

--**********************************
--列举事件
--**********************************
function x250038_OnEnumerate(sceneId, selfId, targetId)
	AddNumText(sceneId, x250038_g_ScriptId, "Tham d� h鬾 l�", 6, x250038_g_eventId_updateJoinList);
end

--**********************************
--刷新可能参加to� 鸬 婚礼列表
--**********************************
function x250038_OnUpdateJoinList(sceneId, selfId, targetId)
	BeginEvent(sceneId);
		local addText = 0;
		
		local selfGUID = LuaFnGetGUID(sceneId, selfId);
		local destSceneId = FindCopySceneIDByCopySceneParams(sceneId, FUBEN_WEDDING, 1, 6, selfGUID);
		if destSceneId and destSceneId >= 0 then
		else
			destSceneId = FindCopySceneIDByCopySceneParams(sceneId, FUBEN_WEDDING, 1, 7, selfGUID);
		end
		
		local creatorNum = 0;
		local creatorList = {};
		if destSceneId and destSceneId ~= -1 then
			if addText == 0 then
				AddText(sceneId, "H銀 l馻 ch鱪 h鬾 l� m� c醕 h� mu痭 tham d�!");
				addText = 1;
			end
			creatorList[creatorNum + 1] = selfGUID;
			creatorNum = creatorNum + 1;
			AddNumText(sceneId, x250038_g_ScriptId, "H銀 瓞 ta quay v� ph� b鋘 h鬾 l� c黙 ta", 9, selfGUID);
		end
		
		local itemIdList = {x250038_g_invitationDataId_level3, x250038_g_invitationDataId_level2, x250038_g_invitationDataId_level1};
		local itemId;
		local itemPos;
		for _, itemId in itemIdList do
			local i, maxCount;
			maxCount = 100;
			itemPos = 0;
			for i = 0, maxCount - 1 do
				itemPos = LuaFnGetItemPosByItemDataID(sceneId, selfId, itemId, itemPos);
				if itemPos and itemPos > -1 then
					local ret, creatorName = LuaFnGetItemCreator(sceneId, selfId, itemPos);
					if ret and creatorName and ret == 1 then
						local creatorGUID = GetBagItemParam(sceneId, selfId, itemPos, 0, 2);
						if addText == 0 then
							AddText(sceneId, "H銀 l馻 ch鱪 h鬾 l� m� c醕 h� mu痭 tham d�!");
							addText = 1;
						end
						
						local findGUID, bFind;
						bFind = 0;
						for _, findGUID in creatorList do
							if findGUID == creatorGUID then
								bFind = 1;
								break;
							end
						end
						
						if bFind == 0 then
							creatorList[creatorNum + 1] = creatorGUID;
							creatorNum = creatorNum + 1;
							AddNumText(sceneId, x250038_g_ScriptId, "Tham gia "..creatorName.." h鬾 l�", 8, creatorGUID);
						end
					end
					itemPos = itemPos + 1;
				else
					break;
				end
			end
		end
		if addText == 0 then
			AddText(sceneId, "Tr阯 ng叨i c醕 h� kh鬾g c� thi畃 m秈 疳m c呔i, kh鬾g th� nh ti甤");
		end
	EndEvent(sceneId);
	DispatchEventList(sceneId, selfId, targetId);
end

--**********************************
-- 餴琺击参加婚礼to� 鸬 事件
--**********************************
function x250038_OnJoin(sceneId, selfId, targetId, creatorGUID)
	CallScriptFunction(401030, "PlayerEnter", sceneId, selfId, targetId, creatorGUID);
end

--**********************************
--对话窗口信息提示
--**********************************
function x250038_MessageBox(sceneId, selfId, targetId, msg)
	BeginEvent(sceneId);
		AddText(sceneId, msg);
	EndEvent(sceneId);
	DispatchEventList(sceneId, selfId, targetId);
end
