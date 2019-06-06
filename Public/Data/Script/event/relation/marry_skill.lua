--夫妻技能H鱟 t 

--脚本号
x806016_g_ScriptId		= 806016


--心心相印技能表....
x806016_g_skillList_XXXY = {

	{id=260, name="K� n錸g phu th� c 1", firendPt=1000, lvM=0, lvF=0, exp=0, money=0},
	{id=261, name="K� n錸g phu th� c 2", firendPt=2000, lvM=0, lvF=0, exp=0, money=442},
	{id=262, name="K� n錸g phu th� c 3", firendPt=3000, lvM=0, lvF=0, exp=0, money=967},
	{id=263, name="K� n錸g phu th� c 4", firendPt=4000, lvM=0, lvF=0, exp=0, money=1800},
	{id=264, name="K� n錸g phu th� c 5", firendPt=5000, lvM=0, lvF=0, exp=0, money=3009},
	{id=265, name="K� n錸g phu th� c 6", firendPt=6000, lvM=0, lvF=0, exp=0, money=4660},
	{id=266, name="K� n錸g phu th� c 7", firendPt=7000, lvM=0, lvF=0, exp=0, money=6825},
	{id=267, name="K� n錸g phu th� c 8", firendPt=8000, lvM=0, lvF=0, exp=0, money=13322},
	{id=268, name="K� n錸g phu th� c 9", firendPt=9000, lvM=0, lvF=0, exp=0, money=23449}

};

--邪ng kh� li阯 chi技能表....
x806016_g_skillList_TQLZ = {

	{id=250, name="邪ng kh� li阯 chi (1 c)", firendPt=1000, lvM=35, lvF=20, exp=24739, money=10000},
	{id=251, name="邪ng kh� li阯 chi (2 c)", firendPt=3000, lvM=45, lvF=30, exp=53745, money=40000},
	{id=252, name="邪ng kh� li阯 chi (3 c)", firendPt=5000, lvM=55, lvF=40, exp=116762, money=100000},
	{id=253, name="邪ng kh� li阯 chi (4 c)", firendPt=7000, lvM=65, lvF=50, exp=253665, money=200000},
	{id=254, name="邪ng kh� li阯 chi (5 c)", firendPt=9999, lvM=75, lvF=60, exp=551086, money=500000},

};

--Thi阯 tr叨ng 鸶a c豼 技能表....
x806016_g_skillList_TCDJ = {

	{id=255, name="Thi阯 tr叨ng 鸶a c豼 (1 c)", firendPt=1000, lvM=35, lvF=20, exp=24739, money=10000},
	{id=256, name="Thi阯 tr叨ng 鸶a c豼 (2 c)", firendPt=3000, lvM=45, lvF=30, exp=53745, money=40000},
	{id=257, name="Thi阯 tr叨ng 鸶a c豼 (3 c)", firendPt=5000, lvM=55, lvF=40, exp=116762, money=100000},
	{id=258, name="Thi阯 tr叨ng 鸶a c豼 (4 c)", firendPt=7000, lvM=65, lvF=50, exp=253665, money=200000},
	{id=259, name="Thi阯 tr叨ng 鸶a c豼 (5 c)", firendPt=9999, lvM=75, lvF=60, exp=551086, money=500000},

};

--H靚h 鋘h b li 技能表....
x806016_g_skillList_XYBL = {

	{id=269, name="H靚h 鋘h b li (1 c)", firendPt=1000, lvM=35, lvF=20, exp=24739, money=10000},
	{id=270, name="H靚h 鋘h b li (2 c)", firendPt=3000, lvM=45, lvF=30, exp=53745, money=40000},
	{id=271, name="H靚h 鋘h b li (3 c)", firendPt=5000, lvM=55, lvF=40, exp=116762, money=100000},
	{id=272, name="H靚h 鋘h b li (4 c)", firendPt=7000, lvM=65, lvF=50, exp=253665, money=200000},
	{id=273, name="H靚h 鋘h b li (5 c)", firendPt=9999, lvM=75, lvF=60, exp=551086, money=500000},

};

--H靚h 鋘h b li 1c对应to� 鸬 技能ID
x806016_g_xybl_SkillID = 269
--H鱟 t H靚h 鋘h b li 1cC to� 鸬 物品ID
x806016_g_xybl_ItemID = 30308059

