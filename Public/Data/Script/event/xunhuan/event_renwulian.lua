--连环任务

--MisDescBegin
--脚本号
x229022_g_scriptId = 229022

--前提任务
--g_MissionIdPre =

--M鴆 ti陁 nhi甿 v鴑pc[94,177]
x229022_g_Name	= "V呓ng phu nh鈔"

--任务号
x229022_g_MissionId = 1202

--任务归类
x229022_g_MissionKind = 1

--衅ng c nhi甿 v� 
x229022_g_MissionLevel = 10000

--喧ng否喧ngTinh英任务
x229022_g_IfMissionElite = 0

--下面几项喧ng动态显示to� 鸬 内容,用于T読 任务列表中动态显示任务情况**********************
--任务喧ng否已经完成
x229022_g_IsMissionOkFail = 0		--变量to� 鸬 第0位

--以上喧ng动态**************************************************************

--任务变量第m祎 位用来存储随机 餴琺到to� 鸬 脚本号

--任务文本描述
x229022_g_MissionName="Nhi甿 v� li阯 ho鄋"
x229022_g_MissionInfo=""  --任务描述
x229022_g_MissionTarget = "%f"
x229022_g_ContinueInfo="L鄊 t痶 l"		--未Ho鄋 t nhi甿 v鴗o� 鸬 npc对话
x229022_g_MissionComplete="�, ta bi猼 r癷, ng呓i l鄊 t痶 l"					--Ho鄋 t nhi甿 v鴑pc说话to� 鸬 话

--用来保存字符串格式化to� 鸬 数据
x229022_g_FormatList = {
								"T靘 疬㧟%n",
								"衑m%i tg cho %n",
								"衑m #Y%p #Wtg cho %n",
								"D誽 b鋙 %n",
								}

--只喧ng为客户端显示MissionTarget而做, 所有to� 鸬 动态to� 鸬 字符串都需注册到该List表中
x229022_g_StrList = {
						 "huynh  ",
						 "mu礽  ",
						 }

--格式字符串中对应于g_StringList中字符串to� 鸬 索引, 表示从4开始,后多少位视SetMissionByIndexEx(...)to� 鸬 多少而定
x229022_g_StrForePart=4

--动态item编号T読 missionparam存储to� 鸬 起始位置
x229022_g_ItemForePart=6

x229022_g_MissionRound	= 35		--记录循环任务变量

x229022_g_MissionLimitTime = 1800000

x229022_g_StopWatch_Pause_Flag = 57

x229022_g_NpcIdIndicator={{key=1,npcIdIndex=5},{key=2,npcIdIndex=6},{key=3,npcIdIndex=5},{key=5,npcIdIndex=6}}


--MisDescEnd

x229022_g_SubMissionType = {wenhou=1, suoqu=2, fubenjiaoxun=3, fubenduowu=4, chongwu=5}

x229022_g_GoodBadDescTable = {
									{key=1, str="D鵱g tr� gi� thi畁 醕 鸨i v ph c黙 nhi甿 v� li阯 ho鄋"},
									{key=2, str="L遳 l読 s� v騨g hi畁 c�"},
									{key=3, str="Ti猵 t鴆nhi甿 v� li阯 ho鄋 l tr呔c"},
								}


x229022_g_RenwulianPet_Index = 0
x229022_g_RenwulianItem_Index = 21
x229022_g_RenwulianItem50_Index = 21
x229022_g_RenwulianItem100_Index = 42
x229022_g_RenwulianNpc_Index = 6
x229022_g_RenwulianFunbenNpc_Index = 11

--等c	Kinh nghi甿基数修正
x229022_g_ExpBonusBaseTable = {
												{ playerLevel=40, baseExp=3872 },
												{ playerLevel=41, baseExp=3960 },
												{ playerLevel=42, baseExp=4048 },
												{ playerLevel=43, baseExp=4136 },
												{ playerLevel=44, baseExp=4224 },
												{ playerLevel=45, baseExp=4312 },
												{ playerLevel=46, baseExp=4400 },
												{ playerLevel=47, baseExp=4488 },
												{ playerLevel=48, baseExp=4576 },
												{ playerLevel=49, baseExp=4664 },
												{ playerLevel=50, baseExp=4752 },
												{ playerLevel=51, baseExp=4840 },
												{ playerLevel=52, baseExp=4928 },
												{ playerLevel=53, baseExp=5016 },
												{ playerLevel=54, baseExp=5104 },
												{ playerLevel=55, baseExp=5192 },
												{ playerLevel=56, baseExp=5280 },
												{ playerLevel=57, baseExp=5368 },
												{ playerLevel=58, baseExp=5456 },
												{ playerLevel=59, baseExp=5544 },
												{ playerLevel=60, baseExp=5632 },
												{ playerLevel=61, baseExp=5720 },
												{ playerLevel=62, baseExp=5808 },
												{ playerLevel=63, baseExp=5896 },
												{ playerLevel=64, baseExp=5984 },
												{ playerLevel=65, baseExp=6072 },
												{ playerLevel=66, baseExp=6160 },
												{ playerLevel=67, baseExp=6248 },
												{ playerLevel=68, baseExp=6336 },
												{ playerLevel=69, baseExp=6424 },
												{ playerLevel=70, baseExp=6512 },
												{ playerLevel=71, baseExp=6600 },
												{ playerLevel=72, baseExp=6688 },
												{ playerLevel=73, baseExp=6776 },
												{ playerLevel=74, baseExp=6864 },
												{ playerLevel=75, baseExp=6952 },
												{ playerLevel=76, baseExp=7040 },
												{ playerLevel=77, baseExp=7128 },
												{ playerLevel=78, baseExp=7216 },
												{ playerLevel=79, baseExp=7304 },
												{ playerLevel=80, baseExp=7392 },
												{ playerLevel=81, baseExp=7480 },
												{ playerLevel=82, baseExp=7568 },
												{ playerLevel=83, baseExp=7656 },
												{ playerLevel=84, baseExp=7744 },
												{ playerLevel=85, baseExp=7832 },
												{ playerLevel=86, baseExp=7920 },
												{ playerLevel=87, baseExp=8008 },
												{ playerLevel=88, baseExp=8096 },
												{ playerLevel=89, baseExp=8184 },
												{ playerLevel=90, baseExp=8272 },
												{ playerLevel=91, baseExp=8360 },
												{ playerLevel=92, baseExp=8448 },
												{ playerLevel=93, baseExp=8536 },
												{ playerLevel=94, baseExp=8624 },
												{ playerLevel=95, baseExp=8712 },
												{ playerLevel=96, baseExp=8800 },
												{ playerLevel=97, baseExp=8888 },
												{ playerLevel=98, baseExp=8976 },
												{ playerLevel=99, baseExp=9064 },
												{ playerLevel=100, baseExp=9152 },
												{ playerLevel=101, baseExp=9328 },
												{ playerLevel=102, baseExp=9152 },
												{ playerLevel=103, baseExp=9416 },
												{ playerLevel=104, baseExp=9504 },
												{ playerLevel=105, baseExp=9592 },
												{ playerLevel=106, baseExp=9680 },
												{ playerLevel=107, baseExp=9768 },
												{ playerLevel=108, baseExp=9856 },
												{ playerLevel=109, baseExp=9944 },
												{ playerLevel=110, baseExp=10032 },
												{ playerLevel=111, baseExp=10120 },
												{ playerLevel=112, baseExp=10208 },
												{ playerLevel=113, baseExp=10296 },
												{ playerLevel=114, baseExp=10384 },
												{ playerLevel=115, baseExp=10472 },
												{ playerLevel=116, baseExp=10560 },
												{ playerLevel=117, baseExp=10648 },
												{ playerLevel=118, baseExp=10736 },
												{ playerLevel=119, baseExp=10824 },
												{ playerLevel=120, baseExp=10912 },
									}


--环数加成: 
x229022_g_RoundRefixTable = {
												{ round=1,	refix=1.000  },
												{ round=2,	refix=1.051  },
												{ round=3,	refix=1.101  },
												{ round=4,	refix=1.152  },
												{ round=5,	refix=1.202  },
												{ round=6,	refix=1.253  },
												{ round=7,	refix=1.303  },
												{ round=8,	refix=1.354  },
												{ round=9,	refix=1.404  },
												{ round=10,	refix=1.455  },
												{ round=11,	refix=1.055  },
												{ round=12,	refix=1.156  },
												{ round=13,	refix=1.256  },
												{ round=14,	refix=1.357  },
												{ round=15,	refix=1.457  },
												{ round=16,	refix=1.558  },
												{ round=17,	refix=1.658  },
												{ round=18,	refix=1.759  },
												{ round=19,	refix=1.859  },
												{ round=20,	refix=1.960  },
												{ round=21,	refix=1.110  },
												{ round=22,	refix=1.261  },
												{ round=23,	refix=1.411  },
												{ round=24,	refix=1.562  },
												{ round=25,	refix=1.712  },
												{ round=26,	refix=1.863  },
												{ round=27,	refix=2.013  },
												{ round=28,	refix=2.164  },
												{ round=29,	refix=2.314  },
												{ round=30,	refix=2.465  },
												{ round=31,	refix=1.165  },
												{ round=32,	refix=1.366  },
												{ round=33,	refix=1.566  },
												{ round=34,	refix=1.767  },
												{ round=35,	refix=1.967  },
												{ round=36,	refix=2.168  },
												{ round=37,	refix=2.368  },
												{ round=38,	refix=2.569  },
												{ round=39,	refix=2.769  },
												{ round=40,	refix=2.970  },
												{ round=41,	refix=1.220  },
												{ round=42,	refix=1.471  },
												{ round=43,	refix=1.721  },
												{ round=44,	refix=1.972  },
												{ round=45,	refix=2.222  },
												{ round=46,	refix=2.473  },
												{ round=47,	refix=2.723  },
												{ round=48,	refix=2.974  },
												{ round=49,	refix=3.224  },
												{ round=50,	refix=3.475  },
												{ round=51,	refix=1.275  },
												{ round=52,	refix=1.576  },
												{ round=53,	refix=1.876  },
												{ round=54,	refix=2.177  },
												{ round=55,	refix=2.477  },
												{ round=56,	refix=2.778  },
												{ round=57,	refix=3.078  },
												{ round=58,	refix=3.379  },
												{ round=59,	refix=3.679  },
												{ round=60,	refix=3.980  },
												{ round=61,	refix=1.330  },
												{ round=62,	refix=1.681  },
												{ round=63,	refix=2.031  },
												{ round=64,	refix=2.382  },
												{ round=65,	refix=2.732  },
												{ round=66,	refix=3.083  },
												{ round=67,	refix=3.433  },
												{ round=68,	refix=3.784  },
												{ round=69,	refix=4.134  },
												{ round=70,	refix=4.485  },
												{ round=71,	refix=1.385  },
												{ round=72,	refix=1.786  },
												{ round=73,	refix=2.186  },
												{ round=74,	refix=2.587  },
												{ round=75,	refix=2.987  },
												{ round=76,	refix=3.388  },
												{ round=77,	refix=3.788  },
												{ round=78,	refix=4.189  },
												{ round=79,	refix=4.589  },
												{ round=80,	refix=4.990  },
												{ round=81,	refix=1.440  },
												{ round=82,	refix=1.891  },
												{ round=83,	refix=2.341  },
												{ round=84,	refix=2.792  },
												{ round=85,	refix=3.242  },
												{ round=86,	refix=3.693  },
												{ round=87,	refix=4.143  },
												{ round=88,	refix=4.594  },
												{ round=89,	refix=5.044  },
												{ round=90,	refix=5.495  },
												{ round=91,	refix=1.495  },
												{ round=92,	refix=1.996  },
												{ round=93,	refix=2.496  },
												{ round=94,	refix=2.997  },
												{ round=95,	refix=3.497  },
												{ round=96,	refix=3.998  },
												{ round=97,	refix=4.498  },
												{ round=98,	refix=4.999  },
												{ round=99,	refix=5.499  },
												{ round=100, refix=6.000 },
										}

