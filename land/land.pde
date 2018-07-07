/**
 * Land growth/erosion visualization
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
World world;
Point grow, erode;

// How many pixels of screen do we use for each "pixel" of world?
int pixelScale = 2;

void setup()
{
  fullScreen();
  world = new World();
//  frameRate(48);
  grow = new Point((int)(world.getWidth() / 2), (int)(world.getHeight() / 2));
  erode = new Point(grow.getX() - 1, grow.getY() + 1);
  world.display();
}

void draw()
{
  grow.move();
  erode.move();
//  if ((int)random(3) == 1) {
//    world.raiseCross(grow);
//  } else {
    world.raise(grow);
//  }
  world.lower(erode);
}

void keyPressed()
{
  exit();
}

void mousePressed()
{
  exit();
}

class Point
{
  int x, y;
  
  Point(int newX, int newY)
  {
    x = newX;
    y = newY;
  }
  
  void move()
  {
    x += (int)random(3) - 1;
    y += (int)random(3) - 1;
    
    if (x < 0) {
      x = 0;
    }
    if (x >= world.getWidth()) {
      x = world.getWidth() - 1;
    }
    if (y < 0) {
      y = 0;
    }
    if (y >= world.getHeight()) {
      y = world.getHeight() - 1;
    }
  }
  
  int getX()
  {
    return x;
  }
  
  int getY()
  {
    return y;
  }
}

class World
{
  int[][] worldPixels;
  color[] palette = new color[256];
  int worldWidth, worldHeight;
 
  World()
  {
    worldWidth = (int)(width / pixelScale);
    worldHeight = (int)(height / pixelScale);
    worldPixels = new int[worldWidth][worldHeight];
    for(int x = 0; x < worldWidth; x++) {
      for(int y = 0; y < worldHeight; y++) {
        worldPixels[x][y] = 0;
      }
    }
    palette[0] = color(20, 20, 120);
    for(int c = 1; c < 256; c++) {
      palette[c] = color((int)(c / 5), c, (int)(c / 5));
    }
  }
  
  int getWidth()
  {
    return worldWidth;
  }
  
  int getHeight()
  {
    return worldHeight;
  }
  
  void raise(Point p, int delta)
  {
    if (worldPixels[p.getX()][p.getY()] < (256 - delta)) {
      worldPixels[p.getX()][p.getY()] += delta;
      pset(p.getX(), p.getY());
    }
  }
  
  void raise(Point p)
  {
    raise(p, 20);
  }
  
  void raiseCross(Point p)
  {
    int x = p.getX();
    int y = p.getY();
    
    raise(p, 20);
    raise(new Point(x + 1, y), 5);
    raise(new Point(x - 1, y), 5);
    raise(new Point(x, y + 1), 5);
    raise(new Point(x, y - 1), 5);
  }
  
  void lower(Point p, int delta)
  {
    if (worldPixels[p.getX()][p.getY()] >= delta) {
      worldPixels[p.getX()][p.getY()] -= delta;
      pset(p.getX(), p.getY());
    }
  }
  
  void lower(Point p)
  {
    lower(p, 20);
  }

  void pset(int x, int y)
  {
    if (pixelScale == 1) {
      set(x, y, palette[worldPixels[x][y]]);
    } else {
      fill(palette[worldPixels[x][y]]);
      stroke(palette[worldPixels[x][y]]);
      rect(x * pixelScale, y * pixelScale, pixelScale, pixelScale);
    }
  }
  
  void display()
  {
    for (int x = 0; x < worldWidth; x++) {
      for (int y = 0; y < worldHeight; y++) {
        pset(x, y);
      }
    }
  }
}
