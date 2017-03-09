require 'gosu'
require_relative 'animation'
require_relative 'menu'
require_relative 'menu_item'
require_relative 'game'
require_relative 'cursor'
require_relative 'settings'
require_relative 'chapter'

class RubyEmblemWindow < Gosu::Window
  def initialize
    super Settings.get(:screen_width), Settings.get(:screen_height), Settings.get(:fullscreen)
    @caption = Settings.get(:window_title)
    # @song = Gosu::Song.new('media\music\Fire_Emblem_Theme.wav')
    # @song.play(true)
    @game = Game.new(self)
  end

  def update
    @game.update
  end

  def draw
    scale(1) do
      @game.draw
    end
  end

  def button_down(id)
      @game.button_down(id)

    p 'Button ' + id.to_s + ' down'
    case id
      when Gosu::KbEscape
        close
    end
  end

  def button_up(id)
      @game.button_up(id)

    p 'Button ' + id.to_s + ' up'
  end
end