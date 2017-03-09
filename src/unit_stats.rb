class UnitStats
  attr_reader :stats

  def initialize (stats = {})
    @stats = stats
    @stats.default = 0
  end

  def self.init_from_json(json_file)
    UnitStats.new(JSON.parse(json_file, :symbolize_names => true))
  end

  def [](stat)
    stats[stat]
  end

  def []=(stat, value)
    stats[stat] = value
  end
end