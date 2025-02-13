-- 师徒情深任务
-- 创建人   [ QUFEI 2007-09-04 13:13 UPDATE ]	    
-- 脚本号
x806019_g_ScriptId = 806019

--事件
x806019_g_Update = {

    ["id01"] = 15,    

}

--提示信息
x806019_g_msg = {

    ["st"]	= "S� 鸢 t靚h th鈓",
    
}

x806019_g_Impact = {

		8010,
		8011,
		8012,
		8013,
		8014,
		8015,
		8016,
		8017,
		8018,
		8019,
		30151,
		30152,
		30153,
		30154,
		30155,
		30156,
		30157,
		30158,
		30159,
		30160,
		}

--**********************************
--任务入口函数
--**********************************
function x806019_OnDefaultEvent( sceneId, selfId, targetId )
    -- [ QUFEI 2007-08-31 13:13 UPDATE BugID #24277 ]	    
    -- 教师节L頽h 师徒情深Buff            
    local	key	= GetNumText()
    
    if key == x806019_g_Update["id01"] then
        -- [ QUFEI 2007-08-31 13:13 UPDATE BugID #24277 ]	
        -- 教师节L頽h 师徒情深Buff            
        local nMonth = LuaFnGetThisMonth()
        local nDay   = LuaFnGetDayOfThisMonth()
        local nData  = (nMonth+1)*100+nDay
        -- PrintNum(nData)
        if (nData ~= 0 and nData == 910)  then          
            x806019_OnShiTuQingShen( sceneId, selfId, targetId )
            return 0
        else          
            x806019_MessageBox(sceneId, selfId, "xin l瞚 ch� c� ng鄖 20-11 m緄 c� th� nh buff.")
            return 0		
        end               
    end
    
end

--**********************************
--列举事件
--**********************************
function x806019_OnEnumerate( sceneId, selfId, targetId )	

    -- [ QUFEI 2007-08-31 13:13 UPDATE BugID #24277 ]	
    -- 教师节L頽h 师徒情深Buff
    local nMonth = LuaFnGetThisMonth()
    local nDay   = LuaFnGetDayOfThisMonth()
    local nData  = (nMonth+1)*100+nDay
        
    if (nData ~= 0 and nData == 910)  then
        AddNumText( sceneId, x806019_g_ScriptId, x806019_g_msg["st"], 6, x806019_g_Update["id01"] )
    end

end

--**********************************
--检测Ti猵 th跫�
--**********************************
function x806019_CheckAccept( sceneId, selfId, targetId )
end

--**********************************
--Ti猵 th�
--**********************************
function x806019_OnAccept( sceneId, selfId, targetId )	
end

--**********************************
--提交
--**********************************
function x806019_OnSubmit( sceneId, selfId, targetId, tId )
end

--**********************************
--拒绝
--**********************************
function x806019_OnCancel( sceneId, selfId, targetId )
end

--**********************************
--对话窗口信息提示
--**********************************
function x806019_MessageBox( sceneId, selfId, msg )
	BeginEvent( sceneId )
        AddText( sceneId, msg )
    EndEvent( sceneId )
    DispatchMissionTips( sceneId, selfId )		
end

function x806019_OnShiTuQingShen( sceneId, selfId, targetId )
    -- [ QUFEI 2007-08-31 13:13 UPDATE BugID #24277 ]	    
    -- 教师节L頽h 师徒情深Buff            
    -- 检测L頽h 条件
    -- L頽h 者喧ng否处于组队状态
    if LuaFnHasTeam( sceneId, selfId ) == 0 then        
        x806019_MessageBox( sceneId, selfId, "Xin l瞚, s� 鸢 2 ng叨i ph鋓 t� 鸬i v緄 nhau m緄 c� th� nh l頽h h鄌 quang S� 鸢 t靚h th鈓" )				
        return 0
    end
    
    -- L頽h 者喧ng否为队长
    if LuaFnIsTeamLeader( sceneId, selfId ) == 0 then                
        x806019_MessageBox( sceneId, selfId, "Xin l瞚, ph鋓 l� 鸬i tr叻ng m緄 c� th� nh l頽h h鄌 quang S� 鸢 t靚h th鈓" )				
				return 0
		end
    
    -- 组队中只有两c醝人
    if LuaFnGetTeamSize( sceneId, selfId ) ~= 2 then
        x806019_MessageBox( sceneId, selfId, "Xin l瞚, s� 鸢 2 ng叨i ph鋓 t� 鸬i v緄 nhau m緄 c� th� nh l頽h h鄌 quang S� 鸢 t靚h th鈓" )						
        return 0
		end 
    
    local TeamSizeSameScene = LuaFnGetTeamSceneMemberCount( sceneId, selfId )    
        
    -- 组队中to� 鸬 两c醝人必须T読 同m祎 场景
    if TeamSizeSameScene ~=1 then
        x806019_MessageBox( sceneId, selfId, "Xin l瞚, s� 鸢 2 ng叨i ph鋓 t� 鸬i v緄 nhau m緄 c� th� nh l頽h h鄌 quang S� 鸢 t靚h th鈓" )						
        return 0
		end 
    
    -- 组队中to� 鸬 两c醝人必须都T読 附近
    local	numMem	= GetNearTeamCount( sceneId, selfId )
    if numMem ~= LuaFnGetTeamSize( sceneId, selfId ) then                
        x806019_MessageBox( sceneId, selfId, "Xin l瞚, s� 鸢 c醕 ng呓i 皤u ph鋓 � khu v馽 ph� c m緄 c� th� nh l頽h h鄌 quang S� 鸢 t靚h th鈓" )				
        return 0
    end
    
    local theID = LuaFnGetTeamSceneMember( sceneId, selfId, 0 )       
        
    -- L頽h 者喧ng否为师徒
    if LuaFnIsMaster(sceneId, selfId, theID) == 1 or LuaFnIsMaster(sceneId, theID, selfId) == 1 then
        -- 奖励            
        -- PrintNum(selfId)
        -- PrintNum(theID)
        x806019_OnAddImpact( sceneId, selfId, 0 )        
        x806019_OnAddImpact( sceneId, selfId, theID )        
    else            
        x806019_MessageBox( sceneId, selfId, "Xin l瞚, s� 鸢 2 ng叨i ph鋓 t� 鸬i v緄 nhau m緄 c� th� nh l頽h h鄌 quang S� 鸢 t靚h th鈓" )				
        return 0
    end
       
end

-- L頽h 师徒情深Buff
function x806019_OnAddImpact( sceneId, selfId, theID )
    
    local level = 0
    if theID == 0 then
        level = GetLevel(sceneId, selfId)    
    elseif theID ~= 0 and selfId ~= 0 then
        level = GetLevel(sceneId, theID)    
    end    
	local impactID = x806019_g_Impact[1]

    -- PrintNum(selfId)
    -- PrintNum(theID)
    -- PrintNum(otherLevel)

	if level > 190 then
		impactID = x806019_g_Impact[20]
	elseif level > 180 then
		impactID = x806019_g_Impact[19]
	elseif level > 170 then
		impactID = x806019_g_Impact[18]
	elseif level > 160 then
		impactID = x806019_g_Impact[17]
	elseif level > 150 then
		impactID = x806019_g_Impact[16]
	elseif level > 140 then
		impactID = x806019_g_Impact[15]
	elseif level > 130 then
		impactID = x806019_g_Impact[14]
	elseif level > 120 then
		impactID = x806019_g_Impact[13]
	elseif level > 110 then
		impactID = x806019_g_Impact[12]
	elseif level > 100 then
		impactID = x806019_g_Impact[11]
	elseif level > 90 then
		impactID = x806019_g_Impact[10]
	elseif level > 80 then
		impactID = x806019_g_Impact[9]
	elseif level > 70 then
		impactID = x806019_g_Impact[8]
	elseif level > 60 then
		impactID = x806019_g_Impact[7]
	elseif level > 50 then
		impactID = x806019_g_Impact[6]
	elseif level > 40 then
		impactID = x806019_g_Impact[5]
	elseif level > 30 then
		impactID = x806019_g_Impact[4]
	elseif level > 20 then
		impactID = x806019_g_Impact[3]
	elseif level > 10 then
		impactID = x806019_g_Impact[2]
	else
		impactID = x806019_g_Impact[1]
	end

    -- PrintNum(impactID)
    if theID == 0 then
        LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, impactID, 0);
    elseif theID ~= 0 and selfId ~= 0 then
        LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, theID, impactID, 0);
    end    
	
end
