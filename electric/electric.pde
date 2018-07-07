/**
 * Electric arc visualization
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
int xSize = 21;
int x[] = new int[xSize];
int z;
int m;

void setup()
{
  fullScreen();
  background(0);
  frameRate(18);
  m = (int)(height / 40);  
}

void draw()
{
  stroke(0);
  fill(0);
  rect(0, 0, width, height);
  
  x[0] = (int)(width / 2);
  for (z = 1; z < xSize; z++) {
    x[z] = x[z - 1] + (int)random(2 * m + 1) - m;
  }
  
  for (z = 1; z < xSize; z++) {
    stroke(84, 84, 252);
    line (x[z - 1] - 1, z * m - (m + 1), x[z] - 1, z * m - 1);
    line (x[21 - z] - 1, (z + 19) * m - 1, x[20 - z] - 1, (z + 20) * m - 1);
    
    line (x[z - 1] + 1, z * m - (m + 1), x[z] + 1, z * m - 1);
    line (x[21 - z] + 1, (z + 19) * m - 1, x[20 - z] + 1, (z + 20) * m - 1);

    stroke(255);
    line (x[z - 1], z * m - (m + 1), x[z], z * m - 1);
    line (x[21 - z], (z + 19) * m - 1, x[20 - z], (z + 20) * m - 1);
  }
}

void keyPressed()
{
  exit();
}

void mousePressed()
{
  exit();
}
