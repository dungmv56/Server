--老烈头

--脚本号
x020009_g_scriptId = 020009

--**********************************
--事件列表
--**********************************
function x020009_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		local  PlayerSex=GetSex(sceneId,selfId)
		if PlayerSex == 0 then
			PlayerSex = " c� n呓ng "
		else
			PlayerSex = "姓i hi畃"
		end
		AddText(sceneId,"  "..PlayerSex.."#{OBJ_caoyuan_0009}")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
