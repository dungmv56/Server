 --Nhi�m v� s� m�n

--MisDescBegin
--�ű���
x229002_g_ScriptId = 229002

--Ti�p th�����NPC����
x229002_g_Position_X=78.2036
x229002_g_Position_Z=95.2641
x229002_g_SceneID=12
x229002_g_AccomplishNPC_Name="Tr߽ng Trung H�nh"

--ǰ������
--g_MissionIdPre =

--M�c ti�u nhi�m v�npc
x229002_g_Name	= "Tr߽ng Trung H�nh"

--�����
x229002_g_MissionId = 1075

--�������
x229002_g_MissionKind = 23

--��ng c�p nhi�m v� 
x229002_g_MissionLevel = 10000

--��ng����ngTinhӢ����
x229002_g_IfMissionElite = 0

--���漸����ng��̬��ʾto� � ����,����T�i �����б��ж�̬��ʾ�������**********************
--������ng���Ѿ����
x229002_g_IsMissionOkFail = 0		--����to� � ��0λ

--������ng��̬**************************************************************

--���������m�t λ�����洢��� �i�m��to� � �ű���

--�����ı�����
x229002_g_MissionName="Nhi�m v� s� m�n"
x229002_g_MissionInfo=""  --��������
x229002_g_MissionTarget = "%f"
x229002_g_ContinueInfo="L�m t�t l�m"		--δHo�n t�t nhi�m v�to� � npc�Ի�
x229002_g_MissionComplete="Vi�c ta giao �� ho�n th�nh ch�a?"					--Ho�n t�t nhi�m v�npc˵��to� � ��
x229002_g_MissionRound=17
x229002_g_DoubleExp = 48
x229002_g_AccomplishCircumstance = 1

x229002_g_ShimenTypeIndex = 1
x229002_g_Parameter_Kill_AllRandom={{id=7,numa=3,numb=3,bytenuma=0,bytenumb=1}}
x229002_g_Parameter_Item_IDRandom={{id=6,num=5}}
x229002_g_NpcIdIndicator={{key=2,npcIdIndex=5},{key=9,npcIdIndex=7}}

--���������ַ�����ʽ��to� � ����
x229002_g_FormatList = {
								"L�u l�m kh�ng g�p %n r�i, nh� qu� �i. ��y %s l� ch�t l�ng th�nh c�a ta, xin ng߽i h�y ��a t�i gi�p ta. #R #e00f000Nh�c nh�: #e000000#r Ng߽i c� th� �n n�i V� �ang t�m #RM�c Th�i Xung #W#{_INFOAIM101,136,12, M�c Th�i Xung}, h�y nh� �ng ta ��a ng߽i t�i c�c th�nh th� l�n.",
								"%i c�a ta sao kh�ng th�y ��u? N�u ng߽i c� th� gi�p ta t�m l�i, ta s� kh�ng b�c ��i ng߽i. #R #e00f000Nh�c nh�: #e000000#r Ng߽i c� th� �n n�i V� �ang t�m #RM�c Th�i Xung #W#{_INFOAIM101,136,12, M�c Th�i Xung}, h�y nh� �ng ta ��a ng߽i t�i c�c th�nh th� l�n.",
								"%n l�m �i�u �c, ta ph�i �i d�y b�o, ��ng ti�c kh�ng c� th�i gian, ng߽i c� th� l�m thay ���c kh�ng? #R #e00f000Nh�c nh�: #e000000#r Ng߽i c� th� �n n�i V� �ang t�m #RM�c Th�i Xung #W#{_INFOAIM101,136,12,M�c Th�i Xung}, h�y nh� �ng ta ��a ng߽i t�i c�c th�nh th� l�n.",
								"Xin ng߽i h�y d�ng %s, � V� �ang %s thu th�p linh kh� trong %s. #R #e00f000Nh�c nh�: #e000000#r khi ng߽i t�i n�i c�n thu th�p linh kh�, �n #gfff0f0Alt+A#g000000 c� th� m� m�c v�t ph�m, �n v�o#gfff0f0\"nhi�m v�\"#g000000giao di�n c� th� m� ra m�c v�t ph�m nhi�m v�, nh�p ph�m ph�i#gfff0f0 T� Kim H� L�#g000000, l� c� th� ho�n th�nh vi�c thu th�p.",
								"Xin ng߽i h�y �i t�m th�y %s, huynh �y s� ��a ng߽i �i th� chi�n %s. #R #e00f000Nh�c nh�: #e000000#r L�m Linh T� s� huynh � n�i V� �ang #{_INFOAIM58,73,12, L�m Linh T�}. ",
								"Xin ng߽i h�y b�t cho ta m�t con %p v�. #R #e00f000Nh�c nh�: #e000000#r V�n H�m Nhi � th�nh L�c D߽ng #{_INFOAIM183,155,0, V�n H�m Nhi} c� th� ��a ng߽i t�i Huy�n V� ��o, nh�ng Huy�n V� ��o c� 1 con �߶ng m�n th�ng qua Th�nh Th� S�n. Ng߽i c� th� b�t tr�n th� m� ta c�n � Huy�n V� ��o ho�c � Th�nh Th� S�n.",
								"Xin ng߽i h�y � n�i V� �ang t�m ki�m 4 ph߽ng, t�m cho ta 5 %s. #R #e00f000Nh�c nh�: #e000000#r Ng߽i c� th� t�m th�y n�t v�ng trong b�n � nh� � g�c ph�i m�n h�nh.",
								"H�y ��a %s t�i 1 c�i %i, l�m xong, ta s� h�u th߷ng cho ng߽i! #R #e00f000Nh�c nh�: #e000000#r Thanh Minh V�n H�c � n�i V� �ang #{_INFOAIM102,108,12, Thanh Minh V�n H�c}. #R C�u Thi�n Th�n H�c � n�i V� �ang #{_INFOAIM86,84,12, C�u Thi�n Th�n H�c}. #R V� K� Th�n H�c � n�i V� �ang #{_INFOAIM74,85,12, V� K� Th�n H�c}. ",
								"�i gi�t ch�t %s %s %n.",
								}

--��ʽ�ַ�����to� � ����, ��ʾ��4��ʼ,�����λ��SetMissionByIndex(...)to� � ���ٶ���
x229002_g_StrForePart=4
x229002_g_ShimenPet_Index = 1

x229002_g_StrList = {
						"T� kim h� l�",
						"Kim �i�n",
						"Gi�i Ki�m Tr� ",
						"H�i Long ��i ",
						"Thi�n Gi�i ",
						"L�m Linh T�",
						"Linh T�nh Phong ph� b�n",
						"V� �ang linh chi",
						"V� �ang th� �",
						"V� �ang nh�n s�m ",
						"Thanh Minh Th�n H�c",
						"C�u Thi�n Th�n H�c",
						"V� C�c Th�n H�c",
						"S�i Mi�u D� Sinh",
						"M�y m� ",
						"0",
						"1",
						"2",
						"3",
						"4",
						"5",
						"6",
						"7",
						"8",
						"9",
						}
--MisDescEnd


--/////////////////////////////////////////////////////////////////////////////////////////////////////

--������to� � ���ʹ��Ŷ���
x229002_g_SubMissionTypeEnum = {XunWu=1, SongXin=2, DingDianYinDao=3, FuBenZhanDou=4, BuZhuo=5, ShouJi=6, KaiGuang=7, otherMenpaiFuben=8,  killMonster=9,}

--�� �i�m����
x229002_g_DingDianYinDaoList = {
											 {menpai=MP_WUDANG   , itemId=40003019, itemName="T� kim h� l�", scene=12, AreaName="Kim �i�n", subAreaName="M�y m� ", posx1=72, posz1=39, posx2=100, posz2=65},
											 {menpai=MP_WUDANG   , itemId=40003019, itemName="T� kim h� l�", scene=12, AreaName="Gi�i Ki�m Tr� ", subAreaName="M�y m� ", posx1=36, posz1=170, posx2=52, posz2=190},
											 {menpai=MP_WUDANG   , itemId=40003019, itemName="T� kim h� l�", scene=12, AreaName="H�i Long ��i ", subAreaName="M�y m� ", posx1=70, posz1=127, posx2=86, posz2=149},
											 {menpai=MP_WUDANG   , itemId=40003019, itemName="T� kim h� l�", scene=12, AreaName="Thi�n Gi�i ", subAreaName="M�y m� ", posx1=42, posz1=64, posx2=50, posz2=89},
											}


--�����б�
x229002_g_FuBen_List = {
								{menpai=MP_WUDANG   , NpcName="L�m Linh T�", scene=12, posx=58, posz=73, FubenName="Linh T�nh Phong ph� b�n"},
								}       

--�ռ�
x229002_g_ShouJiList = {
								{menpai=MP_WUDANG   , scene=12, itemId=40003021, itemName="V� �ang linh chi"},-- count=5},
								{menpai=MP_WUDANG   , scene=12, itemId=40003022, itemName="V� �ang th� �"},-- count=5},
								{menpai=MP_WUDANG   , scene=12, itemId=40003023, itemName="V� �ang nh�n s�m "},-- count=5},
							}	



