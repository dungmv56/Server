--大逃杀
--活动进行中
--副本地图大小为256*256,共包含64*64to� 鸬 16c醝小房间

--脚本号
x808002_g_ScriptId			= 808002
x808002_g_ScriptId_Ctrl	= 808003		--回调脚本

x808002_g_PlyJoinMax		= 64				--最大报名人数
x808002_g_GoldMin				= 10000			--报名费
x808002_g_LevelMin			= 40				--最低等c限制
x808002_g_GodBuff				= 112				--无敌BUFF
x808002_g_CampA					= 10				--Khi陁 chi猲A方阵营号
x808002_g_CampB					= 11				--Khi陁 chi猲B方阵营号
x808002_g_BackCity			=						--回城坐标
{
	["scn"]	= 1,
	["px"]	= 183,
	["pz"]	= 140,
}

--副本相关
x808002_g_CopySceneName	= "T� V� H礽 Tr叨ng"		--副本名称
x808002_g_CopySceneType	= FUBEN_DATAOSHA--副本类型,定义T読 ScriptGlobal.lua里面
x808002_g_CopySceneMap	= "dataosha.nav"
x808002_g_TickTime			= 5					--回调脚本to� 鸬 时钟时间(单位:  gi鈟/次)
x808002_g_CloseTick			= 6					--副本关闭前倒计时(单位: 次数)
x808002_g_NoUserTime		= 600				--副本中没有人后可以继续保存to� 鸬 时间(单位:  gi鈟)
x808002_g_PvpRuler			= 5					--副本Pvp规则,可PK
x808002_g_JoinTick			= 3					--报名倒计时

--副本数据区索引
x808002_g_ScnParam			=
{
	["typ"]	= 0,	--设置副本数据,这里将0号索引to� 鸬 数据设置为999,用于表示副本号999(数字自定义)
	["sid"]	= 1,	--将1号数据设置为副本场景事件脚本号
	["tim"]	= 2,	--设置定时器调用次数
	["ent"]	= 3,	--设置副本入口场景号, 初始化
	["cls"]	= 4,	--设置副本关闭标志, 0开放,1关闭
	["rnd"]	= 5,	--设置第几回合
	["jon"]	= 6,	--设置报名倒计时次数
	["chk"]	= 7,	--设置校验时间差
	["tab"]	= 8,	--设置表单ID
}

--排行榜表单数据区索引
x808002_g_TabParam			=
{
	["enn"]	= 0,	--进入副本to� 鸬 人数
	["fbn"]	= 1,	--使用副本数量
	["fb1"]	= 2,	--副本1to� 鸬 SceneId
	["fb2"]	= 3,	--副本2to� 鸬 SceneId
	["fbs"]	= 4,	--副本to� 鸬 创建状态: 0(空闲),1(创建中)
}

--消息提示
x808002_g_Msg						=
{
	["flw"]		= "Xin l瞚, trong tr課g th醝 theo sau t� 鸬i kh鬾g th� b醥 danh.",
	["drd"]		= "Xin l瞚, trong tr課g th醝 th� c咿i 痿i kh鬾g th� b醥 danh.",
	["ear"]		= "Hi畁 kh鬾g ph鋓 l� th秈 gian b醥 danh c黙 ho誸 鸬ng. H銀 t緄 t靘 ta trong th秈 gian b醥 danh",
	["pop1"]	= "  姓i h礽 th� v� hi畁 ch韓h th裞 b 馥u. Nh鎛g th� sinh l 馥u tham d� m瞚 ng叨i ph鋓 n祊 #{_MONEY"..x808002_g_GoldMin.."} ph� b醥 danh, c醕 h� c� mu痭 tham gia kh鬾g?",
	["gld"]		= "Ng鈔 l唼ng tr阯 ng叨i c醕 h� kh鬾g 瘘 #{_MONEY"..x808002_g_GoldMin.."}, xin gom 瘘 s� ng鈔 l唼ng r癷 h莕g t緄 t靘 ta b醥 danh",
	["itm"]		= "Tay n鋓 c黙 c醕 h� t痶 nh n阯 c� ch� tr痭g. V� tr課g nguy阯 c� tg th叻ng 痼!",
	["ful"]		= "Xin l瞚, s� l唼ng b醥 danh c黙 nh髆 c� c鵱g 鹌ng c c黙 c醕 h� 疸 瘘, xin 瘙i l sau t緄 tham gia",
	["lev"]		= "Xin l瞚, ch� c�"..x808002_g_LevelMin.."T� c tr� l阯 m緄 疬㧟 tham gia t� th�",
	["grp"]		= "Xin l瞚, cu礳 t� th� c黙 nh髆 c鵱g 鹌ng c v緄 c醕 h� v鏽 ch遖 m�",
	["popn"]	= "  Hi畁 l� th秈 gian b醥 danh cho v騨g thi ti猵 theo c黙 鹫i h礽 th� v�, ch� c� nh鎛g k� thg cu礳 c黙 v騨g 馥u m緄 疬㧟 b醥 danh ti猵",
	["fal"]		= "Xin l瞚, ch� c� nh鎛g k� thg cu礳 c黙 v騨g 馥u m緄 疬㧟 b醥 danh ti猵",

	["n_son"]	= "Ho誸 鸬ng 姓i h礽 th� v� Nh髆 c %d l n鄖 c騨 %d ph鷗 n鎍 k猼 th鷆, Xin c醕 v� tuy琻 th� nhanh ch髇g k猼 th鷆 th� v�",
	["n_end"]	= "Ho誸 鸬ng 姓i h礽 th� v� Nh髆 c %d l n鄖 疸 k猼 th鷆, C醕 tuy琻 th� v騨g sau xin nhanh ch髇g chu b� b醥 danh",
	["r_win"]	= "Xin ch鷆 m譶g, gi鄋h 疬㧟 chi猲 thg T� V�",
	["r_wnx"]	= "Xin h銀 皙n T鵼 B醥 Minh nh l頽h ph th叻ng c黙 c醕 h�, sau 痼 m緄 c� th� ti猲 v鄌 v騨g T� V� ti猵 theo.",
	["r_mal"]	= "Ch鷆 m譶g c醕 h� 疸 chi猲 thg trong T� V�! Xin h銀 皙n t靘 T鵼 B醥 Minh (173, 130) nh l頽h ph th叻ng c黙 c醕 h�, khi xong vi甤 c醕 h� s� ti猲 v鄌 T� V� ti猵 theo. #rCh� �: C醕 h� ph鋓 nh l頽h ph th叻ng xong m緄 c� th� b呔c v鄌 v騨g k� ti猵, 鹱ng b� l� c� h礽 n鄖, mau 餴 nh l頽h n鄌.",
	["r_fal"]	= "r l l鄊 ti猚, t� v� th b読",
	["r_flx"]	= "Xin h銀 皙n T鵼 B醥 Minh nh l頽h ph th叻ng c黙 c醕 h�",
}

