/**
 * Rainbow sierpinski triangle visualization
 *
 * Processing version 3
 *
 * Copyright (c) 1998-2018 Demian Katz.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2,
 * as published by the Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 */
color vgapal[] = new color[256];
boolean points[][];

void setup()
{
  fullScreen();
  background(0);
  frameRate(24);
  initPal();
  
  points = new boolean[width][height];
  
  int x = (int)(width / 2);
  int y = 1;
  for (int i1 = 0; i1 < width; i1 += 2) {
    for (int i2 = 0; i2 < height; i2 += 2) {
      switch ((int)random(3))
      {
        case 0 : x = (int)(x / 2); y = (int)(y / 2); break;
        case 1 : x += (int)(width / 2); x = (int)(x / 2); y += height; y = (int)(y / 2); break;
        case 2 : x += width; x = (int)(x / 2); y = (int)(y / 2); break;
      }
      if (x >= 0 && x < width && y >= 0 && y < height) {
        points[x][(height - 1) - y] = true;
      }
    }
  }
}

void draw()
{
  for (int y = 0; y < height; y++) {
    stroke(vgapal[y % 256]);
    line(0, y, width, y);
    for (int x = 0; x < width; x++) {
      if (points[x][y]) {
        set(x, y, vgapal[255 - (y % 256)]);
      }
    }
  }
  rotatePal();
}

void keyPressed()
{
  exit();
}

void mousePressed()
{
  exit();
}

void rotatePal()
{
  color tmp = vgapal[0];
  for (int x = 0; x < 255; x++) {
    vgapal[x] = vgapal[x + 1];
  }
  vgapal[255] = tmp;
}

