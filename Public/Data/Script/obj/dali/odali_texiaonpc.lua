--NPC演示技能特效用
--演示NPC
--普通
--C醝 n鄖 NPC最好喧ng不会还手,可攻击,但喧ng不会受到任何伤害
--脚本号
x801007_g_ScriptId = 801007;

--要演示to� 鸬 技能列表 
x801007_g_DemoSkills = {};
--声明方法:   x801007_g_DemoSkills[技能to� 鸬 编号] = "技能to� 鸬 T阯"; 注: 后面会把技能to� 鸬 编号当事件号使用 

x801007_g_DemoSkills[850]="Vui v� 3";
x801007_g_DemoSkills[851]="H癷 phong Ph li璾";
x801007_g_DemoSkills[852]="H鎢 th叨ng v� th叨ng";
x801007_g_DemoSkills[853]="V� ch鷑g sinh t呔ng";
x801007_g_DemoSkills[854]="Phi Kh� Phi Vinh";
x801007_g_DemoSkills[855]="Kim Ng鱟 M鉵 羞秐g";
x801007_g_DemoSkills[856]="醒ng l阯 th鄋h Ph";
x801007_g_DemoSkills[857]="衋n ph唼ng tri玼 d呓ng";
x801007_g_DemoSkills[858]="B誧h C鈛 Qu� Kh韈h";
x801007_g_DemoSkills[859]="Thi猽 Tr誧h Ki猰";
x801007_g_DemoSkills[860]="Th呓ng d呓ng ki猰";
x801007_g_DemoSkills[861]="Thi猽 d呓ng ki猰";
x801007_g_DemoSkills[862]="B誧h H皀g Qu醤 Nh";
x801007_g_DemoSkills[863]="C鋓 trang th鄋h d鈔 th叨ng 餴 tu";
x801007_g_DemoSkills[864]="V課 n呔c 皙n tri玼";

--所拥有to� 鸬 事件Id列表
x801007_g_eventList={850,851,852,853,854,855,856,857,858,859,860,861,862,863,864};
--**********************************
--事件交互入口
--**********************************
function x801007_OnDefaultEvent( sceneId, selfId,targetId )
	AbilityLevel = QueryHumanAbilityLevel( sceneId, selfId, ABILITY_ZHONGZHI);
	BeginEvent(sceneId);
	AddText(sceneId, "    Hoan ngh阯h 疸 t緄. Xin m秈 l馻 ch鱪 c醕 k� n錸g mu痭 th錷 quan");
--	for i=1,getn(x801007_g_eventList) do 
	for nIdx, nEvent in x801007_g_eventList do
		--添加演示技能to� 鸬 按钮 
		AddNumText(sceneId, nEvent, x801007_g_DemoSkills[nEvent],11,-1);
	end
	EndEvent(sceneId);
	DispatchEventList(sceneId, selfId, targetId);

end

--**********************************
--事件列表选中m祎 项
--**********************************
function x801007_OnEventRequest( sceneId, selfId, targetId, eventId )
	--问题selfId,和TargetId分别喧ng什么to� 鸬 ID? 
	LuaFnUnitUseSkill(sceneId, selfId, eventId,targetId, 1,0,0,0,0);
	--CallScriptFunction( 801007, "LuaFnUnitUseSkill",sceneId, selfId, eventId, targetId );
	--return;
end
