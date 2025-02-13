--使用配方的脚本

--脚本号
x338000_g_scriptId = 338000

x338000_g_SkillBooks = {}

-- ItemTable 号为索引

-- type: 书的类型，1 表示心法，2 表示技能
-- menpaiId: 学习的对应配方号
-- MP_SHAOLIN	= 0
-- MP_MINGJIAO	= 1
-- MP_GAIBANG	= 2
-- MP_WUDANG	= 3
-- MP_EMEI		= 4
-- MP_XINGSU	= 5
-- MP_DALI		= 6
-- MP_TIANSHAN	= 7
-- MP_XIAOYAO	= 8
-- MP_WUMENPAI	= 9

-- needLevel: 研读此书需要的相应人物级别， -1 表示没有要求
-- needXinfa: 研读此书需要的相应心法， -1 表示没有要求
-- needXinfaLevel: 研读此书需要相应心法的等级， -1 表示没有要求
-- specialEffectID: 特效号

-- 门派名称 #{_MENPAI" .. menpaiid .. "}
-- 物品名称 #{_ITEM" .. itemid .. "}
-- 心法名称 #{_XINFA" .. xinfaid .. "}
x338000_g_SkillBooks[30308002] = { type = 1, id = 55, menpaiId = MP_SHAOLIN, needLevel = 35, needXinfa = -1, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308003] = { type = 1, id = 56, menpaiId = MP_MINGJIAO, needLevel = 35, needXinfa = -1, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308004] = { type = 1, id = 57, menpaiId = MP_GAIBANG, needLevel = 35, needXinfa = -1, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308005] = { type = 1, id = 58, menpaiId = MP_WUDANG, needLevel = 35, needXinfa = -1, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308006] = { type = 1, id = 59, menpaiId = MP_EMEI, needLevel = 35, needXinfa = -1, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308007] = { type = 1, id = 60, menpaiId = MP_XINGSU, needLevel = 35, needXinfa = -1, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308008] = { type = 1, id = 61, menpaiId = MP_DALI, needLevel = 35, needXinfa = -1, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308009] = { type = 1, id = 62, menpaiId = MP_TIANSHAN, needLevel = 35, needXinfa = -1, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308010] = { type = 1, id = 63, menpaiId = MP_XIAOYAO, needLevel = 35, needXinfa = -1, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308101] = { type = 1, id = 72, menpaiId = MP_SHAOLIN, needLevel = 80, needXinfa = -1, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308102] = { type = 1, id = 73, menpaiId = MP_MINGJIAO, needLevel = 80, needXinfa = -1, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308103] = { type = 1, id = 74, menpaiId = MP_GAIBANG, needLevel = 80, needXinfa = -1, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308104] = { type = 1, id = 75, menpaiId = MP_WUDANG, needLevel = 80, needXinfa = -1, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308105] = { type = 1, id = 76, menpaiId = MP_EMEI, needLevel = 80, needXinfa = -1, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308106] = { type = 1, id = 77, menpaiId = MP_XINGSU, needLevel = 80, needXinfa = -1, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308107] = { type = 1, id = 78, menpaiId = MP_DALI, needLevel = 80, needXinfa = -1, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308108] = { type = 1, id = 79, menpaiId = MP_TIANSHAN, needLevel = 80, needXinfa = -1, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308109] = { type = 1, id = 80, menpaiId = MP_XIAOYAO, needLevel = 80, needXinfa = -1, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308110] = { type = 1, id = 71, menpaiId = MP_MURONG, needLevel = 80, needXinfa = -1, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308011] = { type = 2, id = 301, menpaiId = MP_SHAOLIN, needLevel = 65, needXinfa = 55, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308012] = { type = 2, id = 331, menpaiId = MP_MINGJIAO, needLevel = 65, needXinfa = 56, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308027] = { type = 2, id = 333, menpaiId = MP_MINGJIAO, needLevel = 45, needXinfa = 73, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308028] = { type = 2, id = 363, menpaiId = MP_GAIBANG, needLevel = 45, needXinfa = 74, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308013] = { type = 2, id = 361, menpaiId = MP_GAIBANG, needLevel = 65, needXinfa = 57, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308014] = { type = 2, id = 391, menpaiId = MP_WUDANG, needLevel = 65, needXinfa = 58, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308029] = { type = 2, id = 393, menpaiId = MP_WUDANG, needLevel = 45, needXinfa = 75, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308015] = { type = 2, id = 421, menpaiId = MP_EMEI, needLevel = 65, needXinfa = 59, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308016] = { type = 2, id = 451, menpaiId = MP_XINGSU, needLevel = 65, needXinfa = 60, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308031] = { type = 2, id = 453, menpaiId = MP_XINGSU, needLevel = 45, needXinfa = 77, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308017] = { type = 2, id = 481, menpaiId = MP_DALI, needLevel = 65, needXinfa = 61, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308032] = { type = 2, id = 483, menpaiId = MP_DALI, needLevel = 45, needXinfa = 78, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308018] = { type = 2, id = 511, menpaiId = MP_TIANSHAN, needLevel = 65, needXinfa = 62, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308033] = { type = 2, id = 513, menpaiId = MP_TIANSHAN, needLevel = 45, needXinfa = 79, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308071] = { type = 2, id = 515, menpaiId = MP_TIANSHAN, needLevel = 45, needXinfa = 62, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308019] = { type = 2, id = 541, menpaiId = MP_XIAOYAO, needLevel = 65, needXinfa = 63, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308034] = { type = 2, id = 543, menpaiId = MP_XIAOYAO, needLevel = 45, needXinfa = 80, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308042] = { type = 2, id = 423, menpaiId = MP_EMEI, needLevel = 30, needXinfa = 27, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308043] = { type = 2, id = 424, menpaiId = MP_EMEI, needLevel = 45, needXinfa = 59, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308030] = { type = 2, id = 425, menpaiId = MP_EMEI, needLevel = 45, needXinfa = 76, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308044] = { type = 2, id = 304, menpaiId = MP_SHAOLIN, needLevel = 30, needXinfa = 3, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308045] = { type = 2, id = 305, menpaiId = MP_SHAOLIN, needLevel = 45, needXinfa = 55, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308026] = { type = 2, id = 303, menpaiId = MP_SHAOLIN, needLevel = 45, needXinfa = 72, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308055] = { type = 2, id = 37, menpaiId = -1, needLevel = 40, needXinfa = -1, needXinfaLevel = -1, specialEffectID = 18 }
x338000_g_SkillBooks[30308060] = { type = 2, id = 364, menpaiId = MP_GAIBANG, needLevel = 45, needXinfa = 57, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308066] = { type = 2, id = 394, menpaiId = MP_WUDANG, needLevel = 45, needXinfa = 58, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308067] = { type = 2, id = 454, menpaiId = MP_XINGSU, needLevel = 45, needXinfa = 60, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308069] = { type = 2, id = 544, menpaiId = MP_XIAOYAO, needLevel = 45, needXinfa = 63, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308070] = { type = 2, id = 334, menpaiId = MP_MINGJIAO, needLevel = 45, needXinfa = 56, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308068] = { type = 2, id = 487, menpaiId = MP_DALI, needLevel = 45, needXinfa = 61, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308075] = { type = 2, id = 306, menpaiId = MP_SHAOLIN, needLevel = 80, needXinfa = 55, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308076] = { type = 2, id = 488, menpaiId = MP_DALI, needLevel = 80, needXinfa = 61, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308087] = { type = 2, id = 395, menpaiId = MP_WUDANG, needLevel = 80, needXinfa = 58, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308088] = { type = 2, id = 455, menpaiId = MP_XINGSU, needLevel = 80, needXinfa = 60, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308089] = { type = 2, id = 365, menpaiId = MP_GAIBANG, needLevel = 80, needXinfa = 57, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308090] = { type = 2, id = 545, menpaiId = MP_XIAOYAO, needLevel = 80, needXinfa = 63, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308091] = { type = 2, id = 335, menpaiId = MP_MINGJIAO, needLevel = 80, needXinfa = 56, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308092] = { type = 2, id = 516, menpaiId = MP_TIANSHAN, needLevel = 80, needXinfa = 62, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308093] = { type = 2, id = 426, menpaiId = MP_EMEI, needLevel = 80, needXinfa = 59, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308111] = { type = 2, id = 307, menpaiId = MP_SHAOLIN, needLevel = 80, needXinfa = 72, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308112] = { type = 2, id = 336, menpaiId = MP_MINGJIAO, needLevel = 80, needXinfa = 73, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308113] = { type = 2, id = 366, menpaiId = MP_GAIBANG, needLevel = 80, needXinfa = 74, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308114] = { type = 2, id = 396, menpaiId = MP_WUDANG, needLevel = 80, needXinfa = 75, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308115] = { type = 2, id = 427, menpaiId = MP_EMEI, needLevel = 80, needXinfa = 76, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308116] = { type = 2, id = 456, menpaiId = MP_XINGSU, needLevel = 80, needXinfa = 77, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308117] = { type = 2, id = 489, menpaiId = MP_DALI, needLevel = 80, needXinfa = 78, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308118] = { type = 2, id = 517, menpaiId = MP_TIANSHAN, needLevel = 80, needXinfa = 79, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308119] = { type = 2, id = 546, menpaiId = MP_XIAOYAO, needLevel = 80, needXinfa = 80, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308120] = { type = 2, id = 786, menpaiId = MP_MURONG, needLevel = 80, needXinfa = 71, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308121] = { type = 2, id = 308, menpaiId = MP_SHAOLIN, needLevel = 80, needXinfa = 72, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308122] = { type = 2, id = 337, menpaiId = MP_MINGJIAO, needLevel = 80, needXinfa = 73, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308123] = { type = 2, id = 367, menpaiId = MP_GAIBANG, needLevel = 80, needXinfa = 74, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308124] = { type = 2, id = 397, menpaiId = MP_WUDANG, needLevel = 80, needXinfa = 75, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308125] = { type = 2, id = 428, menpaiId = MP_EMEI, needLevel = 80, needXinfa = 76, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308126] = { type = 2, id = 457, menpaiId = MP_XINGSU, needLevel = 80, needXinfa = 77, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308127] = { type = 2, id = 490, menpaiId = MP_DALI, needLevel = 80, needXinfa = 78, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308128] = { type = 2, id = 518, menpaiId = MP_TIANSHAN, needLevel = 80, needXinfa = 79, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308129] = { type = 2, id = 547, menpaiId = MP_XIAOYAO, needLevel = 80, needXinfa = 80, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308130] = { type = 2, id = 787, menpaiId = MP_MURONG, needLevel = 80, needXinfa = 71, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308131] = { type = 2, id = 1629, menpaiId = -1, needLevel = 40, needXinfa = -1, needXinfaLevel = -1, specialEffectID = 18 }
x338000_g_SkillBooks[30308132] = { type = 2, id = 1630, menpaiId = -1, needLevel = 40, needXinfa = -1, needXinfaLevel = -1, specialEffectID = 18 }
x338000_g_SkillBooks[30308133] = { type = 2, id = 1631, menpaiId = -1, needLevel = 40, needXinfa = -1, needXinfaLevel = -1, specialEffectID = 18 }
x338000_g_SkillBooks[30308134] = { type = 2, id = 1633, menpaiId = -1, needLevel = 40, needXinfa = -1, needXinfaLevel = -1, specialEffectID = 18 }
x338000_g_SkillBooks[30308135] = { type = 2, id = 1634, menpaiId = -1, needLevel = 40, needXinfa = -1, needXinfaLevel = -1, specialEffectID = 18 }
x338000_g_SkillBooks[30308136] = { type = 2, id = 1635, menpaiId = -1, needLevel = 40, needXinfa = -1, needXinfaLevel = -1, specialEffectID = 18 }
x338000_g_SkillBooks[30308137] = { type = 2, id = 1636, menpaiId = -1, needLevel = 40, needXinfa = -1, needXinfaLevel = -1, specialEffectID = 18 }
x338000_g_SkillBooks[30308138] = { type = 2, id = 1637, menpaiId = -1, needLevel = 40, needXinfa = -1, needXinfaLevel = -1, specialEffectID = 18 }
x338000_g_SkillBooks[30308139] = { type = 2, id = 1639, menpaiId = -1, needLevel = 40, needXinfa = -1, needXinfaLevel = -1, specialEffectID = 18 }
x338000_g_SkillBooks[30308140] = { type = 2, id = 1640, menpaiId = -1, needLevel = 40, needXinfa = -1, needXinfaLevel = -1, specialEffectID = 18 }
x338000_g_SkillBooks[30308141] = { type = 2, id = 1641, menpaiId = -1, needLevel = 40, needXinfa = -1, needXinfaLevel = -1, specialEffectID = 18 }
x338000_g_SkillBooks[30308142] = { type = 2, id = 1643, menpaiId = -1, needLevel = 40, needXinfa = -1, needXinfaLevel = -1, specialEffectID = 18 }
x338000_g_SkillBooks[30308143] = { type = 2, id = 1644, menpaiId = -1, needLevel = 40, needXinfa = -1, needXinfaLevel = -1, specialEffectID = 18 }
x338000_g_SkillBooks[30308144] = { type = 2, id = 1645, menpaiId = -1, needLevel = 40, needXinfa = -1, needXinfaLevel = -1, specialEffectID = 18 }
x338000_g_SkillBooks[30308145] = { type = 2, id = 1646, menpaiId = -1, needLevel = 40, needXinfa = -1, needXinfaLevel = -1, specialEffectID = 18 }
x338000_g_SkillBooks[30308146] = { type = 2, id = 1647, menpaiId = -1, needLevel = 40, needXinfa = -1, needXinfaLevel = -1, specialEffectID = 18 }
x338000_g_SkillBooks[30308147] = { type = 2, id = 1648, menpaiId = -1, needLevel = 40, needXinfa = -1, needXinfaLevel = -1, specialEffectID = 18 }
x338000_g_SkillBooks[30308148] = { type = 2, id = 1632, menpaiId = -1, needLevel = 40, needXinfa = -1, needXinfaLevel = -1, specialEffectID = 18 }
x338000_g_SkillBooks[30308149] = { type = 2, id = 309, menpaiId = MP_SHAOLIN, needLevel = 35, needXinfa = 55, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308150] = { type = 2, id = 338, menpaiId = MP_MINGJIAO, needLevel = 35, needXinfa = 56, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308151] = { type = 2, id = 368, menpaiId = MP_GAIBANG, needLevel = 35, needXinfa = 57, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308152] = { type = 2, id = 398, menpaiId = MP_WUDANG, needLevel = 35, needXinfa = 58, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308153] = { type = 2, id = 429, menpaiId = MP_EMEI, needLevel = 35, needXinfa = 59, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308154] = { type = 2, id = 458, menpaiId = MP_XINGSU, needLevel = 35, needXinfa = 60, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308155] = { type = 2, id = 484, menpaiId = MP_DALI, needLevel = 35, needXinfa = 61, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308156] = { type = 2, id = 519, menpaiId = MP_TIANSHAN, needLevel = 35, needXinfa = 62, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308157] = { type = 2, id = 548, menpaiId = MP_XIAOYAO, needLevel = 35, needXinfa = 63, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308158] = { type = 2, id = 100, menpaiId = MP_SHAOLIN, needLevel = 80, needXinfa = 55, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308159] = { type = 2, id = 102, menpaiId = MP_MINGJIAO, needLevel = 80, needXinfa = 56, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308160] = { type = 2, id = 105, menpaiId = MP_GAIBANG, needLevel = 80, needXinfa = 57, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308161] = { type = 2, id = 108, menpaiId = MP_WUDANG, needLevel = 80, needXinfa = 58, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308162] = { type = 2, id = 111, menpaiId = MP_EMEI, needLevel = 80, needXinfa = 59, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308163] = { type = 2, id = 113, menpaiId = MP_XINGSU, needLevel = 80, needXinfa = 60, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308164] = { type = 2, id = 118, menpaiId = MP_DALI, needLevel = 80, needXinfa = 61, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308165] = { type = 2, id = 119, menpaiId = MP_TIANSHAN, needLevel = 80, needXinfa = 62, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308166] = { type = 2, id = 122, menpaiId = MP_XIAOYAO, needLevel = 80, needXinfa = 63, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308167] = { type = 2, id = 106, menpaiId = MP_GAIBANG, needLevel = 80, needXinfa = 57, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308168] = { type = 2, id = 109, menpaiId = MP_WUDANG, needLevel = 80, needXinfa = 58, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308169] = { type = 2, id = 114, menpaiId = MP_XINGSU, needLevel = 80, needXinfa = 60, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308170] = { type = 2, id = 116, menpaiId = MP_DALI, needLevel = 80, needXinfa = 61, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308171] = { type = 2, id = 123, menpaiId = MP_XIAOYAO, needLevel = 80, needXinfa = 63, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308172] = { type = 2, id = 103, menpaiId = MP_MINGJIAO, needLevel = 80, needXinfa = 56, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308173] = { type = 2, id = 120, menpaiId = MP_TIANSHAN, needLevel = 80, needXinfa = 62, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308174] = { type = 2, id = 101, menpaiId = MP_SHAOLIN, needLevel = 80, needXinfa = 55, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308175] = { type = 2, id = 117, menpaiId = MP_DALI, needLevel = 80, needXinfa = 61, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308176] = { type = 2, id = 110, menpaiId = MP_WUDANG, needLevel = 80, needXinfa = 58, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308177] = { type = 2, id = 115, menpaiId = MP_XINGSU, needLevel = 80, needXinfa = 60, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308178] = { type = 2, id = 107, menpaiId = MP_GAIBANG, needLevel = 80, needXinfa = 57, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308179] = { type = 2, id = 124, menpaiId = MP_XIAOYAO, needLevel = 80, needXinfa = 63, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308180] = { type = 2, id = 104, menpaiId = MP_MINGJIAO, needLevel = 80, needXinfa = 56, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308181] = { type = 2, id = 121, menpaiId = MP_TIANSHAN, needLevel = 80, needXinfa = 62, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30308182] = { type = 2, id = 112, menpaiId = MP_EMEI, needLevel = 80, needXinfa = 59, needXinfaLevel = 1, specialEffectID = 18 }
--------------------120技能--------------------------
x338000_g_SkillBooks[30503071] = { type = 2, id = 133, menpaiId = MP_XIAOYAO, needLevel = 80, needXinfa = 80, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30503072] = { type = 2, id = 125, menpaiId = MP_SHAOLIN, needLevel = 80, needXinfa = 72, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30503073] = { type = 2, id = 126, menpaiId = MP_MINGJIAO, needLevel = 80, needXinfa = 73, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30503074] = { type = 2, id = 127, menpaiId = MP_GAIBANG, needLevel = 80, needXinfa = 74, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30503075] = { type = 2, id = 128, menpaiId = MP_WUDANG, needLevel = 80, needXinfa = 75, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30503076] = { type = 2, id = 129, menpaiId = MP_EMEI, needLevel = 80, needXinfa = 76, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30503077] = { type = 2, id = 130, menpaiId = MP_XINGSU, needLevel = 80, needXinfa = 77, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30503078] = { type = 2, id = 131, menpaiId = MP_DALI, needLevel = 80, needXinfa = 78, needXinfaLevel = 1, specialEffectID = 18 }
x338000_g_SkillBooks[30503079] = { type = 2, id = 132, menpaiId = MP_TIANSHAN, needLevel = 80, needXinfa = 79, needXinfaLevel = 1, specialEffectID = 18 }
--------------------120技能第二本--------------------------																									
x338000_g_SkillBooks[30503082] = { type = 2, id = 183, menpaiId = MP_SHAOLIN, needLevel = 80, needXinfa = 72, needXinfaLevel = 1, specialEffectID = 18 }																									
x338000_g_SkillBooks[30503083] = { type = 2, id = 184, menpaiId = MP_MINGJIAO, needLevel = 80, needXinfa = 73, needXinfaLevel = 1, specialEffectID = 18 }																									
x338000_g_SkillBooks[30503084] = { type = 2, id = 185, menpaiId = MP_GAIBANG, needLevel = 80, needXinfa = 74, needXinfaLevel = 1, specialEffectID = 18 }																									
x338000_g_SkillBooks[30503085] = { type = 2, id = 186, menpaiId = MP_WUDANG, needLevel = 80, needXinfa = 75, needXinfaLevel = 1, specialEffectID = 18 }																									
x338000_g_SkillBooks[30503086] = { type = 2, id = 187, menpaiId = MP_EMEI, needLevel = 80, needXinfa = 76, needXinfaLevel = 1, specialEffectID = 18 }																								
x338000_g_SkillBooks[30503087] = { type = 2, id = 188, menpaiId = MP_XINGSU, needLevel = 80, needXinfa = 77, needXinfaLevel = 1, specialEffectID = 18 }																									
x338000_g_SkillBooks[30503088] = { type = 2, id = 189, menpaiId = MP_DALI, needLevel = 80, needXinfa = 78, needXinfaLevel = 1, specialEffectID = 18 }																									
x338000_g_SkillBooks[30503089] = { type = 2, id = 190, menpaiId = MP_TIANSHAN, needLevel = 80, needXinfa = 79, needXinfaLevel = 1, specialEffectID = 18 }																									
x338000_g_SkillBooks[30503090] = { type = 2, id = 191, menpaiId = MP_XIAOYAO, needLevel = 80, needXinfa = 80, needXinfaLevel = 1, specialEffectID = 18 }																									
--------------------慕容技能--------------------------																									
x338000_g_SkillBooks[30308097] = { type = 2, id = 1785, menpaiId = 9, needLevel = 80, needXinfa = 70, needXinfaLevel = 80, specialEffectID = 18 }																									
x338000_g_SkillBooks[30308099] = { type = 2, id = 1784, menpaiId = 9, needLevel = 45, needXinfa = 70, needXinfaLevel = 45, specialEffectID = 18 }																									
x338000_g_SkillBooks[30308100] = { type = 2, id = 1781, menpaiId = 9, needLevel = 65, needXinfa = 70, needXinfaLevel = 65, specialEffectID = 18 }																									

