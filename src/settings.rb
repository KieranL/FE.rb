require 'json'

class Settings
  def self.init
    @setting = DEFAULT_SETTINGS

    begin
      file = File.read(File.expand_path('config.json', @setting[:src_dir]))
      @setting.merge!(JSON.parse(file, :symbolize_names => true))
    rescue
      p 'No config file found'
    end
  end

  def self.get(setting)
    @setting[setting]
  end

  DEFAULT_SETTINGS = {
      fullscreen: true,
      screen_width: Gosu::screen_width,
      screen_height: Gosu::screen_height,
      window_title: 'FE.rb',
      main_menu_font: 'Arial',
      src_dir: if ENV['OCRA_EXECUTABLE'] then File.dirname(ENV['OCRA_EXECUTABLE']) else File.dirname(__FILE__) end
      }

  init
end