--�������npc�б�
x229002_g_AbilityNpcList = {
                    {menpai=MP_WUDANG   ,npcList={{name="Thanh Minh Th�n H�c", scene=12, x=102, z=108},
                                                  {name="C�u Thi�n Th�n H�c", scene=12, x=87, z=85},
                                                  {name="V� C�c Th�n H�c", scene=12, x=75, z=85}}
										},
									}

										
--�����б�
x229002_g_PetList = {
						{petDataId=3000, petName="S�i Mi�u D� Sinh", takeLevel=10},
					}

--ɱ�����
x229002_g_MenpaiYiWuList = {
								{menpainame="Thi�u L�m", menpai=MP_SHAOLIN  , itemName="е �i�p c�a Thi�u L�m � t�", scene=9,  itemId=40004306},
								{menpainame="Thi�n Long", menpai=MP_DALI     , itemName="�n ch߽ng c�a Thi�n Long � t�", scene=13, itemId=40004312},
								{menpainame="Nga My", menpai=MP_EMEI     , itemName="Ki�m tu� c�a Nga My � t�", scene=15, itemId=40004310},
								{menpainame="C�i Bang", menpai=MP_GAIBANG  , itemName="T�i v�i c�a C�i Bang � t�", scene=10, itemId=40004307},
								{menpainame="Minh Gi�o", menpai=MP_MINGJIAO , itemName="H�a l�nh c�a Minh Gi�o � t�", scene=11, itemId=40004308},
								{menpainame="Thi�n S�n", menpai=MP_TIANSHAN , itemName="B�ng b�i c�a Thi�n S�n � t�", scene=17, itemId=40004314},
								{menpainame="V� �ang", menpai=MP_WUDANG   , itemName="Ph�t tr�n c�a V� �ang � t�", scene=12, itemId=40004309},
								{menpainame="Ti�u Dao", menpai=MP_XIAOYAO  , itemName="Ti�u tr� c�a Ti�u Dao � t�", scene=14, itemId=40004313},
								{menpainame="Tinh T�c", menpai=MP_XINGSU   , itemName="C� m�nh c�a Tinh T�c � t�", scene=16, itemId=40004311},
							}
	
--�����������to� � �������ñ�
x229002_g_RateOfDropYiWuTable = {
							{playerLevel=20, dropRate=30},
							{playerLevel=30, dropRate=30},
							{playerLevel=40, dropRate=25},
							{playerLevel=50, dropRate=25},
							{playerLevel=60, dropRate=25},
							{playerLevel=70, dropRate=20},
							{playerLevel=80, dropRate=20},
							{playerLevel=90, dropRate=20},
							{playerLevel=100, dropRate=20},
							{playerLevel=110, dropRate=20},
							{playerLevel=120, dropRate=20},
							{playerLevel=130, dropRate=20},
							{playerLevel=140, dropRate=20},
							{playerLevel=150, dropRate=20},
						}
 
x229002_g_DemandKillcountTable = 	{
							{levelBegin=10, levelEnd=19, killcount=20},
							{levelBegin=20, levelEnd=39, killcount=25},
							{levelBegin=40, levelEnd=59, killcount=30},
							{levelBegin=60, levelEnd=79, killcount=35},
							{levelBegin=80, levelEnd=99, killcount=40},
							{levelBegin=100, levelEnd=109, killcount=45},
							{levelBegin=110, levelEnd=119, killcount=50},
							{levelBegin=120, levelEnd=150, killcount=55},
}						

--//////////////////////////////////////////////////////
--ɱ�����
function x229002_GetMenpaiYiWuInfo(sceneId, selfId)
	for i, v in x229002_g_MenpaiYiWuList do
		if v.menpai == GetMenPai(sceneId, selfId) then
			return v.menpainame, v.itemName, v.itemId
		end
	end
end

function x229002_GetRateOfDropYiWu(sceneId, selfId)
	local playerLevel = GetLevel(sceneId, selfId)
	for i, v in x229002_g_RateOfDropYiWuTable do
		if v.playerLevel >= playerLevel and playerLevel < v.playerLevel then
			return v.dropRate
		end
	end
end
function x229002_GetDemandKillCount(sceneId, selfId)
	local playerLevel = GetLevel(sceneId, selfId)
	for i, v in x229002_g_DemandKillcountTable do
		if playerLevel >= v.levelBegin and playerLevel <= v.levelEnd then
			return v.killcount
		end
	end
end


