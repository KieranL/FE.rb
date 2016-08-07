require 'json'

class Settings
  def self.init
    file = File.read('C:\Users\kieran\Documents\Ruby\FE.rb\src\config.json')
    @setting = DEFAULT_SETTINGS.merge(JSON.parse(file, :symbolize_names => true))
  end

  def self.get(setting)
    if @setting == nil
      init
    end
    @setting[setting]
  end

  DEFAULT_SETTINGS = {
      fullscreen: true,
      screen_width: Gosu::screen_width,
      screen_height: Gosu::screen_height


  }
end