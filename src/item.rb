
class Item
  def initialize(icon = nil, name = '', description = '', uses = 0, remaining_uses = uses, carrier)
    @name = name
    @description = description
    @uses = uses
    @remaining_uses = remaining_uses
    @icon = icon
    @carrier = carrier
  end

  def use
    @remaining_uses -= 1

    if @remaining_uses <= 0
      @carrier.inventory.remove_item(self)
    end
  end
end