function x229002_KillMonster_Accept(sceneId, selfId)--ɱ��
	
	local nMonsterId, strMonsterName, strMonsterScene, nScene, nPosX, nPosZ, strDesc, nSex, level
	local playerLevel = GetLevel(sceneId, selfId)
	for i=1, 100 do
		nMonsterId, strMonsterName, strMonsterScene, nScene, nPosX, nPosZ, strDesc, nSex, level = GetOneMissionNpc(43)
		if abs(level - playerLevel) < 3  then
			break
		end
		if i == 100 then
			--ͳͳ����ȥ:((
			x229002_SongXin_Accept(sceneId, selfId)
			return
		end
	end	
	
	--������������б�
	local bAdd = AddMission( sceneId,selfId, x229002_g_MissionId, x229002_g_ScriptId, 1, 0, 1 )
	if bAdd < 1 then
		return
	end	
	local killcount = x229002_GetDemandKillCount(sceneId, selfId)
	local countpart1 = x229002_GetStrIndexByStrValue(tostring(floor(killcount / 10)) )
	local countpart2 = x229002_GetStrIndexByStrValue(tostring(floor(mod(killcount, 10))) )
	
	-- �i�m������T�i 20c�i������to� � ���к�
	local misIndex = GetMissionIndexByID(sceneId,selfId,x229002_g_MissionId)
	
	SetMissionByIndex(sceneId, selfId, misIndex, 0, 0) --����������ng�����(δ���)
	SetMissionByIndex(sceneId, selfId, misIndex, 1, x229002_g_SubMissionTypeEnum.killMonster)
	
	SetMissionParamByIndexEx(sceneId, selfId, misIndex, 3, 0, killcount) --Ҫ��ɱ��to� � monster����, ��T�i ��û�и�ֵ
	SetMissionParamByIndexEx(sceneId, selfId, misIndex, 3, 1, 0) --�� gi�t ch�t to� � monster����
	
	SetMissionByIndex(sceneId, selfId, misIndex, x229002_g_StrForePart, 8)--formet�ַ�������
	SetMissionByIndex(sceneId, selfId, misIndex, x229002_g_StrForePart+1, countpart1)
	SetMissionByIndex(sceneId, selfId, misIndex, x229002_g_StrForePart+2, countpart2)
	SetMissionByIndex(sceneId, selfId, misIndex, x229002_g_StrForePart+3, nMonsterId)
		
	Msg2Player(  sceneId, selfId,"#YNh�n nhi�m v�: Nhi�m v� s� m�n", MSG2PLAYER_PARA )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskThePos", sceneId, selfId, nScene, nPosX, nPosZ, strMonsterName)
	
	local strMissionTarget = format("G�n ��y � khu v�c %s %s th߶ng qu�y nhi�u c� d�n xung quanh, ng߽i h�y nh�n l�nh �i tr�ng ph�t ch�ng.", 
						strMonsterScene, strMonsterName)
	AddText(sceneId, strMissionTarget)

end

--//////////////////////////////////////////////////////


function x229002_GetStrIndexByStrValue(stringV)
	for i, v in x229002_g_StrList do
		if v == stringV then
			return i-1
		end
	end
	local strText = format("C�n ph�i %s ��ng k� StrList trong", stringV)
	----PrintStr(strText)
	return 0;
end

--/////////////////////////////////////////////////////////////////////////////////////////////////////
--��ȡ����itemto� � ��ϸ��Ϣ
function x229002_GetItemDetailInfo(itemId)
	local itemId, itemName, itemDesc = GetItemInfoByItemId(itemId)
	if itemId == -1 then
		local strText = format("%s V�t ph�m � 'MissionItem_HashTable.txt' kh�ng t�m th�y!!", itemName)
		PrintStr(strText)
	end
	return itemId, itemName, itemDesc
end	
--/////////////////////////////////////////////////////////////////////////////////////////////////////
--������ҵ�c�p �i�m����ӦMissionItem_HashTable.txt��to� � ��Ԫ����
function x229002_GetMissionItemIndex(sceneId, selfId)
	local nPlayerLevel  = GetLevel(sceneId, selfId)
	if nPlayerLevel >= 10 and nPlayerLevel < 20 then
		return 0;
	elseif nPlayerLevel >= 20 and nPlayerLevel < 30 then
		return 1;
	elseif nPlayerLevel >= 30 and nPlayerLevel < 40 then
		return 2;
	elseif nPlayerLevel >= 40 and nPlayerLevel < 60 then
		return 3;
	elseif nPlayerLevel >= 60 and nPlayerLevel < 80 then
		return 4;
	elseif nPlayerLevel >= 80 and nPlayerLevel < 100 then
		return 5;
	elseif nPlayerLevel >= 100 and nPlayerLevel < 120 then
		return 167;
	elseif nPlayerLevel >= 100 then
		return 168;
	end
end

--������ҵ�c�p �i�m����Ӧto� � Nhi�m v� s� m�nto� � �׶�
--������ҵ�c�p �i�m����ӦMissionNPC_HashTable.txt��to� � ��Ԫ����
function x229002_GetShiMenPhaseByPlayerLevel(sceneId, selfId)
	local nPlayerLevel  = GetLevel(sceneId, selfId)
	if nPlayerLevel >= 10 and nPlayerLevel < 20 then
		return 0
	elseif nPlayerLevel >= 20 and nPlayerLevel < 40 then
		return 1
	elseif nPlayerLevel >= 40 and nPlayerLevel < 60 then
		return 2
	elseif nPlayerLevel >= 60 and nPlayerLevel < 80 then 
		return 3
	elseif nPlayerLevel >= 80 and nPlayerLevel < 100 then 
		return 4
	elseif nPlayerLevel >= 100 and nPlayerLevel < 120 then 
		return 243
	elseif nPlayerLevel >= 120 then
		return 244
	end
end
--/////////////////////////////////////////////////////////////////////////////////////////////////////
function x229002_RandomSubMission(sceneId, selfId)
 
	--Ѱ��(1/4)������(1/16)���ռ�(1/16)������(1/16)���� �i�m����(1/16)��Cu�c chi�n ����(1/4)����׽(1/4)
	local nRet = 1 + LuaFnGetHumanShimenRandom(sceneId, selfId);
	if nRet then
		if nRet <= 4 then
			x229002_XunWu_Accept(sceneId, selfId)
		elseif nRet <= 5 then
			x229002_SongXin_Accept(sceneId, selfId)
		elseif nRet <= 6 then
			x229002_ShouJi_Accept(sceneId, selfId)
		elseif nRet <= 7 then
			x229002_SongXin_Accept(sceneId, selfId)
		elseif nRet <= 8 then
			x229002_DingDianYinDao_Accept(sceneId, selfId)
		elseif nRet <= 12 then
			x229002_FuBenZhanDou_Accept(sceneId, selfId)
		elseif nRet <= 16 then
			x229002_BuZhuo_Accept(sceneId, selfId)
		else
			return -1
		end
	else
		return -1;
	end
end
--**********************************
--������ҵ�c�p �i�m������to� � ��c�p�׶�(1~5)
--**********************************
function x229002_DoSomethingByPlayerLevel(sceneId, selfId)
	CallScriptFunction(229000, "DoSomethingByPlayerLevel", sceneId, selfId, x229002_g_ScriptId)
end

--/////////////////////////////////////////////////////////////////////////////////////////////////////
function x229002_XunWu_Accept(sceneId, selfId)--Ѱ��
	------PrintStr("XunWu_Accept..")
	--������������б�
	local bAdd = AddMission( sceneId,selfId, x229002_g_MissionId, x229002_g_ScriptId, 0, 0, 1 )
	if bAdd < 1 then
		return
	end	
	
	
	local nitemId, strItemName, strItemDesc = GetOneMissionItem(x229002_GetMissionItemIndex(sceneId, selfId))
	Msg2Player(sceneId, selfId, "#YNh�n nhi�m v�: Nhi�m v� s� m�n", MSG2PLAYER_PARA )
	--print(nitemId, strItemName, strItemDesc)
	-- �i�m������T�i 20c�i������to� � ���к�
	local misIndex = GetMissionIndexByID(sceneId,selfId,x229002_g_MissionId)
	
	SetMissionByIndex(sceneId, selfId, misIndex, 0, 0) --����������ng�����(δ���)
	SetMissionByIndex(sceneId, selfId, misIndex, 1, x229002_g_SubMissionTypeEnum.XunWu)
	
	SetMissionByIndex(sceneId, selfId, misIndex, x229002_g_StrForePart, 1)--formet�ַ�������
	SetMissionByIndex(sceneId, selfId, misIndex, x229002_g_StrForePart+1, nitemId)
	
	local strMissionTarget = format("%s c�a ta sao kh�ng th�y ��u? N�u ng߽i c� th� gi�p ta t�m l�i, ta s� kh�ng b�c ��i ng߽i.", strItemName)
	AddText(sceneId, strMissionTarget)
	
	--����������to� � ������ng���Ѿ�Th�a m�n�������
	local bHaveItem = HaveItem(sceneId, selfId, nitemId)
	if bHaveItem == 1 then
		SetMissionByIndex(sceneId,selfId,misIndex,0,1)					--��������ɱ�־��Ϊ1
		ResetMissionEvent(sceneId, selfId, x229002_g_MissionId, 2)
	end	
	
end	

--/////////////////////////////////////////////////////////////////////////////////////////////////////

function x229002_SongXin_Accept(sceneId, selfId)--����

  local roll = random(3)
	--���ѡ��������to� � �ز����,ÿc�i����3���ز�
	x229002_g_Xin_ItemId = x229002_g_ShouJiList[ roll ].itemId
	
	--���������			
	BeginAddItem(sceneId)
		AddItem(sceneId, x229002_g_Xin_ItemId, 1)
	local bAdd = EndAddItem(sceneId, selfId)
	if bAdd < 1 then
		return
	end	
	
	--������������б�
	bAdd = AddMission( sceneId,selfId, x229002_g_MissionId, x229002_g_ScriptId, 0, 0, 0 )
	if bAdd < 1 then
		return
	end	
	AddItemListToHuman(sceneId, selfId)
	--Ѱ��, ��������� gi�y���Ŀ��NPCto� � �¼�Flag
	SetMissionEvent(sceneId, selfId, x229002_g_MissionId, 4)
	

	local nPhase = x229002_GetShiMenPhaseByPlayerLevel(sceneId, selfId)
	local nNpcId, strNpcName, strNpcScene, nSceneId, nPosX, nPosZ, strNPCDesc = GetOneMissionNpc(nPhase)
	--print(nNpcId, strNpcName, strNpcScene, nSceneId, nPosX, nPosZ, strNPCDesc)
	Msg2Player(  sceneId, selfId,"#YNh�n nhi�m v�: Nhi�m v� s� m�n", MSG2PLAYER_PARA )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, nSceneId, nPosX, nPosZ, strNpcName)
		
	-- �i�m������T�i 20c�i������to� � ���к�
	local misIndex = GetMissionIndexByID(sceneId,selfId,x229002_g_MissionId)
	
	SetMissionByIndex(sceneId, selfId, misIndex, 0, 0) --����������ng�����(δ���)
	SetMissionByIndex(sceneId, selfId, misIndex, 1, x229002_g_SubMissionTypeEnum.SongXin)
	
	SetMissionByIndex(sceneId, selfId, misIndex, x229002_g_StrForePart, 0)--formet�ַ�������
	SetMissionByIndex(sceneId, selfId, misIndex, x229002_g_StrForePart+1, nNpcId)

	local ListIndex = x229002_GetStrIndexByStrValue( x229002_g_ShouJiList[ roll ].itemName )
	SetMissionByIndex(sceneId, selfId, misIndex, x229002_g_StrForePart+2, ListIndex )

  SetMissionByIndex(sceneId, selfId, misIndex, x229002_g_StrForePart+3, x229002_g_Xin_ItemId )
  
	local strMissionTarget = format("L�u l�m kh�ng g�p %s %s, ng߽i h�y gi�p ta �em %s giao cho ng߶i �y.", strNpcScene, strNpcName, x229002_g_ShouJiList[ roll ].itemName )
	AddText(sceneId, strMissionTarget)
	
end

--/////////////////////////////////////////////////////////////////////////////////////////////////////
function x229002_DingDianYinDao_Accept(sceneId, selfId)--�� �i�m����
	-- ��t ���c���to� � ����
	local playerMenpai = GetMenPai(sceneId, selfId)
	local a = {}
	local index = 1
	--��m�t c�i��ʱ�����洢��Ӧ����T�i x229002_g_DingDianYinDaoList��to� � ȫ������
	for i, v in x229002_g_DingDianYinDaoList do
		if v.menpai == playerMenpai then
			a[index] = i
			index = index + 1
		end
	end
	
	local ct = getn(a)
	if ct <= 0 then
		return 0
	end
		
	local ret = random(ct)
	BeginAddItem(sceneId)
		AddItem(sceneId, x229002_g_DingDianYinDaoList[a[ret]].itemId, 1)
	local bAdd = EndAddItem(sceneId,selfId)
	if bAdd < 1 then
		return
	end	
	
	--������������б�
	bAdd = AddMission( sceneId,selfId, x229002_g_MissionId, x229002_g_ScriptId, 0, 0, 0 )
	if bAdd < 1 then
		return 
	end	
	AddItemListToHuman(sceneId, selfId)
	Msg2Player(  sceneId, selfId,"#YNg߽i �� ��t ���c 1 chi�c " .. x229002_g_DingDianYinDaoList[a[ret]].itemName, MSG2PLAYER_PARA )
	
	local strIndex_Area = x229002_GetStrIndexByStrValue(x229002_g_DingDianYinDaoList[a[ret]].AreaName)
	local strIndex_Item = x229002_GetStrIndexByStrValue(x229002_g_DingDianYinDaoList[a[ret]].itemName)
	local	strIndex_subArea = x229002_GetStrIndexByStrValue(x229002_g_DingDianYinDaoList[a[ret]].subAreaName)
	
	local x1 = x229002_g_DingDianYinDaoList[a[ret]].posx1
	local x2 = x229002_g_DingDianYinDaoList[a[ret]].posx2
	local z1 = x229002_g_DingDianYinDaoList[a[ret]].posz1
	local z2 = x229002_g_DingDianYinDaoList[a[ret]].posz2
	local scene = x229002_g_DingDianYinDaoList[a[ret]].scene
	local tip = x229002_g_DingDianYinDaoList[a[ret]].AreaName .. x229002_g_DingDianYinDaoList[a[ret]].subAreaName
	local x = x1 + (x2-x1)/2
	local z = z1 + (z2-z1)/2
	
	-- �i�m������T�i 20c�i������to� � ���к�
	local misIndex = GetMissionIndexByID(sceneId,selfId,x229002_g_MissionId)
		
	SetMissionByIndex(sceneId, selfId, misIndex, 0, 0) --����������ng�����(δ���)
	SetMissionByIndex(sceneId, selfId, misIndex, 1, x229002_g_SubMissionTypeEnum.DingDianYinDao)
	SetMissionByIndex(sceneId, selfId, misIndex, 2, a[ret]) --���ö� �i�m�����б���to� � ����
	
	SetMissionByIndex(sceneId, selfId, misIndex, x229002_g_StrForePart, 3)--formet�ַ�������
	SetMissionByIndex(sceneId, selfId, misIndex, x229002_g_StrForePart+1, strIndex_Item)
	SetMissionByIndex(sceneId, selfId, misIndex, x229002_g_StrForePart+2, strIndex_Area)
	SetMissionByIndex(sceneId, selfId, misIndex, x229002_g_StrForePart+3, strIndex_subArea)
	
	Msg2Player(  sceneId, selfId,"#YNh�n nhi�m v�: Nhi�m v� s� m�n", MSG2PLAYER_PARA )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskThePos", sceneId, selfId, scene, x, z, tip)

	local strMissionTarget = format("Xin ng߽i h�y d�ng %s, � V� �ang %s thu th�p linh kh� c�a %s.", 
		x229002_g_DingDianYinDaoList[a[ret]].itemName,
		x229002_g_DingDianYinDaoList[a[ret]].AreaName,
		x229002_g_DingDianYinDaoList[a[ret]].subAreaName )   
		
	AddText(sceneId, strMissionTarget)
	
end

--/////////////////////////////////////////////////////////////////////////////////////////////////////
function x229002_FuBenZhanDou_Accept(sceneId, selfId)--Cu�c chi�n ����
	local playerMenpai = GetMenPai(sceneId, selfId)
	if playerMenpai == MP_WUMENPAI then
		return 0
	end	

	local npcName, fubenName, nSceneId, posx, posz
	for i, v in x229002_g_FuBen_List do
		if v.menpai == GetMenPai(sceneId, selfId) then
			npcName =  v.NpcName
			fubenName =  v.FubenName
			nSceneId = v.scene
			posx = v.posx
			posz = v.posz
			break
		end
	end

	--������������б�
	local bAdd = AddMission( sceneId,selfId, x229002_g_MissionId, x229002_g_ScriptId, 0, 0, 0 )
	if bAdd < 1 then
		return
	end	
	
	
	local nFormatIndex = GetMissionCacheData(sceneId, selfId, 0)
	local i = GetMissionCacheData(sceneId, selfId, 2)
	local NpcNameIndex = x229002_GetStrIndexByStrValue(npcName)
	local FubenNameIndex = x229002_GetStrIndexByStrValue(fubenName)
	
	-- �i�m������T�i 20c�i������to� � ���к�
	local misIndex = GetMissionIndexByID(sceneId,selfId,x229002_g_MissionId)
		
	SetMissionByIndex(sceneId, selfId, misIndex, 0, 0) --����������ng�����(δ���)
	SetMissionByIndex(sceneId, selfId, misIndex, 1, x229002_g_SubMissionTypeEnum.FuBenZhanDou)
	
	SetMissionByIndex(sceneId, selfId, misIndex, x229002_g_StrForePart, 4)
	SetMissionByIndex(sceneId, selfId, misIndex, x229002_g_StrForePart+1, NpcNameIndex)
	SetMissionByIndex(sceneId, selfId, misIndex, x229002_g_StrForePart+2, FubenNameIndex)
	
	Msg2Player(  sceneId, selfId,"#YNh�n nhi�m v�: Nhi�m v� s� m�n", MSG2PLAYER_PARA )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, nSceneId, posx, posz, npcName)

	local strMissionTarget = format("Xin ng߽i h�y �i t�m %s, ng߶i s� ��a ng߽i �i th� chi�n %s.", npcName, fubenName)
	AddText(sceneId, strMissionTarget)
