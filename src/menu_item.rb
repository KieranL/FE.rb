#Class MenuItem
#
# Taken from http://blog.dreasgrech.com/2010/08/simple-menu-for-gosu-game-in-ruby.html
# and modified
require 'gosu'
class MenuItem
  HOVER_OFFSET = 3
  def initialize (window, image, x, y, z, callback, hover_image = nil)
    @window = window
    @main_image = image
    @hover_image = hover_image
    @original_x = @x_pos = x
    @original_y = @y_pos = y
    @z = z
    @callback = callback
    @active_image = @main_image
  end

  def draw
    @active_image.draw(@x_pos, @y_pos, @z, 1, 1, Gosu::Color.new(0xffffffff))
  end

  def update
    if is_mouse_hovering
      unless @hover_image.nil?
        @active_image = @hover_image
      end

      @x_pos = @original_x + HOVER_OFFSET
      @y_pos = @original_y + HOVER_OFFSET
    else
      @active_image = @main_image
      @x_pos = @original_x
      @y_pos = @original_y
    end
  end

  def is_mouse_hovering
    mx = @window.mouse_x
    my = @window.mouse_y

    (mx >= @x_pos and my >= @y_pos) and (mx <= @x_pos + @active_image.width) and (my <= @y_pos + @active_image.height)
  end

  def clicked
    if is_mouse_hovering
      @callback.call
    end
  end
end