--C 世界公告to� 鸬 技能编号表
x806016_g_MaxMarrySkill_T = {268,253,254,258,259,272,273};

--**********************************
--任务入口函数
--**********************************
function x806016_OnDefaultEvent(sceneId, selfId, targetId)

	local selectEventId	= GetNumText();

	if selectEventId == 0 then
		BeginEvent(sceneId);
			AddNumText(sceneId, x806016_g_ScriptId, "H鱟 t � h䅟 t鈓 馥u", 12, 11);
			AddNumText(sceneId, x806016_g_ScriptId, "H鱟 t 邪ng kh� li阯 chi", 12, 12);
			AddNumText(sceneId, x806016_g_ScriptId, "H鱟 t Thi阯 tr叨ng 鸶a c豼 ", 12, 13);
			AddNumText(sceneId, x806016_g_ScriptId, "H鱟 t H靚h 鋘h b li ", 12, 14);
		EndEvent(sceneId);
		DispatchEventList(sceneId, selfId, targetId);

	elseif selectEventId == 11 then

		local ret, nextLevel, maleId, femaleId = x806016_CheckStudySkill( sceneId, selfId, targetId, x806016_g_skillList_XXXY );
		if ret > 0 then
			local skill = x806016_g_skillList_XXXY[nextLevel+1];
			BeginEvent(sceneId);
				AddText(sceneId, "  � h䅟 t鈓 馥u c� th� gia t錸g th� l馽, k� n錸g c b c鄋g cao gia t錸g th� l馽 c鄋g nhi玼.");
				if skill.money > 0 then
					AddText(sceneId, "  Nh� trai c t痭 #{_EXCHG"..skill.money.."} h鱟 t "..skill.name..".");
				end
				if nextLevel > 0 then
					AddNumText(sceneId, x806016_g_ScriptId, "K� n錸g th錸g c", 12, 21);
				else
					AddNumText(sceneId, x806016_g_ScriptId, "L t裞 h鱟 t", 12, 21);
				end
			EndEvent(sceneId);
			DispatchEventList(sceneId, selfId, targetId);
		end

	elseif selectEventId == 12 then

		local ret, nextLevel, maleId, femaleId = x806016_CheckStudySkill( sceneId, selfId, targetId, x806016_g_skillList_TQLZ );
		if ret > 0 then
			local skill = x806016_g_skillList_TQLZ[nextLevel+1];
			BeginEvent(sceneId);
				AddText(sceneId, "  邪ng kh� li阯 chi c� th� kh鬷 ph鴆 huy猼, k� n錸g c b c鄋g cao, kh鬷 ph鴆  huy猼 c鄋g nhi玼.");
				AddText(sceneId, "  H鱟 t "..skill.name.." Nh� trai c t痭 "..skill.exp.." Kinh nghi甿 c鵱g #{_EXCHG"..skill.money.."}.");
				AddText(sceneId, "  邪ng th秈 c v� ch皀g h鋙 h鎢 鸬 鹫t t緄#G"..skill.firendPt.."#W, nh� trai c b 鹫t t緄 "..skill.lvM.."c, nh� g醝 c b 鹫t t緄 "..skill.lvF.."c.");
				if nextLevel > 0 then
					AddNumText(sceneId, x806016_g_ScriptId, "K� n錸g th錸g c", 12, 22);
				else
					AddNumText(sceneId, x806016_g_ScriptId, "L t裞 h鱟 t", 12, 22);
				end
			EndEvent(sceneId);
			DispatchEventList(sceneId, selfId, targetId);
		end

	elseif selectEventId == 13 then

		local ret, nextLevel, maleId, femaleId = x806016_CheckStudySkill( sceneId, selfId, targetId, x806016_g_skillList_TCDJ );
		if ret > 0 then
			local skill = x806016_g_skillList_TCDJ[nextLevel+1];
			BeginEvent(sceneId);
				AddText(sceneId, "  Thi阯 tr叨ng 鸶a c豼 c� h癷 sinh l読 ph痠 ng鐄 c鹡g h癷 ph鴆 nh 鸶nh t� l� huy猼 kh�, k� n錸g c b c鄋g cao, th秈 gian ph鴆 h癷 c鄋g 韙.");
				AddText(sceneId, "  H鱟 t "..skill.name.." Nh� trai c t痭 "..skill.exp.."Kinh nghi甿 c鵱g #{_EXCHG"..skill.money.."}.");
				AddText(sceneId, "  邪ng th秈 c v� ch皀g h鋙 h鎢 鸬 鹫t t緄#G"..skill.firendPt.."#W, nh� trai c b 鹫t t緄 "..skill.lvM.."c, nh� g醝 c b 鹫t t緄 "..skill.lvF.."c.");
				if nextLevel > 0 then
					AddNumText(sceneId, x806016_g_ScriptId, "K� n錸g th錸g c", 12, 23);
				else
					AddNumText(sceneId, x806016_g_ScriptId, "L t裞 h鱟 t", 12, 23);
				end
			EndEvent(sceneId);
			DispatchEventList(sceneId, selfId, targetId);
		end

	elseif selectEventId == 14 then

		local ret, nextLevel, maleId, femaleId = x806016_CheckStudySkill( sceneId, selfId, targetId, x806016_g_skillList_XYBL );
		if ret > 0 then
			local skill = x806016_g_skillList_XYBL[nextLevel+1];
			BeginEvent(sceneId);
				AddText(sceneId, "  H靚h 鋘h b li c� th� trong nh醳 m di chuy琻 皙n v� tr� v� ch皀g, k� n錸g c b c鄋g cao, th秈 gian c鄋g h癷 ph鴆 韙.");
				if skill.id == x806016_g_xybl_SkillID then
					AddText(sceneId, "  H鱟 t "..skill.name.."nh� trai c c� #G#{_ITEM"..tostring(x806016_g_xybl_ItemID).."}#W.");
				else
					AddText(sceneId, "  H鱟 t "..skill.name.." Nh� trai c t痭 "..skill.exp.."Kinh nghi甿 c鵱g #{_EXCHG"..skill.money.."}.");
				end
				AddText(sceneId, "  邪ng th秈 c v� ch皀g h鋙 h鎢 鸬 鹫t t緄#G"..skill.firendPt.."#W, nh� trai c b 鹫t t緄 "..skill.lvM.."c, nh� g醝 c b 鹫t t緄 "..skill.lvF.."c.");
				if nextLevel > 0 then
					AddNumText(sceneId, x806016_g_ScriptId, "K� n錸g th錸g c", 12, 24);
				else
					AddNumText(sceneId, x806016_g_ScriptId, "L t裞 h鱟 t", 12, 24);
				end
			EndEvent(sceneId);
			DispatchEventList(sceneId, selfId, targetId);
		end

	elseif selectEventId == 21 then

		x806016_StudySkill(sceneId, selfId, targetId, x806016_g_skillList_XXXY)

	elseif selectEventId == 22 then

		x806016_StudySkill(sceneId, selfId, targetId, x806016_g_skillList_TQLZ)

	elseif selectEventId == 23 then

		x806016_StudySkill(sceneId, selfId, targetId, x806016_g_skillList_TCDJ)

	elseif selectEventId == 24 then

		x806016_StudySkill(sceneId, selfId, targetId, x806016_g_skillList_XYBL)

	end

