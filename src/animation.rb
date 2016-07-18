class Animation
  def initialize(total_time = 1000, *frames)
    if frames[0].is_a?(Array)
      @frames = frames[0]
    else
      @frames = frames
    end

    @interval = total_time / @frames.length
  end

  def get_frame
    @frames[Gosu::milliseconds / @interval % @frames.size]
  end
end