--th b読者奖励
x808002_g_BountyRate		= 5	--奖励概率百分比
x808002_g_BountyItem	 	=		--奖励物品列表
{
	20500000,									--Tinh铁碎片
	20501000,									--棉布碎片
	20502000,									--秘银碎片
}

--**********************************
--任务入口函数
--**********************************
function x808002_OnDefaultEvent( sceneId, selfId, targetId )

	--找不到该玩家
	if LuaFnIsObjValid( sceneId, selfId ) ~= 1 then
		return
	end
	--判断组队跟随状态
	if IsTeamFollow( sceneId, selfId ) == 1 then
		x808002_MsgBox( sceneId, selfId, x808002_g_Msg["flw"] )
		return
	end
	--判断双人骑乘状态
	if LuaFnGetDRideFlag( sceneId, selfId ) == 1 then
		x808002_MsgBox( sceneId, selfId, x808002_g_Msg["drd"] )
		return
	end

	--比武回合数
	local	rnd	= CallScriptFunction( x808002_g_ScriptId_Ctrl, "GetRound", sceneId, selfId )

	--选择按钮
	local	key	= GetNumText()

	--我要报名
	if key == 0 then
		--查看比武结果,喧ng否L頽h 过奖励
		if x808002_OnPlyBounty( sceneId, selfId, targetId, rnd ) == 1 then
			if rnd > 0 then
				x808002_MsgBox( sceneId, selfId, "Xin 鹱ng 餴 qu� xa t読 h�, s� c鬾g b� th鄋h t韈h 黏u v� sau 韙 ph鷗 n鎍" )
			end
			return
		end

		--活动喧ng否处于报名中
		if CallScriptFunction( x808002_g_ScriptId_Ctrl, "IsJoinDoing", sceneId, selfId ) == 0 then
			x808002_MsgBox( sceneId, selfId, x808002_g_Msg["ear"] )
			return
		end
		
		--检测报名条件
		if x808002_CheckPlyJoin( sceneId, selfId ) ~= 1 then
			return
		end

		--第m祎 次参赛
		if rnd == 1 then
			BeginEvent( sceneId )
			AddText( sceneId, x808002_g_Msg["pop1"] )
			AddNumText( sceneId, x808002_g_ScriptId, "Ta mu痭 tham gia b鈟 gi�", 10, 1001 )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
		--循环赛
		else
			BeginEvent( sceneId )
			AddText( sceneId, x808002_g_Msg["popn"] )
			AddNumText( sceneId, x808002_g_ScriptId, "Ta mu痭 tham gia b鈟 gi�", 10, 1002 )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
		end

	--第m祎 轮: 我现T読 就要参加
	elseif key == 1001 then
		--关闭界面
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )

		local nMoneyJZ = GetMoneyJZ (sceneId, selfId)
		local nMoney = GetMoney (sceneId, selfId)
		
		--金钱检查
		if (nMoneyJZ + nMoney) < x808002_g_GoldMin then
			-- 钱不够
			x808002_MsgBox( sceneId, selfId, x808002_g_Msg["gld"] )
			return
		end

		x808002_MsgBox( sceneId, selfId, "Ch鷆 m譶g c醕 h� b醥 danh th鄋h c鬾g, hy v鱪g c醕 h� 瘘 d鹡g c鋗 餺誸 疬㧟 V� Tr課g Nguy阯!" )
		x808002_MsgBox( sceneId, selfId, "Sau khi r秈 h礽 tr叨ng, nh� quay v� l頽h th叻ng 瘊ng gi�!" )

		--玩家报名
		x808002_OnPlyJoin( sceneId, selfId, rnd )
	
	--循环: 我现T読 就要参加
	elseif key == 1002 then
		--关闭界面
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )

		--玩家报名
		x808002_OnPlyJoin( sceneId, selfId, rnd )
	end

end

--**********************************
--列举事件
--**********************************
function x808002_OnEnumerate( sceneId, selfId, targetId )

	AddNumText( sceneId, x808002_g_ScriptId, "Ta mu痭 b醥 danh", 4, 0 )