x338000_g_SkillBooks[30308120] = { type = 2, id = 1786, menpaiId = 9, needLevel = 80, needXinfa = 71, needXinfaLevel = 80, specialEffectID = 18 }																									
x338000_g_SkillBooks[30308130] = { type = 2, id = 1787, menpaiId = 9, needLevel = 80, needXinfa = 71, needXinfaLevel = 80, specialEffectID = 18 }																									
--------------------进阶技能--------------------------																									
x338000_g_SkillBooks[30308301] = { type = 2, id = 2000, menpaiId = MP_DALI, needLevel = 1, needXinfa = -1, needXinfaLevel = 1, specialEffectID = 18 }																																																	
x338000_g_SkillBooks[30308302] = { type = 2, id = 2001, menpaiId = MP_SHAOLIN, needLevel = 1, needXinfa = -1, needXinfaLevel = 1, specialEffectID = 18 }																																																	
x338000_g_SkillBooks[30308303] = { type = 2, id = 2002, menpaiId = MP_EMEI, needLevel = 1, needXinfa = -1, needXinfaLevel = 1, specialEffectID = 18 }																																																	
x338000_g_SkillBooks[30308304] = { type = 2, id = 2003, menpaiId = MP_WUDANG, needLevel = 1, needXinfa = -1, needXinfaLevel = 1, specialEffectID = 18 }																																																	
x338000_g_SkillBooks[30308305] = { type = 2, id = 2004, menpaiId = MP_XIAOYAO, needLevel = 1, needXinfa = -1, needXinfaLevel = 1, specialEffectID = 18 }																																																	
x338000_g_SkillBooks[30308306] = { type = 2, id = 2005, menpaiId = MP_TIANSHAN, needLevel = 1, needXinfa = -1, needXinfaLevel = 1, specialEffectID = 18 }																																																	
x338000_g_SkillBooks[30308307] = { type = 2, id = 2006, menpaiId = MP_MINGJIAO, needLevel = 1, needXinfa = -1, needXinfaLevel = 1, specialEffectID = 18 }																																																	
x338000_g_SkillBooks[30308308] = { type = 2, id = 2007, menpaiId = MP_GAIBANG, needLevel = 1, needXinfa = -1, needXinfaLevel = 1, specialEffectID = 18 }																																																	
x338000_g_SkillBooks[30308309] = { type = 2, id = 2008, menpaiId = MP_XINGSU, needLevel = 1, needXinfa = -1, needXinfaLevel = 1, specialEffectID = 18 }																																																	
x338000_g_SkillBooks[30308310] = { type = 2, id = 2009, menpaiId = 9, needLevel = 1, needXinfa = -1, needXinfaLevel = 1, specialEffectID = 18 }																																																	


