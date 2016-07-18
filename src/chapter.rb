require_relative 'map'
require_relative '../src/controller'
class Chapter
  attr_reader :window, :map, :cursor
  def initialize (window)
    @window = window
    @map = Map.new(self)
    @cursor = Cursor.new(self)
    @controller = Controller.new(self)
  end

  def update
    @controller.update
  end

  def draw_map
    @map.draw

    @cursor.draw
  end
end