require_relative '../src/Modules/map_item'
require_relative '../src/Constants/drawing_z'
require_relative '../src/animation'

class Cursor
  include MapItem
  def initialize(chapter)
    @chapter = chapter
    move(@chapter.map.width / 2, @chapter.map.height / 2)
    img1 = Gosu::Image.new(@chapter.window, 'media\cursor.png', true)
    img2 = Gosu::Image.new(@chapter.window, 'media\cursor2.png', true)
    @icon = Animation.new(1000, img1, img2)
  end

  def draw
    img = @icon.get_frame
    img.draw(x_draw_pos - ((img.width - MapItem::TILE_SIZE) / 2), y_draw_pos - ((img.height - MapItem::TILE_SIZE) / 2), DrawingZ::CURSOR)
  end

  def move_right(pressed)
    @is_moving_right = pressed
    if pressed && x_pos < @chapter.map.width
      @x_pos += 1
    end
  end

  def move_down(pressed)
    @is_moving_down = pressed
    if pressed && y_pos < @chapter.map.height
      @y_pos += 1
    end
  end

  def move_left(pressed)
    @is_moving_left = pressed
    if pressed && x_pos > 0
      @x_pos -= 1
    end
  end

  def move_up(pressed)
    @is_moving_up = pressed
    if pressed && y_pos > 0
      @y_pos -= 1
    end
  end
end