end

--**********************************
--检测玩家报名条件
--**********************************
function x808002_CheckPlyJoin( sceneId, selfId )

	if GetLevel( sceneId, selfId ) < x808002_g_LevelMin then
		x808002_MsgBox( sceneId, selfId, x808002_g_Msg["lev"] )
		return 0
	end
	
	--根据玩家等c获取组别信息
	local	ActID, _, _	= CallScriptFunction( x808002_g_ScriptId_Ctrl, "GetGroupInfo", sceneId, selfId )
	if ActID == nil then
		x808002_MsgBox( sceneId, selfId, x808002_g_Msg["grp"] )
		return 0
	end

	if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 1 then
		x808002_MsgBox( sceneId, selfId, x808002_g_Msg["itm"] )
		return 0
	end
	return 1

end

--**********************************
--玩家报名
--**********************************
function x808002_OnPlyJoin( sceneId, selfId, rnd )

	--找不到该玩家
	if LuaFnIsObjValid( sceneId, selfId ) ~= 1 then
		return
	end

	--比武回合数
	rnd_self	= x808002_GetMyCurrentRound( sceneId, selfId )
	ret_self	= GetMissionData( sceneId, selfId, MD_DATAOSHA_RESULT )
	if rnd > 1 then
		if rnd ~= (rnd_self+1) or ret_self <= 0 then
			x808002_MsgBox( sceneId, selfId, x808002_g_Msg["fal"] )
			return
		end
	end

	--获取表单ID
	tabId			= CallScriptFunction( x808002_g_ScriptId_Ctrl, "GetTableID", sceneId, selfId )
	--表单人数
	ply_num		= HitParadeGetTabParam( sceneId, tabId, x808002_g_TabParam["enn"] )
	if tabId == -1 or ply_num >= x808002_g_PlyJoinMax then
		x808002_MsgBox( sceneId, selfId, x808002_g_Msg["ful"] )
		--Add Log
		LogInfo	= format( "[TAOSHA]: x808002_OnPlyJoin( sceneId=%d, GUID=%0X, rnd=%d ), tabId=%d, ply_num=%d",
			sceneId,
			LuaFnObjId2Guid( sceneId, selfId ),
			rnd,
			tabId,
			ply_num )
		MissionLog( sceneId, LogInfo )
		return
	end

	--判断副本喧ng否加载
	scn_num		= HitParadeGetTabParam( sceneId, tabId, x808002_g_TabParam["fbn"] )
	scn_fb		= { 0, 0 }
	scn_fb[1]	= HitParadeGetTabParam( sceneId, tabId, x808002_g_TabParam["fb1"] )
	scn_fb[2]	= HitParadeGetTabParam( sceneId, tabId, x808002_g_TabParam["fb2"] )
	if scn_num > 0 then
		--当报名人数为(x808002_g_PlyJoinMax/2)时,创建副本2
		if LuaFnGetSceneType( scn_fb[scn_num] ) == 1 and ply_num ~= floor(x808002_g_PlyJoinMax/2) then
			x808002_OnSelectRoom( sceneId, selfId, scn_fb[scn_num], tabId )
			return
		end
	end

	--m祎 定要考虑“副本创建中”to� 鸬 状况
	if scn_num <= 2 then
		if HitParadeGetTabParam( sceneId, tabId, x808002_g_TabParam["fbs"] ) == 0 then
			HitParadeSetTabParam( sceneId, tabId, x808002_g_TabParam["fbs"], 1 )
			x808002_MakeCopyScene( sceneId, selfId, tabId, rnd, tabId )
		else
			x808002_MsgBox( sceneId, selfId, "Trong x鈟 d駈g ph� b鋘" )
			return
		end

	else
		x808002_MsgBox( sceneId, selfId, x808002_g_Msg["ful"] )
		--Add Log
		LogInfo	= format( "[TAOSHA]: x808002_OnPlyJoin( sceneId=%d, GUID=%0X, rnd=%d ), tabId=%d, scn_num=%d, fb1=%d, fb2=%d, ply_num=%d",
			sceneId,
			LuaFnObjId2Guid( sceneId, selfId ),
			rnd,
			tabId,
			scn_num, scn_fb[1], scn_fb[2],
			ply_num )
		MissionLog( sceneId, LogInfo )
		return
	end

end

