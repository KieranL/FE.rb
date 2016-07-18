class Controller
  def initialize(chapter)
    @chapter = chapter
    @updates = 0
    @cursor_speed = 8
    @cursor_movements = 0
  end

  def update
    if @updates % @cursor_speed == 0
      if (Gosu::button_down? Gosu::KbW) || (Gosu::button_down? Gosu::KbA) || (Gosu::button_down? Gosu::KbS) || (Gosu::button_down? Gosu::KbD)
        @cursor_movements += 1

        if @cursor_movements > 3
          @cursor_speed = 3
        end
      else
        @cursor_speed = 10
        @cursor_movements = 0
      end

      @chapter.cursor.move_up(Gosu::button_down? Gosu::KbW)

      @chapter.cursor.move_left(Gosu::button_down? Gosu::KbA)

      @chapter.cursor.move_down(Gosu::button_down? Gosu::KbS)

      @chapter.cursor.move_right(Gosu::button_down? Gosu::KbD)
    end

    @updates += 1

    if @updates >= 60
      @updates = 0
    end
  end
end