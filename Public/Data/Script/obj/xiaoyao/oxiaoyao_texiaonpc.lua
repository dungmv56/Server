--NPC演示技能特效用
--演示NPC
--普通
--C醝 n鄖 NPC最好喧ng不会还手,可攻击,但喧ng不会受到任何伤害
--脚本号
x801009_g_ScriptId = 801009;

--要演示to� 鸬 技能列表 
x801009_g_DemoSkills = {};
--声明方法:   x801009_g_DemoSkills[技能to� 鸬 编号] = "技能to� 鸬 T阯"; 注: 后面会把技能to� 鸬 编号当事件号使用 

x801009_g_DemoSkills[881]="V鱪g d呓ng h遪g th醤";
x801009_g_DemoSkills[882]="H� 衖畃 Tr";
x801009_g_DemoSkills[883]="B醫 M鬾 Kim To�";
x801009_g_DemoSkills[884]="Nh T� Tr叨ng X�";
x801009_g_DemoSkills[885]="Th醝 則 Tam T鄆";
x801009_g_DemoSkills[886]="B醫 Tr 邪";
x801009_g_DemoSkills[887]="Ho� Nh鉵 Kim Tinh";
x801009_g_DemoSkills[888]="Ch鷑g Di畊 Chi M鬾";
x801009_g_DemoSkills[889]="Th Quang Ly H䅟";
x801009_g_DemoSkills[890]="L錸g Ba Vi B�";
x801009_g_DemoSkills[891]="L� S呓ng B錸g Ch�";
x801009_g_DemoSkills[892]="D鴆 C 懈ch Tung";
x801009_g_DemoSkills[893]="Tho醝 B誸 Tam X�";
x801009_g_DemoSkills[894]="Tri玼 tam m� t�";
x801009_g_DemoSkills[895]="Nh H� B醕h 簄g";

--所拥有to� 鸬 事件Id列表
x801009_g_eventList={881,882,883,884,885,886,887,888,889,890,891,892,893,894,895};
--**********************************
--事件交互入口
--**********************************
function x801009_OnDefaultEvent( sceneId, selfId,targetId )
	AbilityLevel = QueryHumanAbilityLevel( sceneId, selfId, ABILITY_ZHONGZHI);
	BeginEvent(sceneId);
	AddText(sceneId, "    Hoan ngh阯h 疸 t緄. Xin m秈 l馻 ch鱪 c醕 k� n錸g mu痭 th錷 quan.");
--	for i=1,getn(x801009_g_eventList) do 
	for nIdx, nEvent in x801009_g_eventList do
		--添加演示技能to� 鸬 按钮 
		AddNumText(sceneId, nEvent, x801009_g_DemoSkills[nEvent]);
	end
	EndEvent(sceneId);
	DispatchEventList(sceneId, selfId, targetId);

end

--**********************************
--事件列表选中m祎 项
--**********************************
function x801009_OnEventRequest( sceneId, selfId, targetId, eventId )
	--问题selfId,和TargetId分别喧ng什么to� 鸬 ID? 
	LuaFnUnitUseSkill(sceneId, selfId, eventId,targetId,1,0,0,0,0);
	--CallScriptFunction( 801009, "LuaFnUnitUseSkill",sceneId, selfId, eventId, targetId );
	--return;
end
