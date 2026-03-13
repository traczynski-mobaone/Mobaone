import React, { useState } from 'react';
import { Trophy, Wallet, ChevronRight, ChevronLeft, Target, Search, Bell, ArrowUp, ArrowDown, Home, Radio, BarChart2, User, X, Check, TrendingUp, Plus, CheckCircle, Heart, Calendar, Clock, ChevronDown, LogIn } from 'lucide-react';

// ATP-Style Colors
const colors = {
  gradientStart: '#1E1B4B',
  gradientMid: '#312E81',
  gradientEnd: '#4338CA',
  bg: '#FFFFFF',  // Changed to white
  bgLight: '#F9FAFB', // Light grey for subtle sections
  white: '#FFFFFF',
  navy: '#1E1B4B',
  purple: '#7C3AED',
  purpleLight: '#EDE9FE',
  textDark: '#1F2937',
  textMid: '#4B5563',
  textLight: '#9CA3AF',
  textMuted: '#6B7280',
  green: '#10B981',
  greenLight: '#D1FAE5',
  red: '#EF4444',
  redLight: '#FEE2E2',
  orange: '#F97316',
  border: '#E5E7EB',
};

// Full 128 Draw - Real ATP players for Indian Wells style tournament
// 128 players = 64 matches in R128, no byes
const indianWellsDraw = [
  // Section 1 (1-16) - Alcaraz quarter
  { pos: 1, seed: 1, name: 'C. Alcaraz', flag: '🇪🇸' },
  { pos: 2, seed: null, name: 'T. Atmane', flag: '🇫🇷' },
  { pos: 3, seed: null, name: 'G. Dimitrov', flag: '🇧🇬' },
  { pos: 4, seed: null, name: 'J.M. Cerundolo', flag: '🇦🇷' },
  { pos: 5, seed: null, name: 'B. van de Zandschulp', flag: '🇳🇱' },
  { pos: 6, seed: 26, name: 'A. Rinderknech', flag: '🇫🇷' },
  { pos: 7, seed: 24, name: 'V. Vacherot', flag: '🇲🇨' },
  { pos: 8, seed: null, name: 'N. Borges', flag: '🇵🇹' },
  { pos: 9, seed: null, name: 'E. Nava', flag: '🇺🇸' },
  { pos: 10, seed: null, name: 'A. Shevchenko', flag: '🇰🇿' },
  { pos: 11, seed: null, name: 'S. Shimabukuro', flag: '🇯🇵' },
  { pos: 12, seed: 13, name: 'C. Ruud', flag: '🇳🇴' },
  { pos: 13, seed: 10, name: 'A. Bublik', flag: '🇰🇿' },
  { pos: 14, seed: null, name: 'M. Zheng', flag: '🇨🇳' },
  { pos: 15, seed: null, name: 'V. Kopriva', flag: '🇨🇿' },
  { pos: 16, seed: null, name: 'F. Maestrelli', flag: '🇮🇹' },
  
  // Section 2 (17-32)
  { pos: 17, seed: null, name: 'R. Hijikata', flag: '🇦🇺' },
  { pos: 18, seed: 20, name: 'L. Darderi', flag: '🇮🇹' },
  { pos: 19, seed: 27, name: 'C. Norrie', flag: '🇬🇧' },
  { pos: 20, seed: null, name: 'M. Arnaldi', flag: '🇮🇹' },
  { pos: 21, seed: null, name: 'M. McDonald', flag: '🇺🇸' },
  { pos: 22, seed: null, name: 'S. Korda', flag: '🇺🇸' },
  { pos: 23, seed: null, name: 'F. Comesana', flag: '🇦🇷' },
  { pos: 24, seed: 6, name: 'A. de Minaur', flag: '🇦🇺' },
  { pos: 25, seed: 3, name: 'N. Djokovic', flag: '🇷🇸' },
  { pos: 26, seed: null, name: 'K. Majchrzak', flag: '🇵🇱' },
  { pos: 27, seed: null, name: 'G. Mpetshi Perricard', flag: '🇫🇷' },
  { pos: 28, seed: null, name: 'H. Hurkacz', flag: '🇵🇱' },
  { pos: 29, seed: null, name: 'A. Kovacevic', flag: '🇺🇸' },
  { pos: 30, seed: 31, name: 'C. Moutet', flag: '🇫🇷' },
  { pos: 31, seed: 19, name: 'F. Cerundolo', flag: '🇦🇷' },
  { pos: 32, seed: null, name: 'V. Royer', flag: '🇫🇷' },
  
  // Section 3 (33-48) - Medvedev quarter
  { pos: 33, seed: null, name: 'B. Bonzi', flag: '🇫🇷' },
  { pos: 34, seed: null, name: 'F. Marozsan', flag: '🇭🇺' },
  { pos: 35, seed: null, name: 'R. Bautista Agut', flag: '🇪🇸' },
  { pos: 36, seed: 14, name: 'J. Draper', flag: '🇬🇧' },
  { pos: 37, seed: 11, name: 'D. Medvedev', flag: '🇷🇺' },
  { pos: 38, seed: null, name: 'A. Tabilo', flag: '🇨🇱' },
  { pos: 39, seed: null, name: 'R. Jodar', flag: '🇪🇸' },
  { pos: 40, seed: null, name: 'C. Tseng', flag: '🇹🇼' },
  { pos: 41, seed: null, name: 'S. Baez', flag: '🇦🇷' },
  { pos: 42, seed: 22, name: 'J. Lehecka', flag: '🇨🇿' },
  { pos: 43, seed: 32, name: 'U. Humbert', flag: '🇫🇷' },
  { pos: 44, seed: null, name: 'D. Merida', flag: '🇪🇸' },
  { pos: 45, seed: null, name: 'A. Michelsen', flag: '🇺🇸' },
  { pos: 46, seed: null, name: 'J. Fearnley', flag: '🇬🇧' },
  { pos: 47, seed: null, name: 'D. Dzumhur', flag: '🇧🇦' },
  { pos: 48, seed: 7, name: 'T. Fritz', flag: '🇺🇸' },
  
  // Section 4 (49-64)
  { pos: 49, seed: 5, name: 'L. Musetti', flag: '🇮🇹' },
  { pos: 50, seed: null, name: 'M. Fucsovics', flag: '🇭🇺' },
  { pos: 51, seed: null, name: 'C. O\'Connell', flag: '🇦🇺' },
  { pos: 52, seed: null, name: 'D. Prizmic', flag: '🇭🇷' },
  { pos: 53, seed: null, name: 'T. Schoolkate', flag: '🇦🇺' },
  { pos: 54, seed: 30, name: 'A. Fils', flag: '🇫🇷' },
  { pos: 55, seed: 17, name: 'A. Rublev', flag: '🇷🇺' },
  { pos: 56, seed: null, name: 'M. Bellucci', flag: '🇮🇹' },
  { pos: 57, seed: null, name: 'G. Diallo', flag: '🇨🇦' },
  { pos: 58, seed: null, name: 'G. Monfils', flag: '🇫🇷' },
  { pos: 59, seed: null, name: 'A. Galarneau', flag: '🇨🇦' },
  { pos: 60, seed: 9, name: 'F. Auger-Aliassime', flag: '🇨🇦' },
  { pos: 61, seed: 15, name: 'F. Cobolli', flag: '🇮🇹' },
  { pos: 62, seed: null, name: 'D. Altmaier', flag: '🇩🇪' },
  { pos: 63, seed: null, name: 'M. Kecmanovic', flag: '🇷🇸' },
  { pos: 64, seed: null, name: 'J. Brooksby', flag: '🇺🇸' },
  
  // Section 5 (65-80) - Zverev quarter
  { pos: 65, seed: null, name: 'A. Popyrin', flag: '🇦🇺' },
  { pos: 66, seed: 21, name: 'F. Tiafoe', flag: '🇺🇸' },
  { pos: 67, seed: 28, name: 'B. Nakashima', flag: '🇺🇸' },
  { pos: 68, seed: null, name: 'C. Ugo Carabelli', flag: '🇦🇷' },
  { pos: 69, seed: null, name: 'M. Damm', flag: '🇺🇸' },
  { pos: 70, seed: null, name: 'M. Berrettini', flag: '🇮🇹' },
  { pos: 71, seed: null, name: 'A. Mannarino', flag: '🇫🇷' },
  { pos: 72, seed: 4, name: 'A. Zverev', flag: '🇩🇪' },
  { pos: 73, seed: 8, name: 'B. Shelton', flag: '🇺🇸' },
  { pos: 74, seed: null, name: 'R. Opelka', flag: '🇺🇸' },
  { pos: 75, seed: null, name: 'E. Quinn', flag: '🇺🇸' },
  { pos: 76, seed: null, name: 'Q. Halys', flag: '🇫🇷' },
  { pos: 77, seed: null, name: 'A. Walton', flag: '🇦🇺' },
  { pos: 78, seed: 25, name: 'L. Tien', flag: '🇺🇸' },
  { pos: 79, seed: 18, name: 'A. Davidovich Fokina', flag: '🇪🇸' },
  { pos: 80, seed: null, name: 'Z. Svajda', flag: '🇺🇸' },
  
  // Section 6 (81-96)
  { pos: 81, seed: null, name: 'M. Cilic', flag: '🇭🇷' },
  { pos: 82, seed: null, name: 'M. Navone', flag: '🇦🇷' },
  { pos: 83, seed: null, name: 'M. Giron', flag: '🇺🇸' },
  { pos: 84, seed: 12, name: 'J. Mensik', flag: '🇨🇿' },
  { pos: 85, seed: 16, name: 'K. Khachanov', flag: '🇷🇺' },
  { pos: 86, seed: null, name: 'J. Fonseca', flag: '🇧🇷' },
  { pos: 87, seed: null, name: 'R. Collignon', flag: '🇧🇪' },
  { pos: 88, seed: null, name: 'Z. Bergs', flag: '🇧🇪' },
  { pos: 89, seed: null, name: 'J. Struff', flag: '🇩🇪' },
  { pos: 90, seed: 23, name: 'T. Paul', flag: '🇺🇸' },
  { pos: 91, seed: 29, name: 'T. Etcheverry', flag: '🇦🇷' },
  { pos: 92, seed: null, name: 'S. Tsitsipas', flag: '🇬🇷' },
  { pos: 93, seed: null, name: 'D. Shapovalov', flag: '🇨🇦' },
  { pos: 94, seed: null, name: 'D. Svrcina', flag: '🇨🇿' },
  { pos: 95, seed: null, name: 'J. Duckworth', flag: '🇦🇺' },
  { pos: 96, seed: 2, name: 'J. Sinner', flag: '🇮🇹' },
  
  // Section 7 (97-112) - Shelton/Sinner quarter
  { pos: 97, seed: null, name: 'Y. Hanfmann', flag: '🇩🇪' },
  { pos: 98, seed: null, name: 'L. Sonego', flag: '🇮🇹' },
  { pos: 99, seed: null, name: 'D. Lajovic', flag: '🇷🇸' },
  { pos: 100, seed: null, name: 'T. Griekspoor', flag: '🇳🇱' },
  { pos: 101, seed: null, name: 'A. Muller', flag: '🇫🇷' },
  { pos: 102, seed: null, name: 'P. Martinez', flag: '🇪🇸' },
  { pos: 103, seed: null, name: 'L. Van Assche', flag: '🇫🇷' },
  { pos: 104, seed: null, name: 'J. Shang', flag: '🇨🇳' },
  { pos: 105, seed: null, name: 'F. Diaz Acosta', flag: '🇦🇷' },
  { pos: 106, seed: null, name: 'M. Purcell', flag: '🇦🇺' },
  { pos: 107, seed: null, name: 'T. Daniel', flag: '🇯🇵' },
  { pos: 108, seed: null, name: 'A. Cazaux', flag: '🇫🇷' },
  { pos: 109, seed: null, name: 'H. Gaston', flag: '🇫🇷' },
  { pos: 110, seed: null, name: 'L. Djere', flag: '🇷🇸' },
  { pos: 111, seed: null, name: 'R. Carballes Baena', flag: '🇪🇸' },
  { pos: 112, seed: null, name: 'M. Cressy', flag: '🇺🇸' },
  
  // Section 8 (113-128)
  { pos: 113, seed: null, name: 'J. Munar', flag: '🇪🇸' },
  { pos: 114, seed: null, name: 'F. Coria', flag: '🇦🇷' },
  { pos: 115, seed: null, name: 'N. Jarry', flag: '🇨🇱' },
  { pos: 116, seed: null, name: 'A. Vukic', flag: '🇦🇺' },
  { pos: 117, seed: null, name: 'D. Galan', flag: '🇨🇴' },
  { pos: 118, seed: null, name: 'T. Monteiro', flag: '🇧🇷' },
  { pos: 119, seed: null, name: 'B. Zapata Miralles', flag: '🇪🇸' },
  { pos: 120, seed: null, name: 'M. Kukushkin', flag: '🇰🇿' },
  { pos: 121, seed: null, name: 'A. Ramos-Vinolas', flag: '🇪🇸' },
  { pos: 122, seed: null, name: 'J. Vesely', flag: '🇨🇿' },
  { pos: 123, seed: null, name: 'H. Rune', flag: '🇩🇰' },
  { pos: 124, seed: null, name: 'C. Eubanks', flag: '🇺🇸' },
  { pos: 125, seed: null, name: 'M. Mmoh', flag: '🇺🇸' },
  { pos: 126, seed: null, name: 'E. Ruusuvuori', flag: '🇫🇮' },
  { pos: 127, seed: null, name: 'A. Karatsev', flag: '🇷🇺' },
  { pos: 128, seed: null, name: 'Y. Nishioka', flag: '🇯🇵' },
];

// Generate R128 matches - all 64 matches (128 players, no byes)
const generateR128Matches = () => {
  const matches = [];
  for (let i = 0; i < 128; i += 2) {
    const p1 = indianWellsDraw[i];
    const p2 = indianWellsDraw[i + 1];
    matches.push({
      id: `r128-m${matches.length}`,
      matchNum: i / 2 + 1,
      p1: { id: p1.pos, name: p1.name, seed: p1.seed, flag: p1.flag },
      p2: { id: p2.pos, name: p2.name, seed: p2.seed, flag: p2.flag }
    });
  }
  return matches;
};

// Legacy atpPlayers for smaller tournaments (32/64 draws)
const atpPlayers = [
  { id: 1, name: 'C. Alcaraz', seed: 1, flag: '🇪🇸', rank: 1 },
  { id: 2, name: 'J. Sinner', seed: 2, flag: '🇮🇹', rank: 2 },
  { id: 3, name: 'N. Djokovic', seed: 3, flag: '🇷🇸', rank: 3 },
  { id: 4, name: 'A. Zverev', seed: 4, flag: '🇩🇪', rank: 4 },
  { id: 5, name: 'L. Musetti', seed: 5, flag: '🇮🇹', rank: 5 },
  { id: 6, name: 'A. de Minaur', seed: 6, flag: '🇦🇺', rank: 6 },
  { id: 7, name: 'T. Fritz', seed: 7, flag: '🇺🇸', rank: 7 },
  { id: 8, name: 'B. Shelton', seed: 8, flag: '🇺🇸', rank: 8 },
  { id: 9, name: 'F. Auger-Aliassime', seed: 9, flag: '🇨🇦', rank: 9 },
  { id: 10, name: 'A. Bublik', seed: 10, flag: '🇰🇿', rank: 10 },
  { id: 11, name: 'D. Medvedev', seed: 11, flag: '🇷🇺', rank: 11 },
  { id: 12, name: 'J. Mensik', seed: 12, flag: '🇨🇿', rank: 12 },
  { id: 13, name: 'C. Ruud', seed: 13, flag: '🇳🇴', rank: 13 },
  { id: 14, name: 'J. Draper', seed: 14, flag: '🇬🇧', rank: 14 },
  { id: 15, name: 'F. Cobolli', seed: 15, flag: '🇮🇹', rank: 15 },
  { id: 16, name: 'K. Khachanov', seed: 16, flag: '🇷🇺', rank: 16 },
  { id: 17, name: 'A. Rublev', seed: 17, flag: '🇷🇺', rank: 17 },
  { id: 18, name: 'A. Davidovich Fokina', seed: 18, flag: '🇪🇸', rank: 18 },
  { id: 19, name: 'F. Cerundolo', seed: 19, flag: '🇦🇷', rank: 19 },
  { id: 20, name: 'L. Darderi', seed: 20, flag: '🇮🇹', rank: 20 },
  { id: 21, name: 'F. Tiafoe', seed: 21, flag: '🇺🇸', rank: 21 },
  { id: 22, name: 'J. Lehecka', seed: 22, flag: '🇨🇿', rank: 22 },
  { id: 23, name: 'T. Paul', seed: 23, flag: '🇺🇸', rank: 23 },
  { id: 24, name: 'V. Vacherot', seed: 24, flag: '🇲🇨', rank: 24 },
  { id: 25, name: 'L. Tien', seed: 25, flag: '🇺🇸', rank: 25 },
  { id: 26, name: 'A. Rinderknech', seed: 26, flag: '🇫🇷', rank: 26 },
  { id: 27, name: 'C. Norrie', seed: 27, flag: '🇬🇧', rank: 27 },
  { id: 28, name: 'B. Nakashima', seed: 28, flag: '🇺🇸', rank: 28 },
  { id: 29, name: 'T. Etcheverry', seed: 29, flag: '🇦🇷', rank: 29 },
  { id: 30, name: 'A. Fils', seed: 30, flag: '🇫🇷', rank: 30 },
  { id: 31, name: 'C. Moutet', seed: 31, flag: '🇫🇷', rank: 31 },
  { id: 32, name: 'U. Humbert', seed: 32, flag: '🇫🇷', rank: 32 },
];

// ATP Calendar March-May 2026 (from screenshots)
const tournaments = [
  // March 2026
  { id: 1, month: 'March 2026', dates: '04-15', dateSuffix: 'Mar', type: 'atp1000', name: 'Indian Wells', subtitle: 'BNP Paribas Open', status: 'live', pool: 85000, entries: 2156, entry: 22, poolEntry: 20, surface: 'Hard' },
  { id: 2, month: 'March 2026', dates: '18-29', dateSuffix: 'Mar', type: 'atp1000', name: 'Miami', subtitle: 'Miami Open presented by Itau', status: 'open', pool: 78000, entries: 1892, entry: 22, poolEntry: 20, surface: 'Hard' },
  { id: 3, month: 'March 2026', dates: '30 Mar -', dateSuffix: '05 Apr', type: 'atp250', name: 'Houston', subtitle: "Fayez Sarofim & Co. U.S. Men's Clay Court Championship", status: 'upcoming', pool: 18000, entries: 0, entry: 10, poolEntry: 8, surface: 'Clay' },
  { id: 4, month: 'March 2026', dates: '30 Mar -', dateSuffix: '05 Apr', type: 'atp250', name: 'Marrakech', subtitle: 'Grand Prix Hassan II', status: 'upcoming', pool: 15000, entries: 0, entry: 10, poolEntry: 8, surface: 'Clay' },
  // April 2026
  { id: 5, month: 'April 2026', dates: '05-12', dateSuffix: 'Apr', type: 'atp1000', name: 'Monte-Carlo', subtitle: 'Rolex Monte-Carlo Masters', status: 'upcoming', pool: 65000, entries: 0, entry: 20, poolEntry: 18, surface: 'Clay' },
  { id: 6, month: 'April 2026', dates: '13-19', dateSuffix: 'Apr', type: 'atp500', name: 'Barcelona', subtitle: 'Barcelona Open Banc Sabadell', status: 'upcoming', pool: 32000, entries: 0, entry: 15, poolEntry: 12, surface: 'Clay' },
  { id: 7, month: 'April 2026', dates: '13-19', dateSuffix: 'Apr', type: 'atp500', name: 'Munich', subtitle: 'BMW Open by Bitpanda', status: 'upcoming', pool: 28000, entries: 0, entry: 15, poolEntry: 12, surface: 'Clay' },
  { id: 8, month: 'April 2026', dates: '22 Apr -', dateSuffix: '03 May', type: 'atp1000', name: 'Madrid', subtitle: 'Mutua Madrid Open', status: 'upcoming', pool: 72000, entries: 0, entry: 22, poolEntry: 20, surface: 'Clay' },
  // May 2026
  { id: 9, month: 'May 2026', dates: '06-17', dateSuffix: 'May', type: 'atp1000', name: 'Rome', subtitle: "Internazionali BNL d'Italia", status: 'upcoming', pool: 70000, entries: 0, entry: 22, poolEntry: 20, surface: 'Clay' },
  { id: 10, month: 'May 2026', dates: '17-23', dateSuffix: 'May', type: 'atp500', name: 'Hamburg', subtitle: 'Bitpanda Hamburg Open', status: 'upcoming', pool: 25000, entries: 0, entry: 15, poolEntry: 12, surface: 'Clay' },
  { id: 11, month: 'May 2026', dates: '17-23', dateSuffix: 'May', type: 'atp250', name: 'Geneva', subtitle: 'Gonet Geneva Open', status: 'upcoming', pool: 14000, entries: 0, entry: 10, poolEntry: 8, surface: 'Clay' },
  { id: 12, month: 'May 2026', dates: '24 May -', dateSuffix: '07 Jun', type: 'grandslam', name: 'Paris', subtitle: 'Roland Garros', status: 'upcoming', pool: 150000, entries: 0, entry: 35, poolEntry: 30, surface: 'Clay' },
];