end

--**********************************
--列举事件
--**********************************
function x806016_OnEnumerate(sceneId, selfId, targetId)
	local isMarried = LuaFnIsMarried(sceneId, selfId);
	if isMarried and isMarried > 0 then
		AddNumText(sceneId, x806016_g_ScriptId, "K� n錸g h鱟 l鄊 phu th�", 12, 0);
	end
end

--**********************************
--检测喧ng否可以H鱟 t 某项夫妻技能....
--**********************************
function x806016_CheckStudySkill( sceneId, selfId, targetId, SkillList )

	--前提条件
	local szMsg = "N猽 mu痭 h鱟 k� n錸g phu th�, m秈 2 b阯 nh� trai v� nh� g醝 c鵱g h鱬 th鄋h m祎 nh髆 r癷 t緄 t靘 ta"
	if LuaFnHasTeam(sceneId, selfId) == 0 then
		x806016_MessageBox(sceneId, selfId, targetId, szMsg);
		return 0;
	end
	
	szMsg = "Nh髆 ch� c� th� do hai b阯 phu th� l th鄋h, trong nh髆 kh鬾g th� c� th鄋h vi阯 kh醕"
	if LuaFnGetTeamSize(sceneId, selfId) ~= 2 then
		x806016_MessageBox(sceneId, selfId, targetId, szMsg);
		return 0;
	end

	szMsg = "Ch� c� 2 ng叨i 皤u 皙n b阯 ta m緄 c� th� h鱟 k� n錸g n鄖"
	local nearNum = GetNearTeamCount(sceneId, selfId);
	if nearNum ~= 2 then
		x806016_MessageBox(sceneId, selfId, targetId, szMsg);
		return 0;
	end

	szMsg = "Kh鬾g ph鋓 l� phu th�, kh鬾g th� h鱟 k� n錸g phu th�."
	local maleId = -1;
	local femaleId = -1;
	for nearIndex = 0, nearNum - 1 do
		local memId = GetNearTeamMember(sceneId, selfId, nearIndex);
		local sexType = LuaFnGetSex(sceneId, memId);
		if sexType == 1 then
			maleId = memId;
		else
			femaleId = memId;
		end
	end
	
	if maleId == -1 or femaleId == -1 then
		x806016_MessageBox(sceneId, selfId, targetId, szMsg);
		return 0;
	end
	
	local isSpouses = LuaFnIsSpouses(sceneId, maleId, femaleId);
	if isSpouses and isSpouses > 0 then
	else
		x806016_MessageBox(sceneId, selfId, targetId, szMsg);
		return 0;
	end

	szMsg = "N礽 b� b� l瞚, file kh鬾g th� th馽 hi畁 b靚h th叨ng."
	if LuaFnIsCanDoScriptLogic(sceneId, maleId) ~= 1 then
		return 0;
	end
	if LuaFnIsCanDoScriptLogic(sceneId, femaleId) ~= 1 then
		return 0;
	end
	
	szMsg = "Hai b阯 b bu礳 ph鋓 tr� th鄋h b課 h鎢 m緄 c� 疬㧟 k� n錸g phu th�."
	local maleIsFirend, femaleIsFirend;
	maleIsFirend = LuaFnIsFriend(sceneId, maleId, femaleId);
	femaleIsFirend = LuaFnIsFriend(sceneId, femaleId, maleId);
	if maleIsFirend and maleIsFirend == 1 and femaleIsFirend and femaleIsFirend == 1 then
	else
		x806016_MessageBox(sceneId, selfId, targetId, szMsg);
		return 0;
	end

	local maleSkillLevel, femaleSkillLevel;
	maleSkillLevel = -1;
	femaleSkillLevel = -1;

	local skill, skillLevel;
	skillLevel = 0;
	--检查玩家to� 鸬 夫妻技能已经学到几c
	for _, skill in SkillList do
		local maleHaveSkill = HaveSkill(sceneId, maleId, skill.id);
		if maleHaveSkill and maleHaveSkill > 0 then
			maleSkillLevel = skillLevel;
		end
		
		local femaleHaveSkill = HaveSkill(sceneId, femaleId, skill.id);
		if femaleHaveSkill and femaleHaveSkill > 0 then
			femaleSkillLevel = skillLevel;
		end
		skillLevel  =skillLevel + 1;
	end
	
	local maxSkillLevel = skillLevel - 1;
	
	szMsg = "C醕 ng呓i 疸 h鱟 xong t c� k� n錸g phu th�."
	if maleSkillLevel >= maxSkillLevel then
		x806016_MessageBox(sceneId, selfId, targetId, szMsg);
		return 0;
	end

	nextLevel = femaleSkillLevel+1;

	return 1, nextLevel, maleId, femaleId;