x338000_g_TypeNames = {}
x338000_g_TypeNames[1] = "B� T竎h"
x338000_g_TypeNames[2] = "Y猽 Quy猼"

--**********************************
-- 返回1：技能类似的物品，可以继续类似技能的执行；返回0：执行 OnDefaultEvent。
--**********************************
function x338000_IsSkillLikeScript( sceneId, selfId )
	return 1
end

--**********************************
-- 返回1：已经取消对应效果，不再执行后续操作；返回0：没有检测到相关效果，继续执行。
--**********************************
function x338000_CancelImpacts( sceneId, selfId )
	return 0
end

--**********************************
-- 条件检测入口：返回1：条件检测通过，可以继续执行；返回0：条件检测失败，中断后续执行。
--**********************************
function x338000_OnConditionCheck( sceneId, selfId )
	-- 校验使用的物品
	if LuaFnVerifyUsedItem( sceneId, selfId ) ~= 1 then
		return 0
	end

	-- 找到相应条目
	local itemTblIndex = LuaFnGetItemIndexOfUsedItem( sceneId, selfId )
	local skillBook = x338000_g_SkillBooks[itemTblIndex]
	if not skillBook then
		return 0
	end

	-- 如果门派不相同
	local menpai = GetMenPai( sceneId, selfId )
	if -1~=skillBook.menpaiId then
	 if menpai ~= skillBook.menpaiId then
		 x338000_NotifyFailTips( sceneId, selfId, "Ng呓i kh鬾g ph鋓 #{_MENPAI" .. skillBook.menpaiId .. "} 甬 t�, kh鬾g th� h鱟 " .. x338000_g_TypeNames[skillBook.type] .. ". " )
		 return 0
	 end
	end

	if GetLevel( sceneId, selfId ) < skillBook.needLevel then
		x338000_NotifyFailTips( sceneId, selfId, "Ng呓i 瘘 c 鸬 瓞 h鱟 " .. x338000_g_TypeNames[skillBook.type] .. ". " )
		return 0
	end

	if skillBook.needXinfa ~= -1 then
		local xinfaLevel = HaveXinFa( sceneId, selfId, skillBook.needXinfa )
		if xinfaLevel < 1 then
			x338000_NotifyFailTips( sceneId, selfId, "C B� t竎h: #{_XINFA" .. skillBook.needXinfa .. "}. " )
			return 0
		end

		if xinfaLevel < skillBook.needXinfaLevel then
			-- 需要测试这个地方，跨行而且没有分号
			x338000_NotifyFailTips( sceneId, selfId, "C B� t竎h: #{_XINFA" .. skillBook.needXinfa .. "} "
				.. skillBook.needXinfaLevel .. " hi畁 ng呓i 餫ng 鹫t c " .. xinfaLevel .. ". " )
			return 0
		end
	end

	if skillBook.type == 1 then					-- 心法
		if HaveXinFa( sceneId, selfId, skillBook.id ) > 0 then
			x338000_NotifyFailTips( sceneId, selfId, "Ng呓i 疸 h鱟 qua t鈓 ph醦 n鄖" )
			return 0
		end
	elseif skillBook.type == 2 then				-- 要诀
		if HaveSkill( sceneId, selfId, skillBook.id ) == 1 then
			x338000_NotifyFailTips( sceneId, selfId, "Ng呓i 疸 h鱟 k� n錸g n鄖." )
			return 0
		end
	end

	return 1
