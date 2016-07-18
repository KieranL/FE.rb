require_relative 'Modules/map_item'
require_relative 'unit'
class Player
  include MapItem
  def initialize

    @inventory = nil
    @stats = nil
    move(0, 0)
    @cursor = Unit.new

    setup_animations
  end

  def setup_animations
    img = Gosu::Image::load_tiles('media\hero.png', 256, 256)
    @animation_still = Animation.new(1000, img[0], img[1], img[2], img[1])

    img = Gosu::Image::load_tiles('media\hero_left.png', 256, 256)
    @animation_left = Animation.new(1000, img[0], img[1], img[2], img[3])

    img = Gosu::Image::load_tiles('media\hero_right.png', 256, 256)
    @animation_right = Animation.new(1000, img[0], img[1], img[2], img[3])

    img = Gosu::Image::load_tiles('media\hero_up.png', 256, 256)
    @animation_up = Animation.new(1000, img[0], img[1], img[2], img[3])

    img = Gosu::Image::load_tiles('media\hero_down.png', 256, 256)
    @animation_down = Animation.new(1000, [img[0], img[1], img[2], img[3]])
  end

  def draw
    if @is_moving_right
      @animation_right.get_frame.draw(x_draw_pos, y_draw_pos, 1)
    elsif @is_moving_left
      @animation_left.get_frame.draw(x_draw_pos, y_draw_pos, 1)
    elsif @is_moving_down
      @animation_down.get_frame.draw(x_draw_pos, y_draw_pos, 1)
    elsif @is_moving_up
      @animation_up.get_frame.draw(x_draw_pos, y_draw_pos, 1)
    else
      puts @animation_still.get_frame.draw(x_draw_pos, y_draw_pos, 1)
    end
  end

end