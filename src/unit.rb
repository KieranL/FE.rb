require_relative 'unit_stats'
require_relative 'inventory'
require_relative 'Modules/map_item'
require_relative 'Constants/stat_constants'
require_relative 'animation'

class Unit
  include MapItem
  def initialize(window)
    @window = window
    @stats = UnitStats.new
    @growths = UnitStats.new
    @caps = UnitStats.new
    @inventory = Inventory.new
    @level = 0
    @exp = 0
    @portrait = nil
    @map_sprite = Animation.new(1000, Gosu::Image::load_tiles(File.expand_path('..\media\hero.png', Settings.get(:src_dir)), 256, 256))
    level_up
    move(0, 5)
  end

  def add_exp (exp)
    @exp += exp

    if @exp >= StatConstants::EXP_TO_LEVEL
      level_up
      @exp -= StatConstants::EXP_TO_LEVEL
    end
  end

  def level_up
    level_up_stat(:hp)
    level_up_stat(:str)
    level_up_stat(:mag)
    level_up_stat(:skl)
    level_up_stat(:spd)
    level_up_stat(:lck)
    level_up_stat(:def)
    level_up_stat(:res)
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