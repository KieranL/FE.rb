require_relative 'map'
require_relative '../src/controller'
require_relative '../src/Modules/map_item'
require_relative '../src/unit'
class Chapter
  attr_reader :window, :map, :cursor
  def initialize (window)
    @window = window
    @map = Map.init_from_json(self, File.read(File.expand_path('map_config.json', Settings.get(:src_dir))))
    @cursor = Cursor.new(self)
    @controller = Controller.new(self)
    @units = []

    @units << Unit.init_from_json(File.read(File.expand_path('unit_config.json', Settings.get(:src_dir))))
    puts @viewable_width = (window.width / MapItem::TILE_SIZE).floor
    puts @viewable_height = (window.height / MapItem::TILE_SIZE).floor
  end

  def update
    @controller.update
  end

  def draw_map
    @window.translate(x_translate, y_translate) do
      @map.draw

      @cursor.draw
      @units.each { |unit| unit.draw }
    end
  end

  def x_translate
    centre = @cursor.x_pos
    min_viewable = centre - @viewable_width / 2

    translate = 0 - min_viewable * MapItem::TILE_SIZE - MapItem::TILE_SIZE / 2
    if translate > 0
      0
    elsif translate < -(@map.width * MapItem::TILE_SIZE - @window.width + MapItem::TILE_SIZE)
      -(@map.width * MapItem::TILE_SIZE - @window.width + MapItem::TILE_SIZE)
    else
      translate
    end
  end

  def y_translate
    centre = @cursor.y_pos
    min_viewable = centre - @viewable_height / 2

    translate = 0 - min_viewable * MapItem::TILE_SIZE - MapItem::TILE_SIZE / 2

    if translate > 0
      0
    elsif translate < -(@map.height * MapItem::TILE_SIZE - @window.height + MapItem::TILE_SIZE)
      -(@map.height * MapItem::TILE_SIZE - @window.height + MapItem::TILE_SIZE)
    else
      translate
    end
  end
end