--**********************************
--玩家奖励
--**********************************
function x808002_OnPlyBounty( sceneId, selfId, targetId, rnd )

	--比赛结果,以其"符号位"标识胜负,以其"绝对值喧ng否大于1"标识喧ng否L頽h 过奖励,0等同于没有过比赛
	ret_self	= GetMissionData( sceneId, selfId, MD_DATAOSHA_RESULT )
	if abs( ret_self ) <= 1 then
		return 0
	end
	--喧ng否获胜
	if ret_self > 0 then
		isWin		= 1
	else
		isWin		= 0
	end

	ret_self	= floor( ret_self / abs(ret_self) )
	SetMissionData( sceneId, selfId, MD_DATAOSHA_RESULT, ret_self )

	--分出胜负to� 鸬 组,无论喧ng胜利者还喧ngth b読者均可以 鹫t 疬㧟Kinh nghi甿
	BeginEvent( sceneId )
		AddText( sceneId, "  Tuy畉 l, c醕 h� d鹡g kh� v� song. � 疴y, ta 疸 chu b� 1 s� qu� tg nh�, xin ch� c叨i ch�!" )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

	--增加Kinh nghi甿值
	exp				= GetLevel( sceneId, selfId ) * 44
	AddExp( sceneId, selfId, exp )

	--L頽h 奖励再进行排名
	--理由: 按照等c划分为多组,每组对应多副本,多线程
	--获取表单ID
	tabId			= CallScriptFunction( x808002_g_ScriptId_Ctrl, "GetTableID", sceneId, selfId )
	--Add Log
	LogInfo	= format( "[TAOSHA]: x808002_OnPlyBounty( sceneId=%d, GUID=%0X ), AddExp=%d, tabId=%d",
		sceneId,
		LuaFnObjId2Guid( sceneId, selfId ),
		exp, tabId )
	MissionLog( sceneId, LogInfo )

	rnd_self	= x808002_GetMyCurrentRound( sceneId, selfId )
	if tabId < 0 or rnd <= 0 or rnd_self <= 0 then
		return 0
	end
	guid			= LuaFnObjId2Guid( sceneId, selfId )
	--排行键值(降序,键值越大,排名越靠前): 环数 * 3 ,胜者加2,负者加1
	key				= rnd_self * 3
	if ret_self > 0 then
		key			= key + 2				--胜者
	elseif ret_self < 0 then
		key			= key + 1				--负者
	end
	HitParadePlayerJoin( sceneId, tabId, guid, key )
	
	--th b読者额外奖励
	if isWin == 0 and
		random( 100 ) <= x808002_g_BountyRate and
		LuaFnGetPropertyBagSpace( sceneId, selfId ) >= 1
		then
		idLst		= random( getn( x808002_g_BountyItem ) )
		idBag		= LuaFnTryRecieveItem( sceneId, selfId, x808002_g_BountyItem[idLst], 1 )
		if idBag >= 0 then
			LuaFnItemBind( sceneId, selfId, idBag )
			szTran= GetBagItemTransfer( sceneId, selfId, idBag )
			szMsg	= format( "叮叮当当！比武场上,#{_INFOUSR%s}与对手激战正酣,冷不防场外飞来m祎 物,竟喧ng#{_INFOMSG%s}.",
				LuaFnGetName( sceneId, selfId ),
				szTran )
			x808002_MyGlobalNews( sceneId, szMsg )
		end
	end
	
	return 1

end

--**********************************
--创建副本
--**********************************
function x808002_MakeCopyScene( sceneId, selfId, tabId, rnd, tabId )

	--获取副本c醝数
	scn_num	= HitParadeGetTabParam( sceneId, tabId, x808002_g_TabParam["fbn"] )
	--获取单轮执行时间
	unt_tim	= CallScriptFunction( x808002_g_ScriptId_Ctrl, "GetCurrentUnitTime", sceneId, selfId, x808002_g_TickTime )

	--设置副本参数
	local	leaderguid	= LuaFnObjId2Guid( sceneId, selfId )
	LuaFnSetSceneLoad_Map( sceneId, x808002_g_CopySceneMap )							--地图喧ng必须选取to� 鸬 ,而且必须T読 Config/SceneInfo.ini里配置好
	LuaFnSetCopySceneData_TeamLeader( sceneId, leaderguid )
	LuaFnSetCopySceneData_NoUserCloseTime( sceneId, x808002_g_NoUserTime * 1000 )
	LuaFnSetCopySceneData_PvpRuler( sceneId, x808002_g_PvpRuler )
	LuaFnSetCopySceneData_Timer( sceneId, x808002_g_TickTime * 1000 )
	LuaFnSetCopySceneData_Param( sceneId, x808002_g_ScnParam["typ"], x808002_g_CopySceneType )			--设置副本数据,这里将0号索引to� 鸬 数据设置为999,用于表示副本号999(数字自定义)
	LuaFnSetCopySceneData_Param( sceneId, x808002_g_ScnParam["sid"], x808002_g_ScriptId )						--将1号数据设置为副本场景事件脚本号
	LuaFnSetCopySceneData_Param( sceneId, x808002_g_ScnParam["tim"], 0 )	--设置定时器调用次数
	LuaFnSetCopySceneData_Param( sceneId, x808002_g_ScnParam["ent"], -1 )	--设置副本入口场景号, 初始化
	LuaFnSetCopySceneData_Param( sceneId, x808002_g_ScnParam["cls"], 0 )	--设置副本关闭标志, 0开放,1关闭
	LuaFnSetCopySceneData_Param( sceneId, x808002_g_ScnParam["rnd"], rnd )--设置第几回合
	LuaFnSetCopySceneData_Param( sceneId, x808002_g_ScnParam["jon"], 0 )	--设置报名倒计时次数

	LuaFnSetSceneLoad_Area( sceneId, "dataosha_area.ini" )
	LuaFnSetSceneLoad_Monster( sceneId, "dataosha_monster.ini" )

	--设置校验时间差
	LuaFnSetCopySceneData_Param( sceneId, x808002_g_ScnParam["chk"], unt_tim )
	--设置表单ID
	LuaFnSetCopySceneData_Param( sceneId, x808002_g_ScnParam["tab"], tabId )

	--初始化完成后调用创建副本函数
	local bRetSceneID = LuaFnCreateCopyScene( sceneId )
	if bRetSceneID > 0 then
		HitParadeSetTabParam( sceneId, tabId, x808002_g_TabParam["fbn"], scn_num + 1 )
		x808002_MsgBox( sceneId, selfId, "S醤g l B鋘 th阭 th鄋h c鬾g" )
	else
		HitParadeSetTabParam( sceneId, tabId, x808002_g_TabParam["fbs"], 0 )
		x808002_MsgBox( sceneId, selfId, "S� l唼ng B鋘 th阭 疸 鹫t t緄 c馽 餴琺, xin ch� r癷 th� l読" )
	end

