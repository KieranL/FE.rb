#Class Menu
#
# Taken from http://blog.dreasgrech.com/2010/08/simple-menu-for-gosu-game-in-ruby.html
# and modified
require 'gosu'
require_relative 'Constants/drawing_z'
class Menu
  def initialize (window, x, y, z)
    @window = window
    @items = Array.new
    @x_pos = x
    @y_pos = y
    @width = 100
    @row_height = 32
    @padding = 4
    @selected_index = 0
    #@menu.add_item(Gosu::Image::from_text(self, 'item 1', 'Arial', 32), -> { puts 'something1' })
  end

  def add_item (image, callback, hover_image = nil)
    item = MenuItem.new(@window, image, @x_pos  + @padding, @y_pos + @padding + @items.size * @row_height, DrawingZ::MENU, callback, hover_image)
    @items << item
    self
  end

  def draw
    color = Gosu::Color.new(0xff0033FF)
    @window.draw_quad(@x_pos, @y_pos, color, @x_pos + @width, @y_pos, color, @x_pos, @y_pos + (@items.size) * @row_height + 2 * @padding, color, @x_pos + @width, @y_pos + (@items.size) * @row_height + 2 * @padding, color, DrawingZ::MENU)
    @items.each do |i|
      i.draw
    end
  end

  def update
    @items.each do |i|
      i.update
    end
  end

  def clicked
    @items.each do |i|
      i.clicked
    end
  end
end