end

--/////////////////////////////////////////////////////////////////////////////////////////////////////
function x229002_BuZhuo_Accept(sceneId, selfId)--��׽
	local playerLevel = GetLevel(sceneId, selfId)
	local petId, petName, petDesc, takeLevel
	local petHashIndex = CallScriptFunction(229000, "GetMissionPetIndex", sceneId, selfId)
	for i = 1, 100 do
		petId, petName, petDesc = GetOneMissionPet(petHashIndex)
		takeLevel = GetPetTakeLevel(petId)
		if playerLevel > takeLevel  then
			break
		end
		if i == 100 then
			--ͳͳ����ȥ:((
			x229002_SongXin_Accept(sceneId, selfId)
		end
	end	
	--������������б�
	local bAdd = AddMission( sceneId,selfId, x229002_g_MissionId, x229002_g_ScriptId, 0, 0, 0 )
	if bAdd < 1 then
		return
	end	
	
	
	SetMissionEvent(sceneId, selfId, x229002_g_MissionId, 3)
	
	-- �i�m������T�i 20c�i������to� � ���к�
	local misIndex = GetMissionIndexByID(sceneId,selfId,x229002_g_MissionId)
	
	SetMissionByIndex(sceneId, selfId, misIndex, 0, 0) --����������ng�����(δ���)
	SetMissionByIndex(sceneId, selfId, misIndex, 1, x229002_g_SubMissionTypeEnum.BuZhuo)
	
	SetMissionByIndex(sceneId, selfId, misIndex, x229002_g_StrForePart, 5)--formet�ַ�������
	SetMissionByIndex(sceneId, selfId, misIndex, x229002_g_StrForePart+1, petId)
		
	Msg2Player(  sceneId, selfId,"#YNh�n nhi�m v�: Nhi�m v� s� m�n", MSG2PLAYER_PARA )
	
	local strMissionTarget = format("Xin ng߽i h�y b�t cho ta m�t con %s v�.", petName)
	AddText(sceneId, strMissionTarget)
	
	--����������to� � ������ng���Ѿ�Th�a m�n�������
	for i=0, 6 do
		local petDataId = LuaFnGetPet_DataID(sceneId,selfId,i)
		if petDataId == petId then
			SetMissionByIndex(sceneId,selfId,misIndex,0,1)					--��������ɱ�־��Ϊ1

			ResetMissionEvent(sceneId, selfId, x229002_g_MissionId, 3)
			break
		end	
	end	

end
--/////////////////////////////////////////////////////////////////////////////////////////////////////
function x229002_ShouJi_Accept(sceneId, selfId)--�ռ�
	----PrintStr("ShouJi_Accept...")
	local playerMenpai = GetMenPai(sceneId, selfId)
	if playerMenpai == MP_WUMENPAI then
		return 0
	end	
	----PrintStr("playerMenpai="..playerMenpai)
	local a = {}
	local index = 1
	for i, v in x229002_g_ShouJiList do
		if v.menpai == playerMenpai then
			----PrintStr("find...")
			a[index] = i
			index = index + 1
		end	
	end
	local ct = getn(a)
	----PrintStr("ct="..ct)
	if ct <= 0 then
		return 0
	end
	
	local ret = random(ct)
	--������������б�
	local bAdd = AddMission( sceneId,selfId, x229002_g_MissionId, x229002_g_ScriptId, 0, 0, 1 )
	if bAdd < 1 then
		return
	end	
	
	
	local itemNameIndex = x229002_GetStrIndexByStrValue(x229002_g_ShouJiList[a[ret]].itemName)
	-- �i�m������T�i 20c�i������to� � ���к�
	local misIndex = GetMissionIndexByID(sceneId,selfId,x229002_g_MissionId)
	
	SetMissionByIndex(sceneId, selfId, misIndex, 0, 0) --����������ng�����(δ���)
	SetMissionByIndex(sceneId, selfId, misIndex, 1, x229002_g_SubMissionTypeEnum.ShouJi)
	
	SetMissionByIndex(sceneId, selfId, misIndex, x229002_g_StrForePart, 6)--formet�ַ�������
	SetMissionByIndex(sceneId, selfId, misIndex, x229002_g_StrForePart+1, itemNameIndex)
	SetMissionByIndex(sceneId, selfId, misIndex, x229002_g_StrForePart+2, x229002_g_ShouJiList[a[ret]].itemId)
		
	Msg2Player(  sceneId, selfId,"#YNh�n nhi�m v�: Nhi�m v� s� m�n", MSG2PLAYER_PARA )
	
	local strMissionTarget = format("Xin ng߽i h�y gi�p ta ki�m 5 %s v�.", x229002_g_ShouJiList[a[ret]].itemName)
	AddText(sceneId, strMissionTarget)
end
--/////////////////////////////////////////////////////////////////////////////////////////////////////
function x229002_Ability_Accept(sceneId, selfId)--����
	----PrintStr("Ability_Accept...")
	--local nPhase = x229002_GetShiMenPhaseByPlayerLevel(sceneId, selfId)
	--local nNpcId, strNpcName, strNpcScene, nSceneId, nPosX, nPosZ, strNPCDesc = GetOneMissionNpc(nPhase-1)
	local strNpcName, scene, x, z
	for i, v in x229002_g_AbilityNpcList do
		if v.menpai == GetMenPai(sceneId, selfId) then
			local ct = getn(v.npcList)
			local index =	random(ct)
			strNpcName = v.npcList[index].name
			scene = v.npcList[index].scene
			x = v.npcList[index].x
			z = v.npcList[index].z
		end
	end
	
	local strNpcIndex = x229002_GetStrIndexByStrValue(strNpcName)
	local itemId, itemName = GetMenpaiItem(sceneId, selfId)


	------PrintStr("itemId="..itemId.."  itemName="..itemName)
	--������������б�
	local bAdd = AddMission( sceneId,selfId, x229002_g_MissionId, x229002_g_ScriptId, 0, 0, 0 )
	if bAdd < 1 then
		return
	end	
	
	SetMissionEvent(sceneId, selfId, x229002_g_MissionId, 2)		
	SetMissionEvent(sceneId, selfId, x229002_g_MissionId, 4)
	
	-- �i�m������T�i 20c�i������to� � ���к�
	local misIndex = GetMissionIndexByID(sceneId,selfId,x229002_g_MissionId)
	
	SetMissionByIndex(sceneId, selfId, misIndex, 0, 0) --����������ng�����(δ���)
	SetMissionByIndex(sceneId, selfId, misIndex, 1, x229002_g_SubMissionTypeEnum.KaiGuang)
	
	SetMissionByIndex(sceneId, selfId, misIndex, x229002_g_StrForePart, 7)--formet�ַ�������
	SetMissionByIndex(sceneId, selfId, misIndex, x229002_g_StrForePart+1, strNpcIndex)
	SetMissionByIndex(sceneId, selfId, misIndex, x229002_g_StrForePart+2, itemId)
		
	Msg2Player(  sceneId, selfId,"#YNh�n nhi�m v�: Nhi�m v� s� m�n", MSG2PLAYER_PARA )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, scene, x, z, strNpcName)
	
	local strMissionTarget = format("H�y ��a %scho%s, ta s� h�u ��i ng߽i!", strNpcName, itemName)
	AddText(sceneId, strMissionTarget)

end
--/////////////////////////////////////////////////////////////////////////////////////////////////////
--**********************************
--������ں���
--**********************************
function x229002_OnDefaultEvent( sceneId, selfId, targetId )	-- �i�m���������ִ�д˽ű�
	------PrintStr("OnDefaultEvent...")
	--������������to� � ��Ϣ
	if IsHaveMission(sceneId,selfId,x229002_g_MissionId) > 0 then
		if GetName(sceneId, targetId) == x229002_g_Name then
			--������������to� � ��Ϣ
			BeginEvent(sceneId)
				AddText(sceneId, x229002_g_MissionName)
				AddText(sceneId, "Vi�c ta giao �� ho�n th�nh ch�a?")
			EndEvent( )
			bDone = x229002_CheckSubmit( sceneId, selfId )
			DispatchMissionDemandInfo(sceneId, selfId, targetId, x229002_g_ScriptId, x229002_g_MissionId, bDone)
		else
			local misIndex = GetMissionIndexByID(sceneId,selfId,x229002_g_MissionId)
			
			local demandItemId =0
			local missionType = GetMissionParam(sceneId, selfId, misIndex, 1)
			if missionType == x229002_g_SubMissionTypeEnum.SongXin then
			    demandItemId = GetMissionParam(sceneId, selfId, misIndex, x229002_g_StrForePart+3)
			else
			    demandItemId = GetMissionParam(sceneId, selfId, misIndex, x229002_g_StrForePart+2)
			end	
			
			local _, strDemandItemName, _ = x229002_GetItemDetailInfo(demandItemId)
			
			local bHaveItem = HaveItem(sceneId, selfId, demandItemId)
			if bHaveItem == 1 then
				if LuaFnGetAvailableItemCount(sceneId, selfId, demandItemId) >= 1 then
				DelItem(sceneId, selfId, demandItemId, 1)
				BeginEvent(sceneId)
					AddText(sceneId, "Xin c�c h� quay v� n�i v�i S� ph� c�a c�c h�, t�i h� r�t nh� s� ph� c�a c�c h�, r�t c�m �n s� ph� c�a c�c h� t�ng m�n qu� n�y cho t�i h�, ��y l� th� m� t�i h� �ang mu�n c� ���c.")
				EndEvent()
				DispatchEventList(sceneId, selfId, targetId)	
				--���������Ѿ����
				SetMissionByIndex(sceneId, selfId, misIndex, 0, 1)
				ResetMissionEvent(sceneId, selfId, x229002_g_MissionId, 4)
				return 1;
			else
				BeginEvent(sceneId)
						AddText(sceneId, "V�t ph�m c�a c�c h� hi�n kh�ng d�ng ���c ho�c �� b� kh�a.")
					EndEvent( )
					DispatchMissionTips(sceneId,selfId)	
					return	
				end
			else
				BeginEvent(sceneId)
					AddText(sceneId, "�� mang t�i th� ta c�n ch�a?")
				EndEvent()
				DispatchEventList(sceneId, selfId, targetId)	
				return 1;					
			end
		end
	elseif x229002_CheckAccept(sceneId,selfId) > 0 then
		BeginEvent(sceneId)
		
			AddText(sceneId,x229002_g_MissionName)
			AddText(sceneId,x229002_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}#r")
			
			x229002_DoSomethingByPlayerLevel(sceneId, selfId)
			--��֤��m�t �νӵ�to� � ��������ng�̶�����to� � 
			--ResetMissionCacheData(sceneId, selfId)
			--SetMissionCacheData(sceneId, selfId, 0, 0) --formet�ַ�������
			--SetMissionCacheData(sceneId, selfId, 1, x229002_g_SubMissionTypeEnum.SongXin)
			--SetMissionCacheData(sceneId, selfId, 2, 100001) --����human���ϵ�0λ��������
			--SetMissionCacheData(sceneId, selfId, 7, 1) --��ng����ng��m�t ��
			
			--strMissionTarget = format("�þ�û�м�%s��,������ʺ�m�t ����ȥ", "frankwu")
			--AddText(sceneId, strMissionTarget)

			--������������б�
			--AddMission( sceneId,selfId, x229002_g_MissionId, x229002_g_ScriptId, 0, 0, 0 )
			--Ѱ��, ��������� gi�y���Ŀ��NPCto� � �¼�Flag
			--SetMissionEvent(sceneId, selfId, x229002_g_MissionId, 4)

			--local _, strNpcName, strNpcScene, PosX, PosZ, _ = GetNpcInfoByNpcId(sceneId,100001)
			--Msg2Player(  sceneId, selfId,"#YNh�n nhi�m v�: Nhi�m v� s� m�n", MSG2PLAYER_PARA )
			--CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, nSceneId, PosX, PosZ, strNpcName)
				
			-- �i�m������T�i 20c�i������to� � ���к�
			--local misIndex = GetMissionIndexByID(sceneId,selfId,x229002_g_MissionId)
			
			--SetMissionByIndex(sceneId, selfId, misIndex, 0, 0) --����������ng�����(δ���)
			--SetMissionByIndex(sceneId, selfId, misIndex, 1, x229002_g_SubMissionTypeEnum.SongXin)
			
			--SetMissionByIndex(sceneId, selfId, misIndex, x229002_g_StrForePart, 0)--formet�ַ�������
			--SetMissionByIndex(sceneId, selfId, misIndex, x229002_g_StrForePart+1, 100001)
		
			
		EndEvent( )
		DispatchEventList(sceneId,selfId,targetId)
	end
	
