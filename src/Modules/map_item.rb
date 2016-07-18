module MapItem
  attr_reader :x_pos, :y_pos
  TILE_SIZE = 64
  @x_pos = 0
  @y_pos = 0

  def move(x , y )
    @x_pos = x
    @y_pos = y
  end

  def x_draw_pos
    @x_pos * TILE_SIZE
  end

  def y_draw_pos
    @y_pos * TILE_SIZE
  end
end