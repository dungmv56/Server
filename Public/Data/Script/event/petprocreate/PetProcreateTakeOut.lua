--珍兽繁殖(取珍兽)
--脚本号 (改成正确脚本号)

x800102_g_scriptId = 800102

function x800102_OnDefaultEvent( sceneId, selfId, targetId )

	--获取玩家当前to� 鸬 珍兽繁殖信息
	local checkRet	= LuaFnCheckPetProcreateTakeOut( sceneId, selfId )
	if checkRet == 1 then
		LuaFnPetProcreateTakeOut( sceneId, selfId )
	end

end

function x800102_OnEnumerate( sceneId, selfId, targetId )

	--(1)繁殖进程中,显示繁殖进度
	--		C黙 ng呓i 珍兽AAA与BBBto� 鸬 珍兽CCC正T読 快乐to� 鸬 嬉戏,再过D ph鷗,就能带着二代珍兽回到你身边.
	--(2)繁殖成功后,L頽h 子珍兽
	AddNumText( sceneId, x800102_g_scriptId, "Nh tr鈔 th� v譨 sinh s鋘", 6, x800102_g_scriptId )

end

--取出繁殖珍兽〖Lybin Oct.24 2006〗
--此函数会T読 Server接收到WGPetProcreateQuestTakeOutResult消息包后,被动执行
--请勿擅自修改
--function x800102_OnTakeOut( sceneId, selfId )
--
--	local	checkRet	= LuaFnCheckPetProcreateTakeOut( sceneId, selfId )
--	if checkRet == 1 then
--		LuaFnPetProcreateTakeOut( sceneId, selfId )
--	end
--end