x229022_g_HongyunRateTable = {
		{level=10,	value=400},
		{level=20,	value=332},
		{level=30,	value=332},
		{level=40,	value=284},
		{level=50,	value=249},
		{level=60,	value=220},
		{level=70,	value=200},
		{level=80,	value=180},
		{level=90,	value=166},
		{level=100, value=153},
		{level=110,	value=142},
		{level=120,	value=142},
		{level=130,	value=142},
		{level=140,	value=142},
		{level=150,	value=142},		
		}

function x229022_GetMapIndexByStringValue(stringV)
	for i, v in x229022_g_StrList do
		if v == stringV then
			return i-1
		end
	end
	local strText = format("C ph鋓 %s 疱ng k� StrList trong", stringV)
	PrintStr(strText)
	return 0;
end

--根据性别取 餴琺相关信息
function x229022_GetSexInfo(sex)
	local strSex = "huynh  "
	if sex <= 0 then
		strSex = "mu礽  "
	end
	local sexIndex = x229022_GetMapIndexByStringValue(strSex)
	return strSex, sexIndex
end


function x229022_GetOneMissionNpcEx(sceneId, currentNpcId)
	local nNpcId, strNpcName, strNpcScene, nSceneId, nPosX, nPosZ, strNPCDesc
	for i=1, 100 do
		nNpcId, strNpcName, strNpcScene, nSceneId, nPosX, nPosZ, strNPCDesc = GetOneMissionNpc(x229022_g_RenwulianNpc_Index)
		if GetName(sceneId, currentNpcId ) ~= strNpcName then
			--PrintStr("nNpcId=" .. nNpcId .. " currentNpcId=" .. currentNpcId )
			break
		end
	end
	return nNpcId, strNpcName, strNpcScene, nSceneId, nPosX, nPosZ, strNPCDesc
end

--/////////////////////////////////////////////////////////////////////
function x229022_WenHou_Accept(sceneId, selfId, targetId)

	local nNpcId, strNpcName, strNpcScene, nSceneId, nPosX, nPosZ, strNPCDesc = x229022_GetOneMissionNpcEx(sceneId, targetId)

	--加入任务到玩家列表
	local bCanAdd = AddMission( sceneId,selfId, x229022_g_MissionId, x229022_g_scriptId, 0, 0, 0 )
	if bCanAdd < 1 then
		AddText( sceneId, "#{WFRN_090213_01}" ) --hzp 2009-2-13
		return
	end
	
	--hzp 2009-2-13 begin<<
	local  PlayerName=GetName(sceneId,selfId)
	local  PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex = " c� n呓ng "
	else
		PlayerSex = " c醕 h� "
	end
	AddText(sceneId,"  " .. PlayerName .. PlayerSex .. ", nhi甿 v� li阯 ho鄋..")
	-->>end
	
	SetMissionEvent(sceneId, selfId, x229022_g_MissionId, 4)
	Msg2Player(  sceneId, selfId,"#YNh nhi甿 v�#W: nhi甿 v� li阯 ho鄋", MSG2PLAYER_PARA )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, nSceneId, nPosX, nPosZ, strNpcName)

	-- 餴琺到任务T読 20c醝任务中to� 鸬 序列号
	local misIndex = GetMissionIndexByID(sceneId,selfId,x229022_g_MissionId)

	SetMissionByIndex(sceneId, selfId, misIndex, 0, 0) --设置任务喧ng否完成(未完成)
	SetMissionByIndex(sceneId, selfId, misIndex, 1, x229022_g_SubMissionType.wenhou)
	SetMissionByIndex(sceneId, selfId, misIndex, 2, -1) --保存时钟索引,初始化为-1
	SetMissionByIndex(sceneId, selfId, misIndex, x229022_g_StrForePart, 0)--formet字符串索引
	SetMissionByIndex(sceneId, selfId, misIndex, x229022_g_StrForePart+1, nNpcId)

	--找人: 
	local missionInfo = {
			"L鈛 l kh鬾g g %s %s (%d, %d) nh� qu�, c� th� gi鷓 ta chuy琻 l秈 v an t緄 ng叨i 痼",
			"%s %s (%d, %d) Di甤 T錸g c� 鈔 v緄 ta, n猽 c� th� thay ta th錷 h鰅, ta xin nh t th竛h t靚h n鄖,",
			"Ta v� %s %s (%d, %d) giao h鎢 th鈓 s鈛, nhi玼 n錷 kh鬾g g r nhung nh�, phi玭 ng呓i chuy琻 l秈 th錷 c黙 ta",
	}

	local strMissionTarget = format(missionInfo[random(getn(missionInfo))], strNpcScene, strNpcName, nPosX, nPosZ)
	AddText(sceneId, strMissionTarget)

	x229022_OnAccept_Necessary( sceneId, selfId, targetId )
end
--/////////////////////////////////////////////////////////////////////
function x229022_SuoQu_Accept(sceneId, selfId, targetId)

	local nNpcId, strNpcName, strNpcScene, nSceneId, nPosX, nPosZ, strNPCDesc = x229022_GetOneMissionNpcEx(sceneId, targetId)

	local nItemId, strItemName, strItemDesc
	for i=1, 100 do
		nItemId, strItemName, strItemDesc = GetOneMissionItem(x229022_g_RenwulianItem_Index)
		if IsEquipItem(nItemId) > 0 then
			local reqLevel = GeEquipReqLevel(nItemId)
			local playerLevel = GetLevel(sceneId, selfId)
			--不会索取装备列中玩家等c+10to� 鸬 装备.(由于有类似于梦幻to� 鸬 “传说”,防止玩家传说出高c装备就主观断任务.)
			if playerLevel >= reqLevel and playerLevel < reqLevel+10 then
				break
			end
			if i == 100 then
				--"统统给我问候去 哈哈")
				x229022_WenHou_Accept(sceneId, selfId, targetId)
				return
			end	--end if
			nItemId, strItemName, strItemDesc = GetOneMissionItem(x229022_g_RenwulianItem_Index)
		else
			break
		end --end if
	end --end for

	--加入任务到玩家列表
	local bCanAdd = AddMission( sceneId,selfId, x229022_g_MissionId, x229022_g_scriptId, 1, 0, 1 )
	if bCanAdd < 1 then
		AddText( sceneId, "#{WFRN_090213_01}" ) --hzp 2009-2-13
		return
	end
	
	--hzp 2009-2-13 begin<<
	local  PlayerName=GetName(sceneId,selfId)
	local  PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex = " c� n呓ng "
	else
		PlayerSex = " c醕 h� "
	end
	AddText(sceneId,"  " .. PlayerName .. PlayerSex .. ", nhi甿 v� li阯 ho鄋..")
	-->> end
	
	SetMissionEvent(sceneId, selfId, x229022_g_MissionId, 4)

	Msg2Player(  sceneId, selfId,"#YNh nhi甿 v�#W: nhi甿 v� li阯 ho鄋", MSG2PLAYER_PARA )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, nSceneId, nPosX, nPosZ, strNpcName)

	-- 餴琺到任务T読 20c醝任务中to� 鸬 序列号
	local misIndex = GetMissionIndexByID(sceneId,selfId,x229022_g_MissionId)

	SetMissionByIndex(sceneId, selfId, misIndex, 0, 0) --设置任务喧ng否完成(未完成)
	SetMissionByIndex(sceneId, selfId, misIndex, 1, x229022_g_SubMissionType.suoqu)
	SetMissionByIndex(sceneId, selfId, misIndex, 2, -1) --保存时钟索引,初始化为-1
	SetMissionByIndex(sceneId, selfId, misIndex, x229022_g_StrForePart+2, nNpcId)
	SetMissionByIndex(sceneId, selfId, misIndex, x229022_g_StrForePart+1, nItemId)
	SetMissionByIndex(sceneId, selfId, misIndex, x229022_g_StrForePart, 1)--formet字符串索引

	local missionInfo = {
				"Nghe n骾 %s %s (%d, %d) c ph鋓 %s, phi玭 ng呓i giao h�",
				"M ng鄖 qua %s %s (%d, %d) mu痭 鹫t t緄 %s n阯 鹧ng ng癷 kh鬾g y阯, n猽 ng呓i c� th� gi鷓,  c� l㱮",
				"T緄 餴, h銀 mang %s %s (%d, %d) giao t緄 %s, ng呓i 疬㧟 h th叻ng",
				"%s %s (%d, %d) nghi阯 c製 b� k韕 th c鬾g, do thi猽 %s n阯 kh� tri琻 khai, ng呓i t緄 gi鷓 餴",
				"Bg h鎢 ta %s %s (%d, %d) 餫ng � thu th %s, N猽 ng呓i c� th� t靘 疬㧟 1 chi猚, b課 ta s� r vui m譶g",
				}

	local strMissionTarget = format(missionInfo[random(getn(missionInfo))],
																									strNpcScene, strNpcName, nPosX, nPosZ, strItemName)
	AddText(sceneId, strMissionTarget)

	local demandItemId = GetMissionParam(sceneId, selfId, misIndex, x229022_g_StrForePart+1)
	if HaveItem(sceneId, selfId, demandItemId) > 0 then
		SetMissionByIndex(sceneId, selfId, misIndex, 0, 1)
	end

	x229022_OnAccept_Necessary( sceneId, selfId, targetId )
