/**
 * Particle with velocity object
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
class VelocityParticle extends Sprite
{
  int v, e, x, y, d, c;
  
  VelocityParticle(int inX, int inY, int inC)
  {
    v = (int)random(11) - 5;
    x = inX + (int)random(33) - 16;
    y = inY + (int)random(33) - 16;
    d = (int)random(5);
    if (x - inX < 0) {
      d = -d;
    }
    c = inC;
  }
  
  boolean move()
  {
    y += v;
    v += gravity;
    x += d;
    if (x < 0) {
      x = 0; 
      d = (int)(-d / 2);
    }
    if (x >= width) {
      x = (width - 1);
      d = (int)(-d / 2);
    }
    if (y > height - 10) {
      v = (int)(-v / 2);
      y++;
    }
    set(x, y, c);
    if (y >= (height - 1)) {
      return false;
    }
    return true;
  }
}
