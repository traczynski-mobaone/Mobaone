import React, { useState } from 'react';
import { Trophy, Wallet, ChevronRight, ChevronLeft, Target, Search, ArrowUp, ArrowDown, Radio, BarChart2, X, Check, TrendingUp, Plus, CheckCircle, Heart, Calendar, ChevronDown, LogIn, Sun, Moon, Bell, Zap, Gift, Lock, Flame, Mail, Bot, Shield, Activity, Award, Layers, DollarSign, Eye, EyeOff, CircleDollarSign } from 'lucide-react';

const themeA_light = {
  bg:'#FFFFFF',bgLight:'#F5F5F7',card:'#FFFFFF',navy:'#1E1B4B',
  accent:'#3730A3',accentText:'#3730A3',accentLight:'#E0E7FF',
  textDark:'#1F2937',textMid:'#4B5563',textMuted:'#6B7280',textLight:'#5F6B7A',
  green:'#047857',greenLight:'#D1FAE5',red:'#B91C1C',redLight:'#FEE2E2',
  orange:'#C2410C',decorativeOrange:'#F97316',border:'#E5E7EB',
  headerBg:'#3730A3',
  navBg:'transparent',navBg2:'#F2F2F7',modalBg:'#FFFFFF',inputBg:'#F5F5F7',sectionBg:'#F2F2F7',
};
const themeA_dark = {
  bg:'#1C1C1E',bgLight:'#2C2C2E',card:'#2C2C2E',navy:'#EAECEF',
  accent:'#3730A3',accentText:'#818CF8',accentLight:'#1E1B4B',
  textDark:'#EAECEF',textMid:'#C7C9CC',textMuted:'#848E9C',textLight:'#848E9C',
  green:'#34D399',greenLight:'#064E3B',red:'#F87171',redLight:'#3B0000',
  orange:'#FB923C',decorativeOrange:'#FB923C',border:'#3A3A3C',
  headerBg:'#3730A3',
  navBg:'none',navBg2:'#3A3A3C',modalBg:'#2C2C2E',inputBg:'#1C1C1E',sectionBg:'#3A3A3C',
};

const indianWellsDraw=[
  {pos:1,seed:1,name:'C. Alcaraz',flag:'🇪🇸'},{pos:2,seed:null,name:'T. Atmane',flag:'🇫🇷'},
  {pos:3,seed:null,name:'G. Dimitrov',flag:'🇧🇬'},{pos:4,seed:null,name:'J.M. Cerundolo',flag:'🇦🇷'},
  {pos:5,seed:null,name:'B. van de Zandschulp',flag:'🇳🇱'},{pos:6,seed:26,name:'A. Rinderknech',flag:'🇫🇷'},
  {pos:7,seed:24,name:'V. Vacherot',flag:'🇲🇨'},{pos:8,seed:null,name:'N. Borges',flag:'🇵🇹'},
  {pos:9,seed:null,name:'E. Nava',flag:'🇺🇸'},{pos:10,seed:null,name:'A. Shevchenko',flag:'🇰🇿'},
  {pos:11,seed:null,name:'S. Shimabukuro',flag:'🇯🇵'},{pos:12,seed:13,name:'C. Ruud',flag:'🇳🇴'},
  {pos:13,seed:10,name:'A. Bublik',flag:'🇰🇿'},{pos:14,seed:null,name:'M. Zheng',flag:'🇨🇳'},
  {pos:15,seed:null,name:'V. Kopriva',flag:'🇨🇿'},{pos:16,seed:null,name:'F. Maestrelli',flag:'🇮🇹'},
  {pos:17,seed:null,name:'R. Hijikata',flag:'🇦🇺'},{pos:18,seed:20,name:'L. Darderi',flag:'🇮🇹'},
  {pos:19,seed:27,name:'C. Norrie',flag:'🇬🇧'},{pos:20,seed:null,name:'M. Arnaldi',flag:'🇮🇹'},
  {pos:21,seed:null,name:'M. McDonald',flag:'🇺🇸'},{pos:22,seed:null,name:'S. Korda',flag:'🇺🇸'},
  {pos:23,seed:null,name:'F. Comesana',flag:'🇦🇷'},{pos:24,seed:6,name:'A. de Minaur',flag:'🇦🇺'},
  {pos:25,seed:3,name:'N. Djokovic',flag:'🇷🇸'},{pos:26,seed:null,name:'K. Majchrzak',flag:'🇵🇱'},
  {pos:27,seed:null,name:'G. Mpetshi Perricard',flag:'🇫🇷'},{pos:28,seed:null,name:'H. Hurkacz',flag:'🇵🇱'},
  {pos:29,seed:null,name:'A. Kovacevic',flag:'🇺🇸'},{pos:30,seed:31,name:'C. Moutet',flag:'🇫🇷'},
  {pos:31,seed:19,name:'F. Cerundolo',flag:'🇦🇷'},{pos:32,seed:null,name:'V. Royer',flag:'🇫🇷'},
  {pos:33,seed:null,name:'B. Bonzi',flag:'🇫🇷'},{pos:34,seed:null,name:'F. Marozsan',flag:'🇭🇺'},
  {pos:35,seed:null,name:'R. Bautista Agut',flag:'🇪🇸'},{pos:36,seed:14,name:'J. Draper',flag:'🇬🇧'},
  {pos:37,seed:11,name:'D. Medvedev',flag:'🇷🇺'},{pos:38,seed:null,name:'A. Tabilo',flag:'🇨🇱'},
  {pos:39,seed:null,name:'R. Jodar',flag:'🇪🇸'},{pos:40,seed:null,name:'C. Tseng',flag:'🇹🇼'},
  {pos:41,seed:null,name:'S. Baez',flag:'🇦🇷'},{pos:42,seed:22,name:'J. Lehecka',flag:'🇨🇿'},
  {pos:43,seed:32,name:'U. Humbert',flag:'🇫🇷'},{pos:44,seed:null,name:'D. Merida',flag:'🇪🇸'},
  {pos:45,seed:null,name:'A. Michelsen',flag:'🇺🇸'},{pos:46,seed:null,name:'J. Fearnley',flag:'🇬🇧'},
  {pos:47,seed:null,name:'D. Dzumhur',flag:'🇧🇦'},{pos:48,seed:7,name:'T. Fritz',flag:'🇺🇸'},
  {pos:49,seed:5,name:'L. Musetti',flag:'🇮🇹'},{pos:50,seed:null,name:'M. Fucsovics',flag:'🇭🇺'},
  {pos:51,seed:null,name:"C. O'Connell",flag:'🇦🇺'},{pos:52,seed:null,name:'D. Prizmic',flag:'🇭🇷'},
  {pos:53,seed:null,name:'T. Schoolkate',flag:'🇦🇺'},{pos:54,seed:30,name:'A. Fils',flag:'🇫🇷'},
  {pos:55,seed:17,name:'A. Rublev',flag:'🇷🇺'},{pos:56,seed:null,name:'M. Bellucci',flag:'🇮🇹'},
  {pos:57,seed:null,name:'G. Diallo',flag:'🇨🇦'},{pos:58,seed:null,name:'G. Monfils',flag:'🇫🇷'},
  {pos:59,seed:null,name:'A. Galarneau',flag:'🇨🇦'},{pos:60,seed:9,name:'F. Auger-Aliassime',flag:'🇨🇦'},
  {pos:61,seed:15,name:'F. Cobolli',flag:'🇮🇹'},{pos:62,seed:null,name:'D. Altmaier',flag:'🇩🇪'},
  {pos:63,seed:null,name:'M. Kecmanovic',flag:'🇷🇸'},{pos:64,seed:null,name:'J. Brooksby',flag:'🇺🇸'},
  {pos:65,seed:null,name:'A. Popyrin',flag:'🇦🇺'},{pos:66,seed:21,name:'F. Tiafoe',flag:'🇺🇸'},
  {pos:67,seed:28,name:'B. Nakashima',flag:'🇺🇸'},{pos:68,seed:null,name:'C. Ugo Carabelli',flag:'🇦🇷'},
  {pos:69,seed:null,name:'M. Damm',flag:'🇺🇸'},{pos:70,seed:null,name:'M. Berrettini',flag:'🇮🇹'},
  {pos:71,seed:null,name:'A. Mannarino',flag:'🇫🇷'},{pos:72,seed:4,name:'A. Zverev',flag:'🇩🇪'},
  {pos:73,seed:8,name:'B. Shelton',flag:'🇺🇸'},{pos:74,seed:null,name:'R. Opelka',flag:'🇺🇸'},
  {pos:75,seed:null,name:'E. Quinn',flag:'🇺🇸'},{pos:76,seed:null,name:'Q. Halys',flag:'🇫🇷'},
  {pos:77,seed:null,name:'A. Walton',flag:'🇦🇺'},{pos:78,seed:25,name:'L. Tien',flag:'🇺🇸'},
  {pos:79,seed:18,name:'A. Davidovich Fokina',flag:'🇪🇸'},{pos:80,seed:null,name:'Z. Svajda',flag:'🇺🇸'},
  {pos:81,seed:null,name:'M. Cilic',flag:'🇭🇷'},{pos:82,seed:null,name:'M. Navone',flag:'🇦🇷'},
  {pos:83,seed:null,name:'M. Giron',flag:'🇺🇸'},{pos:84,seed:12,name:'J. Mensik',flag:'🇨🇿'},
  {pos:85,seed:16,name:'K. Khachanov',flag:'🇷🇺'},{pos:86,seed:null,name:'J. Fonseca',flag:'🇧🇷'},
  {pos:87,seed:null,name:'R. Collignon',flag:'🇧🇪'},{pos:88,seed:null,name:'Z. Bergs',flag:'🇧🇪'},
  {pos:89,seed:null,name:'J. Struff',flag:'🇩🇪'},{pos:90,seed:23,name:'T. Paul',flag:'🇺🇸'},
  {pos:91,seed:29,name:'T. Etcheverry',flag:'🇦🇷'},{pos:92,seed:null,name:'S. Tsitsipas',flag:'🇬🇷'},
  {pos:93,seed:null,name:'D. Shapovalov',flag:'🇨🇦'},{pos:94,seed:null,name:'D. Svrcina',flag:'🇨🇿'},
  {pos:95,seed:null,name:'J. Duckworth',flag:'🇦🇺'},{pos:96,seed:2,name:'J. Sinner',flag:'🇮🇹'},
  {pos:97,seed:null,name:'Y. Hanfmann',flag:'🇩🇪'},{pos:98,seed:null,name:'L. Sonego',flag:'🇮🇹'},
  {pos:99,seed:null,name:'D. Lajovic',flag:'🇷🇸'},{pos:100,seed:null,name:'T. Griekspoor',flag:'🇳🇱'},
  {pos:101,seed:null,name:'A. Muller',flag:'🇫🇷'},{pos:102,seed:null,name:'P. Martinez',flag:'🇪🇸'},
  {pos:103,seed:null,name:'L. Van Assche',flag:'🇫🇷'},{pos:104,seed:null,name:'J. Shang',flag:'🇨🇳'},
  {pos:105,seed:null,name:'F. Diaz Acosta',flag:'🇦🇷'},{pos:106,seed:null,name:'M. Purcell',flag:'🇦🇺'},
  {pos:107,seed:null,name:'T. Daniel',flag:'🇯🇵'},{pos:108,seed:null,name:'A. Cazaux',flag:'🇫🇷'},
  {pos:109,seed:null,name:'H. Gaston',flag:'🇫🇷'},{pos:110,seed:null,name:'L. Djere',flag:'🇷🇸'},
  {pos:111,seed:null,name:'R. Carballes Baena',flag:'🇪🇸'},{pos:112,seed:null,name:'M. Cressy',flag:'🇺🇸'},
  {pos:113,seed:null,name:'J. Munar',flag:'🇪🇸'},{pos:114,seed:null,name:'F. Coria',flag:'🇦🇷'},
  {pos:115,seed:null,name:'N. Jarry',flag:'🇨🇱'},{pos:116,seed:null,name:'A. Vukic',flag:'🇦🇺'},
  {pos:117,seed:null,name:'D. Galan',flag:'🇨🇴'},{pos:118,seed:null,name:'T. Monteiro',flag:'🇧🇷'},
  {pos:119,seed:null,name:'B. Zapata Miralles',flag:'🇪🇸'},{pos:120,seed:null,name:'M. Kukushkin',flag:'🇰🇿'},
  {pos:121,seed:null,name:'A. Ramos-Vinolas',flag:'🇪🇸'},{pos:122,seed:null,name:'J. Vesely',flag:'🇨🇿'},
  {pos:123,seed:null,name:'H. Rune',flag:'🇩🇰'},{pos:124,seed:null,name:'C. Eubanks',flag:'🇺🇸'},
  {pos:125,seed:null,name:'M. Mmoh',flag:'🇺🇸'},{pos:126,seed:null,name:'E. Ruusuvuori',flag:'🇫🇮'},
  {pos:127,seed:null,name:'A. Karatsev',flag:'🇷🇺'},{pos:128,seed:null,name:'Y. Nishioka',flag:'🇯🇵'},
];
const atpPlayers=Array.from({length:32},(_,i)=>({
  id:i+1,
  name:['C. Alcaraz','J. Sinner','N. Djokovic','A. Zverev','L. Musetti','A. de Minaur','T. Fritz','B. Shelton','F. Auger-Aliassime','A. Bublik','D. Medvedev','J. Mensik','C. Ruud','J. Draper','F. Cobolli','K. Khachanov','A. Rublev','A. Davidovich Fokina','F. Cerundolo','L. Darderi','F. Tiafoe','J. Lehecka','T. Paul','V. Vacherot','L. Tien','A. Rinderknech','C. Norrie','B. Nakashima','T. Etcheverry','A. Fils','C. Moutet','U. Humbert'][i],
  seed:i+1,
  flag:['🇪🇸','🇮🇹','🇷🇸','🇩🇪','🇮🇹','🇦🇺','🇺🇸','🇺🇸','🇨🇦','🇰🇿','🇷🇺','🇨🇿','🇳🇴','🇬🇧','🇮🇹','🇷🇺','🇷🇺','🇪🇸','🇦🇷','🇮🇹','🇺🇸','🇨🇿','🇺🇸','🇲🇨','🇺🇸','🇫🇷','🇬🇧','🇺🇸','🇦🇷','🇫🇷','🇫🇷','🇫🇷'][i],
}));
const generateR128=()=>{const m=[];for(let i=0;i<128;i+=2){const p1=indianWellsDraw[i],p2=indianWellsDraw[i+1];m.push({id:`r128-m${m.length}`,p1:{id:p1.pos,name:p1.name,seed:p1.seed,flag:p1.flag},p2:{id:p2.pos,name:p2.name,seed:p2.seed,flag:p2.flag}});}return m;};

const STAKES=[
  {id:'s1',entry:1,poolEntry:1,rake:0,color:'#6B7280',mockEntries:80000},
  {id:'s2',entry:2,poolEntry:2,rake:0,color:'#6B7280',mockEntries:45000},
  {id:'s3',entry:5,poolEntry:4,rake:1,color:'#059669',mockEntries:22000},
  {id:'s4',entry:10,poolEntry:9,rake:1,color:'#059669',mockEntries:12000},
  {id:'s5',entry:25,poolEntry:22,rake:3,color:'#3730A3',mockEntries:5500},
  {id:'s6',entry:50,poolEntry:45,rake:5,color:'#3730A3',mockEntries:2800},
  {id:'s7',entry:100,poolEntry:90,rake:10,color:'#B45309',mockEntries:1400},
  {id:'s8',entry:250,poolEntry:225,rake:25,color:'#B45309',mockEntries:580},
  {id:'s9',entry:500,poolEntry:450,rake:50,color:'#DC2626',mockEntries:240},
  {id:'s10',entry:1000,poolEntry:900,rake:100,color:'#DC2626',mockEntries:95},
];
const getStakePool=s=>s.mockEntries*s.poolEntry;
const getTotalPoolWeight=()=>STAKES.reduce((s,st)=>s+st.poolEntry*st.mockEntries,0);
const getGuaranteedForStake=(stake,t)=>{if(!t?.guaranteed)return 0;const w=(stake.poolEntry*stake.mockEntries)/getTotalPoolWeight();return Math.round(t.guaranteed*w);};
const getEffectivePool=(stake,t)=>Math.max(getStakePool(stake),getGuaranteedForStake(stake,t));
const getOverlay=(stake,t)=>Math.max(0,getGuaranteedForStake(stake,t)-getStakePool(stake));
const getTiers=()=>STAKES;
const calcPrizePool=(entries,poolEntry)=>entries*poolEntry;
const getBracketSize=t=>!t?32:(t.type==='grandslam'||t.type==='atp1000')?128:t.type==='atp500'?64:32;
const getRounds=t=>{const s=getBracketSize(t);if(s===128)return [{name:'R128',matches:64,pts:1},{name:'R64',matches:32,pts:2},{name:'R32',matches:16,pts:3},{name:'R16',matches:8,pts:5},{name:'QF',matches:4,pts:8},{name:'SF',matches:2,pts:13},{name:'F',matches:1,pts:21}];if(s===64)return [{name:'R32',matches:16,pts:1},{name:'R16',matches:8,pts:2},{name:'QF',matches:4,pts:3},{name:'SF',matches:2,pts:5},{name:'F',matches:1,pts:8}];return [{name:'R16',matches:8,pts:1},{name:'QF',matches:4,pts:2},{name:'SF',matches:2,pts:3},{name:'F',matches:1,pts:5}];};
const getBlackHorse=bracketSize=>{if(bracketSize===128)return indianWellsDraw.filter(p=>p.seed===null||(typeof p.seed==='number'&&p.seed>32)).map(p=>({id:p.pos,name:p.name,seed:p.seed,flag:p.flag}));if(bracketSize===64)return atpPlayers.filter(p=>p.seed>=17);return atpPlayers.filter(p=>p.seed>=9);};

const tournaments=[
  {id:1,month:'March 2026',dates:'04-15',dateSuffix:'Mar',type:'atp1000',name:'Indian Wells',subtitle:'BNP Paribas Open',status:'live',pool:85000,entries:2156,entry:20,poolEntry:18,surface:'Hard',guaranteed:1000000},
  {id:2,month:'March 2026',dates:'18-29',dateSuffix:'Mar',type:'atp1000',name:'Miami',subtitle:'Miami Open presented by Itau',status:'open',pool:78000,entries:1892,entry:20,poolEntry:18,surface:'Hard',guaranteed:1000000},
  {id:3,month:'March 2026',dates:'30 Mar',dateSuffix:'05 Apr',type:'atp250',name:'Houston',subtitle:"U.S. Men's Clay Court Championship",status:'upcoming',pool:18000,entries:0,entry:10,poolEntry:9,surface:'Clay'},
  {id:4,month:'March 2026',dates:'30 Mar',dateSuffix:'05 Apr',type:'atp250',name:'Marrakech',subtitle:'Grand Prix Hassan II',status:'upcoming',pool:15000,entries:0,entry:10,poolEntry:9,surface:'Clay'},
  {id:5,month:'April 2026',dates:'05-12',dateSuffix:'Apr',type:'atp1000',name:'Monte-Carlo',guaranteed:1000000,subtitle:'Rolex Monte-Carlo Masters',status:'upcoming',pool:65000,entries:0,entry:20,poolEntry:18,surface:'Clay'},
  {id:6,month:'April 2026',dates:'13-19',dateSuffix:'Apr',type:'atp500',name:'Barcelona',subtitle:'Barcelona Open Banc Sabadell',status:'upcoming',pool:32000,entries:0,entry:15,poolEntry:13,surface:'Clay'},
  {id:7,month:'April 2026',dates:'13-19',dateSuffix:'Apr',type:'atp500',name:'Munich',subtitle:'BMW Open by Bitpanda',status:'upcoming',pool:28000,entries:0,entry:15,poolEntry:13,surface:'Clay'},
  {id:8,month:'April 2026',dates:'22 Apr',dateSuffix:'03 May',type:'atp1000',name:'Madrid',guaranteed:1500000,subtitle:'Mutua Madrid Open',status:'upcoming',pool:72000,entries:0,entry:20,poolEntry:18,surface:'Clay'},
  {id:9,month:'May 2026',dates:'06-17',dateSuffix:'May',type:'atp1000',name:'Rome',guaranteed:1000000,subtitle:"Internazionali BNL d'Italia",status:'upcoming',pool:70000,entries:0,entry:20,poolEntry:18,surface:'Clay'},
  {id:10,month:'May 2026',dates:'17-23',dateSuffix:'May',type:'atp500',name:'Hamburg',subtitle:'Bitpanda Hamburg Open',status:'upcoming',pool:25000,entries:0,entry:15,poolEntry:13,surface:'Clay'},
  {id:11,month:'May 2026',dates:'17-23',dateSuffix:'May',type:'atp250',name:'Geneva',subtitle:'Gonet Geneva Open',status:'upcoming',pool:14000,entries:0,entry:10,poolEntry:9,surface:'Clay'},
  {id:12,month:'May 2026',dates:'24 May',dateSuffix:'07 Jun',type:'grandslam',name:'Paris',subtitle:'Roland Garros',guaranteed:5000000,status:'upcoming',pool:150000,entries:0,entry:25,poolEntry:23,surface:'Clay'},
  {id:101,month:'March 2026',dates:'18-29',dateSuffix:'Mar',type:'atp1000',name:'Miami Freeroll',subtitle:'Sponsored by Wilson - FREE entry',status:'open',pool:5000,entries:4820,entry:0,poolEntry:0,surface:'Hard',freeroll:true,sponsor:'Wilson',freerollPool:5000},
  {id:102,month:'April 2026',dates:'05-12',dateSuffix:'Apr',type:'atp1000',name:'Monte-Carlo Freeroll',subtitle:'Sponsored by Babolat - FREE entry',status:'upcoming',pool:3000,entries:0,entry:0,poolEntry:0,surface:'Clay',freeroll:true,sponsor:'Babolat',freerollPool:3000},
  {id:103,month:'May 2026',dates:'24 May',dateSuffix:'07 Jun',type:'grandslam',name:'Roland Garros Freeroll',subtitle:'New User Special - FREE entry',status:'upcoming',pool:10000,entries:0,entry:0,poolEntry:0,surface:'Clay',freeroll:true,sponsor:'mobaOne',freerollPool:10000,newUserOnly:true},
];
const liveMatches=[
  {id:1,tournament:'Indian Wells',round:'Quarter-Final',court:'Stadium 1',time:'2:34:22',p1:{name:'C. Alcaraz',seed:2,flag:'🇪🇸',sets:[6,4,5],serving:true},p2:{name:'S. Tsitsipas',seed:10,flag:'🇬🇷',sets:[3,6,4]},stats:{aces:[12,8],winners:[34,28],errors:[18,24]}},
  {id:2,tournament:'Indian Wells',round:'Quarter-Final',court:'Stadium 2',time:'1:52:18',p1:{name:'J. Sinner',seed:3,flag:'🇮🇹',sets:[6,6]},p2:{name:'G. Dimitrov',seed:9,flag:'🇧🇬',sets:[2,3],serving:true},stats:{aces:[8,4],winners:[26,19],errors:[12,22]}},
  {id:3,tournament:'Indian Wells',round:'Quarter-Final',court:'Court 1',time:'0:45:33',p1:{name:'A. Zverev',seed:5,flag:'🇩🇪',sets:[4],serving:true},p2:{name:'T. Fritz',seed:11,flag:'🇺🇸',sets:[5]},stats:{aces:[5,3],winners:[12,10],errors:[8,11]}},
];
const upcomingMatches=[
  {id:4,tournament:'Roland Garros',round:'Quarter-Final',court:'Philippe-Chatrier',time:'14:00',p1:{name:'N. Djokovic',seed:1,flag:'🇷🇸'},p2:{name:'C. Ruud',seed:8,flag:'🇳🇴'}},
  {id:5,tournament:'Roland Garros',round:'Quarter-Final',court:'Suzanne-Lenglen',time:'16:30',p1:{name:'D. Medvedev',seed:4,flag:'🇷🇺'},p2:{name:'A. Rublev',seed:6,flag:'🇷🇺'}},
];
const completedMatches=[
  {id:6,tournament:'Roland Garros',round:'R16',duration:'2:15',p1:{name:'C. Alcaraz',seed:2,flag:'🇪🇸',sets:[6,6,6],winner:true},p2:{name:'F. Tiafoe',seed:16,flag:'🇺🇸',sets:[3,4,2]}},
  {id:7,tournament:'Roland Garros',round:'R16',duration:'3:42',p1:{name:'J. Sinner',seed:3,flag:'🇮🇹',sets:[7,4,6,6],winner:true},p2:{name:'B. Shelton',seed:13,flag:'🇺🇸',sets:[6,6,4,3]}},
];
const mockLeaderboard=[
  {rank:1,prevRank:2,name:'TennisKing99',flag:'🇺🇸',pts:47,r128:8,r64:12,r32:10,r16:9,qf:8,isYou:false},
  {rank:2,prevRank:1,name:'AcePredictor',flag:'🇬🇧',pts:44,r128:7,r64:11,r32:9,r16:9,qf:8,isYou:false},
  {rank:3,prevRank:4,name:'SlamMaster',flag:'🇪🇸',pts:43,r128:8,r64:10,r32:9,r16:8,qf:8,isYou:false},
  {rank:4,prevRank:3,name:'ClayKing',flag:'🇫🇷',pts:41,r128:7,r64:10,r32:8,r16:8,qf:8,isYou:false},
  {rank:5,prevRank:6,name:'NetRusher',flag:'🇦🇺',pts:39,r128:6,r64:9,r32:8,r16:8,qf:8,isYou:false},
  {rank:6,prevRank:5,name:'ServeAce',flag:'🇩🇪',pts:38,r128:6,r64:9,r32:8,r16:7,qf:8,isYou:false},
  {rank:7,prevRank:9,name:'MatchPoint',flag:'🇮🇹',pts:36,r128:6,r64:8,r32:7,r16:7,qf:8,isYou:false},
  {rank:8,prevRank:7,name:'CourtKing',flag:'🇨🇦',pts:35,r128:5,r64:8,r32:7,r16:7,qf:8,isYou:false},
  {rank:9,prevRank:10,name:'GrandSlamPro',flag:'🇯🇵',pts:34,r128:5,r64:8,r32:7,r16:6,qf:8,isYou:false},
  {rank:10,prevRank:8,name:'TopSpinWiz',flag:'🇧🇷',pts:33,r128:5,r64:7,r32:7,r16:6,qf:8,isYou:false},
  {rank:120,prevRank:135,name:'RallyHero',flag:'🇵🇱',pts:18,r128:3,r64:4,r32:3,r16:3,qf:5,isYou:false},
  {rank:125,prevRank:140,name:'BreakPoint',flag:'🇳🇱',pts:17,r128:3,r64:4,r32:3,r16:3,qf:4,isYou:false},
  {rank:127,prevRank:142,name:'AceMaster',flag:'🇺🇸',pts:47,r128:8,r64:12,r32:10,r16:9,qf:8,isYou:true},
  {rank:128,prevRank:130,name:'SetWinner',flag:'🇵🇱',pts:16,r128:3,r64:3,r32:3,r16:3,qf:4,isYou:false},
  {rank:129,prevRank:145,name:'VolleyKing',flag:'🇨🇭',pts:15,r128:2,r64:3,r32:3,r16:3,qf:4,isYou:false},
];
const rankings=[
  {rank:1,name:'TennisKing99',flag:'🇺🇸',pts:24850,played:32,winRate:78,earnings:45200},
  {rank:2,name:'AcePredictor',flag:'🇬🇧',pts:22340,played:29,winRate:75,earnings:38500},
  {rank:3,name:'SlamMaster',flag:'🇪🇸',pts:21100,played:31,winRate:74,earnings:32100},
  {rank:4,name:'ClayKing',flag:'🇫🇷',pts:19750,played:28,winRate:72,earnings:28400},
  {rank:5,name:'NetRusher',flag:'🇦🇺',pts:18200,played:30,winRate:71,earnings:25600},
  {rank:6,name:'ServeAce',flag:'🇩🇪',pts:17450,played:27,winRate:70,earnings:22800},
  {rank:7,name:'MatchPoint',flag:'🇮🇹',pts:16800,played:26,winRate:69,earnings:19500},
  {rank:8,name:'CourtKing',flag:'🇨🇦',pts:15920,played:25,winRate:68,earnings:17200},
  {rank:9,name:'GrandSlamPro',flag:'🇯🇵',pts:15100,played:28,winRate:67,earnings:15800},
  {rank:10,name:'TopSpinWiz',flag:'🇧🇷',pts:14350,played:24,winRate:66,earnings:14200},
  {rank:11,name:'RallyMaster',flag:'🇦🇷',pts:13600,played:26,winRate:65,earnings:12900},
  {rank:12,name:'BreakPoint',flag:'🇳🇱',pts:12850,played:23,winRate:64,earnings:11500},
  {rank:13,name:'SetWinner',flag:'🇵🇱',pts:12100,played:25,winRate:63,earnings:10200},
  {rank:14,name:'VolleyKing',flag:'🇨🇭',pts:11400,played:22,winRate:62,earnings:9400},
  {rank:15,name:'BaselineHero',flag:'🇧🇪',pts:10750,played:24,winRate:61,earnings:8600},
  {rank:16,name:'DropShotPro',flag:'🇸🇪',pts:10100,played:21,winRate:60,earnings:7800},
  {rank:17,name:'PassingShot',flag:'🇦🇹',pts:9500,played:23,winRate:59,earnings:7100},
  {rank:18,name:'LobMaster',flag:'🇳🇴',pts:8900,played:20,winRate:58,earnings:6400},
  {rank:19,name:'SliceKing',flag:'🇩🇰',pts:8350,played:22,winRate:57,earnings:5800},
  {rank:20,name:'SmashHero',flag:'🇵🇹',pts:7800,played:19,winRate:56,earnings:5200},
  {rank:21,name:'TieBreakerPro',flag:'🇬🇷',pts:7300,played:21,winRate:55,earnings:4700},
  {rank:22,name:'MatchTieBreak',flag:'🇨🇿',pts:6850,played:18,winRate:54,earnings:4200},
  {rank:23,name:'GrassKing',flag:'🇮🇪',pts:6400,played:20,winRate:53,earnings:3800},
  {rank:24,name:'HardCourtPro',flag:'🇿🇦',pts:5950,played:17,winRate:52,earnings:3400},
  {rank:25,name:'IndoorMaster',flag:'🇷🇴',pts:5550,played:19,winRate:51,earnings:3000},
  {rank:26,name:'OutdoorAce',flag:'🇭🇷',pts:5150,played:16,winRate:50,earnings:2700},
  {rank:27,name:'NightSession',flag:'🇺🇦',pts:4800,played:18,winRate:49,earnings:2400},
  {rank:28,name:'DayMatch',flag:'🇨🇱',pts:4450,played:15,winRate:48,earnings:2100},
  {rank:29,name:'ChampionMind',flag:'🇰🇷',pts:4100,played:17,winRate:47,earnings:1900},
  {rank:30,name:'WinnerTakes',flag:'🇲🇽',pts:3800,played:14,winRate:46,earnings:1700},
];