end

--/////////////////////////////////////////////////////////////////////
function x229022_Chongwu_Accept(sceneId, selfId, targetId)
	local petId, petName, petDesc, takeLevel
	for i = 1, 100 do
		petId, petName, petDesc = GetOneMissionPet(x229022_g_RenwulianPet_Index)
		
		--if 1==1 then
		--petId, petName, petDesc = 3000, "S鄆 Mi陁 D� Sinh", "hahaha"
		--break
		--end
		takeLevel = GetPetTakeLevel(petId)
		if takeLevel >= 10 and takeLevel <= GetLevel(sceneId, selfId) then
			break
		elseif i == 10 then
			--统统给我问候去 哈哈
			x229022_WenHou_Accept(sceneId, selfId, targetId)
			return
		end
	end

	local nNpcId, strNpcName, strNpcScene, nSceneId, nPosX, nPosZ, strNPCDesc = x229022_GetOneMissionNpcEx(sceneId, targetId)

	--加入任务到玩家列表
	local bCanAdd = AddMission( sceneId,selfId, x229022_g_MissionId, x229022_g_scriptId, 0, 0, 0 )
	if bCanAdd < 1 then
		AddText( sceneId, "#{WFRN_090213_01}" ) --hzp 2009-2-13
		return
	end
	
	--hzp 2009-2-13 begin<<
	local  PlayerName=GetName(sceneId,selfId)
	local  PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex = " c� n呓ng "
	else
		PlayerSex = " c醕 h� "
	end
	AddText(sceneId,"  " .. PlayerName .. PlayerSex .. ", nhi甿 v� li阯 ho鄋..")
	-->> end
	
	SetMissionEvent(sceneId, selfId, x229022_g_MissionId, 3)
	SetMissionEvent(sceneId, selfId, x229022_g_MissionId, 4)
	Msg2Player(  sceneId, selfId,"#YNh nhi甿 v�#W: nhi甿 v� li阯 ho鄋", MSG2PLAYER_PARA )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, nSceneId, nPosX, nPosZ, strNpcName)

	-- 餴琺到任务T読 20c醝任务中to� 鸬 序列号
	local misIndex = GetMissionIndexByID(sceneId,selfId,x229022_g_MissionId)

	SetMissionByIndex(sceneId, selfId, misIndex, 0, 0) --设置任务喧ng否完成(未完成)
	SetMissionByIndex(sceneId, selfId, misIndex, 1, x229022_g_SubMissionType.chongwu)
	SetMissionByIndex(sceneId, selfId, misIndex, 2, -1) --保存时钟索引,初始化为-1
	SetMissionByIndex(sceneId, selfId, misIndex, x229022_g_StrForePart+2, nNpcId)
	SetMissionByIndex(sceneId, selfId, misIndex, x229022_g_StrForePart+1, petId)

	SetMissionByIndex(sceneId, selfId, misIndex, x229022_g_StrForePart, 2)--formet字符串索引

	local missionInfo = {
			"Nghe n骾 %s %s (%d, %d) c ph鋓 %s, phi玭 ng呓i giao h�",
			"M ng鄖 qua %s %s (%d, %d) mu痭 鹫t t緄 %s n阯 鹧ng ng癷 kh鬾g y阯, n猽 ng呓i c� th� gi鷓,  c� l㱮",
			"T緄 餴, h銀 mang %s %s (%d, %d) giao t緄 %s, ng呓i 疬㧟 h th叻ng",
			"%s %s (%d, %d) nghi阯 c製 b� k韕 th c鬾g, do thi猽 %s n阯 kh� tri琻 khai, ng呓i t緄 gi鷓 餴",
			"Bg h鎢 ta %s %s (%d, %d) 餫ng � thu th %s, N猽 ng呓i c� th� t靘 疬㧟 1 chi猚, b課 ta s� r vui m譶g",
			}

	local strMissionTarget = format(missionInfo[random(getn(missionInfo))],
																									strNpcScene, strNpcName, nPosX, nPosZ, petName)
	AddText(sceneId, strMissionTarget)

	--检测玩家身上to� 鸬 道具喧ng否已经Th鯽 m鉵完成条件
	for i=0, 6 do
		local petDataId = LuaFnGetPet_DataID(sceneId,selfId,i)
		if petDataId ~= nil and petDataId >= 0 then
		if GetPetName(petId) == GetPetName(petDataId) then
			SetMissionByIndex(sceneId,selfId,misIndex,0,1)					--把任务完成标志置为1
			break
		end
	end
	end

	x229022_OnAccept_Necessary( sceneId, selfId, targetId )
end
--/////////////////////////////////////////////////////////////////////

function x229022_FubenZhanDou_Accept(sceneId, selfId, targetId)

	local round = GetMissionData(sceneId,selfId,MD_RENWULIAN_HUAN)
	-->80环,不会再有Cu礳 chi猲 类型.(由于怪to� 鸬 等cT読 玩家等c基础上,会随环to� 鸬 增多而增加难度,后20环采取保护)
	if round > 80 then
		--统统给我问候去 哈哈
		x229022_WenHou_Accept(sceneId, selfId, targetId)
		return
	end

	local nNpcId,strNpcName,strNpcScene,nSceneId,nPosX,nPosZ,strNPCDesc,sex=x229022_GetOneMissionNpcEx(sceneId, targetId)
	--加入任务到玩家列表
	local bCanAdd = AddMission( sceneId,selfId, x229022_g_MissionId, x229022_g_scriptId, 1, 0, 0 )
	if bCanAdd < 1 then
		AddText( sceneId, "#{WFRN_090213_01}" ) --hzp 2009-2-13
		return
	end
	
	--hzp 2009-2-13 begin<<
	local  PlayerName=GetName(sceneId,selfId)
	local  PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex = " c� n呓ng "
	else
		PlayerSex = " c醕 h� "
	end
	AddText(sceneId,"  " .. PlayerName .. PlayerSex .. ", nhi甿 v� li阯 ho鄋..")
	-->> end
	
	Msg2Player(  sceneId, selfId,"#YNh nhi甿 v�#W: nhi甿 v� li阯 ho鄋", MSG2PLAYER_PARA )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, nSceneId, nPosX, nPosZ, strNpcName)

	-- 餴琺到任务T読 20c醝任务中to� 鸬 序列号
	local misIndex = GetMissionIndexByID(sceneId,selfId,x229022_g_MissionId)
	SetMissionEvent(sceneId, selfId, x229022_g_MissionId, 4)

	SetMissionByIndex(sceneId, selfId, misIndex, 0, 0) --设置任务喧ng否完成(未完成)
	SetMissionByIndex(sceneId, selfId, misIndex, 1, x229022_g_SubMissionType.fubenjiaoxun)
	SetMissionByIndex(sceneId, selfId, misIndex, 2, -1) --保存时钟索引,初始化为-1
	SetMissionParamByIndexEx(sceneId, selfId, misIndex, 3, 0, 0) --要求杀死to� 鸬 monster总数, 现T読 还没有赋值
	SetMissionParamByIndexEx(sceneId, selfId, misIndex, 3, 1, 0) --秀 gi猼 ch猼 to� 鸬 monster数量

	SetMissionByIndex(sceneId, selfId, misIndex, x229022_g_StrForePart+1, nNpcId)
	--local strSex, sexIndex = x229022_GetSexInfo(sex)
	--SetMissionByIndex(sceneId, selfId, misIndex, x229022_g_StrForePart+2, sexIndex)

	SetMissionByIndex(sceneId, selfId, misIndex, x229022_g_StrForePart, 3)--formet字符串索引

	local missionInfo = {
				"Nghe n骾 %s %s (%d, %d) 餫ng l鄊 餴玼 醕, ng呓i h銀 thay ta 餴 d誽 b鋙 h",
				"%s %s (%d, %d) t� tr呔c t緄 nay kh鬾g c� ti猲g t錷 l呓ng thi畁, di畉 tr� c醝 醕 皤 cao c醝 thi畁 l� vi甤 m� 鸲i ta c l鄊, t緄 cho ng呓i 1 b鄆 h鱟 疴y",
				"Ta nghe n骾 %s %s (%d, %d) g 疴y l読 ph誱 m 醤, n猽 kh鬾g d誽 d�, h s� kh鬾g thu ki猰, nhi甿 v� n鄖 giao cho ng呓i",
		}
	local strMissionTarget = format(missionInfo[random(getn(missionInfo))],
					strNpcScene,strNpcName, nPosX, nPosZ)

	AddText(sceneId, strMissionTarget)

	x229022_OnAccept_Necessary( sceneId, selfId, targetId )
end

function x229022_ExchangeMissionItemForGoodBadFn( sceneId, selfId,targetId, needPoint )
	--给予任务物品
	if( needPoint < 0 ) then
		return
	end
	local iDayTime = GetMissionData(sceneId,selfId,MD_RENWULIAN_EXCHANGEITEM)
	--begin modified by zhangguoxin 090208
	--local CurTime = GetHourTime()		--当前时间
	--local CurDaytime = floor(CurTime/100)	--当前时间(天)
	local CurDaytime = GetDayTime()	--当前时间(天)
	--begin modified by zhangguoxin 090208
	if iDayTime == CurDaytime then
		BeginEvent(sceneId)
			AddText(sceneId, "1 ng鄖 ch� c� th� d鵱g tr� gi� thi畁 醕 鸨i 1 l!")
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		return
	end


	local misIndex = GetMissionIndexByID(sceneId,selfId,x229022_g_MissionId)
	local itemId = GetMissionParam(sceneId, selfId, misIndex, x229022_g_StrForePart+1)

	local _, strItemName, strItemDesc = GetItemInfoByItemId(itemId)
	local goodbadValue = LuaFnGetHumanGoodBadValue(sceneId, selfId)
	if goodbadValue < needPoint then
		BeginEvent(sceneId)
			AddText(sceneId, "衖琺 thi畁 醕 c黙 ng呓i kh鬾g 瘘, c d鏽 th阭 nhi玼 ng叨i m緄 t緄")
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
	else
		BeginAddItem(sceneId)
		AddItem(sceneId,itemId, 1)
		local ret = EndAddItem(sceneId,selfId)
		if ret > 0 then
			AddItemListToHuman(sceneId,selfId)
			--设置任务已经完成
			SetMissionByIndex(sceneId,selfId,misIndex,0,1)
		end

		LuaFnSetHumanGoodBadValue(sceneId, selfId, goodbadValue-needPoint)
		local str = format("Ng呓i t痭 #Y%d #W餴琺 thi畁 醕, 疸 鹫t 疬㧟 th� m靚h mu痭 #B%s", needPoint, strItemName)
		SetMissionData(sceneId, selfId, MD_RENWULIAN_EXCHANGEITEM, CurDaytime)

		Msg2Player(  sceneId, selfId,str, MSG2PLAYER_PARA )
	end