end

--**********************************
--�о��¼�
--**********************************
function x229002_OnEnumerate( sceneId, selfId, targetId )
	------PrintStr("807002...OnEnumerate")
--��������ɹ�C�i n�y ����
	if IsMissionHaveDone(sceneId,selfId,x229002_g_MissionId) > 0 then
  	return
--Th�a m�n�����������
	elseif IsHaveMission(sceneId,selfId,x229002_g_MissionId) > 0 then
		local strNpcName = x229002_g_Name -- temp code
		if GetName(sceneId,targetId) == strNpcName then
			AddNumText(sceneId, x229002_g_ScriptId,x229002_g_MissionName,4,-1);
		end
--Th�a m�n�����������
  elseif x229002_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) == x229002_g_Name then
			AddNumText(sceneId,x229002_g_ScriptId,x229002_g_MissionName,3,-1);
		end
  end
end
--**********************************
--Ti�p th�
--**********************************
function x229002_OnAccept( sceneId, selfId )
	----PrintStr("OnAccept...")
	--local nMissionType = GetMissionCacheData(sceneId, selfId, 1)
	--if nMissionType == x229002_g_SubMissionTypeEnum.XunWu then
	--	x229002_XunWu_Accept(sceneId, selfId)
	--elseif nMissionType == x229002_g_SubMissionTypeEnum.SongXin then
	--	x229002_SongXin_Accept(sceneId, selfId)
	--elseif nMissionType == x229002_g_SubMissionTypeEnum.DingDianYinDao then
	--	x229002_DingDianYinDao_Accept(sceneId, selfId)
	--elseif nMissionType == x229002_g_SubMissionTypeEnum.FuBenZhanDou then
	--	x229002_FuBenZhanDou_Accept(sceneId, selfId)
	--elseif nMissionType == x229002_g_SubMissionTypeEnum.BuZhuo then
	--	x229002_BuZhuo_Accept(sceneId, selfId)
	--end
