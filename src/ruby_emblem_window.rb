require 'gosu'
require_relative 'animation'
require_relative 'menu'
require_relative 'menu_item'
require_relative 'game'
require_relative '../src/cursor'
require_relative 'settings'

class RubyEmblemWindow < Gosu::Window
  def initialize
    super Settings.get(:screen_width), Settings.get(:screen_height), Settings.get(:fullscreen)
    @caption = Settings.get(:window_title)
    # @song = Gosu::Song.new('media\music\Fire_Emblem_Theme.wav')
    # @song.play(true)
    @game = Game.new(self)
    @game.finish_intro
    @game.chapter_selected
    @game.finish_chapter_intro
    @game.begin_chapter
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
    case id
      when Gosu::KbEscape
        close
    end
  end
end