-- 125014
-- 修理装备

--脚本号
x125014_g_scriptId = 125014

--所拥有to� 鸬 事件ID列表
x125014_g_eventList={}

--**********************************
--事件列表
--**********************************
function x125014_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"Ta c� th� s豠 ch鎍 v ph c 40 tr� l阯 m k� l� trang b�, v� kh�, ph騨g c�, trang s裞. B qu� c鹡g 餫ng l� v� ta n錷 痼 h鱟 ngh� th秈 餴琺 痼 c醝 g� 皤u c鋗 th h裯g th�, cho n阯 t誳 th鄋h ta 鸠i th� n鄌 c鵱g l鷆 c鹡g kh鬾g t韓h tinh th鬾g. Cho n阯 ta s豠 ch鎍 th秈 餴琺 x醕 xu th鄋h c鬾g kh鬾g ph鋓 100#. N猽 ng呓i kh鬾g c� g� th m, t靘 ta gi鷓 ng呓i s豠 ch鎍 餴.")
		AddNumText(sceneId,x125014_g_scriptId,"Ta mu痭 s豠 ch鎍 trang b�",6,1)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件列表选中m祎 项
--**********************************
function x125014_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 1 then
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		UICommand_AddInt( sceneId, -1 )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 19810313 )	
	end
end