const MobaLogo=({size=28,color='#FFFFFF'})=>(<svg width={size*(138/85.4)} height={size} viewBox="0 0 138 85.4" fill="none" xmlns="http://www.w3.org/2000/svg"><path fill={color} d="M87.64,83.54c-22.45-6.81-25.43-36.17-38.34-51.65-.96-1.15-1.9-2.04-3.38-2.46l-30.93,50.86c-7.59,7.16-18.77.56-13.72-10.73C10.8,48.24,28.54,26.46,38.6,4.9c3.25-5.73,9.49-6.32,14.53-2.35l34.78,61.72c34.87,18.76,32.05-44.93,8.12-43.97-8.64.35-11.21,15.66-14.75,17.75-.72.43-1.88.25-2.74.09-4.15-11.77-11.38-13.67-2.08-25.38,12.7-15.98,32.96-10.84,44.49,3.47,22.59,28.03,7.3,79.62-33.31,67.31Z"/><path fill={color} d="M61.24,66.58c-5.62,7.21-7.62,21.1-19.09,18.44-15.76-3.64,5.37-27.39,7.83-34.74l2.45-1.04,8.81,17.34Z"/></svg>);
const MobaWordmark=({color='#FFFFFF',fontSize=18})=>(<span style={{fontSize,fontWeight:700,color,letterSpacing:'-0.5px',fontFamily:'-apple-system,BlinkMacSystemFont,"SF Pro Display","Segoe UI",sans-serif'}}>mobaOne</span>);