end

function x229022_ExchangeMissionItemForGoodBad( sceneId, selfId,targetId )

	--给予任务物品
	local misIndex = GetMissionIndexByID(sceneId,selfId,x229022_g_MissionId)
	local itemId = GetMissionParam(sceneId, selfId, misIndex, x229022_g_StrForePart+1)
	local _, strItemName, strItemDesc = GetItemInfoByItemId(itemId)

	local nNeedPoint
	if IsEquipItem(itemId) == 1 then --600+4*Lv
		nNeedPoint = 600 + 4 * GeEquipReqLevel(itemId)
	else	--600+4*物品档次等c
		nNeedPoint = 600 + 4 * 1 --物品档次等c目前没有�.�
	end

	BeginUICommand(sceneId)
		UICommand_AddInt(sceneId,x229022_g_scriptId);
		UICommand_AddInt(sceneId,targetId);
		UICommand_AddInt(sceneId,nNeedPoint)
		UICommand_AddString(sceneId,"ExchangeMissionItemForGoodBadFn");
		local str = format("Ng呓i ph鋓 鸨i #B%s #W, c ph鋓 ti陁 hao tr� gi� thi畁 醕 #Y%d #W餴琺", strItemName, nNeedPoint)
		UICommand_AddString(sceneId,str);
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 24)

end

function x229022_CurrentRoundStorageFn( sceneId, selfId,targetId, needPoint )
	if needPoint < 0 then
		return
	end
	local misIndex = GetMissionIndexByID(sceneId,selfId,x229022_g_MissionId)
	local leaveSecond = GetMissionParam(sceneId, selfId, misIndex, 7)
	local goodbadValue = LuaFnGetHumanGoodBadValue(sceneId, selfId)

	--PrintNum(leaveSecond)
	if leaveSecond < 10*60000 then
		BeginEvent(sceneId)
			AddText(sceneId, "Ng呓i 疸 v唼t 20 ph鷗, kh鬾g th� l遳 l読 nhi甿 v�")
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
	elseif goodbadValue < needPoint then
		BeginEvent(sceneId)
			AddText(sceneId, "衖琺 thi畁 醕 c黙 ng呓i kh鬾g 瘘, c d鏽 th阭 nhi玼 ng叨i m緄 t緄")
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
	else
		LuaFnSetHumanGoodBadValue(sceneId, selfId, goodbadValue-needPoint)
		local str = format("Ng呓i t痭 #Y%d #W餴琺tr� gi� thi畁 醕, nhi甿 v� li阯 ho鄋 s� v騨g 疸 l遳 l読", needPoint)
		Msg2Player(  sceneId, selfId,str, MSG2PLAYER_PARA )
		--设置任务已经存储to� 鸬 标志
		SetMissionByIndex(sceneId,selfId,misIndex,2,1)
		--停止任务时钟
		StopMissionTimer(sceneId, selfId, x229022_g_MissionId)
		SetMissionData(sceneId,selfId,x229022_g_StopWatch_Pause_Flag,1)
	end

	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)

end

function x229022_CurrentRoundStorage( sceneId, selfId,targetId )
	local  nNeedPoint = 1000
	BeginUICommand(sceneId)
		UICommand_AddInt(sceneId,x229022_g_scriptId);
		UICommand_AddInt(sceneId,targetId);
		UICommand_AddInt(sceneId,nNeedPoint)
		UICommand_AddString(sceneId,"CurrentRoundStorageFn");
		local str = format("L遳 l読 s� v騨g c ph鋓 ti陁 hao tr� gi� thi畁 醕 #Y%d #W餴琺, ng呓i x醕 鸶nh kh鬾g?", nNeedPoint)
		UICommand_AddString(sceneId,str);
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 24)

end

function x229022_ContinueStoredMissionFn(sceneId, selfId, targetId,flag)
	if flag < 0 then
		return
	end
	local misIndex = GetMissionIndexByID(sceneId,selfId,x229022_g_MissionId)		-- 餴琺到任务T読 20c醝任务中to� 鸬 序列号
	-- 餴琺到环数
	local round = GetMissionData(sceneId,selfId,MD_RENWULIAN_HUAN)
	local str = format("Ng呓i 疸 ti猵 t鴆 nhi甿 v� li阯 ho鄋, s� v騨g hi畁 th秈 l� #Y%d #Wv騨g", round)
	Msg2Player(  sceneId, selfId,str, MSG2PLAYER_PARA )
	--启动任务时钟
	StartMissionTimer(sceneId, selfId, x229022_g_MissionId)
	--设置任务已经存储to� 鸬 标志
	SetMissionByIndex(sceneId,selfId,misIndex,2,0)
	SetMissionData(sceneId,selfId,x229022_g_StopWatch_Pause_Flag,0)
	--对时间进行修正
	local leaveSecond = GetMissionParam(sceneId, selfId, misIndex, 7)
	local elapseSecond = 30*60 - leaveSecond/1000
	SetMissionData(sceneId,selfId,MD_RENWULIAN_ACCPETTIME,LuaFnGetCurrentTime()-elapseSecond)

	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)

end

function x229022_ContinueStoredMission(sceneId, selfId, targetId)

	-- 餴琺到环数
	local round = GetMissionData(sceneId,selfId,MD_RENWULIAN_HUAN)

	BeginUICommand(sceneId)
		UICommand_AddInt(sceneId,x229022_g_scriptId);
		UICommand_AddInt(sceneId,targetId);
		UICommand_AddInt(sceneId,round)
		UICommand_AddString(sceneId,"ContinueStoredMissionFn");
		UICommand_AddString(sceneId,"Nhi甿 v� li阯 ho鄋 l tr呔c c黙 ng呓i 疸 ti猲 h鄋h t緄 th� #Y" .. tostring(round) .. "#Wv騨g, ng呓i x醕 鸶nh ti猵 t鴆?");
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 24)

end

function x229022_AddMissionDirectly(sceneId, selfId,targetId)
  	BeginEvent(sceneId)
  	
  	--hzp 2009-2-13 begin<<
		--local  PlayerName=GetName(sceneId,selfId)
		--local  PlayerSex=GetSex(sceneId,selfId)
		--if PlayerSex == 0 then
		--	PlayerSex = " c� n呓ng "
		--else
		--	PlayerSex = " c醕 h�"
		--end
		--AddText(sceneId,"  " .. PlayerName .. PlayerSex .. ",连环任务...")
		-->> end
		
    	--testing begin
    	--if 1==1 then
	   	--	x229022_FubenZhanDou_Accept(sceneId, selfId, targetId)
   		--	EndEvent()
			--DispatchEventList(sceneId,selfId,targetId)
			--return
    	--end
    	--testing end
    	
	  	local ret = random(100)

		if ret < 5 then			--1、	找NPC问候(5%)
			x229022_WenHou_Accept(sceneId, selfId, targetId)
		elseif ret < 85 then	--2、	索�.�80%)
			ret = random(100)
			if ret < 62 then -- 70 	索取物品(62%)宠物=1-物品to� 鸬 
				x229022_SuoQu_Accept(sceneId, selfId, targetId)
			else
				x229022_Chongwu_Accept(sceneId, selfId, targetId)
			end
		else									--4、	Cu礳 chi猲 (传入副本)(35%)
			x229022_FubenZhanDou_Accept(sceneId, selfId, targetId)
		end

	EndEvent( )
	DispatchEventList(sceneId,selfId,targetId)
end

function x229022_CostMoneyFn(sceneId, selfId, targetId,flag)
	if flag < 0 then
		return
	end
	if x229022_CheckAccept(sceneId,selfId) > 0 then
		--察看金钱喧ng否足够
		if GetMoney(sceneId, selfId)+ GetMoneyJZ( sceneId, selfId ) < GetLevel(sceneId, selfId)*1000 then ---dengxx
			BeginEvent(sceneId)
				AddText(sceneId, "Ng鈔 l唼ng c黙 ng呓i h靚h nh� kh鬾g 瘘")
			EndEvent()
			DispatchEventList(sceneId,selfId,-1)
		else
			x229022_AddMissionDirectly(sceneId, selfId,targetId)
		end
	end
