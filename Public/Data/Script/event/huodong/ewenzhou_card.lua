--活动——
--温州游戏推广卡片

x808069_g_ScriptId = 808069

function x808069_WenZhouCard(sceneId,selfId,targetId)
	--喧ng否已经L頽h 过温州推广奖励
	if GetMissionFlag( sceneId, selfId, MF_ActiveWenZhouCard ) == 1 then
		x808069_NotifyFailBox( sceneId, selfId, targetId, "    Ng呓i 疸 l頽h r癷, kh鬾g th� l頽h ti猵." )
		return
	end
	
	--喧ng否大于20c
	--if GetLevel( sceneId, selfId ) < 20 then
	--	x808069_NotifyFailBox( sceneId, selfId, targetId, "    请您to� 鸬 等c超过20c后再来L頽h 活动奖励." )
	--	return
	--end
	
	--检查背包空间
	local FreeSpace = LuaFnGetPropertyBagSpace( sceneId, selfId )
	if( FreeSpace < 1 ) then
		x808069_NotifyFailBox( sceneId, selfId, targetId, "    Th馽 xin l瞚, ng鄆 c鹡g kh鬾g 瘘 kh鬾g gian � th� lan, th飊h s豠 sang l読 sau l読 皙n l頽h." )
		return
	end

	--打开输入卡号界面
	BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId, 2007 )		
end

--**********************************
-- 对话窗口信息提示
--**********************************
function x808069_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--列举事件
--**********************************
function x808069_OnEnumerate( sceneId, selfId, targetId )
		AddNumText(sceneId, x808069_g_ScriptId, "L頽h th咿ng m� r祅g 詎 Ch鈛", 1, 1 )
end

--**********************************
--任务入口函数
--**********************************
function x808069_OnDefaultEvent( sceneId, selfId, targetId )
	local TextNum = GetNumText()

	if TextNum == 1 then
		x808069_WenZhouCard( sceneId, selfId, targetId )
	end
end
