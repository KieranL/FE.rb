require_relative 'item'

class Weapon < Item
  def initialize(icon, name, description, uses, remaining_uses, hit = 0, damage = 0, crit = 0, carrier)
    super(icon, name, description, uses, remaining_uses, carrier)

    @hit = hit
    @damage = damage
    @rank = nil
    @crit = crit
  end

end