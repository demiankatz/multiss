/**
 * Starry explosion object
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
class StarryBlast extends Sprite
{
  int x, y;
  color[] palette = getRandomPalette((int)random(64), (int)random(64), (int)random(64), 11);
  int maxSize = 10;
  int step = 0;
  
  StarryBlast(int inX, int inY)
  {
    x = inX;
    y = inY;
  }

  boolean move()
  {
    step++;
    y += gravity;
    
    int pointsToDraw = (step <= maxSize) ? step : maxSize - (step - maxSize);
    for (int i = 0; i < pointsToDraw; i++) {
      set(x + i, y, palette[i]);
      set(x - i, y, palette[i]);
      set(x, y + i, palette[i]);
      set(x, y - i, palette[i]);
      set(x + i - 4, y - i + 4, palette[i]);
      set(x - i + 4, y + i - 4, palette[i]);
      set(x - i + 4, y - i + 4, palette[i]);
      set(x + i - 4, y + i - 4, palette[i]);
    }
    
    if (step >= 2 * maxSize) {
      return false;
    }
    return true;
  }
}