end

--**********************************
--���Ti�p th�����
--**********************************
function x229002_CheckAccept( sceneId, selfId )
	local nLevel = GetLevel(sceneId, selfId)
	--��ҵ�c�p>=10c�p
	if nLevel < 10 then
		return 0
	else
		local playerMenpai = GetMenPai(sceneId, selfId)
		if playerMenpai ~= MP_WUDANG then
			return 0
		end	
	end
	return 1;
end

--**********************************
--����
--**********************************
function x229002_OnAbandon( sceneId, selfId )
	----PrintStr("OnAbandon...")
	if IsHaveMission(sceneId, selfId, x229002_g_MissionId) > 0 then	
		local misIndex = GetMissionIndexByID(sceneId,selfId,x229002_g_MissionId)		-- �i�m������T�i 20c�i������to� � ���к�
		local missionType = GetMissionParam(sceneId, selfId, misIndex, 1)
		
		if missionType == x229002_g_SubMissionTypeEnum.SongXin then
			local missionItem = GetMissionParam(sceneId, selfId, misIndex,x229002_g_StrForePart+3)
			if HaveItem(sceneId, selfId, missionItem) == 1 then
			if LuaFnGetAvailableItemCount(sceneId, selfId, missionItem) >= 1 then
			DelItem(sceneId, selfId, missionItem, 1)		
			else
				BeginEvent(sceneId)
					AddText(sceneId, "V�t ph�m c�a c�c h� hi�n kh�ng d�ng ���c ho�c �� b� kh�a.")
				EndEvent( )
				DispatchMissionTips(sceneId,selfId)	
				return	
			end	
			end
		elseif missionType == x229002_g_SubMissionTypeEnum.DingDianYinDao	then
			local index = GetMissionParam(sceneId, selfId, misIndex,2)
			if HaveItem(sceneId, selfId, x229002_g_DingDianYinDaoList[index].itemId) == 1 then
			if LuaFnGetAvailableItemCount(sceneId, selfId, x229002_g_DingDianYinDaoList[index].itemId) >= 1 then
			DelItem(sceneId, selfId,x229002_g_DingDianYinDaoList[index].itemId,1)
			else
				BeginEvent(sceneId)
					AddText(sceneId, "V�t ph�m c�a c�c h� hi�n kh�ng d�ng ���c ho�c �� b� kh�a.")
				EndEvent( )
				DispatchMissionTips(sceneId,selfId)	
				return	
			end	
			end	
		elseif missionType == x229002_g_SubMissionTypeEnum.ShouJi then
			local itemId = GetMissionParam(sceneId, selfId, misIndex, x229002_g_StrForePart+2)
			if HaveItem(sceneId, selfId, itemId) == 1 then
			if LuaFnGetAvailableItemCount(sceneId, selfId, itemId) >= 5 then
			DelItem(sceneId, selfId,itemId,5)
			else
				BeginEvent(sceneId)
					AddText(sceneId, "V�t ph�m c�a c�c h� hi�n kh�ng d�ng ���c ho�c �� b� kh�a.")
				EndEvent( )
				DispatchMissionTips(sceneId,selfId)	
				return	
			end	
		end
		end
		--ɾ����������б��ж�Ӧto� � ����
	  DelMission( sceneId, selfId, x229002_g_MissionId )
	  SetMissionData(sceneId,selfId,MD_SHIMEN_HUAN,0)	--������0
	end	
 	--����ͨ�÷����ӿ�
	------------------------------------------------------------------
	 CallScriptFunction( 500501, "Abandon_Necessary", sceneId, selfId )
	-------------------------------------------------------------------
end

--**********************************
--����
--**********************************
function x229002_OnContinue( sceneId, selfId, targetId )
	------PrintStr("OnContinue...")
	if x229002_CheckAccept(sceneId,selfId) > 0 then
		BeginEvent(sceneId)
		
			AddText(sceneId,x229002_g_MissionName)
			AddText(sceneId,x229002_g_MissionComplete)
			
		  --x229002_DoSomethingByPlayerLevel(sceneId, selfId)
		  
		EndEvent( )
		DispatchMissionContinueInfo(sceneId, selfId, targetId, x229002_g_ScriptId, x229002_g_MissionId)
	end	
end

--**********************************
--�����ng������ύ
--**********************************
function x229002_CheckSubmit( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x229002_g_MissionId ) <= 0 then
		return 0
	end

	--T�i ���ж��ύ������ng�����,��������Ӧ����
	local misIndex = GetMissionIndexByID(sceneId,selfId,x229002_g_MissionId)
	local missionType = GetMissionParam(sceneId, selfId, misIndex, 1)
	
	if missionType == x229002_g_SubMissionTypeEnum.XunWu then
		local demandItemId = GetMissionParam(sceneId, selfId, misIndex, x229002_g_StrForePart+1)
		if GetItemCount(sceneId,selfId,demandItemId) <= 0 then --û����Ҫto� � ��Ʒ
			return 0
		end
		if IsEquipItem(demandItemId) == 1 and IsWhiteEquip(demandItemId) ~= 1 then
			return 2
		else
			return 1
		end		
	elseif missionType == x229002_g_SubMissionTypeEnum.ShouJi then
	 	local demandItemId = GetMissionParam(sceneId, selfId, misIndex, x229002_g_StrForePart+2)
	 	if GetItemCount(sceneId,selfId,demandItemId) < 5 then --û����Ҫto� � ��Ʒ
	 		return 0
	 	else
	 		return 1	
	 	end
	elseif missionType == x229002_g_SubMissionTypeEnum.BuZhuo then
		return 2
	elseif GetMissionParam(sceneId, selfId, misIndex, 0) > 0 then	--�쿴������ng�����
		return 1
	end

	return 0
end

function x229002_OnLockedTarget(sceneId, selfId, objId )
	------PrintStr("OnLockedTarget...")
	if GetName(sceneId, objId) == x229002_g_Name  then
		return 0
	end
	
	-- �ж���ng����ng����to� � Npc
	if IsHaveMission(sceneId, selfId, x229002_g_MissionId) > 0 then
		local misIndex = GetMissionIndexByID(sceneId,selfId,x229002_g_MissionId)		-- �i�m������T�i 20c�i������to� � ���к�
		local missionType = GetMissionParam(sceneId, selfId, misIndex, 1)
		
		local nNpcId, strNpcName, strNpcScene, PosX, PosZ, desc
		if missionType == x229002_g_SubMissionTypeEnum.KaiGuang then
			nNpcIndex = GetMissionParam(sceneId, selfId, misIndex, x229002_g_StrForePart+1)
			strNpcName = x229002_g_StrList[nNpcIndex+1]
		else
			nNpcId = GetMissionParam(sceneId, selfId, misIndex, x229002_g_StrForePart+1)
			nNpcId, strNpcName, strNpcScene, PosX, PosZ, desc = GetNpcInfoByNpcId(sceneId,nNpcId)
		end
			 
		if GetName(sceneId, objId) == strNpcName then
			TAddNumText(sceneId,x229002_g_ScriptId,x229002_g_MissionName,4,-1,x229002_g_ScriptId);
		end
		
	end
	
	return 0;

end

function x229002_CheckCondition_UseItem( sceneId, selfId, targetId, eventId )
	------PrintStr("OnUseItem...")
	local misIndex = GetMissionIndexByID(sceneId, selfId, x229002_g_MissionId)

	-- ��t ���c������to� � ��������
	local missionType = GetMissionParam(sceneId, selfId, misIndex, 1)
	if missionType ~= x229002_g_SubMissionTypeEnum.DingDianYinDao then
		return 0
	end
	
	local index = GetMissionParam(sceneId, selfId, misIndex, 2)
	local targetSceneId = x229002_g_DingDianYinDaoList[index].scene
	--PrintNum(sceneId)
	if sceneId ~= targetSceneId then
		BeginEvent(sceneId)

			AddText(sceneId,"H�nh nh� � ��y kh�ng ���c b�n")

		EndEvent(sceneId)

		DispatchMissionTips(sceneId,selfId)

		return 0
	end
	
	local posx1 = x229002_g_DingDianYinDaoList[index].posx1
	local posz1 = x229002_g_DingDianYinDaoList[index].posz1
	local posx2 = x229002_g_DingDianYinDaoList[index].posx2
	local posz2 = x229002_g_DingDianYinDaoList[index].posz2

	--ȡ �i�m��ҵ�ǰ����

	local PlayerX = GetHumanWorldX(sceneId,selfId)

	local PlayerZ = GetHumanWorldZ(sceneId,selfId)

	
	--���������Ŀ�� �i�mto� � ����
	if PlayerX >= posx1 and PlayerX < posx2 then
		------PrintStr("PlayerX >= posx1 and PlayerX < posx2...")
		if PlayerZ >= posz1 and PlayerZ < posz2 then
			------PrintStr("PlayerZ >= posz1 and PlayerZ < posz2...")
			return 1
		end
	end	

	BeginEvent(sceneId)

		AddText(sceneId, "Ch� ���c s� d�ng trong khu v�c ch� �nh!")

	EndEvent(sceneId)

	DispatchMissionTips(sceneId,selfId)
	return 0

