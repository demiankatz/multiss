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
    //canvas.stroke(0);
    //canvas.fill(0);
    //canvas.rect(0, 0, canvas.width, canvas.height);
    
    int i;
    int c = 190;
    for (i = canvas.height - 10; i < canvas.height; i++) {
      canvas.stroke(vgapal[(int)(c++ / 2) - 75]);
      canvas.line(0, i, canvas.width, i);
    }
    int halfWidth = (int)(canvas.width / 2);
    c = 159;
    for (i = halfWidth - 1; i < halfWidth + 2; i++) {
      canvas.stroke(vgapal[c++ - 134]);
      canvas.line(i, canvas.height - 20, i, canvas.height - 11);
      canvas.stroke(vgapal[19]);
      canvas.line(i - 1, canvas.height - 10, i - 4, canvas.height - 5);
    }
    canvas.set(halfWidth, canvas.height - 20, 0);
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
