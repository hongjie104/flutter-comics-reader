const _words = {
  '伥': '倀',
  '滢': '瀅',
  '渎': '瀆',
  '俩': '倆',
  '仓': '倉',
  '泻': '瀉',
  '个': '個',
  '渖': '瀋',
  '浏': '瀏',
  '们': '們',
  '濒': '瀕',
  '迳': '逕',
  '泸': '瀘',
  '这': '這',
  '沥': '瀝',
  '潇': '瀟',
  '潆': '瀠',
  '连': '連',
  '潴': '瀦',
  '泷': '瀧',
  '濑': '瀨',
  '伦': '倫',
  '耧': '耬',
  '耢': '耮',
  '潋': '瀲',
  '进': '進',
  '憷': '怵',
  '澜': '瀾',
  '沣': '灃',
  '滠': '灄',
  '伟': '偉',
  '游': '遊',
  '运': '運',
  '过': '過',
  '洒': '灑',
  '达': '達',
  '违': '違',
  '圣': '聖',
  '滩': '灘',
  '遥': '遙',
  '逊': '遜',
  '沓': '遝',
  '灏': '灝',
  '递': '遞',
  '闻': '聞',
  '远': '遠',
  '湾': '灣',
  '滦': '灤',
  '耻': '恥',
  '滟': '灩',
  '适': '適',
  '联': '聯',
  '聪': '聰',
  '声': '聲',
  '迟': '遲',
  '耸': '聳',
  '侧': '側',
  '侦': '偵',
  '聩': '聵',
  '聂': '聶',
  '职': '職',
  '迁': '遷',
  '选': '選',
  '聍': '聹',
  '遗': '遺',
  '辽': '遼',
  '伪': '偽',
  '听': '聽',
  '灾': '災',
  '聋': '聾',
  '迈': '邁',
  '还': '還',
  '悦': '悅',
  '肃': '肅',
  '迩': '邇',
  '边': '邊',
  '逻': '邏',
  '逦': '邐',
  '杰': '傑',
  '伧': '傖',
  '伞': '傘',
  '备': '備',
  '佣': '傭',
  '偬': '傯',
  '传': '傳',
  '伛': '傴',
  '债': '債',
  '怅': '悵',
  '闷': '悶',
  '伤': '傷',
  '为': '為',
  '倾': '傾',
  '偻': '僂',
  '仅': '僅',
  '佥': '僉',
  '乌': '烏',
  '侨': '僑',
  '郏': '郟',
  '恶': '惡',
  '郄': '郤',
  '侥': '僥',
  '偾': '僨',
  '恼': '惱',
  '恽': '惲',
  '烃': '烴',
  '邮': '郵',
  '价': '價',
  '恻': '惻',
  '仪': '儀',
  '侬': '儂',
  '亿': '億',
  '胁': '脅',
  '郓': '鄆',
  '侩': '儈',
  '脉': '脈',
  '乡': '鄉',
  '俭': '儉',
  '嵴': '脊',
  '傧': '儐',
  '邹': '鄒',
  '俦': '儔',
  '邬': '鄔',
  '侪': '儕',
  '郧': '鄖',
  '尽': '儘',
  '爱': '愛',
  '胫': '脛',
  '惬': '愜',
  '偿': '償',
  '无': '無',
  '邓': '鄧',
  '悫': '愨',
  '优': '優',
  '脱': '脫',
  '郑': '鄭',
  '邻': '鄰',
  '储': '儲',
  '郸': '鄲',
  '怆': '愴',
  '邺': '鄴',
  '郐': '鄶',
  '俪': '儷',
  '恺': '愷',
  '胀': '脹',
  '傩': '儺',
  '邝': '鄺',
  '傥': '儻',
  '俨': '儼',
  '忾': '愾',
  '煅': '煆',
  '郦': '酈',
  '炼': '煉',
  '态': '態',
  '兑': '兌',
  '愠': '慍',
  '肾': '腎',
  '儿': '兒',
  '炜': '煒',
  '胨': '腖',
  '兖': '兗',
  '惨': '慘',
  '烟': '煙',
  '惭': '慚',
  '恸': '慟',
  '脶': '腡',
  '茕': '煢',
  '惯': '慣',
  '焕': '煥',
  '脑': '腦',
  '内': '內',
  '两': '兩',
  '烦': '煩',
  '怄': '慪',
  '怂': '慫',
  '肿': '腫',
  '炀': '煬',
  '虑': '慮',
  '悭': '慳',
  '脚': '腳',
  '庆': '慶',
  '肠': '腸',
  '肷': '膁',
  '忧': '憂',
  '腌': '醃',
  '腽': '膃',
  '没': '冇',
  '册': '冊',
  '惫': '憊',
  '怜': '憐',
  '凭': '憑',
  '愦': '憒',
  '荧': '熒',
  '腘': '膕',
  '慭': '憖',
  '炝': '熗',
  '惮': '憚',
  '肤': '膚',
  '丑': '醜',
  '酝': '醞',
  '胶': '膠',
  '愤': '憤',
  '腻': '膩',
  '幂': '冪',
  '医': '醫',
  '悯': '憫',
  '酱': '醬',
  '怃': '憮',
  '热': '熱',
  '酦': '醱',
  '宪': '憲',
  '颎': '熲',
  '忆': '憶',
  '胆': '膽',
  '炽': '熾',
  '脍': '膾',
  '脓': '膿',
  '酿': '釀',
  '烨': '燁',
  '衅': '釁',
  '酾': '釃',
  '酽': '釅',
  '恳': '懇',
  '灯': '燈',
  '应': '應',
  '炖': '燉',
  '脸': '臉',
  '释': '釋',
  '怿': '懌',
  '懔': '懍',
  '冻': '凍',
  '脐': '臍',
  '膑': '臏',
  '烧': '燒',
  '癯': '臒',
  '钆': '釓',
  '钇': '釔',
  '钌': '釕',
  '钊': '釗',
  '腊': '臘',
  '钉': '釘',
  '烫': '燙',
  '钋': '釙',
  '胪': '臚',
  '凛': '凜',
  '焖': '燜',
  '针': '針',
  '怼': '懟',
  '脏': '臟',
  '营': '營',
  '脔': '臠',
  '臜': '臢',
  '懑': '懣',
  '钓': '釣',
  '钐': '釤',
  '卧': '臥',
  '灿': '燦',
  '钏': '釧',
  '恹': '懨',
  '临': '臨',
  '钒': '釩',
  '烛': '燭',
  '凯': '凱',
  '惩': '懲',
  '烩': '燴',
  '钗': '釵',
  '懒': '懶',
  '怀': '懷',
  '钍': '釷',
  '悬': '懸',
  '钕': '釹',
  '忏': '懺',
  '台': '臺',
  '钎': '釺',
  '惧': '懼',
  '烬': '燼',
  '慑': '懾',
  '焘': '燾',
  '恋': '戀',
  '钯': '鈀',
  '钫': '鈁',
  '钘': '鈃',
  '钭': '鈄',
  '与': '與',
  '戆': '戇',
  '兴': '興',
  '钚': '鈈',
  '举': '舉',
  '钠': '鈉',
  '旧': '舊',
  '烁': '爍',
  '钝': '鈍',
  '炉': '爐',
  '钤': '鈐',
  '钣': '鈑',
  '钑': '鈒',
  '戋': '戔',
  '钞': '鈔',
  '钮': '鈕',
  '烂': '爛',
  '钧': '鈞',
  '钙': '鈣',
  '钬': '鈥',
  '钛': '鈦',
  '戗': '戧',
  '钪': '鈧',
  '戬': '戩',
  '删': '刪',
  '争': '爭',
  '战': '戰',
  '铈': '鈰',
  '戏': '戲',
  '钶': '鈳',
  '铃': '鈴',
  '户': '戶',
  '钴': '鈷',
  '钹': '鈸',
  '铍': '鈹',
  '爷': '爺',
  '钰': '鈺',
  '钸': '鈽',
  '尔': '爾',
  '铀': '鈾',
  '丬': '爿',
  '钿': '鈿',
  '钾': '鉀',
  '刭': '剄',
  '墙': '牆',
  '则': '則',
  '铊': '鉈',
  '铉': '鉉',
  '铋': '鉍',
  '铂': '鉑',
  '钷': '鉕',
  '刬': '剗',
  '钳': '鉗',
  '牍': '牘',
  '舱': '艙',
  '铆': '鉚',
  '刚': '剛',
  '铅': '鉛',
  '剥': '剝',
  '钺': '鉞',
  '扦': '扡',
  '舣': '艤',
  '钩': '鉤',
  '舰': '艦',
  '钲': '鉦',
  '舻': '艫',
  '钼': '鉬',
  '钽': '鉭',
  '剐': '剮',
  '艰': '艱',
  '剀': '剴',
  '创': '創',
  '铏': '鉶',
  '艹': '艸',
  '铰': '鉸',
  '铒': '鉺',
  '铬': '鉻',
  '牵': '牽',
  '铪': '鉿',
  '银': '銀',
  '划': '劃',
  '铳': '銃',
  '札': '劄',
  '铜': '銅',
  '剧': '劇',
  '噼': '劈',
  '刘': '劉',
  '刽': '劊',
  '刿': '劌',
  '剑': '劍',
  '铚': '銍',
  '剂': '劑',
  '铣': '銑',
  '铨': '銓',
  '荦': '犖',
  '铢': '銖',
  '铭': '銘',
  '铫': '銚',
  '牦': '犛',
  '铦': '銛',
  '衔': '銜',
  '铑': '銠',
  '犊': '犢',
  '铷': '銣',
  '铱': '銥',
  '铟': '銦',
  '牺': '犧',
  '铵': '銨',
  '铥': '銩',
  '铕': '銪',
  '铯': '銫',
  '铐': '銬',
  '铞': '銱',
  '锐': '銳',
  '销': '銷',
  '刍': '芻',
  '锑': '銻',
  '锉': '銼',
  '状': '狀',
  '劲': '勁',
  '铝': '鋁',
  '锒': '鋃',
  '锌': '鋅',
  '钡': '鋇',
  '抛': '拋',
  '铤': '鋌',
  '铗': '鋏',
  '锋': '鋒',
  '动': '動',
  '务': '務',
  '铻': '鋙',
  '拼': '拚',
  '胜': '勝',
  '锊': '鋝',
  '劳': '勞',
  '锓': '鋟',
  '势': '勢',
  '铘': '鋣',
  '锄': '鋤',
  '锃': '鋥',
  '锔': '鋦',
  '苎': '苧',
  '锇': '鋨',
  '勚': '勩',
  '铺': '鋪',
  '锆': '鋯',
  '锂': '鋰',
  '劢': '勱',
  '铽': '鋱',
  '勋': '勳',
  '励': '勵',
  '锍': '鋶',
  '劝': '勸',
  '锯': '鋸',
  '狭': '狹',
  '匀': '勻',
  '钢': '鋼',
  '狈': '狽',
  '锞': '錁',
  '录': '錄',
  '锖': '錆',
  '锫': '錇',
  '锩': '錈',
  '锥': '錐',
  '锕': '錒',
  '锟': '錕',
  '锤': '錘',
  '狰': '猙',
  '锱': '錙',
  '铮': '錚',
  '勐': '猛',
  '锬': '錟',
  '锭': '錠',
  '锜': '錡',
  '钱': '錢',
  '锦': '錦',
  '锚': '錨',
  '锠': '錩',
  '锡': '錫',
  '匦': '匭',
  '锢': '錮',
  '错': '錯',
  '匮': '匱',
  '兹': '茲',
  '锰': '錳',
  '犹': '猶',
  '铼': '錸',
  '狲': '猻',
  '挟': '挾',
  '区': '區',
  '犸': '獁',
  '锨': '鍁',
  '狱': '獄',
  '狮': '獅',
  '钔': '鍆',
  '锴': '鍇',
  '锳': '鍈',
  '荆': '荊',
  '锅': '鍋',
  '镀': '鍍',
  '奖': '獎',
  '协': '協',
  '锷': '鍔',
  '铡': '鍘',
  '钖': '鍚',
  '锻': '鍛',
  '锽': '鍠',
  '锸': '鍤',
  '锲': '鍥',
  '独': '獨',
  '狯': '獪',
  '扪': '捫',
  '猃': '獫',
  '锹': '鍬',
  '狝': '獮',
  '狞': '獰',
  '锾': '鍰',
  '获': '獲',
  '猎': '獵',
  '键': '鍵',
  '锶': '鍶',
  '犷': '獷',
  '兽': '獸',
  '獭': '獺',
  '锗': '鍺',
  '却': '卻',
  '献': '獻',
  '猕': '獼',
  '锺': '鍾',
  '猡': '玀',
  '镁': '鎂',
  '扫': '掃',
  '抡': '掄',
  '锿': '鎄',
  '庄': '莊',
  '镑': '鎊',
  '镕': '鎔',
  '茎': '莖',
  '锁': '鎖',
  '挜': '掗',
  '镉': '鎘',
  '厍': '厙',
  '挣': '掙',
  '挂': '掛',
  '镈': '鎛',
  '镃': '鎡',
  '荚': '莢',
  '钨': '鎢',
  '蓥': '鎣',
  '镏': '鎦',
  '苋': '莧',
  '铠': '鎧',
  '珏': '玨',
  '锼': '鎪',
  '镐': '鎬',
  '厌': '厭',
  '镇': '鎮',
  '镒': '鎰',
  '厉': '厲',
  '镍': '鎳',
  '厣': '厴',
  '镎': '鎿',
  '拣': '揀',
  '参': '參',
  '镞': '鏃',
  '镟': '鏇',
  '链': '鏈',
  '镆': '鏌',
  '镙': '鏍',
  '镠': '鏐',
  '镝': '鏑',
  '铿': '鏗',
  '锵': '鏘',
  '扬': '揚',
  '换': '換',
  '镗': '鏜',
  '镛': '鏞',
  '铲': '鏟',
  '镜': '鏡',
  '丛': '叢',
  '镖': '鏢',
  '镂': '鏤',
  '錾': '鏨',
  '挥': '揮',
  '华': '華',
  '镚': '鏰',
  '铧': '鏵',
  '镤': '鏷',
  '镪': '鏹',
  '锈': '鏽',
  '现': '現',
  '铙': '鐃',
  '苌': '萇',
  '莱': '萊',
  '铴': '鐋',
  '损': '損',
  '镣': '鐐',
  '咤': '吒',
  '铹': '鐒',
  '镦': '鐓',
  '镡': '鐔',
  '摇': '搖',
  '捣': '搗',
  '钟': '鐘',
  '镫': '鐙',
  '镨': '鐠',
  '锎': '鐦',
  '锏': '鐧',
  '镌': '鐫',
  '万': '萬',
  '镰': '鐮',
  '镯': '鐲',
  '吴': '吳',
  '镭': '鐳',
  '莴': '萵',
  '铁': '鐵',
  '抢': '搶',
  '镮': '鐶',
  '铎': '鐸',
  '珐': '琺',
  '铛': '鐺',
  '珲': '琿',
  '镱': '鐿',
  '吕': '呂',
  '铸': '鑄',
  '叶': '葉',
  '珉': '瑉',
  '镬': '鑊',
  '玮': '瑋',
  '掴': '摑',
  '玚': '瑒',
  '荭': '葒',
  '鉴': '鑒',
  '镲': '鑔',
  '着': '著',
  '掼': '摜',
  '镴': '鑞',
  '搂': '摟',
  '铄': '鑠',
  '揸': '摣',
  '琐': '瑣',
  '镳': '鑣',
  '瑶': '瑤',
  '荮': '葤',
  '镥': '鑥',
  '苇': '葦',
  '莹': '瑩',
  '玛': '瑪',
  '镧': '鑭',
  '挚': '摯',
  '钥': '鑰',
  '哌': '呱',
  '玱': '瑲',
  '镶': '鑲',
  '抠': '摳',
  '抟': '摶',
  '荤': '葷',
  '镊': '鑷',
  '镩': '鑹',
  '掺': '摻',
  '唿': '呼',
  '锣': '鑼',
  '钻': '鑽',
  '銮': '鑾',
  '凿': '鑿',
  '镢': '钁',
  '捞': '撈',
  '琏': '璉',
  '挦': '撏',
  '撑': '撐',
  '挠': '撓',
  '莳': '蒔',
  '捻': '撚',
  '鉅': '钜',
  '莅': '蒞',
  '挢': '撟',
  '琎': '璡',
  '掸': '撣',
  '玑': '璣',
  '拨': '撥',
  '瑷': '璦',
  '抚': '撫',
  '珰': '璫',
  '环': '環',
  '扑': '撲',
  '揿': '撳',
  '玙': '璵',
  '挞': '撻',
  '呙': '咼',
  '苍': '蒼',
  '玺': '璽',
  '挝': '撾',
  '捡': '撿',
  '璇': '璿',
  '荪': '蓀',
  '拥': '擁',
  '掳': '擄',
  '择': '擇',
  '击': '擊',
  '琼': '瓊',
  '挡': '擋',
  '盖': '蓋',
  '珑': '瓏',
  '担': '擔',
  '璎': '瓔',
  '据': '據',
  '瓒': '瓚',
  '挤': '擠',
  '员': '員',
  '咔': '哢',
  '莜': '蓧',
  '拟': '擬',
  '莲': '蓮',
  '摈': '擯',
  '苁': '蓯',
  '拧': '擰',
  '搁': '擱',
  '掷': '擲',
  '扩': '擴',
  '莼': '蓴',
  '撷': '擷',
  '摆': '擺',
  '擞': '擻',
  '撸': '擼',
  '荜': '蓽',
  '扰': '擾',
  '摅': '攄',
  '呗': '唄',
  '撵': '攆',
  '瓯': '甌',
  '拢': '攏',
  '拦': '攔',
  '瓮': '甕',
  '唣': '唕',
  '撄': '攖',
  '搀': '攙',
  '吣': '唚',
  '撺': '攛',
  '携': '攜',
  '摄': '攝',
  '蒌': '蔞',
  '攒': '攢',
  '产': '產',
  '挛': '攣',
  '蒋': '蔣',
  '摊': '攤',
  '葱': '蔥',
  '茑': '蔦',
  '搅': '攪',
  '揽': '攬',
  '荫': '蔭',
  '荨': '蕁',
  '蒇': '蕆',
  '荞': '蕎',
  '问': '問',
  '荬': '蕒',
  '莸': '蕕',
  '败': '敗',
  '叙': '敘',
  '荛': '蕘',
  '亩': '畝',
  '哑': '啞',
  '启': '啟',
  '碹': '镟',
  '毕': '畢',
  '唡': '啢',
  '蒉': '蕢',
  '荡': '蕩',
  '芜': '蕪',
  '画': '畫',
  '萧': '蕭',
  '异': '異',
  '敌': '敵',
  '当': '當',
  '蓣': '蕷',
  '长': '長',
  '数': '數',
  '门': '門',
  '敛': '斂',
  '闩': '閂',
  '毙': '斃',
  '闪': '閃',
  '闫': '閆',
  '畴': '疇',
  '荟': '薈',
  '闬': '閈',
  '闭': '閉',
  '叠': '疊',
  '蓟': '薊',
  '开': '開',
  '芗': '薌',
  '闶': '閌',
  '闳': '閎',
  '闰': '閏',
  '姜': '薑',
  '闲': '閒',
  '间': '間',
  '蔷': '薔',
  '闵': '閔',
  '斓': '斕',
  '荙': '薘',
  '闸': '閘',
  '唤': '喚',
  '莶': '薟',
  '阂': '閡',
  '阁': '閣',
  '阀': '閥',
  '荐': '薦',
  '闺': '閨',
  '萨': '薩',
  '闽': '閩',
  '丧': '喪',
  '阃': '閫',
  '斩': '斬',
  '乔': '喬',
  '阆': '閬',
  '闾': '閭',
  '单': '單',
  '阅': '閱',
  '哟': '喲',
  '阊': '閶',
  '断': '斷',
  '阉': '閹',
  '荠': '薺',
  '阎': '閻',
  '于': '於',
  '阏': '閼',
  '阍': '閽',
  '阈': '閾',
  '阌': '閿',
  '阒': '闃',
  '呛': '嗆',
  '啬': '嗇',
  '闱': '闈',
  '唝': '嗊',
  '阔': '闊',
  '阕': '闋',
  '阑': '闌',
  '蓝': '藍',
  '阇': '闍',
  '吗': '嗎',
  '荩': '藎',
  '阗': '闐',
  '阘': '闒',
  '闿': '闓',
  '阖': '闔',
  '阙': '闕',
  '闯': '闖',
  '痉': '痙',
  '呜': '嗚',
  '关': '關',
  '艺': '藝',
  '阚': '闞',
  '阓': '闠',
  '阐': '闡',
  '阛': '闤',
  '药': '藥',
  '闼': '闥',
  '唢': '嗩',
  '薮': '藪',
  '呵': '嗬',
  '哔': '嗶',
  '苈': '藶',
  '蔼': '藹',
  '蔺': '藺',
  '萚': '蘀',
  '痖': '瘂',
  '蕲': '蘄',
  '芦': '蘆',
  '苏': '蘇',
  '蕴': '蘊',
  '疯': '瘋',
  '苹': '蘋',
  '喽': '嘍',
  '疡': '瘍',
  '痪': '瘓',
  '呕': '嘔',
  '啧': '嘖',
  '尝': '嘗',
  '藓': '蘚',
  '唛': '嘜',
  '瘗': '瘞',
  '蔹': '蘞',
  '疮': '瘡',
  '茏': '蘢',
  '疟': '瘧',
  '哗': '嘩',
  '坂': '阪',
  '兰': '蘭',
  '瘆': '瘮',
  '唠': '嘮',
  '啸': '嘯',
  '叽': '嘰',
  '哓': '嘵',
  '呒': '嘸',
  '瘘': '瘺',
  '蓠': '蘺',
  '啴': '嘽',
  '萝': '蘿',
  '时': '時',
  '疗': '療',
  '咴': '噅',
  '痨': '癆',
  '痫': '癇',
  '晋': '晉',
  '瘅': '癉',
  '嘘': '噓',
  '处': '處',
  '疠': '癘',
  '陉': '陘',
  '虚': '虛',
  '虏': '虜',
  '咝': '噝',
  '昼': '晝',
  '陕': '陝',
  '号': '號',
  '瘪': '癟',
  '哒': '噠',
  '痴': '癡',
  '痒': '癢',
  '阵': '陣',
  '疖': '癤',
  '哝': '噥',
  '哕': '噦',
  '亏': '虧',
  '癞': '癩',
  '癣': '癬',
  '瘿': '癭',
  '瘾': '癮',
  '嗳': '噯',
  '虬': '虯',
  '痈': '癰',
  '阴': '陰',
  '瘫': '癱',
  '哙': '噲',
  '癫': '癲',
  '陈': '陳',
  '喷': '噴',
  '吨': '噸',
  '陆': '陸',
  '发': '發',
  '阳': '陽',
  '咛': '嚀',
  '吓': '嚇',
  '晕': '暈',
  '晖': '暉',
  '陧': '隉',
  '队': '隊',
  '哜': '嚌',
  '阶': '階',
  '噜': '嚕',
  '陨': '隕',
  '旸': '暘',
  '皑': '皚',
  '际': '際',
  '畅': '暢',
  '呖': '嚦',
  '咙': '嚨',
  '随': '隨',
  '险': '險',
  '暂': '暫',
  '疱': '皰',
  '隐': '隱',
  '亸': '嚲',
  '喾': '嚳',
  '严': '嚴',
  '陇': '隴',
  '嘤': '嚶',
  '皲': '皸',
  '隶': '隸',
  '皱': '皺',
  '只': '隻',
  '啭': '囀',
  '嗫': '囁',
  '嚣': '囂',
  '晔': '曄',
  '冁': '囅',
  '历': '曆',
  '昙': '曇',
  '呓': '囈',
  '啰': '囉',
  '晓': '曉',
  '隽': '雋',
  '嘱': '囑',
  '暧': '曖',
  '虽': '雖',
  '双': '雙',
  '雏': '雛',
  '杂': '雜',
  '盗': '盜',
  '盏': '盞',
  '鸡': '雞',
  '旷': '曠',
  '离': '離',
  '监': '監',
  '难': '難',
  '盘': '盤',
  '卢': '盧',
  '昽': '曨',
  '囱': '囪',
  '晒': '曬',
  '云': '雲',
  '书': '書',
  '蛱': '蛺',
  '电': '電',
  '蜕': '蛻',
  '会': '會',
  '蚬': '蜆',
  '囵': '圇',
  '国': '國',
  '围': '圍',
  '园': '園',
  '圆': '圓',
  '图': '圖',
  '团': '團',
  '眦': '眥',
  '胧': '朧',
  '雾': '霧',
  '霁': '霽',
  '众': '眾',
  '雳': '靂',
  '霭': '靄',
  '叇': '靆',
  '灵': '靈',
  '叆': '靉',
  '蚀': '蝕',
  '靓': '靚',
  '睁': '睜',
  '静': '靜',
  '睐': '睞',
  '猬': '蝟',
  '腼': '靦',
  '虾': '蝦',
  '靥': '靨',
  '垧': '坰',
  '东': '東',
  '蜗': '蝸',
  '鼗': '鞀',
  '蛳': '螄',
  '巩': '鞏',
  '眍': '瞘',
  '瞒': '瞞',
  '蚂': '螞',
  '萤': '螢',
  '埯': '垵',
  '蝼': '螻',
  '睑': '瞼',
  '鞒': '鞽',
  '螀': '螿',
  '缰': '韁',
  '鞑': '韃',
  '蛰': '蟄',
  '蝈': '蟈',
  '鞯': '韉',
  '韦': '韋',
  '韧': '韌',
  '韨': '韍',
  '螨': '蟎',
  '眬': '矓',
  '韩': '韓',
  '韪': '韙',
  '瞩': '矚',
  '韬': '韜',
  '鞴': '韝',
  '韫': '韞',
  '垭': '埡',
  '虮': '蟣',
  '蝉': '蟬',
  '矫': '矯',
  '蛲': '蟯',
  '虫': '蟲',
  '栅': '柵',
  '蛏': '蟶',
  '执': '執',
  '蚁': '蟻',
  '韵': '韻',
  '硅': '矽',
  '响': '響',
  '页': '頁',
  '顶': '頂',
  '顷': '頃',
  '坚': '堅',
  '蝇': '蠅',
  '项': '項',
  '虿': '蠆',
  '顺': '順',
  '顸': '頇',
  '须': '須',
  '垩': '堊',
  '顼': '頊',
  '颂': '頌',
  '蝎': '蠍',
  '颀': '頎',
  '颃': '頏',
  '蛴': '蠐',
  '预': '預',
  '蝾': '蠑',
  '顽': '頑',
  '颁': '頒',
  '顿': '頓',
  '蚝': '蠔',
  '垴': '堖',
  '颇': '頗',
  '领': '領',
  '颌': '頜',
  '埚': '堝',
  '蜡': '蠟',
  '颉': '頡',
  '蛎': '蠣',
  '颐': '頤',
  '颏': '頦',
  '蟏': '蠨',
  '头': '頭',
  '颒': '頮',
  '尧': '堯',
  '颊': '頰',
  '报': '報',
  '蛊': '蠱',
  '颋': '頲',
  '场': '場',
  '颕': '頴',
  '蚕': '蠶',
  '颔': '頷',
  '颈': '頸',
  '颓': '頹',
  '蛮': '蠻',
  '频': '頻',
  '碱': '堿',
  '颗': '顆',
  '块': '塊',
  '茔': '塋',
  '题': '題',
  '额': '額',
  '颚': '顎',
  '垲': '塏',
  '颜': '顏',
  '埘': '塒',
  '颙': '顒',
  '术': '術',
  '颛': '顓',
  '涂': '塗',
  '愿': '願',
  '颡': '顙',
  '冢': '塚',
  '卫': '衛',
  '颠': '顛',
  '硁': '硜',
  '冲': '衝',
  '类': '類',
  '坞': '塢',
  '颟': '顢',
  '埙': '塤',
  '硖': '硤',
  '颢': '顥',
  '顾': '顧',
  '砗': '硨',
  '颤': '顫',
  '颥': '顬',
  '砚': '硯',
  '显': '顯',
  '颦': '顰',
  '颅': '顱',
  '颞': '顳',
  '颧': '顴',
  '尘': '塵',
  '堑': '塹',
  '埝': '墊',
  '栀': '梔',
  '枧': '梘',
  '坠': '墜',
  '条': '條',
  '衮': '袞',
  '枭': '梟',
  '风': '風',
  '硕': '碩',
  '砀': '碭',
  '飐': '颭',
  '堕': '墮',
  '飑': '颮',
  '飒': '颯',
  '坟': '墳',
  '垯': '墶',
  '飓': '颶',
  '砜': '碸',
  '飔': '颸',
  '确': '確',
  '飏': '颺',
  '飖': '颻',
  '码': '碼',
  '飕': '颼',
  '垦': '墾',
  '飗': '飀',
  '弃': '棄',
  '飘': '飄',
  '飚': '飆',
  '坛': '壇',
  '垱': '壋',
  '硙': '磑',
  '压': '壓',
  '枨': '棖',
  '枣': '棗',
  '垒': '壘',
  '圹': '壙',
  '垆': '壚',
  '砖': '磚',
  '飞': '飛',
  '补': '補',
  '装': '裝',
  '坏': '壞',
  '垅': '壟',
  '栋': '棟',
  '里': '裡',
  '坜': '壢',
  '碜': '磣',
  '饤': '飣',
  '饦': '飥',
  '栈': '棧',
  '碛': '磧',
  '坝': '壩',
  '饨': '飩',
  '塆': '壪',
  '饪': '飪',
  '饫': '飫',
  '桊': '棬',
  '饬': '飭',
  '壮': '壯',
  '矶': '磯',
  '饭': '飯',
  '栖': '棲',
  '饮': '飲',
  '饴': '飴',
  '梾': '棶',
  '壶': '壺',
  '壸': '壼',
  '饲': '飼',
  '寿': '壽',
  '制': '製',
  '硗': '磽',
  '饱': '飽',
  '饰': '飾',
  '饳': '飿',
  '饺': '餃',
  '硚': '礄',
  '饸': '餄',
  '饼': '餅',
  '复': '複',
  '饷': '餉',
  '养': '養',
  '裈': '褌',
  '饵': '餌',
  '础': '礎',
  '饹': '餎',
  '桠': '椏',
  '饻': '餏',
  '饽': '餑',
  '馁': '餒',
  '饿': '餓',
  '馂': '餕',
  '饾': '餖',
  '馀': '餘',
  '袆': '褘',
  '碍': '礙',
  '馄': '餛',
  '馃': '餜',
  '饯': '餞',
  '够': '夠',
  '馅': '餡',
  '梦': '夢',
  '伙': '夥',
  '矿': '礦',
  '馆': '館',
  '砺': '礪',
  '砾': '礫',
  '矾': '礬',
  '砻': '礱',
  '糇': '餱',
  '裤': '褲',
  '裢': '褳',
  '饧': '餳',
  '馉': '餶',
  '馇': '餷',
  '褛': '褸',
  '馎': '餺',
  '亵': '褻',
  '饩': '餼',
  '夹': '夾',
  '馏': '餾',
  '馊': '餿',
  '馌': '饁',
  '馍': '饃',
  '馒': '饅',
  '幞': '襆',
  '裥': '襇',
  '馐': '饈',
  '馑': '饉',
  '杨': '楊',
  '馓': '饊',
  '馈': '饋',
  '馔': '饌',
  '袯': '襏',
  '奂': '奐',
  '饥': '饑',
  '饶': '饒',
  '枫': '楓',
  '袄': '襖',
  '飨': '饗',
  '餍': '饜',
  '裣': '襝',
  '馋': '饞',
  '裆': '襠',
  '馕': '饢',
  '褴': '襤',
  '奥': '奧',
  '桢': '楨',
  '奁': '奩',
  '夺': '奪',
  '袜': '襪',
  '业': '業',
  '奋': '奮',
  '衬': '襯',
  '袭': '襲',
  '襕': '襴',
  '极': '極',
  '禄': '祿',
  '见': '見',
  '祸': '禍',
  '祯': '禎',
  '觃': '覎',
  '规': '規',
  '觅': '覓',
  '祎': '禕',
  '视': '視',
  '觇': '覘',
  '妆': '妝',
  '觋': '覡',
  '觍': '覥',
  '御': '禦',
  '觎': '覦',
  '亲': '親',
  '杩': '榪',
  '禅': '禪',
  '觊': '覬',
  '马': '馬',
  '驭': '馭',
  '冯': '馮',
  '礼': '禮',
  '荣': '榮',
  '觏': '覯',
  '祢': '禰',
  '祷': '禱',
  '驮': '馱',
  '觐': '覲',
  '驰': '馳',
  '驯': '馴',
  '觑': '覷',
  '驲': '馹',
  '觉': '覺',
  '览': '覽',
  '秃': '禿',
  '桤': '榿',
  '觌': '覿',
  '观': '觀',
  '藁': '槁',
  '驳': '駁',
  '籼': '秈',
  '构': '構',
  '枪': '槍',
  '姗': '姍',
  '驻': '駐',
  '驽': '駑',
  '驹': '駒',
  '驵': '駔',
  '驾': '駕',
  '骀': '駘',
  '驸': '駙',
  '驶': '駛',
  '驼': '駝',
  '驷': '駟',
  '骈': '駢',
  '椠': '槧',
  '椁': '槨',
  '骇': '駭',
  '骃': '駰',
  '骆': '駱',
  '桨': '槳',
  '觞': '觴',
  '觯': '觶',
  '触': '觸',
  '骎': '駸',
  '骏': '駿',
  '桩': '樁',
  '讠': '訁',
  '骋': '騁',
  '乐': '樂',
  '订': '訂',
  '骍': '騂',
  '讣': '訃',
  '枞': '樅',
  '税': '稅',
  '骓': '騅',
  '秆': '稈',
  '计': '計',
  '讯': '訊',
  '讧': '訌',
  '骔': '騌',
  '骒': '騍',
  '讨': '討',
  '骑': '騎',
  '骐': '騏',
  '讦': '訐',
  '讱': '訒',
  '楼': '樓',
  '训': '訓',
  '讪': '訕',
  '讫': '訖',
  '骛': '騖',
  '记': '記',
  '标': '標',
  '骗': '騙',
  '娱': '娛',
  '讹': '訛',
  '讶': '訝',
  '枢': '樞',
  '禀': '稟',
  '讼': '訟',
  '样': '樣',
  '诀': '訣',
  '骙': '騤',
  '讷': '訥',
  '讻': '訩',
  '访': '訪',
  '骞': '騫',
  '设': '設',
  '骘': '騭',
  '种': '種',
  '骝': '騮',
  '腾': '騰',
  '称': '稱',
  '许': '許',
  '诉': '訴',
  '诃': '訶',
  '驺': '騶',
  '骚': '騷',
  '朴': '樸',
  '骟': '騸',
  '树': '樹',
  '桦': '樺',
  '诊': '診',
  '骡': '騾',
  '蓦': '驀',
  '谷': '穀',
  '娄': '婁',
  '诂': '詁',
  '骜': '驁',
  '骖': '驂',
  '骠': '驃',
  '骢': '驄',
  '驱': '驅',
  '诋': '詆',
  '桡': '橈',
  '骅': '驊',
  '桥': '橋',
  '稣': '穌',
  '骕': '驌',
  '积': '積',
  '骁': '驍',
  '讵': '詎',
  '颖': '穎',
  '骣': '驏',
  '诈': '詐',
  '诒': '詒',
  '诏': '詔',
  '评': '評',
  '骄': '驕',
  '诐': '詖',
  '诇': '詗',
  '验': '驗',
  '诎': '詘',
  '惊': '驚',
  '诅': '詛',
  '驿': '驛',
  '词': '詞',
  '机': '機',
  '骤': '驟',
  '咏': '詠',
  '秾': '穠',
  '穑': '穡',
  '诩': '詡',
  '椭': '橢',
  '秽': '穢',
  '询': '詢',
  '驴': '驢',
  '诣': '詣',
  '骧': '驤',
  '骥': '驥',
  '妇': '婦',
  '试': '試',
  '骦': '驦',
  '稳': '穩',
  '诗': '詩',
  '骊': '驪',
  '横': '橫',
  '诧': '詫',
  '骉': '驫',
  '诟': '詬',
  '娅': '婭',
  '稆': '穭',
  '诡': '詭',
  '诠': '詮',
  '诘': '詰',
  '话': '話',
  '该': '該',
  '详': '詳',
  '诜': '詵',
  '诙': '詼',
  '诖': '詿',
  '檩': '檁',
  '诔': '誄',
  '诛': '誅',
  '诓': '誆',
  '夸': '誇',
  '柽': '檉',
  '志': '誌',
  '认': '認',
  '诳': '誑',
  '诶': '誒',
  '档': '檔',
  '诞': '誕',
  '诱': '誘',
  '诮': '誚',
  '桧': '檜',
  '语': '語',
  '槚': '檟',
  '诚': '誠',
  '诫': '誡',
  '检': '檢',
  '樯': '檣',
  '诬': '誣',
  '误': '誤',
  '诰': '誥',
  '诵': '誦',
  '娲': '媧',
  '诲': '誨',
  '窝': '窩',
  '洼': '窪',
  '说': '說',
  '梼': '檮',
  '穷': '窮',
  '妫': '媯',
  '窑': '窯',
  '谁': '誰',
  '课': '課',
  '槟': '檳',
  '窭': '窶',
  '谇': '誶',
  '柠': '檸',
  '诽': '誹',
  '窥': '窺',
  '槛': '檻',
  '媪': '媼',
  '谊': '誼',
  '妈': '媽',
  '苘': '檾',
  '调': '調',
  '谄': '諂',
  '柜': '櫃',
  '窜': '竄',
  '谆': '諄',
  '窍': '竅',
  '窦': '竇',
  '谈': '談',
  '诿': '諉',
  '窃': '竊',
  '袅': '嫋',
  '请': '請',
  '诤': '諍',
  '诹': '諏',
  '髅': '髏',
  '诼': '諑',
  '谅': '諒',
  '橹': '櫓',
  '体': '體',
  '髌': '髕',
  '论': '論',
  '髋': '髖',
  '妪': '嫗',
  '谂': '諗',
  '榈': '櫚',
  '栉': '櫛',
  '谀': '諛',
  '谍': '諜',
  '椟': '櫝',
  '谞': '諝',
  '橼': '櫞',
  '谝': '諞',
  '栎': '櫟',
  '谥': '諡',
  '诨': '諢',
  '谔': '諤',
  '橱': '櫥',
  '谛': '諦',
  '槠': '櫧',
  '谐': '諧',
  '栌': '櫨',
  '枥': '櫪',
  '橥': '櫫',
  '谏': '諫',
  '榇': '櫬',
  '谕': '諭',
  '谘': '諮',
  '讳': '諱',
  '栊': '櫳',
  '谙': '諳',
  '妩': '嫵',
  '竞': '競',
  '谌': '諶',
  '讽': '諷',
  '榉': '櫸',
  '诸': '諸',
  '谚': '諺',
  '娴': '嫻',
  '樱': '櫻',
  '谖': '諼',
  '诺': '諾',
  '婳': '嫿',
  '谋': '謀',
  '疬': '鬁',
  '谒': '謁',
  '谓': '謂',
  '栏': '欄',
  '誊': '謄',
  '诌': '謅',
  '松': '鬆',
  '娆': '嬈',
  '权': '權',
  '谎': '謊',
  '婵': '嬋',
  '娇': '嬌',
  '谜': '謎',
  '椤': '欏',
  '谧': '謐',
  '栾': '欒',
  '谑': '謔',
  '榄': '欖',
  '谡': '謖',
  '谤': '謗',
  '嫱': '嬙',
  '谦': '謙',
  '讲': '講',
  '谢': '謝',
  '棂': '欞',
  '谣': '謠',
  '嫒': '嬡',
  '鬓': '鬢',
  '嬷': '嬤',
  '斗': '鬥',
  '谟': '謨',
  '闹': '鬨',
  '阋': '鬩',
  '嫔': '嬪',
  '谪': '謫',
  '谬': '謬',
  '阄': '鬮',
  '婴': '嬰',
  '郁': '鬱',
  '讴': '謳',
  '婶': '嬸',
  '谨': '謹',
  '钦': '欽',
  '谩': '謾',
  '笔': '筆',
  '证': '證',
  '娈': '孌',
  '笋': '筍',
  '叹': '歎',
  '谲': '譎',
  '魉': '魎',
  '讥': '譏',
  '欧': '歐',
  '谮': '譖',
  '识': '識',
  '魇': '魘',
  '谯': '譙',
  '谭': '譚',
  '鱼': '魚',
  '鱽': '魛',
  '谱': '譜',
  '欤': '歟',
  '欢': '歡',
  '鱾': '魢',
  '笕': '筧',
  '鲀': '魨',
  '孙': '孫',
  '谵': '譫',
  '译': '譯',
  '鲁': '魯',
  '议': '議',
  '岁': '歲',
  '谴': '譴',
  '鲂': '魴',
  '护': '護',
  '鱿': '魷',
  '学': '學',
  '归': '歸',
  '诪': '譸',
  '鲄': '魺',
  '誉': '譽',
  '谫': '譾',
  '孪': '孿',
  '殁': '歿',
  '读': '讀',
  '鲅': '鮁',
  '鲆': '鮃',
  '变': '變',
  '鲌': '鮊',
  '笺': '箋',
  '詟': '讋',
  '鲉': '鮋',
  '鲏': '鮍',
  '雠': '讎',
  '筝': '箏',
  '鲐': '鮐',
  '鲍': '鮑',
  '谗': '讒',
  '鲋': '鮒',
  '让': '讓',
  '鲊': '鮓',
  '谰': '讕',
  '谶': '讖',
  '残': '殘',
  '赞': '讚',
  '鲒': '鮚',
  '谠': '讜',
  '鲘': '鮜',
  '殒': '殞',
  '谳': '讞',
  '鲕': '鮞',
  '殇': '殤',
  '鲖': '鮦',
  '鲔': '鮪',
  '殚': '殫',
  '鲛': '鮫',
  '鲑': '鮭',
  '殓': '殮',
  '宫': '宮',
  '鲜': '鮮',
  '殡': '殯',
  '歼': '殲',
  '鲓': '鮳',
  '鲪': '鮶',
  '杀': '殺',
  '鲝': '鮺',
  '壳': '殼',
  '毁': '毀',
  '节': '節',
  '鲧': '鯀',
  '鲠': '鯁',
  '范': '範',
  '殴': '毆',
  '鲩': '鯇',
  '筑': '築',
  '鲤': '鯉',
  '鲨': '鯊',
  '箧': '篋',
  '鲬': '鯒',
  '鲻': '鯔',
  '鲯': '鯕',
  '鲭': '鯖',
  '鲞': '鯗',
  '鲷': '鯛',
  '鲴': '鯝',
  '鲱': '鯡',
  '寝': '寢',
  '鲵': '鯢',
  '笃': '篤',
  '鲲': '鯤',
  '实': '實',
  '宁': '寧',
  '鲳': '鯧',
  '鲸': '鯨',
  '审': '審',
  '筛': '篩',
  '鲮': '鯪',
  '写': '寫',
  '鲰': '鯫',
  '宽': '寬',
  '鲶': '鯰',
  '筚': '篳',
  '鲺': '鯴',
  '宠': '寵',
  '鲹': '鯵',
  '宝': '寶',
  '鳀': '鯷',
  '鲫': '鯽',
  '毵': '毿',
  '鳊': '鯿',
  '箦': '簀',
  '鳈': '鰁',
  '鲗': '鰂',
  '鳂': '鰃',
  '将': '將',
  '专': '專',
  '毡': '氈',
  '鲽': '鰈',
  '鳇': '鰉',
  '寻': '尋',
  '氇': '氌',
  '对': '對',
  '篓': '簍',
  '鳅': '鰍',
  '导': '導',
  '鲾': '鰏',
  '鳆': '鰒',
  '鳃': '鰓',
  '咨': '谘',
  '鳒': '鰜',
  '箪': '簞',
  '鳑': '鰟',
  '鳋': '鰠',
  '简': '簡',
  '气': '氣',
  '篑': '簣',
  '鲥': '鰣',
  '鳏': '鰥',
  '鳎': '鰨',
  '鳐': '鰩',
  '氢': '氫',
  '箫': '簫',
  '氩': '氬',
  '鳍': '鰭',
  '鳁': '鰮',
  '鲢': '鰱',
  '氲': '氳',
  '鳓': '鰳',
  '鳘': '鰵',
  '尴': '尷',
  '檐': '簷',
  '鲦': '鰷',
  '凼': '氹',
  '筜': '簹',
  '鲣': '鰹',
  '鳗': '鰻',
  '鳛': '鰼',
  '签': '簽',
  '帘': '簾',
  '鳔': '鰾',
  '鳉': '鱂',
  '篮': '籃',
  '鳙': '鱅',
  '届': '屆',
  '岂': '豈',
  '鳕': '鱈',
  '鳖': '鱉',
  '筹': '籌',
  '尸': '屍',
  '竖': '豎',
  '丰': '豐',
  '鳟': '鱒',
  '艳': '豔',
  '鳝': '鱔',
  '鳜': '鱖',
  '鳞': '鱗',
  '鲟': '鱘',
  '污': '汙',
  '疴': '屙',
  '箓': '籙',
  '屉': '屜',
  '箨': '籜',
  '鲼': '鱝',
  '籁': '籟',
  '鲎': '鱟',
  '笼': '籠',
  '鲙': '鱠',
  '屡': '屢',
  '鳣': '鱣',
  '层': '層',
  '鳡': '鱤',
  '鳢': '鱧',
  '屦': '屨',
  '鲿': '鱨',
  '笾': '籩',
  '簖': '籪',
  '属': '屬',
  '猪': '豬',
  '篱': '籬',
  '屃': '屭',
  '鲚': '鱭',
  '箩': '籮',
  '鳠': '鱯',
  '吁': '籲',
  '豮': '豶',
  '鳄': '鱷',
  '鲈': '鱸',
  '决': '決',
  '鲡': '鱺',
  '猫': '貓',
  '贝': '貝',
  '贞': '貞',
  '贠': '貟',
  '负': '負',
  '冈': '岡',
  '财': '財',
  '贡': '貢',
  '贫': '貧',
  '货': '貨',
  '贩': '販',
  '贪': '貪',
  '贯': '貫',
  '责': '責',
  '贮': '貯',
  '贳': '貰',
  '赀': '貲',
  '贰': '貳',
  '贵': '貴',
  '粤': '粵',
  '贬': '貶',
  '买': '買',
  '贷': '貸',
  '贶': '貺',
  '费': '費',
  '贴': '貼',
  '贻': '貽',
  '贸': '貿',
  '贺': '賀',
  '况': '況',
  '贲': '賁',
  '赂': '賂',
  '赁': '賃',
  '贿': '賄',
  '赅': '賅',
  '资': '資',
  '贾': '賈',
  '煳': '糊',
  '贼': '賊',
  '赈': '賑',
  '赊': '賒',
  '宾': '賓',
  '赇': '賕',
  '赒': '賙',
  '赉': '賚',
  '赐': '賜',
  '糁': '糝',
  '粪': '糞',
  '赏': '賞',
  '赔': '賠',
  '赓': '賡',
  '贤': '賢',
  '卖': '賣',
  '贱': '賤',
  '鸟': '鳥',
  '赋': '賦',
  '粮': '糧',
  '凫': '鳧',
  '赕': '賧',
  '鸠': '鳩',
  '质': '質',
  '账': '賬',
  '赌': '賭',
  '粝': '糲',
  '鸤': '鳲',
  '凤': '鳳',
  '籴': '糴',
  '岘': '峴',
  '赖': '賴',
  '鸣': '鳴',
  '赗': '賵',
  '岛': '島',
  '粜': '糶',
  '鸢': '鳶',
  '纟': '糸',
  '赚': '賺',
  '赙': '賻',
  '购': '購',
  '峡': '峽',
  '赛': '賽',
  '纠': '糾',
  '赜': '賾',
  '纪': '紀',
  '纣': '紂',
  '约': '約',
  '贽': '贄',
  '红': '紅',
  '赘': '贅',
  '纡': '紆',
  '鸩': '鴆',
  '纥': '紇',
  '赟': '贇',
  '鸨': '鴇',
  '纨': '紈',
  '赠': '贈',
  '纫': '紉',
  '鸦': '鴉',
  '纹': '紋',
  '崃': '崍',
  '纳': '納',
  '赡': '贍',
  '赢': '贏',
  '纽': '紐',
  '赆': '贐',
  '鸰': '鴒',
  '纾': '紓',
  '赃': '贓',
  '纯': '純',
  '赑': '贔',
  '纰': '紕',
  '鸵': '鴕',
  '纼': '紖',
  '赎': '贖',
  '岗': '崗',
  '纱': '紗',
  '赝': '贗',
  '纮': '紘',
  '纸': '紙',
  '级': '級',
  '纷': '紛',
  '赣': '贛',
  '鸳': '鴛',
  '纭': '紜',
  '纴': '紝',
  '鸲': '鴝',
  '鸮': '鴞',
  '鸱': '鴟',
  '岽': '崠',
  '纺': '紡',
  '峥': '崢',
  '鸪': '鴣',
  '鸯': '鴦',
  '鸭': '鴨',
  '鸴': '鴬',
  '扎': '紮',
  '鸸': '鴯',
  '细': '細',
  '鸹': '鴰',
  '绂': '紱',
  '嵛': '崳',
  '绅': '紳',
  '鸻': '鴴',
  '纻': '紵',
  '汹': '洶',
  '绍': '紹',
  '绀': '紺',
  '鸿': '鴻',
  '绋': '紼',
  '绐': '紿',
  '鸽': '鴿',
  '绌': '絀',
  '终': '終',
  '鸺': '鵂',
  '鸼': '鵃',
  '组': '組',
  '绊': '絆',
  '绗': '絎',
  '绁': '絏',
  '岚': '嵐',
  '结': '結',
  '鹀': '鵐',
  '鹃': '鵑',
  '鹆': '鵒',
  '鹁': '鵓',
  '绝': '絕',
  '绦': '絛',
  '鹈': '鵜',
  '绔': '絝',
  '鹅': '鵝',
  '绞': '絞',
  '鹄': '鵠',
  '络': '絡',
  '鹉': '鵡',
  '绚': '絢',
  '给': '給',
  '绒': '絨',
  '鹌': '鵪',
  '赪': '赬',
  '鹏': '鵬',
  '鹐': '鵮',
  '鹎': '鵯',
  '绖': '絰',
  '统': '統',
  '丝': '絲',
  '鹊': '鵲',
  '绛': '絳',
  '鹓': '鵷',
  '浃': '浹',
  '绢': '絹',
  '嵝': '嶁',
  '绑': '綁',
  '绡': '綃',
  '崭': '嶄',
  '绠': '綆',
  '泾': '涇',
  '岖': '嶇',
  '鸫': '鶇',
  '绨': '綈',
  '鹑': '鶉',
  '鹒': '鶊',
  '绤': '綌',
  '绥': '綏',
  '经': '經',
  '鹋': '鶓',
  '嵚': '嶔',
  '赶': '趕',
  '崂': '嶗',
  '鹕': '鶘',
  '赵': '趙',
  '鹗': '鶚',
  '综': '綜',
  '缍': '綞',
  '峤': '嶠',
  '绿': '綠',
  '鹖': '鶡',
  '峣': '嶢',
  '绸': '綢',
  '绻': '綣',
  '鹍': '鶤',
  '鹛': '鶥',
  '峄': '嶧',
  '峃': '嶨',
  '趋': '趨',
  '鹜': '鶩',
  '绶': '綬',
  '鸧': '鶬',
  '维': '維',
  '崄': '嶮',
  '绹': '綯',
  '莺': '鶯',
  '绾': '綰',
  '纲': '綱',
  '网': '網',
  '趱': '趲',
  '鹟': '鶲',
  '岙': '嶴',
  '缀': '綴',
  '鹤': '鶴',
  '嵘': '嶸',
  '纶': '綸',
  '绺': '綹',
  '鹠': '鶹',
  '绮': '綺',
  '岭': '嶺',
  '鹡': '鶺',
  '绽': '綻',
  '鹘': '鶻',
  '凉': '涼',
  '屿': '嶼',
  '鹣': '鶼',
  '岳': '嶽',
  '绰': '綽',
  '绫': '綾',
  '绵': '綿',
  '鹚': '鶿',
  '鹢': '鷁',
  '鹞': '鷂',
  '绲': '緄',
  '缁': '緇',
  '紧': '緊',
  '鹝': '鷊',
  '岿': '巋',
  '绯': '緋',
  '凄': '淒',
  '峦': '巒',
  '绪': '緒',
  '绬': '緓',
  '鹧': '鷓',
  '巅': '巔',
  '绱': '緔',
  '鹥': '鷖',
  '缃': '緗',
  '鸥': '鷗',
  '缄': '緘',
  '缂': '緙',
  '鸷': '鷙',
  '泪': '淚',
  '缐': '線',
  '鹨': '鷚',
  '缉': '緝',
  '缎': '緞',
  '缔': '締',
  '缗': '緡',
  '迹': '跡',
  '缘': '緣',
  '渌': '淥',
  '鸶': '鷥',
  '缌': '緦',
  '鹪': '鷦',
  '净': '淨',
  '编': '編',
  '凌': '淩',
  '缓': '緩',
  '沦': '淪',
  '鹔': '鷫',
  '缅': '緬',
  '纬': '緯',
  '鹩': '鷯',
  '巯': '巰',
  '缑': '緱',
  '缈': '緲',
  '鹫': '鷲',
  '鹇': '鷳',
  '练': '練',
  '渊': '淵',
  '缏': '緶',
  '涞': '淶',
  '鹬': '鷸',
  '缇': '緹',
  '卺': '巹',
  '鹰': '鷹',
  '浅': '淺',
  '鹭': '鷺',
  '鹯': '鸇',
  '萦': '縈',
  '缙': '縉',
  '缢': '縊',
  '缒': '縋',
  '鹱': '鸌',
  '鹲': '鸏',
  '绉': '縐',
  '践': '踐',
  '缣': '縑',
  '缊': '縕',
  '鸬': '鸕',
  '缞': '縗',
  '鹴': '鸘',
  '涣': '渙',
  '鹦': '鸚',
  '减': '減',
  '缚': '縛',
  '鹳': '鸛',
  '缜': '縝',
  '鹂': '鸝',
  '缟': '縞',
  '鸾': '鸞',
  '丢': '丟',
  '缛': '縟',
  '沨': '渢',
  '县': '縣',
  '帅': '帥',
  '并': '並',
  '涡': '渦',
  '师': '師',
  '缝': '縫',
  '测': '測',
  '缡': '縭',
  '缩': '縮',
  '纵': '縱',
  '缧': '縲',
  '帐': '帳',
  '踊': '踴',
  '缦': '縵',
  '带': '帶',
  '絷': '縶',
  '缕': '縷',
  '缥': '縹',
  '总': '總',
  '浑': '渾',
  '绩': '績',
  '帧': '幀',
  '帏': '幃',
  '绷': '繃',
  '缫': '繅',
  '缪': '繆',
  '襁': '繈',
  '凑': '湊',
  '跄': '蹌',
  '缯': '繒',
  '织': '織',
  '缮': '繕',
  '跸': '蹕',
  '帼': '幗',
  '帻': '幘',
  '缭': '繚',
  '浈': '湞',
  '绕': '繞',
  '帜': '幟',
  '跖': '蹠',
  '绣': '繡',
  '缋': '繢',
  '币': '幣',
  '愍': '湣',
  '蹒': '蹣',
  '踪': '蹤',
  '涌': '湧',
  '绳': '繩',
  '绘': '繪',
  '帮': '幫',
  '帱': '幬',
  '茧': '繭',
  '缳': '繯',
  '汤': '湯',
  '缲': '繰',
  '缴': '繳',
  '卤': '鹵',
  '咸': '鹹',
  '绎': '繹',
  '跷': '蹺',
  '鹾': '鹺',
  '硷': '鹼',
  '继': '繼',
  '盐': '鹽',
  '缤': '繽',
  '几': '幾',
  '缱': '繾',
  '乱': '亂',
  '跶': '躂',
  '狍': '麅',
  '颣': '纇',
  '沩': '溈',
  '缬': '纈',
  '趸': '躉',
  '纩': '纊',
  '踌': '躊',
  '跻': '躋',
  '续': '續',
  '跃': '躍',
  '缠': '纏',
  '踯': '躑',
  '跞': '躒',
  '缨': '纓',
  '踬': '躓',
  '蹰': '躕',
  '准': '準',
  '纤': '纖',
  '丽': '麗',
  '缵': '纘',
  '亘': '亙',
  '跹': '躚',
  '熘': '溜',
  '缆': '纜',
  '沟': '溝',
  '亚': '亞',
  '蹑': '躡',
  '蹿': '躥',
  '麦': '麥',
  '躜': '躦',
  '麸': '麩',
  '躏': '躪',
  '库': '庫',
  '温': '溫',
  '浉': '溮',
  '涢': '溳',
  '面': '麵',
  '么': '麼',
  '躯': '軀',
  '厕': '廁',
  '厢': '廂',
  '黄': '黃',
  '厩': '廄',
  '沧': '滄',
  '灭': '滅',
  '厦': '廈',
  '车': '車',
  '轧': '軋',
  '涤': '滌',
  '轨': '軌',
  '黉': '黌',
  '军': '軍',
  '庼': '廎',
  '荥': '滎',
  '轪': '軑',
  '轩': '軒',
  '轫': '軔',
  '厨': '廚',
  '轭': '軛',
  '厮': '廝',
  '点': '點',
  '庙': '廟',
  '软': '軟',
  '厂': '廠',
  '庑': '廡',
  '废': '廢',
  '广': '廣',
  '轷': '軤',
  '党': '黨',
  '廪': '廩',
  '轸': '軫',
  '庐': '廬',
  '沪': '滬',
  '滞': '滯',
  '渗': '滲',
  '轱': '軲',
  '黪': '黲',
  '厅': '廳',
  '霉': '黴',
  '黡': '黶',
  '黩': '黷',
  '浒': '滸',
  '轴': '軸',
  '轵': '軹',
  '轺': '軺',
  '浐': '滻',
  '轲': '軻',
  '轶': '軼',
  '黾': '黽',
  '磙': '滾',
  '轼': '軾',
  '满': '滿',
  '鼋': '黿',
  '渔': '漁',
  '鼌': '鼂',
  '较': '較',
  '辂': '輅',
  '辁': '輇',
  '鳌': '鼇',
  '辀': '輈',
  '载': '載',
  '鼍': '鼉',
  '溇': '漊',
  '轾': '輊',
  '辄': '輒',
  '辅': '輔',
  '轻': '輕',
  '沤': '漚',
  '辆': '輛',
  '辎': '輜',
  '辉': '輝',
  '辋': '輞',
  '辍': '輟',
  '汉': '漢',
  '涟': '漣',
  '辊': '輥',
  '辇': '輦',
  '辈': '輩',
  '轮': '輪',
  '渍': '漬',
  '辌': '輬',
  '辑': '輯',
  '涨': '漲',
  '弪': '弳',
  '辏': '輳',
  '鼹': '鼴',
  '张': '張',
  '溆': '漵',
  '强': '強',
  '渐': '漸',
  '输': '輸',
  '辐': '輻',
  '钵': '缽',
  '辗': '輾',
  '浆': '漿',
  '舆': '輿',
  '辒': '轀',
  '颍': '潁',
  '毂': '轂',
  '辖': '轄',
  '辕': '轅',
  '别': '彆',
  '辘': '轆',
  '伫': '佇',
  '齄': '齇',
  '弹': '彈',
  '转': '轉',
  '齐': '齊',
  '斋': '齋',
  '弥': '彌',
  '罂': '罌',
  '辙': '轍',
  '弯': '彎',
  '赍': '齎',
  '轿': '轎',
  '齑': '齏',
  '泼': '潑',
  '齿': '齒',
  '洁': '潔',
  '辚': '轔',
  '龀': '齔',
  '龁': '齕',
  '龂': '齗',
  '畲': '佘',
  '汇': '彙',
  '龅': '齙',
  '潜': '潛',
  '龇': '齜',
  '轰': '轟',
  '龃': '齟',
  '彟': '彠',
  '龆': '齠',
  '辔': '轡',
  '龄': '齡',
  '轹': '轢',
  '润': '潤',
  '轳': '轤',
  '彦': '彥',
  '龈': '齦',
  '啮': '齧',
  '龊': '齪',
  '龉': '齬',
  '浔': '潯',
  '溃': '潰',
  '罚': '罰',
  '龋': '齲',
  '骂': '罵',
  '腭': '齶',
  '滗': '潷',
  '罢': '罷',
  '龌': '齷',
  '涠': '潿',
  '涩': '澀',
  '罗': '羅',
  '来': '來',
  '浇': '澆',
  '罴': '羆',
  '涝': '澇',
  '羁': '羈',
  '芈': '羋',
  '后': '後',
  '龙': '龍',
  '庞': '龐',
  '径': '徑',
  '龚': '龔',
  '龛': '龕',
  '仑': '侖',
  '涧': '澗',
  '龟': '龜',
  '从': '從',
  '徕': '徠',
  '渑': '澠',
  '泽': '澤',
  '羟': '羥',
  '办': '辦',
  '滪': '澦',
  '羡': '羨',
  '义': '義',
  '泶': '澩',
  '辞': '辭',
  '浍': '澮',
  '辫': '辮',
  '辩': '辯',
  '淀': '澱',
  '农': '農',
  '侣': '侶',
  '彻': '徹',
  '浊': '濁',
  '俣': '俁',
  '系': '係',
  '浓': '濃',
  '习': '習',
  '沵': '濔',
  '湿': '濕',
  '泞': '濘',
  '浕': '濜',
  '济': '濟',
  '侠': '俠',
  '涛': '濤',
  '漤': '濫',
  '翚': '翬',
  '潍': '濰',
  '滨': '濱',
  '翘': '翹',
  '溅': '濺',
  '泺': '濼',
  '翙': '翽',
  '滤': '濾',
};

/// 将简体转换成繁体
String convertToTraditionalChinese(String str) {
  final List<String> strArr = [];
  for (var i = 0; i < str.length; i++) {
    strArr.add(_words[str[i]] ?? str[i]);
  }
  return strArr.join();
}
