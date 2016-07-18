
class Item
  def initialize(icon = nil, name = '', description = '', uses = 0, remaining_uses = uses)
    @name = name
    @description = description
    @uses = uses
    @remaining_uses = remaining_uses
    @icon = icon
  end

  def use
    if @remaining_uses > 0
      @remaining_uses -= 1
    end
  end
end