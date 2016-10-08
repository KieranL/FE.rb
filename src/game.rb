require_relative 'chapter'
require 'state_machine'

class Game
  def initialize(window)
    @chapter = Chapter.new(window)
    super()
  end

  state_machine :state, initial: :INTRO do
    event :finish_intro do
      transition :INTRO => :MAIN_MENU
      p 'ending intro, opening main menu'
    end

    event :chapter_selected do
      transition :MAIN_MENU => :CHAPTER_INTRO
      p 'starting chapter intro'
    end

    event :finish_chapter_intro do
      transition :CHAPTER_INTRO => :BATTLE_PREPARATIONS
      p 'opening battle preparations'
    end

    event :begin_chapter do
      transition :BATTLE_PREPARATIONS => :CHAPTER
      p 'starting chapter'
    end

    event :finish_chapter do
      transition :CHAPTER => :CHAPTER_ENDING
      p 'ending chapter'
    end

    state :INTRO do
      def update
      end

      def draw
      end
    end

    state :MAIN_MENU do
      def update
      end

      def draw
      end
    end

    state :CHAPTER_INTRO do
      def update
      end

      def draw
      end
    end

    state :BATTLE_PREPARATIONS do
      def update
      end

      def draw
      end
    end

    state :CHAPTER do
      def update
        @chapter.update
      end

      def draw
        @chapter.draw_map
        Gosu::Image::from_text(self, Gosu::fps, 'Arial', 32).draw(0, 0, 10, 1, 1, Gosu::Color.new(0xffffffff))
      end
    end

    state :CHAPTER_ENDING do
      def update
      end

      def draw
      end
    end
  end
end
