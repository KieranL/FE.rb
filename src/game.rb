require_relative 'chapter'
require_relative 'menu'
require_relative 'Constants/drawing_z'
require_relative 'settings'
require 'state_machine'

class Game
  def initialize(window)
    @window = window
    @chapter = Chapter.new(window)
    super()
  end

  state_machine :state, initial: :INTRO do
    event :finish_intro do
      transition :INTRO => :MAIN_MENU
    end

    before_transition :MAIN_MENU => :CHAPTER_INTRO do |obj, trans|
      args = trans.args.dup
      @chapter = args[0]
    end

    event :chapter_selected do
      transition :MAIN_MENU => :CHAPTER_INTRO
    end

    event :finish_chapter_intro do
      transition :CHAPTER_INTRO => :BATTLE_PREPARATIONS
    end

    event :begin_chapter do
      transition :BATTLE_PREPARATIONS => :CHAPTER
    end

    event :finish_chapter do
      transition :CHAPTER => :CHAPTER_ENDING
    end

    state :INTRO do
      def update

      end

      def draw
        img = Gosu::Image::from_text(self, 'Intro', Settings.get(:main_menu_font), 32)
        img.draw(100, 100, DrawingZ::MENU)
      end

      def button_down(id)

      end

      def button_up(id)
        finish_intro
      end
    end

    state :MAIN_MENU do
      def update

      end

      def draw
        @menu = Menu.new(@window, 50, 50, DrawingZ::MENU)
        @menu.add_item(Gosu::Image::from_text(self, 'Start Chapter', Settings.get(:main_menu_font), 32), -> { puts 'something1' })

        @menu.draw
      end

      def button_down(id)
        chapter_selected
      end

      def button_up(id)

      end
    end

    state :CHAPTER_INTRO do
      def update

      end

      def draw

      end

      def button_down(id)
        finish_chapter_intro
      end

      def button_up(id)

      end
    end

    state :BATTLE_PREPARATIONS do
      def update

      end

      def draw

      end

      def button_down(id)
        begin_chapter
      end

      def button_up(id)

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

      def button_down(id)

      end

      def button_up(id)

      end
    end

    state :CHAPTER_ENDING do
      def update
      end

      def draw

      end

      def button_down(id)

      end

      def button_up(id)

      end
    end
  end
end
