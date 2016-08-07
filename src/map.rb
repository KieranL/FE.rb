require_relative 'Constants/drawing_z'
require_relative 'Modules/map_item'
require_relative 'animation'
require_relative 'map_tile'
require_relative 'settings'

class Map
  attr_reader :width, :height
  def initialize(chapter)
    @chapter = chapter

    @background_image = Animation.new(1000, Gosu::Image.new(@chapter.window, 'media\grass.png', true))
    @width = 60 #29
    @height = 24 #16
    @tiles = Hash.new

    0.upto(@width) do |x|
      0.upto(@height) do |y|
        @tiles[[x, y]] = MapTile.new(x, y, @background_image)
      end
    end
  end

  def draw
    0.upto(@width) do |x|
      0.upto(@height) do |y|
        @tiles[[x, y]].draw
      end
    end
  end
end