end
--/////////////////////////////////////////////////////////////////////
--**********************************
--事件列表
--**********************************
function x229022_UpdateEventList( sceneId, selfId,targetId )
	if IsHaveMission(sceneId,selfId,x229022_g_MissionId) > 0 then
		local misIndex = GetMissionIndexByID(sceneId,selfId,x229022_g_MissionId)		-- 餴琺到任务T読 20c醝任务中to� 鸬 序列号
		local missionType = GetMissionParam(sceneId, selfId, misIndex, 1)
		if 1 == GetNumText() then
			--用善恶值换取连环任务物品 --张真昊
			x229022_ExchangeMissionItemForGoodBad( sceneId, selfId,targetId )
			return
		elseif 2 == GetNumText() then
			--存储当前环数 --张真昊
			x229022_CurrentRoundStorage( sceneId, selfId,targetId )
			return
		elseif 3 == GetNumText() then
			x229022_ContinueStoredMission(sceneId, selfId, targetId)
			return
		end

		if missionType == x229022_g_SubMissionType.wenhou then
			if x229022_IsDemandNpc(sceneId, selfId, targetId) == 1 then
				SetMissionByIndex(sceneId, selfId, misIndex, 0, 1)
				if x229022_CheckSubmit( sceneId, selfId ) > 0 then
					--发送任务需求to� 鸬 信息
					BeginEvent(sceneId)
						AddText(sceneId, x229022_g_MissionName)
						AddText(sceneId, "A! ng呓i r痶 cu礳 c鹡g t緄, 瘊ng l鷆 c� vi甤 c ph鋓 ng呓i gi鷓 疝")
					EndEvent( )
				end
				DispatchMissionContinueInfo(sceneId, selfId, targetId, x229022_g_scriptId, x229022_g_MissionId, x229022_g_scriptId)
			end
		elseif	missionType == x229022_g_SubMissionType.suoqu then
			--发送任务需求to� 鸬 信息
			local itemId = GetMissionParam(sceneId, selfId, misIndex, x229022_g_StrForePart+1)
			local _, strItemName, _ = GetItemInfoByItemId(itemId)

			BeginEvent(sceneId)
				AddText(sceneId, x229022_g_MissionName)
				AddText(sceneId, "Ta ph鋓 #B" .. strItemName .. "#W ng呓i mang t緄 cho ta ch遖?")
			EndEvent( )
			local bDone = x229022_CheckSubmit( sceneId, selfId )
			DispatchMissionDemandInfo(sceneId, selfId, targetId, x229022_g_scriptId, x229022_g_MissionId, bDone,x229022_g_scriptId)
		elseif 	missionType == x229022_g_SubMissionType.chongwu then
			--发送任务需求to� 鸬 信息
			local petDataId = GetMissionParam(sceneId, selfId, misIndex, x229022_g_StrForePart+1)
			local strItemName = GetPetName(petDataId)

			BeginEvent(sceneId)
				AddText(sceneId, x229022_g_MissionName)
				AddText(sceneId, "Tr鈔 th� ta c #B" .. strItemName .. "#W ng呓i hi畁 c� kh鬾g?")
			EndEvent( )
			local bDone = x229022_CheckSubmit( sceneId, selfId )
			DispatchMissionDemandInfo(sceneId, selfId, targetId, x229022_g_scriptId, x229022_g_MissionId, bDone,x229022_g_scriptId)
		elseif missionType == x229022_g_SubMissionType.fubenjiaoxun then
			--如果已经完成了教训to� 鸬 任务
			if x229022_CheckSubmit( sceneId, selfId ) > 0 then
				BeginEvent(sceneId)
					AddText(sceneId, x229022_g_MissionName)
					AddText(sceneId, "Qu� nhi阯 v� c鬾g cao c叨ng, ta kh鬾g d醡 l鄊 餴玼 醕 n鎍, nh遪g ta c騨 c� ch鷗 chuy畁 c ph鋓 ng呓i gi鷓 疝")
				EndEvent( )
				DispatchMissionContinueInfo(sceneId, selfId, targetId, x229022_g_scriptId, x229022_g_MissionId, x229022_g_scriptId)
			else
				--玩家如果不喧ng队长,不会创建副本
				--local teamLeaderID = GetTeamLeader(sceneId, selfId)
				--local nearmembercount = GetNearTeamCount(sceneId, selfId)
				--if teamLeaderID ~= selfId or nearmembercount < 2 then --包括玩家自己T読 内
				--	BeginEvent(sceneId)
				--		AddText(sceneId, "凭你单枪匹马,也想来找我,还喧ng招些帮手再来吧.\n")
				--	EndEvent()
				--	DispatchEventList(sceneId, selfId, targetId)
				--else
					local str
					local ret = random(3)
					if ret == 1 then
						str = "Do ng呓i mu痭 d誽 b鋙 ta, mu痭 鸬ng th� v緄 ta, h銀 黏u v緄 thu礳 h� ta tr呔c, xem ng呓i l㱮 h読 ra sao. \n"
					elseif ret ==  2 then
						str = "Do ng呓i mu痭 d誽 b鋙 ta, t緄 疴y, ta cho ng呓i bi猼 tay. \n"
				        else
						str = "R鉵h nh�, cho ng呓i n猰 m鵬 l㱮 h読 c黙 ta! cho ng呓i ch猼. \n"
					end

					BeginEvent(sceneId)
						AddText(sceneId, str)
					EndEvent()
					DispatchEventList(sceneId, selfId, targetId)
					local nearmembercount = GetNearTeamCount(sceneId, selfId)
					if nearmembercount <= 0 then
						nearmembercount = 1
					end
					SetMissionParamByIndexEx(sceneId, selfId, misIndex, 3, 0, nearmembercount) --提前设置该任务要求杀死to� 鸬 monster数量
					--调用创建副本入口函数
					CallScriptFunction(229023 , "MakeCopyScene", sceneId, selfId, nearmembercount)
				--end
			end
		end

	--只有T読 王夫人这二第m祎 次接任务喧ng才进行条件判断
  elseif GetName(sceneId, targetId) == x229022_g_Name then
 		--PrintStr(GetName(sceneId, targetId))
		--PrintStr(x229022_g_Name)
		if GetName(sceneId, targetId) == x229022_g_Name then
			local costMoney = GetLevel(sceneId, selfId)*1000
			BeginUICommand(sceneId)
				UICommand_AddInt(sceneId,x229022_g_scriptId);
				UICommand_AddInt(sceneId,targetId);
				UICommand_AddInt(sceneId,costMoney)
				UICommand_AddString(sceneId,"CostMoneyFn");
				UICommand_AddString(sceneId,"Ph鋓 nh nhi甿 v� n鄖, c ph鋓 n祊 1 l l� #{_MONEY" .. tostring(costMoney) .. "}, Ng呓i x醕 nh ch遖?");  --dengxx
			EndUICommand(sceneId)
			DispatchUICommand(sceneId,selfId, 24)
			return
		end
	else
		if x229022_CheckAccept(sceneId,selfId) > 0 then
			x229022_AddMissionDirectly(sceneId, selfId,targetId)
		end
  end
end

--**********************************
--事件交互入口
--**********************************
function x229022_OnDefaultEvent( sceneId, selfId,targetId )
	--PrintStr("OnDefaultEvent...")
	x229022_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--列举事件
--**********************************
function x229022_OnEnumerate( sceneId, selfId, targetId )
	--local f = openfile("D:/randomtest.txt", 'w')
	--for i=1, 10000 do
	--	write(f, tostring(random(10000)))
	--	write(f, tostring("\r\n"))
	--end
	--closefile(f)


	--暂时屏蔽连环任务
	--if 1==1 then
	--	return
	--end
	--如果玩家完成过C醝 n鄖 任务
		if IsMissionHaveDone(sceneId,selfId,x229022_g_MissionId) > 0 then
    	return
	--Th鯽 m鉵任务接收条件
		elseif IsHaveMission(sceneId,selfId,x229022_g_MissionId) > 0 then
			local misIndex = GetMissionIndexByID(sceneId,selfId,x229022_g_MissionId)
			--如果喧ng索取物品则显示用善恶值可以换取任务物品
			if GetMissionParam(sceneId,selfId,misIndex,1) == x229022_g_SubMissionType.suoqu then
				AddNumText(sceneId, x229022_g_scriptId,x229022_g_GoodBadDescTable[1].str,1,1);
			end

			--local missionType = GetMissionParam(sceneId, selfId, misIndex, 1)
			--if missionType == x229022_g_SubMissionType.fubenjiaoxun then
			--	AddNumText(sceneId, x229022_g_scriptId,x229022_g_MissionName,2,-1);
			--end
			if GetName(sceneId,targetId) == x229022_g_Name then
				--如果已经存储了连环任务,则显示继续该任务
				if GetMissionParam(sceneId,selfId,misIndex, 2) == 1 then
					AddNumText(sceneId, x229022_g_scriptId,x229022_g_GoodBadDescTable[3].str,1,3);
				else
					AddNumText(sceneId, x229022_g_scriptId,x229022_g_GoodBadDescTable[2].str,1,2);
				end
			end
	--Th鯽 m鉵任务接收条件
    elseif GetName(sceneId,targetId) == x229022_g_Name then
   		--玩家等c>=60c
			if GetLevel(sceneId, selfId) >= 60 then
				AddNumText(sceneId,x229022_g_scriptId, x229022_g_MissionName, 1, -1);
			end
    end
end

--**********************************
--检测Ti猵 th跫�
--**********************************
function x229022_CheckAccept( sceneId, selfId )
	--test begin
	--if 1== 1 then
	--	return 1
	--end
	--test end
	local nLevel = LuaFnGetLevel(sceneId, selfId)

	--玩家当次接连环任务时间与上次完成连环任务时间之时间差>48小时
	local iDayCount=GetMissionData(sceneId,selfId,MD_RENWULIAN_DAYCOUNT)

	-- 餴琺到环数
	local round = GetMissionData(sceneId,selfId,MD_RENWULIAN_HUAN)
	if round < 50 then
		if (LuaFnGetCurrentTime()-iDayCount) < 15*60 then
			BeginEvent(sceneId)
				AddText(sceneId, "Kho鋘g c醕h gi鎍 2 l nhi甿 v� li阯 ho鄋 l� 15 ph鷗, xin gi� y阯 lg, kh鬾g l鄊 皀")
			EndEvent()
			DispatchEventList(sceneId,selfId,-1)
			return 0
		end
	elseif round == 100 then
		if (LuaFnGetCurrentTime()-iDayCount) < 48*60*60 then
			BeginEvent(sceneId)
				AddText(sceneId, "Kho鋘g c醕h gi鎍 2 l nhi甿 v� li阯 ho鄋 l� 48 canh gi�, xin gi� y阯 lg, kh鬾g l鄊 皀")
			EndEvent()
			DispatchEventList(sceneId,selfId,-1)
			return 0
		else
			SetMissionData(sceneId, selfId, MD_RENWULIAN_HUAN, 0)
		end
	elseif round >= 50 then
		--PrintNum(CurDaytime*96 + CurQuarterTime)
		--PrintNum(iDayTime*96 + iQuarterTime)
		--PrintNum( ((CurDaytime*96 + CurQuarterTime) - (iDayTime*96 + iQuarterTime)) )
		if (LuaFnGetCurrentTime()-iDayCount) < 24*60*60 then
			BeginEvent(sceneId)
				AddText(sceneId, "Kho鋘g c醕h gi鎍 2 l nhi甿 v� li阯 ho鄋 l� 24 canh gi�, xin gi� y阯 lg, kh鬾g l鄊 皀")
			EndEvent()
			DispatchEventList(sceneId,selfId,-1)
			return 0
		end
	end

	--玩家to� 鸬 携带Kinh nghi甿≠玩家可携带Kinh nghi甿上限(你携带to� 鸬 Kinh nghi甿已达上限,用些再来找我吧)
	if GetExp(sceneId, selfId)>= GetFullExp(sceneId, selfId) then
		BeginEvent(sceneId)
			AddText(sceneId, "Kinh nghi甿 ng呓i mang theo 疸 v唼t ng咿ng, h銀 d鵱g b総 r癷 t緄 t靘 ta")
		EndEvent()
		DispatchEventList(sceneId,selfId,-1)
		return 0
	end
	return 1;
