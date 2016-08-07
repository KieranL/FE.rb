require 'gosu'
require_relative 'animation'
require_relative 'menu'
require_relative 'menu_item'
require_relative 'chapter'
require_relative '../src/cursor'

class RubyEmblemWindow < Gosu::Window
  def initialize
    super Settings.get(:screen_width), Settings.get(:screen_height), Settings.get(:fullscreen)
    @caption = 'Hello World!'
    #@song = Gosu::Song.new('media\music\Fire_Emblem_Theme.wav')
    #@song.play(true)
    @chapter = Chapter.new(self)

    @updates = 0
  end

  def update
    @chapter.update
  end

  def draw
    scale(1) do

        @chapter.draw_map

        Gosu::Image::from_text(self, Gosu::fps, 'Arial', 32).draw(0, 0, 10, 1, 1, Gosu::Color.new(0xffffffff))

    end
  end

  def needs_cursor?
    true
  end

  def button_down(id)
    case id
      when Gosu::KbEscape
        close
    end
  end
end