end

--**********************************
--副本事件
--**********************************
function x808002_OnCopySceneReady( sceneId, destsceneId )

	--设置副本入口场景号
	LuaFnSetCopySceneData_Param( destsceneId, x808002_g_ScnParam["ent"], sceneId )
	local	leaderguid	= LuaFnGetCopySceneData_TeamLeader( destsceneId )
	local	leaderObjId	= LuaFnGuid2ObjId( sceneId, leaderguid )

	--获取表单ID
	tabId		= LuaFnGetCopySceneData_Param( destsceneId, x808002_g_ScnParam["tab"] )

	--设置副本to� 鸬 场景号
	scn_num	= HitParadeGetTabParam( sceneId, tabId, x808002_g_TabParam["fbn"] )
	if scn_num == 1 then
		HitParadeSetTabParam( sceneId, tabId, x808002_g_TabParam["fb1"], destsceneId )
	else
		HitParadeSetTabParam( sceneId, tabId, x808002_g_TabParam["fb2"], destsceneId )
	end
	--副本创建完成
	HitParadeSetTabParam( sceneId, tabId, x808002_g_TabParam["fbs"], 0 )

	--选择房间
	x808002_OnSelectRoom( sceneId, leaderObjId, destsceneId, tabId )

	--Add Log
	LogInfo	= format( "[TAOSHA]: x808002_OnCopySceneReady( sceneId=%d, destsceneId=%d ), GUID=%0X, tabId=%d, scn_num=%d",
		sceneId, destsceneId, leaderguid, tabId, scn_num )
	MissionLog( sceneId, LogInfo )

end

--**********************************
--为玩家选择房间,并传入副本
--**********************************
function x808002_OnSelectRoom( sceneId, selfId, destsceneId, tabId  )

	--找不到该玩家
	if LuaFnIsObjValid( sceneId, selfId ) ~= 1 then
		return
	end

	--喧ng否处于无法执行逻辑to� 鸬 状态
	if LuaFnIsCanDoScriptLogic( sceneId, selfId ) ~= 1 then
		return
	end

	--设置副本关闭标志, 0开放,1关闭
--LuaFnSetCopySceneData_Param( sceneId, x808002_g_ScnParam["cls"], 0 )

	--比武回合数
	rnd			= CallScriptFunction( x808002_g_ScriptId_Ctrl, "GetRound", sceneId, selfId )
	--玩家报名,取比武环数为排行键值
	guid		= LuaFnObjId2Guid( sceneId, selfId )
	--排行键值(降序,键值越大,排名越靠前): 环数 * 3 ,胜者加2,负者加1
	ply_id	= HitParadePlayerJoin( sceneId, tabId, guid, rnd*3 )
	if ply_id < 0 then
		return
	end
	--进入副本to� 鸬 人数
	ent_id	= HitParadeGetTabParam( sceneId, tabId, x808002_g_TabParam["enn"] )
	HitParadeSetTabParam( sceneId, tabId, x808002_g_TabParam["enn"], ( ent_id + 1 ) )

	--阵营号缓存,因为每次进入场景时,阵营会清空
	id_mod	= ent_id - floor( ent_id / 2 ) * 2
	if id_mod == 0 then
		SetMissionData( sceneId, selfId, MD_PREV_CAMP, x808002_g_CampA )
	else
		SetMissionData( sceneId, selfId, MD_PREV_CAMP, x808002_g_CampB )
	end

	--副本c醝数
	scn_num	= HitParadeGetTabParam( sceneId, tabId, x808002_g_TabParam["fbn"] )

	--房间索引,房间大小64*64
	idRoom	= floor( ent_id / 2 ) - floor( (scn_num-1) * 16 )
	px_mod	= idRoom - floor( idRoom /4 ) * 4
	if px_mod < 0 or px_mod >= 4 then
		px_mod= 0
	end
	px			= floor( px_mod * 64 + 32 )
	pz_mul	= floor( idRoom / 4 )
	if pz_mul < 0 or pz_mul >= 4 then
		pz_mul= 0
	end
	pz			= floor( pz_mul * 64 + 32 )

	--传入副本
	NewWorld( sceneId, selfId, destsceneId, px, pz )
	
	--活动统计
	LuaFnAuditQuest( sceneId, selfId, "姓i h礽 th� v�" )
	
	--扣除金钱(只T読 第m祎 轮扣钱)
	if rnd <= 1 then

		-- 使用带优先cto� 鸬 金钱消耗函数
		-- 原来扣金币没有判断喧ng否扣钱th b読,所以扣交子也未加喧ng否扣钱th b読to� 鸬 处理！				
		LuaFnCostMoneyWithPriority (sceneId, selfId, x808002_g_GoldMin)
				
		--Add Log
		LogInfo	= format( "[TAOSHA]: LuaFnCostMoneyWithPriority( sceneId=%d, GUID=%0X, Money=%d )", sceneId, guid, x808002_g_GoldMin )
		MissionLog( sceneId, LogInfo )
	end
	
	--记录比武回合数(年+当年第几天+回合数: YY+DDD+RR)
	rnd_MD	= GetDayTime() * 100 + rnd
	SetMissionData( sceneId, selfId, MD_DATAOSHA_ROUND, rnd_MD )
	--记录比武结果
	SetMissionData( sceneId, selfId, MD_DATAOSHA_RESULT, 0 )

	--Add Log
	LogInfo	= format( "[TAOSHA]: x808002_OnSelectRoom( sceneId=%d, destsceneId=%d ), GUID=%0X, tabId=%d, ent_id=%d, idRoom=%d, px=%d, pz=%d",
		sceneId, destsceneId, guid, tabId, ent_id, idRoom, px, pz )
	MissionLog( sceneId, LogInfo )