end

--**********************************
--消耗检测及处理入口，负责消耗的检测和执行：
--返回1：消耗处理通过，可以继续执行；返回0：消耗检测失败，中断后续执行。
--**********************************
function x338000_OnDeplete( sceneId, selfId )
	if LuaFnDepletingUsedItem( sceneId, selfId ) > 0 then
		return 1
	end

	return 0
end

--**********************************
--只会执行一次入口：
--聚气和瞬发技能会在消耗完成后调用这个接口（聚气结束并且各种条件都满足的时候），而引导
--技能也会在消耗完成后调用这个接口（技能的一开始，消耗成功执行之后）。
--返回1：处理成功；返回0：处理失败。
--注：这里是技能生效一次的入口
--**********************************
function x338000_OnActivateOnce( sceneId, selfId )
	-- 找到相应条目
	local itemTblIndex = LuaFnGetItemIndexOfUsedItem( sceneId, selfId )
	local skillBook = x338000_g_SkillBooks[itemTblIndex]
	if not skillBook then
		return 0
	end

	-- 学习
	if skillBook.type == 1 then					-- 心法
		if HaveXinFa( sceneId, selfId, skillBook.id ) > 0 then
			x338000_NotifyFailTips( sceneId, selfId, "Ng呓i 疸 h鱟 t鈓 ph醦 n鄖." )
			return 0
		else
			AddXinFa( sceneId, selfId, skillBook.id )
		end
	elseif skillBook.type == 2 then				-- 要诀
		if HaveSkill( sceneId, selfId, skillBook.id ) == 1 then
			x338000_NotifyFailTips( sceneId, selfId, "Ng呓i 疸 h鱟 k� n錸g n鄖." )
			return 0
		else
			AddSkill( sceneId, selfId, skillBook.id )
		end
	end

	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, skillBook.specialEffectID, 0 )
	return 1
end

--**********************************
--引导心跳处理入口：
--引导技能会在每次心跳结束时调用这个接口。
--返回：1继续下次心跳；0：中断引导。
--注：这里是技能心跳时生效的入口
--**********************************
function x338000_OnActivateEachTick( sceneId, selfId )
	return 1
end

--**********************************
-- 醒目失败提示
--**********************************
function x338000_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
