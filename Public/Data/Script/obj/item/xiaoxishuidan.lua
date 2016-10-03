-- 300043 
-- Ti瑄 T T鼀 衋n
-- 使用之后可以将选择属性to� 鸬 分配 餴琺数中to� 鸬 5 餴琺变为潜能.


-- 脚本号
x300043_g_scriptId = 300043
x300043_g_ItemId = 30008005  -- 药水ID
x300043_g_UseScriptId = 300053
--**********************************
-- 事件交互入口
--**********************************
function x300043_OnDefaultEvent( sceneId, selfId )
	BeginEvent(sceneId)
		AddText(sceneId, "#YTi瑄 T T鼀 衋n")
		AddText(sceneId, "  Sau khi s� d鴑g c� th� mang b k� 1 thu礳 t韓h n鄌 疸 ph ph痠 l #Y5 餴琺#Wbi猲 th鄋h ti玬 n錸g.")
		AddNumText(sceneId, x300043_g_UseScriptId,"Ch飊h 5 餴琺 C叨ng l馽", 0, 1)
		AddNumText(sceneId, x300043_g_UseScriptId,"Ch飊h 5 餴琺 N礽 l馽", 0, 2)
		AddNumText(sceneId, x300043_g_UseScriptId,"Ch飊h 5 餴琺 Th� l馽", 0, 3)
		AddNumText(sceneId, x300043_g_UseScriptId,"Ch飊h 5 餴琺 Tr� l馽", 0, 4)
		AddNumText(sceneId, x300043_g_UseScriptId,"Ch飊h 5 餴琺 Th鈔 ph醦", 0, 5)
		AddNumText(sceneId, x300043_g_UseScriptId,"Sau n鄖 h銀 t韓h", 0, 6)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,-1)
	
end


--**********************************
-- 
--**********************************
function x300043_IsSkillLikeScript( sceneId, selfId)
	return 0
end

function x300043_WashPoint(sceneId, selfId, nType, nPoint, szStr)
	-- 扣除相关to� 鸬 物品
	local ret = DelItem(sceneId, selfId, x300043_g_ItemId, 1)
	if ret == 1  then
		local nNumber = LuaFnWashSomePoints(sceneId, selfId, nType, nPoint)
		
		BeginEvent(sceneId)
			AddText(sceneId, "#YTi瑄 T T鼀 衋n")
			AddText(sceneId, "  C醕 h� mang th鄋h c鬾g #Y" .. tonumber(nNumber) .. " 餴琺#W疸 ph鈔 ph痠 c黙#Y" .. szStr.. "#Wthu礳 t韓h bi猲 th鄋h ti玬 n錸g.")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,-1)
	end		

end
