require_relative '../src/Modules/map_item'
require_relative '../src/Constants/drawing_z'

class MapTile
  include MapItem
  def initialize(x, y, icon)
    @x_pos = x
    @y_pos = y
    @icon = icon
  end

  def draw
    @icon.get_frame.draw(x_draw_pos, y_draw_pos, DrawingZ::MAP)
  end
end