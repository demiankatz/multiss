/**
 * Particle-scattering explosion object
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
class ScatterBlast extends Sprite
{
  ScatterBlast(int x, int y)
  {
    color[] palette = getRandomPalette((int)random(32) + 10, (int)random(32) + 10, (int)random(32) + 10, 10);
    int particles = (int)random(70) + 10;
    for (int i = 0; i < particles; i++) {
      world.add(new VelocityParticle(x, y, palette[(int)random(5) * 2]));
    }
  }
  
  boolean move()
  {
    return false;
  }
}
