/**
 * Round explosion object
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
class RoundBlast extends Sprite
{
  int x, y, rad, maxrad;
  color[] palette = getRandomPalette((int)random(64), (int)random(64), (int)random(64), 11);
  color[] rings;
  int step = 0;
  
  RoundBlast(int inX, int inY)
  {
    x = inX;
    y = inY;
    maxrad = (int)random(5) + 7;
    rings = new color[maxrad];
    for (int i = 0; i < maxrad; i++) {
      rings[i] = palette[i];
    }
  }

  boolean move()
  {
    step++;
    y += gravity;
    
    int ringsToDraw = (step <= maxrad) ? step : maxrad - (step - maxrad);
    for (int i = 0; i < ringsToDraw; i++) {
      canvas.stroke(rings[i]);
      canvas.fill(rings[i]);
      canvas.ellipse(x, y, 2 * (i + 1), 2 * (i + 1));
    }
    
    if (step >= 2 * maxrad) {
      return false;
    }
    return true;
  }
}