end

--**********************************
--Ti猵 th�
--**********************************
function x229022_OnAccept_Necessary( sceneId, selfId, targetId )

	-- 餴琺到环数
	local round = GetMissionData(sceneId,selfId,MD_RENWULIAN_HUAN)
	if 0 == round and GetName(sceneId, targetId) == x229022_g_Name then
		--花费计算:只有第m祎 次接,放弃重新接,时间到任务自动删除才会收费,也就喧ng环数=0时
		--CostMoney(sceneId, selfId, GetLevel(sceneId, selfId)*1000)             
		LuaFnCostMoneyWithPriority(sceneId, selfId, GetLevel(sceneId, selfId)*1000)
	end

	round = round + 1
	if round > 100 then
		round = 1
	end
	--环数增加1

	SetMissionData(sceneId, selfId, MD_RENWULIAN_HUAN, round)
	--test code {
	--SetMissionData(sceneId, selfId, MD_RENWULIAN_HUAN, 100)
	--local round = GetMissionData(sceneId,selfId,MD_RENWULIAN_HUAN)
	-- }

	--启动任务时钟
	StartMissionTimer(sceneId, selfId, x229022_g_MissionId)

	local misIndex = GetMissionIndexByID(sceneId,selfId,x229022_g_MissionId)

	SetMissionByIndex(sceneId, selfId, misIndex, 7, 30*60*1000) --设置任务to� 鸬 限制时间为30 ph鷗

	SetMissionData(sceneId, selfId, MD_RENWULIAN_ACCPETTIME, LuaFnGetCurrentTime())

end

--**********************************
--放弃
--**********************************
function x229022_OnAbandon( sceneId, selfId )
	local misIndex = GetMissionIndexByID(sceneId,selfId,x229022_g_MissionId)
	--停止任务时钟
	StopMissionTimer(sceneId, selfId, x229022_g_MissionId)
	--删除玩家任务列表中对应to� 鸬 任务
  DelMission( sceneId, selfId, x229022_g_MissionId )

	--设置循环任务to� 鸬 时间
	SetMissionData(sceneId,selfId,MD_RENWULIAN_DAYCOUNT,LuaFnGetCurrentTime())
	SetMissionData(sceneId, selfId, MD_RENWULIAN_HUAN, 0)

end

--**********************************
--继续
--**********************************
function x229022_OnContinue( sceneId, selfId, targetId )
	BeginEvent(sceneId)

		AddText(sceneId,x229022_g_MissionName)
		local str
		local misIndex = GetMissionIndexByID(sceneId,selfId,x229022_g_MissionId)
		local missionType = GetMissionParam(sceneId, selfId, misIndex, 1)
		if missionType == x229022_g_SubMissionType.wenhou then
			str = "衋 t� ng呓i t緄 疬a tin, t痶 qu� t痶 qu�"
		elseif missionType == x229022_g_SubMissionType.suoqu
			or missionType == x229022_g_SubMissionType.chongwu then
			str = "Ch�, th馽 l騨g c鋗 t� ng呓i, ta c騨 c� ch鷗 chuy畁 c ph鋓 ng呓i gi鷓 疝"
		elseif missionType == x229022_g_SubMissionType.fubenjiaoxun
			or missionType == x229022_g_SubMissionType.fubenduowu then
			str = "Qu� nhi阯 v� c鬾g cao c叨ng, ta kh鬾g d醡 l鄊 餴玼 醕 n鎍, nh遪g ta c騨 c� ch鷗 chuy畁 c ph鋓 ng呓i gi鷓 疝"
		end

		AddText(sceneId,str)

	EndEvent( )
	DispatchMissionContinueInfo(sceneId, selfId, targetId, x229022_g_scriptId, x229022_g_MissionId,x229022_g_scriptId)
end

--**********************************
--检测喧ng否可以提交
--**********************************
function x229022_CheckSubmit( sceneId, selfId )
  if IsHaveMission( sceneId, selfId, x229022_g_MissionId ) <= 0 then
		return 0
	end

	--T読 此判断提交条件喧ng否符合,并给予相应奖励
	local misIndex = GetMissionIndexByID(sceneId,selfId,x229022_g_MissionId)
	local missionType = GetMissionParam(sceneId, selfId, misIndex, 1)

	--察看任务喧ng否完成
	local bCompletion = GetMissionParam(sceneId, selfId, misIndex, 0)
	--PrintNum(bCompletion)
	if bCompletion > 0 then
		if missionType == x229022_g_SubMissionType.wenhou then
			return 1
		elseif missionType == x229022_g_SubMissionType.chongwu then
			local demandPetId = GetMissionParam(sceneId, selfId, misIndex, x229022_g_StrForePart+1)
			--检测玩家身上to� 鸬 道具喧ng否已经Th鯽 m鉵完成条件
			for i=0, 6 do
				local petDataId = LuaFnGetPet_DataID(sceneId,selfId,i)
				if petDataId ~= nil and petDataId >= 0 then
					if GetPetName(demandPetId) == GetPetName(petDataId) then
					        return 2
			        	end
			        end
			end
		elseif missionType == x229022_g_SubMissionType.suoqu then
			local demandItemId = GetMissionParam(sceneId, selfId, misIndex, x229022_g_StrForePart+1)
			if HaveItem(sceneId, selfId, demandItemId) > 0 then
				if LuaFnGetAvailableItemCount(sceneId, selfId, demandItemId) >= 1 then
					if IsEquipItem(demandItemId) == 1 then
						return 2
					else
						return 1
					end
				else
					BeginEvent(sceneId)
						AddText(sceneId, "V ph c黙 c醕 h� hi畁 kh鬾g d鵱g 疬㧟 ho 疸 b� kh骯.")
					EndEvent( )
					DispatchMissionTips(sceneId,selfId)
					return 0
				end
			else
				BeginEvent(sceneId)
					AddText(sceneId, "Thi猽 v ph m� nhi甿 v� c")
				EndEvent()
				DispatchMissionTips(sceneId, selfId)
				return 0
			end
		elseif missionType == x229022_g_SubMissionType.fubenjiaoxun then
				return 1
		end
	end
	return 0
end

--////////////////////////////////////////////////////////////////
--效率可T読 C++中优化,暂时这样,看效果T読 定
--////////////////////////////////////////////////////////////////
--function GetMissinonItemByCurrentHuan(playerLevel, round)
--	if round == 50 then
--		local itemId, itemName
--		local reqItemGrade = playerLevel / 10;
--		for i = 1, 5000 do
--			itemId, itemName = GetOneMissionBonusItem(x229022_g_RenwulianItem_Index)
--			local itemGrade = GetCommonItemGrade(itemId)
--			if itemGrade == reqItemGrade then
--				return itemId, itemName
--			end
--		end
--	elseif round == 100 then
--		local itemId, itemName
--		local reqItemGrade = (playerLevel+10) / 10;
--		for i = 1, 5000 do
--			itemId, itemName = GetOneMissionBonusItem(x229022_g_RenwulianItem_Index)
--			local itemGrade = GetCommonItemGrade(itemId)
--			if itemGrade == reqItemGrade then
--				return itemId, itemName
--			end
--		end
--	else
--		PrintStr("round=" .. round .. "非法!")
--	end
--end

