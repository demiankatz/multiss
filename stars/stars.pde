/**
 * Star field visualization
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
int numStars = 300;
Star[] stars = new Star[numStars];

void setup()
{
  fullScreen();
  background(0);
  frameRate(24);
  for (int x = 0; x < numStars; x++) {
    stars[x] = new Star();
  }
}

void draw()
{
  for (int x = 0; x < numStars; x++) {
    stars[x].move();
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

class Star
{
  color starColor;
  float x, y, deltaX, deltaY;
  
  Star()
  {
    init();
  }
  
  void init()
  {
    int c = (int)random(255) + 1;
    if (c < 251) {
      starColor = color(c);
    } else {
      starColor = color((int)random(256), (int)random(256), (int)random(256));
    }
    
    int halfWidth = (int)(width / 2);
    int halfHeight = (int)(height / 2);
    x = random(11) + halfWidth - 5;
    y = random(11) + halfHeight - 5;
    
    deltaX = x - halfWidth;
    deltaY = y - halfHeight;
    
    while((int)deltaX == 0 && (int)deltaY == 0) {
      deltaX = random(11) + 5;
      deltaY = random(11) + 5;
    }
  }
  
  void move()
  {
    set((int)x, (int)y, color(0));
    
    x += deltaX;
    y += deltaY;
    
    if (x < 0 || x > width || y < 0 || y > height) {
      init();
    }
    
    set((int)x, (int)y, starColor);
  }
}
