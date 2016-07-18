require_relative 'unit_stats'
require_relative 'inventory'
require_relative 'Modules/map_item'
require_relative '../src/Constants/stat_constants'

class Unit
  include MapItem
  def initialize
    @stats = UnitStats.new
    @growths = UnitStats.new
    @caps = UnitStats.new
    @inventory = Inventory.new
    @level = 0
    @exp = 0
    @portrait = nil
    @map_sprite = nil
    level_up
  end

  def add_exp (exp)
    @exp += exp

    if @exp >= StatConstants::EXP_TO_LEVEL
      level_up
      @exp -= StatConstants::EXP_TO_LEVEL
    end
  end

  def level_up
    level_up_stat_2(:hp)
    level_up_stat_2(:str)
    level_up_stat_2(:mag)
    level_up_stat_2(:skl)
    level_up_stat_2(:spd)
    level_up_stat_2(:lck)
    level_up_stat_2(:def)
    level_up_stat_2(:res)
  end

  def level_up_stat_2(stat)
    new_value = @stats[stat] + @growths[stat] / 100

    if rand(100) <= @growths[stat]
      new_value += 1
    end

    if new_value > @caps[stat]
      new_value = @caps[stat]
    end

    @stats[stat] = new_value
  end
end