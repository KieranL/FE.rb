require_relative 'Constants/drawing_z'
require_relative 'Modules/map_item'
require_relative 'animation'
require_relative 'map_tile'
require_relative 'settings'
require 'gosu'

class Map
  attr_reader :width, :height
  def initialize(chapter, width = 20, height = 20)
    @chapter = chapter

    @background_image = Animation.new(1000, Gosu::Image.new(@chapter.window, File.expand_path('..\media\grass.png', Settings.get(:src_dir)), true))
    @width = width #29
    @height = height #16
    @tiles = {}

    0.upto(@width) do |x|
      0.upto(@height) do |y|
        @tiles[[x, y]] = MapTile.new(x, y, @background_image)
      end
    end
  end

  def self.init_from_json(chapter, json_file)
    parameters = JSON.parse(json_file, :symbolize_names => true)

    width = parameters[:width]
    height = parameters[:height]

    Map.new(chapter, width, height)
  end

  def draw
    0.upto(@width) do |x|
      0.upto(@height) do |y|
        @tiles[[x, y]].draw
      end
    end
  end
end