end

--**********************************
--����ʹ��
--**********************************
function x229002_Active_UseItem( sceneId, selfId, param0 )
	local misIndex = GetMissionIndexByID(sceneId, selfId, x229002_g_MissionId)

	-- ��t ���c������to� � ��������
	local missionType = GetMissionParam(sceneId, selfId, misIndex, 1)
	if missionType ~= x229002_g_SubMissionTypeEnum.DingDianYinDao then
		return 0
	end
	
	local index = GetMissionParam(sceneId, selfId, misIndex, 2)
	if LuaFnGetAvailableItemCount(sceneId, selfId, x229002_g_DingDianYinDaoList[index].itemId) >= 1 then
		DelItem( sceneId, selfId, x229002_g_DingDianYinDaoList[index].itemId, 1 )
	--������״̬��������Ϊ1,��ʾ�Ѿ����
	SetMissionByIndex(sceneId,selfId,misIndex,0,1)
	else
		BeginEvent(sceneId)
			AddText(sceneId, "V�t ph�m c�a c�c h� hi�n kh�ng d�ng ���c ho�c �� b� kh�a.")
		EndEvent( )
		DispatchMissionTips(sceneId,selfId)	
		return	
	end
end

--**********************************
--���߸ı�
--**********************************
function x229002_OnItemChanged( sceneId, selfId, itemdataId )
	------PrintStr("OnItemChanged")
	local misIndex = GetMissionIndexByID(sceneId, selfId, x229002_g_MissionId)

	-- ��t ���c������to� � ��������
	local missionType = GetMissionParam(sceneId, selfId, misIndex, 1)
	if missionType == x229002_g_SubMissionTypeEnum.XunWu then
		local _, strItemName, _ = x229002_GetItemDetailInfo(itemdataId)
		local demandItemId = GetMissionParam(sceneId, selfId, misIndex, x229002_g_StrForePart+1)
		local _, strDemandItemName, _ = x229002_GetItemDetailInfo(demandItemId)
		
		if strItemName == strDemandItemName then
			BeginEvent(sceneId)

				
				strText = format("�� ��t ���c %s", strItemName)
				AddText(sceneId,strText)
			EndEvent(sceneId)

			DispatchMissionTips(sceneId,selfId)
			SetMissionByIndex(sceneId,selfId,misIndex,0,1)
			ResetMissionEvent(sceneId, selfId, x229002_g_MissionId, 2)
		end
	elseif missionType == x229002_g_SubMissionTypeEnum.KaiGuang then
		local _, strItemName, _ = x229002_GetItemDetailInfo(itemdataId)
		local demandItemId = GetMissionParam(sceneId, selfId, misIndex, x229002_g_StrForePart+2)
		local _, strDemandItemName, _ = x229002_GetItemDetailInfo(demandItemId)
		
		if strItemName == strDemandItemName then
			BeginEvent(sceneId)
				strText = format("�� ��t ���c %s", strItemName)
				AddText(sceneId,strText)
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			ResetMissionEvent(sceneId, selfId, x229002_g_MissionId, 2)
		end
		
	elseif missionType == x229002_g_SubMissionTypeEnum.ShouJi then
		local itemCount = GetItemCount(sceneId,selfId,itemdataId)
		local _, strItemName, _ = x229002_GetItemDetailInfo(itemdataId)
		local demandItemId = GetMissionParam(sceneId, selfId, misIndex, x229002_g_StrForePart+2)
		local _, strDemandItemName, _ = x229002_GetItemDetailInfo(demandItemId)
		
		if strItemName == strDemandItemName then
			BeginEvent(sceneId)
				local _, strItemName, _ = x229002_GetItemDetailInfo(itemdataId)
				strText = format("�� ��t ���c %s%d/5", strItemName, itemCount)
				AddText(sceneId,strText)
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			
			if itemCount == 5 then
				SetMissionByIndex(sceneId,selfId,misIndex,0,1)
				ResetMissionEvent(sceneId, selfId, x229002_g_MissionId, 2)
			end	
		end
	elseif missionType == x229002_g_SubMissionTypeEnum.killMonster then
		local _, _, itemId = x229002_GetMenpaiYiWuInfo(sceneId, selfId)
		if itemdataId == itemId  then
			SetMissionByIndex(sceneId,selfId,misIndex,0,1)
			ResetMissionEvent(sceneId, selfId, x229002_g_MissionId, 0)
			ResetMissionEvent(sceneId, selfId, x229002_g_MissionId, 2)
		end
	
	end

end

--**********************************
--���޸ı�
--**********************************
function x229002_OnPetChanged( sceneId, selfId, petDataId)
	------PrintStr("OnPetChanged...")
	local misIndex = GetMissionIndexByID(sceneId, selfId, x229002_g_MissionId)

	-- ��t ���c������to� � ��������
	local missionType = GetMissionParam(sceneId, selfId, misIndex, 1)
	if missionType == x229002_g_SubMissionTypeEnum.BuZhuo then
		local demandPetDataId = GetMissionParam(sceneId, selfId, misIndex, x229002_g_StrForePart+1)
		
		if petDataId == demandPetDataId then
			BeginEvent(sceneId)
				local strText = format("�� ��t ���c %s", GetPetName(petDataId))
				AddText(sceneId,strText)
			EndEvent(sceneId)

			DispatchMissionTips(sceneId,selfId)
			SetMissionByIndex(sceneId,selfId,misIndex,0,1)
			ResetMissionEvent(sceneId, selfId, x229002_g_MissionId, 3)
		end
	end
end
--**********************************
--�ύ
--**********************************
function x229002_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	------PrintStr("OnSubmit...")
	local misIndex = GetMissionIndexByID(sceneId, selfId, x229002_g_MissionId)

	if x229002_CheckSubmit( sceneId, selfId, selectRadioId )>=1 then

		local missionType = GetMissionParam(sceneId, selfId, misIndex, 1)
		if missionType == x229002_g_SubMissionTypeEnum.XunWu then
			local demandItemId = GetMissionParam(sceneId, selfId, misIndex, x229002_g_StrForePart+1)
			----PrintStr("demandItemId"..demandItemId)
			if LuaFnGetAvailableItemCount(sceneId, selfId, demandItemId) >= 1 then
			local ret = DelItem(sceneId, selfId, demandItemId, 1)
			if ret <= 0 then
				BeginEvent(sceneId)
					AddText(sceneId, "Kh�ng �� v�t ph�m c�n, nhi�m v� kh�ng th� giao")
				EndEvent()
				DispatchMissionTips(sceneId, selfId)
				return
			end
			else
				BeginEvent(sceneId)
					AddText(sceneId, "V�t ph�m c�a c�c h� hi�n kh�ng d�ng ���c ho�c �� b� kh�a.")
				EndEvent( )
				DispatchMissionTips(sceneId,selfId)	
				return	
			end	
--		elseif missionType == x229002_g_SubMissionTypeEnum.killMonster then
--			local _, _, demandItemId  = x229002_GetMenpaiYiWuInfo(sceneId, selfId)
--			local ret = DelItem(sceneId, selfId, demandItemId, 1)
--			if ret <= 0 then
--				BeginEvent(sceneId)
--					AddText(sceneId, "Kh�ng �� v�t ph�m c�n, nhi�m v� kh�ng th� giao")
--				EndEvent()
--				DispatchMissionTips(sceneId, selfId)
--				return
--			end
		elseif missionType == x229002_g_SubMissionTypeEnum.ShouJi then
			local demandItemId = GetMissionParam(sceneId, selfId, misIndex, x229002_g_StrForePart+2)
			if LuaFnGetAvailableItemCount(sceneId, selfId, demandItemId) >= 5 then
			local ret = DelItem(sceneId, selfId, demandItemId, 5)
			if ret <= 0 then
				BeginEvent(sceneId)
					AddText(sceneId, "Kh�ng �� v�t ph�m c�n, nhi�m v� kh�ng th� giao")
				EndEvent()
				DispatchMissionTips(sceneId, selfId)
				return
			end
			else
				BeginEvent(sceneId)
					AddText(sceneId, "V�t ph�m c�a c�c h� hi�n kh�ng d�ng ���c ho�c �� b� kh�a.")
				EndEvent( )
				DispatchMissionTips(sceneId,selfId)	
				return	
			end
		end

		DelMission( sceneId, selfId, x229002_g_MissionId )
		--����ͨ���ύ����ӿڽӿ�

		------------------------------------------------------------------
		local Reward_Append, MissionRound = CallScriptFunction( 500501, "OnSubmit_Necessary", sceneId, selfId, targetId )
		if Reward_Append == 2 and MissionRound == 20 then
			CallScriptFunction(229010, "AddOtherMenpaiFubenMission", sceneId, selfId, x229002_g_MissionId, targetId)
		end
		-------------------------------------------------------------------

		--x229002_OnDefaultEvent( sceneId, selfId, targetId )
		
	end