export default function App() {
  const systemDark=window.matchMedia&&window.matchMedia('(prefers-color-scheme: dark)').matches;
  const [isDark,setIsDark]=useState(systemDark);
  const [themeMode,setThemeMode]=useState('system');
  React.useEffect(()=>{if(themeMode!=='system')return;const mq=window.matchMedia('(prefers-color-scheme: dark)');const h=e=>setIsDark(e.matches);mq.addEventListener('change',h);return()=>mq.removeEventListener('change',h);},[themeMode]);
  const C=isDark?themeA_dark:themeA_light;
  const [view,setView]=useState('bracket');
  const [balance,setBalance]=useState(3485);
  const [modal,setModal]=useState(null);
  const [selPlayer,setSelPlayer]=useState(null);
  const [liveTab,setLiveTab]=useState('live');
  const [calendarTab,setCalendarTab]=useState('all');
  const [bracketRound,setBracketRound]=useState(0);
  const [bracketTab,setBracketTab]=useState('picks');
  const [drawRound,setDrawRound]=useState(0);
  const [predictions,setPredictions]=useState({});
  const [blackHorse,setBlackHorse]=useState(null);
  const [activeTournament,setActiveTournament]=useState(tournaments[0]);
  const [depAmt,setDepAmt]=useState('');
  const [depStep,setDepStep]=useState(1);
  const [withdrawAmt,setWithdrawAmt]=useState('');
  const [withdrawStep,setWithdrawStep]=useState(1);
  const [submitStep,setSubmitStep]=useState(1);
  const [myBrackets,setMyBrackets]=useState([{id:1,tournament:tournaments[0],champion:{id:1,name:'C. Alcaraz',seed:1,flag:'🇪🇸'},blackHorse:{id:37,name:'D. Medvedev',seed:11,flag:'🇷🇺'},predictions:{},submittedAt:new Date().toISOString(),status:'active',position:127,prevPosition:142,points:47,correctPicks:12,totalPicks:31,blackHorseAlive:true,prize:0}]);
  const [selectedBracket,setSelectedBracket]=useState(null);
  const [leaderboardBracket,setLeaderboardBracket]=useState(null);
  const MAX_BRACKETS_PER_TOURNAMENT=3;
  const [bracketName,setBracketName]=useState('');
  const [selectedTier,setSelectedTier]=useState(null);
  const [liveTickerMsg,setLiveTickerMsg]=useState(null);
  const [h2hOpponent,setH2hOpponent]=useState(null);
  const [miniLeagues,setMiniLeagues]=useState([{id:1,name:'Tennis Nerds 🎾',code:'TN2026',members:6,myRank:2,leader:'ServeAce'},{id:2,name:'Office League',code:'OFF123',members:4,myRank:1,leader:'AceMaster'}]);
  const [newLeagueName,setNewLeagueName]=useState('');
  const [joinCode,setJoinCode]=useState('');
  const [leagueTab,setLeagueTab]=useState('my');
  const [h2hSelected,setH2hSelected]=useState(null);
  const [prizesShowAll,setPrizesShowAll]=useState(false);
  const [authMode,setAuthMode]=useState('login');

  // FIX 3: playerFormData - duplicates removed
  const playerFormData={
    'D. Medvedev':{recentForm:['L','W','W','L','W'],hardWin:79,clayWin:61,grassWin:58,rank:11,qfRate:61,titles:1},
    'C. Ruud':{recentForm:['W','L','W','W','L'],hardWin:62,clayWin:79,grassWin:44,rank:13,qfRate:58,titles:0},
    'T. Fritz':{recentForm:['W','W','L','W','W'],hardWin:71,clayWin:55,grassWin:63,rank:7,qfRate:52,titles:0},
    'A. de Minaur':{recentForm:['W','W','W','L','W'],hardWin:74,clayWin:66,grassWin:61,rank:6,qfRate:55,titles:0},
    'B. Shelton':{recentForm:['L','W','W','W','W'],hardWin:69,clayWin:58,grassWin:54,rank:8,qfRate:48,titles:0},
    'J. Draper':{recentForm:['W','W','W','W','L'],hardWin:67,clayWin:61,grassWin:69,rank:14,qfRate:45,titles:0},
    'C. Alcaraz':{recentForm:['W','W','W','L','W'],hardWin:78,clayWin:82,grassWin:71,rank:1,qfRate:81,titles:4},
    'J. Sinner':{recentForm:['W','W','L','W','W'],hardWin:81,clayWin:74,grassWin:68,rank:2,qfRate:78,titles:3},
    'N. Djokovic':{recentForm:['W','L','W','W','W'],hardWin:76,clayWin:79,grassWin:85,rank:3,qfRate:85,titles:24},
    'A. Zverev':{recentForm:['W','W','W','W','L'],hardWin:72,clayWin:77,grassWin:65,rank:4,qfRate:72,titles:0},
  };
  const getHistoricalAnalysis=(n,surface)=>{const f=playerFormData[n];if(!f)return null;const sw=surface==='Hard'?f.hardWin:surface==='Clay'?f.clayWin:f.grassWin;const form=f.recentForm||[];return{surfaceWinRate:sw||65,recentForm:form,recentWins:form.filter(r=>r==='W').length,qfRate:f.qfRate||50,titles:f.titles||0,rank:f.rank||50};};

  const [aiSuggestion,setAiSuggestion]=useState(null);
  const [aiLoading,setAiLoading]=useState(false);
  const [notifications,setNotifications]=useState([
    {id:1,type:'points',read:false,title:'Alcaraz wins QF!',body:'Your pick is correct. +8 pts added to your bracket.',time:'2m ago',icon:'points'},
    {id:2,type:'ranking',read:false,title:'You climbed 15 spots!',body:'Now ranked #112 in Indian Wells. Top 15% in sight!',time:'8m ago',icon:'ranking'},
    {id:3,type:'bh',read:false,title:'Black Horse still alive!',body:'Medvedev beats Bublik in R16. 1.5x multiplier continues.',time:'1h ago',icon:'bh'},
    {id:4,type:'lock',read:true,title:'Miami Open locks in 24h',body:'Submit your bracket before the tournament starts.',time:'3h ago',icon:'lock'},
    {id:5,type:'result',read:true,title:'Miami Open bracket ready',body:'Draw has been released. Start building your predictions.',time:'1d ago',icon:'result'},
    {id:6,type:'win',read:true,title:'Prize credited!',body:'$1,250 from Indian Wells (3rd place) added to your wallet.',time:'2d ago',icon:'win'},
  ]);
  const [globalFeed]=useState([
    {id:1,user:'TennisKing99',flag:'🇺🇸',action:'won',detail:'$4,200 - Indian Wells $50 entry',time:'2m ago',pts:89},
    {id:2,user:'SlamMaster',flag:'🇪🇸',action:'submitted',detail:'Roland Garros bracket ($25)',time:'5m ago',pts:null},
    {id:3,user:'ClayKing',flag:'🇫🇷',action:'climbed',detail:'to #3 in Miami leaderboard',time:'12m ago',pts:null},
    {id:4,user:'NetRusher',flag:'🇦🇺',action:'won',detail:'$890 - Miami Open $10 entry',time:'18m ago',pts:74},
    {id:5,user:'AcePredictor',flag:'🇬🇧',action:'submitted',detail:'Indian Wells bracket ($100)',time:'25m ago',pts:null},
    {id:6,user:'ServeAce',flag:'🇩🇪',action:'unlocked',detail:'Achievement: Perfect QF',time:'31m ago',pts:null},
    {id:7,user:'MatchPoint',flag:'🇮🇹',action:'won',detail:'$12,400 - Roland Garros $250',time:'45m ago',pts:112},
    {id:8,user:'CourtKing',flag:'🇨🇦',action:'climbed',detail:'to #8 in Indian Wells',time:'1h ago',pts:null},
    {id:9,user:'GrandSlamPro',flag:'🇯🇵',action:'submitted',detail:'Monte-Carlo bracket ($50)',time:'1h ago',pts:null},
    {id:10,user:'TopSpinWiz',flag:'🇧🇷',action:'won',detail:'$38,000 - Roland Garros $1000',time:'2h ago',pts:156},
  ]);
  const [vsOpponent,setVsOpponent]=useState(null);
  const [legalPage,setLegalPage]=useState(null);
  const [sharePopup,setSharePopup]=useState(null);
  const [winBanner,setWinBanner]=useState(null); // {player, pts, round}
  const [socialModal,setSocialModal]=useState(null); // 'comments'|'profile'
  const [publicProfile,setPublicProfile]=useState(null);
  const [comments,setComments]=useState([
    {id:1,user:'TennisKing99',flag:'🇺🇸',text:'Alcaraz all the way, easy money 💰',time:'5m ago',likes:12,liked:false},
    {id:2,user:'ClayKing',flag:'🇫🇷',text:'Djokovic slept on this bracket. He is peaking right now',time:'12m ago',likes:8,liked:false},
    {id:3,user:'AcePredictor',flag:'🇬🇧',text:'My Black Horse Bublik is going deep I can feel it 🐴',time:'18m ago',likes:5,liked:true},
    {id:4,user:'NetRusher',flag:'🇦🇺',text:'Who else has Medvedev in QF? Feels risky on hard court after his recent form',time:'24m ago',likes:3,liked:false},
    {id:5,user:'ServeAce',flag:'🇩🇪',text:'Prize pool almost at 90k 🔥 keep entering',time:'31m ago',likes:19,liked:false},
  ]);
  const [newComment,setNewComment]=useState('');
  const poolLiveRef = React.useRef(85000);
  const [poolLive,setPoolLive]=useState(85000);
  const REACTIONS=['🔥','💰','🎾','🐴','👑'];
  const [bracketReactions,setBracketReactions]=useState({});
  const [cashbackData]=useState({currentMonth:'March 2026',totalRakePaid:47,cashbackRate:0.05,cashbackEarned:2.35,cashbackPending:1.20,cashbackPaid:1.15,tier:'Bronze',nextTierAt:100,history:[{month:'Feb 2026',rakePaid:28,cashback:1.40,status:'paid'},{month:'Jan 2026',rakePaid:15,cashback:0.75,status:'paid'}],tiers:[{name:'Bronze',minRake:0,rate:0.05,color:'#92400E'},{name:'Silver',minRake:100,rate:0.07,color:'#6B7280'},{name:'Gold',minRake:300,rate:0.10,color:'#B45309'},{name:'Platinum',minRake:750,rate:0.15,color:'#1D4ED8'}]});
  const haptic={light:()=>{try{window.navigator.vibrate&&window.navigator.vibrate(10);}catch(e){}},medium:()=>{try{window.navigator.vibrate&&window.navigator.vibrate(20);}catch(e){}},success:()=>{try{window.navigator.vibrate&&window.navigator.vibrate([10,50,10]);}catch(e){}},tick:()=>{try{window.navigator.vibrate&&window.navigator.vibrate(5);}catch(e){}},};
  const unreadCount=notifications.filter(n=>!n.read).length;
  const markAllRead=()=>setNotifications(prev=>prev.map(n=>({...n,read:true})));
  const [liveCommentary]=useState([
    {id:1,time:'2:34',type:'pick_correct',player:'C. Alcaraz',round:'QF',pts:8,msg:'Your pick Alcaraz is winning the 3rd set 5-4!'},
    {id:2,time:'1:52',type:'pick_correct',player:'J. Sinner',round:'QF',pts:8,msg:'Sinner just won in straight sets - bracket point confirmed!'},
    {id:3,time:'0:45',type:'pick_wrong',player:'T. Fritz',round:'QF',pts:0,msg:'Zverev broke Fritz in the 1st set - looking tough for your bracket.'},
    {id:4,time:'0:12',type:'bh_alive',player:'D. Medvedev',round:'QF',pts:12,msg:'Your Black Horse Medvedev just made it to the QF! 1.5x multiplier active!'},
  ]);
  const getPickPopularity=(n,mid)=>{const s=(n.charCodeAt(0)+(mid?.length||5))%40;return 50+s;};
  const accuracyStats={overall:67,byRound:{R128:74,R64:71,R32:65,R16:58,QF:52,SF:48,F:44},bySurface:{Hard:69,Clay:64,Grass:61},streak:3,totalCorrect:187,totalPicks:279};
  const triggerTicker=(bid,pn,pts,round)=>{setLiveTickerMsg({bid,playerName:pn,pts,round,ts:Date.now()});setTimeout(()=>setLiveTickerMsg(null),4000);};
  const triggerWinBanner=(player,pts)=>{setWinBanner({player,pts,ts:Date.now()});};
  const getEarlyBirdBonus=()=>{const h=(new Date('2026-04-05')-new Date())/36e5;return h>24?10:0;};
  const getDefaultBracketName=tid=>{const ex=myBrackets.filter(b=>b.tournament.id===tid);return ex.length===0?'My Bracket':`Bracket ${ex.length+1}`;};
  const getBracketCount=tid=>myBrackets.filter(b=>b.tournament.id===tid).length;
  const [userTx,setUserTx]=useState([
    {id:1,title:'Tournament Entry',desc:'Miami Open',amt:-15,date:'Today'},
    {id:2,title:'Winnings - 3rd Place',desc:'Indian Wells',amt:1250,date:'Mar 15'},
    {id:3,title:'Deposit',desc:'Visa ....4532',amt:200,date:'Mar 12'},
    {id:4,title:'Winnings - 1st Place',desc:'Dubai Championship',amt:4200,date:'Mar 8'},
  ]);
  const [isLoggedIn,setIsLoggedIn]=useState(false);
  const [showSplash,setShowSplash]=useState(true);
  const [showOnboarding,setShowOnboarding]=useState(false);
  const [onboardingStep,setOnboardingStep]=useState(0);
  React.useEffect(()=>{const t=setTimeout(()=>{setShowSplash(false);setShowOnboarding(true);},2200);return()=>clearTimeout(t);},[]);

  // Prize pool live animation  -  slow enough not to disrupt scrolling
  React.useEffect(()=>{
    const interval=setInterval(()=>{
      poolLiveRef.current = poolLiveRef.current + Math.floor(Math.random()*450)+50;
      setPoolLive(poolLiveRef.current);
    },8000);
    return()=>clearInterval(interval);
  },[]);

  // Win banner auto-dismiss after 4s
  React.useEffect(()=>{
    if(!winBanner)return;
    const t=setTimeout(()=>setWinBanner(null),4000);
    return()=>clearTimeout(t);
  },[winBanner]);
  const [achievements,setAchievements]=useState([
    {id:'first_bracket',title:'First Pick',desc:'Submit your first bracket',icon:'🎾',earned:true,earnedAt:'Mar 10'},
    {id:'black_horse',title:'Dark Horse',desc:'Pick a Black Horse correctly',icon:'🐴',earned:true,earnedAt:'Mar 12'},
    {id:'high_roller',title:'High Roller',desc:'Enter a $500+ buy-in',icon:'👑',earned:false,earnedAt:null},
    {id:'perfect_qf',title:'Perfect QF',desc:'Predict all QF matches correctly',icon:'🎯',earned:false,earnedAt:null},
    {id:'streak_5',title:'On Fire',desc:'Enter 5 tournaments in a row',icon:'🔥',earned:false,earnedAt:null},
    {id:'bh_winner',title:'BH Champion',desc:'Your Black Horse wins the title',icon:'🏆',earned:false,earnedAt:null},
    {id:'top_10',title:'Top 10',desc:'Finish in top 10 of any tournament',icon:'*',earned:false,earnedAt:null},
    {id:'millionaire',title:'Millionaire Pool',desc:'Enter a $1M GTD tournament',icon:'💰',earned:true,earnedAt:'Mar 15'},
  ]);
  const [dailyChallenges]=useState([
    {id:'dc1',title:'Upset Special',desc:'Pick at least 3 unseeded players to win their R1 match',reward:'+50 bonus pts',active:true,completed:false,expires:'23:41:00'},
    {id:'dc2',title:'All-Favorites',desc:'Pick the top seed to win every match in QF bracket',reward:'+30 bonus pts',active:true,completed:false,expires:'23:41:00'},
    {id:'dc3',title:'Surface Expert',desc:'Submit a bracket for a clay court tournament',reward:'+20 bonus pts',active:false,completed:true,expires:null},
  ]);
  const [lockTimers]=useState({1:{hours:0,minutes:0,seconds:0,locked:true},2:{hours:47,minutes:23,seconds:11,locked:false}});
  const [authEmail,setAuthEmail]=useState('');
  const [authPassword,setAuthPassword]=useState('');
  const [authName,setAuthName]=useState('');
  const [showPass,setShowPass]=useState(false);
  const user={name:'AceMaster',rank:132,win:67,earn:6875,brackets:27};
  const r128Matches=generateR128();
  const rounds=getRounds(activeTournament);
  const totalRounds=rounds.length;
  const getMatchesForRound=ri=>{const bs=getBracketSize(activeTournament);if(bs===128){if(ri===0)return r128Matches.map((m,i)=>({id:`r0-m${i}`,p1:m.p1,p2:m.p2}));return Array.from({length:rounds[ri].matches},(_,i)=>({id:`r${ri}-m${i}`,p1:predictions[`r${ri-1}-m${i*2}`]||null,p2:predictions[`r${ri-1}-m${i*2+1}`]||null}));}return Array.from({length:rounds[ri].matches},(_,i)=>({id:`r${ri}-m${i}`,p1:ri===0?atpPlayers[i*2]:predictions[`r${ri-1}-m${i*2}`]||null,p2:ri===0?atpPlayers[i*2+1]:predictions[`r${ri-1}-m${i*2+1}`]||null}));};
  const completedPicks=Object.keys(predictions).length;
  const totalPicks=rounds.reduce((s,r)=>s+r.matches,0);
  const progress=Math.round((completedPicks/totalPicks)*100);

  const Btn=({children,primary,full,disabled,onClick,style={}})=>(<button onClick={onClick} disabled={disabled} style={{display:'flex',alignItems:'center',justifyContent:'center',gap:8,padding:'12px 20px',borderRadius:8,fontSize:14,fontWeight:600,cursor:disabled?'not-allowed':'pointer',width:full?'100%':'auto',opacity:disabled?0.5:1,background:primary?C.accent:C.bgLight,color:primary?'#FFFFFF':C.navy,border:primary?'none':`1px solid ${C.border}`,...style}}>{children}</button>);
  const ModalWrap=({title,children,onClose,full})=>(<div style={{position:'fixed',inset:0,background:'rgba(0,0,0,0.6)',zIndex:1000,display:'flex',alignItems:full?'stretch':'flex-end',justifyContent:'center'}}><div style={{width:'100%',maxWidth:430,background:C.modalBg,borderRadius:full?0:'16px 16px 0 0',height:full?'100%':'auto',maxHeight:full?'100%':'92vh',display:'flex',flexDirection:'column',overscrollBehavior:'contain'}}><div style={{display:'flex',alignItems:'center',justifyContent:'space-between',padding:16,borderBottom:`1px solid ${C.border}`,flexShrink:0}}><h2 style={{fontSize:18,fontWeight:600,color:C.navy,margin:0}}>{title}</h2><button onClick={onClose} style={{width:32,height:32,borderRadius:16,background:C.bgLight,border:'none',display:'flex',alignItems:'center',justifyContent:'center',cursor:'pointer'}}><X size={18} color={C.textMuted}/></button></div><div style={{flex:1,overflow:'auto',overscrollBehavior:'contain',WebkitOverflowScrolling:'touch'}}>{children}</div></div></div>);
  const TabBar=({tabs,active,onChange,onGradient})=>(<div style={{display:'flex',background:onGradient?'transparent':C.card,borderBottom:`1px solid ${onGradient?'rgba(255,255,255,0.2)':C.border}`}}>{tabs.map(tab=>(<button key={tab.id} onClick={()=>onChange(tab.id)} style={{flex:1,padding:'14px 8px',background:'none',border:'none',cursor:'pointer',borderBottom:active===tab.id?`3px solid ${onGradient?'#fff':C.accentText}`:'3px solid transparent',marginBottom:-1}}><span style={{fontSize:14,fontWeight:active===tab.id?600:400,color:onGradient?(active===tab.id?'#fff':'rgba(255,255,255,0.6)'):(active===tab.id?C.navy:C.textMuted)}}>{tab.label}</span></button>))}</div>);

  const AppHeader=({title,showBack})=>(
    <div style={{position:'sticky',top:0,zIndex:100,background:C.headerBg,paddingLeft:16,paddingRight:16,paddingTop:4,paddingBottom:4}}>
      <div style={{display:'flex',alignItems:'center',justifyContent:'space-between',height:34}}>

        {/* LEFT: logo+wordmark or back */}
        {showBack
          ? <button onClick={()=>setView('calendar')} style={{background:'none',border:'none',cursor:'pointer',display:'flex',alignItems:'center',gap:6,padding:0,height:40}}>
              <ChevronLeft size={22} color="#fff"/>
              <span style={{fontSize:16,fontWeight:600,color:'#fff'}}>{title||'Back'}</span>
            </button>
          : <button onClick={()=>setView('bracket')} style={{background:'none',border:'none',cursor:'pointer',padding:0,display:'flex',alignItems:'center',gap:9,height:40}}>
              <MobaLogo size={22} color="#fff"/>
              <MobaWordmark color="#fff" fontSize={18}/>
            </button>
        }

        {/* RIGHT: icons  -  all same size, same baseline */}
        <div style={{display:'flex',alignItems:'center',gap:2}}>

          {/* Search  -  always */}
          <button onClick={()=>setModal('help')} style={{background:'none',border:'none',cursor:'pointer',width:40,height:40,display:'flex',alignItems:'center',justifyContent:'center'}}>
            <Search size={22} color="#fff"/>
          </button>

          {/* Logged OUT */}
          {!isLoggedIn&&!showBack&&(
            <div style={{display:'flex',flexDirection:'column',alignItems:'center',justifyContent:'center',width:44,height:40,cursor:'pointer'}} onClick={()=>setModal('auth')}>
              <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="#fff" strokeWidth="1.7"><circle cx="12" cy="8" r="4"/><path d="M4 20c0-4 3.6-7 8-7s8 3 8 7"/></svg>
              <span style={{fontSize:9,fontWeight:600,color:'rgba(255,255,255,0.85)',marginTop:1,letterSpacing:0.1}}>Zaloguj</span>
            </div>
          )}

          {/* Logged IN */}
          {isLoggedIn&&!showBack&&(<>
            {/* Bell */}
            <button onClick={()=>setModal('notifications')} style={{background:'none',border:'none',cursor:'pointer',width:40,height:40,display:'flex',alignItems:'center',justifyContent:'center',position:'relative'}}>
              <Bell size={22} color="#fff"/>
              {unreadCount>0&&<div style={{position:'absolute',top:8,right:8,width:7,height:7,borderRadius:4,background:'#EF4444',border:'1.5px solid #3730A3'}}/>}
            </button>
            {/* Avatar + balance */}
            <div style={{display:'flex',flexDirection:'column',alignItems:'center',justifyContent:'center',width:48,height:40,cursor:'pointer'}} onClick={()=>setModal('profile')}>
              <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="#fff" strokeWidth="1.7"><circle cx="12" cy="8" r="4"/><path d="M4 20c0-4 3.6-7 8-7s8 3 8 7"/></svg>
              <span style={{fontSize:9,fontWeight:700,color:'rgba(255,255,255,0.9)',marginTop:1,letterSpacing:0.1}}>${balance.toLocaleString('en-US')}</span>
            </div>
          </>)}
        </div>
      </div>
    </div>
  );
  const BottomNav=()=>{const items=[{id:'bracket',label:'Home',isLogo:true},{id:'calendar',icon:Calendar,label:'Calendar'},{id:'live',icon:Radio,label:'Live'},{id:'rankings',icon:BarChart2,label:'Rankings'},{id:'wallet',icon:Wallet,label:'Wallet'}];const iA=isDark?'#FFFFFF':C.accent,iI=isDark?'#636366':'#8E8E93';return(<nav style={{position:'fixed',bottom:0,left:0,right:0,background:C.card,maxWidth:430,margin:'0 auto',paddingBottom:24,paddingTop:10,borderTop:`1px solid ${C.border}`}}><div style={{display:'flex',justifyContent:'space-around',alignItems:'center'}}>{items.map(item=>{const active=view===item.id;return(<button key={item.id} onClick={()=>{haptic.light();setView(item.id);}} style={{display:'flex',flexDirection:'column',alignItems:'center',gap:4,padding:'0 8px',background:'none',border:'none',cursor:'pointer',minWidth:56}}>{item.isLogo?<MobaLogo size={18} color={active?iA:iI}/>:<item.icon size={20} color={active?iA:iI} strokeWidth={active?2:1.5}/>}<span style={{fontSize:10,fontWeight:active?600:400,color:active?iA:iI,marginTop:2}}>{item.label}</span></button>);})}</div></nav>);};

  const PlayerHistoryBadge=({playerName,surface})=>{const data=getHistoricalAnalysis(playerName,surface||activeTournament?.surface||'Hard');if(!data)return null;const color=data.surfaceWinRate>=75?C.green:data.surfaceWinRate>=60?C.orange:C.red;return(<div style={{display:'flex',alignItems:'center',gap:6,marginTop:3}}><span style={{fontSize:10,fontWeight:600,color,background:`${color}15`,padding:'1px 5px',borderRadius:4}}>{data.surfaceWinRate}% {surface||'Hard'}</span><div style={{display:'flex',gap:2}}>{data.recentForm.map((r,i)=><div key={i} style={{width:6,height:6,borderRadius:3,background:r==='W'?C.green:C.red}}/>)}</div>{data.titles>0&&<span style={{fontSize:10,color:C.orange}}>🏆{data.titles}</span>}</div>);};
  const LockTimerBadge=({tournament})=>{const timer=lockTimers[tournament.id];if(!timer)return null;if(timer.locked)return(<div style={{display:'flex',alignItems:'center',gap:4,padding:'4px 8px',borderRadius:6,background:C.redLight,border:`1px solid ${C.red}`}}><Lock size={10} color={C.red}/><span style={{fontSize:10,fontWeight:700,color:C.red}}>LOCKED</span></div>);const{hours,minutes,seconds}=timer,urgent=hours===0&&minutes<60;return(<div style={{display:'flex',alignItems:'center',gap:4,padding:'4px 8px',borderRadius:6,background:urgent?C.redLight:`${C.accent}12`,border:`1px solid ${urgent?C.red:C.accent}`}}><span style={{fontSize:11,fontWeight:700,color:urgent?C.red:C.accentText,fontVariantNumeric:'tabular-nums'}}>{hours>0?`${hours}h `:''}{String(minutes).padStart(2,'0')}:{String(seconds).padStart(2,'0')}</span></div>);};
  const LiveRankingCard=({bracket})=>{const total=bracket.tournament.entries||2156,pos=bracket.position||127,prev=bracket.prevPosition||142,change=prev-pos,inPrize=pos<=Math.floor(total*0.15);return(<div style={{background:`${C.accent}12`,border:`1px solid ${C.accent}40`,borderRadius:12,padding:14,marginTop:12}}><div style={{display:'flex',alignItems:'center',justifyContent:'space-between',marginBottom:12}}><div style={{display:'flex',alignItems:'center',gap:6}}><div style={{width:7,height:7,borderRadius:4,background:C.red}}/><span style={{fontSize:11,fontWeight:700,color:C.accentText,letterSpacing:0.5}}>LIVE RANKING</span></div><button onClick={()=>setLeaderboardBracket(bracket)} style={{display:'flex',alignItems:'center',gap:4,padding:'5px 10px',borderRadius:6,background:C.accent,border:'none',cursor:'pointer'}}><BarChart2 size={12} color="#fff"/><span style={{fontSize:11,fontWeight:600,color:'#fff'}}>Leaderboard</span></button></div><div style={{display:'grid',gridTemplateColumns:'repeat(3,1fr)',gap:8,marginBottom:10}}>{[{label:'Position',val:`${pos}`,sub:`/${total.toLocaleString('en-US')}`,extra:change!==0&&<span style={{fontSize:10,fontWeight:600,color:change>0?C.green:C.red,display:'flex',alignItems:'center',gap:1}}>{change>0?<ArrowUp size={10}/>:<ArrowDown size={10}/>}{Math.abs(change)}</span>},{label:'Points',val:`${bracket.points}`,sub:'pts',valColor:C.accentText},{label:'Correct',val:`${bracket.correctPicks}`,sub:`/${bracket.totalPicks}`,valColor:C.green}].map(({label,val,sub,extra,valColor})=>(<div key={label} style={{background:C.card,borderRadius:8,padding:'10px 8px',textAlign:'center'}}>{extra?<div style={{display:'flex',justifyContent:'center',marginBottom:2}}>{extra}</div>:<div style={{height:17,marginBottom:2}}/>}<p style={{fontSize:15,fontWeight:700,color:valColor||C.navy,margin:0,lineHeight:1}}>{val}<span style={{fontSize:10,fontWeight:400,color:C.textMuted}}>{sub}</span></p><p style={{fontSize:9,color:C.textMuted,margin:'3px 0 0',textTransform:'uppercase',letterSpacing:0.3}}>{label}</p></div>))}</div><div style={{display:'flex',gap:6,flexWrap:'wrap'}}>{bracket.blackHorse&&<div style={{display:'flex',alignItems:'center',gap:4,padding:'4px 8px',borderRadius:6,background:bracket.blackHorseAlive?`${C.orange}18`:C.bgLight,border:`1px solid ${bracket.blackHorseAlive?C.orange:C.border}`}}><Shield size={10} color={C.orange}/><span style={{fontSize:10,fontWeight:600,color:bracket.blackHorseAlive?C.orange:C.textMuted}}>{bracket.blackHorse.name} {bracket.blackHorseAlive?'Still in!':'* Eliminated'}</span></div>}<div style={{display:'flex',alignItems:'center',gap:4,padding:'4px 8px',borderRadius:6,background:inPrize?C.greenLight:C.bgLight,border:`1px solid ${inPrize?C.green:C.border}`}}><Trophy size={10} color={inPrize?C.green:C.textMuted}/><span style={{fontSize:10,fontWeight:600,color:inPrize?C.green:C.textMuted}}>{inPrize?'In Prize Zone':`Top 15% at #${Math.floor(total*0.15)}`}</span></div></div></div>);};

  const BracketView=()=>{
    const prizePool=calcPrizePool(activeTournament.entries||1,activeTournament.poolEntry||activeTournament.entry);
    const currentMatches=getMatchesForRound(bracketRound);
    return(<div style={{background:C.card,minHeight:'100vh'}}>
      <AppHeader/>
      <div style={{padding:'12px 16px'}}><div style={{background:C.card,borderRadius:12,border:`1px solid ${C.border}`,overflow:'hidden'}}>
        <div style={{display:'flex',alignItems:'center',padding:'12px 14px',borderBottom:`1px solid ${C.border}`}}><div style={{flex:1}}>
          <div style={{display:'flex',alignItems:'center',gap:8}}><span style={{fontSize:10,fontWeight:600,color:C.accentText,background:`${C.accent}18`,padding:'2px 6px',borderRadius:4}}>{activeTournament.type.toUpperCase().replace('ATP','ATP ')}</span><span style={{fontSize:10,fontWeight:600,color:activeTournament.status==='live'?C.red:C.green,background:activeTournament.status==='live'?C.redLight:C.greenLight,padding:'2px 6px',borderRadius:4}}>{activeTournament.status.toUpperCase()}</span></div>
          <h3 style={{fontSize:17,fontWeight:700,color:C.navy,margin:'6px 0 2px'}}>{activeTournament.name}</h3>
          <p style={{fontSize:11,color:C.textMuted,margin:0}}>{activeTournament.dates} {activeTournament.dateSuffix} . {activeTournament.surface}</p>
        </div></div>
        <div style={{padding:'10px 14px',background:C.bgLight}}>
          {/* Stats row */}
          <div style={{display:'flex',marginBottom:10}}>{[['Entry',`$${activeTournament.entry}`,C.navy],['Entries',activeTournament.entries.toLocaleString('en-US'),C.navy],['Paid places',Math.floor(activeTournament.entries*0.15).toLocaleString('en-US'),C.green]].map(([lbl,val,col],i)=>(<div key={lbl} style={{flex:1,textAlign:'center',borderRight:i<2?`1px solid ${C.border}`:'none'}}><p style={{fontSize:10,color:C.textMuted,margin:0}}>{lbl}</p><p style={{fontSize:14,fontWeight:700,color:col,margin:'2px 0 0'}}>{val}</p></div>))}</div>
          {/* Live pool bar */}
          <div style={{background:C.card,borderRadius:10,padding:'10px 12px',border:`1px solid ${C.border}`}}>
            <div style={{display:'flex',justifyContent:'space-between',alignItems:'center',marginBottom:6}}>
              <div style={{display:'flex',alignItems:'center',gap:5}}>
                <div style={{width:6,height:6,borderRadius:3,background:C.green,animation:'pulse 1.5s ease infinite'}}/>
                <span style={{fontSize:11,fontWeight:700,color:C.textMuted,letterSpacing:0.3}}>LIVE POOL</span>
              </div>
              <span style={{fontSize:15,fontWeight:800,color:C.green,fontVariantNumeric:'tabular-nums'}}>${poolLive.toLocaleString('en-US')}</span>
            </div>
            <div style={{height:5,background:C.bgLight,borderRadius:3,overflow:'hidden'}}>
              <div style={{height:'100%',width:`${Math.min(100,(poolLive/1000000)*100)}%`,background:`linear-gradient(90deg,#059669,#34D399)`,borderRadius:3,transition:'width 1.2s ease'}}/>
            </div>
            <div style={{display:'flex',justifyContent:'space-between',marginTop:4}}>
              <span style={{fontSize:10,color:C.textMuted}}>Growing in real-time</span>
              <span style={{fontSize:10,fontWeight:600,color:C.green}}>{Math.min(100,(poolLive/1000000)*100).toFixed(1)}% of $1M GTD</span>
            </div>
          </div>
        </div>
        <button onClick={()=>setModal('prizes')} style={{width:'100%',padding:'10px 14px',background:C.card,border:'none',borderTop:`1px solid ${C.border}`,cursor:'pointer',display:'flex',alignItems:'center',justifyContent:'center',gap:6}}><Trophy size={14} color={C.orange}/><span style={{fontSize:12,fontWeight:600,color:C.accentText}}>View Prize Payouts</span><ChevronRight size={14} color={C.textMuted}/></button>
      </div></div>
      {dailyChallenges.some(c=>c.active&&!c.completed)&&<button onClick={()=>setModal('challenges')} style={{width:'100%',background:`${C.accent}10`,borderTop:`1px solid ${C.accent}30`,borderBottom:`1px solid ${C.accent}30`,border:'none',padding:'10px 16px',cursor:'pointer',display:'flex',alignItems:'center',justifyContent:'space-between'}}><div style={{display:'flex',alignItems:'center',gap:8}}><Target size={16} color={C.accentText}/><span style={{fontSize:13,fontWeight:600,color:C.accentText}}>{dailyChallenges.filter(c=>c.active&&!c.completed).length} Daily Challenge{dailyChallenges.filter(c=>c.active&&!c.completed).length>1?'s':''} available</span></div><span style={{fontSize:12,color:C.accentText}}>View ></span></button>}
      <div style={{background:C.card,padding:'12px 16px',borderBottom:`1px solid ${C.border}`}}>
        <div style={{display:'flex',justifyContent:'space-between',alignItems:'center',marginBottom:6}}><span style={{fontSize:12,fontWeight:500,color:C.navy}}>Bracket Progress</span><span style={{fontSize:12,fontWeight:600,color:C.accentText}}>{progress}%</span></div>
        <div style={{height:5,background:C.bgLight,borderRadius:3}}><div style={{height:'100%',width:`${progress}%`,background:C.accent,borderRadius:3,transition:'width 0.3s'}}/></div>
        <div style={{display:'flex',alignItems:'center',justifyContent:'space-between',marginTop:8}}><p style={{fontSize:10,color:C.textMuted,margin:0}}>{completedPicks} of {totalPicks} picks made</p><button onClick={()=>{setAiSuggestion(null);setAiLoading(false);setModal('aibuilder');}} style={{display:'flex',alignItems:'center',gap:5,background:`${C.accent}12`,border:`1px solid ${C.accent}30`,borderRadius:6,padding:'4px 10px',cursor:'pointer'}}><Bot size={13} color={C.accentText}/><span style={{fontSize:11,fontWeight:600,color:C.accentText}}>AI Strategy</span></button></div>
      </div>
      <div style={{background:C.card,padding:16,borderBottom:`1px solid ${C.border}`}}>
        <div style={{display:'flex',justifyContent:'space-between',alignItems:'center'}}>
          <div><div style={{display:'flex',alignItems:'center',gap:8,marginBottom:4}}><div style={{display:'flex',alignItems:'center',gap:6}}><Shield size={14} color={C.orange}/><span style={{fontSize:14,fontWeight:600,color:C.navy}}>Black Horse</span></div><span style={{fontSize:10,fontWeight:600,color:C.orange,background:`${C.orange}18`,padding:'2px 6px',borderRadius:4}}>1.5x POINTS</span></div><p style={{fontSize:12,color:C.textMuted,margin:0}}>Pick a player for bonus points</p></div>
          <button onClick={()=>setModal('blackhorse')} style={{padding:'10px 16px',borderRadius:8,border:blackHorse?`2px solid ${C.orange}`:`1px solid ${C.border}`,background:blackHorse?`${C.orange}12`:C.card,cursor:'pointer',display:'flex',alignItems:'center',gap:8}}>{blackHorse?<><span style={{fontSize:18}}>{blackHorse.flag}</span><span style={{fontSize:13,fontWeight:600,color:C.navy}}>{blackHorse.name}</span></>:<span style={{fontSize:13,color:C.textMuted}}>Select</span>}</button>
        </div>
      </div>
      <div style={{display:'flex',background:C.card,borderBottom:`1px solid ${C.border}`}}>{['picks','draws'].map(tab=>(<button key={tab} onClick={()=>setBracketTab(tab)} style={{flex:1,padding:'14px',background:'none',border:'none',cursor:'pointer',borderBottom:bracketTab===tab?`3px solid ${C.accentText}`:'3px solid transparent',marginBottom:-1}}><span style={{fontSize:14,fontWeight:bracketTab===tab?600:400,color:bracketTab===tab?C.navy:C.textMuted}}>{tab==='picks'?'My Picks':'Live Draw'}</span></button>))}</div>
      {bracketTab==='picks'?(<>
        <div style={{background:C.card,padding:'8px 16px',borderBottom:`1px solid ${C.border}`,display:'flex',gap:8,overflowX:'auto'}}>{rounds.map((r,i)=>(<button key={r.name} onClick={()=>setBracketRound(i)} style={{padding:'10px 16px',borderRadius:8,fontSize:13,fontWeight:600,cursor:'pointer',whiteSpace:'nowrap',background:bracketRound===i?C.accent:C.bgLight,color:bracketRound===i?'#fff':C.textMid,border:'none'}}>{r.name} <span style={{opacity:0.7,marginLeft:4}}>+{r.pts}</span></button>))}</div>
        <div style={{padding:16,paddingBottom:16,background:C.card}}>
          <p style={{fontSize:12,fontWeight:600,color:C.textMuted,margin:'0 0 12px'}}>SELECT WINNER FOR EACH MATCH</p>
          {currentMatches.map((match,idx)=>(<div key={match.id} style={{background:C.card,borderRadius:12,marginBottom:12,border:`1px solid ${predictions[match.id]?C.accent:C.border}`,overflow:'hidden'}}>
            <div style={{padding:'8px 14px',background:C.bgLight,borderBottom:`1px solid ${C.border}`,display:'flex',justifyContent:'space-between',alignItems:'center'}}><span style={{fontSize:11,fontWeight:500,color:C.textMuted}}>Match {idx+1}</span>{predictions[match.id]&&<Check size={14} color={C.green}/>}</div>
            {[match.p1,match.p2].map((player,pi)=>(<button key={pi} onClick={()=>player&&setPredictions(prev=>({...prev,[match.id]:player}))} disabled={!player} style={{width:'100%',display:'flex',alignItems:'center',padding:'12px 14px',border:'none',cursor:player?'pointer':'default',background:predictions[match.id]?.id===player?.id?`${C.accent}14`:'transparent',borderBottom:pi===0?`1px solid ${C.border}`:'none'}}>
              {player?(<><span style={{fontSize:16,marginRight:8}}>{player.flag}</span><div style={{flex:1,textAlign:'left',minWidth:0}}><span style={{fontSize:14,fontWeight:500,color:C.navy,display:'block',overflow:'hidden',textOverflow:'ellipsis',whiteSpace:'nowrap'}}>{player.name}</span><span style={{fontSize:10,color:C.textMuted}}>{getPickPopularity(player.name,match.id)}% picked</span><PlayerHistoryBadge playerName={player.name} surface={activeTournament?.surface}/></div>{player.seed&&<span style={{fontSize:11,color:C.textMuted,marginLeft:6,flexShrink:0}}>[{player.seed}]</span>}{predictions[match.id]?.id===player?.id&&<Check size={18} color={C.accentText} style={{marginLeft:8,flexShrink:0}}/>}</>):<span style={{fontSize:13,color:C.textMuted,fontStyle:'italic'}}>Winner of previous round</span>}
            </button>))}
          </div>))}
        </div>
        <div style={{position:'fixed',bottom:0,left:0,right:0,maxWidth:430,margin:'0 auto',padding:'12px 16px',paddingBottom:'calc(12px + 68px)',background:C.card,borderTop:`1px solid ${C.border}`,boxShadow:'0 -4px 12px rgba(0,0,0,0.08)'}}><div style={{display:'flex',gap:12}}>{bracketRound>0&&<Btn onClick={()=>setBracketRound(bracketRound-1)} style={{flex:1}}><ChevronLeft size={18}/> Previous</Btn>}{bracketRound<totalRounds-1?<Btn primary onClick={()=>{haptic.medium();setBracketRound(bracketRound+1);}} style={{flex:bracketRound>0?2:1}}>Next Round <ChevronRight size={18}/></Btn>:<Btn primary disabled={progress<100} onClick={()=>{setSubmitStep(1);setModal('submit');}} style={{flex:2}}><Check size={18}/> Submit (${activeTournament.entry})</Btn>}</div></div>
      </>):(<div style={{padding:16,paddingBottom:100}}>
        <div style={{display:'flex',gap:8,overflowX:'auto',marginBottom:16}}>{rounds.map((r,i)=>(<button key={r.name} onClick={()=>setDrawRound(i)} style={{padding:'8px 14px',borderRadius:6,fontSize:12,fontWeight:600,cursor:'pointer',whiteSpace:'nowrap',background:drawRound===i?C.navy:C.card,color:drawRound===i?'#fff':C.textMid,border:`1px solid ${drawRound===i?C.navy:C.border}`}}>{r.name}</button>))}</div>
        {getMatchesForRound(drawRound).map((match,idx)=>(<div key={match.id} style={{background:C.card,borderRadius:10,marginBottom:8,border:`1px solid ${C.border}`,overflow:'hidden'}}><div style={{padding:'6px 12px',background:C.bgLight,borderBottom:`1px solid ${C.border}`,display:'flex',justifyContent:'space-between'}}><span style={{fontSize:10,fontWeight:500,color:C.textMuted}}>Match {idx+1}</span>{drawRound===0&&idx<3&&<span style={{fontSize:9,fontWeight:600,color:C.green,background:C.greenLight,padding:'2px 6px',borderRadius:4}}>COMPLETED</span>}{drawRound===0&&idx===3&&<span style={{fontSize:9,fontWeight:600,color:C.red,background:C.redLight,padding:'2px 6px',borderRadius:4}}>LIVE</span>}</div>{[match.p1,match.p2].map((player,pi)=>(<div key={pi} style={{display:'flex',alignItems:'center',padding:'10px 12px',borderBottom:pi===0?`1px solid ${C.border}`:'none'}}>{player?<><span style={{fontSize:14,marginRight:8}}>{player.flag}</span><span style={{flex:1,fontSize:13,fontWeight:500,color:C.navy}}>{player.name}</span>{player.seed&&<span style={{fontSize:10,color:C.textMuted,marginRight:8}}>[{player.seed}]</span>}{drawRound===0&&idx<4&&<span style={{fontSize:12,fontWeight:pi===0?600:400,color:pi===0?C.navy:C.textMuted}}>{pi===0?'6 6':'3 4'}</span>}</>:<span style={{fontSize:12,color:C.textMuted,fontStyle:'italic'}}>TBD</span>}</div>))}</div>))}
      </div>)}
      <div style={{background:C.card,borderTop:`1px solid ${C.border}`,marginTop:8}}>
        <div style={{padding:'24px 16px',borderBottom:`1px solid ${C.border}`}}><p style={{fontSize:10,fontWeight:700,color:C.textMuted,textAlign:'center',margin:'0 0 16px',letterSpacing:1}}>PAYMENT METHODS</p><div style={{display:'flex',flexWrap:'wrap',gap:8,justifyContent:'center'}}>{['Visa','Mastercard','PayPal','Apple Pay','Skrill','Neteller','Bank Transfer','Crypto'].map(m=>(<span key={m} style={{fontSize:11,fontWeight:600,color:C.textMid,background:C.bgLight,border:`1px solid ${C.border}`,borderRadius:6,padding:'4px 10px'}}>{m}</span>))}</div></div>
        <div style={{padding:'20px 16px',borderBottom:`1px solid ${C.border}`}}><p style={{fontSize:10,fontWeight:700,color:C.textMuted,margin:'0 0 14px',letterSpacing:1}}>INFORMATION</p><div style={{display:'flex',flexDirection:'column',gap:10}}>{[{id:'privacy',label:'Privacy Policy'},{id:'terms',label:'Terms & Conditions'},{id:'rules',label:'Player Profile Rules'},{id:'responsible',label:'Responsible Gaming'},{id:'aml',label:'Anti-Money Laundering Policy'},{id:'cookies',label:'Cookie Policy'},{id:'dispute',label:'Dispute Resolution'}].map(l=>(<button key={l.id} onClick={()=>{setLegalPage(l.id);setModal('legal');}} style={{background:'none',border:'none',cursor:'pointer',textAlign:'left',padding:0,display:'flex',alignItems:'center',justifyContent:'space-between',width:'100%'}}><span style={{fontSize:13,color:C.textMid}}>{l.label}</span><ChevronRight size={14} color={C.textMuted}/></button>))}</div></div>
        <div style={{padding:'20px 16px 40px'}}><div style={{display:'flex',alignItems:'center',gap:8,marginBottom:12}}><MobaLogo size={18} color={C.textMuted}/><MobaWordmark color={C.textMuted} fontSize={14}/></div><p style={{fontSize:11,color:C.textMuted,margin:'0 0 2px',lineHeight:1.5}}>mobaOne Sp. z o.o.</p><p style={{fontSize:11,color:C.textMuted,margin:'0 0 2px',lineHeight:1.5}}>ul. Roosevelta 18, 60-829 Poznan, Poland</p><p style={{fontSize:11,color:C.textMuted,margin:'0 0 12px',lineHeight:1.5}}>KRS: 0000123456 | NIP: 7811234567</p><p style={{fontSize:11,color:C.textMuted,margin:'0 0 12px',lineHeight:1.5}}>mobaOne operates fantasy sports bracket contests. All prize pools are funded by entry fees. Players must be 18+.</p><p style={{fontSize:10,color:C.textLight,margin:0}}>(c) 2026 mobaOne Sp. z o.o. All rights reserved.</p></div>
      </div>
      <div style={{height:100}}/>
    </div>);
  };

  const LiveView=()=>(<div style={{background:C.card,minHeight:'100vh'}}><AppHeader title="Live Scores" showBack/><button onClick={()=>setModal('globalfeed')} style={{width:'100%',background:`${C.accent}10`,border:'none',borderBottom:`1px solid ${C.accent}30`,padding:'10px 16px',cursor:'pointer',display:'flex',alignItems:'center',justifyContent:'space-between'}}><div style={{display:'flex',alignItems:'center',gap:8}}><div style={{width:7,height:7,borderRadius:4,background:C.red}}/><span style={{fontSize:13,fontWeight:600,color:C.accentText}}>Global Feed - live player activity</span></div><span style={{fontSize:12,color:C.accentText}}>View ></span></button><TabBar tabs={[{id:'live',label:'Live'},{id:'completed',label:'Completed'},{id:'upcoming',label:'Upcoming'}]} active={liveTab} onChange={setLiveTab}/><div style={{padding:16,background:C.card,minHeight:'60vh'}}>{liveTab==='live'&&liveMatches.map(m=>(<div key={m.id} style={{background:C.card,borderRadius:12,marginBottom:12,border:`1px solid ${C.border}`,overflow:'hidden'}}><div style={{padding:'12px 16px',background:C.bgLight,borderBottom:`1px solid ${C.border}`,display:'flex',justifyContent:'space-between',alignItems:'center'}}><div><span style={{fontSize:13,fontWeight:600,color:C.navy}}>{m.tournament}</span><span style={{fontSize:12,color:C.textMuted,marginLeft:8}}>{m.round}</span></div><div style={{display:'flex',alignItems:'center',gap:8}}><span style={{width:8,height:8,borderRadius:4,background:C.red,display:'block'}}/><span style={{fontSize:13,fontWeight:600,color:C.red}}>{m.time}</span></div></div><div style={{padding:16}}>{[m.p1,m.p2].map((p,pi)=>(<div key={pi} style={{display:'flex',alignItems:'center',marginBottom:pi===0?12:0}}><span style={{fontSize:20,marginRight:10}}>{p.flag}</span><div style={{flex:1}}><span style={{fontSize:15,fontWeight:pi===0?600:400,color:pi===0?C.navy:C.textMid}}>{p.name}</span><span style={{fontSize:12,color:C.textMuted,marginLeft:6}}>[{p.seed}]</span></div>{p.serving&&<div style={{width:8,height:8,borderRadius:4,background:C.green,marginRight:12}}/>}<div style={{display:'flex',gap:12}}>{p.sets.map((s,i)=><span key={i} style={{fontSize:18,fontWeight:pi===0?600:400,color:pi===0?C.navy:C.textMid,minWidth:20,textAlign:'center'}}>{s}</span>)}</div></div>))}</div><div style={{padding:'12px 16px',background:C.bgLight,borderTop:`1px solid ${C.border}`,display:'flex',justifyContent:'space-around'}}>{[['Aces',m.stats.aces],['Winners',m.stats.winners],['Errors',m.stats.errors]].map(([lbl,v])=>(<div key={lbl} style={{textAlign:'center'}}><p style={{fontSize:11,color:C.textMuted,margin:0}}>{lbl}</p><p style={{fontSize:13,fontWeight:600,color:C.navy,margin:'2px 0 0'}}>{v[0]} - {v[1]}</p></div>))}</div></div>))}{liveTab==='completed'&&completedMatches.map(m=>(<div key={m.id} style={{background:C.card,borderRadius:12,marginBottom:12,border:`1px solid ${C.border}`,padding:16}}><div style={{display:'flex',justifyContent:'space-between',marginBottom:12}}><span style={{fontSize:13,color:C.textMuted}}>{m.tournament} . {m.round}</span><span style={{fontSize:12,color:C.textMuted}}>{m.duration}</span></div>{[m.p1,m.p2].map((p,pi)=>(<div key={pi} style={{display:'flex',alignItems:'center',marginBottom:pi===0?10:0}}><span style={{fontSize:18,marginRight:10}}>{p.flag}</span><span style={{flex:1,fontSize:15,fontWeight:p.winner?600:400,color:p.winner?C.navy:C.textMid}}>{p.name}</span>{p.winner&&<Check size={18} color={C.green} style={{marginRight:12}}/>}<div style={{display:'flex',gap:10}}>{p.sets.map((s,i)=><span key={i} style={{fontSize:16,fontWeight:p.winner?600:400,color:p.winner?C.navy:C.textMid}}>{s}</span>)}</div></div>))}</div>))}{liveTab==='upcoming'&&upcomingMatches.map(m=>(<div key={m.id} style={{background:C.card,borderRadius:12,marginBottom:12,border:`1px solid ${C.border}`,padding:16}}><div style={{display:'flex',justifyContent:'space-between',marginBottom:12}}><span style={{fontSize:13,color:C.textMuted}}>{m.tournament} . {m.round}</span><span style={{fontSize:14,fontWeight:600,color:C.accentText}}>{m.time}</span></div>{[m.p1,m.p2].map((p,pi)=>(<div key={pi} style={{display:'flex',alignItems:'center',marginBottom:pi===0?10:0}}><span style={{fontSize:18,marginRight:10}}>{p.flag}</span><span style={{flex:1,fontSize:15,fontWeight:500,color:C.navy}}>{p.name}</span><span style={{fontSize:12,color:C.textMuted}}>[{p.seed}]</span></div>))}<p style={{fontSize:12,color:C.textMuted,marginTop:12}}>{m.court}</p></div>))}</div></div>);

  const CalendarView=()=>{const months=[...new Set(tournaments.map(t=>t.month))];return(<div style={{background:C.card,minHeight:'100vh'}}><AppHeader/><div style={{background:C.headerBg,padding:'0 16px 16px'}}><TabBar tabs={[{id:'all',label:'ATP Tour'},{id:'my',label:`My Brackets${myBrackets.length>0?` (${myBrackets.length})`:''}`}]} active={calendarTab} onChange={setCalendarTab} onGradient/></div>
    {calendarTab==='my'&&(<div style={{padding:16,paddingBottom:100,background:C.card,minHeight:'60vh'}}>{h2hOpponent&&<div style={{background:C.headerBg,borderRadius:12,padding:16,marginBottom:16}}><div style={{display:'flex',alignItems:'center',gap:10}}><span style={{fontSize:24}}>vs</span><div style={{flex:1}}><p style={{fontSize:14,fontWeight:700,color:'#fff',margin:0}}>H2H Challenge Active!</p><p style={{fontSize:12,color:'rgba(255,255,255,0.7)',margin:'2px 0 0'}}>vs {h2hOpponent.name}</p></div><button onClick={()=>setH2hOpponent(null)} style={{background:'rgba(255,255,255,0.15)',border:'none',borderRadius:8,padding:'6px 10px',cursor:'pointer'}}><span style={{fontSize:12,color:'#fff'}}>Cancel</span></button></div></div>}{myBrackets.length===0?(<div style={{background:C.card,borderRadius:12,padding:32,textAlign:'center',border:`1px solid ${C.border}`}}><div style={{width:64,height:64,borderRadius:32,background:C.accentLight,display:'flex',alignItems:'center',justifyContent:'center',margin:'0 auto 16px'}}><Target size={28} color={C.accent}/></div><h3 style={{fontSize:18,fontWeight:600,color:C.navy,margin:'0 0 8px'}}>No Brackets Yet</h3><p style={{fontSize:14,color:C.textMuted,margin:'0 0 20px'}}>Enter a tournament to create your first bracket!</p><Btn primary onClick={()=>setCalendarTab('all')}>Browse Tournaments</Btn></div>):myBrackets.map(bracket=>(<div key={bracket.id} style={{background:C.card,borderRadius:12,marginBottom:16,border:`1px solid ${C.border}`,overflow:'hidden'}}><div style={{padding:16,borderBottom:`1px solid ${C.border}`}}><div style={{display:'flex',justifyContent:'space-between',alignItems:'start',marginBottom:8}}><div><span style={{fontSize:11,fontWeight:600,color:C.textMuted}}>{bracket.tournament.type.toUpperCase()}</span><h3 style={{fontSize:17,fontWeight:600,color:C.navy,margin:'2px 0'}}>{bracket.tournament.name}</h3>{bracket.name&&bracket.name!=='My Bracket'&&<p style={{fontSize:12,color:C.accentText,margin:'2px 0 0',fontStyle:'italic'}}>"{bracket.name}"</p>}<p style={{fontSize:12,color:C.textMuted,margin:0}}>{bracket.tournament.dates} {bracket.tournament.dateSuffix}</p></div><span style={{fontSize:10,fontWeight:600,padding:'4px 10px',borderRadius:4,background:bracket.status==='active'?C.greenLight:C.bgLight,color:bracket.status==='active'?C.green:C.textMuted}}>{bracket.status==='active'?'ACTIVE':bracket.status.toUpperCase()}</span></div></div><div style={{padding:16,background:C.bgLight}}><div style={{display:'flex',gap:16}}><div style={{flex:1}}><p style={{fontSize:10,color:C.textMuted,margin:'0 0 6px'}}>CHAMPION</p><div style={{display:'flex',alignItems:'center',gap:8}}><span style={{fontSize:24}}>{bracket.champion?.flag}</span><div><p style={{fontSize:14,fontWeight:600,color:C.navy,margin:0}}>{bracket.champion?.name}</p><p style={{fontSize:11,color:C.textMuted,margin:0}}>[{bracket.champion?.seed}]</p></div></div></div>{bracket.blackHorse&&<div style={{flex:1}}><div style={{display:'flex',alignItems:'center',gap:4,marginBottom:6}}><Shield size={10} color={C.orange}/><p style={{fontSize:10,color:C.orange,margin:0}}>BLACK HORSE</p></div><div style={{display:'flex',alignItems:'center',gap:8}}><span style={{fontSize:24}}>{bracket.blackHorse.flag}</span><div><p style={{fontSize:14,fontWeight:600,color:C.navy,margin:0}}>{bracket.blackHorse.name}</p><p style={{fontSize:11,color:C.orange,margin:0}}>1.5x pts</p></div></div></div>}</div></div>{bracket.status==='active'&&bracket.tournament.status==='live'&&<div style={{padding:'0 16px 16px'}}><LiveRankingCard bracket={bracket}/><button onClick={()=>setModal('commentary')} style={{width:'100%',marginTop:8,padding:'8px 14px',borderRadius:8,background:`${C.red}10`,border:`1px solid ${C.red}30`,cursor:'pointer',display:'flex',alignItems:'center',gap:8}}><div style={{width:7,height:7,borderRadius:4,background:C.red}}/><span style={{fontSize:12,fontWeight:600,color:C.red}}>Live Commentary</span><span style={{fontSize:12,color:C.textMuted,marginLeft:'auto'}}>{liveCommentary.length} updates</span></button></div>}<div style={{padding:'12px 16px',display:'flex',gap:16,borderTop:`1px solid ${C.border}`}}>{[['Entry',`$${bracket.tournament.entry}`,C.navy],['Pool',`$${bracket.tournament.pool?.toLocaleString('en-US')}`,C.accent],['Points',bracket.points,C.green]].map(([l,v,col])=>(<div key={l}><p style={{fontSize:11,color:C.textMuted,margin:0}}>{l}</p><p style={{fontSize:14,fontWeight:600,color:col,margin:'2px 0 0'}}>{v}</p></div>))}<button onClick={()=>setModal('social')} style={{padding:'8px 12px',borderRadius:6,background:C.bgLight,border:`1px solid ${C.border}`,cursor:'pointer',display:'flex',alignItems:'center',gap:4}}>
                  <span style={{fontSize:14}}>💬</span>
                  <span style={{fontSize:12,fontWeight:600,color:C.textMid}}>{comments.length}</span>
                </button>
                <button onClick={()=>setSelectedBracket(bracket)} style={{marginLeft:4,padding:'8px 14px',borderRadius:6,background:C.accentLight,border:'none',cursor:'pointer'}}><span style={{fontSize:12,fontWeight:600,color:C.accentText}}>View</span></button></div></div>))}</div>)}
    {calendarTab==='all'&&(<><div style={{padding:16,background:C.card}}><div style={{display:'flex',alignItems:'center',gap:10,background:C.card,borderRadius:8,padding:'12px 16px',border:`1px solid ${C.border}`}}><Search size={18} color={C.textMuted}/><span style={{fontSize:14,color:C.textMuted}}>Search tournaments</span></div></div>{months.map(month=>(<div key={month}><div style={{background:C.sectionBg,padding:'10px 16px'}}><span style={{fontSize:15,fontWeight:600,color:C.navy}}>{month}</span></div><div style={{background:C.card}}>{tournaments.filter(t=>t.month===month).map(t=>{const entered=myBrackets.some(b=>b.tournament.id===t.id);return(<div key={t.id} style={{display:'flex',padding:16,borderBottom:`1px solid ${C.border}`}}><div style={{width:52,flexShrink:0,paddingRight:10,borderRight:`2px solid ${C.accent}`,marginRight:14}}><p style={{fontSize:12,fontWeight:600,color:C.textMid,margin:0,whiteSpace:'nowrap'}}>{t.dates}</p><p style={{fontSize:12,color:C.textMuted,margin:'2px 0 0',whiteSpace:'nowrap'}}>{t.dateSuffix}</p></div><div style={{flex:1}}><div style={{marginBottom:6}}>{t.type==='grandslam'?<span style={{fontStyle:'italic',fontWeight:800,fontSize:16,color:C.navy}}>GRAND SLAM</span>:<div style={{display:'flex',alignItems:'baseline'}}><span style={{fontStyle:'italic',fontWeight:800,fontSize:16,color:C.navy}}>ATP</span><span style={{fontWeight:800,fontSize:16,color:C.navy}}>{t.type.replace('atp','')}</span></div>}</div><h3 style={{fontSize:16,fontWeight:600,color:C.navy,margin:'0 0 2px'}}>{t.name}</h3><p style={{fontSize:13,color:C.textMuted,margin:0}}>{t.subtitle}</p><div style={{marginTop:8}}><div style={{display:'flex',alignItems:'center',gap:5,marginBottom:4}}>{t.status==='live'&&<span style={{fontSize:10,fontWeight:600,color:C.red,background:C.redLight,padding:'2px 6px',borderRadius:4}}>LIVE</span>}{t.status==='open'&&<span style={{fontSize:10,fontWeight:600,color:C.green,background:C.greenLight,padding:'2px 6px',borderRadius:4}}>OPEN</span>}{entered&&<span style={{fontSize:10,fontWeight:600,color:C.accentText,background:`${C.accent}18`,padding:'2px 6px',borderRadius:4}}>ENTERED</span>}<LockTimerBadge tournament={t}/></div><div style={{display:'flex',alignItems:'center',gap:5}}>{t.guaranteed?<span style={{fontSize:10,fontWeight:700,color:'#92400E',background:'#FEF3C7',padding:'2px 6px',borderRadius:4}}>${t.guaranteed>=1000000?(t.guaranteed/1000000).toFixed(t.guaranteed%1000000===0?0:1)+'M':(t.guaranteed/1000).toFixed(0)+'K'} GTD</span>:t.pool>0?<span style={{fontSize:10,fontWeight:600,color:C.accentText,background:`${C.accent}18`,padding:'2px 6px',borderRadius:4}}>${t.pool.toLocaleString('en-US')}</span>:null}{(t.status==='live'||t.status==='open')&&!entered&&<span style={{fontSize:10,color:C.textMuted,padding:'2px 6px',borderRadius:4,border:`1px solid ${C.border}`}}>$1 - $1,000</span>}</div></div></div><div style={{display:'flex',alignItems:'center',gap:10}}>{(t.status==='live'||t.status==='open')&&!entered&&<button onClick={()=>{setSelectedTier(null);setActiveTournament(t);setModal('tiers');}} style={{padding:'8px 14px',borderRadius:6,background:C.accent,border:'none',cursor:'pointer'}}><span style={{fontSize:12,fontWeight:600,color:'#fff'}}>Enter</span></button>}{entered&&<button onClick={()=>setCalendarTab('my')} style={{padding:'8px 14px',borderRadius:6,background:C.greenLight,border:'none',cursor:'pointer'}}><span style={{fontSize:12,fontWeight:600,color:C.green}}>View</span></button>}<Heart size={22} color={C.accentText} strokeWidth={1.5} style={{cursor:'pointer'}}/></div></div>);})}</div></div>))}<div style={{height:100}}/></>)}
  </div>);};

  const RankingsView=()=>(<div style={{background:C.card,minHeight:'100vh'}}><AppHeader/><div style={{background:C.card,padding:'12px 16px',borderBottom:`1px solid ${C.border}`,display:'flex',alignItems:'center',justifyContent:'space-between'}}><span style={{fontSize:18,fontWeight:800,color:C.navy,letterSpacing:-0.3}}>Top 30 Rankings</span><span style={{fontSize:11,fontWeight:600,color:C.textMuted,background:C.bgLight,padding:'3px 10px',borderRadius:20}}>Season 2026</span></div><div style={{background:C.bgLight,padding:'10px 16px',display:'flex',borderBottom:`1px solid ${C.border}`}}><span style={{width:45,fontSize:11,fontWeight:600,color:C.textMuted}}>RANK</span><span style={{flex:1,fontSize:11,fontWeight:600,color:C.textMuted}}>PLAYER</span><span style={{width:55,fontSize:11,fontWeight:600,color:C.textMuted,textAlign:'right'}}>PTS</span><span style={{width:45,fontSize:11,fontWeight:600,color:C.textMuted,textAlign:'right'}}>WIN%</span></div><div style={{background:C.card,paddingBottom:100}}>{rankings.map(p=>(<div key={p.rank} onClick={()=>setSelPlayer(p)} style={{display:'flex',alignItems:'center',padding:'12px 16px',borderBottom:`1px solid ${C.border}`,cursor:'pointer'}}><span style={{width:45,fontSize:15,fontWeight:600,color:p.rank<=3?C.orange:C.navy}}>{p.rank<=3?['1st','2nd','3rd'][p.rank-1]:p.rank}</span><div style={{flex:1,display:'flex',alignItems:'center',gap:8}}><div style={{width:34,height:34,borderRadius:17,background:p.rank<=3?`${C.orange}20`:C.accentLight,display:'flex',alignItems:'center',justifyContent:'center',fontSize:13,fontWeight:600,color:p.rank<=3?C.orange:C.accent}}>{p.name[0]}</div><span style={{fontSize:15}}>{p.flag}</span><div><p style={{fontSize:14,fontWeight:500,color:C.navy,margin:0}}>{p.name}</p><p style={{fontSize:11,color:C.textMuted,margin:'2px 0 0'}}>Played {p.played}</p></div></div><span style={{width:55,fontSize:14,fontWeight:600,color:C.navy,textAlign:'right'}}>{p.pts.toLocaleString('en-US')}</span><span style={{width:45,fontSize:13,fontWeight:500,color:C.green,textAlign:'right'}}>{p.winRate}%</span></div>))}</div></div>);

  const WalletView=()=>(<div style={{background:C.headerBg,minHeight:'100vh'}}><div style={{background:C.headerBg,padding:20}}><div style={{display:'flex',alignItems:'center',gap:10,marginBottom:20}}><MobaLogo size={24} color="#fff"/><MobaWordmark color="#fff" fontSize={20}/></div><p style={{fontSize:13,color:'rgba(255,255,255,0.7)',margin:'0 0 4px'}}>Available Balance</p><p style={{fontSize:36,fontWeight:700,color:'#fff',margin:0}}>${balance.toLocaleString('en-US')}.00</p><div style={{display:'flex',gap:12,marginTop:20}}><Btn primary onClick={()=>{setDepStep(1);setDepAmt('');setModal('deposit');}} style={{flex:1,background:'rgba(255,255,255,0.15)',border:'1px solid rgba(255,255,255,0.3)',color:'#fff'}}><Plus size={18}/> Add Funds</Btn><Btn onClick={()=>{setWithdrawStep(1);setWithdrawAmt('');setModal('withdraw');}} style={{flex:1,background:'rgba(255,255,255,0.1)',border:'1px solid rgba(255,255,255,0.2)',color:'#fff'}}><ArrowUp size={18}/> Withdraw</Btn></div></div><div style={{padding:16,paddingBottom:100,background:C.card,borderRadius:'16px 16px 0 0',marginTop:0}}><div style={{display:'flex',gap:12,marginBottom:20}}>{[['Total Earnings',`+$${user.earn.toLocaleString('en-US')}`,C.green,<TrendingUp size={18} color={C.green}/>],['Win Rate',`${user.win}%`,C.accent,<Trophy size={18} color={C.accentText}/>]].map(([lbl,val,col,icon])=>(<div key={lbl} style={{flex:1,background:C.card,borderRadius:12,padding:16,border:`1px solid ${C.border}`}}>{icon}<p style={{fontSize:11,color:C.textMuted,margin:'8px 0 4px'}}>{lbl}</p><p style={{fontSize:22,fontWeight:700,color:col,margin:0}}>{val}</p></div>))}</div><p style={{fontSize:14,fontWeight:600,color:C.navy,margin:'0 0 12px'}}>Recent Transactions</p><div style={{background:C.card,borderRadius:12,border:`1px solid ${C.border}`,overflow:'hidden'}}>{userTx.map((t,i)=>(<div key={t.id} style={{display:'flex',alignItems:'center',padding:16,borderBottom:i<userTx.length-1?`1px solid ${C.border}`:'none'}}><div style={{width:40,height:40,borderRadius:20,background:t.amt>0?C.greenLight:C.accentLight,display:'flex',alignItems:'center',justifyContent:'center',marginRight:12}}>{t.amt>0?<ArrowDown size={18} color={C.green}/>:<ArrowUp size={18} color={C.accentText}/>}</div><div style={{flex:1}}><p style={{fontSize:14,fontWeight:500,color:C.navy,margin:0}}>{t.title}</p><p style={{fontSize:12,color:C.textMuted,margin:'2px 0 0'}}>{t.desc}</p></div><div style={{textAlign:'right'}}><p style={{fontSize:15,fontWeight:600,color:t.amt>0?C.green:C.navy,margin:0}}>{t.amt>0?'+':'-'}${Math.abs(t.amt).toLocaleString('en-US')}</p><p style={{fontSize:11,color:C.textMuted,margin:'2px 0 0'}}>{t.date}</p></div></div>))}</div></div></div>);

  const DepositModal=()=>{if(depStep===3)return(<ModalWrap title="Success" onClose={()=>setModal(null)}><div style={{padding:32,textAlign:'center'}}><div style={{width:72,height:72,borderRadius:36,background:C.greenLight,display:'flex',alignItems:'center',justifyContent:'center',margin:'0 auto 20px'}}><CheckCircle size={36} color={C.green}/></div><p style={{fontSize:15,color:C.textMid}}>Successfully deposited</p><p style={{fontSize:36,fontWeight:700,color:C.green,margin:'8px 0'}}>+${depAmt}</p><Btn primary full onClick={()=>setModal(null)} style={{marginTop:24}}>Done</Btn></div></ModalWrap>);return(<ModalWrap title="Add Funds" onClose={()=>setModal(null)}><div style={{padding:16}}>{depStep===1?(<><p style={{fontSize:13,color:C.textMuted,margin:'0 0 10px'}}>Amount</p><div style={{position:'relative',marginBottom:20}}><span style={{position:'absolute',left:18,top:'50%',transform:'translateY(-50%)',fontSize:24,fontWeight:600,color:C.textMuted}}>$</span><input type="number" value={depAmt} onChange={e=>setDepAmt(e.target.value)} placeholder="0" style={{width:'100%',padding:'18px 18px 18px 45px',fontSize:28,fontWeight:700,background:C.inputBg,border:`2px solid ${depAmt?C.accent:C.border}`,borderRadius:12,color:C.navy,outline:'none'}}/></div><div style={{display:'flex',gap:8,marginBottom:24}}>{[50,100,200,500].map(v=>(<button key={v} onClick={()=>setDepAmt(v.toString())} style={{flex:1,padding:12,borderRadius:8,fontSize:14,fontWeight:600,cursor:'pointer',background:depAmt===v.toString()?C.accentLight:C.bgLight,border:`1px solid ${depAmt===v.toString()?C.accent:C.border}`,color:depAmt===v.toString()?C.accent:C.textMid}}>${v}</button>))}</div><Btn primary full disabled={!depAmt||parseFloat(depAmt)<10} onClick={()=>setDepStep(2)}>Continue</Btn></>):(<><div style={{background:C.bgLight,borderRadius:12,padding:16,marginBottom:20}}>{[['Amount',`$${depAmt}`],['Fee','$0.00'],['Total',`$${depAmt}`]].map(([k,v],i)=>(<div key={k}>{i===2&&<div style={{height:1,background:C.border,margin:'12px 0'}}/>}<div style={{display:'flex',justifyContent:'space-between',marginBottom:i<2?12:0}}><span style={{color:C.textMuted}}>{k}</span><span style={{fontWeight:i===2?700:600,fontSize:i===2?20:14,color:i===1?C.green:i===2?C.accentText:C.navy}}>{v}</span></div></div>))}</div><div style={{display:'flex',gap:12}}><Btn onClick={()=>setDepStep(1)} style={{flex:1}}>Back</Btn><Btn primary onClick={()=>{setBalance(balance+parseFloat(depAmt));setDepStep(3);}} style={{flex:2}}>Confirm</Btn></div></>)}</div></ModalWrap>);};

  const WithdrawModal=()=>{const ok=withdrawAmt&&parseFloat(withdrawAmt)>=20&&parseFloat(withdrawAmt)<=balance;if(withdrawStep===3)return(<ModalWrap title="Success" onClose={()=>setModal(null)}><div style={{padding:32,textAlign:'center'}}><div style={{width:72,height:72,borderRadius:36,background:C.greenLight,display:'flex',alignItems:'center',justifyContent:'center',margin:'0 auto 20px'}}><CheckCircle size={36} color={C.green}/></div><p style={{fontSize:15,color:C.textMid}}>Withdrawal initiated</p><p style={{fontSize:36,fontWeight:700,color:C.navy,margin:'8px 0'}}>${withdrawAmt}</p><Btn primary full onClick={()=>setModal(null)} style={{marginTop:24}}>Done</Btn></div></ModalWrap>);return(<ModalWrap title="Withdraw" onClose={()=>setModal(null)}><div style={{padding:16}}>{withdrawStep===1?(<><div style={{background:C.bgLight,borderRadius:12,padding:16,marginBottom:20,display:'flex',justifyContent:'space-between',alignItems:'center'}}><span style={{fontSize:14,color:C.textMuted}}>Available Balance</span><span style={{fontSize:20,fontWeight:700,color:C.navy}}>${balance.toLocaleString('en-US')}</span></div><div style={{position:'relative',marginBottom:12}}><span style={{position:'absolute',left:18,top:'50%',transform:'translateY(-50%)',fontSize:24,fontWeight:600,color:C.textMuted}}>$</span><input type="number" value={withdrawAmt} onChange={e=>setWithdrawAmt(e.target.value)} placeholder="0" style={{width:'100%',padding:'18px 18px 18px 45px',fontSize:28,fontWeight:700,background:C.inputBg,border:`2px solid ${withdrawAmt?C.accent:C.border}`,borderRadius:12,color:C.navy,outline:'none'}}/></div><button onClick={()=>setWithdrawAmt(balance.toString())} style={{marginBottom:20,padding:'8px 14px',background:C.accentLight,border:`1px solid ${C.accent}`,borderRadius:8,color:C.accentText,fontSize:12,fontWeight:600,cursor:'pointer'}}>Withdraw All (${balance.toLocaleString('en-US')})</button><div style={{background:C.accentLight,border:`2px solid ${C.accent}`,borderRadius:10,padding:14,marginBottom:16,display:'flex',alignItems:'center',gap:12}}><div style={{width:40,height:40,borderRadius:8,background:C.accent,display:'flex',alignItems:'center',justifyContent:'center'}}><DollarSign size={16} color="#fff"/></div><div><p style={{fontSize:14,fontWeight:600,color:C.navy,margin:0}}>Bank Account</p><p style={{fontSize:12,color:C.textMuted,margin:'2px 0 0'}}>....7891</p></div><Check size={20} color={C.accentText} style={{marginLeft:'auto'}}/></div><Btn primary full disabled={!ok} onClick={()=>setWithdrawStep(2)}>Continue</Btn></>):(<><div style={{background:C.bgLight,borderRadius:12,padding:16,marginBottom:20}}>{[['Amount',`$${parseFloat(withdrawAmt).toLocaleString('en-US')}`],['Fee','$0.00'],['To','Bank ....7891']].map(([k,v])=>(<div key={k} style={{display:'flex',justifyContent:'space-between',marginBottom:12}}><span style={{color:C.textMuted}}>{k}</span><span style={{fontWeight:600,color:C.navy}}>{v}</span></div>))}<div style={{height:1,background:C.border,margin:'0 0 12px'}}/><div style={{display:'flex',justifyContent:'space-between'}}><span style={{fontWeight:500,color:C.navy}}>You'll receive</span><span style={{fontWeight:700,fontSize:20,color:C.green}}>${parseFloat(withdrawAmt).toLocaleString('en-US')}</span></div></div><div style={{display:'flex',gap:12}}><Btn onClick={()=>setWithdrawStep(1)} style={{flex:1}}>Back</Btn><Btn primary onClick={()=>{setBalance(balance-parseFloat(withdrawAmt));setUserTx([{id:Date.now(),title:'Withdrawal',desc:'Bank ....7891',amt:-parseFloat(withdrawAmt),date:'Just now'},...userTx]);setWithdrawStep(3);}} style={{flex:2}}>Confirm</Btn></div></>)}</div></ModalWrap>);};

  const SubmitModal=()=>{const fee=selectedTier?.entry||activeTournament.entry,rake=selectedTier?.rake||0,netPool=selectedTier?selectedTier.poolEntry:(activeTournament.poolEntry||activeTournament.entry),can=balance>=fee;const champion=predictions[`r${totalRounds-1}-m0`],existingCount=getBracketCount(activeTournament.id),maxReached=existingCount>=MAX_BRACKETS_PER_TOURNAMENT;const earlyBonus=getEarlyBirdBonus(),defaultName=getDefaultBracketName(activeTournament.id);
    if(submitStep===3)return(<ModalWrap title="Success" onClose={()=>{setModal(null);setPredictions({});setBracketName('');}}><div style={{padding:32,textAlign:'center'}}><div style={{width:80,height:80,borderRadius:40,background:C.greenLight,display:'flex',alignItems:'center',justifyContent:'center',margin:'0 auto 20px'}}><CheckCircle size={40} color={C.green}/></div><h3 style={{fontSize:24,fontWeight:700,color:C.navy,margin:'0 0 8px'}}>Bracket Submitted!</h3><p style={{fontSize:15,color:C.textMuted}}>Good luck in {activeTournament.name}!</p>{champion&&<div style={{background:C.accentLight,borderRadius:12,padding:16,marginTop:16}}><p style={{fontSize:12,color:C.accentText,margin:'0 0 8px'}}>YOUR CHAMPION</p><div style={{display:'flex',alignItems:'center',justifyContent:'center',gap:10}}><span style={{fontSize:28}}>{champion.flag}</span><span style={{fontSize:18,fontWeight:700,color:C.navy}}>{champion.name}</span></div></div>}{existingCount===0&&<div style={{background:`${C.green}15`,border:`1px solid ${C.green}`,borderRadius:10,padding:12,marginTop:12,display:'flex',alignItems:'center',gap:10}}><Award size={20} color={C.green}/><div><p style={{fontSize:13,fontWeight:700,color:C.green,margin:0}}>Achievement Unlocked!</p><p style={{fontSize:11,color:C.green,margin:'2px 0 0',opacity:0.8}}>First Pick - Submit your first bracket</p></div></div>}<div style={{background:C.bgLight,borderRadius:12,padding:14,marginTop:16,display:'flex',alignItems:'center',gap:12}}><Bell size={22} color={C.accentText}/><div style={{flex:1}}><p style={{fontSize:13,fontWeight:600,color:C.navy,margin:0}}>Enable Push Notifications</p><p style={{fontSize:11,color:C.textMuted,margin:'2px 0 0'}}>Get live updates when your picks win</p></div><button style={{padding:'6px 12px',borderRadius:8,background:C.accent,border:'none',cursor:'pointer'}}><span style={{fontSize:12,fontWeight:600,color:'#fff'}}>Enable</span></button></div><Btn primary full onClick={()=>{setModal(null);setPredictions({});setBracketName('');setView('calendar');setCalendarTab('my');}} style={{marginTop:16}}>View My Brackets</Btn></div></ModalWrap>);
    if(submitStep===2)return(<ModalWrap title="Confirm Entry" onClose={()=>setModal(null)}><div style={{padding:16}}><div style={{background:C.bgLight,borderRadius:12,padding:16,marginBottom:16}}><p style={{fontSize:16,fontWeight:700,color:C.navy,margin:'0 0 2px'}}>{activeTournament.name}</p><p style={{fontSize:13,color:C.textMuted,margin:0}}>"{bracketName||defaultName}"</p></div><div style={{background:C.card,border:`1px solid ${C.border}`,borderRadius:12,padding:16,marginBottom:16}}>{[['Buy-in',`$${fee}`,C.navy],['Rake (10%)',`-$${rake}`,C.textMuted],['Cashback (5%)',`+$${(rake*0.05).toFixed(2)}`,C.green],['-> Prize Pool',`$${netPool}/player`,C.green],['Your Balance',`$${balance.toLocaleString('en-US')}`,can?C.green:C.red],['After Payment',`$${(balance-fee).toLocaleString('en-US')}`,C.navy]].map(([k,v,col],i)=>(<div key={k}>{i===2&&<div style={{height:1,background:C.border,margin:'12px 0'}}/>}<div style={{display:'flex',justifyContent:'space-between',marginBottom:i<2?12:0}}><span style={{color:C.textMuted}}>{k}</span><span style={{fontWeight:600,color:col}}>{v}</span></div></div>))}</div><div style={{display:'flex',gap:12}}><Btn onClick={()=>setSubmitStep(1)} style={{flex:1}}>Back</Btn>{can?<Btn primary onClick={()=>{const nb={id:Date.now(),name:bracketName||defaultName,tier:selectedTier,tournament:activeTournament,champion,blackHorse,predictions:{...predictions},submittedAt:new Date().toISOString(),status:'active',position:null,prevPosition:null,points:earlyBonus,correctPicks:0,totalPicks:rounds.reduce((s,r)=>s+r.matches,0),blackHorseAlive:true,prize:0};setBalance(balance-fee);setUserTx([{id:Date.now(),title:'Tournament Entry',desc:`${activeTournament.name} - ${nb.name}`,amt:-fee,date:'Just now'},...userTx]);setMyBrackets([...myBrackets,nb]);setBlackHorse(null);setSubmitStep(3);haptic.success();setTimeout(()=>triggerTicker(nb.id,champion?.name,8,'QF'),2000);setTimeout(()=>triggerWinBanner(champion?.name||'Your pick',8),4500);}} style={{flex:2}}>Pay ${fee}</Btn>:<Btn primary onClick={()=>{setModal('deposit');setDepStep(1);setDepAmt('');}} style={{flex:2}}><Plus size={18}/> Add Funds</Btn>}</div></div></ModalWrap>);
    return(<ModalWrap title="Review Bracket" onClose={()=>setModal(null)}><div style={{padding:16}}>{maxReached&&<div style={{background:C.redLight,border:`1px solid ${C.red}`,borderRadius:10,padding:14,marginBottom:16}}><p style={{fontSize:14,fontWeight:600,color:C.red,margin:'0 0 4px'}}>Max Brackets Reached</p><p style={{fontSize:12,color:C.red,margin:0}}>You can submit max {MAX_BRACKETS_PER_TOURNAMENT} brackets per tournament.</p></div>}<div style={{marginBottom:16}}><label style={{fontSize:12,fontWeight:600,color:C.textMuted,display:'block',marginBottom:6,textTransform:'uppercase',letterSpacing:0.5}}>Bracket Name</label><input type="text" value={bracketName} onChange={e=>setBracketName(e.target.value)} placeholder={defaultName} maxLength={30} style={{width:'100%',padding:12,fontSize:15,border:`1.5px solid ${C.border}`,borderRadius:10,outline:'none',color:C.navy,background:C.inputBg,boxSizing:'border-box'}}/></div>{champion&&<div style={{background:C.headerBg,borderRadius:12,padding:20,marginBottom:16,textAlign:'center'}}><p style={{fontSize:12,color:'rgba(255,255,255,0.7)',margin:'0 0 10px'}}>YOUR CHAMPION</p><div style={{display:'flex',alignItems:'center',justifyContent:'center',gap:12}}><span style={{fontSize:36}}>{champion.flag}</span><p style={{fontSize:20,fontWeight:700,color:'#fff',margin:0}}>{champion.name}</p></div><Trophy size={28} color="#FCD34D" style={{marginTop:12}}/></div>}<div style={{background:blackHorse?`${C.orange}10`:C.bgLight,border:`1px solid ${blackHorse?C.orange:C.border}`,borderRadius:12,padding:16,marginBottom:16}}><div style={{display:'flex',alignItems:'center',justifyContent:'space-between'}}><div style={{display:'flex',alignItems:'center',gap:8}}><Shield size={18} color={C.orange}/><span style={{fontSize:14,fontWeight:600,color:C.navy}}>Black Horse</span><span style={{fontSize:10,fontWeight:600,color:C.orange,background:`${C.orange}15`,padding:'2px 6px',borderRadius:4}}>1.5x</span></div>{blackHorse?<div style={{display:'flex',alignItems:'center',gap:8}}><span style={{fontSize:18}}>{blackHorse.flag}</span><span style={{fontSize:14,fontWeight:600,color:C.navy}}>{blackHorse.name}</span></div>:<span style={{fontSize:13,color:C.textMuted}}>Not selected</span>}</div></div><div style={{background:C.bgLight,borderRadius:12,padding:16,marginBottom:20,display:'flex',justifyContent:'space-between',alignItems:'center'}}><span style={{fontSize:14,color:C.textMuted}}>Entry Fee</span><span style={{fontSize:20,fontWeight:700,color:C.accentText}}>${fee}</span></div><Btn primary full disabled={maxReached} onClick={()=>setSubmitStep(2)}>Continue to Payment</Btn></div></ModalWrap>);};

  const TierSelectorModal=({tournament})=>(<ModalWrap title={`${tournament?.name} - Choose Entry Fee`} onClose={()=>setModal(null)} full><div><div style={{background:C.headerBg,padding:'14px 20px'}}>{tournament?.guaranteed&&<div style={{display:'flex',alignItems:'center',gap:10,marginBottom:10,background:'rgba(255,255,255,0.12)',borderRadius:10,padding:'10px 14px'}}><CircleDollarSign size={22} color="#FCD34D"/><div><p style={{fontSize:15,fontWeight:800,color:'#FCD34D',margin:0}}>${(tournament.guaranteed>=1000000?(tournament.guaranteed/1000000).toFixed(tournament.guaranteed%1000000===0?0:1)+'M':(tournament.guaranteed/1000).toFixed(0)+'K')} GUARANTEED</p><p style={{fontSize:11,color:'rgba(255,255,255,0.7)',margin:'2px 0 0'}}>Total prize pool across all entry levels</p></div></div>}<p style={{fontSize:11,color:'rgba(255,255,255,0.65)',margin:0}}>Each entry fee has its own pool | 10% rake from $5+ | Max {MAX_BRACKETS_PER_TOURNAMENT} brackets per level</p></div><div style={{padding:'12px 16px 120px'}}>{STAKES.map(stake=>{const effectivePool=getEffectivePool(stake,tournament),overlay=getOverlay(stake,tournament);const isSelected=selectedTier?.id===stake.id,canAfford=balance>=stake.entry;const existingAtStake=myBrackets.filter(b=>b.tournament?.id===tournament?.id&&b.tier?.id===stake.id).length,maxed=existingAtStake>=MAX_BRACKETS_PER_TOURNAMENT;return(<button key={stake.id} onClick={()=>{if(canAfford&&!maxed){haptic.tick();setSelectedTier(stake);}}} style={{width:'100%',display:'flex',alignItems:'center',padding:'14px 16px',marginBottom:8,border:`2px solid ${isSelected?stake.color:C.border}`,borderRadius:12,background:isSelected?`${stake.color}12`:C.card,cursor:canAfford&&!maxed?'pointer':'not-allowed',opacity:canAfford&&!maxed?1:0.45,textAlign:'left'}}><div style={{width:80,flexShrink:0}}><span style={{fontSize:22,fontWeight:800,color:isSelected?stake.color:C.navy}}>${stake.entry}</span></div><div style={{flex:1}}><div style={{display:'flex',gap:20}}><div><p style={{fontSize:9,color:C.textMuted,margin:'0 0 1px',textTransform:'uppercase',letterSpacing:0.4}}>Prize Pool</p><div style={{display:'flex',alignItems:'center',gap:4}}><p style={{fontSize:14,fontWeight:700,color:C.green,margin:0}}>${effectivePool.toLocaleString('en-US')}</p>{overlay>0&&<span style={{fontSize:9,fontWeight:700,color:'#FCD34D',background:'rgba(252,211,77,0.15)',padding:'1px 5px',borderRadius:4}}>GTD</span>}</div></div><div><p style={{fontSize:9,color:C.textMuted,margin:'0 0 1px',textTransform:'uppercase',letterSpacing:0.4}}>Top Prize</p><p style={{fontSize:14,fontWeight:700,color:stake.color,margin:0}}>${Math.round(effectivePool*0.20).toLocaleString('en-US')}</p></div><div><p style={{fontSize:9,color:C.textMuted,margin:'0 0 1px',textTransform:'uppercase',letterSpacing:0.4}}>Players</p><p style={{fontSize:14,fontWeight:600,color:C.textMid,margin:0}}>{stake.mockEntries.toLocaleString('en-US')}</p></div></div><p style={{fontSize:10,color:C.textMuted,margin:'4px 0 0'}}>{stake.rake===0?'No rake':`Rake: $${stake.rake}`} | {Math.floor(stake.mockEntries*0.15).toLocaleString('en-US')} paid places</p></div><div style={{width:24,flexShrink:0,textAlign:'right'}}>{isSelected&&<Check size={20} color={stake.color}/>}{!isSelected&&maxed&&<span style={{fontSize:10,color:C.red,fontWeight:700}}>MAX</span>}</div></button>);})}</div><div style={{position:'sticky',bottom:0,background:C.card,borderTop:`1px solid ${C.border}`,padding:'12px 16px',paddingBottom:28}}>{selectedTier?<div style={{display:'flex',justifyContent:'space-between',alignItems:'center',marginBottom:10}}><span style={{fontSize:13,color:C.textMuted}}>Entry fee: <strong style={{color:C.navy}}>${selectedTier.entry}</strong></span><span style={{fontSize:13,color:C.green,fontWeight:600}}>Pool: ${getEffectivePool(selectedTier,tournament).toLocaleString('en-US')}</span></div>:<p style={{fontSize:13,color:C.textMuted,marginBottom:10,textAlign:'center'}}>Select an entry fee above</p>}<Btn primary full disabled={!selectedTier||balance<selectedTier.entry} onClick={()=>{setActiveTournament(tournament);setModal(null);setView('bracket');}}>{selectedTier?`Enter - $${selectedTier.entry} entry fee`:'Select entry fee to continue'}</Btn></div></div></ModalWrap>);

  const BlackHorseModal=()=>{const players=getBlackHorse(getBracketSize(activeTournament));return(<ModalWrap title="Select Black Horse" onClose={()=>setModal(null)}><div style={{padding:16}}><div style={{background:`${C.orange}12`,border:`1px solid ${C.orange}`,borderRadius:12,padding:16,marginBottom:16}}><p style={{fontSize:13,color:C.textMid,margin:0,lineHeight:1.5}}>Choose an unseeded/lower-seeded player. If they win a match you predicted correctly, you earn <strong>1.5x points</strong> for that match.</p></div><div style={{maxHeight:380,overflowY:'auto'}}>{players.map(p=>(<button key={p.id} onClick={()=>{haptic.medium();setBlackHorse(p);setModal(null);}} style={{width:'100%',display:'flex',alignItems:'center',padding:'12px 14px',marginBottom:8,borderRadius:10,border:blackHorse?.id===p.id?`2px solid ${C.orange}`:`1px solid ${C.border}`,background:blackHorse?.id===p.id?`${C.orange}10`:C.card,cursor:'pointer'}}><span style={{fontSize:22,marginRight:12}}>{p.flag}</span><div style={{flex:1,textAlign:'left'}}><p style={{fontSize:15,fontWeight:500,color:C.navy,margin:0}}>{p.name}</p><p style={{fontSize:12,color:C.textMuted,margin:'2px 0 0'}}>Seed [{p.seed||'-'}]</p></div>{blackHorse?.id===p.id&&<div style={{width:24,height:24,borderRadius:12,background:C.orange,display:'flex',alignItems:'center',justifyContent:'center'}}><Check size={14} color="#fff"/></div>}</button>))}</div>{blackHorse&&<div style={{marginTop:16,paddingTop:16,borderTop:`1px solid ${C.border}`}}><Btn full onClick={()=>setBlackHorse(null)}>Clear Selection</Btn></div>}</div></ModalWrap>);};

  const PrizesModal=()=>{const pool=calcPrizePool(activeTournament.entries||1,activeTournament.poolEntry||activeTournament.entry);const rows=[{place:'1st',pct:'20%',amt:Math.round(pool*0.20),medal:'1'},{place:'2nd',pct:'12%',amt:Math.round(pool*0.12),medal:'2'},{place:'3rd',pct:'8%',amt:Math.round(pool*0.08),medal:'3'},{place:'4th',pct:'5.5%',amt:Math.round(pool*0.055)},{place:'5th-8th',pct:'2.5%',amt:Math.round(pool*0.025)},{place:'9th-16th',pct:'1.25%',amt:Math.round(pool*0.0125)},{place:'17th-32nd',pct:'0.7%',amt:Math.round(pool*0.007)},{place:'33rd-64th',pct:'0.4%',amt:Math.round(pool*0.004)}];return(<ModalWrap title="Prize Payouts" onClose={()=>setModal(null)}><div style={{padding:16}}><div style={{background:C.headerBg,borderRadius:12,padding:16,marginBottom:16}}><h3 style={{fontSize:18,fontWeight:700,color:'#fff',margin:'0 0 4px'}}>{activeTournament.name}</h3><p style={{fontSize:12,color:'rgba(255,255,255,0.7)',margin:0}}>{activeTournament.entries.toLocaleString('en-US')} entries</p></div><div style={{background:C.bgLight,borderRadius:12,padding:16,marginBottom:16}}>
              <div style={{display:'flex',justifyContent:'space-between',alignItems:'baseline',marginBottom:10}}>
                <p style={{fontSize:12,color:C.textMuted,margin:0}}>Total Prize Pool</p>
                <div style={{display:'flex',alignItems:'center',gap:6}}>
                  <div style={{width:7,height:7,borderRadius:4,background:C.green,animation:'pulse 1.5s ease infinite'}}/>
                  <p style={{fontSize:24,fontWeight:800,color:C.green,margin:0,fontVariantNumeric:'tabular-nums'}}>${poolLive.toLocaleString('en-US')}</p>
                </div>
              </div>
              <div style={{height:6,background:C.border,borderRadius:3,overflow:'hidden'}}>
                <div style={{height:'100%',width:`${Math.min(100,(poolLive/1000000)*100)}%`,background:`linear-gradient(90deg,${C.green},#34D399)`,borderRadius:3,transition:'width 1.2s ease'}}/>
              </div>
              <div style={{display:'flex',justifyContent:'space-between',marginTop:5}}>
                <span style={{fontSize:10,color:C.textMuted}}>Growing live</span>
                <span style={{fontSize:10,fontWeight:600,color:C.green}}>{Math.min(100,(poolLive/1000000)*100).toFixed(1)}% of $1M GTD</span>
              </div>
            </div><div style={{background:C.card,border:`1px solid ${C.border}`,borderRadius:12,overflow:'hidden'}}><div style={{display:'flex',padding:'10px 14px',background:C.bgLight,borderBottom:`1px solid ${C.border}`}}><span style={{flex:1,fontSize:11,fontWeight:600,color:C.textMuted}}>PLACE</span><span style={{width:60,fontSize:11,fontWeight:600,color:C.textMuted,textAlign:'right'}}>%</span><span style={{width:90,fontSize:11,fontWeight:600,color:C.textMuted,textAlign:'right'}}>PRIZE</span></div>{(prizesShowAll?rows:rows.slice(0,5)).map((row,i)=>(<div key={i} style={{display:'flex',alignItems:'center',padding:'11px 14px',borderBottom:i<(prizesShowAll?rows.length:5)-1?`1px solid ${C.border}`:'none'}}><div style={{flex:1,display:'flex',alignItems:'center',gap:8}}>{row.medal&&<span style={{fontSize:12,fontWeight:700,color:C.orange,background:`${C.orange}15`,borderRadius:4,padding:'1px 6px',marginRight:2}}>{row.medal}</span>}<span style={{fontSize:13,fontWeight:row.medal?600:500,color:C.navy}}>{row.place}</span></div><span style={{width:60,fontSize:12,color:C.textMuted,textAlign:'right'}}>{row.pct}</span><span style={{width:90,fontSize:13,fontWeight:600,color:row.medal?C.green:C.navy,textAlign:'right'}}>${row.amt.toLocaleString('en-US')}</span></div>))}</div><button onClick={()=>setPrizesShowAll(!prizesShowAll)} style={{width:'100%',padding:12,marginTop:12,background:'none',border:`1px solid ${C.border}`,borderRadius:8,cursor:'pointer',display:'flex',alignItems:'center',justifyContent:'center',gap:6}}><span style={{fontSize:13,fontWeight:500,color:C.accentText}}>{prizesShowAll?'Show Less':'Show All Places'}</span><ChevronDown size={16} color={C.accentText} style={{transform:prizesShowAll?'rotate(180deg)':'none'}}/></button></div></ModalWrap>);};

  const AuthModal=()=>(<ModalWrap title={authMode==='login'?'Sign In':'Create Account'} onClose={()=>{setAuthMode('login');setModal(null);}}><div style={{padding:20}}><div style={{textAlign:'center',marginBottom:24}}><div style={{display:'flex',alignItems:'center',justifyContent:'center',gap:8,marginBottom:8}}><MobaLogo size={32} color={C.accentText}/><MobaWordmark color={C.navy} fontSize={22}/></div><p style={{fontSize:13,color:C.textMuted,margin:0}}>Bracket Battle</p></div>{authMode==='register'&&<div style={{marginBottom:16}}><label style={{fontSize:13,fontWeight:600,color:C.textMid,display:'block',marginBottom:6}}>Username</label><input type="text" value={authName} onChange={e=>setAuthName(e.target.value)} placeholder="Choose a username" style={{width:'100%',padding:14,fontSize:15,border:`1.5px solid ${C.border}`,borderRadius:10,outline:'none',color:C.navy,background:C.inputBg,boxSizing:'border-box'}}/></div>}<div style={{marginBottom:16}}><label style={{fontSize:13,fontWeight:600,color:C.textMid,display:'block',marginBottom:6}}>Email</label><input type="email" value={authEmail} onChange={e=>setAuthEmail(e.target.value)} placeholder="your@email.com" style={{width:'100%',padding:14,fontSize:15,border:`1.5px solid ${C.border}`,borderRadius:10,outline:'none',color:C.navy,background:C.inputBg,boxSizing:'border-box'}}/></div><div style={{marginBottom:20}}><label style={{fontSize:13,fontWeight:600,color:C.textMid,display:'block',marginBottom:6}}>Password</label><div style={{position:'relative'}}><input type={showPass?'text':'password'} value={authPassword} onChange={e=>setAuthPassword(e.target.value)} placeholder="Password" style={{width:'100%',padding:14,paddingRight:46,fontSize:15,border:`1.5px solid ${C.border}`,borderRadius:10,outline:'none',color:C.navy,background:C.inputBg,boxSizing:'border-box'}}/><button onClick={()=>setShowPass(!showPass)} style={{position:'absolute',right:12,top:'50%',transform:'translateY(-50%)',background:'none',border:'none',cursor:'pointer',display:'flex',alignItems:'center'}}>{showPass?<EyeOff size={18} color={C.textMuted}/>:<Eye size={18} color={C.textMuted}/>}</button></div></div><Btn primary full disabled={authMode==='login'?!authEmail||!authPassword:!authName||!authEmail||!authPassword} onClick={()=>{setIsLoggedIn(true);setModal(null);setAuthEmail('');setAuthPassword('');setAuthName('');}}>  {authMode==='login'?'Sign In':'Create Account'}</Btn><div style={{marginTop:20,paddingTop:20,borderTop:`1px solid ${C.border}`,textAlign:'center'}}>{authMode==='login'?<p style={{fontSize:14,color:C.textMid,margin:0}}>Don't have an account? <span onClick={()=>setAuthMode('register')} style={{color:C.accentText,fontWeight:600,cursor:'pointer'}}>Sign Up</span></p>:<p style={{fontSize:14,color:C.textMid,margin:0}}>Already have an account? <span onClick={()=>setAuthMode('login')} style={{color:C.accentText,fontWeight:600,cursor:'pointer'}}>Sign In</span></p>}</div></div></ModalWrap>);

  const SplashScreen=()=>(<div style={{position:'fixed',inset:0,zIndex:3000,background:'linear-gradient(160deg,#1E1B4B 0%,#2D2686 50%,#3730A3 100%)',display:'flex',flexDirection:'column',alignItems:'center',justifyContent:'center',maxWidth:430,margin:'0 auto'}}><div style={{marginBottom:20}}><MobaLogo size={72} color="#fff"/></div><MobaWordmark color="#fff" fontSize={32}/><p style={{fontSize:14,color:'rgba(255,255,255,0.55)',margin:'12px 0 0',letterSpacing:1}}>Bracket Battle</p><div style={{display:'flex',gap:6,marginTop:48}}>{[0,1,2].map(i=><div key={i} style={{width:6,height:6,borderRadius:3,background:'rgba(255,255,255,0.4)',animation:`pulse 1.2s ease ${i*0.2}s infinite`}}/>)}</div></div>);

  const ONBOARDING_STEPS=[{title:'Welcome to mobaOne',subtitle:'Bracket Battle',desc:'Predict tournament brackets, compete against thousands, and win real prize pools.',highlight:null},{title:'Build Your Bracket',subtitle:'Pick winners round by round',desc:'Choose the winner of every match from R128 all the way to the Final.',highlight:'Fibonacci scoring: R128=1pt, R64=2pt, R32=3pt, R16=5pt, QF=8pt, SF=13pt, F=21pt'},{title:'Pick a Black Horse',subtitle:'1.5x bonus points',desc:'Select one lower-ranked player. Every correct pick involving your Black Horse earns 1.5x points.',highlight:'Strategy tip: pick someone likely to reach at least QF for maximum value.'},{title:'Choose Your Stakes',subtitle:'From $1 to $1,000',desc:'Every tournament has 10 buy-in levels. Each has its own prize pool and leaderboard.',highlight:'Top 15% of entries win cash prizes. Higher stakes = fewer competitors.'}];
  const OnboardingScreen=()=>{const step=ONBOARDING_STEPS[onboardingStep],isLast=onboardingStep===ONBOARDING_STEPS.length-1,isFirst=onboardingStep===0;return(<div style={{position:'fixed',inset:0,zIndex:2000,background:'linear-gradient(160deg,#1E1B4B 0%,#2D2686 55%,#3730A3 100%)',display:'flex',flexDirection:'column',maxWidth:430,margin:'0 auto'}}><div style={{padding:'20px 24px',display:'flex',alignItems:'center',justifyContent:'space-between'}}><div style={{display:'flex',alignItems:'center',gap:10}}><MobaLogo size={22} color="#fff"/><MobaWordmark color="#fff" fontSize={16}/></div><button onClick={()=>setShowOnboarding(false)} style={{background:'rgba(255,255,255,0.12)',border:'none',borderRadius:20,padding:'6px 14px',color:'rgba(255,255,255,0.7)',fontSize:12,cursor:'pointer'}}>Skip</button></div><div style={{display:'flex',gap:4,padding:'0 24px'}}>{ONBOARDING_STEPS.map((_,i)=><div key={i} style={{flex:1,height:2,borderRadius:1,background:i<=onboardingStep?'#fff':'rgba(255,255,255,0.2)',transition:'background 0.3s'}}/>)}</div><div style={{flex:1,display:'flex',flexDirection:'column',padding:'32px 28px 24px'}}><p style={{fontSize:11,fontWeight:600,color:'rgba(255,255,255,0.4)',margin:'0 0 20px',letterSpacing:1,textTransform:'uppercase'}}>Step {onboardingStep+1} of {ONBOARDING_STEPS.length}</p><div style={{width:64,height:64,borderRadius:18,background:'rgba(255,255,255,0.12)',display:'flex',alignItems:'center',justifyContent:'center',marginBottom:24}}>{onboardingStep===0&&<Trophy size={32} color="#FCD34D"/>}{onboardingStep===1&&<Layers size={32} color="#60A5FA"/>}{onboardingStep===2&&<Shield size={32} color="#FB923C"/>}{onboardingStep===3&&<CircleDollarSign size={32} color="#34D399"/>}</div><h1 style={{fontSize:26,fontWeight:800,color:'#fff',margin:'0 0 8px',lineHeight:1.2}}>{step.title}</h1><p style={{fontSize:15,color:'rgba(255,255,255,0.6)',margin:'0 0 20px',fontWeight:500}}>{step.subtitle}</p><p style={{fontSize:14,color:'rgba(255,255,255,0.82)',lineHeight:1.65,margin:0}}>{step.desc}</p>{step.highlight&&<div style={{marginTop:20,background:'rgba(252,211,77,0.12)',border:'1px solid rgba(252,211,77,0.3)',borderRadius:12,padding:'12px 16px'}}><p style={{fontSize:12,color:'#FCD34D',margin:0,lineHeight:1.5}}>{step.highlight}</p></div>}</div><div style={{padding:'16px 24px 40px',display:'flex',gap:12,alignItems:'center'}}>{!isFirst&&<button onClick={()=>setOnboardingStep(s=>s-1)} style={{width:44,height:44,borderRadius:12,background:'rgba(255,255,255,0.12)',border:'none',cursor:'pointer',display:'flex',alignItems:'center',justifyContent:'center'}}><ChevronLeft size={20} color="#fff"/></button>}<button onClick={()=>isLast?setShowOnboarding(false):setOnboardingStep(s=>s+1)} style={{flex:1,padding:15,borderRadius:14,border:'none',background:'#fff',color:'#3730A3',fontSize:15,fontWeight:700,cursor:'pointer',display:'flex',alignItems:'center',justifyContent:'center',gap:8}}>{isLast?'Start Playing':'Continue'}{!isLast&&<ChevronRight size={18} color="#3730A3"/>}</button></div></div>);};

  const AchievementsModal=()=>{const earned=achievements.filter(a=>a.earned),locked=achievements.filter(a=>!a.earned);return(<ModalWrap title="Achievements" onClose={()=>setModal(null)}><div style={{padding:16}}><div style={{background:C.bgLight,borderRadius:12,padding:14,marginBottom:20}}><div style={{display:'flex',justifyContent:'space-between',marginBottom:8}}><span style={{fontSize:13,fontWeight:600,color:C.navy}}>Collection Progress</span><span style={{fontSize:13,fontWeight:700,color:C.accentText}}>{earned.length}/{achievements.length}</span></div><div style={{height:8,background:C.border,borderRadius:4}}><div style={{height:'100%',width:`${(earned.length/achievements.length)*100}%`,background:C.accent,borderRadius:4}}/></div></div><p style={{fontSize:12,fontWeight:700,color:C.textMuted,margin:'0 0 10px',letterSpacing:0.5}}>EARNED ({earned.length})</p><div style={{display:'grid',gridTemplateColumns:'1fr 1fr',gap:10,marginBottom:20}}>{earned.map(a=><div key={a.id} style={{background:C.bgLight,borderRadius:12,padding:14,border:`1px solid ${C.accent}40`,textAlign:'center'}}><div style={{fontSize:32,marginBottom:8}}>{a.icon}</div><p style={{fontSize:13,fontWeight:700,color:C.navy,margin:'0 0 4px'}}>{a.title}</p><p style={{fontSize:10,color:C.textMuted,margin:'0 0 6px',lineHeight:1.3}}>{a.desc}</p><p style={{fontSize:10,color:C.green,margin:0}}>{a.earnedAt}</p></div>)}</div><p style={{fontSize:12,fontWeight:700,color:C.textMuted,margin:'0 0 10px',letterSpacing:0.5}}>LOCKED ({locked.length})</p><div style={{display:'grid',gridTemplateColumns:'1fr 1fr',gap:10}}>{locked.map(a=><div key={a.id} style={{background:C.bgLight,borderRadius:12,padding:14,border:`1px solid ${C.border}`,textAlign:'center',opacity:0.6}}><div style={{fontSize:32,marginBottom:8,filter:'grayscale(1)'}}>{a.icon}</div><p style={{fontSize:13,fontWeight:700,color:C.navy,margin:'0 0 4px'}}>{a.title}</p><p style={{fontSize:10,color:C.textMuted,margin:0,lineHeight:1.3}}>{a.desc}</p></div>)}</div></div></ModalWrap>);};

  const DailyChallengesModal=()=>(<ModalWrap title="Daily Challenges" onClose={()=>setModal(null)}><div style={{padding:16}}><div style={{background:C.bgLight,borderRadius:12,padding:14,marginBottom:16,display:'flex',alignItems:'center',gap:10}}><Target size={22} color={C.accentText}/><div><p style={{fontSize:13,fontWeight:600,color:C.navy,margin:0}}>Complete challenges for bonus points</p><p style={{fontSize:11,color:C.textMuted,margin:'2px 0 0'}}>New challenges every 24 hours</p></div></div>{dailyChallenges.map(ch=>(<div key={ch.id} style={{background:C.card,borderRadius:12,padding:16,marginBottom:12,border:`1px solid ${ch.completed?C.green:C.border}`,opacity:ch.completed?0.7:1}}><div style={{display:'flex',alignItems:'start',justifyContent:'space-between',marginBottom:8}}><div style={{flex:1}}><div style={{display:'flex',alignItems:'center',gap:8,marginBottom:4}}><p style={{fontSize:15,fontWeight:700,color:C.navy,margin:0}}>{ch.title}</p>{ch.completed&&<span style={{fontSize:10,fontWeight:700,color:C.green,background:C.greenLight,padding:'2px 6px',borderRadius:4}}>DONE</span>}</div><p style={{fontSize:12,color:C.textMuted,margin:'0 0 8px',lineHeight:1.4}}>{ch.desc}</p><div style={{display:'inline-flex',alignItems:'center',gap:4,background:`${C.accent}12`,borderRadius:6,padding:'4px 10px'}}><span style={{fontSize:12,fontWeight:700,color:C.accentText}}>{ch.reward}</span></div></div></div>{ch.expires&&!ch.completed&&<div style={{display:'flex',alignItems:'center',gap:4,marginTop:10,paddingTop:10,borderTop:`1px solid ${C.border}`}}><span style={{fontSize:10,color:C.textMuted}}>Expires in</span><span style={{fontSize:11,fontWeight:700,color:C.red,fontVariantNumeric:'tabular-nums'}}>{ch.expires}</span></div>}</div>))}</div></ModalWrap>);

  const LiveTicker=()=>{if(!liveTickerMsg)return null;return(<div style={{position:'fixed',bottom:100,left:'50%',transform:'translateX(-50%)',background:C.accent,borderRadius:24,padding:'12px 20px',display:'flex',alignItems:'center',gap:10,boxShadow:'0 4px 20px rgba(0,0,0,0.3)',zIndex:999,maxWidth:360,width:'calc(100% - 40px)'}}><Activity size={20} color="#fff"/><div style={{flex:1}}><p style={{fontSize:13,fontWeight:700,color:'#fff',margin:0}}>{liveTickerMsg.playerName} won!</p><p style={{fontSize:11,color:'rgba(255,255,255,0.8)',margin:'2px 0 0'}}>{liveTickerMsg.round} correct pick</p></div><div style={{background:'rgba(255,255,255,0.2)',borderRadius:12,padding:'4px 10px'}}><span style={{fontSize:16,fontWeight:800,color:'#fff'}}>+{liveTickerMsg.pts}</span><span style={{fontSize:10,color:'rgba(255,255,255,0.8)'}}> pts</span></div></div>);};

  // -- WIN BANNER  -  push notification style, slides from top -----------------
  const WinBanner=()=>{
    if(!winBanner)return null;
    return(
      <div onClick={()=>setWinBanner(null)} style={{position:'fixed',top:0,left:'50%',transform:'translateX(-50%)',width:'100%',maxWidth:430,zIndex:2000,padding:'0 12px',paddingTop:12,cursor:'pointer',animation:'slideDown 0.35s cubic-bezier(0.34,1.56,0.64,1)'}}>
        <div style={{background:'#1C1C1E',borderRadius:16,padding:'14px 16px',display:'flex',alignItems:'center',gap:12,boxShadow:'0 8px 32px rgba(0,0,0,0.45)'}}>
          {/* App icon */}
          <div style={{width:44,height:44,borderRadius:11,background:C.accent,display:'flex',alignItems:'center',justifyContent:'center',flexShrink:0}}>
            <MobaLogo size={26} color="#fff"/>
          </div>
          <div style={{flex:1,minWidth:0}}>
            <div style={{display:'flex',justifyContent:'space-between',alignItems:'center',marginBottom:2}}>
              <span style={{fontSize:13,fontWeight:700,color:'#fff'}}>mobaOne</span>
              <span style={{fontSize:11,color:'rgba(255,255,255,0.45)'}}>now</span>
            </div>
            <p style={{fontSize:13,color:'rgba(255,255,255,0.85)',margin:0,lineHeight:1.35,overflow:'hidden',textOverflow:'ellipsis',whiteSpace:'nowrap'}}>
              {winBanner.player} won! +{winBanner.pts} pts added to your bracket 🎾
            </p>
          </div>
        </div>
      </div>
    );
  };

  const NotificationsModal=()=>(<ModalWrap title="Notifications" onClose={()=>{markAllRead();setModal(null);}}><div style={{padding:0}}>{unreadCount>0&&<div style={{padding:'10px 16px',background:C.bgLight,borderBottom:`1px solid ${C.border}`,display:'flex',justifyContent:'space-between',alignItems:'center'}}><span style={{fontSize:12,color:C.textMuted}}>{unreadCount} unread</span><button onClick={markAllRead} style={{background:'none',border:'none',cursor:'pointer',fontSize:12,color:C.accentText,fontWeight:600}}>Mark all read</button></div>}{notifications.map(n=>(<div key={n.id} style={{display:'flex',gap:12,padding:'14px 16px',borderBottom:`1px solid ${C.border}`,background:n.read?C.card:`${C.accent}06`}}><div style={{width:40,height:40,borderRadius:20,background:C.bgLight,display:'flex',alignItems:'center',justifyContent:'center',flexShrink:0}}>{n.icon==='points'&&<Activity size={18} color={C.green}/>}{n.icon==='ranking'&&<TrendingUp size={18} color={C.accentText}/>}{n.icon==='bh'&&<Shield size={18} color={C.orange}/>}{n.icon==='lock'&&<Lock size={18} color={C.red}/>}{n.icon==='result'&&<Layers size={18} color={C.textMid}/>}{n.icon==='win'&&<CircleDollarSign size={18} color={C.green}/>}</div><div style={{flex:1}}><div style={{display:'flex',justifyContent:'space-between',alignItems:'start',marginBottom:3}}><p style={{fontSize:13,fontWeight:n.read?500:700,color:C.navy,margin:0}}>{n.title}</p>{!n.read&&<div style={{width:8,height:8,borderRadius:4,background:C.accent,flexShrink:0,marginTop:3}}/>}</div><p style={{fontSize:12,color:C.textMuted,margin:'0 0 4px',lineHeight:1.4}}>{n.body}</p><span style={{fontSize:11,color:C.textLight}}>{n.time}</span></div></div>))}</div></ModalWrap>);

  const GlobalFeedModal=()=>(<ModalWrap title="Global Feed" onClose={()=>setModal(null)} full><div style={{padding:0}}><div style={{padding:'12px 16px',background:C.bgLight,borderBottom:`1px solid ${C.border}`,display:'flex',alignItems:'center',gap:8}}><div style={{width:8,height:8,borderRadius:4,background:C.red}}/><span style={{fontSize:13,fontWeight:600,color:C.navy}}>Live activity from all players</span></div>{globalFeed.map(item=>(<div key={item.id} style={{display:'flex',alignItems:'center',gap:12,padding:'13px 16px',borderBottom:`1px solid ${C.border}`}}><div style={{width:38,height:38,borderRadius:19,background:C.bgLight,display:'flex',alignItems:'center',justifyContent:'center',fontSize:18,flexShrink:0}}>{item.flag}</div><div style={{flex:1}}><p style={{fontSize:13,color:C.navy,margin:'0 0 2px',lineHeight:1.4}}><strong>{item.user}</strong><span style={{color:{won:'#047857',submitted:C.accentText,climbed:C.orange,unlocked:C.orange}[item.action]||C.textMid,fontWeight:600}}> {item.action} </span><span style={{color:C.textMid}}>{item.detail}</span></p><span style={{fontSize:11,color:C.textLight}}>{item.time}</span></div>{item.pts&&<div style={{background:C.greenLight,borderRadius:8,padding:'4px 8px',flexShrink:0}}><p style={{fontSize:12,fontWeight:700,color:C.green,margin:0}}>{item.pts} pts</p></div>}</div>))}</div></ModalWrap>);

  const StatsModal=()=>(<ModalWrap title="My Stats" onClose={()=>setModal(null)}><div style={{padding:16}}><div style={{background:C.headerBg,borderRadius:12,padding:20,marginBottom:16,textAlign:'center'}}><p style={{fontSize:12,color:'rgba(255,255,255,0.7)',margin:'0 0 8px',textTransform:'uppercase',letterSpacing:0.5}}>Overall Accuracy</p><p style={{fontSize:48,fontWeight:800,color:'#fff',margin:0}}>{accuracyStats.overall}%</p><p style={{fontSize:13,color:'rgba(255,255,255,0.7)',margin:'4px 0 0'}}>{accuracyStats.totalCorrect} / {accuracyStats.totalPicks} correct picks</p><div style={{display:'flex',alignItems:'center',justifyContent:'center',gap:6,marginTop:8}}><Flame size={13} color="#F97316"/><span style={{fontSize:13,color:'#FCD34D'}}>{accuracyStats.streak} tournament streak</span></div></div><p style={{fontSize:13,fontWeight:600,color:C.navy,margin:'0 0 10px',textTransform:'uppercase',letterSpacing:0.5}}>By Surface</p><div style={{display:'grid',gridTemplateColumns:'repeat(3,1fr)',gap:10,marginBottom:16}}>{Object.entries(accuracyStats.bySurface).map(([surface,pct])=><div key={surface} style={{background:C.bgLight,borderRadius:10,padding:14,textAlign:'center',border:`1px solid ${C.border}`}}><p style={{fontSize:10,color:C.textMuted,margin:'0 0 4px'}}>{surface}</p><p style={{fontSize:22,fontWeight:700,color:pct>=70?C.green:pct>=60?C.accentText:C.textMid,margin:0}}>{pct}%</p></div>)}</div><p style={{fontSize:13,fontWeight:600,color:C.navy,margin:'0 0 10px',textTransform:'uppercase',letterSpacing:0.5}}>By Round</p><div style={{background:C.card,border:`1px solid ${C.border}`,borderRadius:12,overflow:'hidden',marginBottom:16}}>{Object.entries(accuracyStats.byRound).map(([round,pct],i,arr)=><div key={round} style={{display:'flex',alignItems:'center',padding:'10px 14px',borderBottom:i<arr.length-1?`1px solid ${C.border}`:'none'}}><span style={{width:50,fontSize:13,fontWeight:600,color:C.textMuted}}>{round}</span><div style={{flex:1,height:6,background:C.bgLight,borderRadius:3,marginRight:12}}><div style={{height:'100%',width:`${pct}%`,background:pct>=70?C.green:pct>=60?C.accentText:C.orange,borderRadius:3}}/></div><span style={{fontSize:13,fontWeight:600,color:C.navy,width:40,textAlign:'right'}}>{pct}%</span></div>)}</div><div style={{background:C.bgLight,borderRadius:12,padding:14,display:'flex',alignItems:'center',gap:12}}><Mail size={22} color={C.accentText}/><div><p style={{fontSize:13,fontWeight:600,color:C.navy,margin:0}}>Weekly Digest</p><p style={{fontSize:11,color:C.textMuted,margin:'2px 0 0'}}>Get your weekly stats summary via email</p></div><div style={{marginLeft:'auto',width:36,height:20,borderRadius:10,background:C.accentText,display:'flex',alignItems:'center',justifyContent:'flex-end',padding:'0 3px'}}><div style={{width:14,height:14,borderRadius:7,background:'#fff'}}/></div></div></div></ModalWrap>);

  const MiniLeaguesModal=()=>{const leagueCode='MO'+Math.floor(Math.random()*9000+1000);return(<ModalWrap title="Mini Leagues" onClose={()=>{setLeagueTab('my');setModal(null);}}><div><TabBar tabs={[{id:'my',label:'My Leagues'},{id:'create',label:'Create'},{id:'join',label:'Join'}]} active={leagueTab} onChange={setLeagueTab}/><div style={{padding:16}}>{leagueTab==='my'&&(miniLeagues.length===0?<div style={{textAlign:'center',padding:32}}><p style={{fontSize:15,color:C.textMuted}}>No leagues yet</p><Btn primary onClick={()=>setLeagueTab('create')} style={{marginTop:12}}>Create League</Btn></div>:miniLeagues.map(league=><div key={league.id} style={{background:C.bgLight,borderRadius:12,padding:16,marginBottom:12,border:`1px solid ${C.border}`}}><div style={{display:'flex',justifyContent:'space-between',alignItems:'start',marginBottom:10}}><div><p style={{fontSize:16,fontWeight:700,color:C.navy,margin:0}}>{league.name}</p><p style={{fontSize:12,color:C.textMuted,margin:'2px 0 0'}}>{league.members} members</p></div><span style={{background:C.accentLight,color:C.accentText,fontSize:10,fontWeight:700,padding:'3px 8px',borderRadius:6}}>#{league.myRank}</span></div><div style={{display:'flex',gap:12}}><div style={{flex:1,background:C.card,borderRadius:8,padding:10,textAlign:'center'}}><p style={{fontSize:10,color:C.textMuted,margin:0}}>Leader</p><p style={{fontSize:13,fontWeight:600,color:C.navy,margin:'2px 0 0'}}>{league.leader}</p></div><div style={{flex:1,background:C.card,borderRadius:8,padding:10,textAlign:'center'}}><p style={{fontSize:10,color:C.textMuted,margin:0}}>Invite Code</p><p style={{fontSize:13,fontWeight:700,color:C.accentText,margin:'2px 0 0',letterSpacing:1}}>{league.code}</p></div></div></div>))}{leagueTab==='create'&&<div><p style={{fontSize:13,color:C.textMuted,marginBottom:16}}>Create a private league and invite friends.</p><label style={{fontSize:12,fontWeight:600,color:C.textMuted,display:'block',marginBottom:6}}>League Name</label><input type="text" value={newLeagueName} onChange={e=>setNewLeagueName(e.target.value)} placeholder="e.g. Office Tennis League" style={{width:'100%',padding:12,fontSize:15,border:`1.5px solid ${C.border}`,borderRadius:10,outline:'none',color:C.navy,background:C.inputBg,boxSizing:'border-box',marginBottom:20}}/><Btn primary full disabled={!newLeagueName} onClick={()=>{setMiniLeagues([...miniLeagues,{id:Date.now(),name:newLeagueName,code:leagueCode,members:1,myRank:1,leader:user.name}]);setNewLeagueName('');setLeagueTab('my');}}>Create League</Btn></div>}{leagueTab==='join'&&<div><p style={{fontSize:13,color:C.textMuted,marginBottom:16}}>Enter an invite code to join a friend's league.</p><label style={{fontSize:12,fontWeight:600,color:C.textMuted,display:'block',marginBottom:6}}>Invite Code</label><input type="text" value={joinCode} onChange={e=>setJoinCode(e.target.value.toUpperCase())} placeholder="e.g. TN2026" style={{width:'100%',padding:12,fontSize:18,fontWeight:700,letterSpacing:4,textAlign:'center',border:`1.5px solid ${C.border}`,borderRadius:10,outline:'none',color:C.navy,background:C.inputBg,boxSizing:'border-box',marginBottom:20}}/><Btn primary full disabled={joinCode.length<4} onClick={()=>{setJoinCode('');setLeagueTab('my');}}>Join League</Btn></div>}</div></div></ModalWrap>);};

  const H2HModal=()=>(<ModalWrap title="Head-to-Head" onClose={()=>{setH2hSelected(null);setModal(null);}}><div style={{padding:16}}><div style={{background:C.bgLight,borderRadius:12,padding:14,marginBottom:16}}><p style={{fontSize:13,color:C.textMid,margin:0,lineHeight:1.5}}>Challenge another player to a private bracket battle.</p></div><p style={{fontSize:13,fontWeight:600,color:C.navy,margin:'0 0 12px',textTransform:'uppercase',letterSpacing:0.5}}>Pick Opponent</p>{rankings.slice(0,10).map(opp=>(<button key={opp.rank} onClick={()=>setH2hSelected(opp)} style={{width:'100%',display:'flex',alignItems:'center',padding:'12px 14px',marginBottom:8,borderRadius:10,border:`1.5px solid ${h2hSelected?.rank===opp.rank?C.accent:C.border}`,background:h2hSelected?.rank===opp.rank?C.accentLight:C.card,cursor:'pointer'}}><span style={{fontSize:14,marginRight:8}}>{opp.flag}</span><div style={{flex:1,textAlign:'left'}}><p style={{fontSize:14,fontWeight:500,color:C.navy,margin:0}}>{opp.name}</p><p style={{fontSize:11,color:C.textMuted,margin:'2px 0 0'}}>Rank #{opp.rank} . {opp.winRate}% win rate</p></div>{h2hSelected?.rank===opp.rank&&<Check size={18} color={C.accentText}/>}</button>))}<Btn primary full disabled={!h2hSelected} onClick={()=>{setH2hOpponent(h2hSelected);setModal(null);}} style={{marginTop:8}}>Challenge {h2hSelected?.name||'...'}</Btn></div></ModalWrap>);

  const RewardsModal=()=>(<ModalWrap title="Rewards & Referral" onClose={()=>setModal(null)}><div style={{padding:16}}><div style={{background:C.headerBg,borderRadius:12,padding:16,marginBottom:16}}><div style={{display:'flex',alignItems:'center',gap:10,marginBottom:8}}><Flame size={22} color="#F97316"/><div><p style={{fontSize:15,fontWeight:700,color:'#fff',margin:0}}>Tournament Streak</p><p style={{fontSize:12,color:'rgba(255,255,255,0.7)',margin:'2px 0 0'}}>Play consecutive tournaments for discounts</p></div></div><div style={{display:'flex',gap:8}}>{[1,2,3,4,5].map(n=><div key={n} style={{flex:1,height:8,borderRadius:4,background:n<=3?'#FCD34D':'rgba(255,255,255,0.2)'}}/>)}</div><p style={{fontSize:12,color:'rgba(255,255,255,0.8)',margin:'8px 0 0'}}>3/5 - 2 more for 20% entry discount!</p></div><div style={{background:C.bgLight,borderRadius:12,padding:16,marginBottom:16,border:`1px solid ${C.border}`}}><div style={{display:'flex',alignItems:'center',gap:10,marginBottom:12}}><Gift size={18} color={C.accentText}/><div><p style={{fontSize:14,fontWeight:700,color:C.navy,margin:0}}>Refer a Friend</p><p style={{fontSize:11,color:C.textMuted,margin:'2px 0 0'}}>Both get $5 bonus when they enter first tournament</p></div></div><div style={{background:C.card,borderRadius:8,padding:12,display:'flex',alignItems:'center',justifyContent:'space-between',border:`1px solid ${C.border}`}}><span style={{fontSize:15,fontWeight:700,color:C.accentText,letterSpacing:2}}>ACEMASTER2026</span><button style={{padding:'6px 12px',borderRadius:6,background:C.accent,border:'none',cursor:'pointer'}}><span style={{fontSize:12,fontWeight:600,color:'#fff'}}>Copy</span></button></div></div><div style={{background:C.bgLight,borderRadius:12,padding:16,border:`1px solid ${C.border}`}}><p style={{fontSize:14,fontWeight:700,color:C.navy,margin:'0 0 12px'}}>Free vs Paid Brackets</p><div style={{display:'flex',gap:10}}>{[{label:'Free',lines:['Points only','No prize pool','Unlimited entries'],color:C.green,icon:'FREE'},{label:'Paid',lines:['Entry fee','Real prize pool',`Max ${MAX_BRACKETS_PER_TOURNAMENT} per event`],color:C.accentText,icon:'💰'}].map(t=>(<div key={t.label} style={{flex:1,background:C.card,borderRadius:10,padding:14,border:`1px solid ${C.border}`,textAlign:'center'}}><span style={{fontSize:24}}>{t.icon}</span><p style={{fontSize:14,fontWeight:700,color:t.color,margin:'6px 0 4px'}}>{t.label}</p>{t.lines.map((l,idx)=><p key={idx} style={{fontSize:11,color:C.textMuted,margin:'2px 0'}}>{l}</p>)}</div>))}</div></div></div></ModalWrap>);

  const LiveCommentaryModal=()=>(<ModalWrap title="Live Bracket Commentary" onClose={()=>setModal(null)}><div style={{padding:16}}><div style={{background:C.bgLight,borderRadius:12,padding:12,marginBottom:16,display:'flex',alignItems:'center',gap:10}}><div style={{width:8,height:8,borderRadius:4,background:C.red}}/><span style={{fontSize:13,fontWeight:600,color:C.navy}}>Live updates for your Indian Wells bracket</span></div>{liveCommentary.map(ev=>{const cols={pick_correct:C.green,pick_wrong:C.red,bh_alive:C.orange},icons={pick_correct:'V',pick_wrong:'X',bh_alive:'🐴'},col=cols[ev.type]||C.textMid;return(<div key={ev.id} style={{display:'flex',gap:12,padding:'12px 0',borderBottom:`1px solid ${C.border}`}}><div style={{width:36,height:36,borderRadius:18,background:`${col}18`,display:'flex',alignItems:'center',justifyContent:'center',flexShrink:0}}><span style={{fontSize:16,fontWeight:700,color:col}}>{icons[ev.type]}</span></div><div style={{flex:1}}><p style={{fontSize:13,color:C.navy,margin:'0 0 4px',lineHeight:1.4}}>{ev.msg}</p><div style={{display:'flex',gap:8,alignItems:'center'}}><span style={{fontSize:11,color:C.textMuted}}>{ev.round}</span>{ev.pts>0&&<span style={{fontSize:11,fontWeight:700,color:C.green,background:C.greenLight,padding:'1px 6px',borderRadius:4}}>+{ev.pts} pts</span>}<span style={{fontSize:10,color:C.textMuted,marginLeft:'auto'}}>{ev.time} ago</span></div></div></div>);})}</div></ModalWrap>);

  const WhatIfModal=()=>{const bracket=myBrackets[0];if(!bracket)return(<ModalWrap title="What If Simulator" onClose={()=>setModal(null)}><div style={{padding:32,textAlign:'center'}}><p style={{color:C.textMuted}}>Submit a bracket first.</p></div></ModalWrap>);const scenarios=[{label:'You picked Alcaraz',actual:'Sinner won',ptsYou:47,ptsBest:89,rankYou:127,rankBest:12,diff:-42},{label:'Fritz in QF (your pick)',actual:'Zverev advanced',ptsYou:47,ptsAlt:55,rankYou:127,rankAlt:68,diff:-8},{label:'Medvedev as BH',actual:'Best BH was Bublik',ptsYou:47,ptsAlt:62,rankYou:127,rankAlt:45,diff:-15}];return(<ModalWrap title="What If Simulator" onClose={()=>setModal(null)}><div style={{padding:16}}><div style={{background:C.headerBg,borderRadius:12,padding:16,marginBottom:20}}><p style={{fontSize:12,color:'rgba(255,255,255,0.7)',margin:'0 0 4px'}}>Your bracket: {bracket.name||'My Bracket'}</p><div style={{display:'flex',gap:20}}><div><p style={{fontSize:11,color:'rgba(255,255,255,0.6)',margin:'0 0 2px'}}>Score</p><p style={{fontSize:24,fontWeight:800,color:'#fff',margin:0}}>{bracket.points} pts</p></div><div><p style={{fontSize:11,color:'rgba(255,255,255,0.6)',margin:'0 0 2px'}}>Rank</p><p style={{fontSize:24,fontWeight:800,color:'#fff',margin:0}}>#{bracket.position||127}</p></div><div><p style={{fontSize:11,color:'rgba(255,255,255,0.6)',margin:'0 0 2px'}}>Max Possible</p><p style={{fontSize:24,fontWeight:800,color:'#FCD34D',margin:0}}>89 pts</p></div></div></div>{scenarios.map((sc,i)=>(<div key={i} style={{background:C.bgLight,borderRadius:12,padding:14,marginBottom:12,border:`1px solid ${C.border}`}}><div style={{display:'flex',justifyContent:'space-between',marginBottom:10}}><div style={{flex:1}}><p style={{fontSize:12,color:C.textMuted,margin:'0 0 3px'}}>Your pick</p><p style={{fontSize:14,fontWeight:600,color:C.navy,margin:0}}>{sc.label}</p></div><div style={{textAlign:'right'}}><p style={{fontSize:12,color:C.textMuted,margin:'0 0 3px'}}>What happened</p><p style={{fontSize:13,color:C.red,margin:0}}>{sc.actual}</p></div></div><div style={{display:'flex',gap:10}}><div style={{flex:1,background:C.card,borderRadius:8,padding:10,textAlign:'center',border:`1px solid ${C.border}`}}><p style={{fontSize:10,color:C.textMuted,margin:'0 0 3px'}}>Your Result</p><p style={{fontSize:16,fontWeight:700,color:C.navy,margin:'0 0 2px'}}>{sc.ptsYou} pts</p><p style={{fontSize:11,color:C.textMuted}}>Rank #{sc.rankYou}</p></div><div style={{display:'flex',alignItems:'center',paddingBottom:16}}><span style={{fontSize:18,color:C.red}}>-{Math.abs(sc.diff)}</span></div><div style={{flex:1,background:`${C.green}10`,borderRadius:8,padding:10,textAlign:'center',border:`1px solid ${C.green}40`}}><p style={{fontSize:10,color:C.textMuted,margin:'0 0 3px'}}>Best Pick</p><p style={{fontSize:16,fontWeight:700,color:C.green,margin:'0 0 2px'}}>{sc.ptsAlt||sc.ptsBest} pts</p><p style={{fontSize:11,color:C.textMuted}}>Rank #{sc.rankAlt||sc.rankBest}</p></div></div></div>))}</div></ModalWrap>);};

  const AIBuilderModal=()=>{
    const [loading,setLoading]=React.useState(false);
    const [result,setResult]=React.useState(null);
    const surface=activeTournament?.surface||'Hard';
    const tournament=activeTournament?.name||'Indian Wells';

    const strategies={
      Hard:{
        champions:[
          {name:'J. Sinner',reason:'81% hard court win rate this season. Dominant baseline game and exceptional return stats. Currently world #2 and in peak form.'},
          {name:'C. Alcaraz',reason:'78% hard court win rate. Explosive all-court game and elite mentality. Won this tournament before  -  knows how to go deep.'},
          {name:'N. Djokovic',reason:'76% hard court rate but unmatched experience in big moments. When motivated, nearly unbeatable on hard courts.'},
        ],
        blackHorses:[
          {name:'D. Medvedev',reason:'Hard court specialist with 79% win rate. Seed 11 means easier early draw. Capable of beating anyone on his day.'},
          {name:'T. Fritz',reason:'63% hard court rate but dangerous home favourite energy. American crowd could push him deep into the draw.'},
          {name:'A. de Minaur',reason:'74% hard court rate, incredible speed and retrieval. Can frustrate higher seeds and grind out unexpected wins.'},
        ],
        upsets:[
          {match:'A. Zverev vs D. Medvedev',pick:'D. Medvedev',reason:'Medvedev hard court game is built for this surface. Zverev has historically struggled against his baseline game.'},
          {match:'C. Ruud vs T. Fritz',pick:'T. Fritz',reason:'Fritz is a hard court natural. Ruud clay-heavy game can struggle when transition to faster surfaces is abrupt.'},
        ],
        tips:['Hard courts reward aggressive returning  -  back players with strong second-serve return stats.','Avoid picking clay specialists deep into hard court draws  -  surface transition is rarely seamless.','Look for players who peaked at recent indoor hard court events  -  momentum carries over.'],
      },
      Clay:{
        champions:[
          {name:'C. Alcaraz',reason:'82% clay win rate  -  arguably the best clay player currently not named Nadal. His topspin forehand is devastating on this surface.'},
          {name:'N. Djokovic',reason:'79% clay rate with extraordinary clay court experience. Reads the high bounce better than anyone in the field.'},
          {name:'A. Zverev',reason:'77% clay rate and has been in superb form on the dirt. His heavy groundstrokes and strong serve translate perfectly.'},
        ],
        blackHorses:[
          {name:'C. Ruud',reason:'79% clay win rate  -  elite clay court player often overlooked. Has the game to go deep and cause major upsets.'},
          {name:'J. Draper',reason:'Versatile game with a 61% clay rate that is rapidly improving. Aggressive style can work on clay when he finds rhythm.'},
          {name:'T. Etcheverry',reason:'South American clay specialist who thrives on slow surfaces. Could be a banana peel for seeded opponents early on.'},
        ],
        upsets:[
          {match:'D. Medvedev vs C. Ruud',pick:'C. Ruud',reason:'Medvedev notoriously struggles on clay at 61%  -  Ruud at 79% is in his element. Tactical mismatch favours Ruud.'},
          {match:'T. Fritz vs J. Lehecka',pick:'J. Lehecka',reason:'Fritz hard court game does not fully translate to clay. Lehecka is more comfortable on the dirt with a strong serve.'},
        ],
        tips:['Clay rewards consistency  -  back players with high first-serve percentages and strong topspin.','Physical fitness matters more on clay  -  longer rallies favour conditioned athletes.','Watch for hard court specialists to exit earlier than their seedings suggest.'],
      },
      Grass:{
        champions:[
          {name:'N. Djokovic',reason:'85% grass win rate  -  the greatest grass court player of his generation. Flat ball, low bounce, aggressive net approach all suit him perfectly.'},
          {name:'C. Alcaraz',reason:'71% grass rate and a Wimbledon champion. His serve-and-volley evolution makes him a genuine threat on fast surfaces.'},
          {name:'T. Fritz',reason:'63% grass rate but serves huge and volleys well. Grass rewards the kind of aggressive game Fritz brings.'},
        ],
        blackHorses:[
          {name:'J. Draper',reason:'69% grass win rate  -  grew up on British grass. Aggressive slice backhand is a genuine weapon on this surface.'},
          {name:'L. Tien',reason:'Young serve-and-volleyer who has looked sharp on grass. Big serve could carry him past higher seeds.'},
          {name:'B. Nakashima',reason:'Smooth, flat ball-striking suits the low bounce on grass. Could surprise players who struggle to generate topspin.'},
        ],
        upsets:[
          {match:'C. Ruud vs J. Draper',pick:'J. Draper',reason:'Ruud 44% grass win rate is well below average. Draper at 69% is in his element on British grass.'},
          {match:'A. Zverev vs T. Fritz',pick:'T. Fritz',reason:'Fritz flat, aggressive game is tailor-made for grass. Zverev sometimes struggles with the lower bounce.'},
        ],
        tips:['Grass rewards big servers  -  track players with 70%+ first serve points won.','Net approaches matter  -  back players who volley well and can shorten points.','First week on grass is always chaotic  -  clay specialists often exit in rounds 1-2.'],
      },
    };

    const generate=()=>{
      setLoading(true);
      setResult(null);
      // Simulate AI thinking time
      setTimeout(()=>{
        const s=strategies[surface]||strategies.Hard;
        const champIdx=Math.floor(Math.random()*s.champions.length);
        const bhIdx=Math.floor(Math.random()*s.blackHorses.length);
        const upsetIdx=Math.floor(Math.random()*s.upsets.length);
        const tipIdx=Math.floor(Math.random()*s.tips.length);
        setResult({
          champion:s.champions[champIdx],
          blackHorse:s.blackHorses[bhIdx],
          keyUpset:s.upsets[upsetIdx],
          surfaceTip:s.tips[tipIdx],
        });
        setLoading(false);
      },1800);
    };

    return(
      <ModalWrap title="AI Bracket Builder" onClose={()=>setModal(null)}>
        <div style={{padding:16}}>
          <div style={{background:C.headerBg,borderRadius:12,padding:16,marginBottom:16,textAlign:'center'}}>
            <div style={{marginBottom:8}}><Bot size={36} color="#fff"/></div>
            <p style={{fontSize:15,fontWeight:700,color:'#fff',margin:'0 0 2px'}}>AI Bracket Strategy</p>
            <p style={{fontSize:12,color:'rgba(255,255,255,0.7)',margin:0}}>Powered by Claude . {tournament} . {surface}</p>
          </div>

          {!result&&!loading&&(
            <>
              <div style={{background:C.bgLight,borderRadius:12,padding:14,marginBottom:16}}>
                <p style={{fontSize:13,color:C.textMid,margin:0,lineHeight:1.6}}>
                  Analyzes current form, surface win rates, seedings and head-to-head records to recommend your champion, Black Horse, and a key upset pick.
                </p>
              </div>
              <Btn primary full onClick={generate}>Generate AI Strategy</Btn>
            </>
          )}

          {loading&&(
            <div style={{textAlign:'center',padding:48}}>
              <div style={{width:48,height:48,borderRadius:24,border:`3px solid ${C.accent}`,borderTopColor:'transparent',margin:'0 auto 16px',animation:'spin 0.8s linear infinite'}}/>
              <p style={{fontSize:14,color:C.textMuted,margin:0}}>Analyzing {tournament} draw...</p>
            </div>
          )}

          {result&&!loading&&(
            <div>
              {result.champion&&(
                <div style={{background:`${C.green}10`,border:`1px solid ${C.green}40`,borderRadius:12,padding:14,marginBottom:10}}>
                  <div style={{display:'flex',alignItems:'center',gap:8,marginBottom:6}}>
                    <Trophy size={18} color={C.green}/>
                    <span style={{fontSize:11,fontWeight:700,color:C.green,textTransform:'uppercase',letterSpacing:0.5}}>Champion Pick</span>
                  </div>
                  <p style={{fontSize:18,fontWeight:800,color:C.navy,margin:'0 0 5px'}}>{result.champion.name}</p>
                  <p style={{fontSize:12,color:C.textMid,margin:0,lineHeight:1.5}}>{result.champion.reason}</p>
                </div>
              )}
              {result.blackHorse&&(
                <div style={{background:`${C.orange}10`,border:`1px solid ${C.orange}40`,borderRadius:12,padding:14,marginBottom:10}}>
                  <div style={{display:'flex',alignItems:'center',gap:8,marginBottom:6}}>
                    <Shield size={18} color={C.orange}/>
                    <span style={{fontSize:11,fontWeight:700,color:C.orange,textTransform:'uppercase',letterSpacing:0.5}}>Black Horse <span style={{fontSize:10,opacity:0.8}}>1.5x pts</span></span>
                  </div>
                  <p style={{fontSize:18,fontWeight:800,color:C.navy,margin:'0 0 5px'}}>{result.blackHorse.name}</p>
                  <p style={{fontSize:12,color:C.textMid,margin:0,lineHeight:1.5}}>{result.blackHorse.reason}</p>
                </div>
              )}
              {result.keyUpset&&(
                <div style={{background:`${C.accent}08`,border:`1px solid ${C.accent}30`,borderRadius:12,padding:14,marginBottom:10}}>
                  <div style={{display:'flex',alignItems:'center',gap:8,marginBottom:6}}>
                    <Zap size={18} color={C.accentText}/>
                    <span style={{fontSize:11,fontWeight:700,color:C.accentText,textTransform:'uppercase',letterSpacing:0.5}}>Key Upset to Watch</span>
                  </div>
                  <p style={{fontSize:11,color:C.textMuted,margin:'0 0 3px'}}>{result.keyUpset.match}</p>
                  <p style={{fontSize:16,fontWeight:700,color:C.navy,margin:'0 0 5px'}}>Pick: {result.keyUpset.pick}</p>
                  <p style={{fontSize:12,color:C.textMid,margin:0,lineHeight:1.5}}>{result.keyUpset.reason}</p>
                </div>
              )}
              {result.surfaceTip&&(
                <div style={{background:C.bgLight,borderRadius:12,padding:14,marginBottom:16}}>
                  <p style={{fontSize:11,fontWeight:700,color:C.textMuted,margin:'0 0 6px',textTransform:'uppercase',letterSpacing:0.5}}>{surface} Court Tip</p>
                  <p style={{fontSize:13,color:C.textMid,margin:0,lineHeight:1.5}}>{result.surfaceTip}</p>
                </div>
              )}
              <div style={{display:'flex',gap:10}}>
                <Btn onClick={generate} style={{flex:1}}>Regenerate Regenerate</Btn>
                <Btn primary onClick={()=>setModal(null)} style={{flex:2}}>Apply Strategy</Btn>
              </div>
            </div>
          )}
        </div>
      </ModalWrap>
    );
  };
  const ProfileModal=()=>(<ModalWrap title="My Profile" onClose={()=>setModal(null)}><div style={{padding:20}}><div style={{textAlign:'center',marginBottom:24}}><div style={{width:80,height:80,borderRadius:40,background:C.accentLight,display:'flex',alignItems:'center',justifyContent:'center',margin:'0 auto 12px',fontSize:32,fontWeight:600,color:C.accentText}}>{user.name[0]}</div><h3 style={{fontSize:22,fontWeight:700,color:C.navy,margin:0}}>{user.name}</h3><p style={{fontSize:14,color:C.accentText,margin:'4px 0'}}>Rank #{user.rank}</p></div><div style={{display:'grid',gridTemplateColumns:'repeat(2,1fr)',gap:12,marginBottom:24}}>{[['Win Rate',`${user.win}%`,C.green],['Earnings',`$${user.earn.toLocaleString('en-US')}`,C.accentText],['Brackets',user.brackets,C.navy],['Balance',`$${balance.toLocaleString('en-US')}`,C.navy]].map(([l,v,col])=>(<div key={l} style={{background:C.bgLight,borderRadius:10,padding:16,textAlign:'center'}}><p style={{fontSize:11,color:C.textMuted,margin:'0 0 4px'}}>{l}</p><p style={{fontSize:22,fontWeight:700,color:col,margin:0}}>{v}</p></div>))}</div><div style={{background:C.bgLight,borderRadius:12,padding:16,marginBottom:16}}><div style={{display:'flex',alignItems:'center',gap:8,marginBottom:12}}>{isDark?<Moon size={16} color={C.accentText}/>:<Sun size={16} color={C.orange}/>}<p style={{fontSize:14,fontWeight:600,color:C.navy,margin:0}}>Appearance</p></div><div style={{display:'grid',gridTemplateColumns:'repeat(3,1fr)',gap:8}}>{[{id:'system',label:'System'},{id:'light',label:'Light'},{id:'dark',label:'Dark'}].map(opt=>(<button key={opt.id} onClick={()=>{setThemeMode(opt.id);if(opt.id==='light')setIsDark(false);else if(opt.id==='dark')setIsDark(true);else setIsDark(window.matchMedia('(prefers-color-scheme: dark)').matches);}} style={{display:'flex',flexDirection:'column',alignItems:'center',gap:5,padding:'10px 8px',borderRadius:10,border:`1.5px solid ${themeMode===opt.id?C.accent:C.border}`,background:themeMode===opt.id?C.accent:C.card,cursor:'pointer'}}><span style={{fontSize:12,fontWeight:600,color:themeMode===opt.id?'#fff':C.textMuted}}>{opt.label}</span></button>))}</div></div><div style={{display:'flex',flexDirection:'column',gap:10}}><Btn full onClick={()=>setModal('stats')}><BarChart2 size={18}/> My Stats</Btn><Btn full onClick={()=>setModal('achievements')}>Achievements ({achievements.filter(a=>a.earned).length}/{achievements.length})</Btn><Btn full onClick={()=>setModal('challenges')}>Daily Challenges</Btn><Btn full onClick={()=>setModal('leagues')}><Trophy size={18}/> Mini Leagues</Btn><Btn full onClick={()=>setModal('h2h')}>Head-to-Head</Btn><Btn full onClick={()=>setModal('rewards')}>Rewards & Referral</Btn><Btn full onClick={()=>setModal('freeroll')}>Freeroll Tournaments</Btn><Btn full onClick={()=>setModal('cashback')}>Cashback - {cashbackData.tier} ({(cashbackData.cashbackRate*100).toFixed(0)}%)</Btn><Btn full onClick={()=>setModal('whatif')}>What If Simulator</Btn><Btn full onClick={()=>{setAiSuggestion(null);setAiLoading(false);setModal('aibuilder');}}>AI Bracket Builder</Btn><Btn full onClick={()=>setModal('commentary')}>Live Commentary</Btn><Btn full onClick={()=>setModal('notifications')}>Notifications {unreadCount>0&&<span style={{background:C.red,color:'#fff',borderRadius:10,padding:'1px 7px',fontSize:11,fontWeight:700,marginLeft:6}}>{unreadCount}</span>}</Btn><button onClick={()=>{setIsLoggedIn(false);setModal(null);}} style={{width:'100%',padding:14,borderRadius:10,border:`1px solid ${C.red}`,background:'transparent',color:C.red,fontSize:15,fontWeight:600,cursor:'pointer',display:'flex',alignItems:'center',justifyContent:'center',gap:8}}><LogIn size={18}/> Sign Out</button></div></div></ModalWrap>);

  // -- SOCIAL MODAL  -  comments + reactions ------------------------------------
  const SocialModal=()=>{
    const addReaction=(emoji)=>{setBracketReactions(prev=>({...prev,[emoji]:(prev[emoji]||0)+1}));};
    const submitComment=()=>{if(!newComment.trim())return;setComments(prev=>[{id:Date.now(),user:'AceMaster',flag:'🇺🇸',text:newComment.trim(),time:'just now',likes:0,liked:false},...prev]);setNewComment('');};
    const toggleLike=(id)=>setComments(prev=>prev.map(c=>c.id===id?{...c,liked:!c.liked,likes:c.liked?c.likes-1:c.likes+1}:c));
    return(
      <ModalWrap title="Bracket Social" onClose={()=>setModal(null)} full>
        <div style={{display:'flex',flexDirection:'column',height:'100%'}}>
          {/* Reactions row */}
          <div style={{padding:'14px 16px',borderBottom:`1px solid ${C.border}`,background:C.card}}>
            <p style={{fontSize:11,fontWeight:700,color:C.textMuted,margin:'0 0 10px',letterSpacing:0.5,textTransform:'uppercase'}}>Reactions</p>
            <div style={{display:'flex',gap:10,flexWrap:'wrap'}}>
              {REACTIONS.map(emoji=>(
                <button key={emoji} onClick={()=>addReaction(emoji)} style={{display:'flex',alignItems:'center',gap:5,padding:'8px 14px',borderRadius:20,background:bracketReactions[emoji]?`${C.accent}15`:C.bgLight,border:`1px solid ${bracketReactions[emoji]?C.accent:C.border}`,cursor:'pointer'}}>
                  <span style={{fontSize:20}}>{emoji}</span>
                  {bracketReactions[emoji]>0&&<span style={{fontSize:13,fontWeight:700,color:C.accentText}}>{bracketReactions[emoji]}</span>}
                </button>
              ))}
            </div>
          </div>
          {/* Comments list */}
          <div style={{flex:1,overflow:'auto',padding:'12px 16px'}}>
            <p style={{fontSize:11,fontWeight:700,color:C.textMuted,margin:'0 0 12px',letterSpacing:0.5,textTransform:'uppercase'}}>{comments.length} Comments</p>
            {comments.map(c=>(
              <div key={c.id} style={{display:'flex',gap:10,marginBottom:16}}>
                <button onClick={()=>{setPublicProfile(c);setModal('publicprofile');}} style={{width:36,height:36,borderRadius:18,background:C.accentLight,display:'flex',alignItems:'center',justifyContent:'center',flexShrink:0,border:'none',cursor:'pointer'}}>
                  <span style={{fontSize:15,fontWeight:700,color:C.accentText}}>{c.user[0]}</span>
                </button>
                <div style={{flex:1}}>
                  <div style={{background:C.bgLight,borderRadius:'4px 16px 16px 16px',padding:'10px 14px'}}>
                    <div style={{display:'flex',justifyContent:'space-between',alignItems:'center',marginBottom:4}}>
                      <button onClick={()=>{setPublicProfile(c);setModal('publicprofile');}} style={{background:'none',border:'none',cursor:'pointer',padding:0,display:'flex',alignItems:'center',gap:5}}>
                        <span style={{fontSize:13,fontWeight:700,color:C.navy}}>{c.user}</span>
                        <span style={{fontSize:13}}>{c.flag}</span>
                      </button>
                      <span style={{fontSize:11,color:C.textMuted}}>{c.time}</span>
                    </div>
                    <p style={{fontSize:14,color:C.textMid,margin:0,lineHeight:1.45}}>{c.text}</p>
                  </div>
                  <button onClick={()=>toggleLike(c.id)} style={{background:'none',border:'none',cursor:'pointer',padding:'4px 6px',display:'flex',alignItems:'center',gap:4,marginTop:2}}>
                    <span style={{fontSize:14}}>{c.liked?'heart':'heart'}</span>
                    <span style={{fontSize:12,fontWeight:c.liked?700:400,color:c.liked?C.red:C.textMuted}}>{c.likes}</span>
                  </button>
                </div>
              </div>
            ))}
          </div>
          {/* Comment input  -  pinned to bottom */}
          <div style={{padding:'12px 16px',paddingBottom:20,borderTop:`1px solid ${C.border}`,background:C.card,display:'flex',gap:10,alignItems:'flex-end'}}>
            <div style={{width:34,height:34,borderRadius:17,background:C.accentLight,display:'flex',alignItems:'center',justifyContent:'center',flexShrink:0}}>
              <span style={{fontSize:14,fontWeight:700,color:C.accentText}}>A</span>
            </div>
            <div style={{flex:1,background:C.bgLight,borderRadius:20,border:`1px solid ${C.border}`,padding:'8px 14px',display:'flex',alignItems:'center',gap:8}}>
              <input
                value={newComment}
                onChange={e=>setNewComment(e.target.value)}
                onKeyDown={e=>e.key==='Enter'&&submitComment()}
                placeholder="Add a comment..."
                style={{flex:1,background:'none',border:'none',outline:'none',fontSize:14,color:C.navy}}
              />
              {newComment.trim()&&(
                <button onClick={submitComment} style={{background:'none',border:'none',cursor:'pointer',padding:0}}>
                  <div style={{width:28,height:28,borderRadius:14,background:C.accent,display:'flex',alignItems:'center',justifyContent:'center'}}>
                    <svg width="14" height="14" viewBox="0 0 24 24" fill="#fff"><path d="M2 21L23 12 2 3v7l15 2-15 2z"/></svg>
                  </div>
                </button>
              )}
            </div>
          </div>
        </div>
      </ModalWrap>
    );
  };

  // -- PUBLIC PROFILE MODAL -------------------------------------------------
  const PublicProfileModal=()=>{
    if(!publicProfile)return null;
    const stats={rank:Math.floor(Math.random()*200)+1,winRate:Math.floor(Math.random()*30)+55,brackets:Math.floor(Math.random()*40)+5,earnings:Math.floor(Math.random()*10000)+500,streak:Math.floor(Math.random()*8)+1};
    const recentBrackets=[{t:'Indian Wells',pos:127,pts:47,result:'active'},{t:'Dubai',pos:3,pts:89,result:'won'},{t:'Australian Open',pos:44,pts:71,result:'finished'}];
    return(
      <ModalWrap title="Player Profile" onClose={()=>setModal(null)} full>
        <div>
          {/* Hero */}
          <div style={{background:C.headerBg,padding:'24px 20px 20px',textAlign:'center'}}>
            <div style={{width:72,height:72,borderRadius:36,background:'rgba(255,255,255,0.15)',border:'2px solid rgba(255,255,255,0.4)',display:'flex',alignItems:'center',justifyContent:'center',margin:'0 auto 12px',fontSize:28,fontWeight:800,color:'#fff'}}>
              {publicProfile.user[0]}
            </div>
            <p style={{fontSize:20,fontWeight:800,color:'#fff',margin:'0 0 2px'}}>{publicProfile.user}</p>
            <p style={{fontSize:16,margin:'0 0 12px'}}>{publicProfile.flag}</p>
            <div style={{display:'inline-flex',alignItems:'center',gap:6,background:'rgba(255,255,255,0.12)',borderRadius:20,padding:'5px 14px'}}>
              <Trophy size={13} color="#FCD34D"/>
              <span style={{fontSize:13,fontWeight:700,color:'#FCD34D'}}>Rank #{stats.rank}</span>
            </div>
          </div>
          {/* Stats grid */}
          <div style={{display:'grid',gridTemplateColumns:'repeat(3,1fr)',gap:1,background:C.border,margin:'1px 0'}}>
            {[['Win Rate',`${stats.winRate}%`,C.green],['Brackets',stats.brackets,C.navy],['Earnings',`$${stats.earnings.toLocaleString('en-US')}`,C.accentText]].map(([l,v,col])=>(
              <div key={l} style={{background:C.card,padding:'16px 8px',textAlign:'center'}}>
                <p style={{fontSize:20,fontWeight:800,color:col,margin:'0 0 3px'}}>{v}</p>
                <p style={{fontSize:10,color:C.textMuted,margin:0,textTransform:'uppercase',letterSpacing:0.4}}>{l}</p>
              </div>
            ))}
          </div>
          {/* Streak */}
          <div style={{padding:'14px 16px',borderBottom:`1px solid ${C.border}`,display:'flex',alignItems:'center',gap:10}}>
            <Flame size={20} color={C.orange}/>
            <span style={{fontSize:14,fontWeight:600,color:C.navy}}>{stats.streak} tournament streak</span>
            <div style={{marginLeft:'auto',display:'flex',gap:4}}>
              {Array.from({length:7},(_,i)=><div key={i} style={{width:10,height:10,borderRadius:5,background:i<stats.streak?C.orange:C.border}}/>)}
            </div>
          </div>
          {/* Recent brackets */}
          <div style={{padding:16}}>
            <p style={{fontSize:12,fontWeight:700,color:C.textMuted,margin:'0 0 12px',letterSpacing:0.5,textTransform:'uppercase'}}>Recent Brackets</p>
            {recentBrackets.map((b,i)=>(
              <div key={i} style={{display:'flex',alignItems:'center',padding:'12px 0',borderBottom:i<recentBrackets.length-1?`1px solid ${C.border}`:'none'}}>
                <div style={{flex:1}}>
                  <p style={{fontSize:14,fontWeight:600,color:C.navy,margin:'0 0 2px'}}>{b.t}</p>
                  <p style={{fontSize:12,color:C.textMuted,margin:0}}>{b.pts} pts . #{b.pos}</p>
                </div>
                <span style={{fontSize:11,fontWeight:700,padding:'3px 10px',borderRadius:20,background:b.result==='won'?C.greenLight:b.result==='active'?`${C.accent}15`:C.bgLight,color:b.result==='won'?C.green:b.result==='active'?C.accentText:C.textMuted}}>
                  {b.result==='won'?'🏆 Won':b.result==='active'?'* Active':'Finished'}
                </span>
              </div>
            ))}
          </div>
          <div style={{padding:'0 16px 20px'}}>
            <Btn full onClick={()=>setModal('h2h')}>vs Challenge to H2H</Btn>
          </div>
        </div>
      </ModalWrap>
    );
  };

    const LeaderboardModal=()=>{if(!leaderboardBracket)return null;const total=leaderboardBracket.tournament.entries||2156,me=mockLeaderboard.find(p=>p.isYou);return(<ModalWrap title={`${leaderboardBracket.tournament.name} - Leaderboard`} onClose={()=>setLeaderboardBracket(null)} full><div><div style={{background:C.headerBg,padding:'16px 20px'}}><div style={{display:'flex',alignItems:'center',justifyContent:'space-between'}}><div><p style={{fontSize:11,color:'rgba(255,255,255,0.7)',margin:'0 0 4px',textTransform:'uppercase',letterSpacing:0.5}}>Your Position</p><div style={{display:'flex',alignItems:'baseline',gap:6}}><span style={{fontSize:32,fontWeight:800,color:'#fff'}}>#{me?.rank||leaderboardBracket.position}</span><span style={{fontSize:14,color:'rgba(255,255,255,0.6)'}}>/ {total.toLocaleString('en-US')}</span></div></div><div style={{textAlign:'right'}}><p style={{fontSize:11,color:'rgba(255,255,255,0.7)',margin:'0 0 4px'}}>Points</p><span style={{fontSize:28,fontWeight:700,color:'#FCD34D'}}>{me?.pts||leaderboardBracket.points}</span></div></div>{me&&<div style={{display:'flex',gap:6,marginTop:12}}>{[['R128',me.r128],['R64',me.r64],['R32',me.r32],['R16',me.r16],['QF',me.qf]].map(([rnd,pts])=>(<div key={rnd} style={{flex:1,background:'rgba(255,255,255,0.12)',borderRadius:6,padding:'6px 4px',textAlign:'center'}}><p style={{fontSize:9,color:'rgba(255,255,255,0.6)',margin:'0 0 2px'}}>{rnd}</p><p style={{fontSize:13,fontWeight:700,color:'#fff',margin:0}}>{pts}</p></div>))}</div>}</div><div style={{paddingBottom:20}}>{mockLeaderboard.filter(p=>p.rank<=10).map(p=>{const ch=p.prevRank-p.rank;return(<div key={p.rank} style={{display:'flex',alignItems:'center',padding:'12px 16px',borderBottom:`1px solid ${C.border}`,background:p.isYou?`${C.accent}10`:C.card}}><span style={{width:44,fontSize:14,fontWeight:700,color:p.rank<=3?C.orange:C.navy}}>{p.rank===1?'1st':p.rank===2?'2nd':p.rank===3?'3rd':p.rank}</span><div style={{flex:1,display:'flex',alignItems:'center',gap:8}}><span style={{fontSize:15}}>{p.flag}</span><div><p style={{fontSize:14,fontWeight:p.isYou?700:500,color:p.isYou?C.accentText:C.navy,margin:0}}>{p.name}{p.isYou&&<span style={{fontSize:10}}> (You)</span>}</p></div></div><div style={{width:36,display:'flex',justifyContent:'center'}}>{ch>0?<span style={{fontSize:11,fontWeight:600,color:C.green,display:'flex',alignItems:'center',gap:1}}><ArrowUp size={11}/>{ch}</span>:ch<0?<span style={{fontSize:11,fontWeight:600,color:C.red,display:'flex',alignItems:'center',gap:1}}><ArrowDown size={11}/>{Math.abs(ch)}</span>:<span style={{fontSize:11,color:C.textMuted}}>-</span>}</div><span style={{width:48,fontSize:14,fontWeight:700,color:C.navy,textAlign:'right'}}>{p.pts}</span></div>);})}<div style={{display:'flex',alignItems:'center',padding:'8px 16px',gap:8}}><div style={{flex:1,height:1,background:C.border}}/><span style={{fontSize:11,color:C.textMuted}}>...</span><div style={{flex:1,height:1,background:C.border}}/></div>{mockLeaderboard.filter(p=>p.rank>=120&&p.rank<=135).map(p=>{const ch=p.prevRank-p.rank;return(<div key={p.rank} style={{display:'flex',alignItems:'center',padding:'12px 16px',borderBottom:`1px solid ${C.border}`,background:p.isYou?`${C.accent}14`:C.card,borderLeft:p.isYou?`3px solid ${C.accent}`:'3px solid transparent'}}><span style={{width:44,fontSize:14,fontWeight:600,color:p.isYou?C.accentText:C.navy}}>{p.rank}</span><div style={{flex:1,display:'flex',alignItems:'center',gap:8}}><span style={{fontSize:15}}>{p.flag}</span><p style={{fontSize:14,fontWeight:p.isYou?700:500,color:p.isYou?C.accentText:C.navy,margin:0}}>{p.name}{p.isYou&&<span style={{fontSize:10}}> You</span>}</p></div><div style={{width:36,display:'flex',justifyContent:'center'}}>{ch>0?<span style={{fontSize:11,fontWeight:600,color:C.green,display:'flex',alignItems:'center',gap:1}}><ArrowUp size={11}/>{ch}</span>:ch<0?<span style={{fontSize:11,fontWeight:600,color:C.red,display:'flex',alignItems:'center',gap:1}}><ArrowDown size={11}/>{Math.abs(ch)}</span>:<span style={{fontSize:11,color:C.textMuted}}>-</span>}</div><span style={{width:48,fontSize:14,fontWeight:700,color:p.isYou?C.accentText:C.navy,textAlign:'right'}}>{p.pts}</span></div>);})}</div></div></ModalWrap>);};

  const BracketDetailsModal=()=>{if(!selectedBracket)return null;return(<ModalWrap title="Bracket Details" onClose={()=>setSelectedBracket(null)}><div style={{padding:16}}><div style={{background:C.headerBg,borderRadius:12,padding:16,marginBottom:16}}><h3 style={{fontSize:20,fontWeight:700,color:'#fff',margin:'0 0 4px'}}>{selectedBracket.tournament.name}</h3></div><div style={{background:C.bgLight,borderRadius:12,padding:16,marginBottom:16}}><p style={{fontSize:11,color:C.textMuted,margin:'0 0 10px'}}>YOUR CHAMPION</p><div style={{display:'flex',alignItems:'center',gap:12}}><span style={{fontSize:36}}>{selectedBracket.champion?.flag}</span><div><p style={{fontSize:18,fontWeight:700,color:C.navy,margin:0}}>{selectedBracket.champion?.name}</p></div></div></div><Btn full onClick={()=>setSelectedBracket(null)}>Close</Btn></div></ModalWrap>);};

  const PlayerModal=()=>selPlayer&&(<ModalWrap title="Player Stats" onClose={()=>setSelPlayer(null)}><div style={{padding:16}}><div style={{textAlign:'center',marginBottom:24}}><div style={{width:80,height:80,borderRadius:40,background:C.accentLight,display:'flex',alignItems:'center',justifyContent:'center',margin:'0 auto 16px',fontSize:28,fontWeight:600,color:C.accentText}}>{selPlayer.name[0]}</div><h3 style={{fontSize:22,fontWeight:700,color:C.navy,margin:0}}>{selPlayer.name}</h3><p style={{fontSize:14,color:C.accentText,margin:'4px 0'}}>Rank #{selPlayer.rank}</p><p style={{fontSize:14,color:C.textMuted}}>{selPlayer.flag}</p></div><div style={{display:'grid',gridTemplateColumns:'repeat(2,1fr)',gap:12}}>{[['Points',selPlayer.pts.toLocaleString('en-US'),C.navy],['Win Rate',`${selPlayer.winRate}%`,C.green],['Earnings',`$${selPlayer.earnings?.toLocaleString('en-US')}`,C.accent],['Brackets',selPlayer.played,C.navy]].map(([l,v,col])=>(<div key={l} style={{background:C.bgLight,borderRadius:8,padding:16,textAlign:'center'}}><p style={{fontSize:11,color:C.textMuted,margin:'0 0 4px'}}>{l}</p><p style={{fontSize:20,fontWeight:700,color:col,margin:0}}>{v}</p></div>))}</div></div></ModalWrap>);

  return(<div style={{minHeight:'100vh',background:'#3730A3',fontFamily:'-apple-system,BlinkMacSystemFont,"SF Pro Display","Segoe UI",Roboto,sans-serif'}}><style>{`*{box-sizing:border-box;margin:0;padding:0;}html,body,#root{background:#3730A3;margin:0;padding:0;}::-webkit-scrollbar{width:0;height:0;}@keyframes pulse{0%,100%{opacity:1;}50%{opacity:0.3;}}@keyframes spin{from{transform:rotate(0deg);}to{transform:rotate(360deg);}}@keyframes slideDown{from{opacity:0;transform:translateX(-50%) translateY(-100%);}to{opacity:1;transform:translateX(-50%) translateY(0);}}html{scroll-behavior:auto;}*{-webkit-overflow-scrolling:touch;}`}</style>{showSplash&&<SplashScreen/>}{!showSplash&&showOnboarding&&<OnboardingScreen/>}<div style={{maxWidth:430,margin:'0 auto',minHeight:'100vh',paddingBottom:80,background:C.card,transition:'background 0.3s'}}>{view==='bracket'&&<BracketView/>}{view==='calendar'&&<CalendarView/>}{view==='live'&&<LiveView/>}{view==='rankings'&&<RankingsView/>}{view==='wallet'&&<WalletView/>}<BottomNav/>{modal==='deposit'&&<DepositModal/>}{modal==='withdraw'&&<WithdrawModal/>}{modal==='submit'&&<SubmitModal/>}{modal==='blackhorse'&&<BlackHorseModal/>}{modal==='auth'&&<AuthModal/>}{modal==='profile'&&<ProfileModal/>}{modal==='tiers'&&<TierSelectorModal tournament={activeTournament}/>}{modal==='prizes'&&<PrizesModal/>}{modal==='stats'&&<StatsModal/>}{modal==='leagues'&&<MiniLeaguesModal/>}{modal==='h2h'&&<H2HModal/>}{modal==='rewards'&&<RewardsModal/>}{modal==='achievements'&&<AchievementsModal/>}{modal==='commentary'&&<LiveCommentaryModal/>}{modal==='cashback'&&<CashbackModal/>}{modal==='legal'&&<LegalModal/>}{modal==='help'&&<HelpModal/>}{modal==='freeroll'&&<FreerollModal/>}{modal==='notifications'&&<NotificationsModal/>}{modal==='globalfeed'&&<GlobalFeedModal/>}{modal==='whatif'&&<WhatIfModal/>}{modal==='aibuilder'&&<AIBuilderModal/>}{modal==='challenges'&&<DailyChallengesModal/>}{selectedBracket&&<BracketDetailsModal/>}{selPlayer&&<PlayerModal/>}{leaderboardBracket&&<LeaderboardModal/>}{modal==='social'&&<SocialModal/>}{modal==='publicprofile'&&<PublicProfileModal/>}<WinBanner/><LiveTicker/></div></div>);
}