end

--**********************************
--L t裞 h鱟 t
--**********************************
function x806016_StudySkill(sceneId, selfId, targetId, SkillList)

	--检测基本条件....
	local ret, nextLevel, maleId, femaleId = x806016_CheckStudySkill( sceneId, selfId, targetId, SkillList );
	if ret == 0 then
		return
	end

	local skill = SkillList[nextLevel+1];

	szMsg = "械 h鎢 h鋙 c黙 hai b阯 c 鹫t t緄 %d, m緄 c� th� h鱟 疬㧟 1 k� n錸g phu th�."
	local maleFirendPt, femaleFirendPt, needFirendPt;
	maleFirendPt =  LuaFnGetFriendPoint(sceneId, maleId, femaleId);
	femaleFirendPt =  LuaFnGetFriendPoint(sceneId, femaleId, maleId);
	needFirendPt = skill.firendPt;
	if maleFirendPt >= needFirendPt and femaleFirendPt >= needFirendPt then
	else
		szMsg = format(szMsg, needFirendPt);
		x806016_MessageBox(sceneId, selfId, targetId, szMsg);
		return
	end

	szMsg = "Nh� trai c b ph鋓 鹫t t緄 %d m緄 c� th� h鱟 疬㧟 ti猵 theo h課g k� n錸g phu th�."
	if GetLevel( sceneId, maleId ) < skill.lvM then
		szMsg = format(szMsg, skill.lvM);
		x806016_MessageBox(sceneId, selfId, targetId, szMsg);
		return
	end

	szMsg = "Nh� g醝 c b ph鋓 鹫t t緄 %d m緄 c� th� h鱟 疬㧟 ti猵 theo h課g k� n錸g phu th�."
	if GetLevel( sceneId, femaleId ) < skill.lvF then
		szMsg = format(szMsg, skill.lvF);
		x806016_MessageBox(sceneId, selfId, targetId, szMsg);
		return
	end
	
	if skill.id == x806016_g_xybl_SkillID then
		if HaveItemInBag(sceneId,maleId,x806016_g_xybl_ItemID)<0 then
			x806016_MessageBox(sceneId, selfId, targetId, "Nh� trai c c� #G#{_ITEM"..tostring(x806016_g_xybl_ItemID).."}#W T鄆 n錸g h鱟 t n阯 k� n錸g!");
			return
		end
		if LuaFnGetAvailableItemCount(sceneId,maleId,x806016_g_xybl_ItemID)<=0 then
			x806016_MessageBox(sceneId, selfId, targetId, "V ph c thi猼 #G#{_ITEM"..tostring(x806016_g_xybl_ItemID).."}#W秀 b� kh骯, th飊h gi鋓 kh骯 xong h鱟 l読!");
			return
		end
		--扣除物品
		LuaFnDelAvailableItem(sceneId,maleId,x806016_g_xybl_ItemID,1)
	else
		szMsg = "Nh� trai kinh nghi甿 ph鋓 鹫t t緄 %d m緄 c� th� h鱟 疬㧟 ti猵 theo h課g k� n錸g phu th�."
		if GetExp(sceneId, maleId) < skill.exp then
			szMsg = format(szMsg, skill.exp);
			x806016_MessageBox(sceneId, selfId, targetId, szMsg);
			return
		end
	
		szMsg = "Nh� trai c mang theo #{_EXCHG%d} m緄 c� th� h鱟 t k� n錸g."
		local maleMoney, needMoney;
		maleMoney = LuaFnGetMoney(sceneId, maleId);
		needMoney = skill.money;
		
		if maleMoney and maleMoney+GetMoneyJZ(sceneId, maleId) >= needMoney then
		else
			szMsg = format(szMsg, needMoney);
			x806016_MessageBox(sceneId, selfId, targetId, szMsg);
			return
		end
	
		--扣除男方身上金钱....
		LuaFnCostMoneyWithPriority(sceneId, maleId, needMoney);
		
		--扣除男方身Kinh nghi甿....
		if skill.exp > 0 then
			LuaFnAddExp( sceneId, maleId, -skill.exp );
		end
	end

	--增加m祎 c醝夫妻技能给双方
	x806016_MyAddSkill(sceneId, maleId, SkillList, nextLevel);
	x806016_MyAddSkill( sceneId, femaleId, SkillList, nextLevel);
	x806016_SendWorldMsg(sceneId,maleId,femaleId,SkillList, nextLevel)
	--添加统计信息
	x806016_LogCoupleAction(sceneId,maleId,femaleId,SkillList, nextLevel)
	
	--成功H鱟 t 后关闭对话窗口....
	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)
	
	return