end

--**********************************
--有玩家进入副本事件
--**********************************
function x808002_OnPlayerEnter( sceneId, selfId )
	
	--Add Log
	LogInfo	= format( "[TAOSHA]: x808002_OnPlayerEnter( sceneId=%d, GUID=%0X )",
		sceneId,
		LuaFnObjId2Guid( sceneId, selfId ) )
	MissionLog( sceneId, LogInfo )

	--设置复活信息
	--回城至T� Ch鈛报名 餴琺附近
	SetPlayerDefaultReliveInfo( sceneId, selfId, "%10", -1, "0", x808002_g_BackCity["scn"], x808002_g_BackCity["px"], x808002_g_BackCity["pz"] )

	--副本关闭标志
	local	LeaveFlag	= LuaFnGetCopySceneData_Param( sceneId, x808002_g_ScnParam["cls"] )

	--报名中,传入会场
	if LuaFnGetCopySceneData_Param( sceneId, x808002_g_ScnParam["typ"] ) == x808002_g_CopySceneType then
		--判断玩家喧ng否已经报名该回合比赛
		rnd_self= x808002_GetMyCurrentRound( sceneId, selfId )
		rnd			= LuaFnGetCopySceneData_Param( sceneId, x808002_g_ScnParam["rnd"] )
		if rnd_self ~= rnd then
			x808002_MsgBox( sceneId, selfId, x808002_g_Msg["fal"] )
			x808002_OnGoBack( sceneId, selfId )
			return
		end
		if LeaveFlag > 0 then
			x808002_MsgBox( sceneId, selfId, "比武大会本次活动已经结束" )
			x808002_OnGoBack( sceneId, selfId )
			return
		end

		--设置对立阵营
		idCamp	= GetMissionData( sceneId, selfId, MD_PREV_CAMP )
		SetUnitCampID( sceneId, selfId, selfId, idCamp )
		--设置玩家to� 鸬 指定Pvp授权位
		SetPvpAuthorizationFlagByID( sceneId, selfId, 2, 0 )			--2喧ng竞技授权标记
		--设置无敌BUFF
		--LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x808002_g_GodBuff, 0 )
		--单回合获胜标记,胜利者传出
		SetMissionFlag( sceneId, selfId, MF_DATAOSHA_WIN, 0 )

	end

end

--**********************************
--有玩家T読 副本中死亡事件
--**********************************
function x808002_OnHumanDie( sceneId, selfId, killerId )

	--th b読者处理
	--记录比武结果
	SetMissionData( sceneId, selfId, MD_DATAOSHA_RESULT, -10 )
	x808002_MsgBox( sceneId, selfId, x808002_g_Msg["r_fal"] )
	x808002_MsgBox( sceneId, selfId, x808002_g_Msg["r_flx"] )
	--设置玩家to� 鸬 指定Pvp授权位
	--SetPvpAuthorizationFlagByID( sceneId, selfId, 2, 0 )			--2喧ng竞技授权标记

	--获胜者处理
	--记录比武结果
	if killerId == nil or LuaFnIsObjValid( sceneId, killerId ) ~= 1 then
		return
	end
	SetMissionData( sceneId, killerId, MD_DATAOSHA_RESULT, 10 )
	x808002_MsgBox( sceneId, killerId, x808002_g_Msg["r_win"] )
	x808002_MsgBox( sceneId, killerId, x808002_g_Msg["r_wnx"] )
	LuaFnSendSystemMail( sceneId, GetName( sceneId, killerId ), x808002_g_Msg["r_mal"] )
	--设置玩家to� 鸬 指定Pvp授权位
	--SetPvpAuthorizationFlagByID( sceneId, killerId, 2, 0 )		--2喧ng竞技授权标记
	if LuaFnIsCharacterLiving( sceneId, killerId ) == 1 then
		--单回合获胜标记,胜利者传出
		SetMissionFlag( sceneId, killerId, MF_DATAOSHA_WIN, 1 )
		--x808002_OnGoBack( sceneId, killerId )
	end

end

--**********************************
--杀死怪物或玩家
--**********************************
function x808002_OnKillObject( sceneId, selfId, objdataId, objId )
end