// Live Matches Data (Indian Wells - currently live)
const liveMatchesData = [
  { id: 1, tournament: 'Indian Wells', round: 'Quarter-Final', court: 'Stadium 1', time: '2:34:22', status: 'live',
    p1: { name: 'C. Alcaraz', seed: 2, flag: '🇪🇸', sets: [6, 4, 5], games: 40, serving: true },
    p2: { name: 'S. Tsitsipas', seed: 10, flag: '🇬🇷', sets: [3, 6, 4], games: 30 },
    stats: { aces: [12, 8], winners: [34, 28], errors: [18, 24] }
  },
  { id: 2, tournament: 'Indian Wells', round: 'Quarter-Final', court: 'Stadium 2', time: '1:52:18', status: 'live',
    p1: { name: 'J. Sinner', seed: 3, flag: '🇮🇹', sets: [6, 6], games: 0 },
    p2: { name: 'G. Dimitrov', seed: 9, flag: '🇧🇬', sets: [2, 3], games: 0, serving: true },
    stats: { aces: [8, 4], winners: [26, 19], errors: [12, 22] }
  },
  { id: 3, tournament: 'Indian Wells', round: 'Quarter-Final', court: 'Court 1', time: '0:45:33', status: 'live',
    p1: { name: 'A. Zverev', seed: 5, flag: '🇩🇪', sets: [4], games: 15, serving: true },
    p2: { name: 'T. Fritz', seed: 11, flag: '🇺🇸', sets: [5], games: 30 },
    stats: { aces: [5, 3], winners: [12, 10], errors: [8, 11] }
  },
];

const upcomingMatches = [
  { id: 4, tournament: 'Roland Garros', round: 'Quarter-Final', court: 'Philippe-Chatrier', time: '14:00', status: 'upcoming',
    p1: { name: 'N. Djokovic', seed: 1, flag: '🇷🇸' },
    p2: { name: 'C. Ruud', seed: 8, flag: '🇳🇴' }
  },
  { id: 5, tournament: 'Roland Garros', round: 'Quarter-Final', court: 'Suzanne-Lenglen', time: '16:30', status: 'upcoming',
    p1: { name: 'D. Medvedev', seed: 4, flag: '🇷🇺' },
    p2: { name: 'A. Rublev', seed: 6, flag: '🇷🇺' }
  },
];

const completedMatches = [
  { id: 6, tournament: 'Roland Garros', round: 'R16', court: 'Philippe-Chatrier', duration: '2:15',
    p1: { name: 'C. Alcaraz', seed: 2, flag: '🇪🇸', sets: [6, 6, 6], winner: true },
    p2: { name: 'F. Tiafoe', seed: 16, flag: '🇺🇸', sets: [3, 4, 2] }
  },
  { id: 7, tournament: 'Roland Garros', round: 'R16', court: 'Suzanne-Lenglen', duration: '3:42',
    p1: { name: 'J. Sinner', seed: 3, flag: '🇮🇹', sets: [7, 4, 6, 6], winner: true },
    p2: { name: 'B. Shelton', seed: 13, flag: '🇺🇸', sets: [6, 6, 4, 3] }
  },
];

// TOP 30 Rankings
const rankings = [
  { rank: 1, name: 'TennisKing99', flag: '🇺🇸', pts: 24850, played: 32, winRate: 78, earnings: 45200 },
  { rank: 2, name: 'AcePredictor', flag: '🇬🇧', pts: 22340, played: 29, winRate: 75, earnings: 38500 },
  { rank: 3, name: 'SlamMaster', flag: '🇪🇸', pts: 21100, played: 31, winRate: 74, earnings: 32100 },
  { rank: 4, name: 'ClayKing', flag: '🇫🇷', pts: 19750, played: 28, winRate: 72, earnings: 28400 },
  { rank: 5, name: 'NetRusher', flag: '🇦🇺', pts: 18200, played: 30, winRate: 71, earnings: 25600 },
  { rank: 6, name: 'ServeAce', flag: '🇩🇪', pts: 17450, played: 27, winRate: 70, earnings: 22800 },
  { rank: 7, name: 'MatchPoint', flag: '🇮🇹', pts: 16800, played: 26, winRate: 69, earnings: 19500 },
  { rank: 8, name: 'CourtKing', flag: '🇨🇦', pts: 15920, played: 25, winRate: 68, earnings: 17200 },
  { rank: 9, name: 'GrandSlamPro', flag: '🇯🇵', pts: 15100, played: 28, winRate: 67, earnings: 15800 },
  { rank: 10, name: 'TopSpinWiz', flag: '🇧🇷', pts: 14350, played: 24, winRate: 66, earnings: 14200 },
  { rank: 11, name: 'RallyMaster', flag: '🇦🇷', pts: 13600, played: 26, winRate: 65, earnings: 12900 },
  { rank: 12, name: 'BreakPoint', flag: '🇳🇱', pts: 12850, played: 23, winRate: 64, earnings: 11500 },
  { rank: 13, name: 'SetWinner', flag: '🇵🇱', pts: 12100, played: 25, winRate: 63, earnings: 10200 },
  { rank: 14, name: 'VolleyKing', flag: '🇨🇭', pts: 11400, played: 22, winRate: 62, earnings: 9400 },
  { rank: 15, name: 'BaselineHero', flag: '🇧🇪', pts: 10750, played: 24, winRate: 61, earnings: 8600 },
  { rank: 16, name: 'DropShotPro', flag: '🇸🇪', pts: 10100, played: 21, winRate: 60, earnings: 7800 },
  { rank: 17, name: 'PassingShot', flag: '🇦🇹', pts: 9500, played: 23, winRate: 59, earnings: 7100 },
  { rank: 18, name: 'LobMaster', flag: '🇳🇴', pts: 8900, played: 20, winRate: 58, earnings: 6400 },
  { rank: 19, name: 'SliceKing', flag: '🇩🇰', pts: 8350, played: 22, winRate: 57, earnings: 5800 },
  { rank: 20, name: 'SmashHero', flag: '🇵🇹', pts: 7800, played: 19, winRate: 56, earnings: 5200 },
  { rank: 21, name: 'TieBreakerPro', flag: '🇬🇷', pts: 7300, played: 21, winRate: 55, earnings: 4700 },
  { rank: 22, name: 'MatchTieBreak', flag: '🇨🇿', pts: 6850, played: 18, winRate: 54, earnings: 4200 },
  { rank: 23, name: 'GrassKing', flag: '🇮🇪', pts: 6400, played: 20, winRate: 53, earnings: 3800 },
  { rank: 24, name: 'HardCourtPro', flag: '🇿🇦', pts: 5950, played: 17, winRate: 52, earnings: 3400 },
  { rank: 25, name: 'IndoorMaster', flag: '🇷🇴', pts: 5550, played: 19, winRate: 51, earnings: 3000 },
  { rank: 26, name: 'OutdoorAce', flag: '🇭🇷', pts: 5150, played: 16, winRate: 50, earnings: 2700 },
  { rank: 27, name: 'NightSession', flag: '🇺🇦', pts: 4800, played: 18, winRate: 49, earnings: 2400 },
  { rank: 28, name: 'DayMatch', flag: '🇨🇱', pts: 4450, played: 15, winRate: 48, earnings: 2100 },
  { rank: 29, name: 'ChampionMind', flag: '🇰🇷', pts: 4100, played: 17, winRate: 47, earnings: 1900 },
  { rank: 30, name: 'WinnerTakes', flag: '🇲🇽', pts: 3800, played: 14, winRate: 46, earnings: 1700 },
];

// Transactions
const transactions = [
  { id: 1, title: 'Tournament Entry', desc: 'Miami Open', amt: -15, date: 'Today, 14:34' },
  { id: 2, title: 'Winnings - 3rd Place', desc: 'Indian Wells', amt: 1250, date: 'Mar 15' },
  { id: 3, title: 'Deposit', desc: 'Visa ····4532', amt: 200, date: 'Mar 12' },
  { id: 4, title: 'Winnings - 1st Place', desc: 'Dubai Championship', amt: 4200, date: 'Mar 8' },
];

const calcPrizes = (pool) => [
  { place: '1st', pct: 23, amt: Math.round(pool * 0.23) },
  { place: '2nd', pct: 14, amt: Math.round(pool * 0.14) },
  { place: '3rd', pct: 9, amt: Math.round(pool * 0.09) },
  { place: '4th', pct: 6.5, amt: Math.round(pool * 0.065) },
  { place: '5th-8th', pct: 3, amt: Math.round(pool * 0.03) },
];

