class UnitStats
  attr_reader :stats

  def initialize (hp = 0, str = 0, mag = 0, skl = 0, spd = 0, lck = 0, defn = 0, res = 0, con = 0, mov = 0)
    @stats = {hp: hp, str: str, mag: mag, skl: skl, spd: spd, lck: lck, def: defn, res: res, con: con, mov: mov}
  end

  def [](stat)
    stats[stat]
  end

  def []=(stat, value)
    stats[stat] = value
  end
end