--**********************************
--进入区域事件
--**********************************
function x808002_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x808002_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--副本场景定时器事件
--**********************************
function x808002_OnCopySceneTimer( sceneId, nowTime )

	--副本时钟读取及设置
	--取 餴琺已经执行to� 鸬 定时次数
	local	TickCount	= LuaFnGetCopySceneData_Param( sceneId, x808002_g_ScnParam["tim"] )
	TickCount				= TickCount + 1
	--设置新to� 鸬 定时器调用次数
	LuaFnSetCopySceneData_Param( sceneId, x808002_g_ScnParam["tim"], TickCount )

	--副本关闭标志
	local	LeaveFlag	= LuaFnGetCopySceneData_Param( sceneId, x808002_g_ScnParam["cls"] )
	--报名倒计时
	local	JoinFlag	= LuaFnGetCopySceneData_Param( sceneId, x808002_g_ScnParam["jon"] )

	--获取场景中玩家人数
	local	mem_num		= LuaFnGetCopyScene_HumanCount( sceneId )
	local	mem_obj		= LuaFnGetCopyScene_HumanObjId( sceneId, 0 )
	--根据玩家等c获取组别信息
	local	ActID, ActMinLev, _	= CallScriptFunction( x808002_g_ScriptId_Ctrl, "GetGroupInfo", sceneId, mem_obj )

	--获取m祎 c醝回合中to� 鸬 报名时间长度
	local	JoinTime	= CallScriptFunction( x808002_g_ScriptId_Ctrl, "GetJoinTime", sceneId, x808002_g_TickTime )
	--获取m祎 c醝回合中to� 鸬 比武时间长度
	local	AttackTime= CallScriptFunction( x808002_g_ScriptId_Ctrl, "GetAttackTime", sceneId, x808002_g_TickTime )
	AttackTime			= JoinTime + AttackTime

	--时间校验
	local	CheckTime	= LuaFnGetCopySceneData_Param( sceneId, x808002_g_ScnParam["chk"] )
	if JoinTime > CheckTime then
		JoinTime			= JoinTime - CheckTime
	else
		JoinTime			= 0
	end
	if AttackTime > CheckTime then
		AttackTime		= AttackTime - CheckTime
	else
		AttackTime		= 0
	end

	if LeaveFlag < 1 then
	--比武进行中

		if JoinFlag == 0 then
		--喧ng否开始倒计时
			if TickCount == JoinTime then
				LuaFnSetCopySceneData_Param( sceneId, x808002_g_ScnParam["jon"], x808002_g_JoinTick )
			elseif TickCount > JoinTime then
				LuaFnSetCopySceneData_Param( sceneId, x808002_g_ScnParam["jon"], -1 )
				--比武开始
				for i = 0, mem_num - 1 do
					mem_obj	= LuaFnGetCopyScene_HumanObjId( sceneId, i )
					if LuaFnIsObjValid( sceneId, mem_obj ) ~= 1 then
						break
					end
					--设置玩家to� 鸬 指定Pvp授权位
					SetPvpAuthorizationFlagByID( sceneId, mem_obj, 2, 1 )			--2喧ng竞技授权标记
				end
			end
		elseif JoinFlag > 0 then
		--报名倒计时
			LuaFnSetCopySceneData_Param( sceneId, x808002_g_ScnParam["jon"], JoinFlag-1 )
			for i = 0, mem_num - 1 do
				mem_obj	= LuaFnGetCopyScene_HumanObjId( sceneId, i )
				if LuaFnIsObjValid( sceneId, mem_obj ) ~= 1 then
					break
				end
				str		= format( "Th� v� s� b 馥u sau %d gi鈟", JoinFlag * x808002_g_TickTime )
				x808002_MsgBox( sceneId, mem_obj, str )
			end
		end

		--比武喧ng否到时
		if TickCount == (AttackTime-12) then
			--比武即将结束,提前m祎  ph鷗全球公告
			if ActMinLev ~= nil then
				str		= format( x808002_g_Msg["n_son"], ActMinLev, 1 )
				x808002_MyGlobalNews( sceneId, str )
			end
		elseif TickCount >= AttackTime then
			--比武结束
			LuaFnSetCopySceneData_Param( sceneId, x808002_g_ScnParam["cls"], 1 )
		end
		--扫描会场
		x808002_OnScanScene( sceneId )

	elseif LeaveFlag == 1 then
	--比武已结束
		LuaFnSetCopySceneData_Param( sceneId, x808002_g_ScnParam["cls"], LeaveFlag+1 )
		x808002_OnScanRoom( sceneId, mem_num )
	elseif LeaveFlag < x808002_g_CloseTick then
	--倒计时
		LuaFnSetCopySceneData_Param( sceneId, x808002_g_ScnParam["cls"], LeaveFlag+1 )
		for i = 0, mem_num - 1 do
			mem_obj	= LuaFnGetCopyScene_HumanObjId( sceneId, i )
			if LuaFnIsObjValid( sceneId, mem_obj ) ~= 1 then
				break
			end
			str			= format( "C醕 h� s� r秈 kh鰅 n絠 n鄖 trong v騨g %d gi鈟 n鎍!", ( x808002_g_CloseTick - LeaveFlag ) * x808002_g_TickTime )
			x808002_MsgBox( sceneId, mem_obj, str )
		end
	elseif LeaveFlag == x808002_g_CloseTick then
	--回城
		LuaFnSetCopySceneData_Param( sceneId, x808002_g_ScnParam["cls"], LeaveFlag+1 )	--设置副本关闭标志
		for i = 0, mem_num - 1 do
			mem_obj	= LuaFnGetCopyScene_HumanObjId( sceneId, i )
			if LuaFnIsObjValid( sceneId, mem_obj ) ~= 1 then
				break
			end
			--设置玩家to� 鸬 指定Pvp授权位
			--SetPvpAuthorizationFlagByID( sceneId, mem_obj, 2, 0 )			--2喧ng竞技授权标记
			if LuaFnIsCharacterLiving( sceneId, mem_obj ) == 1 then
				x808002_OnGoBack( sceneId, mem_obj )
			end
		end
		
		--全球公告
		if ActMinLev ~= nil then
			str			= format( x808002_g_Msg["n_end"], ActMinLev )
			x808002_MyGlobalNews( sceneId, str )
		end
	end

end

