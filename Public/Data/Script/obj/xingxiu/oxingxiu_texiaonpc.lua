--NPC演示技能特效用
--演示NPC
--普通
--C醝 n鄖 NPC最好喧ng不会还手,可攻击,但喧ng不会受到任何伤害
--脚本号
x801006_g_ScriptId = 801006;

--要演示to� 鸬 技能列表 
x801006_g_DemoSkills = {};
--声明方法:   x801006_g_DemoSkills[技能to� 鸬 编号] = "技能to� 鸬 T阯"; 注: 后面会把技能to� 鸬 编号当事件号使用 

x801006_g_DemoSkills[834]="Li阯 Ch鈛 H� Thi 械c";
x801006_g_DemoSkills[835]="Th tinh th c痶";
x801006_g_DemoSkills[836]="唌 Tr Ch� Kh醫";
x801006_g_DemoSkills[837]="朽 N� 芯i Thu�";
x801006_g_DemoSkills[838]="Ti陁 啸u Lan Ng誧h";
x801006_g_DemoSkills[839]="Di Hoa Ti猵 M礳";
x801006_g_DemoSkills[840]="Ti猽 L� T鄋g 衋o";
x801006_g_DemoSkills[841]="Ti猽 Kh Th叨ng Khai";
x801006_g_DemoSkills[842]="Ti猽 Ng� Gi鋓 Di";
x801006_g_DemoSkills[843]="H鄊 Sa X� 膎h";
x801006_g_DemoSkills[844]="T� Di畁 S� Ca";
x801006_g_DemoSkills[845]="Ngai Nh唼c M礳 K�";
x801006_g_DemoSkills[846]="Th鼀 Y阭 Th Qu鈔";
x801006_g_DemoSkills[847]="H鄋h Thi T Nh鴆";
x801006_g_DemoSkills[848]="羉 Qu醤 M鉵 Doanh";
--所拥有to� 鸬 事件Id列表
x801006_g_eventList={834,835,836,837,838,839,840,841,842,843,844,845,846,847,848};
--**********************************
--事件交互入口
--**********************************
function x801006_OnDefaultEvent( sceneId, selfId,targetId )
	AbilityLevel = QueryHumanAbilityLevel( sceneId, selfId, ABILITY_ZHONGZHI);
	BeginEvent(sceneId);
	AddText(sceneId, "    Hoan ngh阯h 疸 t緄. Xin m秈 l馻 ch鱪 c醕 k� n錸g mu痭 th錷 quan.");
--	for i=1,getn(x801006_g_eventList) do 
	for nIdx, nEvent in x801006_g_eventList do
		--添加演示技能to� 鸬 按钮 
		AddNumText(sceneId, nEvent, x801006_g_DemoSkills[nEvent]);
	end
	EndEvent(sceneId);
	DispatchEventList(sceneId, selfId, targetId);

end

--**********************************
--事件列表选中m祎 项
--**********************************
function x801006_OnEventRequest( sceneId, selfId, targetId, eventId )
	--问题selfId,和TargetId分别喧ng什么to� 鸬 ID? 
	LuaFnUnitUseSkill(sceneId, selfId, eventId,targetId,1,0,0,0,0);
	--CallScriptFunction( 801006, "LuaFnUnitUseSkill",sceneId, selfId, eventId, targetId );
	--return;
end
