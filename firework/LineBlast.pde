/**
 * Line-based explosion object
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
class LineBlast extends Sprite
{
  int lines = 16;
  LineBlastPart[] parts = new LineBlastPart[lines];
  int colors = 26;
  color[] palette = getRandomPalette((int)random(64), (int)random(64), (int)random(64), colors);
  int step = 0;
  int x, y;
  
  LineBlast(int inX, int inY)
  {
    x = inX;
    y = inY;
    for (int i = 0; i < lines; i++) {
      parts[i] = new LineBlastPart(palette[(int)random(colors)]);
    }
  }
  
  boolean move()
  {
    y += gravity;
    step++;
    if (step >= lines * 2) {
      return false;
    }
    for (int i = 0; i < step && i < lines; i++) {
      parts[i].display(x, y);
    }
    if (step > lines) {
      stroke(0);
      fill(0);
      int d = 2 * (step - lines + 1);
      ellipse(x, y, d, d);
    }
    return true;
  }

  class LineBlastPart
  {
    int x1, y1;
    color c;
    
    LineBlastPart(int initC)
    {
      c = initC;
      x1 = (int)random(10) + 1;
      y1 = (int)random(10) + 1;
    }
    
    void display(int x, int y)
    {
      stroke(c);
      line (x, y, x + x1, y + y1);
      line (x, y, x - x1, y + y1);
      line (x, y, x + x1, y - y1);
      line (x, y, x - x1, y - y1);
    }
  }
}