--**********************************
--任务奖励函数
--**********************************
function x229022_MissionBonus(sceneId, selfId)
	local playerLevel = GetLevel(sceneId, selfId)
	local round = GetMissionData(sceneId,selfId,MD_RENWULIAN_HUAN)
	--当玩家50环,根据玩家等c(同等c)随机给予玩家武器制作必须原料m祎 件(给予100%).
	if round == 50 then
		local itemId, itemName = GetRenwulianMissionBonusItemByLevel(x229022_g_RenwulianItem50_Index, playerLevel)
		BeginAddItem(sceneId)
			AddItem(sceneId,itemId, 1)
		if EndAddItem(sceneId,selfId) > 0 then
			AddItemListToHuman(sceneId,selfId)
			local szItemTransfer = GetItemTransfer(sceneId,selfId,0)
			Msg2Player(sceneId, selfId, "Ng呓i 疸 鹫t 疬㧟 1 c醝 " .. itemName, MSG2PLAYER_PARA )
			local str = "#W#{_INFOUSR" .. LuaFnGetName(sceneId, selfId) .. "}#cffffccSau nh鎛g n� l馽 kh鬾g ng譶g, 疸 ho鄋 th鄋h 50 v騨g nhi甿 v� li阯 ho鄋 c黙#R V呓ng Phu Nh鈔#cffffcc, thu 疬㧟#W#{_INFOMSG" .. szItemTransfer .. "}#cffffcc ph th叻ng."
			BroadMsgByChatPipe(sceneId, selfId, str, 4)
		else
			BeginEvent(sceneId)
				AddText(sceneId, "Tay n鋓 c黙 ng呓i 疸 馥y!")
			EndEvent()
			DispatchMissionTips(sceneId, selfId)
			return 0
		end
	--当玩家满100环,根据玩家等c(同等c+10)随机给予玩家武器制作必须原料(武器[装备]制作书)m祎 件(给予100%).
	elseif round == 100 then

		local itemId, itemName, itemDesc, broadcastType = GetOneMissionBonusItem(x229022_g_RenwulianItem100_Index)
		local szItemTransfer = ""
		BeginAddItem(sceneId)
			AddItem(sceneId,itemId, 1)
			AddItem(sceneId, 30008034, 1) --奖励m祎 颗金刚砂
		if EndAddItem(sceneId,selfId) > 0 then
			AddItemListToHuman(sceneId,selfId)
			
			szItemTransfer_0 = GetItemTransfer(sceneId, selfId, 0)
			szItemTransfer_1 = GetItemTransfer(sceneId, selfId, 1)
			
			Msg2Player(sceneId, selfId, "Ng呓i 疸 鹫t 疬㧟 1 c醝 " .. itemName, MSG2PLAYER_PARA )
			Msg2Player(sceneId, selfId, "C醕 h� 疸 nh 疬㧟 m祎 颗金刚砂", MSG2PLAYER_PARA )
			
			local targetStr = "#{_INFOMSG".. szItemTransfer_0 .."}"
			targetStr = targetStr .. "和m祎 颗#{_INFOMSG" .. szItemTransfer_1 .. "}"
			local str = "#W#{_INFOUSR"..LuaFnGetName(sceneId, selfId) .. "}#cffffccSau nh鎛g n� l馽 kh鬾g ng譶g, 疸 ho鄋 th鄋h 100 v騨g nhi甿 v� li阯 ho鄋 c黙 $R V呓ng Phu Nh鈔#cffffcc, 鹫t 疬㧟#W#{_INFOMSG" .. szItemTransfer .. "}#cffffcc ph th叻ng."
			BroadMsgByChatPipe(sceneId, selfId, str, 4)
		else
			BeginEvent(sceneId)
				AddText(sceneId, "Tay n鋓 c黙 ng呓i 疸 馥y!")
			EndEvent()
			DispatchMissionTips(sceneId, selfId)
			return 0
		end
	end

	local expDelta = GetFullExp(sceneId, selfId) - GetExp(sceneId, selfId)
	if expDelta == 0 then
		Msg2Player(  sceneId, selfId, "Kinh nghi甿 ng呓i mang theo 疸 馥y, kh鬾g th� ho鄋 t nhi甿 v�", MSG2PLAYER_PARA )
		return 1
	end
	--Kinh nghi甿奖励 = 玩家当前等c奖励基数*环数加成
	--local A, B, C = 5, 1, 20*60
	--local D, E = 0.06, 4
	local playerLevel = GetLevel(sceneId, selfId)
	----玩家当前等c奖励基数 =(A+(玩家等c-1)*B)*C ；A=5,B=1,C(每环平均时间)=20*60(可能调整)
	--local BaseBonusValue = (A + (playerLevel-1)*B)*C
	----环数加成 =D*(当前环数-1)+1+FLOOR((当前环数-1)/10)*((E-1-99*D)/9) ；D=0.06,E(100环加成率)=4(可能调整)
	--local RoundRefix = D*(round-1) + 1 + floor((round-1) / 10)*((E-1-99*D) / 9)
  local BaseBonusValue = 0
  local RoundRefix = 0

  for i, v in x229022_g_ExpBonusBaseTable do
  	if v.playerLevel == GetLevel(sceneId, selfId) then
  		BaseBonusValue = v.baseExp
  		break
  	end
  end

  for i, v in x229022_g_RoundRefixTable do
  	if v.round == round then
  		RoundRefix = v.refix
  		break
  	end
  end

	--增加玩家Kinh nghi甿
	local exp = BaseBonusValue * RoundRefix
	if exp > expDelta then
		AddExp(sceneId, selfId, expDelta)
	else
		AddExp(sceneId, selfId, exp)
	end
	--Msg2Player(  sceneId, selfId, "你 餴琺到了" .. tostring(exp) .. " 餴琺to� 鸬 Kinh nghi甿奖励.", MSG2PLAYER_PARA )

	return 1
end

function x229022_GetExpBonus(sceneId, selfId)

	local playerLevel = GetLevel(sceneId, selfId)
  local BaseBonusValue = 0
  local RoundRefix = 1

  for i, v in x229022_g_ExpBonusBaseTable do
  	if v.playerLevel == GetLevel(sceneId, selfId) then
  		BaseBonusValue = v.baseExp
  		break
  	end
  end
  --PrintStr("BaseBonusValue=" .. BaseBonusValue )
  local round = GetMissionData(sceneId,selfId,MD_RENWULIAN_HUAN)
  for i, v in x229022_g_RoundRefixTable do
  	if v.round == round then
  		RoundRefix = v.refix
  		break
  	end
  end
  --PrintStr("RoundRefix=" .. RoundRefix )

	return BaseBonusValue * RoundRefix
end

--*******************************************************
--提交任务to� 鸬 公共检测函数
--*******************************************************
function x229022_MissionOnSubmit_Necessary(sceneId, selfId, targetId)
	-- 餴琺到环数
	local round = GetMissionData(sceneId,selfId,MD_RENWULIAN_HUAN)
	if round >= 100 then
		--设置循环任务to� 鸬 时间
		SetMissionData(sceneId,selfId,MD_RENWULIAN_DAYCOUNT,LuaFnGetCurrentTime())
	end
	--记录统计信息
	LuaFnAuditMissionChain(sceneId,selfId,round)

	Msg2Player(  sceneId, selfId, "Ng呓i 疸 ho鄋 t nhi甿 v� li阯 ho鄋 th�" .. tostring(round) .. "V騨g", MSG2PLAYER_PARA )

	--删除该任务
	DelMission(sceneId, selfId, x229022_g_MissionId)

	if round < 100 then
		--继续发送任务
		if x229022_CheckAccept(sceneId,selfId) > 0 then
			x229022_AddMissionDirectly(sceneId, selfId,targetId)
		end
	end
end

--**********************************
--提交
--**********************************
function x229022_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x229022_CheckSubmit( sceneId, selfId ) > 0 then
		local bGoon = 0
		local misIndex = GetMissionIndexByID(sceneId,selfId,x229022_g_MissionId)
		local missionType = GetMissionParam(sceneId, selfId, misIndex, 1)
		if missionType == x229022_g_SubMissionType.wenhou then
			bGoon = 1
		elseif missionType == x229022_g_SubMissionType.chongwu then
			--宠物to� 鸬 分支不T読 x229022_OnSubmit,而喧ngT読 x229022_OnMissionCheck.
		elseif missionType == x229022_g_SubMissionType.suoqu then
			local demandItemId = GetMissionParam(sceneId, selfId, misIndex, x229022_g_StrForePart+1)
			if 1==DelItem(sceneId, selfId, demandItemId, 1) then
				bGoon = 1
			end
		elseif missionType == x229022_g_SubMissionType.fubenjiaoxun then
			bGoon = 1
		end
		if bGoon == 1 then
			--任务奖励计算
			if x229022_MissionBonus(sceneId, selfId) > 0 then
				x229022_MissionOnSubmit_Necessary(sceneId, selfId, targetId)
			end
		end
	end
end

--**********************************
--T読 任务提交时to� 鸬 检测函数
--**********************************
function x229022_My_MissionCheck_Necessary(sceneId, selfId, npcid, scriptId, index1, index2, index3, demandItemId)
	--PrintStr("My_MissionCheck_Necessary...demandItemId=" .. demandItemId)
	local find = CallScriptFunction( 500501, "OnMissionCheck_NecessaryEx", sceneId, selfId, index1, index2, index3, demandItemId )
	local _, strDemandItemName, _ = GetItemInfoByItemId(demandItemId)
	if find < 0 then
		BeginEvent(sceneId)
			local strText = format("Sao ng呓i v鏽 ch遖 餰m %s v� 疬㧟 m� 疸 quay v�?", strDemandItemName)
			AddText(sceneId,strText)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,-1)
		return
	end

	if LuaFnIsItemAvailable(sceneId, selfId, find) > 0 then
		local ret = EraseItem( sceneId, selfId, find )
		if	ret > 0 then
			--任务奖励计算
			if x229022_MissionBonus(sceneId, selfId) == 1 then
				x229022_MissionOnSubmit_Necessary(sceneId, selfId, npcid)
			end
		else
			BeginEvent(sceneId)
				local strText = format("Sao ng呓i v鏽 ch遖 餰m %s v� 疬㧟 m� 疸 quay v�?", strDemandItemName)
				AddText(sceneId,strText)
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,-1)
		end
	else
		BeginEvent(sceneId)
			AddText(sceneId, "V ph c黙 c醕 h� hi畁 kh鬾g d鵱g 疬㧟 ho 疸 b� kh骯.")
		EndEvent( )
		DispatchMissionTips(sceneId,selfId)
		return
	end

end

--************************************************************
--C醝 n鄖 接口含义喧ng错误to� 鸬 ,其实喧ngx229022_OnSubmit只不过喧ng参数不同而已
--这喧ngc醝历史遗留问题,现T読 已经无法改变接口了.
--************************************************************
function x229022_OnMissionCheck( sceneId, selfId, npcid, scriptId, index1, index2, index3, petindex )
	if x229022_CheckSubmit( sceneId, selfId ) > 0 then
		local misIndex = GetMissionIndexByID(sceneId,selfId,x229022_g_MissionId)		-- 餴琺到任务T読 20c醝任务中to� 鸬 序列号
		local missionType = GetMissionParam(sceneId, selfId, misIndex, 1)

		local demandItemId
		if missionType == x229022_g_SubMissionType.suoqu then
			demandItemId = GetMissionParam(sceneId, selfId, misIndex, x229022_g_StrForePart+1)
			--PrintStr("demandItemId=" .. demandItemId)
			x229022_My_MissionCheck_Necessary(sceneId, selfId, npcid, scriptId, index1, index2, index3, demandItemId)
		elseif missionType == x229022_g_SubMissionType.fubenduowu then
			demandItemId = GetMissionParam(sceneId, selfId, misIndex, x229022_g_StrForePart+2)
			x229022_My_MissionCheck_Necessary(sceneId, selfId, npcid, scriptId, index1, index2, index3, demandItemId)
		elseif missionType == x229022_g_SubMissionType.chongwu then
			local demandPetId = GetMissionParam(sceneId, selfId, misIndex, x229022_g_StrForePart+1)
			local petId = LuaFnGetPet_DataID(sceneId, selfId, petindex)
			if petId ~= nil and petId >= 0 then
				if GetPetName(petId) == GetPetName(demandPetId) then
					--任务奖励计算
					if LuaFnIsPetAvailable(sceneId, selfId, petindex) == 1 then
						if x229022_MissionBonus(sceneId, selfId) > 0 then
							LuaFnDeletePet(sceneId, selfId, petindex)
							x229022_MissionOnSubmit_Necessary(sceneId, selfId, npcid)
						end
					else
						BeginEvent(sceneId)
							AddText(sceneId, "Tr鈔 th� ng呓i giao kh鬾g th� d鵱g ho b� kh骯!")
						EndEvent()
						DispatchMissionTips(sceneId, selfId)
					end
				else
					BeginEvent(sceneId)
						AddText(sceneId, "Tr鈔 th� ng呓i giao kh鬾g ch韓h x醕!")
					EndEvent()
					DispatchMissionTips(sceneId, selfId)
				end
			end
		end
	end
