/**
 * Bouncing ball visualization
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
int numBalls = 750;
Ball[] balls = new Ball[numBalls];

void setup()
{
  fullScreen( );
  background(0);
  frameRate(24);
  for (int x = 0; x < numBalls; x++) {
    balls[x] = new Ball();
  }
}

void draw()
{
  for (int x = 0; x < numBalls; x++) {
    balls[x].move();
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

class Ball
{
  color ballColor;
  float x, y, deltaX, deltaY;
  
  Ball()
  {
    ballColor = color((int)random(256), (int)random(256), (int)random(256));
    do {
      deltaX = random(7) - 3;
      deltaY = random(7) - 3;
    } while ((int)deltaX == 0 && (int)deltaY == 0);
    x = random(width);
    y = random(height);
  }
  
  void move()
  {
    set((int)x, (int)y, color(0));
    
    x += deltaX;
    y += deltaY;
    
    if (x < 0) {
      x = 0;
      deltaX = -deltaX;
    }

    if (x > width) {
      x = width;
      deltaX = -deltaX;
    }

    if (y < 0) {
      y = 0;
      deltaY = -deltaY;
    }

    if (y > height) {
      y = height;
      deltaY = -deltaY;
    }
    
    set((int)x, (int)y, ballColor);
  }
}
