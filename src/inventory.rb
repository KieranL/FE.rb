require_relative 'item'

class Inventory
  def initialize
    @items = Array.new
  end

  def <<(item)
    @items << item
  end

  def [](i)
    @items[i]
  end

  def remove_item(item)
    @items.delete(item)
  end
end