end


--**********************************
--杀死怪物或玩家
--**********************************
function x229022_OnKillObject( sceneId, selfId, objdataId ,objId)--参数意思: 场景号、玩家objId、怪物表位置号、怪物objId
	--PrintStr("OnKillObject...")
	local misIndex = GetMissionIndexByID(sceneId,selfId,x229022_g_MissionId)		-- 餴琺到任务T読 20c醝任务中to� 鸬 序列号

	local missionType = GetMissionParam(sceneId, selfId, misIndex, 1)
	if missionType == x229022_g_SubMissionType.suoqu then
		local bStored = GetMissionParam(sceneId, selfId, misIndex, 2)
		if bStored <= 0 then --该任务还没有存储
		if GetMissionParam(sceneId, selfId, misIndex, 0) == 0 then
		local nItemId = GetMissionParam(sceneId, selfId, misIndex, x229022_g_StrForePart+1)
		local playerLevel = GetLevel(sceneId, selfId)
		local targetLevel = GetLevel(sceneId, objId)
		if abs(playerLevel-targetLevel) < 6 then
				local rate = 50
			for i, v in x229022_g_HongyunRateTable do
				if playerLevel <= v.level then
					rate = (1 / v.value) * 10000
					break
				end
			end --endfor

			if random(1000) < rate then --临时to� 鸬 所谓to� 鸬 小几率:(
				AddMonsterDropItem(sceneId, objId, selfId, nItemId)
				end --endif4
			end	--endif3
		end	--endif1
		end
	elseif 	missionType == x229022_g_SubMissionType.fubenjiaoxun then
		-- 取 餴琺C醝 n鄖 怪物死后拥有分配权to� 鸬 人数
		local num = GetMonsterOwnerCount(sceneId,objId)
		--PrintNum(num)
		for i=0,num-1  do
			-- 取 餴琺拥有分配权to� 鸬 人to� 鸬 objId
			local humanObjId = GetMonsterOwnerID(sceneId,objId,i)
			--PrintStr("humanObjId=" .. humanObjId)
			-- 看C醝 n鄖 人喧ng不喧ng有C醝 n鄖 任务
			if IsHaveMission(sceneId, humanObjId, x229022_g_MissionId) > 0 then
				-- 先判断喧ng不喧ng已经Th鯽 m鉵了完成标志
				local misIndex = GetMissionIndexByID(sceneId,humanObjId,x229022_g_MissionId)
				if GetMissionParam(sceneId, humanObjId, misIndex, 0) <=0  then
					local demandKillCount = GetMissionParamEx(sceneId, humanObjId, misIndex, 3, 0)
					--PrintStr("demandKillCount=" .. demandKillCount)
					if CallScriptFunction(229023 , "IsMonsterOfDemanded", sceneId, humanObjId, objdataId) > 0 then
						local killedCount =	GetMissionParamEx(sceneId, humanObjId, misIndex, 3, 1)
						killedCount = killedCount + 1
						SetMissionParamByIndexEx(sceneId, humanObjId, misIndex, 3, 1, killedCount)
						--PrintStr("killedCount=" .. killedCount)
						if killedCount == demandKillCount then
							--PrintStr("Succ...")
							BeginEvent(sceneId)
								SetMissionByIndex(sceneId, humanObjId, misIndex, 0, 1)
								local npcIndex = GetMissionParam(sceneId, humanObjId, misIndex, x229022_g_StrForePart+1)
								local _, npcName = GetNpcInfoByNpcId(sceneId,npcIndex)
								local str = format("Nhi甿 v� d誽 b鋙%s 疸 ho鄋 th鄋h", npcName)
								AddText(sceneId, str)
							EndEvent()
							DispatchMissionTips(sceneId, humanObjId)
						end --if
					end --if
				end --if
			end --if
		end --for
	end	--elseif

end

--**********************************
--进入区域事件
--**********************************
function x229022_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x229022_OnItemChanged( sceneId, selfId, itemdataId )
	local misIndex = GetMissionIndexByID(sceneId,selfId,x229022_g_MissionId)		-- 餴琺到任务T読 20c醝任务中to� 鸬 序列号

	local missionType = GetMissionParam(sceneId, selfId, misIndex, 1)
	local demandItemId = GetMissionParam(sceneId, selfId, misIndex, x229022_g_StrForePart+1)

	if missionType == x229022_g_SubMissionType.suoqu then

		local _, strDemandItemName, _ = GetItemInfoByItemId(demandItemId)
		local _, strItemName, _ = GetItemInfoByItemId(itemdataId)

		if strItemName == strDemandItemName then
			BeginEvent(sceneId)
				strText = format("秀 鹫t t緄 %s", strItemName)
				AddText(sceneId,strText)
			EndEvent(sceneId)

			DispatchMissionTips(sceneId,selfId)
			ResetMissionEvent(sceneId, selfId, x229022_g_MissionId, 2)
			SetMissionByIndex(sceneId, selfId, misIndex, 0, 1)
		end
	end

end

--**********************************
--道具使用
--**********************************
function x229022_OnUseItem( sceneId, selfId, targetId, eventId )
end


--**********************************
--喧ng否喧ng要求to� 鸬 npc
--**********************************
function x229022_IsDemandNpc(sceneId, selfId, objId)
	local misIndex = GetMissionIndexByID(sceneId,selfId,x229022_g_MissionId)		-- 餴琺到任务T読 20c醝任务中to� 鸬 序列号
	local missionType = GetMissionParam(sceneId, selfId, misIndex, 1)
	local npcId
	if missionType == x229022_g_SubMissionType.wenhou or
		 missionType == x229022_g_SubMissionType.fubenjiaoxun then
		npcId = GetMissionParam(sceneId, selfId, misIndex, x229022_g_StrForePart+1)
	elseif missionType == x229022_g_SubMissionType.suoqu or
		 		 missionType == x229022_g_SubMissionType.chongwu	then
 		npcId = GetMissionParam(sceneId, selfId, misIndex, x229022_g_StrForePart+2)
 	else
 		return 0
 	end
	local _, npcName, strNrpcScene, _, _, _, npcSceneId = GetNpcInfoByNpcId(sceneId,npcId)
	--PrintStr(npcName)
	if GetName(sceneId, objId) == npcName
		and npcSceneId == sceneId then
		return 1
	end
	return 0
end

--**********************************
--锁定目标
--**********************************
function x229022_OnLockedTarget(sceneId, selfId, objId )
	--PrintStr("...OnLockedTarget")
	if x229022_IsDemandNpc(sceneId, selfId, objId) ==  1 then
		--TAddText(sceneId, "你终于来了, 我已经等待你好久了!")
		TAddNumText(sceneId, x229022_g_scriptId,x229022_g_MissionName,2,-1,x229022_g_scriptId);

		--local bDone = x229022_CheckSubmit(sceneId, selfId)
		--DispatchMissionDemandInfo(sceneId, selfId, objId, x229022_g_scriptId, x229022_g_MissionId, bDone)
	end
end

--**********************************
--定时事件
--**********************************
function x229022_OnTimer(sceneId,selfId)
	local misIndex = GetMissionIndexByID(sceneId,selfId,x229022_g_MissionId)		-- 餴琺到任务T読 20c醝任务中to� 鸬 序列号
	local leaveSecond = GetMissionParam(sceneId, selfId, misIndex, 7)
	--PrintNum(leaveSecond)

	local bStored = GetMissionParam(sceneId, selfId, misIndex, 2)
	if bStored == 1 then
		--停止任务时钟
		StopMissionTimer(sceneId, selfId, x229022_g_MissionId)
		return
	end

	local currTime = LuaFnGetCurrentTime()
	local acceptTime = GetMissionData(sceneId,selfId,MD_RENWULIAN_ACCPETTIME)
	if (currTime - acceptTime) > 30*60 then
		leaveSecond = 0
	else
		leaveSecond = (30*60 - (currTime - acceptTime))*1000
	end

	--leaveSecond = leaveSecond - 1000
	SetMissionByIndex(sceneId,selfId,misIndex,7,leaveSecond)
	--PrintNum(leaveSecond)

	if leaveSecond <= 0 then
		--停止任务时钟
		StopMissionTimer(sceneId, selfId, x229022_g_MissionId)
		--如果任务已经th b読, 则提示任务th b読并将其从任务列表中删除
		local str = "Nhi甿 v� li阯 ho鄋 th b読, 疸 x骯"
		BeginEvent(sceneId)
			AddText(sceneId, str)
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		Msg2Player(sceneId, selfId, str, MSG2PLAYER_PARA )
		DelMission( sceneId, selfId, x229022_g_MissionId )

		--设置循环任务to� 鸬 时间
		SetMissionData(sceneId,selfId,MD_RENWULIAN_DAYCOUNT,LuaFnGetCurrentTime())
		SetMissionData(sceneId, selfId, MD_RENWULIAN_HUAN, 0)

		return
	end

	if leaveSecond > 10*60000 and leaveSecond < 15*60000 then
		if mod(leaveSecond, 60000) == 0 then
			BeginEvent(sceneId)
				AddText(sceneId, "Trong 20 ph鷗 ng呓i c� th� l遳 nhi甿 v� t緄 ch� #RV呓ng phu nh鈔#W")
			EndEvent()
			DispatchMissionTips(sceneId, selfId)
			return
		end
	end

	if leaveSecond < 60000 then
		BeginEvent(sceneId)
			AddText(sceneId, "Nhi甿 v� li阯 ho鄋 s� �" .. tostring(leaveSecond/1000) .. "Gi鈟 sau th b読")
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		return
	end

end

function x229022_OnPetChanged(sceneId, selfId, petDataId)
	local misIndex = GetMissionIndexByID(sceneId,selfId,x229022_g_MissionId)
	local demandPetDataId = GetMissionParam(sceneId, selfId, misIndex, x229022_g_StrForePart+1)
	if petDataId == nil or petDataId < 0 then
		return
	end
	if demandPetDataId == nil or demandPetDataId < 0 then
		return
	end

	if GetPetName(demandPetDataId) == GetPetName(petDataId) then
		local str = format("C醕 h� 疸 b 疬㧟 tr鈔 th� %s", GetPetName(petDataId))
		BeginEvent(sceneId)
			AddText(sceneId, str)
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		Msg2Player(  sceneId, selfId, str , MSG2PLAYER_PARA )
		SetMissionByIndex(sceneId, selfId, misIndex, 0, 1)
	end

end

