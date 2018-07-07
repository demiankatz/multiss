/**
 * Rocket object
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
class Rocket extends Sprite
{
  int i, velocity, dir, endpoint, x, y, oldX, oldY, blastType;
  
  Rocket(int inX, int inY, int inDir, int inVel)
  {
    x = inX;
    y = inY;
    velocity = inVel;
    if (velocity < 0) {
      endpoint = (int)-velocity / 2;
    } else if (velocity == 0) {
      endpoint = 10;
    } else {
      endpoint = (int)(velocity * 1.5);
    }
    dir = inDir;
    blastType = (int)random(blastTypes);    
  }
  
  void init()
  {
  }

  boolean move()
  {
    oldX = x;
    oldY = y;
    y += velocity;
    velocity += gravity;
    x += dir;
    canvas.stroke((int)random(256), (int)random(256), (int)random(256));
    canvas.line(x, y, oldX, oldY);
    canvas.stroke(255);
    canvas.line (x - 1, y, x + 1, y);
    canvas.line (x, y - 1, x, y + 1);
    if (velocity > endpoint) {
      switch(blastType) {
        case 0:
          world.add(new RoundBlast(x, y));
          break;
        case 1:
          world.add(new StarryBlast(x, y));
          break;
        case 2:
          world.add(new ScatterBlast(x, y));
          break;
//      case 3:
//        world.add(new RocketBlast(x, y));
//        break;
        default:
          world.add(new LineBlast(x, y));
          break;
      }
      return false;
    }
    return true;
  }
}