export default function App() {
  const [view, setView] = useState('bracket');
  const [balance, setBalance] = useState(3485);
  const [modal, setModal] = useState(null);
  const [selTourn, setSelTourn] = useState(null);
  const [selPlayer, setSelPlayer] = useState(null);
  const [liveTab, setLiveTab] = useState('live');
  const [calendarTab, setCalendarTab] = useState('all');
  const [bracketRound, setBracketRound] = useState(0);
  const [bracketTab, setBracketTab] = useState('picks'); // 'picks' or 'draws'
  const [drawRound, setDrawRound] = useState(0); // For viewing live draw
  const [predictions, setPredictions] = useState({});
  const [blackHorse, setBlackHorse] = useState(null); // Selected Black Horse player
  const [activeTournament, setActiveTournament] = useState(tournaments[0]);
  const [depAmt, setDepAmt] = useState('');
  const [depStep, setDepStep] = useState(1);
  const [withdrawAmt, setWithdrawAmt] = useState('');
  const [withdrawStep, setWithdrawStep] = useState(1);
  const [submitStep, setSubmitStep] = useState(1);
  const [myBrackets, setMyBrackets] = useState([]);
  const [selectedBracket, setSelectedBracket] = useState(null);
  const [userTransactions, setUserTransactions] = useState([
    { id: 1, title: 'Tournament Entry', desc: 'Miami Open', amt: -15, date: 'Today' },
    { id: 2, title: 'Winnings - 3rd Place', desc: 'Indian Wells', amt: 1250, date: 'Mar 15' },
    { id: 3, title: 'Deposit', desc: 'Visa ····4532', amt: 200, date: 'Mar 12' },
    { id: 4, title: 'Winnings - 1st Place', desc: 'Dubai Championship', amt: 4200, date: 'Mar 8' },
  ]);

  const user = { name: 'AceMaster', rank: 132, win: 67, earn: 6875, brackets: 27 };
  const [isLoggedIn, setIsLoggedIn] = useState(false);
  const [authScreen, setAuthScreen] = useState('welcome'); // welcome, login, register
  const [authEmail, setAuthEmail] = useState('');
  const [authPassword, setAuthPassword] = useState('');
  const [authName, setAuthName] = useState('');
  const [showPass, setShowPass] = useState(false);

  // FIBONACCI SCORING SYSTEM
  // Points per round: R1=1, R2=2, R3=3, R4=5, QF=8, SF=13, F=21
  // Black Horse multiplier: 1.5x
  const FIBONACCI_POINTS = {
    'R32': 1,   // Round of 32
    'R16': 2,   // Round of 16
    'QF': 3,    // Quarter Finals (R3 in Fibonacci sequence context, but actual QF)
    'SF': 5,    // Semi Finals
    'F': 8,     // Finals
    'W': 13,    // Winner/Champion bonus
  };
  
  const BLACK_HORSE_MULTIPLIER = 1.5;
  
  // Calculate points for a correct prediction
  const calculatePoints = (round, predictedPlayer, isBlackHorse) => {
    const basePoints = FIBONACCI_POINTS[round] || 0;
    if (isBlackHorse) {
      return Math.round(basePoints * BLACK_HORSE_MULTIPLIER);
    }
    return basePoints;
  };
  
  // Get Black Horse eligible players based on bracket size
  // For 128 draw: unseeded players (no seed or seed > 32)
  const getBlackHorsePlayers = (bracketSize = 32) => {
    if (bracketSize === 128) {
      // 128 draw: Get unseeded players from Indian Wells draw
      // Black Horse = players who don't have a numeric seed 1-32
      return indianWellsDraw
        .filter(p => p.seed === null || (typeof p.seed === 'number' && p.seed > 32))
        .map(p => ({ id: p.pos, name: p.name, seed: p.seed, flag: p.flag }));
    } else if (bracketSize === 64) {
      // 64 draw: seeds 17-64
      return atpPlayers.filter(p => p.seed >= 17 && p.seed <= 64);
    } else {
      // 32 draw (default): seeds 9-32
      return atpPlayers.filter(p => p.seed >= 9 && p.seed <= 32);
    }
  };
  
  // Get bracket size from tournament (default 32)
  const getBracketSize = (tournament) => {
    if (!tournament) return 32;
    // ATP 1000 / Grand Slam = 128, ATP 500 = 64, ATP 250 = 32
    if (tournament.type === 'grandslam' || tournament.type === 'atp1000') return 128;
    if (tournament.type === 'atp500') return 64;
    return 32;
  };

  // PRIZE POOL CALCULATION
  // Entry fee includes platform fee - poolEntry goes directly to prize pool
  // Distribution based on poker tournament model
  
  // Prize distribution percentages (top 15% of entries get paid)
  // Extended to cover all paid places
  const getPrizeDistribution = () => {
    // Standard distribution percentages - covers up to 512 places
    const distribution = [
      { place: 1, pct: 0.20, label: '1st' },
      { place: 2, pct: 0.12, label: '2nd' },
      { place: 3, pct: 0.08, label: '3rd' },
      { place: 4, pct: 0.055, label: '4th' },
      { place: '5-8', pct: 0.025, count: 4 },
      { place: '9-16', pct: 0.0125, count: 8 },
      { place: '17-32', pct: 0.007, count: 16 },
      { place: '33-64', pct: 0.004, count: 32 },
      { place: '65-128', pct: 0.002, count: 64 },
      { place: '129-256', pct: 0.001, count: 128 },
      { place: '257-512', pct: 0.0005, count: 256 },
    ];
    
    return distribution;
  };
  
  // Calculate actual prize amounts - poolEntry is what goes to prize pool
  const calculatePrizes = (entries, poolEntry) => {
    const prizePool = entries * poolEntry; // 100% goes to prize pool
    const paidPlaces = Math.max(1, Math.floor(entries * 0.15)); // Top 15% get paid
    
    const prizes = [];
    const distribution = getPrizeDistribution();
    
    distribution.forEach(d => {
      if (d.count) {
        // Range of places (e.g., 5-8th)
        for (let i = 0; i < d.count && prizes.length < paidPlaces; i++) {
          prizes.push({
            place: prizes.length + 1,
            label: d.place,
            amount: Math.round(prizePool * d.pct)
          });
        }
      } else {
        // Single place
        if (prizes.length < paidPlaces) {
          prizes.push({
            place: d.place,
            label: d.label,
            amount: Math.round(prizePool * d.pct)
          });
        }
      }
    });
    
    return {
      prizePool,
      paidPlaces,
      prizes // Return all prizes, not limited
    };
  };

  // Generate bracket rounds based on tournament type
  // ATP 1000/Grand Slam = 128 draw (64 matches in R128, no byes)
  // Points use FIBONACCI model for user predictions: 1, 2, 3, 5, 8, 13, 21
  const getRoundsForTournament = (tournament) => {
    const bracketSize = getBracketSize(tournament);
    
    if (bracketSize === 128) {
      // 128 draw with Fibonacci scoring - 64 matches in R128, no byes
      return [
        { name: 'R128', matches: 64, pts: 1 },   // Fibonacci: 1
        { name: 'R64', matches: 32, pts: 2 },    // Fibonacci: 2
        { name: 'R32', matches: 16, pts: 3 },    // Fibonacci: 3
        { name: 'R16', matches: 8, pts: 5 },     // Fibonacci: 5
        { name: 'QF', matches: 4, pts: 8 },      // Fibonacci: 8
        { name: 'SF', matches: 2, pts: 13 },     // Fibonacci: 13
        { name: 'F', matches: 1, pts: 21 },      // Fibonacci: 21
      ];
    } else if (bracketSize === 64) {
      // 64 draw - Fibonacci: 1, 2, 3, 5, 8
      return [
        { name: 'R32', matches: 16, pts: 1 },
        { name: 'R16', matches: 8, pts: 2 },
        { name: 'QF', matches: 4, pts: 3 },
        { name: 'SF', matches: 2, pts: 5 },
        { name: 'F', matches: 1, pts: 8 },
      ];
    } else {
      // 32 draw - Fibonacci: 1, 2, 3, 5
      return [
        { name: 'R16', matches: 8, pts: 1 },
        { name: 'QF', matches: 4, pts: 2 },
        { name: 'SF', matches: 2, pts: 3 },
        { name: 'F', matches: 1, pts: 5 },
      ];
    }
  };
  
  const rounds = getRoundsForTournament(activeTournament);
  const totalRounds = rounds.length;

  // Get R128 matches for 128 draw (all 64 matches)
  const r128Matches = generateR128Matches();

  const getMatchesForRound = (roundIdx) => {
    const matches = [];
    const numMatches = rounds[roundIdx].matches;
    const bracketSize = getBracketSize(activeTournament);
    
    if (bracketSize === 128) {
      if (roundIdx === 0) {
        // R128: Return all 64 matches from Indian Wells draw
        return r128Matches.map((m, i) => ({
          id: `r0-m${i}`,
          p1: m.p1,
          p2: m.p2
        }));
      } else {
        // R64 onwards - winners from previous round
        const prevRound = roundIdx - 1;
        for (let i = 0; i < numMatches; i++) {
          const p1Match = `r${prevRound}-m${i * 2}`;
          const p2Match = `r${prevRound}-m${i * 2 + 1}`;
          matches.push({
            id: `r${roundIdx}-m${i}`,
            p1: predictions[p1Match] || null,
            p2: predictions[p2Match] || null
          });
        }
        return matches;
      }
    } else {
      // 32/64 draw - standard logic
      for (let i = 0; i < numMatches; i++) {
        if (roundIdx === 0) {
          matches.push({
            id: `r0-m${i}`,
            p1: atpPlayers[i * 2],
            p2: atpPlayers[i * 2 + 1]
          });
        } else {
          const prevRound = roundIdx - 1;
          const p1Match = `r${prevRound}-m${i * 2}`;
          const p2Match = `r${prevRound}-m${i * 2 + 1}`;
          matches.push({
            id: `r${roundIdx}-m${i}`,
            p1: predictions[p1Match] || null,
            p2: predictions[p2Match] || null
          });
        }
      }
      return matches;
    }
  };

  const currentMatches = getMatchesForRound(bracketRound);
  const completedPicks = Object.keys(predictions).length;
  const totalPicks = rounds.reduce((sum, r) => sum + r.matches, 0);
  const progress = Math.round((completedPicks / totalPicks) * 100);

  // Logo Component (Diamond only) - exact design from screenshot
  const Logo = ({ size = 32 }) => (
    <svg width={size} height={size} viewBox="0 0 100 100" fill="none">
      {/* Diamond shape made of 4 triangles */}
      {/* Top-left triangle - yellow/orange */}
      <path d="M50 10 L50 50 L10 50 Z" fill="#FFAA33" />
      {/* Top-right triangle - red/orange */}
      <path d="M50 10 L90 50 L50 50 Z" fill="#FF5533" />
      {/* Bottom-left triangle - orange */}
      <path d="M10 50 L50 50 L50 90 Z" fill="#FF6B35" />
      {/* Bottom-right triangle - red/orange */}
      <path d="M50 50 L90 50 L50 90 Z" fill="#FF4422" />
      {/* 4-pointed star cutout in center (transparent/shows background) */}
      <path d="M50 30 L58 50 L50 70 L42 50 Z" fill="#1E1B4B" />
      {/* Two dots on top-right */}
      <circle cx="78" cy="22" r="8" fill="#FF4433" />
      <circle cx="88" cy="38" r="5" fill="#FF5544" />
    </svg>
  );

  // Diamond Icon for bottom nav (same design, smaller)
  const DiamondIcon = ({ size = 22, color }) => (
    <svg width={size} height={size} viewBox="0 0 100 100" fill="none">
      {color ? (
        // Solid color version when selected/inactive
        <>
          <path d="M50 10 L90 50 L50 90 L10 50 Z" fill={color} />
          <path d="M50 30 L58 50 L50 70 L42 50 Z" fill="#fff" />
        </>
      ) : (
        // Full color version
        <>
          <path d="M50 10 L50 50 L10 50 Z" fill="#FFAA33" />
          <path d="M50 10 L90 50 L50 50 Z" fill="#FF5533" />
          <path d="M10 50 L50 50 L50 90 Z" fill="#FF6B35" />
          <path d="M50 50 L90 50 L50 90 Z" fill="#FF4422" />
          <path d="M50 30 L58 50 L50 70 L42 50 Z" fill="#1E1B4B" />
          <circle cx="78" cy="22" r="8" fill="#FF4433" />
          <circle cx="88" cy="38" r="5" fill="#FF5544" />
        </>
      )}
    </svg>
  );

  // Header with new layout: User, Bracket icon | Search | Help, Chat
  const AppHeader = ({ title, showBack }) => (
    <div style={{ background: `linear-gradient(135deg, ${colors.gradientStart} 0%, ${colors.gradientMid} 50%, ${colors.gradientEnd} 100%)`, padding: '12px 16px' }}>
      <div style={{ display: 'flex', alignItems: 'center', gap: 12 }}>
        {/* Left icons */}
        <div style={{ display: 'flex', alignItems: 'center', gap: 10 }}>
          {showBack ? (
            <button onClick={() => setView('calendar')} style={{ background: 'none', border: 'none', cursor: 'pointer', display: 'flex', alignItems: 'center' }}>
              <ChevronLeft size={24} color="#fff" />
            </button>
          ) : (
            <>
              {/* User icon - opens auth modal if not logged in, profile if logged in */}
              <button onClick={() => setModal(isLoggedIn ? 'profile' : 'auth')} style={{ background: 'none', border: 'none', cursor: 'pointer', padding: 4 }}>
                {isLoggedIn ? (
                  <div style={{ width: 26, height: 26, borderRadius: 13, background: colors.orange, display: 'flex', alignItems: 'center', justifyContent: 'center', fontSize: 12, fontWeight: 600, color: '#fff' }}>
                    {user.name[0]}
                  </div>
                ) : (
                  <User size={22} color="#fff" strokeWidth={1.5} />
                )}
              </button>
              {/* Diamond logo */}
              <Logo size={28} />
            </>
          )}
        </div>
        
        {/* Center - Search bar or Title */}
        <div style={{ flex: 1 }}>
          {title ? (
            <span style={{ fontSize: 18, fontWeight: 600, color: '#fff' }}>{title}</span>
          ) : (
            <div style={{ background: 'rgba(255,255,255,0.15)', borderRadius: 20, padding: '8px 14px', display: 'flex', alignItems: 'center', gap: 8 }}>
              <Search size={16} color="rgba(255,255,255,0.6)" />
              <span style={{ fontSize: 13, color: 'rgba(255,255,255,0.6)' }}>Search</span>
            </div>
          )}
        </div>
        
        {/* Right icons */}
        <div style={{ display: 'flex', alignItems: 'center', gap: 10 }}>
          {/* Help icon */}
          <button onClick={() => setModal('help')} style={{ background: 'none', border: 'none', cursor: 'pointer', padding: 4 }}>
            <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="#fff" strokeWidth="1.5">
              <path d="M12 22c5.523 0 10-4.477 10-10S17.523 2 12 2 2 6.477 2 12s4.477 10 10 10z" />
              <path d="M9 9a3 3 0 1 1 4 2.829 1.5 1.5 0 0 0-1 1.415V14" />
              <circle cx="12" cy="17" r="1" fill="#fff" />
            </svg>
          </button>
          {/* Chat icon with notification dot */}
          <button onClick={() => setModal('chat')} style={{ background: 'none', border: 'none', cursor: 'pointer', padding: 4, position: 'relative' }}>
            <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="#fff" strokeWidth="1.5">
              <path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z" />
            </svg>
            <div style={{ position: 'absolute', top: 2, right: 2, width: 8, height: 8, borderRadius: 4, background: '#3B82F6' }} />
          </button>
        </div>
      </div>
      
      {/* Balance bar below */}
      {isLoggedIn && !showBack && (
        <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', marginTop: 12, paddingTop: 12, borderTop: '1px solid rgba(255,255,255,0.1)' }}>
          <div style={{ display: 'flex', alignItems: 'center', gap: 10 }}>
            <div style={{ width: 28, height: 28, borderRadius: 14, background: colors.orange, display: 'flex', alignItems: 'center', justifyContent: 'center', fontSize: 12, fontWeight: 600, color: '#fff' }}>
              {user.name[0]}
            </div>
            <span style={{ fontSize: 13, fontWeight: 500, color: '#fff' }}>{user.name}</span>
          </div>
          <div style={{ display: 'flex', alignItems: 'center', gap: 12 }}>
            <div style={{ textAlign: 'right' }}>
              <p style={{ fontSize: 10, color: 'rgba(255,255,255,0.7)', margin: 0 }}>Balance</p>
              <p style={{ fontSize: 15, fontWeight: 600, color: '#fff', margin: 0 }}>${balance.toLocaleString()}</p>
            </div>
            <button onClick={() => { setDepStep(1); setDepAmt(''); setModal('deposit'); }} style={{ width: 32, height: 32, borderRadius: 16, background: colors.orange, border: 'none', display: 'flex', alignItems: 'center', justifyContent: 'center', cursor: 'pointer' }}>
              <Plus size={18} color="#fff" />
            </button>
          </div>
        </div>
      )}
    </div>
  );

  // Tab Bar
  const TabBar = ({ tabs, active, onChange, light }) => (
    <div style={{ display: 'flex', background: light ? colors.white : 'transparent', borderBottom: `1px solid ${light ? colors.border : 'rgba(255,255,255,0.2)'}` }}>
      {tabs.map(tab => (
        <button key={tab.id} onClick={() => onChange(tab.id)} style={{
          flex: 1, padding: '14px 8px', background: 'none', border: 'none', cursor: 'pointer',
          borderBottom: active === tab.id ? `3px solid ${light ? colors.purple : '#fff'}` : '3px solid transparent',
          marginBottom: -1
        }}>
          <span style={{ fontSize: 14, fontWeight: active === tab.id ? 600 : 400, color: light ? (active === tab.id ? colors.navy : colors.textMuted) : (active === tab.id ? '#fff' : 'rgba(255,255,255,0.6)') }}>
            {tab.label}
          </span>
        </button>
      ))}
    </div>
  );

  // Button
  const Btn = ({ children, primary, full, disabled, onClick, style = {} }) => (
    <button onClick={onClick} disabled={disabled} style={{
      display: 'flex', alignItems: 'center', justifyContent: 'center', gap: 8,
      padding: '12px 20px', borderRadius: 8, fontSize: 14, fontWeight: 600, cursor: disabled ? 'not-allowed' : 'pointer',
      width: full ? '100%' : 'auto', opacity: disabled ? 0.5 : 1,
      background: primary ? colors.purple : colors.white,
      color: primary ? '#fff' : colors.navy,
      border: primary ? 'none' : `1px solid ${colors.border}`,
      ...style
    }}>{children}</button>
  );

  // Modal
  const Modal = ({ title, children, onClose, full }) => (
    <div style={{ position: 'fixed', inset: 0, background: 'rgba(0,0,0,0.5)', zIndex: 1000, display: 'flex', alignItems: full ? 'stretch' : 'flex-end', justifyContent: 'center' }}>
      <div style={{ width: '100%', maxWidth: 430, background: colors.white, borderRadius: full ? 0 : '16px 16px 0 0', height: full ? '100%' : 'auto', maxHeight: full ? '100%' : '90vh', display: 'flex', flexDirection: 'column' }}>
        <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', padding: 16, borderBottom: `1px solid ${colors.border}` }}>
          <h2 style={{ fontSize: 18, fontWeight: 600, color: colors.navy, margin: 0 }}>{title}</h2>
          <button onClick={onClose} style={{ width: 32, height: 32, borderRadius: 16, background: colors.bg, border: 'none', display: 'flex', alignItems: 'center', justifyContent: 'center', cursor: 'pointer' }}>
            <X size={18} color={colors.textMid} />
          </button>
        </div>
        <div style={{ flex: 1, overflow: 'auto' }}>{children}</div>
      </div>
    </div>
  );

  // Bottom Nav with gradient background like top header
  const BottomNav = () => {
    const navItems = [
      { id: 'bracket', label: 'Home', isDiamond: true },
      { id: 'calendar', icon: Calendar, label: 'Calendar' },
      { id: 'live', icon: Radio, label: 'Live' },
      { id: 'rankings', icon: BarChart2, label: 'Rankings' },
      { id: 'wallet', icon: Wallet, label: 'Wallet' },
    ];
    
    return (
      <nav style={{ 
        position: 'fixed', 
        bottom: 0, 
        left: 0, 
        right: 0, 
        background: `linear-gradient(135deg, ${colors.gradientStart} 0%, ${colors.gradientMid} 50%, ${colors.gradientEnd} 100%)`,
        padding: '10px 0 28px', 
        display: 'flex', 
        justifyContent: 'space-around', 
        maxWidth: 430, 
        margin: '0 auto' 
      }}>
        {navItems.map(item => {
          const isActive = view === item.id;
          return (
            <button key={item.id} onClick={() => setView(item.id)} style={{ display: 'flex', flexDirection: 'column', alignItems: 'center', gap: 4, padding: '4px 12px', background: 'none', border: 'none', cursor: 'pointer' }}>
              {item.isDiamond ? (
                // Full color diamond when active, white outline when inactive
                isActive ? (
                  <Logo size={24} />
                ) : (
                  <svg width={22} height={22} viewBox="0 0 100 100" fill="none">
                    <path d="M50 10 L90 50 L50 90 L10 50 Z" fill="none" stroke="rgba(255,255,255,0.6)" strokeWidth="6" />
                    <path d="M50 30 L58 50 L50 70 L42 50 Z" fill="rgba(255,255,255,0.6)" />
                  </svg>
                )
              ) : (
                <item.icon size={22} color={isActive ? '#fff' : 'rgba(255,255,255,0.6)'} strokeWidth={isActive ? 2.5 : 1.5} />
              )}
              <span style={{ fontSize: 10, fontWeight: isActive ? 600 : 500, color: isActive ? '#fff' : 'rgba(255,255,255,0.6)' }}>{item.label}</span>
            </button>
          );
        })}
      </nav>
    );
  };

  // BRACKET VIEW - Main bracket building screen
  const BracketView = () => {
    const prizeInfo = calculatePrizes(activeTournament.entries || 1, activeTournament.poolEntry || activeTournament.entry);
    
    return (
    <div style={{ background: colors.bg, minHeight: '100vh' }}>
      <AppHeader />
      
      {/* Tournament Card - separate from header */}
      <div style={{ padding: '12px 16px' }}>
        <div style={{ background: colors.white, borderRadius: 12, border: `1px solid ${colors.border}`, overflow: 'hidden' }}>
          {/* Tournament Header */}
          <div style={{ display: 'flex', alignItems: 'center', padding: '12px 14px', borderBottom: `1px solid ${colors.border}` }}>
            <div style={{ flex: 1 }}>
              <div style={{ display: 'flex', alignItems: 'center', gap: 8 }}>
                <span style={{ fontSize: 10, fontWeight: 600, color: colors.purple, background: colors.purpleLight, padding: '2px 6px', borderRadius: 4 }}>
                  {activeTournament.type.toUpperCase().replace('ATP', 'ATP ')}
                </span>
                <span style={{ fontSize: 10, fontWeight: 600, color: activeTournament.status === 'live' ? colors.red : colors.green, background: activeTournament.status === 'live' ? colors.redLight : colors.greenLight, padding: '2px 6px', borderRadius: 4 }}>
                  {activeTournament.status.toUpperCase()}
                </span>
              </div>
              <h3 style={{ fontSize: 17, fontWeight: 700, color: colors.navy, margin: '6px 0 2px' }}>{activeTournament.name}</h3>
              <p style={{ fontSize: 11, color: colors.textMuted, margin: 0 }}>{activeTournament.dates} {activeTournament.dateSuffix} • {activeTournament.surface}</p>
            </div>
          </div>
          
          {/* Stats Row */}
          <div style={{ display: 'flex', padding: '10px 14px', background: colors.bgLight }}>
            <div style={{ flex: 1, textAlign: 'center', borderRight: `1px solid ${colors.border}` }}>
              <p style={{ fontSize: 10, color: colors.textMuted, margin: 0 }}>Prize Pool</p>
              <p style={{ fontSize: 15, fontWeight: 700, color: colors.green, margin: '2px 0 0' }}>${prizeInfo.prizePool.toLocaleString()}</p>
            </div>
            <div style={{ flex: 1, textAlign: 'center', borderRight: `1px solid ${colors.border}` }}>
              <p style={{ fontSize: 10, color: colors.textMuted, margin: 0 }}>Entry</p>
              <p style={{ fontSize: 15, fontWeight: 700, color: colors.navy, margin: '2px 0 0' }}>${activeTournament.entry}</p>
            </div>
            <div style={{ flex: 1, textAlign: 'center' }}>
              <p style={{ fontSize: 10, color: colors.textMuted, margin: 0 }}>Entries</p>
              <p style={{ fontSize: 15, fontWeight: 700, color: colors.navy, margin: '2px 0 0' }}>{activeTournament.entries.toLocaleString()}</p>
            </div>
          </div>
          
          {/* View Payouts Button */}
          <button 
            onClick={() => setModal('prizes')} 
            style={{ width: '100%', padding: '10px 14px', background: colors.white, border: 'none', borderTop: `1px solid ${colors.border}`, cursor: 'pointer', display: 'flex', alignItems: 'center', justifyContent: 'center', gap: 6 }}
          >
            <Trophy size={14} color={colors.orange} />
            <span style={{ fontSize: 12, fontWeight: 600, color: colors.purple }}>View Prize Payouts</span>
            <ChevronRight size={14} color={colors.textMuted} />
          </button>
        </div>
      </div>

      {/* Progress Bar */}
      <div style={{ background: colors.white, padding: '12px 16px', borderBottom: `1px solid ${colors.border}` }}>
        <div style={{ display: 'flex', justifyContent: 'space-between', marginBottom: 6 }}>
          <span style={{ fontSize: 12, fontWeight: 500, color: colors.navy }}>Bracket Progress</span>
          <span style={{ fontSize: 12, fontWeight: 600, color: colors.purple }}>{progress}%</span>
        </div>
        <div style={{ height: 5, background: colors.bg, borderRadius: 3 }}>
          <div style={{ height: '100%', width: `${progress}%`, background: `linear-gradient(90deg, ${colors.purple}, ${colors.gradientEnd})`, borderRadius: 3, transition: 'width 0.3s' }} />
        </div>
        <p style={{ fontSize: 10, color: colors.textMuted, margin: '6px 0 0' }}>{completedPicks} of {totalPicks} picks made</p>
      </div>

      {/* Black Horse Selection */}
      <div style={{ background: colors.white, padding: 16, borderBottom: `1px solid ${colors.border}` }}>
        <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
          <div>
            <div style={{ display: 'flex', alignItems: 'center', gap: 8, marginBottom: 4 }}>
              <span style={{ fontSize: 14, fontWeight: 600, color: colors.navy }}>🐴 Black Horse</span>
              <span style={{ fontSize: 10, fontWeight: 600, color: colors.orange, background: '#FFF7ED', padding: '2px 6px', borderRadius: 4 }}>1.5x POINTS</span>
            </div>
            <p style={{ fontSize: 12, color: colors.textMuted, margin: 0 }}>
              Pick a player (seed {getBracketSize(activeTournament) === 128 ? '33-96' : getBracketSize(activeTournament) === 64 ? '17-64' : '9-32'}) for bonus points
            </p>
          </div>
          <button onClick={() => setModal('blackhorse')} style={{ padding: '10px 16px', borderRadius: 8, border: blackHorse ? `2px solid ${colors.orange}` : `1px solid ${colors.border}`, background: blackHorse ? '#FFF7ED' : colors.white, cursor: 'pointer', display: 'flex', alignItems: 'center', gap: 8 }}>
            {blackHorse ? (
              <>
                <span style={{ fontSize: 18 }}>{blackHorse.flag}</span>
                <span style={{ fontSize: 13, fontWeight: 600, color: colors.navy }}>{blackHorse.name}</span>
              </>
            ) : (
              <span style={{ fontSize: 13, color: colors.textMuted }}>Select</span>
            )}
          </button>
        </div>
      </div>

      {/* Main Tabs: Picks vs Draws */}
      <div style={{ display: 'flex', background: colors.white, borderBottom: `1px solid ${colors.border}` }}>
        <button 
          onClick={() => setBracketTab('picks')} 
          style={{ flex: 1, padding: '14px', background: 'none', border: 'none', cursor: 'pointer', borderBottom: bracketTab === 'picks' ? `3px solid ${colors.purple}` : '3px solid transparent', marginBottom: -1 }}
        >
          <span style={{ fontSize: 14, fontWeight: bracketTab === 'picks' ? 600 : 400, color: bracketTab === 'picks' ? colors.navy : colors.textMuted }}>My Picks</span>
        </button>
        <button 
          onClick={() => setBracketTab('draws')} 
          style={{ flex: 1, padding: '14px', background: 'none', border: 'none', cursor: 'pointer', borderBottom: bracketTab === 'draws' ? `3px solid ${colors.purple}` : '3px solid transparent', marginBottom: -1 }}
        >
          <span style={{ fontSize: 14, fontWeight: bracketTab === 'draws' ? 600 : 400, color: bracketTab === 'draws' ? colors.navy : colors.textMuted }}>Live Draw</span>
        </button>
      </div>

      {bracketTab === 'picks' ? (
        <>
          {/* Round Tabs */}
          <div style={{ background: colors.white, padding: '8px 16px', borderBottom: `1px solid ${colors.border}`, display: 'flex', gap: 8, overflowX: 'auto' }}>
            {rounds.map((r, i) => (
              <button key={r.name} onClick={() => setBracketRound(i)} style={{
                padding: '10px 16px', borderRadius: 8, fontSize: 13, fontWeight: 600, cursor: 'pointer', whiteSpace: 'nowrap',
                background: bracketRound === i ? colors.purple : colors.bgLight,
                color: bracketRound === i ? '#fff' : colors.textMid,
                border: 'none'
              }}>
                {r.name} <span style={{ opacity: 0.7, marginLeft: 4 }}>+{r.pts}</span>
              </button>
            ))}
          </div>

          {/* Matches */}
          <div style={{ padding: 16, paddingBottom: 180 }}>
            <p style={{ fontSize: 12, fontWeight: 600, color: colors.textMuted, margin: '0 0 12px' }}>
              SELECT WINNER FOR EACH MATCH
            </p>
        
        {currentMatches.map((match, idx) => (
          <div key={match.id} style={{ background: colors.white, borderRadius: 12, marginBottom: 12, border: `1px solid ${predictions[match.id] ? colors.purple : colors.border}`, overflow: 'hidden' }}>
            <div style={{ padding: '8px 14px', background: colors.bg, borderBottom: `1px solid ${colors.border}`, display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
              <span style={{ fontSize: 11, fontWeight: 500, color: colors.textMuted }}>Match {idx + 1}</span>
              {predictions[match.id] && <Check size={14} color={colors.green} />}
            </div>
            
            {/* Player 1 */}
            <button 
              onClick={() => match.p1 && setPredictions(prev => ({ ...prev, [match.id]: match.p1 }))}
              disabled={!match.p1}
              style={{
                width: '100%', display: 'flex', alignItems: 'center', padding: '12px 14px', border: 'none', cursor: match.p1 ? 'pointer' : 'default',
                background: predictions[match.id]?.id === match.p1?.id ? colors.purpleLight : 'transparent',
                borderBottom: `1px solid ${colors.border}`
              }}
            >
              {match.p1 ? (
                <>
                  <span style={{ fontSize: 16, marginRight: 8 }}>{match.p1.flag}</span>
                  <div style={{ flex: 1, textAlign: 'left', minWidth: 0 }}>
                    <span style={{ fontSize: 14, fontWeight: 500, color: colors.navy, display: 'block', overflow: 'hidden', textOverflow: 'ellipsis', whiteSpace: 'nowrap' }}>{match.p1.name}</span>
                  </div>
                  {match.p1.seed && <span style={{ fontSize: 11, color: colors.textMuted, marginLeft: 6, flexShrink: 0 }}>[{match.p1.seed}]</span>}
                  {predictions[match.id]?.id === match.p1?.id && <Check size={18} color={colors.purple} style={{ marginLeft: 8, flexShrink: 0 }} />}
                </>
              ) : (
                <span style={{ fontSize: 13, color: colors.textMuted, fontStyle: 'italic' }}>Winner of previous round</span>
              )}
            </button>
            
            {/* Player 2 */}
            <button 
              onClick={() => match.p2 && setPredictions(prev => ({ ...prev, [match.id]: match.p2 }))}
              disabled={!match.p2}
              style={{
                width: '100%', display: 'flex', alignItems: 'center', padding: '12px 14px', border: 'none', cursor: match.p2 ? 'pointer' : 'default',
                background: predictions[match.id]?.id === match.p2?.id ? colors.purpleLight : 'transparent'
              }}
            >
              {match.p2 ? (
                <>
                  <span style={{ fontSize: 16, marginRight: 8 }}>{match.p2.flag}</span>
                  <div style={{ flex: 1, textAlign: 'left', minWidth: 0 }}>
                    <span style={{ fontSize: 14, fontWeight: 500, color: colors.navy, display: 'block', overflow: 'hidden', textOverflow: 'ellipsis', whiteSpace: 'nowrap' }}>{match.p2.name}</span>
                  </div>
                  {match.p2.seed && <span style={{ fontSize: 11, color: colors.textMuted, marginLeft: 6, flexShrink: 0 }}>[{match.p2.seed}]</span>}
                  {predictions[match.id]?.id === match.p2?.id && <Check size={18} color={colors.purple} style={{ marginLeft: 8, flexShrink: 0 }} />}
                </>
              ) : (
                <span style={{ fontSize: 13, color: colors.textMuted, fontStyle: 'italic' }}>Winner of previous round</span>
              )}
            </button>
          </div>
        ))}
      </div>

      {/* Bottom Actions - fixed above nav */}
      <div style={{ position: 'fixed', bottom: 90, left: 0, right: 0, maxWidth: 430, margin: '0 auto', padding: '12px 16px', background: colors.white, borderTop: `1px solid ${colors.border}`, boxShadow: '0 -4px 12px rgba(0,0,0,0.08)' }}>
        <div style={{ display: 'flex', gap: 12 }}>
          {bracketRound > 0 && (
            <Btn onClick={() => setBracketRound(bracketRound - 1)} style={{ flex: 1 }}>
              <ChevronLeft size={18} /> Previous
            </Btn>
          )}
          {bracketRound < totalRounds - 1 ? (
            <Btn primary onClick={() => setBracketRound(bracketRound + 1)} style={{ flex: bracketRound > 0 ? 2 : 1 }}>
              Next Round <ChevronRight size={18} />
            </Btn>
          ) : (
            <Btn primary disabled={progress < 100} onClick={() => { setSubmitStep(1); setModal('submit'); }} style={{ flex: 2 }}>
              <Check size={18} /> Submit Bracket (${activeTournament.entry})
            </Btn>
          )}
        </div>
      </div>
        </>
      ) : (
        /* DRAWS VIEW - Live bracket visualization */
        <div style={{ padding: 16, paddingBottom: 100 }}>
          <div style={{ background: colors.bgLight, borderRadius: 12, padding: 16, marginBottom: 16 }}>
            <div style={{ display: 'flex', alignItems: 'center', gap: 10, marginBottom: 12 }}>
              <Radio size={18} color={colors.red} />
              <span style={{ fontSize: 14, fontWeight: 600, color: colors.navy }}>Live Tournament Draw</span>
            </div>
            <p style={{ fontSize: 12, color: colors.textMuted, margin: 0 }}>
              View the actual tournament bracket with real-time results
            </p>
          </div>

          {/* Draw Round Selector */}
          <div style={{ display: 'flex', gap: 8, overflowX: 'auto', marginBottom: 16 }}>
            {rounds.map((r, i) => (
              <button key={r.name} onClick={() => setDrawRound(i)} style={{
                padding: '8px 14px', borderRadius: 6, fontSize: 12, fontWeight: 600, cursor: 'pointer', whiteSpace: 'nowrap',
                background: drawRound === i ? colors.navy : colors.white,
                color: drawRound === i ? '#fff' : colors.textMid,
                border: `1px solid ${drawRound === i ? colors.navy : colors.border}`
              }}>
                {r.name}
              </button>
            ))}
          </div>

          {/* Draw Matches - showing actual results */}
          {getMatchesForRound(drawRound).map((match, idx) => (
            <div key={match.id} style={{ background: colors.white, borderRadius: 10, marginBottom: 8, border: `1px solid ${colors.border}`, overflow: 'hidden' }}>
              <div style={{ padding: '6px 12px', background: colors.bgLight, borderBottom: `1px solid ${colors.border}`, display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
                <span style={{ fontSize: 10, fontWeight: 500, color: colors.textMuted }}>Match {idx + 1}</span>
                {drawRound === 0 && idx < 3 && (
                  <span style={{ fontSize: 9, fontWeight: 600, color: colors.green, background: colors.greenLight, padding: '2px 6px', borderRadius: 4 }}>COMPLETED</span>
                )}
                {drawRound === 0 && idx === 3 && (
                  <span style={{ fontSize: 9, fontWeight: 600, color: colors.red, background: colors.redLight, padding: '2px 6px', borderRadius: 4 }}>LIVE</span>
                )}
              </div>
              
              {/* Player 1 */}
              <div style={{ display: 'flex', alignItems: 'center', padding: '10px 12px', borderBottom: `1px solid ${colors.border}`, background: drawRound === 0 && idx < 3 && idx % 2 === 0 ? colors.greenLight : 'transparent' }}>
                {match.p1 ? (
                  <>
                    <span style={{ fontSize: 14, marginRight: 8 }}>{match.p1.flag}</span>
                    <span style={{ flex: 1, fontSize: 13, fontWeight: 500, color: colors.navy }}>{match.p1.name}</span>
                    {match.p1.seed && <span style={{ fontSize: 10, color: colors.textMuted, marginRight: 8 }}>[{match.p1.seed}]</span>}
                    {drawRound === 0 && idx < 4 && <span style={{ fontSize: 12, fontWeight: 600, color: colors.navy }}>6 6</span>}
                  </>
                ) : (
                  <span style={{ fontSize: 12, color: colors.textMuted, fontStyle: 'italic' }}>TBD</span>
                )}
              </div>
              
              {/* Player 2 */}
              <div style={{ display: 'flex', alignItems: 'center', padding: '10px 12px', background: drawRound === 0 && idx < 3 && idx % 2 === 1 ? colors.greenLight : 'transparent' }}>
                {match.p2 ? (
                  <>
                    <span style={{ fontSize: 14, marginRight: 8 }}>{match.p2.flag}</span>
                    <span style={{ flex: 1, fontSize: 13, fontWeight: 500, color: colors.navy }}>{match.p2.name}</span>
                    {match.p2.seed && <span style={{ fontSize: 10, color: colors.textMuted, marginRight: 8 }}>[{match.p2.seed}]</span>}
                    {drawRound === 0 && idx < 4 && <span style={{ fontSize: 12, fontWeight: 500, color: colors.textMuted }}>3 4</span>}
                  </>
                ) : (
                  <span style={{ fontSize: 12, color: colors.textMuted, fontStyle: 'italic' }}>TBD</span>
                )}
              </div>
            </div>
          ))}
        </div>
      )}
    </div>
  );
  };

  // LIVE VIEW - Live matches
  const LiveView = () => (
    <div style={{ background: colors.bg, minHeight: '100vh' }}>
      <AppHeader title="Live Scores" showBack />
      
      <TabBar 
        tabs={[{ id: 'live', label: 'Live' }, { id: 'completed', label: 'Completed' }, { id: 'upcoming', label: 'Upcoming' }]} 
        active={liveTab} 
        onChange={setLiveTab}
        light
      />

      <div style={{ padding: 16 }}>
        {/* Live Matches */}
        {liveTab === 'live' && (
          <>
            {liveMatchesData.map(m => (
              <div key={m.id} style={{ background: colors.white, borderRadius: 12, marginBottom: 12, border: `1px solid ${colors.border}`, overflow: 'hidden' }}>
                {/* Header */}
                <div style={{ padding: '12px 16px', background: colors.bg, borderBottom: `1px solid ${colors.border}`, display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
                  <div>
                    <span style={{ fontSize: 13, fontWeight: 600, color: colors.navy }}>{m.tournament}</span>
                    <span style={{ fontSize: 12, color: colors.textMuted, marginLeft: 8 }}>{m.round}</span>
                  </div>
                  <div style={{ display: 'flex', alignItems: 'center', gap: 8 }}>
                    <span style={{ width: 8, height: 8, borderRadius: 4, background: colors.red, animation: 'pulse 2s infinite' }} />
                    <span style={{ fontSize: 13, fontWeight: 600, color: colors.red }}>{m.time}</span>
                  </div>
                </div>
                
                {/* Players */}
                <div style={{ padding: 16 }}>
                  {/* Player 1 */}
                  <div style={{ display: 'flex', alignItems: 'center', marginBottom: 12 }}>
                    <span style={{ fontSize: 20, marginRight: 10 }}>{m.p1.flag}</span>
                    <div style={{ flex: 1 }}>
                      <span style={{ fontSize: 15, fontWeight: 600, color: colors.navy }}>{m.p1.name}</span>
                      <span style={{ fontSize: 12, color: colors.textMuted, marginLeft: 6 }}>[{m.p1.seed}]</span>
                    </div>
                    {m.p1.serving && <div style={{ width: 8, height: 8, borderRadius: 4, background: colors.green, marginRight: 12 }} />}
                    <div style={{ display: 'flex', gap: 12 }}>
                      {m.p1.sets.map((s, i) => (
                        <span key={i} style={{ fontSize: 18, fontWeight: 600, color: colors.navy, minWidth: 20, textAlign: 'center' }}>{s}</span>
                      ))}
                    </div>
                  </div>
                  
                  {/* Player 2 */}
                  <div style={{ display: 'flex', alignItems: 'center' }}>
                    <span style={{ fontSize: 20, marginRight: 10 }}>{m.p2.flag}</span>
                    <div style={{ flex: 1 }}>
                      <span style={{ fontSize: 15, color: colors.textMid }}>{m.p2.name}</span>
                      <span style={{ fontSize: 12, color: colors.textMuted, marginLeft: 6 }}>[{m.p2.seed}]</span>
                    </div>
                    {m.p2.serving && <div style={{ width: 8, height: 8, borderRadius: 4, background: colors.green, marginRight: 12 }} />}
                    <div style={{ display: 'flex', gap: 12 }}>
                      {m.p2.sets.map((s, i) => (
                        <span key={i} style={{ fontSize: 18, color: colors.textMid, minWidth: 20, textAlign: 'center' }}>{s}</span>
                      ))}
                    </div>
                  </div>
                </div>
                
                {/* Stats Preview */}
                <div style={{ padding: '12px 16px', background: colors.bg, borderTop: `1px solid ${colors.border}`, display: 'flex', justifyContent: 'space-around' }}>
                  <div style={{ textAlign: 'center' }}>
                    <p style={{ fontSize: 11, color: colors.textMuted, margin: 0 }}>Aces</p>
                    <p style={{ fontSize: 13, fontWeight: 600, color: colors.navy, margin: '2px 0 0' }}>{m.stats.aces[0]} - {m.stats.aces[1]}</p>
                  </div>
                  <div style={{ textAlign: 'center' }}>
                    <p style={{ fontSize: 11, color: colors.textMuted, margin: 0 }}>Winners</p>
                    <p style={{ fontSize: 13, fontWeight: 600, color: colors.navy, margin: '2px 0 0' }}>{m.stats.winners[0]} - {m.stats.winners[1]}</p>
                  </div>
                  <div style={{ textAlign: 'center' }}>
                    <p style={{ fontSize: 11, color: colors.textMuted, margin: 0 }}>Errors</p>
                    <p style={{ fontSize: 13, fontWeight: 600, color: colors.navy, margin: '2px 0 0' }}>{m.stats.errors[0]} - {m.stats.errors[1]}</p>
                  </div>
                </div>
              </div>
            ))}
          </>
        )}

        {/* Completed Matches */}
        {liveTab === 'completed' && (
          <>
            {completedMatches.map(m => (
              <div key={m.id} style={{ background: colors.white, borderRadius: 12, marginBottom: 12, border: `1px solid ${colors.border}`, padding: 16 }}>
                <div style={{ display: 'flex', justifyContent: 'space-between', marginBottom: 12 }}>
                  <span style={{ fontSize: 13, color: colors.textMuted }}>{m.tournament} • {m.round}</span>
                  <span style={{ fontSize: 12, color: colors.textMuted }}>{m.duration}</span>
                </div>
                
                {/* Player 1 */}
                <div style={{ display: 'flex', alignItems: 'center', marginBottom: 10 }}>
                  <span style={{ fontSize: 18, marginRight: 10 }}>{m.p1.flag}</span>
                  <span style={{ flex: 1, fontSize: 15, fontWeight: m.p1.winner ? 600 : 400, color: colors.navy }}>{m.p1.name}</span>
                  {m.p1.winner && <Check size={18} color={colors.green} style={{ marginRight: 12 }} />}
                  <div style={{ display: 'flex', gap: 10 }}>
                    {m.p1.sets.map((s, i) => <span key={i} style={{ fontSize: 16, fontWeight: 600, color: colors.navy }}>{s}</span>)}
                  </div>
                </div>
                
                {/* Player 2 */}
                <div style={{ display: 'flex', alignItems: 'center' }}>
                  <span style={{ fontSize: 18, marginRight: 10 }}>{m.p2.flag}</span>
                  <span style={{ flex: 1, fontSize: 15, color: colors.textMid }}>{m.p2.name}</span>
                  {m.p2.winner && <Check size={18} color={colors.green} style={{ marginRight: 12 }} />}
                  <div style={{ display: 'flex', gap: 10 }}>
                    {m.p2.sets.map((s, i) => <span key={i} style={{ fontSize: 16, color: colors.textMid }}>{s}</span>)}
                  </div>
                </div>
              </div>
            ))}
          </>
        )}

        {/* Upcoming Matches */}
        {liveTab === 'upcoming' && (
          <>
            {upcomingMatches.map(m => (
              <div key={m.id} style={{ background: colors.white, borderRadius: 12, marginBottom: 12, border: `1px solid ${colors.border}`, padding: 16 }}>
                <div style={{ display: 'flex', justifyContent: 'space-between', marginBottom: 12 }}>
                  <span style={{ fontSize: 13, color: colors.textMuted }}>{m.tournament} • {m.round}</span>
                  <span style={{ fontSize: 14, fontWeight: 600, color: colors.purple }}>{m.time}</span>
                </div>
                
                <div style={{ display: 'flex', alignItems: 'center', marginBottom: 10 }}>
                  <span style={{ fontSize: 18, marginRight: 10 }}>{m.p1.flag}</span>
                  <span style={{ flex: 1, fontSize: 15, fontWeight: 500, color: colors.navy }}>{m.p1.name}</span>
                  <span style={{ fontSize: 12, color: colors.textMuted }}>[{m.p1.seed}]</span>
                </div>
                
                <div style={{ display: 'flex', alignItems: 'center' }}>
                  <span style={{ fontSize: 18, marginRight: 10 }}>{m.p2.flag}</span>
                  <span style={{ flex: 1, fontSize: 15, fontWeight: 500, color: colors.navy }}>{m.p2.name}</span>
                  <span style={{ fontSize: 12, color: colors.textMuted }}>[{m.p2.seed}]</span>
                </div>
                
                <p style={{ fontSize: 12, color: colors.textMuted, marginTop: 12 }}>{m.court}</p>
              </div>
            ))}
          </>
        )}
      </div>
    </div>
  );

  // CALENDAR VIEW - ATP Style with month headers
  const CalendarView = () => {
    const months = [...new Set(tournaments.map(t => t.month))];
    
    return (
      <div style={{ background: colors.bg, minHeight: '100vh' }}>
        <AppHeader />
        
        <div style={{ background: `linear-gradient(135deg, ${colors.gradientStart}, ${colors.gradientMid})`, padding: '0 16px 16px' }}>
          <TabBar 
            tabs={[{ id: 'all', label: 'ATP Tour' }, { id: 'my', label: `My Brackets${myBrackets.length > 0 ? ` (${myBrackets.length})` : ''}` }]} 
            active={calendarTab} 
            onChange={setCalendarTab} 
          />
        </div>

        {/* MY BRACKETS TAB */}
        {calendarTab === 'my' && (
          <div style={{ padding: 16, paddingBottom: 100 }}>
            {myBrackets.length === 0 ? (
              <div style={{ background: colors.white, borderRadius: 12, padding: 32, textAlign: 'center', border: `1px solid ${colors.border}` }}>
                <div style={{ width: 64, height: 64, borderRadius: 32, background: colors.purpleLight, display: 'flex', alignItems: 'center', justifyContent: 'center', margin: '0 auto 16px' }}>
                  <Target size={28} color={colors.purple} />
                </div>
                <h3 style={{ fontSize: 18, fontWeight: 600, color: colors.navy, margin: '0 0 8px' }}>No Brackets Yet</h3>
                <p style={{ fontSize: 14, color: colors.textMuted, margin: '0 0 20px' }}>Enter a tournament to create your first bracket prediction!</p>
                <Btn primary onClick={() => setCalendarTab('all')}>Browse Tournaments</Btn>
              </div>
            ) : (
              <>
                {myBrackets.map(bracket => (
                  <div key={bracket.id} style={{ background: colors.white, borderRadius: 12, marginBottom: 12, border: `1px solid ${colors.border}`, overflow: 'hidden' }}>
                    {/* Header */}
                    <div style={{ padding: 16, borderBottom: `1px solid ${colors.border}` }}>
                      <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'start', marginBottom: 8 }}>
                        <div>
                          <span style={{ fontSize: 11, fontWeight: 600, color: colors.textMuted }}>{bracket.tournament.type.toUpperCase()}</span>
                          <h3 style={{ fontSize: 17, fontWeight: 600, color: colors.navy, margin: '2px 0' }}>{bracket.tournament.name}</h3>
                          <p style={{ fontSize: 12, color: colors.textMuted, margin: 0 }}>{bracket.tournament.dates} {bracket.tournament.dateSuffix}</p>
                        </div>
                        <span style={{ fontSize: 10, fontWeight: 600, padding: '4px 10px', borderRadius: 4, background: bracket.status === 'active' ? colors.greenLight : colors.bg, color: bracket.status === 'active' ? colors.green : colors.textMuted }}>
                          {bracket.status === 'active' ? 'ACTIVE' : bracket.status.toUpperCase()}
                        </span>
                      </div>
                    </div>
                    
                    {/* Champion & Black Horse */}
                    <div style={{ padding: 16, background: colors.bg }}>
                      <div style={{ display: 'flex', gap: 16 }}>
                        {/* Champion */}
                        <div style={{ flex: 1 }}>
                          <p style={{ fontSize: 10, color: colors.textMuted, margin: '0 0 6px' }}>CHAMPION</p>
                          <div style={{ display: 'flex', alignItems: 'center', gap: 8 }}>
                            <span style={{ fontSize: 24 }}>{bracket.champion?.flag}</span>
                            <div>
                              <p style={{ fontSize: 14, fontWeight: 600, color: colors.navy, margin: 0 }}>{bracket.champion?.name}</p>
                              <p style={{ fontSize: 11, color: colors.textMuted, margin: 0 }}>[{bracket.champion?.seed}]</p>
                            </div>
                          </div>
                        </div>
                        {/* Black Horse */}
                        {bracket.blackHorse && (
                          <div style={{ flex: 1 }}>
                            <p style={{ fontSize: 10, color: colors.orange, margin: '0 0 6px' }}>🐴 BLACK HORSE</p>
                            <div style={{ display: 'flex', alignItems: 'center', gap: 8 }}>
                              <span style={{ fontSize: 24 }}>{bracket.blackHorse.flag}</span>
                              <div>
                                <p style={{ fontSize: 14, fontWeight: 600, color: colors.navy, margin: 0 }}>{bracket.blackHorse.name}</p>
                                <p style={{ fontSize: 11, color: colors.orange, margin: 0 }}>1.5x pts</p>
                              </div>
                            </div>
                          </div>
                        )}
                      </div>
                    </div>
                    
                    {/* Stats */}
                    <div style={{ padding: 16, display: 'flex', gap: 16 }}>
                      <div>
                        <p style={{ fontSize: 11, color: colors.textMuted, margin: 0 }}>Entry</p>
                        <p style={{ fontSize: 14, fontWeight: 600, color: colors.navy, margin: '2px 0 0' }}>${bracket.tournament.entry}</p>
                      </div>
                      <div>
                        <p style={{ fontSize: 11, color: colors.textMuted, margin: 0 }}>Prize Pool</p>
                        <p style={{ fontSize: 14, fontWeight: 600, color: colors.purple, margin: '2px 0 0' }}>${bracket.tournament.pool?.toLocaleString()}</p>
                      </div>
                      <div>
                        <p style={{ fontSize: 11, color: colors.textMuted, margin: 0 }}>Points</p>
                        <p style={{ fontSize: 14, fontWeight: 600, color: colors.green, margin: '2px 0 0' }}>{bracket.points}</p>
                      </div>
                      <button onClick={() => setSelectedBracket(bracket)} style={{ marginLeft: 'auto', padding: '8px 14px', borderRadius: 6, background: colors.purpleLight, border: 'none', cursor: 'pointer' }}>
                        <span style={{ fontSize: 12, fontWeight: 600, color: colors.purple }}>View</span>
                      </button>
                    </div>
                  </div>
                ))}
              </>
            )}
          </div>
        )}

        {/* ATP TOUR TAB */}
        {calendarTab === 'all' && (
          <>
            {/* Search */}
            <div style={{ padding: 16, background: colors.bg }}>
              <div style={{ display: 'flex', alignItems: 'center', gap: 10, background: colors.white, borderRadius: 8, padding: '12px 16px', border: `1px solid ${colors.border}` }}>
                <Search size={18} color={colors.textMuted} />
                <span style={{ fontSize: 14, color: colors.textMuted }}>Search tournaments</span>
              </div>
            </div>

            {/* Tournament List by Month */}
            {months.map(month => (
              <div key={month}>
                {/* Month Header */}
                <div style={{ background: '#E5E5EA', padding: '10px 16px' }}>
                  <span style={{ fontSize: 15, fontWeight: 600, color: colors.navy }}>{month}</span>
                </div>
                
                {/* Tournaments in this month */}
                <div style={{ background: colors.white }}>
                  {tournaments.filter(t => t.month === month).map(t => {
                    const hasEntered = myBrackets.some(b => b.tournament.id === t.id);
                    return (
                      <div key={t.id} style={{ display: 'flex', padding: 16, borderBottom: `1px solid ${colors.border}` }}>
                        {/* Date column */}
                        <div style={{ width: 65, paddingRight: 12, borderRight: `2px solid ${colors.purple}`, marginRight: 14 }}>
                          <p style={{ fontSize: 13, fontWeight: 500, color: colors.textMid, margin: 0 }}>{t.dates}</p>
                          <p style={{ fontSize: 13, color: colors.textMuted, margin: '2px 0 0' }}>{t.dateSuffix}</p>
                        </div>
                        
                        {/* Tournament info */}
                        <div style={{ flex: 1 }}>
                          <div style={{ marginBottom: 6 }}>
                            {t.type === 'grandslam' && (
                              <span style={{ fontSize: 15, fontWeight: 800, letterSpacing: 1, color: colors.navy }}>GRAND SLAM</span>
                            )}
                            {t.type === 'atp1000' && (
                              <div style={{ display: 'flex', alignItems: 'baseline' }}>
                                <span style={{ fontFamily: 'system-ui', fontStyle: 'italic', fontWeight: 800, fontSize: 16, color: colors.navy, letterSpacing: -0.5 }}>ATP</span>
                                <span style={{ fontFamily: 'system-ui', fontWeight: 800, fontSize: 16, color: colors.navy, letterSpacing: -0.5 }}>1000</span>
                              </div>
                            )}
                            {t.type === 'atp500' && (
                              <div style={{ display: 'flex', alignItems: 'baseline' }}>
                                <span style={{ fontFamily: 'system-ui', fontStyle: 'italic', fontWeight: 800, fontSize: 16, color: colors.navy, letterSpacing: -0.5 }}>ATP</span>
                                <span style={{ fontFamily: 'system-ui', fontWeight: 800, fontSize: 16, color: colors.navy, letterSpacing: -0.5 }}>500</span>
                              </div>
                            )}
                            {t.type === 'atp250' && (
                              <div style={{ display: 'flex', alignItems: 'baseline' }}>
                                <span style={{ fontFamily: 'system-ui', fontStyle: 'italic', fontWeight: 800, fontSize: 16, color: colors.navy, letterSpacing: -0.5 }}>ATP</span>
                                <span style={{ fontFamily: 'system-ui', fontWeight: 800, fontSize: 16, color: colors.navy, letterSpacing: -0.5 }}>250</span>
                              </div>
                            )}
                          </div>
                          <h3 style={{ fontSize: 16, fontWeight: 600, color: colors.navy, margin: '0 0 2px' }}>{t.name}</h3>
                          <p style={{ fontSize: 13, color: colors.textMuted, margin: 0 }}>{t.subtitle}</p>
                          
                          {t.pool > 0 && (
                            <div style={{ display: 'flex', alignItems: 'center', gap: 8, marginTop: 8 }}>
                              <span style={{ fontSize: 11, fontWeight: 600, color: colors.purple, background: colors.purpleLight, padding: '4px 8px', borderRadius: 4 }}>
                                ${t.pool.toLocaleString()}
                              </span>
                              {t.status === 'live' && <span style={{ fontSize: 10, fontWeight: 600, color: colors.red, background: colors.redLight, padding: '4px 8px', borderRadius: 4 }}>LIVE</span>}
                              {t.status === 'open' && <span style={{ fontSize: 10, fontWeight: 600, color: colors.green, background: colors.greenLight, padding: '4px 8px', borderRadius: 4 }}>OPEN</span>}
                              {hasEntered && <span style={{ fontSize: 10, fontWeight: 600, color: colors.purple, background: colors.purpleLight, padding: '4px 8px', borderRadius: 4 }}>ENTERED</span>}
                            </div>
                          )}
                        </div>
                        
                        {/* Actions */}
                        <div style={{ display: 'flex', alignItems: 'center', gap: 10 }}>
                          {(t.status === 'live' || t.status === 'open') && !hasEntered && (
                            <button onClick={() => { setActiveTournament(t); setView('bracket'); }} style={{ padding: '8px 14px', borderRadius: 6, background: colors.purple, border: 'none', cursor: 'pointer' }}>
                              <span style={{ fontSize: 12, fontWeight: 600, color: '#fff' }}>Enter</span>
                            </button>
                          )}
                          {hasEntered && (
                            <button onClick={() => { setCalendarTab('my'); }} style={{ padding: '8px 14px', borderRadius: 6, background: colors.greenLight, border: 'none', cursor: 'pointer' }}>
                              <span style={{ fontSize: 12, fontWeight: 600, color: colors.green }}>View</span>
                            </button>
                          )}
                          <Heart size={22} color={colors.purple} strokeWidth={1.5} style={{ cursor: 'pointer' }} />
                        </div>
                      </div>
                    );
                  })}
                </div>
              </div>
            ))}
            
            <div style={{ height: 100 }} />
          </>
        )}
      </div>
    );
  };

  // RANKINGS VIEW - TOP 30
  const RankingsView = () => (
    <div style={{ background: colors.bg, minHeight: '100vh' }}>
      <AppHeader />
      
      <div style={{ background: colors.white, padding: 16, borderBottom: `1px solid ${colors.border}` }}>
        <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between' }}>
          <div style={{ display: 'flex', alignItems: 'center', gap: 8 }}>
            <span style={{ fontSize: 18, fontWeight: 700, color: colors.navy }}>mobaOne</span>
            <span style={{ fontSize: 18, color: colors.purple }}>RANKINGS</span>
          </div>
          <span style={{ fontSize: 13, color: colors.textMuted }}>TOP 30</span>
        </div>
      </div>

      <div style={{ background: colors.bg, padding: '12px 16px', display: 'flex', borderBottom: `1px solid ${colors.border}` }}>
        <span style={{ width: 45, fontSize: 12, fontWeight: 500, color: colors.textMuted }}>Rank</span>
        <span style={{ flex: 1, fontSize: 12, fontWeight: 500, color: colors.textMuted }}>Player</span>
        <span style={{ width: 55, fontSize: 12, fontWeight: 500, color: colors.textMuted, textAlign: 'right' }}>Points</span>
        <span style={{ width: 45, fontSize: 12, fontWeight: 500, color: colors.textMuted, textAlign: 'right' }}>Win%</span>
      </div>

      <div style={{ background: colors.white, paddingBottom: 100 }}>
        {rankings.map(p => (
          <div key={p.rank} onClick={() => setSelPlayer(p)} style={{ display: 'flex', alignItems: 'center', padding: '12px 16px', borderBottom: `1px solid ${colors.border}`, cursor: 'pointer' }}>
            <span style={{ width: 45, fontSize: 15, fontWeight: 600, color: p.rank <= 3 ? colors.orange : colors.navy }}>
              {p.rank <= 3 ? ['🥇','🥈','🥉'][p.rank-1] : p.rank}
            </span>
            <div style={{ flex: 1, display: 'flex', alignItems: 'center', gap: 8 }}>
              <div style={{ width: 34, height: 34, borderRadius: 17, background: p.rank <= 3 ? colors.orange : colors.purpleLight, display: 'flex', alignItems: 'center', justifyContent: 'center', fontSize: 13, fontWeight: 600, color: p.rank <= 3 ? '#fff' : colors.purple }}>{p.name[0]}</div>
              <span style={{ fontSize: 15 }}>{p.flag}</span>
              <div>
                <p style={{ fontSize: 14, fontWeight: 500, color: colors.navy, margin: 0 }}>{p.name}</p>
                <p style={{ fontSize: 11, color: colors.textMuted, margin: '2px 0 0' }}>Played {p.played}</p>
              </div>
            </div>
            <span style={{ width: 55, fontSize: 14, fontWeight: 600, color: colors.navy, textAlign: 'right' }}>{p.pts.toLocaleString()}</span>
            <span style={{ width: 45, fontSize: 13, fontWeight: 500, color: colors.green, textAlign: 'right' }}>{p.winRate}%</span>
          </div>
        ))}
      </div>
    </div>
  );

  // WALLET VIEW
  const WalletView = () => (
    <div style={{ background: colors.bg, minHeight: '100vh' }}>
      <div style={{ background: `linear-gradient(135deg, ${colors.gradientStart}, ${colors.gradientEnd})`, padding: 20 }}>
        <Logo />
        <div style={{ marginTop: 20 }}>
          <p style={{ fontSize: 13, color: 'rgba(255,255,255,0.7)', margin: '0 0 4px' }}>Available Balance</p>
          <p style={{ fontSize: 36, fontWeight: 700, color: '#fff', margin: 0 }}>${balance.toLocaleString()}.00</p>
        </div>
        <div style={{ display: 'flex', gap: 12, marginTop: 20 }}>
          <Btn primary onClick={() => { setDepStep(1); setDepAmt(''); setModal('deposit'); }} style={{ flex: 1, background: '#fff', color: colors.purple }}><Plus size={18} /> Add Funds</Btn>
          <Btn onClick={() => { setWithdrawStep(1); setWithdrawAmt(''); setModal('withdraw'); }} style={{ flex: 1, background: 'rgba(255,255,255,0.2)', border: 'none', color: '#fff' }}><ArrowUp size={18} /> Withdraw</Btn>
        </div>
      </div>

      <div style={{ padding: 16, paddingBottom: 100 }}>
        <div style={{ display: 'flex', gap: 12, marginBottom: 20 }}>
          <div style={{ flex: 1, background: colors.white, borderRadius: 12, padding: 16, border: `1px solid ${colors.border}` }}>
            <TrendingUp size={18} color={colors.green} />
            <p style={{ fontSize: 11, color: colors.textMuted, margin: '8px 0 4px' }}>Total Earnings</p>
            <p style={{ fontSize: 22, fontWeight: 700, color: colors.green, margin: 0 }}>+${user.earn.toLocaleString()}</p>
          </div>
          <div style={{ flex: 1, background: colors.white, borderRadius: 12, padding: 16, border: `1px solid ${colors.border}` }}>
            <Trophy size={18} color={colors.purple} />
            <p style={{ fontSize: 11, color: colors.textMuted, margin: '8px 0 4px' }}>Win Rate</p>
            <p style={{ fontSize: 22, fontWeight: 700, color: colors.navy, margin: 0 }}>{user.win}%</p>
          </div>
        </div>

        <p style={{ fontSize: 14, fontWeight: 600, color: colors.navy, margin: '0 0 12px' }}>Recent Transactions</p>
        <div style={{ background: colors.white, borderRadius: 12, border: `1px solid ${colors.border}`, overflow: 'hidden' }}>
          {userTransactions.map((t, i) => (
            <div key={t.id} style={{ display: 'flex', alignItems: 'center', padding: 16, borderBottom: i < userTransactions.length - 1 ? `1px solid ${colors.border}` : 'none' }}>
              <div style={{ width: 40, height: 40, borderRadius: 20, background: t.amt > 0 ? colors.greenLight : colors.purpleLight, display: 'flex', alignItems: 'center', justifyContent: 'center', marginRight: 12 }}>
                {t.amt > 0 ? <ArrowDown size={18} color={colors.green} /> : <ArrowUp size={18} color={colors.purple} />}
              </div>
              <div style={{ flex: 1 }}>
                <p style={{ fontSize: 14, fontWeight: 500, color: colors.navy, margin: 0 }}>{t.title}</p>
                <p style={{ fontSize: 12, color: colors.textMuted, margin: '2px 0 0' }}>{t.desc}</p>
              </div>
              <div style={{ textAlign: 'right' }}>
                <p style={{ fontSize: 15, fontWeight: 600, color: t.amt > 0 ? colors.green : colors.navy, margin: 0 }}>{t.amt > 0 ? '+' : '-'}${Math.abs(t.amt).toLocaleString()}</p>
                <p style={{ fontSize: 11, color: colors.textMuted, margin: '2px 0 0' }}>{t.date}</p>
              </div>
            </div>
          ))}
        </div>
      </div>
    </div>
  );

  // DEPOSIT MODAL
  const DepositModal = () => {
    if (depStep === 3) {
      return (
        <Modal title="Success" onClose={() => setModal(null)}>
          <div style={{ padding: 32, textAlign: 'center' }}>
            <div style={{ width: 72, height: 72, borderRadius: 36, background: colors.greenLight, display: 'flex', alignItems: 'center', justifyContent: 'center', margin: '0 auto 20px' }}>
              <CheckCircle size={36} color={colors.green} />
            </div>
            <p style={{ fontSize: 15, color: colors.textMid }}>Successfully deposited</p>
            <p style={{ fontSize: 36, fontWeight: 700, color: colors.green, margin: '8px 0' }}>+${depAmt}</p>
            <Btn primary full onClick={() => setModal(null)} style={{ marginTop: 24 }}>Done</Btn>
          </div>
        </Modal>
      );
    }

    return (
      <Modal title="Add Funds" onClose={() => setModal(null)}>
        <div style={{ padding: 16 }}>
          {depStep === 1 ? (
            <>
              <p style={{ fontSize: 13, color: colors.textMuted, margin: '0 0 10px' }}>Amount</p>
              <div style={{ position: 'relative', marginBottom: 20 }}>
                <span style={{ position: 'absolute', left: 18, top: '50%', transform: 'translateY(-50%)', fontSize: 24, fontWeight: 600, color: colors.textMuted }}>$</span>
                <input type="number" value={depAmt} onChange={(e) => setDepAmt(e.target.value)} placeholder="0"
                  style={{ width: '100%', padding: '18px 18px 18px 45px', fontSize: 28, fontWeight: 700, background: colors.bg, border: `2px solid ${depAmt ? colors.purple : colors.border}`, borderRadius: 12, color: colors.navy, outline: 'none' }} />
              </div>
              <div style={{ display: 'flex', gap: 8, marginBottom: 24 }}>
                {[50, 100, 200, 500].map(v => (
                  <button key={v} onClick={() => setDepAmt(v.toString())} style={{
                    flex: 1, padding: 12, borderRadius: 8, fontSize: 14, fontWeight: 600, cursor: 'pointer',
                    background: depAmt === v.toString() ? colors.purpleLight : colors.bg,
                    border: `1px solid ${depAmt === v.toString() ? colors.purple : colors.border}`,
                    color: depAmt === v.toString() ? colors.purple : colors.textMid
                  }}>${v}</button>
                ))}
              </div>
              <Btn primary full disabled={!depAmt || parseFloat(depAmt) < 10} onClick={() => setDepStep(2)}>Continue</Btn>
            </>
          ) : (
            <>
              <div style={{ background: colors.bg, borderRadius: 12, padding: 16, marginBottom: 20 }}>
                <div style={{ display: 'flex', justifyContent: 'space-between', marginBottom: 12 }}>
                  <span style={{ color: colors.textMuted }}>Amount</span>
                  <span style={{ color: colors.navy, fontWeight: 600 }}>${depAmt}</span>
                </div>
                <div style={{ display: 'flex', justifyContent: 'space-between' }}>
                  <span style={{ color: colors.textMuted }}>Fee</span>
                  <span style={{ color: colors.green }}>$0.00</span>
                </div>
                <div style={{ height: 1, background: colors.border, margin: '12px 0' }} />
                <div style={{ display: 'flex', justifyContent: 'space-between' }}>
                  <span style={{ fontWeight: 500, color: colors.navy }}>Total</span>
                  <span style={{ fontWeight: 700, fontSize: 20, color: colors.purple }}>${depAmt}</span>
                </div>
              </div>
              <div style={{ display: 'flex', gap: 12 }}>
                <Btn onClick={() => setDepStep(1)} style={{ flex: 1 }}>Back</Btn>
                <Btn primary onClick={() => { setBalance(balance + parseFloat(depAmt)); setDepStep(3); }} style={{ flex: 2 }}>Confirm</Btn>
              </div>
            </>
          )}
        </div>
      </Modal>
    );
  };

  // WITHDRAW MODAL
  const WithdrawModal = () => {
    const canWithdraw = withdrawAmt && parseFloat(withdrawAmt) >= 20 && parseFloat(withdrawAmt) <= balance;
    
    if (withdrawStep === 3) {
      return (
        <Modal title="Success" onClose={() => setModal(null)}>
          <div style={{ padding: 32, textAlign: 'center' }}>
            <div style={{ width: 72, height: 72, borderRadius: 36, background: colors.greenLight, display: 'flex', alignItems: 'center', justifyContent: 'center', margin: '0 auto 20px' }}>
              <CheckCircle size={36} color={colors.green} />
            </div>
            <p style={{ fontSize: 15, color: colors.textMid }}>Withdrawal initiated</p>
            <p style={{ fontSize: 36, fontWeight: 700, color: colors.navy, margin: '8px 0' }}>${withdrawAmt}</p>
            <p style={{ fontSize: 13, color: colors.textMuted }}>1-3 business days to Bank ····7891</p>
            <Btn primary full onClick={() => setModal(null)} style={{ marginTop: 24 }}>Done</Btn>
          </div>
        </Modal>
      );
    }

    return (
      <Modal title="Withdraw" onClose={() => setModal(null)}>
        <div style={{ padding: 16 }}>
          {withdrawStep === 1 ? (
            <>
              {/* Available balance */}
              <div style={{ background: colors.bg, borderRadius: 12, padding: 16, marginBottom: 20, display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
                <span style={{ fontSize: 14, color: colors.textMuted }}>Available Balance</span>
                <span style={{ fontSize: 20, fontWeight: 700, color: colors.navy }}>${balance.toLocaleString()}</span>
              </div>
              
              {/* Amount input */}
              <p style={{ fontSize: 13, color: colors.textMuted, margin: '0 0 10px' }}>Amount to withdraw</p>
              <div style={{ position: 'relative', marginBottom: 12 }}>
                <span style={{ position: 'absolute', left: 18, top: '50%', transform: 'translateY(-50%)', fontSize: 24, fontWeight: 600, color: colors.textMuted }}>$</span>
                <input
                  type="number"
                  value={withdrawAmt}
                  onChange={(e) => setWithdrawAmt(e.target.value)}
                  placeholder="0"
                  style={{ width: '100%', padding: '18px 18px 18px 45px', fontSize: 28, fontWeight: 700, background: colors.bg, border: `2px solid ${withdrawAmt ? colors.purple : colors.border}`, borderRadius: 12, color: colors.navy, outline: 'none' }}
                />
              </div>
              
              {/* Withdraw all button */}
              <button onClick={() => setWithdrawAmt(balance.toString())} style={{ marginBottom: 20, padding: '8px 14px', background: colors.purpleLight, border: `1px solid ${colors.purple}`, borderRadius: 8, color: colors.purple, fontSize: 12, fontWeight: 600, cursor: 'pointer' }}>
                Withdraw All (${balance.toLocaleString()})
              </button>
              
              {/* Withdraw to */}
              <p style={{ fontSize: 13, color: colors.textMuted, margin: '0 0 10px' }}>Withdraw to</p>
              <div style={{ background: colors.purpleLight, border: `2px solid ${colors.purple}`, borderRadius: 10, padding: 14, marginBottom: 20, display: 'flex', alignItems: 'center', gap: 12 }}>
                <div style={{ width: 40, height: 40, borderRadius: 8, background: colors.purple, display: 'flex', alignItems: 'center', justifyContent: 'center' }}>
                  <span style={{ fontSize: 18 }}>🏦</span>
                </div>
                <div>
                  <p style={{ fontSize: 14, fontWeight: 600, color: colors.navy, margin: 0 }}>Bank Account</p>
                  <p style={{ fontSize: 12, color: colors.textMuted, margin: '2px 0 0' }}>····7891</p>
                </div>
                <Check size={20} color={colors.purple} style={{ marginLeft: 'auto' }} />
              </div>
              
              {/* Min amount note */}
              <p style={{ fontSize: 12, color: colors.textMuted, marginBottom: 16 }}>Minimum withdrawal: $20</p>
              
              <Btn primary full disabled={!canWithdraw} onClick={() => setWithdrawStep(2)}>
                Continue
              </Btn>
            </>
          ) : (
            <>
              {/* Confirmation */}
              <div style={{ background: colors.bg, borderRadius: 12, padding: 16, marginBottom: 20 }}>
                <div style={{ display: 'flex', justifyContent: 'space-between', marginBottom: 12 }}>
                  <span style={{ color: colors.textMuted }}>Amount</span>
                  <span style={{ color: colors.navy, fontWeight: 600 }}>${parseFloat(withdrawAmt).toLocaleString()}</span>
                </div>
                <div style={{ display: 'flex', justifyContent: 'space-between', marginBottom: 12 }}>
                  <span style={{ color: colors.textMuted }}>Fee</span>
                  <span style={{ color: colors.green }}>$0.00</span>
                </div>
                <div style={{ display: 'flex', justifyContent: 'space-between', marginBottom: 12 }}>
                  <span style={{ color: colors.textMuted }}>To</span>
                  <span style={{ color: colors.navy }}>Bank ····7891</span>
                </div>
                <div style={{ height: 1, background: colors.border, margin: '12px 0' }} />
                <div style={{ display: 'flex', justifyContent: 'space-between' }}>
                  <span style={{ fontWeight: 500, color: colors.navy }}>You'll receive</span>
                  <span style={{ fontWeight: 700, fontSize: 20, color: colors.green }}>${parseFloat(withdrawAmt).toLocaleString()}</span>
                </div>
              </div>
              
              <p style={{ fontSize: 12, color: colors.textMuted, marginBottom: 16, textAlign: 'center' }}>
                Funds will arrive in 1-3 business days
              </p>
              
              <div style={{ display: 'flex', gap: 12 }}>
                <Btn onClick={() => setWithdrawStep(1)} style={{ flex: 1 }}>Back</Btn>
                <Btn primary onClick={() => { 
                  setBalance(balance - parseFloat(withdrawAmt)); 
                  setUserTransactions([{ id: Date.now(), title: 'Withdrawal', desc: 'Bank ····7891', amt: -parseFloat(withdrawAmt), date: 'Just now' }, ...userTransactions]);
                  setWithdrawStep(3); 
                }} style={{ flex: 2 }}>Confirm Withdrawal</Btn>
              </div>
            </>
          )}
        </div>
      </Modal>
    );
  };

  // SUBMIT BRACKET MODAL
  const SubmitBracketModal = () => {
    const fee = activeTournament.entry;
    const canAfford = balance >= fee;
    const champion = predictions['r4-m0'];
    
    // Get bracket summary
    const rounds = [
      { name: 'R32', matches: 16 },
      { name: 'R16', matches: 8 },
      { name: 'QF', matches: 4 },
      { name: 'SF', matches: 2 },
      { name: 'F', matches: 1 },
    ];
    const getBracketSummary = () => {
      const summary = [];
      for (let r = 0; r < 5; r++) {
        const picks = [];
        for (let m = 0; m < rounds[r].matches; m++) {
          const pick = predictions[`r${r}-m${m}`];
          if (pick) picks.push(pick);
        }
        summary.push({ round: rounds[r].name, picks });
      }
      return summary;
    };
    const summary = getBracketSummary();

    // Step 3: Success
    if (submitStep === 3) {
      return (
        <Modal title="Success" onClose={() => { setModal(null); setPredictions({}); }}>
          <div style={{ padding: 32, textAlign: 'center' }}>
            <div style={{ width: 80, height: 80, borderRadius: 40, background: colors.greenLight, display: 'flex', alignItems: 'center', justifyContent: 'center', margin: '0 auto 20px' }}>
              <CheckCircle size={40} color={colors.green} />
            </div>
            <h3 style={{ fontSize: 24, fontWeight: 700, color: colors.navy, margin: '0 0 8px' }}>Bracket Submitted!</h3>
            <p style={{ fontSize: 15, color: colors.textMuted, margin: 0 }}>Good luck in {activeTournament.name}!</p>
            
            {champion && (
              <div style={{ background: colors.purpleLight, borderRadius: 12, padding: 16, marginTop: 20 }}>
                <p style={{ fontSize: 12, color: colors.purple, margin: '0 0 8px' }}>YOUR CHAMPION</p>
                <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'center', gap: 10 }}>
                  <span style={{ fontSize: 28 }}>{champion.flag}</span>
                  <span style={{ fontSize: 18, fontWeight: 700, color: colors.navy }}>{champion.name}</span>
                </div>
              </div>
            )}
            
            <Btn primary full onClick={() => { setModal(null); setPredictions({}); setView('calendar'); }} style={{ marginTop: 24 }}>
              Done
            </Btn>
          </div>
        </Modal>
      );
    }

    // Step 2: Payment confirmation
    if (submitStep === 2) {
      return (
        <Modal title="Confirm Entry" onClose={() => setModal(null)}>
          <div style={{ padding: 16 }}>
            {/* Tournament info */}
            <div style={{ background: colors.bg, borderRadius: 12, padding: 16, marginBottom: 20 }}>
              <p style={{ fontSize: 16, fontWeight: 600, color: colors.navy, margin: '0 0 4px' }}>{activeTournament.name}</p>
              <p style={{ fontSize: 13, color: colors.textMuted, margin: 0 }}>{activeTournament.subtitle}</p>
            </div>
            
            {/* Payment breakdown */}
            <div style={{ background: colors.white, border: `1px solid ${colors.border}`, borderRadius: 12, padding: 16, marginBottom: 20 }}>
              <div style={{ display: 'flex', justifyContent: 'space-between', marginBottom: 12 }}>
                <span style={{ color: colors.textMuted }}>Entry Fee</span>
                <span style={{ fontWeight: 600, color: colors.navy }}>${fee}</span>
              </div>
              <div style={{ display: 'flex', justifyContent: 'space-between', marginBottom: 12 }}>
                <span style={{ color: colors.textMuted }}>Your Balance</span>
                <span style={{ fontWeight: 600, color: canAfford ? colors.green : colors.red }}>${balance.toLocaleString()}</span>
              </div>
              <div style={{ height: 1, background: colors.border, margin: '12px 0' }} />
              <div style={{ display: 'flex', justifyContent: 'space-between' }}>
                <span style={{ fontWeight: 500, color: colors.navy }}>After Payment</span>
                <span style={{ fontWeight: 700, color: colors.navy }}>${(balance - fee).toLocaleString()}</span>
              </div>
            </div>
            
            {/* Insufficient balance warning */}
            {!canAfford && (
              <div style={{ background: colors.redLight, borderRadius: 12, padding: 16, marginBottom: 20, display: 'flex', alignItems: 'center', gap: 12 }}>
                <div style={{ width: 40, height: 40, borderRadius: 20, background: colors.red, display: 'flex', alignItems: 'center', justifyContent: 'center' }}>
                  <span style={{ color: '#fff', fontWeight: 700 }}>!</span>
                </div>
                <div>
                  <p style={{ fontSize: 14, fontWeight: 600, color: colors.red, margin: 0 }}>Insufficient Balance</p>
                  <p style={{ fontSize: 12, color: colors.red, margin: '4px 0 0' }}>You need ${fee - balance} more to enter</p>
                </div>
              </div>
            )}
            
            <div style={{ display: 'flex', gap: 12 }}>
              <Btn onClick={() => setSubmitStep(1)} style={{ flex: 1 }}>Back</Btn>
              {canAfford ? (
                <Btn primary onClick={() => { 
                  setBalance(balance - fee); 
                  setUserTransactions([{ id: Date.now(), title: 'Tournament Entry', desc: activeTournament.name, amt: -fee, date: 'Just now' }, ...userTransactions]);
                  // Save bracket to myBrackets with Black Horse
                  setMyBrackets([...myBrackets, {
                    id: Date.now(),
                    tournament: activeTournament,
                    champion: predictions['r4-m0'],
                    blackHorse: blackHorse, // Save Black Horse selection
                    predictions: { ...predictions },
                    submittedAt: new Date().toISOString(),
                    status: 'active', // active, completed, cancelled
                    position: null, // ranking position after tournament ends
                    points: 0,
                    prize: 0,
                  }]);
                  setBlackHorse(null); // Reset for next bracket
                  setSubmitStep(3); 
                }} style={{ flex: 2 }}>
                  Pay ${fee}
                </Btn>
              ) : (
                <Btn primary onClick={() => { setModal('deposit'); setDepStep(1); setDepAmt(''); }} style={{ flex: 2 }}>
                  <Plus size={18} /> Add Funds
                </Btn>
              )}
            </div>
          </div>
        </Modal>
      );
    }

    // Step 1: Review bracket
    return (
      <Modal title="Review Your Bracket" onClose={() => setModal(null)}>
        <div style={{ padding: 16 }}>
          {/* Champion */}
          {champion && (
            <div style={{ background: `linear-gradient(135deg, ${colors.gradientStart}, ${colors.gradientEnd})`, borderRadius: 12, padding: 20, marginBottom: 20, textAlign: 'center' }}>
              <p style={{ fontSize: 12, color: 'rgba(255,255,255,0.7)', margin: '0 0 10px' }}>YOUR CHAMPION</p>
              <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'center', gap: 12 }}>
                <span style={{ fontSize: 36 }}>{champion.flag}</span>
                <div>
                  <p style={{ fontSize: 20, fontWeight: 700, color: '#fff', margin: 0 }}>{champion.name}</p>
                  <p style={{ fontSize: 13, color: 'rgba(255,255,255,0.7)', margin: '4px 0 0' }}>[{champion.seed}]</p>
                </div>
              </div>
              <Trophy size={28} color="#FFD700" style={{ marginTop: 12 }} />
            </div>
          )}
          
          {/* Bracket summary */}
          <div style={{ marginBottom: 20 }}>
            {summary.map((r, i) => (
              <div key={i} style={{ marginBottom: 16 }}>
                <p style={{ fontSize: 12, fontWeight: 600, color: colors.textMuted, margin: '0 0 8px' }}>
                  {r.round} ({r.picks.length} picks)
                </p>
                <div style={{ display: 'flex', flexWrap: 'wrap', gap: 6 }}>
                  {r.picks.map((p, j) => (
                    <div key={j} style={{ display: 'flex', alignItems: 'center', gap: 4, background: colors.bg, borderRadius: 6, padding: '6px 10px' }}>
                      <span style={{ fontSize: 14 }}>{p.flag}</span>
                      <span style={{ fontSize: 12, color: colors.navy }}>{p.name}</span>
                    </div>
                  ))}
                </div>
              </div>
            ))}
          </div>
          
          {/* Black Horse */}
          <div style={{ background: blackHorse ? '#FFF7ED' : colors.bg, border: `1px solid ${blackHorse ? colors.orange : colors.border}`, borderRadius: 12, padding: 16, marginBottom: 16 }}>
            <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between' }}>
              <div style={{ display: 'flex', alignItems: 'center', gap: 8 }}>
                <span style={{ fontSize: 18 }}>🐴</span>
                <span style={{ fontSize: 14, fontWeight: 600, color: colors.navy }}>Black Horse</span>
                <span style={{ fontSize: 10, fontWeight: 600, color: colors.orange, background: 'rgba(249,115,22,0.1)', padding: '2px 6px', borderRadius: 4 }}>1.5x</span>
              </div>
              {blackHorse ? (
                <div style={{ display: 'flex', alignItems: 'center', gap: 8 }}>
                  <span style={{ fontSize: 18 }}>{blackHorse.flag}</span>
                  <span style={{ fontSize: 14, fontWeight: 600, color: colors.navy }}>{blackHorse.name}</span>
                </div>
              ) : (
                <span style={{ fontSize: 13, color: colors.textMuted }}>Not selected</span>
              )}
            </div>
          </div>
          
          {/* Entry fee */}
          <div style={{ background: colors.bg, borderRadius: 12, padding: 16, marginBottom: 20, display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
            <span style={{ fontSize: 14, color: colors.textMuted }}>Entry Fee</span>
            <span style={{ fontSize: 20, fontWeight: 700, color: colors.purple }}>${fee}</span>
          </div>
          
          <Btn primary full onClick={() => setSubmitStep(2)}>
            Continue to Payment
          </Btn>
        </div>
      </Modal>
    );
  };

  // BRACKET DETAILS MODAL (for viewing submitted brackets)
  const BracketDetailsModal = () => {
    if (!selectedBracket) return null;
    
    const rounds = [
      { name: 'R32', matches: 16 },
      { name: 'R16', matches: 8 },
      { name: 'QF', matches: 4 },
      { name: 'SF', matches: 2 },
      { name: 'F', matches: 1 },
    ];
    
    const getSummary = () => {
      const summary = [];
      for (let r = 0; r < 5; r++) {
        const picks = [];
        for (let m = 0; m < rounds[r].matches; m++) {
          const pick = selectedBracket.predictions[`r${r}-m${m}`];
          if (pick) picks.push(pick);
        }
        summary.push({ round: rounds[r].name, picks });
      }
      return summary;
    };
    const summary = getSummary();
    
    return (
      <Modal title="Bracket Details" onClose={() => setSelectedBracket(null)}>
        <div style={{ padding: 16 }}>
          {/* Tournament Header */}
          <div style={{ background: `linear-gradient(135deg, ${colors.gradientStart}, ${colors.gradientEnd})`, borderRadius: 12, padding: 16, marginBottom: 16 }}>
            <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'start' }}>
              <div>
                <span style={{ fontSize: 11, color: 'rgba(255,255,255,0.7)' }}>{selectedBracket.tournament.type.toUpperCase()}</span>
                <h3 style={{ fontSize: 20, fontWeight: 700, color: '#fff', margin: '4px 0' }}>{selectedBracket.tournament.name}</h3>
                <p style={{ fontSize: 12, color: 'rgba(255,255,255,0.7)', margin: 0 }}>{selectedBracket.tournament.dates} {selectedBracket.tournament.dateSuffix}</p>
              </div>
              <span style={{ fontSize: 10, fontWeight: 600, padding: '4px 10px', borderRadius: 4, background: 'rgba(255,255,255,0.2)', color: '#fff' }}>
                {selectedBracket.status.toUpperCase()}
              </span>
            </div>
          </div>
          
          {/* Champion */}
          <div style={{ background: colors.bg, borderRadius: 12, padding: 16, marginBottom: 16 }}>
            <p style={{ fontSize: 11, color: colors.textMuted, margin: '0 0 10px' }}>YOUR CHAMPION</p>
            <div style={{ display: 'flex', alignItems: 'center', gap: 12 }}>
              <span style={{ fontSize: 36 }}>{selectedBracket.champion?.flag}</span>
              <div>
                <p style={{ fontSize: 18, fontWeight: 700, color: colors.navy, margin: 0 }}>{selectedBracket.champion?.name}</p>
                <p style={{ fontSize: 13, color: colors.textMuted, margin: '2px 0 0' }}>[{selectedBracket.champion?.seed}]</p>
              </div>
              <Trophy size={24} color="#FFD700" style={{ marginLeft: 'auto' }} />
            </div>
          </div>
          
          {/* Black Horse */}
          {selectedBracket.blackHorse && (
            <div style={{ background: '#FFF7ED', border: `1px solid ${colors.orange}`, borderRadius: 12, padding: 14, marginBottom: 16 }}>
              <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between' }}>
                <div style={{ display: 'flex', alignItems: 'center', gap: 8 }}>
                  <span style={{ fontSize: 18 }}>🐴</span>
                  <span style={{ fontSize: 13, fontWeight: 600, color: colors.navy }}>Black Horse</span>
                  <span style={{ fontSize: 10, fontWeight: 600, color: colors.orange, background: 'rgba(249,115,22,0.15)', padding: '2px 6px', borderRadius: 4 }}>1.5x</span>
                </div>
                <div style={{ display: 'flex', alignItems: 'center', gap: 8 }}>
                  <span style={{ fontSize: 18 }}>{selectedBracket.blackHorse.flag}</span>
                  <span style={{ fontSize: 14, fontWeight: 600, color: colors.navy }}>{selectedBracket.blackHorse.name}</span>
                </div>
              </div>
            </div>
          )}
          
          {/* Stats */}
          <div style={{ display: 'grid', gridTemplateColumns: 'repeat(3, 1fr)', gap: 10, marginBottom: 16 }}>
            <div style={{ background: colors.white, border: `1px solid ${colors.border}`, borderRadius: 8, padding: 12, textAlign: 'center' }}>
              <p style={{ fontSize: 11, color: colors.textMuted, margin: 0 }}>Entry</p>
              <p style={{ fontSize: 16, fontWeight: 700, color: colors.navy, margin: '4px 0 0' }}>${selectedBracket.tournament.entry}</p>
            </div>
            <div style={{ background: colors.white, border: `1px solid ${colors.border}`, borderRadius: 8, padding: 12, textAlign: 'center' }}>
              <p style={{ fontSize: 11, color: colors.textMuted, margin: 0 }}>Points</p>
              <p style={{ fontSize: 16, fontWeight: 700, color: colors.green, margin: '4px 0 0' }}>{selectedBracket.points}</p>
            </div>
            <div style={{ background: colors.white, border: `1px solid ${colors.border}`, borderRadius: 8, padding: 12, textAlign: 'center' }}>
              <p style={{ fontSize: 11, color: colors.textMuted, margin: 0 }}>Position</p>
              <p style={{ fontSize: 16, fontWeight: 700, color: colors.purple, margin: '4px 0 0' }}>{selectedBracket.position || '-'}</p>
            </div>
          </div>
          
          {/* All Picks */}
          <div style={{ marginBottom: 16 }}>
            <p style={{ fontSize: 13, fontWeight: 600, color: colors.navy, margin: '0 0 12px' }}>Your Picks</p>
            {summary.map((r, i) => (
              <div key={i} style={{ marginBottom: 12 }}>
                <p style={{ fontSize: 11, fontWeight: 600, color: colors.textMuted, margin: '0 0 6px' }}>{r.round}</p>
                <div style={{ display: 'flex', flexWrap: 'wrap', gap: 4 }}>
                  {r.picks.map((p, j) => (
                    <div key={j} style={{ display: 'flex', alignItems: 'center', gap: 4, background: colors.bg, borderRadius: 6, padding: '5px 8px' }}>
                      <span style={{ fontSize: 12 }}>{p.flag}</span>
                      <span style={{ fontSize: 11, color: colors.navy }}>{p.name}</span>
                    </div>
                  ))}
                </div>
              </div>
            ))}
          </div>
          
          <Btn full onClick={() => setSelectedBracket(null)}>Close</Btn>
        </div>
      </Modal>
    );
  };

  // BLACK HORSE MODAL
  const BlackHorseModal = () => {
    const bracketSize = getBracketSize(activeTournament);
    const eligiblePlayers = getBlackHorsePlayers(bracketSize);
    
    // Get seed range text based on bracket size
    const getSeedRangeText = () => {
      if (bracketSize === 128) return '33-96';
      if (bracketSize === 64) return '17-64';
      return '9-32';
    };
    
    return (
      <Modal title="🐴 Select Black Horse" onClose={() => setModal(null)}>
        <div style={{ padding: 16 }}>
          {/* Explanation */}
          <div style={{ background: '#FFF7ED', border: `1px solid ${colors.orange}`, borderRadius: 12, padding: 16, marginBottom: 20 }}>
            <div style={{ display: 'flex', alignItems: 'center', gap: 8, marginBottom: 8 }}>
              <span style={{ fontSize: 20 }}>🐴</span>
              <span style={{ fontSize: 15, fontWeight: 700, color: colors.orange }}>Black Horse Bonus</span>
            </div>
            <p style={{ fontSize: 13, color: colors.textMid, margin: 0, lineHeight: 1.5 }}>
              Choose one player from seeds {getSeedRangeText()}. If your Black Horse wins any match you predicted correctly, you earn <strong>1.5x points</strong> for that match!
            </p>
          </div>
          
          {/* Bracket info */}
          <div style={{ background: colors.bg, borderRadius: 10, padding: 12, marginBottom: 16, display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
            <span style={{ fontSize: 12, color: colors.textMuted }}>Bracket Size</span>
            <span style={{ fontSize: 13, fontWeight: 600, color: colors.navy }}>{bracketSize} players</span>
          </div>
          
          {/* Points example */}
          <div style={{ background: colors.bg, borderRadius: 10, padding: 14, marginBottom: 20 }}>
            <p style={{ fontSize: 12, fontWeight: 600, color: colors.navy, margin: '0 0 10px' }}>Points Example (with Black Horse):</p>
            <div style={{ display: 'flex', flexWrap: 'wrap', gap: 8 }}>
              {[
                { round: 'R128', base: 1, bonus: 1.5, show: bracketSize === 128 },
                { round: 'R64', base: 1, bonus: 1.5, show: bracketSize >= 64 },
                { round: 'R32', base: 2, bonus: 3, show: true },
                { round: 'R16', base: 3, bonus: 4.5, show: true },
                { round: 'QF', base: 5, bonus: 7.5, show: true },
                { round: 'SF', base: 8, bonus: 12, show: true },
                { round: 'F', base: 13, bonus: 19.5, show: true },
              ].filter(r => r.show).map(r => (
                <div key={r.round} style={{ background: colors.white, borderRadius: 6, padding: '6px 10px', border: `1px solid ${colors.border}` }}>
                  <span style={{ fontSize: 11, color: colors.textMuted }}>{r.round}: </span>
                  <span style={{ fontSize: 12, color: colors.navy }}>{r.base}</span>
                  <span style={{ fontSize: 11, color: colors.textMuted }}> → </span>
                  <span style={{ fontSize: 12, fontWeight: 600, color: colors.orange }}>{r.bonus}</span>
                </div>
              ))}
            </div>
          </div>
          
          {/* Player selection */}
          <p style={{ fontSize: 13, fontWeight: 600, color: colors.navy, margin: '0 0 12px' }}>Select Player (Seed {getSeedRangeText()})</p>
          <div style={{ maxHeight: 300, overflowY: 'auto' }}>
            {eligiblePlayers.length > 0 ? eligiblePlayers.map(player => (
              <button
                key={player.id}
                onClick={() => { setBlackHorse(player); setModal(null); }}
                style={{
                  width: '100%',
                  display: 'flex',
                  alignItems: 'center',
                  padding: '12px 14px',
                  marginBottom: 8,
                  borderRadius: 10,
                  border: blackHorse?.id === player.id ? `2px solid ${colors.orange}` : `1px solid ${colors.border}`,
                  background: blackHorse?.id === player.id ? '#FFF7ED' : colors.white,
                  cursor: 'pointer',
                  transition: 'all 0.2s'
                }}
              >
                <span style={{ fontSize: 22, marginRight: 12 }}>{player.flag}</span>
                <div style={{ flex: 1, textAlign: 'left' }}>
                  <p style={{ fontSize: 15, fontWeight: 500, color: colors.navy, margin: 0 }}>{player.name}</p>
                  <p style={{ fontSize: 12, color: colors.textMuted, margin: '2px 0 0' }}>Seed [{player.seed}]</p>
                </div>
                {blackHorse?.id === player.id && (
                  <div style={{ width: 24, height: 24, borderRadius: 12, background: colors.orange, display: 'flex', alignItems: 'center', justifyContent: 'center' }}>
                    <Check size={14} color="#fff" />
                  </div>
                )}
              </button>
            )) : (
              <p style={{ fontSize: 13, color: colors.textMuted, textAlign: 'center', padding: 20 }}>
                No eligible players available for this bracket size. Players with seeds {getSeedRangeText()} will be shown when the draw is released.
              </p>
            )}
          </div>
          
          {blackHorse && (
            <div style={{ marginTop: 16, paddingTop: 16, borderTop: `1px solid ${colors.border}` }}>
              <Btn full onClick={() => { setBlackHorse(null); }}>
                Clear Selection
              </Btn>
            </div>
          )}
        </div>
      </Modal>
    );
  };

  // PLAYER MODAL
  const PlayerModal = () => (
    <Modal title="Player Stats" onClose={() => setSelPlayer(null)}>
      <div style={{ padding: 16 }}>
        <div style={{ textAlign: 'center', marginBottom: 24 }}>
          <div style={{ width: 80, height: 80, borderRadius: 40, background: colors.purpleLight, display: 'flex', alignItems: 'center', justifyContent: 'center', margin: '0 auto 16px', fontSize: 28, fontWeight: 600, color: colors.purple }}>{selPlayer.photo}</div>
          <h3 style={{ fontSize: 22, fontWeight: 700, color: colors.navy, margin: 0 }}>{selPlayer.name}</h3>
          <p style={{ fontSize: 14, color: colors.purple, margin: '4px 0' }}>Rank #{selPlayer.rank}</p>
          <p style={{ fontSize: 14, color: colors.textMuted }}>{selPlayer.flag} Played {selPlayer.played} tournaments</p>
        </div>
        <div style={{ display: 'grid', gridTemplateColumns: 'repeat(2, 1fr)', gap: 12 }}>
          <div style={{ background: colors.bg, borderRadius: 8, padding: 16, textAlign: 'center' }}>
            <p style={{ fontSize: 11, color: colors.textMuted, margin: '0 0 4px' }}>Points</p>
            <p style={{ fontSize: 20, fontWeight: 700, color: colors.navy, margin: 0 }}>{selPlayer.pts.toLocaleString()}</p>
          </div>
          <div style={{ background: colors.bg, borderRadius: 8, padding: 16, textAlign: 'center' }}>
            <p style={{ fontSize: 11, color: colors.textMuted, margin: '0 0 4px' }}>Win Rate</p>
            <p style={{ fontSize: 20, fontWeight: 700, color: colors.green, margin: 0 }}>{selPlayer.winRate}%</p>
          </div>
          <div style={{ background: colors.bg, borderRadius: 8, padding: 16, textAlign: 'center' }}>
            <p style={{ fontSize: 11, color: colors.textMuted, margin: '0 0 4px' }}>Earnings</p>
            <p style={{ fontSize: 20, fontWeight: 700, color: colors.purple, margin: 0 }}>${selPlayer.earnings?.toLocaleString()}</p>
          </div>
          <div style={{ background: colors.bg, borderRadius: 8, padding: 16, textAlign: 'center' }}>
            <p style={{ fontSize: 11, color: colors.textMuted, margin: '0 0 4px' }}>Brackets</p>
            <p style={{ fontSize: 20, fontWeight: 700, color: colors.navy, margin: 0 }}>{selPlayer.played}</p>
          </div>
        </div>
      </div>
    </Modal>
  );

  // AUTH MODAL (Sign In / Register)
  const AuthModal = () => {
    const [authMode, setAuthMode] = useState('login'); // login, register
    
    return (
      <Modal title={authMode === 'login' ? 'Sign In' : 'Create Account'} onClose={() => setModal(null)}>
        <div style={{ padding: 20 }}>
          {/* Logo */}
          <div style={{ textAlign: 'center', marginBottom: 24 }}>
            <Logo size={48} />
            <h2 style={{ fontSize: 22, fontWeight: 300, color: colors.navy, margin: '12px 0 4px' }}>
              moba<span style={{ fontWeight: 700 }}>One</span>
            </h2>
            <p style={{ fontSize: 13, color: colors.textMuted, margin: 0 }}>Bracket Battle</p>
          </div>
          
          {authMode === 'register' && (
            <div style={{ marginBottom: 16 }}>
              <label style={{ fontSize: 13, fontWeight: 600, color: colors.textMid, display: 'block', marginBottom: 6 }}>Username</label>
              <input 
                type="text" 
                value={authName} 
                onChange={(e) => setAuthName(e.target.value)} 
                placeholder="Choose a username" 
                style={{ width: '100%', padding: 14, fontSize: 15, border: `1.5px solid ${colors.border}`, borderRadius: 10, outline: 'none', color: colors.navy, boxSizing: 'border-box' }} 
              />
            </div>
          )}
          
          <div style={{ marginBottom: 16 }}>
            <label style={{ fontSize: 13, fontWeight: 600, color: colors.textMid, display: 'block', marginBottom: 6 }}>Email</label>
            <input 
              type="email" 
              value={authEmail} 
              onChange={(e) => setAuthEmail(e.target.value)} 
              placeholder="your@email.com" 
              style={{ width: '100%', padding: 14, fontSize: 15, border: `1.5px solid ${colors.border}`, borderRadius: 10, outline: 'none', color: colors.navy, boxSizing: 'border-box' }} 
            />
          </div>
          
          <div style={{ marginBottom: 20 }}>
            <label style={{ fontSize: 13, fontWeight: 600, color: colors.textMid, display: 'block', marginBottom: 6 }}>Password</label>
            <div style={{ position: 'relative' }}>
              <input 
                type={showPass ? 'text' : 'password'} 
                value={authPassword} 
                onChange={(e) => setAuthPassword(e.target.value)} 
                placeholder={authMode === 'login' ? 'Enter password' : 'Create password'} 
                style={{ width: '100%', padding: 14, paddingRight: 46, fontSize: 15, border: `1.5px solid ${colors.border}`, borderRadius: 10, outline: 'none', color: colors.navy, boxSizing: 'border-box' }} 
              />
              <button onClick={() => setShowPass(!showPass)} style={{ position: 'absolute', right: 12, top: '50%', transform: 'translateY(-50%)', background: 'none', border: 'none', cursor: 'pointer', color: colors.textMuted, fontSize: 18 }}>
                {showPass ? '🙈' : '👁️'}
              </button>
            </div>
          </div>
          
          {authMode === 'login' && (
            <p style={{ fontSize: 13, color: colors.purple, textAlign: 'right', margin: '-8px 0 16px', cursor: 'pointer' }}>
              Forgot password?
            </p>
          )}
          
          <Btn 
            primary 
            full 
            disabled={authMode === 'login' ? !authEmail || !authPassword : !authName || !authEmail || !authPassword}
            onClick={() => { 
              setIsLoggedIn(true); 
              setModal(null); 
              setAuthEmail(''); 
              setAuthPassword(''); 
              setAuthName(''); 
            }}
          >
            {authMode === 'login' ? 'Sign In' : 'Create Account'}
          </Btn>
          
          {authMode === 'register' && (
            <p style={{ fontSize: 11, color: colors.textMuted, textAlign: 'center', marginTop: 12, lineHeight: 1.4 }}>
              By creating an account, you agree to our Terms of Service and Privacy Policy
            </p>
          )}
          
          <div style={{ marginTop: 20, paddingTop: 20, borderTop: `1px solid ${colors.border}`, textAlign: 'center' }}>
            {authMode === 'login' ? (
              <p style={{ fontSize: 14, color: colors.textMid, margin: 0 }}>
                Don't have an account? <span onClick={() => setAuthMode('register')} style={{ color: colors.purple, fontWeight: 600, cursor: 'pointer' }}>Sign Up</span>
              </p>
            ) : (
              <p style={{ fontSize: 14, color: colors.textMid, margin: 0 }}>
                Already have an account? <span onClick={() => setAuthMode('login')} style={{ color: colors.purple, fontWeight: 600, cursor: 'pointer' }}>Sign In</span>
              </p>
            )}
          </div>
        </div>
      </Modal>
    );
  };

  // PROFILE MODAL (when logged in)
  const ProfileModal = () => (
    <Modal title="My Profile" onClose={() => setModal(null)}>
      <div style={{ padding: 20 }}>
        {/* Avatar & Name */}
        <div style={{ textAlign: 'center', marginBottom: 24 }}>
          <div style={{ width: 80, height: 80, borderRadius: 40, background: colors.orange, display: 'flex', alignItems: 'center', justifyContent: 'center', margin: '0 auto 12px', fontSize: 32, fontWeight: 600, color: '#fff' }}>
            {user.name[0]}
          </div>
          <h3 style={{ fontSize: 22, fontWeight: 700, color: colors.navy, margin: 0 }}>{user.name}</h3>
          <p style={{ fontSize: 14, color: colors.purple, margin: '4px 0' }}>Rank #{user.rank}</p>
        </div>
        
        {/* Stats */}
        <div style={{ display: 'grid', gridTemplateColumns: 'repeat(2, 1fr)', gap: 12, marginBottom: 24 }}>
          <div style={{ background: colors.bg, borderRadius: 10, padding: 16, textAlign: 'center' }}>
            <p style={{ fontSize: 11, color: colors.textMuted, margin: '0 0 4px' }}>Win Rate</p>
            <p style={{ fontSize: 22, fontWeight: 700, color: colors.green, margin: 0 }}>{user.win}%</p>
          </div>
          <div style={{ background: colors.bg, borderRadius: 10, padding: 16, textAlign: 'center' }}>
            <p style={{ fontSize: 11, color: colors.textMuted, margin: '0 0 4px' }}>Earnings</p>
            <p style={{ fontSize: 22, fontWeight: 700, color: colors.purple, margin: 0 }}>${user.earn.toLocaleString()}</p>
          </div>
          <div style={{ background: colors.bg, borderRadius: 10, padding: 16, textAlign: 'center' }}>
            <p style={{ fontSize: 11, color: colors.textMuted, margin: '0 0 4px' }}>Brackets</p>
            <p style={{ fontSize: 22, fontWeight: 700, color: colors.navy, margin: 0 }}>{user.brackets}</p>
          </div>
          <div style={{ background: colors.bg, borderRadius: 10, padding: 16, textAlign: 'center' }}>
            <p style={{ fontSize: 11, color: colors.textMuted, margin: '0 0 4px' }}>Balance</p>
            <p style={{ fontSize: 22, fontWeight: 700, color: colors.navy, margin: 0 }}>${balance.toLocaleString()}</p>
          </div>
        </div>
        
        {/* Actions */}
        <div style={{ display: 'flex', flexDirection: 'column', gap: 10 }}>
          <Btn full onClick={() => { setModal(null); setView('wallet'); }}>
            <Wallet size={18} /> Wallet
          </Btn>
          <Btn full onClick={() => { setModal(null); setCalendarTab('my'); setView('calendar'); }}>
            <Target size={18} /> My Brackets
          </Btn>
          <button 
            onClick={() => { setIsLoggedIn(false); setModal(null); }} 
            style={{ width: '100%', padding: 14, borderRadius: 10, border: `1px solid ${colors.red}`, background: 'transparent', color: colors.red, fontSize: 15, fontWeight: 600, cursor: 'pointer', display: 'flex', alignItems: 'center', justifyContent: 'center', gap: 8 }}
          >
            <LogIn size={18} /> Sign Out
          </button>
        </div>
      </div>
    </Modal>
  );

  // PRIZES MODAL - Show prize distribution
  const PrizesModal = () => {
    const prizeInfo = calculatePrizes(activeTournament.entries || 1, activeTournament.poolEntry || activeTournament.entry);
    const [showAllPrizes, setShowAllPrizes] = useState(false);
    
    // Generate prize rows based on actual distribution
    const prizeRows = [
      { place: '1st', pct: '20%', amount: Math.round(prizeInfo.prizePool * 0.20), highlight: true, medal: '🥇' },
      { place: '2nd', pct: '12%', amount: Math.round(prizeInfo.prizePool * 0.12), highlight: true, medal: '🥈' },
      { place: '3rd', pct: '8%', amount: Math.round(prizeInfo.prizePool * 0.08), highlight: true, medal: '🥉' },
      { place: '4th', pct: '5.5%', amount: Math.round(prizeInfo.prizePool * 0.055) },
      { place: '5th-8th', pct: '2.5%', amount: Math.round(prizeInfo.prizePool * 0.025) },
      { place: '9th-16th', pct: '1.25%', amount: Math.round(prizeInfo.prizePool * 0.0125) },
      { place: '17th-32nd', pct: '0.7%', amount: Math.round(prizeInfo.prizePool * 0.007) },
      { place: '33rd-64th', pct: '0.4%', amount: Math.round(prizeInfo.prizePool * 0.004) },
      { place: '65th-128th', pct: '0.2%', amount: Math.round(prizeInfo.prizePool * 0.002) },
      { place: '129th-256th', pct: '0.1%', amount: Math.round(prizeInfo.prizePool * 0.001) },
      { place: '257th-323rd', pct: '0.05%', amount: Math.round(prizeInfo.prizePool * 0.0005) },
    ];
    
    // Filter to only show places that are paid
    const visiblePrizes = prizeRows.filter((row, idx) => {
      if (idx < 4) return true; // Always show top 4
      const startPlace = parseInt(row.place.split('-')[0]) || parseInt(row.place);
      return startPlace <= prizeInfo.paidPlaces;
    });
    
    const displayPrizes = showAllPrizes ? visiblePrizes : visiblePrizes.slice(0, 8);
    
    return (
      <Modal title="Prize Payouts" onClose={() => setModal(null)}>
        <div style={{ padding: 16 }}>
          {/* Tournament Header */}
          <div style={{ background: `linear-gradient(135deg, ${colors.gradientStart}, ${colors.gradientEnd})`, borderRadius: 12, padding: 16, marginBottom: 16 }}>
            <h3 style={{ fontSize: 18, fontWeight: 700, color: '#fff', margin: '0 0 4px' }}>{activeTournament.name}</h3>
            <p style={{ fontSize: 12, color: 'rgba(255,255,255,0.7)', margin: 0 }}>{activeTournament.type.toUpperCase()} • {activeTournament.entries.toLocaleString()} entries</p>
          </div>
          
          {/* Prize Pool - simplified, no fee breakdown */}
          <div style={{ background: colors.bgLight, borderRadius: 12, padding: 16, marginBottom: 16, display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
            <div>
              <p style={{ fontSize: 12, color: colors.textMuted, margin: 0 }}>Total Prize Pool</p>
              <p style={{ fontSize: 11, color: colors.textMuted, margin: '2px 0 0' }}>{activeTournament.entries.toLocaleString()} × ${activeTournament.poolEntry || activeTournament.entry}</p>
            </div>
            <p style={{ fontSize: 24, fontWeight: 700, color: colors.green, margin: 0 }}>${prizeInfo.prizePool.toLocaleString()}</p>
          </div>
          
          {/* Paid Places Info */}
          <div style={{ background: colors.purpleLight, borderRadius: 10, padding: 12, marginBottom: 16, display: 'flex', alignItems: 'center', gap: 10 }}>
            <Trophy size={20} color={colors.purple} />
            <div>
              <p style={{ fontSize: 13, fontWeight: 600, color: colors.purple, margin: 0 }}>Top {prizeInfo.paidPlaces} places paid</p>
              <p style={{ fontSize: 11, color: colors.purple, margin: '2px 0 0', opacity: 0.8 }}>Top 15% of all entries win prizes</p>
            </div>
          </div>
          
          {/* Prize Table */}
          <div style={{ background: colors.white, border: `1px solid ${colors.border}`, borderRadius: 12, overflow: 'hidden' }}>
            <div style={{ display: 'flex', padding: '10px 14px', background: colors.bgLight, borderBottom: `1px solid ${colors.border}` }}>
              <span style={{ flex: 1, fontSize: 11, fontWeight: 600, color: colors.textMuted }}>PLACE</span>
              <span style={{ width: 60, fontSize: 11, fontWeight: 600, color: colors.textMuted, textAlign: 'right' }}>%</span>
              <span style={{ width: 90, fontSize: 11, fontWeight: 600, color: colors.textMuted, textAlign: 'right' }}>PRIZE</span>
            </div>
            
            {displayPrizes.map((row, i) => (
              <div key={i} style={{ display: 'flex', alignItems: 'center', padding: '11px 14px', borderBottom: i < displayPrizes.length - 1 ? `1px solid ${colors.border}` : 'none', background: row.highlight ? 'rgba(124,58,237,0.03)' : 'transparent' }}>
                <div style={{ flex: 1, display: 'flex', alignItems: 'center', gap: 8 }}>
                  {row.medal && <span style={{ fontSize: 16 }}>{row.medal}</span>}
                  <span style={{ fontSize: 13, fontWeight: row.highlight ? 600 : 500, color: colors.navy }}>{row.place}</span>
                </div>
                <span style={{ width: 60, fontSize: 12, color: colors.textMuted, textAlign: 'right' }}>{row.pct}</span>
                <span style={{ width: 90, fontSize: 13, fontWeight: 600, color: row.highlight ? colors.green : colors.navy, textAlign: 'right' }}>${row.amount.toLocaleString()}</span>
              </div>
            ))}
          </div>
          
          {/* Show More Button */}
          {visiblePrizes.length > 8 && (
            <button 
              onClick={() => setShowAllPrizes(!showAllPrizes)}
              style={{ width: '100%', padding: 12, marginTop: 12, background: 'none', border: `1px solid ${colors.border}`, borderRadius: 8, cursor: 'pointer', display: 'flex', alignItems: 'center', justifyContent: 'center', gap: 6 }}
            >
              <span style={{ fontSize: 13, fontWeight: 500, color: colors.purple }}>
                {showAllPrizes ? 'Show Less' : `Show All ${prizeInfo.paidPlaces} Places`}
              </span>
              <ChevronDown size={16} color={colors.purple} style={{ transform: showAllPrizes ? 'rotate(180deg)' : 'none', transition: 'transform 0.2s' }} />
            </button>
          )}
          
          <p style={{ fontSize: 11, color: colors.textMuted, textAlign: 'center', marginTop: 16 }}>
            * Prize amounts calculated based on current entries. Final payouts may vary.
          </p>
        </div>
      </Modal>
    );
  };

  // AUTH SCREENS
  const WelcomeScreen = () => (
    <div style={{ minHeight: '100vh', background: `linear-gradient(135deg, ${colors.gradientStart}, ${colors.gradientMid}, ${colors.gradientEnd})`, display: 'flex', flexDirection: 'column' }}>
      <div style={{ flex: 1, display: 'flex', flexDirection: 'column', alignItems: 'center', justifyContent: 'center', padding: 32 }}>
        <svg width={80} height={80} viewBox="0 0 100 100" fill="none">
          <path d="M50 5 L95 50 L50 95 L5 50 Z" fill="url(#lgWelcome)" />
          <path d="M50 25 L60 45 L80 50 L60 55 L50 75 L40 55 L20 50 L40 45 Z" fill="#1E1B4B" />
          <circle cx="50" cy="12" r="5" fill="#FF6B35" />
          <circle cx="62" cy="18" r="3" fill="#FF8C5A" />
          <circle cx="38" cy="18" r="3" fill="#FF8C5A" />
          <defs><linearGradient id="lgWelcome" x1="0%" y1="0%" x2="100%" y2="100%"><stop offset="0%" stopColor="#FF9147" /><stop offset="100%" stopColor="#E04E1A" /></linearGradient></defs>
        </svg>
        <h1 style={{ fontSize: 36, fontWeight: 300, color: '#fff', margin: '24px 0 8px' }}>moba<span style={{ fontWeight: 700 }}>One</span></h1>
        <p style={{ fontSize: 18, color: 'rgba(255,255,255,0.9)', margin: 0 }}>Bracket Battle</p>
        <p style={{ fontSize: 14, color: 'rgba(255,255,255,0.6)', margin: '12px 0 0', textAlign: 'center', maxWidth: 280, lineHeight: 1.5 }}>
          Predict tournament brackets. Compete against others. Win real prizes.
        </p>
        <div style={{ marginTop: 48, width: '100%', maxWidth: 300 }}>
          {[
            { icon: Target, text: 'Build your bracket predictions' },
            { icon: Trophy, text: 'Compete in prize pools' },
            { icon: TrendingUp, text: 'Climb the global rankings' },
          ].map((item, i) => (
            <div key={i} style={{ display: 'flex', alignItems: 'center', gap: 16, marginBottom: 20 }}>
              <div style={{ width: 44, height: 44, borderRadius: 22, background: 'rgba(255,255,255,0.15)', display: 'flex', alignItems: 'center', justifyContent: 'center' }}>
                <item.icon size={22} color="#fff" />
              </div>
              <span style={{ fontSize: 15, color: 'rgba(255,255,255,0.9)' }}>{item.text}</span>
            </div>
          ))}
        </div>
      </div>
      <div style={{ padding: 24 }}>
        <button onClick={() => setAuthScreen('register')} style={{ width: '100%', padding: 16, borderRadius: 12, border: 'none', fontSize: 16, fontWeight: 600, background: colors.orange, color: '#fff', cursor: 'pointer', marginBottom: 12, display: 'flex', alignItems: 'center', justifyContent: 'center', gap: 8 }}>
          <User size={20} /> Create Account
        </button>
        <button onClick={() => setAuthScreen('login')} style={{ width: '100%', padding: 16, borderRadius: 12, border: '2px solid rgba(255,255,255,0.3)', fontSize: 16, fontWeight: 600, background: 'transparent', color: '#fff', cursor: 'pointer', display: 'flex', alignItems: 'center', justifyContent: 'center', gap: 8 }}>
          <LogIn size={20} /> Sign In
        </button>
      </div>
    </div>
  );

  const LoginScreen = () => (
    <div style={{ minHeight: '100vh', background: colors.bg }}>
      <div style={{ background: `linear-gradient(135deg, ${colors.gradientStart}, ${colors.gradientEnd})`, padding: '16px 16px 40px' }}>
        <button onClick={() => setAuthScreen('welcome')} style={{ background: 'none', border: 'none', cursor: 'pointer', marginBottom: 20 }}>
          <ChevronLeft size={28} color="#fff" />
        </button>
        <h1 style={{ fontSize: 28, fontWeight: 700, color: '#fff', margin: 0 }}>Welcome Back</h1>
        <p style={{ fontSize: 15, color: 'rgba(255,255,255,0.7)', margin: '8px 0 0' }}>Sign in to your account</p>
      </div>
      <div style={{ padding: 24, marginTop: -24 }}>
        <div style={{ background: colors.white, borderRadius: 16, padding: 24, boxShadow: '0 4px 20px rgba(0,0,0,0.08)' }}>
          <div style={{ marginBottom: 20 }}>
            <label style={{ fontSize: 13, fontWeight: 600, color: colors.textMid, display: 'block', marginBottom: 8 }}>Email</label>
            <input type="email" value={authEmail} onChange={(e) => setAuthEmail(e.target.value)} placeholder="your@email.com" style={{ width: '100%', padding: 14, fontSize: 15, border: `1.5px solid ${colors.border}`, borderRadius: 10, outline: 'none', color: colors.navy }} />
          </div>
          <div style={{ marginBottom: 24 }}>
            <label style={{ fontSize: 13, fontWeight: 600, color: colors.textMid, display: 'block', marginBottom: 8 }}>Password</label>
            <div style={{ position: 'relative' }}>
              <input type={showPass ? 'text' : 'password'} value={authPassword} onChange={(e) => setAuthPassword(e.target.value)} placeholder="Enter password" style={{ width: '100%', padding: 14, paddingRight: 46, fontSize: 15, border: `1.5px solid ${colors.border}`, borderRadius: 10, outline: 'none', color: colors.navy }} />
              <button onClick={() => setShowPass(!showPass)} style={{ position: 'absolute', right: 12, top: '50%', transform: 'translateY(-50%)', background: 'none', border: 'none', cursor: 'pointer', color: colors.textMuted, fontSize: 18 }}>{showPass ? '🙈' : '👁️'}</button>
            </div>
          </div>
          <button onClick={() => setIsLoggedIn(true)} disabled={!authEmail || !authPassword} style={{ width: '100%', padding: 16, borderRadius: 10, border: 'none', fontSize: 16, fontWeight: 600, background: authEmail && authPassword ? colors.purple : colors.border, color: authEmail && authPassword ? '#fff' : colors.textMuted, cursor: authEmail && authPassword ? 'pointer' : 'not-allowed' }}>
            Sign In
          </button>
          <p style={{ fontSize: 14, color: colors.purple, textAlign: 'center', marginTop: 16, cursor: 'pointer' }}>Forgot password?</p>
        </div>
        <p style={{ fontSize: 14, color: colors.textMid, textAlign: 'center', marginTop: 24 }}>
          Don't have an account? <span onClick={() => setAuthScreen('register')} style={{ color: colors.purple, fontWeight: 600, cursor: 'pointer' }}>Create one</span>
        </p>
      </div>
    </div>
  );

  const RegisterScreen = () => (
    <div style={{ minHeight: '100vh', background: colors.bg }}>
      <div style={{ background: `linear-gradient(135deg, ${colors.gradientStart}, ${colors.gradientEnd})`, padding: '16px 16px 40px' }}>
        <button onClick={() => setAuthScreen('welcome')} style={{ background: 'none', border: 'none', cursor: 'pointer', marginBottom: 20 }}>
          <ChevronLeft size={28} color="#fff" />
        </button>
        <h1 style={{ fontSize: 28, fontWeight: 700, color: '#fff', margin: 0 }}>Create Account</h1>
        <p style={{ fontSize: 15, color: 'rgba(255,255,255,0.7)', margin: '8px 0 0' }}>Join the bracket battle</p>
      </div>
      <div style={{ padding: 24, marginTop: -24 }}>
        <div style={{ background: colors.white, borderRadius: 16, padding: 24, boxShadow: '0 4px 20px rgba(0,0,0,0.08)' }}>
          <div style={{ marginBottom: 20 }}>
            <label style={{ fontSize: 13, fontWeight: 600, color: colors.textMid, display: 'block', marginBottom: 8 }}>Username</label>
            <input type="text" value={authName} onChange={(e) => setAuthName(e.target.value)} placeholder="Choose a username" style={{ width: '100%', padding: 14, fontSize: 15, border: `1.5px solid ${colors.border}`, borderRadius: 10, outline: 'none', color: colors.navy }} />
          </div>
          <div style={{ marginBottom: 20 }}>
            <label style={{ fontSize: 13, fontWeight: 600, color: colors.textMid, display: 'block', marginBottom: 8 }}>Email</label>
            <input type="email" value={authEmail} onChange={(e) => setAuthEmail(e.target.value)} placeholder="your@email.com" style={{ width: '100%', padding: 14, fontSize: 15, border: `1.5px solid ${colors.border}`, borderRadius: 10, outline: 'none', color: colors.navy }} />
          </div>
          <div style={{ marginBottom: 24 }}>
            <label style={{ fontSize: 13, fontWeight: 600, color: colors.textMid, display: 'block', marginBottom: 8 }}>Password</label>
            <div style={{ position: 'relative' }}>
              <input type={showPass ? 'text' : 'password'} value={authPassword} onChange={(e) => setAuthPassword(e.target.value)} placeholder="Create password" style={{ width: '100%', padding: 14, paddingRight: 46, fontSize: 15, border: `1.5px solid ${colors.border}`, borderRadius: 10, outline: 'none', color: colors.navy }} />
              <button onClick={() => setShowPass(!showPass)} style={{ position: 'absolute', right: 12, top: '50%', transform: 'translateY(-50%)', background: 'none', border: 'none', cursor: 'pointer', color: colors.textMuted, fontSize: 18 }}>{showPass ? '🙈' : '👁️'}</button>
            </div>
          </div>
          <button onClick={() => setIsLoggedIn(true)} disabled={!authName || !authEmail || !authPassword} style={{ width: '100%', padding: 16, borderRadius: 10, border: 'none', fontSize: 16, fontWeight: 600, background: authName && authEmail && authPassword ? colors.purple : colors.border, color: authName && authEmail && authPassword ? '#fff' : colors.textMuted, cursor: authName && authEmail && authPassword ? 'pointer' : 'not-allowed' }}>
            Create Account
          </button>
          <p style={{ fontSize: 12, color: colors.textMuted, textAlign: 'center', marginTop: 16, lineHeight: 1.4 }}>
            By creating an account, you agree to our<br />Terms of Service and Privacy Policy
          </p>
        </div>
        <p style={{ fontSize: 14, color: colors.textMid, textAlign: 'center', marginTop: 24 }}>
          Already have an account? <span onClick={() => setAuthScreen('login')} style={{ color: colors.purple, fontWeight: 600, cursor: 'pointer' }}>Sign In</span>
        </p>
      </div>
    </div>
  );

  // Note: Old auth screens (WelcomeScreen, LoginScreen, RegisterScreen) are kept for reference
  // but now we use AuthModal for login/register flow

  return (
    <div style={{ minHeight: '100vh', background: colors.bg, fontFamily: '-apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif' }}>
      <style>{`
        * { box-sizing: border-box; margin: 0; padding: 0; }
        ::-webkit-scrollbar { width: 0; height: 0; }
        input::-webkit-outer-spin-button, input::-webkit-inner-spin-button { -webkit-appearance: none; }
        @keyframes pulse { 0%, 100% { opacity: 1; } 50% { opacity: 0.3; } }
      `}</style>
      
      <div style={{ maxWidth: 430, margin: '0 auto', minHeight: '100vh', paddingBottom: 80 }}>
        {view === 'bracket' && <BracketView />}
        {view === 'calendar' && <CalendarView />}
        {view === 'live' && <LiveView />}
        {view === 'rankings' && <RankingsView />}
        {view === 'wallet' && <WalletView />}
        
        <BottomNav />

        {modal === 'deposit' && <DepositModal />}
        {modal === 'withdraw' && <WithdrawModal />}
        {modal === 'submit' && <SubmitBracketModal />}
        {modal === 'blackhorse' && <BlackHorseModal />}
        {modal === 'auth' && <AuthModal />}
        {modal === 'profile' && <ProfileModal />}
        {modal === 'prizes' && <PrizesModal />}
        {selectedBracket && <BracketDetailsModal />}
        {selPlayer && <PlayerModal />}
      </div>
    </div>
  );
}
