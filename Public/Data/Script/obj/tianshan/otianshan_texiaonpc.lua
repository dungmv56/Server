--NPC演示技能特效用
--演示NPC
--普通
--C醝 n鄖 NPC最好喧ng不会还手,可攻击,但喧ng不会受到任何伤害
--脚本号
x801008_g_ScriptId = 801008;

--要演示to� 鸬 技能列表 
x801008_g_DemoSkills = {};
--声明方法:   x801008_g_DemoSkills[技能to� 鸬 编号] = "技能to� 鸬 T阯"; 注: 后面会把技能to� 鸬 编号当事件号使用 

x801008_g_DemoSkills[865]="L誧 m礳 ti陁 ti陁";
x801008_g_DemoSkills[866]="V鱪g mai ch� kh醫";
x801008_g_DemoSkills[867]="D呓ng Quan Tam 衖畃";
x801008_g_DemoSkills[868]="D呓ng ph� 鈓 ph鋘";
x801008_g_DemoSkills[869]="D呓ng Ca Thi阯 Qu鈔";
x801008_g_DemoSkills[870]="D呓ng Xu鈔 B誧h Tuy猼";
x801008_g_DemoSkills[871]="姓p tuy猼 v� ng鈔";
x801008_g_DemoSkills[872]="Quy t裞 c鬾g";
x801008_g_DemoSkills[873]="M鬷 h� r錸g l課h";
x801008_g_DemoSkills[874]="Th Di畁 Mai Ph鴆";
x801008_g_DemoSkills[875]="Bao bi畁 l鄊 thay";
x801008_g_DemoSkills[876]="Qui kh� lai h�";
x801008_g_DemoSkills[877]="Bg h� ng� phong";
x801008_g_DemoSkills[878]="T頽h 膎h Tr B韈h";
x801008_g_DemoSkills[879]="姓i t唼ng v� h靚h";

--所拥有to� 鸬 事件Id列表
x801008_g_eventList={865,866,867,868,869,870,871,872,873,874,875,876,877,878,879};
--**********************************
--事件交互入口
--**********************************
function x801008_OnDefaultEvent( sceneId, selfId,targetId )
	AbilityLevel = QueryHumanAbilityLevel( sceneId, selfId, ABILITY_ZHONGZHI);
	BeginEvent(sceneId);
	AddText(sceneId, "    Hoan ngh阯h 疸 t緄. Xin m秈 l馻 ch鱪 c醕 k� n錸g mu痭 th錷 quan.");
--	for i=1,getn(x801008_g_eventList) do 
	for nIdx, nEvent in x801008_g_eventList do
		--添加演示技能to� 鸬 按钮 
		AddNumText(sceneId, nEvent, x801008_g_DemoSkills[nEvent]);
	end
	EndEvent(sceneId);
	DispatchEventList(sceneId, selfId, targetId);

end

--**********************************
--事件列表选中m祎 项
--**********************************
function x801008_OnEventRequest( sceneId, selfId, targetId, eventId )
	--问题selfId,和TargetId分别喧ng什么to� 鸬 ID? 
	LuaFnUnitUseSkill(sceneId, selfId, eventId, targetId,1,0,0,0,0);
	--CallScriptFunction( 801008, "LuaFnUnitUseSkill",sceneId, selfId, eventId , targetId);
	--return;
end
