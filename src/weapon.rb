require_relative 'item'

class Weapon < Item
  def initialize(icon, name, description, uses, remaining_uses, hit = 0, damage = 0)
    super(icon, name, description, uses, remaining_uses)

    @hit = hit
    @damage = damage
    @rank = nil
    @crit
  end

end