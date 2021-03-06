require_relative 'unit_stats'
require_relative 'inventory'
require_relative 'Modules/map_item'
require_relative 'Constants/stat_constants'
require_relative 'animation'
require_relative 'weapon'
require_relative 'settings'
require_relative 'unit'

class Unit
  attr_reader :inventory
  include MapItem
  def initialize(stats, growths, caps, inv, level, exp, portrait, map_sprite, x = 0, y = 0)
    @stats = stats
    @growths = growths
    @caps = caps
    @inventory = inv
    @level = level
    @exp = exp
    @portrait = portrait
    @map_sprite = map_sprite
    @supports = {}
    @weapon_levels = {}

    move(x, y)
    level_up
  end

  def self.init_from_json(json_file)
    parameters = JSON.parse(json_file, :symbolize_names => true)
    map_sprite = Animation.new(1000, Gosu::Image::load_tiles(File.expand_path('..\media\hero.png', Settings.get(:src_dir)), 256, 256))
    stats = UnitStats.new(parameters[:stats])
    caps = UnitStats.new(parameters[:caps])
    growths = UnitStats.new(parameters[:growths])

    Unit.new(stats, caps, growths, Inventory.new, parameters[:level], parameters[:exp], nil, map_sprite, parameters[:x], parameters[:y])
  end

  def add_exp (exp)
    @exp += exp

    if @exp >= StatConstants::EXP_TO_LEVEL
      level_up
      @exp -= StatConstants::EXP_TO_LEVEL
    end
  end

  def level_up
    @stats.stats.each_key do |k|
      level_up_stat(k)
    end
  end

  def level_up_stat(stat)
    new_value = @stats[stat] + @growths[stat] / 100

    if rand(100) <= @growths[stat]
      new_value += 1
    end

    if new_value > @caps[stat]
      new_value = @caps[stat]
    end

    @stats[stat] = new_value
  end

  def draw
    @map_sprite.draw(x_draw_pos, y_draw_pos, DrawingZ::UNITS)
  end
end