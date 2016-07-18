require_relative 'item'

class Inventory
  def initialize
    @items = Array.new
  end

  def <<(item)
    items << item
  end
end