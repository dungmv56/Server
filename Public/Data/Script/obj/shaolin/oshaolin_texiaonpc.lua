--NPC演示技能特效用
--演示NPC
--普通
--C醝 n鄖 NPC最好喧ng不会还手,可攻击,但喧ng不会受到任何伤害
--脚本号
x801001_g_ScriptId = 801001;

--要演示to� 鸬 技能列表 
x801001_g_DemoSkills = {};
--声明方法:   x801001_g_DemoSkills[技能to� 鸬 编号] = "技能to� 鸬 T阯"; 注: 后面会把技能to� 鸬 编号当事件号使用 

x801001_g_DemoSkills[752]="Ban kh� ch叻ng";
x801001_g_DemoSkills[753]="Kim Cu絥g Ph鴆 Ma Khuy阯";
x801001_g_DemoSkills[754]="Nh Ph醕h L咿ng T鋘";
x801001_g_DemoSkills[755]="Vi 朽 Ch�";
x801001_g_DemoSkills[756]="Thi猼 B� Sam";
x801001_g_DemoSkills[757]="V� t呔ng ki猵 ch�";
x801001_g_DemoSkills[758]="La H醤 Tr";
x801001_g_DemoSkills[759]="S� T� H痭g";
x801001_g_DemoSkills[760]="T� H鄋g ph� 鸬";
x801001_g_DemoSkills[761]="L� K韓h Nh� Lai";
x801001_g_DemoSkills[762]="Nh V� 械 Giang";
x801001_g_DemoSkills[763]="Kh� qu醤 to鄋 th鈔";
x801001_g_DemoSkills[764]="Ma Kha V� L唼ng";
x801001_g_DemoSkills[765]="衋 La di畃 ch�";
x801001_g_DemoSkills[766]="Kim Chung Tr醥";
 
--所拥有to� 鸬 事件Id列表
x801001_g_eventList={752,753,754,755,756,757,758,759,760,761,762,763,764,765,766};
--**********************************
--事件交互入口
--**********************************
function x801001_OnDefaultEvent( sceneId, selfId,targetId )
	AbilityLevel = QueryHumanAbilityLevel( sceneId, selfId, ABILITY_ZHONGZHI);
	BeginEvent(sceneId);
	AddText(sceneId, "    Hoan ngh阯h 疸 t緄. Xin m秈 l馻 ch鱪 c醕 k� n錸g mu痭 th錷 quan.");
--	for i=1,getn(x801001_g_eventList) do 
	for nIdx, nEvent in x801001_g_eventList do
		--添加演示技能to� 鸬 按钮 
		AddNumText(sceneId, nEvent, x801001_g_DemoSkills[nEvent]);
	end
	EndEvent(sceneId);
	DispatchEventList(sceneId, selfId, targetId);

end

--**********************************
--事件列表选中m祎 项
--**********************************
function x801001_OnEventRequest( sceneId, selfId, targetId, eventId )
	--问题selfId,和TargetId分别喧ng什么to� 鸬 ID? 
	LuaFnUnitUseSkill(sceneId, selfId, eventId,targetId, 1,0,0,0,0);
	--CallScriptFunction( 801001, "LuaFnUnitUseSkill",sceneId, selfId, eventId, targetId );
	--return;
end