end

--**********************************
--添加m祎 项夫妻技能
--**********************************
function x806016_MyAddSkill(sceneId, selfId, SkillList, nextLevel)

	--删除夫妻技能
	local tempSkill;
	for _, tempSkill in SkillList do
		local haveSkill = HaveSkill(sceneId, selfId, tempSkill.id);
		if haveSkill and haveSkill > 0 then
			DelSkill(sceneId, selfId, tempSkill.id);
		end
	end

	local skill = SkillList[nextLevel+1];

	AddSkill(sceneId, selfId, skill.id);
	--Msg2Player( sceneId, selfId, "你学会了"..skill.name..".", MSG2PLAYER_PARA )
	
	--BeginEvent(sceneId)
		--AddText(sceneId, "你学会了"..skill.name..".");
	--EndEvent(sceneId)
	--DispatchMissionTips(sceneId,selfId)
	
	if skill.id == x806016_g_xybl_SkillID then
		x806016_SendSkillMsg_XYBL(sceneId,selfId,skill.name)
	else
		x806016_SendSkillMsg(sceneId,selfId,skill.exp,skill.money,skill.name)
	end
end

--**********************************
--对话窗口信息提示
--**********************************
function x806016_MessageBox(sceneId, selfId, targetId, msg)
	BeginEvent(sceneId);
		AddText(sceneId, msg);
	EndEvent(sceneId);
	DispatchEventList(sceneId, selfId, targetId);
