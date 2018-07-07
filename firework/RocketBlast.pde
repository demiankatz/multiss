/**
 * Rocket-launching explosion object (experimental)
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
class RocketBlast extends Sprite
{
  RocketBlast(int x, int y)
  {
    // If we're close to the top of the screen, we don't want to keep shooting rockets...
    if (y < (int)(canvas.height / 20)) {
      world.add(new ScatterBlast(x, y));
      return;
    }
    int r = (int)random(5) + 3;
    for (int i = 0; i < r; i++) {
      world.add(new Rocket(x, y, (int)random(5) - 2, (int)random(5) - 11));
    }
  }
  
  boolean move()
  {
    return false;
  }
}
