class Animation
  def initialize(total_time = 1000, *frames)
    @frames = if frames[0].is_a?(Array) then frames[0] else frames end

    @interval = total_time / @frames.length
  end

  def get_frame
    @frames[Gosu::milliseconds / @interval % @frames.size]
  end

  def draw(x, y, z)
    get_frame.draw(x, y, z)
  end
end