end

--H鱟 t H靚h 鋘h b li 1c时to� 鸬 提示信息
function x806016_SendSkillMsg_XYBL(sceneId,selfId,skname)
	if skname then
		local str = format("#IQu� v� ch皀g 鸢ng t鈓 hi畃 l馽, b鄆 tr� mu鬾 v鄋 kh� kh錸, � nh� trai hao ph� #Y#{_ITEM"..tostring(x806016_g_xybl_ItemID).."}#Ir痶 c鴆 h鱟 xong k� n錸g phu th�#Y%s.",skname)
		BeginEvent(sceneId)
			AddText(sceneId, str);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	end
end

--H� th痭g提示信息
function x806016_SendSkillMsg(sceneId,selfId,exp,money,skname)
	if exp and money and skname then
		local moneyt = format("#{_EXCHG%d}",money)
		local str = format("#IQu� v� ch皀g 鸢ng t鈓 hi畃 l馽, b鄆 tr� mu鬾 v鄋 kh� kh錸, � nh� trai hao ph�  #Y%d kinh nghi甿 c鵱g %s ti玭 t鄆 #Ir痶 c鴆 h鱟 xong k� n錸g phu th� #Y%s.",exp,moneyt,skname)
		BeginEvent(sceneId)
			AddText(sceneId, str);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	end
end

--世界提示信息
function x806016_SendWorldMsg(sceneId,maleId,femaleId,SkillList, nextLevel)
	local skill = SkillList[nextLevel+1]
	
	if maleId and femaleId and skill then
		for _, tempId in x806016_g_MaxMarrySkill_T do
			if tempId == skill.id then
					local uname = format("#{_INFOUSR%s}",GetName(sceneId,maleId))
					local oname = format("#{_INFOUSR%s}",GetName(sceneId,femaleId))
					local str = format("#W%s#I c鵱g #W%s#I v� ch皀g 鸢ng t鈓, r痶 c鴆 kh� t鏽 cam lai, h鱟 xong #cff66cc%s#I, kh鬾g h� l� s� h鎢 v� ch皀g  m鐄.",uname,oname,skill.name)
					BroadMsgByChatPipe(sceneId, maleId, str, 4)
				return
			end -- end if tempId
		end -- end for
	end -- end if maleId
	
end

--统计信息
function x806016_LogCoupleAction(sceneId,tid1,tid2,SkillList,nextLevel)
	local skill = SkillList[nextLevel+1]
	local logid = COUPLE_LOG_LEVELUPSKILL
	if nextLevel == 0 then logid = COUPLE_LOG_LEARNSKILL end
	
	if skill and logid and COUPLE_LOG_DETAIL[logid] then
		--CPL:编号,� 餴琺�,GUID1,GUID2,技能ID,技能名称,时间
		local logstr = format("CPL:%d,%s,0x%X,0x%X,%d,%s",
									 				logid,
									 				COUPLE_LOG_DETAIL[logid],
									 				LuaFnGetGUID(sceneId,tid1),
									 				LuaFnGetGUID(sceneId,tid2),
									 				skill.id,
									 				skill.name)
		LogCouple(logstr)
	end
end