void initPal()
{
  vgapal[0] = color(0, 0, 0);
  vgapal[1] = color(0, 0, 168);
  vgapal[2] = color(0, 168, 0);
  vgapal[3] = color(0, 168, 168);
  vgapal[4] = color(168, 0, 0);
  vgapal[5] = color(168, 0, 168);
  vgapal[6] = color(168, 84, 0);
  vgapal[7] = color(168, 168, 168);
  vgapal[8] = color(84, 84, 84);
  vgapal[9] = color(84, 84, 252);
  vgapal[10] = color(84, 252, 84);
  vgapal[11] = color(84, 252, 252);
  vgapal[12] = color(252, 84, 84);
  vgapal[13] = color(252, 84, 252);
  vgapal[14] = color(252, 252, 84);
  vgapal[15] = color(252, 252, 252);
  vgapal[16] = color(0, 0, 0);
  vgapal[17] = color(20, 20, 20);
  vgapal[18] = color(32, 32, 32);
  vgapal[19] = color(44, 44, 44);
  vgapal[20] = color(56, 56, 56);
  vgapal[21] = color(68, 68, 68);
  vgapal[22] = color(80, 80, 80);
  vgapal[23] = color(96, 96, 96);
  vgapal[24] = color(112, 112, 112);
  vgapal[25] = color(128, 128, 128);
  vgapal[26] = color(144, 144, 144);
  vgapal[27] = color(160, 160, 160);
  vgapal[28] = color(180, 180, 180);
  vgapal[29] = color(200, 200, 200);
  vgapal[30] = color(224, 224, 224);
  vgapal[31] = color(252, 252, 252);
  vgapal[32] = color(0, 0, 252);
  vgapal[33] = color(64, 0, 252);
  vgapal[34] = color(124, 0, 252);
  vgapal[35] = color(188, 0, 252);
  vgapal[36] = color(252, 0, 252);
  vgapal[37] = color(252, 0, 188);
  vgapal[38] = color(252, 0, 124);
  vgapal[39] = color(252, 0, 64);
  vgapal[40] = color(252, 0, 0);
  vgapal[41] = color(252, 64, 0);
  vgapal[42] = color(252, 124, 0);
  vgapal[43] = color(252, 188, 0);
  vgapal[44] = color(252, 252, 0);
  vgapal[45] = color(188, 252, 0);
  vgapal[46] = color(124, 252, 0);
  vgapal[47] = color(64, 252, 0);
  vgapal[48] = color(0, 252, 0);
  vgapal[49] = color(0, 252, 64);
  vgapal[50] = color(0, 252, 124);
  vgapal[51] = color(0, 252, 188);
  vgapal[52] = color(0, 252, 252);
  vgapal[53] = color(0, 188, 252);
  vgapal[54] = color(0, 124, 252);
  vgapal[55] = color(0, 64, 252);
  vgapal[56] = color(124, 124, 252);
  vgapal[57] = color(156, 124, 252);
  vgapal[58] = color(188, 124, 252);
  vgapal[59] = color(220, 124, 252);
  vgapal[60] = color(252, 124, 252);
  vgapal[61] = color(252, 124, 220);
  vgapal[62] = color(252, 124, 188);
  vgapal[63] = color(252, 124, 156);
  vgapal[64] = color(252, 124, 124);
  vgapal[65] = color(252, 156, 124);
  vgapal[66] = color(252, 188, 124);
  vgapal[67] = color(252, 220, 124);
  vgapal[68] = color(252, 252, 124);
  vgapal[69] = color(220, 252, 124);
  vgapal[70] = color(188, 252, 124);
  vgapal[71] = color(156, 252, 124);
  vgapal[72] = color(124, 252, 124);
  vgapal[73] = color(124, 252, 156);
  vgapal[74] = color(124, 252, 188);
  vgapal[75] = color(124, 252, 220);
  vgapal[76] = color(124, 252, 252);
  vgapal[77] = color(124, 220, 252);
  vgapal[78] = color(124, 188, 252);
  vgapal[79] = color(124, 156, 252);
  vgapal[80] = color(180, 180, 252);
  vgapal[81] = color(196, 180, 252);
  vgapal[82] = color(216, 180, 252);
  vgapal[83] = color(232, 180, 252);
  vgapal[84] = color(252, 180, 252);
  vgapal[85] = color(252, 180, 232);
  vgapal[86] = color(252, 180, 216);
  vgapal[87] = color(252, 180, 196);
  vgapal[88] = color(252, 180, 180);
  vgapal[89] = color(252, 196, 180);
  vgapal[90] = color(252, 216, 180);
  vgapal[91] = color(252, 232, 180);
  vgapal[92] = color(252, 252, 180);
  vgapal[93] = color(232, 252, 180);
  vgapal[94] = color(216, 252, 180);
  vgapal[95] = color(196, 252, 180);
  vgapal[96] = color(180, 252, 180);
  vgapal[97] = color(180, 252, 196);
  vgapal[98] = color(180, 252, 216);
  vgapal[99] = color(180, 252, 232);
  vgapal[100] = color(180, 252, 252);
  vgapal[101] = color(180, 232, 252);
  vgapal[102] = color(180, 216, 252);
  vgapal[103] = color(180, 196, 252);
  vgapal[104] = color(0, 0, 112);
  vgapal[105] = color(28, 0, 112);
  vgapal[106] = color(56, 0, 112);
  vgapal[107] = color(84, 0, 112);
  vgapal[108] = color(112, 0, 112);
  vgapal[109] = color(112, 0, 84);
  vgapal[110] = color(112, 0, 56);
  vgapal[111] = color(112, 0, 28);
  vgapal[112] = color(112, 0, 0);
  vgapal[113] = color(112, 28, 0);
  vgapal[114] = color(112, 56, 0);
  vgapal[115] = color(112, 84, 0);
  vgapal[116] = color(112, 112, 0);
  vgapal[117] = color(84, 112, 0);
  vgapal[118] = color(56, 112, 0);
  vgapal[119] = color(28, 112, 0);
  vgapal[120] = color(0, 112, 0);
  vgapal[121] = color(0, 112, 28);
  vgapal[122] = color(0, 112, 56);
  vgapal[123] = color(0, 112, 84);
  vgapal[124] = color(0, 112, 112);
  vgapal[125] = color(0, 84, 112);
  vgapal[126] = color(0, 56, 112);
  vgapal[127] = color(0, 28, 112);
  vgapal[128] = color(56, 56, 112);
  vgapal[129] = color(68, 56, 112);
  vgapal[130] = color(84, 56, 112);
  vgapal[131] = color(96, 56, 112);
  vgapal[132] = color(112, 56, 112);
  vgapal[133] = color(112, 56, 96);
  vgapal[134] = color(112, 56, 84);
  vgapal[135] = color(112, 56, 68);
  vgapal[136] = color(112, 56, 56);
  vgapal[137] = color(112, 68, 56);
  vgapal[138] = color(112, 84, 56);
  vgapal[139] = color(112, 96, 56);
  vgapal[140] = color(112, 112, 56);
  vgapal[141] = color(96, 112, 56);
  vgapal[142] = color(84, 112, 56);
  vgapal[143] = color(68, 112, 56);
  vgapal[144] = color(56, 112, 56);
  vgapal[145] = color(56, 112, 68);
  vgapal[146] = color(56, 112, 84);
  vgapal[147] = color(56, 112, 96);
  vgapal[148] = color(56, 112, 112);
  vgapal[149] = color(56, 96, 112);
  vgapal[150] = color(56, 84, 112);
  vgapal[151] = color(56, 68, 112);
  vgapal[152] = color(80, 80, 112);
  vgapal[153] = color(88, 80, 112);
  vgapal[154] = color(96, 80, 112);
  vgapal[155] = color(104, 80, 112);
  vgapal[156] = color(112, 80, 112);
  vgapal[157] = color(112, 80, 104);
  vgapal[158] = color(112, 80, 96);
  vgapal[159] = color(112, 80, 88);
  vgapal[160] = color(112, 80, 80);
  vgapal[161] = color(112, 88, 80);
  vgapal[162] = color(112, 96, 80);
  vgapal[163] = color(112, 104, 80);
  vgapal[164] = color(112, 112, 80);
  vgapal[165] = color(104, 112, 80);
  vgapal[166] = color(96, 112, 80);
  vgapal[167] = color(88, 112, 80);
  vgapal[168] = color(80, 112, 80);
  vgapal[169] = color(80, 112, 88);
  vgapal[170] = color(80, 112, 96);
  vgapal[171] = color(80, 112, 104);
  vgapal[172] = color(80, 112, 112);
  vgapal[173] = color(80, 104, 112);
  vgapal[174] = color(80, 96, 112);
  vgapal[175] = color(80, 88, 112);
  vgapal[176] = color(0, 0, 64);
  vgapal[177] = color(16, 0, 64);
  vgapal[178] = color(32, 0, 64);
  vgapal[179] = color(48, 0, 64);
  vgapal[180] = color(64, 0, 64);
  vgapal[181] = color(64, 0, 48);
  vgapal[182] = color(64, 0, 32);
  vgapal[183] = color(64, 0, 16);
  vgapal[184] = color(64, 0, 0);
  vgapal[185] = color(64, 16, 0);
  vgapal[186] = color(64, 32, 0);
  vgapal[187] = color(64, 48, 0);
  vgapal[188] = color(64, 64, 0);
  vgapal[189] = color(48, 64, 0);
  vgapal[190] = color(32, 64, 0);
  vgapal[191] = color(16, 64, 0);
  vgapal[192] = color(0, 64, 0);
  vgapal[193] = color(0, 64, 16);
  vgapal[194] = color(0, 64, 32);
  vgapal[195] = color(0, 64, 48);
  vgapal[196] = color(0, 64, 64);
  vgapal[197] = color(0, 48, 64);
  vgapal[198] = color(0, 32, 64);
  vgapal[199] = color(0, 16, 64);
  vgapal[200] = color(32, 32, 64);
  vgapal[201] = color(40, 32, 64);
  vgapal[202] = color(48, 32, 64);
  vgapal[203] = color(56, 32, 64);
  vgapal[204] = color(64, 32, 64);
  vgapal[205] = color(64, 32, 56);
  vgapal[206] = color(64, 32, 48);
  vgapal[207] = color(64, 32, 40);
  vgapal[208] = color(64, 32, 32);
  vgapal[209] = color(64, 40, 32);
  vgapal[210] = color(64, 48, 32);
  vgapal[211] = color(64, 56, 32);
  vgapal[212] = color(64, 64, 32);
  vgapal[213] = color(56, 64, 32);
  vgapal[214] = color(48, 64, 32);
  vgapal[215] = color(40, 64, 32);
  vgapal[216] = color(32, 64, 32);
  vgapal[217] = color(32, 64, 40);
  vgapal[218] = color(32, 64, 48);
  vgapal[219] = color(32, 64, 56);
  vgapal[220] = color(32, 64, 64);
  vgapal[221] = color(32, 56, 64);
  vgapal[222] = color(32, 48, 64);
  vgapal[223] = color(32, 40, 64);
  vgapal[224] = color(44, 44, 64);
  vgapal[225] = color(48, 44, 64);
  vgapal[226] = color(52, 44, 64);
  vgapal[227] = color(60, 44, 64);
  vgapal[228] = color(64, 44, 64);
  vgapal[229] = color(64, 44, 60);
  vgapal[230] = color(64, 44, 52);
  vgapal[231] = color(64, 44, 48);
  vgapal[232] = color(64, 44, 44);
  vgapal[233] = color(64, 48, 44);
  vgapal[234] = color(64, 52, 44);
  vgapal[235] = color(64, 60, 44);
  vgapal[236] = color(64, 64, 44);
  vgapal[237] = color(60, 64, 44);
  vgapal[238] = color(52, 64, 44);
  vgapal[239] = color(48, 64, 44);
  vgapal[240] = color(44, 64, 44);
  vgapal[241] = color(44, 64, 48);
  vgapal[242] = color(44, 64, 52);
  vgapal[243] = color(44, 64, 60);
  vgapal[244] = color(44, 64, 64);
  vgapal[245] = color(44, 60, 64);
  vgapal[246] = color(44, 52, 64);
  vgapal[247] = color(44, 48, 64);
  vgapal[248] = color(0, 0, 0);
  vgapal[249] = color(0, 0, 0);
  vgapal[250] = color(0, 0, 0);
  vgapal[251] = color(0, 0, 0);
  vgapal[252] = color(0, 0, 0);
  vgapal[253] = color(0, 0, 0);
  vgapal[254] = color(0, 0, 0);
  vgapal[255] = color(0, 0, 0);
}
