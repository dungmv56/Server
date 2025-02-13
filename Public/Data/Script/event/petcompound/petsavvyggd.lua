-- 宠物悟性提升

-- 脚本号
x800106_g_ScriptId = 800106

-- NPC 名字
x800106_g_Name = "V鈔 Phi Phi"

	
--**********************************
-- 任务入口函数
--**********************************
function x800106_OnDefaultEvent( sceneId, selfId, targetId )	--点击该任务后执行此脚本

	BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId, 19820425 )
end

--**********************************
-- 列举事件
--**********************************
function x800106_OnEnumerate( sceneId, selfId, targetId )

	AddNumText( sceneId, x800106_g_ScriptId, "N鈔g ng� t韓h v緄 C錸 C痶 衋n" ,6,-1)
end


--**********************************
-- 宠物悟性提升
--**********************************
function x800106_PetSavvy( sceneId, selfId, mainPetGuidH, mainPetGuidL )
	
	
	local moneyCosts = 
	{													-- 索引是珍兽的当前悟性值
		[0] = 100,
		[1] = 110,
		[2] = 121,
		[3] = 133,
		[4] = 146,
		[5] = 161,
		[6] = 177,
		[7] = 194,
		[8] = 214,
		[9] = 235,
	}
	local	succOdds = 
	{													-- 索引是珍兽的当前悟性值
		[0] = 1000,
		[1] = 850,
		[2] = 750,
		[3] = 600,
		[4] = 200,
		[5] = 310,
		[6] = 310,
		[7] = 200,
		[8] = 70,
		[9] = 100,
	}
	
	local	SelfMoney = GetMoney(sceneId, selfId)
	
	local gengu = LuaFnGetPetGenGuByGUID(sceneId, selfId, mainPetGuidH, mainPetGuidL)
	local savvy = GetPetSavvy( sceneId, selfId, mainPetGuidH, mainPetGuidL )
	if savvy == 10 then
		x800106_NotifyTip(sceneId, selfId, "秀 鹫t t痠 餫!" );
		return 0;
	end
	local cost = moneyCosts[savvy];
	local succRate = succOdds[savvy];	
	local rand = random(1000)
	
	--检查 跟骨 丹
	local nSavvyNeed = savvy+1;	
	local nItemIdGenGuDan = 0;
	local msgTemp;
	if nSavvyNeed >= 1 and nSavvyNeed <= 3 then
		msgTemp = "S�";
		nItemIdGenGuDan = 30502000;
	elseif nSavvyNeed >= 4 and nSavvyNeed <= 6 then
		msgTemp = "Trung"
		nItemIdGenGuDan = 30502001;
	elseif nSavvyNeed >= 7 and nSavvyNeed <= 10 then
		msgTemp = "Cao"
		nItemIdGenGuDan = 30502002;
	end
	
	local nYaoDingCount = GetItemCount(sceneId, selfId, nItemIdGenGuDan);
	if nYaoDingCount <= 0 then
		local msg = format("Th錸g ng� t韓h l阯 %d c %s c C錸 c痶 餫n", savvy+1, msgTemp )
		x800106_NotifyTip(sceneId, selfId, msg );
		return 0;
	end
	local	SelfMoney = GetMoney(sceneId, selfId)
	if SelfMoney < cost then 
		return 0;
	end
	
	--删除跟骨 丹
	local bRet = DelItem(sceneId, selfId, nItemIdGenGuDan, 1)
	
	if bRet<=0 then
		local msg = format("H鼀 鹫o c� th b読!");
		x800106_NotifyTip(sceneId, selfId, msg );		
		return 0;
	end
	
	CostMoney(sceneId,selfId,cost)
		
	if rand > succRate then
		
		local nSavvyDown;
		if savvy == 0 then
		nSavvyDown = 0;
		else
		if savvy == 1 then
		nSavvyDown = 1;
		else
		if savvy == 2 then
		nSavvyDown = 2;
		else
		if savvy == 3 then
		nSavvyDown = 2;
		else
		if savvy == 4 then
		nSavvyDown = 0;
		else
		if savvy == 5 then
		nSavvyDown = 1;
		else
		if savvy == 6 then
		nSavvyDown = 2;
		else
		if savvy == 7 then
		nSavvyDown = 0;
		else
		if savvy == 8 then
		nSavvyDown = 1;
		else
		if savvy == 9 then
		nSavvyDown = 2;
		end
		end
		end
		end
		end
		end
		end
		end
		end
		end
		SetPetSavvy( sceneId, selfId, mainPetGuidH, mainPetGuidL, savvy - nSavvyDown );
		
		local msg = format("H䅟 th鄋h th b読, tr呔c m ng� t韓h c黙 tr鈔 th� l� %d", savvy - nSavvyDown );
		x800106_NotifyTip(sceneId, selfId, msg );
		return 0;
	end
	
	SetPetSavvy( sceneId, selfId, mainPetGuidH, mainPetGuidL, nSavvyNeed )
	
	local szPlayerName, szPetTransString;
	
	szPetTransString = GetPetTransString(  sceneId, selfId, mainPetGuidH, mainPetGuidL );
	szPlayerName = GetName( sceneId, selfId );
	
	local msg = format("Th鄋h c鬾g, ng� t韓h tr鈔 th� c黙 c醕 h� +1");
	x800106_NotifyTip(sceneId, selfId, msg );

	if nSavvyNeed >= 4 then
		
		local szMsg;
		--szMsg = format("#W#{_INFOUSR%s}#c00FFFF tr鋓 qua 1 s� c� gg, 疸 gi鷓 cho#{_INFOMSG%s} n鈔g cao ng� t韓h 皙n #Y%d#c00FFFF, t� ch tr鈔 th� 疬㧟 n鈔g cao!",szPlayerName, szPetTransString, nSavvyNeed );
		
		AddGlobalCountNews( sceneId, szMsg );
	
	end
	
	--成功的光效
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0);
		
end


--**********************************
--醒目提示
--**********************************
function x800106_NotifyTip( sceneId, selfId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end
