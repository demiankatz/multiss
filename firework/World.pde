/**
 * World object (container for all other Sprite objects)
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
class World
{
  int lightLevel = 0;
  ArrayList objects = new ArrayList();

  World()
  {
  }
  
  void redrawBackdrop()
  {
    stroke(0);
    fill(0);
    rect(0, 0, width, height);
    
    int i;
    int c = 190;
    for (i = height - 10; i < height; i++) {
      stroke(vgapal[(int)(c++ / 2) - 75]);
      line (0, i, width, i);
    }
    int halfWidth = (int)(width / 2);
    c = 159;
    for (i = halfWidth - 1; i < halfWidth + 2; i++) {
      stroke(vgapal[c++ - 134]);
      line (i, height - 20, i, height - 11);
      stroke(vgapal[19]);
      line (i - 1, height - 10, i - 4, height - 5);
    }
    set (halfWidth, height - 20, 0);
  }
  
  void add(Object o)
  {
    objects.add(o);
  }

  int count()
  {
    return objects.size();
  }

  void redraw()
  {
    redrawBackdrop();
    Sprite o;
    for (int i = objects.size() - 1; i >= 0; i--) {
      o = (Sprite)objects.get(i);
      if (!o.move()) {
        objects.remove(i);
      }
    }
  }
}