--**********************************
--比武结束扫描会场
--规则: 活动结束to� 鸬 时候对地图所有房间
--扫描m祎 次,房间人数>1to� 鸬 任务th b読,传
--送至T� Ch鈛报名地 餴琺旁边to� 鸬 位置.
--**********************************
function x808002_OnScanRoom( sceneId, mem_num )

	--扫描会场玩家
	local mem_lst		= {}
	local mem_px		= {}
	local mem_pz		= {}
	for i = 0, mem_num - 1 do
		mem_lst[i]						= LuaFnGetCopyScene_HumanObjId( sceneId, i )
		mem_px[i], mem_pz[i]	= GetWorldPos( sceneId, mem_lst[i] )
	end

	--扫描32c醝房间,决定胜负
	local	rom_px, rom_pz		--每c醝房间to� 鸬 左上角坐标
	local	num, id
	for i = 0, 31 do
		px_mod	= i - floor( i /4 ) * 4
		pz_mul	= floor( i / 4 )
		rom_px	= floor( px_mod * 64 )
		rom_pz	= floor( pz_mul * 64 )
		
		num			= 0
		id			= -1
		for j = 0, mem_num - 1 do
			if num >= 2 then
				break
			end
			if mem_px[j] > rom_px and mem_px[j] < (rom_px+64) and
				mem_pz[j] > rom_pz and mem_pz[j] < (rom_pz+64) and
				LuaFnIsObjValid( sceneId, mem_lst[j] ) == 1 and
				LuaFnIsCharacterLiving( sceneId, mem_lst[j] ) == 1 then
				num	= num + 1
				id	= j
			end
		end

		--判断玩家胜负
		if num == 1 then
			--喧ng否已经T読 本轮th b読过,以防范复活技能
			if GetMissionData( sceneId, mem_lst[id], MD_DATAOSHA_RESULT ) == -10 then
				x808002_MsgBox( sceneId, mem_lst[id], x808002_g_Msg["r_fal"] )
				x808002_MsgBox( sceneId, mem_lst[id], x808002_g_Msg["r_flx"] )
			else
				--记录比武结果
				SetMissionData( sceneId, mem_lst[id], MD_DATAOSHA_RESULT, 10 )
				x808002_MsgBox( sceneId, mem_lst[id], x808002_g_Msg["r_win"] )
				x808002_MsgBox( sceneId, mem_lst[id], x808002_g_Msg["r_wnx"] )
				LuaFnSendSystemMail( sceneId, GetName( sceneId, mem_lst[id] ), x808002_g_Msg["r_mal"] )
			end
		end
	end

end

--**********************************
--扫描会场
--获胜者传出副本
--**********************************
function x808002_OnScanScene( sceneId )

	--获取场景中玩家人数
	local	mem_num		= LuaFnGetCopyScene_HumanCount( sceneId )
	for i = 0, mem_num - 1 do
		mem_obj				= LuaFnGetCopyScene_HumanObjId( sceneId, i )
		if LuaFnIsObjValid( sceneId, mem_obj ) ~= 1 then
			break
		end
		--单回合获胜标记,胜利者传出
		if GetMissionFlag( sceneId, mem_obj, MF_DATAOSHA_WIN ) == 1 and
			LuaFnIsCharacterLiving( sceneId, mem_obj ) == 1
		then
			x808002_OnGoBack( sceneId, mem_obj )
		end
	end

end

--**********************************
--回城
--**********************************
function x808002_OnGoBack( sceneId, selfId )

	NewWorld( sceneId, selfId, x808002_g_BackCity["scn"], x808002_g_BackCity["px"], x808002_g_BackCity["pz"] )
	--Add Log
	LogInfo	= format( "[TAOSHA]: x808002_OnGoBack( sceneId=%d, GUID=%0X ), BackScn=%d, BackX=%d, BackY=%d",
		sceneId,
		LuaFnObjId2Guid( sceneId, selfId ),
		x808002_g_BackCity["scn"],
		x808002_g_BackCity["px"],
		x808002_g_BackCity["pz"] )
	MissionLog( sceneId, LogInfo )

end

--**********************************
--获取某玩家此次比武to� 鸬 当前回合数
--**********************************
function x808002_GetMyCurrentRound( sceneId, selfId )

	rnd_MD		= GetMissionData( sceneId, selfId, MD_DATAOSHA_ROUND )
	rnd_dat		= floor( rnd_MD / 100 )
	rnd_rnd		= mod( rnd_MD, 100 )
	if rnd_dat ~= GetDayTime() then
		return 0
	end
	return rnd_rnd

end

--**********************************
--醒目提示
--**********************************
function x808002_MsgBox( sceneId, selfId, Msg )

	if Msg == nil then
		return
	end
	--喧ng否处于无法执行逻辑to� 鸬 状态
	if LuaFnIsCanDoScriptLogic( sceneId, selfId ) ~= 1 then
		return
	end

	BeginEvent( sceneId )
		AddText( sceneId, Msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

	--Add Log
	LogInfo	= format( "[TAOSHA]: x808002_MsgBox( sceneId=%d, GUID=%0X ), %s",
		sceneId,
		LuaFnObjId2Guid( sceneId, selfId ),
		Msg )
	MissionLog( sceneId, LogInfo )

end

--**********************************
--全球公告
--**********************************
function x808002_MyGlobalNews( sceneId, Msg )

	if Msg == nil then
		return
	end

	AddGlobalCountNews( sceneId, Msg )
	--Add Log
	MissionLog( sceneId, "[TAOSHA]: "..Msg )

end