end

function x229002_OnMissionCheck( sceneId, selfId, npcid, scriptId, index1, index2, index3, petindex )
  if x229002_CheckSubmit( sceneId, selfId) < 1 then
    return 0
  end

	----PrintStr("OnMissionCheck...")
	print(sceneId, selfId, npcid, scriptId, index1, index2, index3, petindex)
	local misIndex = GetMissionIndexByID(sceneId, selfId, x229002_g_MissionId)

	local missionType = GetMissionParam(sceneId, selfId, misIndex, 1)
	if missionType == x229002_g_SubMissionTypeEnum.XunWu then
		local demandItemId = GetMissionParam(sceneId, selfId, misIndex, x229002_g_StrForePart+1)
		local _, strDemandItemName, _ = x229002_GetItemDetailInfo(demandItemId)
		----PrintStr("strDemandItemName="..strDemandItemName)
		--����ͨ���ύ����ӿڽӿ�

		------------------------------------------------------------------

		local find = CallScriptFunction( 500501, "OnMissionCheck_NecessaryEx", sceneId, selfId, index1, index2, index3, demandItemId )

		-------------------------------------------------------------------


		if find < 0 then

			BeginEvent(sceneId)

				local strText = format("Sao ng߽i v�n ch�a �em %s v� ���c m� �� quay v�?", strDemandItemName)
				AddText(sceneId,strText)
				AddItemBonus( sceneId, demandItemId, 1 )
			EndEvent(sceneId)

			DispatchEventList(sceneId,selfId,-1)

			return
		end
		
		local ret = EraseItem( sceneId, selfId, find )
		if	ret > 0 then

			DelMission( sceneId, selfId, x229002_g_MissionId )

			--����ͨ���ύ����ӿڽӿ�

			------------------------------------------------------------------
			local Reward_Append, MissionRound = CallScriptFunction( 500501, "OnSubmit_Necessary", sceneId, selfId, -1 )
			if Reward_Append == 2 and MissionRound == 20 then
				CallScriptFunction(229010, "AddOtherMenpaiFubenMission", sceneId, selfId, x229002_g_MissionId)
			end
			-------------------------------------------------------------------

		else
			BeginEvent(sceneId)

				local strText = format("Sao ng߽i v�n ch�a �em %s v� ���c m� �� quay v�?", strDemandItemName)
				AddText(sceneId,strText)
				AddItemBonus( sceneId, demandItemId, 1 )
			EndEvent(sceneId)

			DispatchEventList(sceneId,selfId,-1)
		end	
	elseif missionType == x229002_g_SubMissionTypeEnum.BuZhuo then
		------PrintStr("OnMissionCheck...BuZhuo...")
		local demandPetId = GetMissionParam(sceneId, selfId, misIndex, x229002_g_StrForePart+1)
		local petId = LuaFnGetPet_DataID(sceneId, selfId, petindex)
		if petId == demandPetId then
			if LuaFnIsPetAvailable(sceneId, selfId, petindex) >= 1 then
				LuaFnDeletePet(sceneId, selfId, petindex)
				------PrintStr("DeletePet"..petId..demandPetId)
				DelMission( sceneId, selfId, x229002_g_MissionId )

				--����ͨ���ύ����ӿڽӿ�

				------------------------------------------------------------------
				local Reward_Append, MissionRound = CallScriptFunction( 500501, "OnSubmit_Necessary", sceneId, selfId, -1 )
				if Reward_Append == 2 and MissionRound == 20 then
					CallScriptFunction(229010, "AddOtherMenpaiFubenMission", sceneId, selfId, x229002_g_MissionId)
				end
				-------------------------------------------------------------------
			end	
		else
			BeginEvent(sceneId)
				AddText(sceneId, "Sao ng߽i v�n ch�a �em tr�n th� m� ta c�n v� ���c m� �� quay v�?")
			EndEvent(sceneId)

			DispatchEventList(sceneId,selfId,-1)

		end

	end -- endif
	
end

--**********************************
--ɱ����������
--**********************************
function x229002_OnKillObject( sceneId, selfId, objdataId ,objId)--������˼: �����š����objId�������λ�úš�����
	local misIndex = GetMissionIndexByID(sceneId,selfId,x229002_g_MissionId)
	local nMonsterId = GetMissionParam(sceneId, selfId, misIndex, x229002_g_StrForePart+3)
	local _, strMonsterName = GetNpcInfoByNpcId(sceneId,nMonsterId)
	local monsterName = GetMonsterNamebyDataId(objdataId)
	
	if strMonsterName == monsterName  then
		local num = GetMonsterOwnerCount(sceneId,objId)
		for i=0,num-1  do
			-- ȡ �i�mӵ�з���Ȩto� � ��to� � objId
			local humanObjId = GetMonsterOwnerID(sceneId,objId,i)
			--PrintStr("humanObjId=" .. humanObjId)
			-- ��C�i n�y ����ng����ng��C�i n�y ����
			if IsHaveMission(sceneId, humanObjId, x229002_g_MissionId) > 0 then
				-- ���ж���ng����ng�Ѿ�Th�a m�n����ɱ�־
				local misIndex = GetMissionIndexByID(sceneId,humanObjId,x229002_g_MissionId)
				if GetMissionParam(sceneId, humanObjId, misIndex, 0) <=0  then
					--SetMissionParamByIndexEx(sceneId, humanObjId, misIndex, 3, 0, 30)
					local demandKillCount = GetMissionParamEx(sceneId, humanObjId, misIndex, 3, 0)
					--PrintStr("demandKillCount=" .. demandKillCount)
					local killedCount =	GetMissionParamEx(sceneId, humanObjId, misIndex, 3, 1)
					killedCount = killedCount + 1
					SetMissionParamByIndexEx(sceneId, humanObjId, misIndex, 3, 1, killedCount)
					--PrintStr("killedCount=" .. killedCount)
					BeginEvent(sceneId)
						local str = format("�� gi�t ch�t %d/%d%s", killedCount, demandKillCount, monsterName)
						AddText(sceneId, str)
					EndEvent()
					DispatchMissionTips(sceneId, humanObjId)
					if killedCount == demandKillCount then
						SetMissionByIndex(sceneId, humanObjId, misIndex, 0, 1)
		end
				end --if
			end --if
		end --for				
	end
end


--**********************************
--ͬ������....ֱ����ɵ�ǰ��....
--**********************************
function x229002_HelpFinishOneHuan( sceneId, selfId, targetId )

	--��ng����ng�����ɵ���....
	if MP_WUDANG ~= GetMenPai( sceneId, selfId ) then
		return
	end

	--��ng�����Nhi�m v� s� m�n....
	if IsHaveMission(sceneId,selfId,x229002_g_MissionId) <= 0 then
		return
	end

	--��Ⲣ�۳�ͬ����������to� � ʦ�Ź���....
	local ret = CallScriptFunction( 229011, "CheckAndDepleteHelpFinishMenPaiPoint", sceneId, selfId, targetId )
	if ret == 0 then
		return
	end

	--��ȡNhi�m v� s� m�nto� � ����....
	local misIndex = GetMissionIndexByID(sceneId,selfId,x229002_g_MissionId)
	local missionType = GetMissionParam(sceneId, selfId, misIndex, 1)

	--���������Ʒ....
	local itemId = -1
	local itemCount = -1

	if missionType == x229002_g_SubMissionTypeEnum.SongXin then
		itemId = GetMissionParam(sceneId, selfId, misIndex,x229002_g_StrForePart+3)
		itemCount = LuaFnGetAvailableItemCount(sceneId, selfId, itemId)
		if itemCount >= 1 then
			DelItem(sceneId, selfId, itemId, 1)
		end
	elseif missionType == x229002_g_SubMissionTypeEnum.DingDianYinDao	then
		local index = GetMissionParam(sceneId, selfId, misIndex,2)
		itemId = x229002_g_DingDianYinDaoList[index].itemId
		itemCount = LuaFnGetAvailableItemCount(sceneId, selfId, itemId)
		if itemCount >= 1 then
			DelItem(sceneId, selfId, itemId, 1)	
		end
	elseif missionType == x229002_g_SubMissionTypeEnum.ShouJi then
		itemId = GetMissionParam(sceneId, selfId, misIndex, x229002_g_StrForePart+2)
		itemCount = LuaFnGetAvailableItemCount(sceneId, selfId, itemId)
		if itemCount > 5 then
			itemCount = 5
		end
		if itemCount > 0 then
			DelItem(sceneId, selfId, itemId, itemCount)
		end
	end

	--ɾ����������б��ж�Ӧto� � ����....
	DelMission( sceneId, selfId, x229002_g_MissionId )

	--����ͨ���ύ����ӿڽӿ�....
	local Reward_Append, MissionRound = CallScriptFunction( 500501, "OnSubmit_Necessary", sceneId, selfId, targetId, 1 )

	if Reward_Append == 2 and MissionRound == 20 then
		--�������m�t c�iȥ��to� � ���ɸ���to� � Nhi�m v� s� m�n....
		CallScriptFunction(229010, "AddOtherMenpaiFubenMission", sceneId, selfId, x229002_g_MissionId, targetId)
	end

end
