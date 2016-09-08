require_relative 'ruby_emblem_window'
Dir.chdir File.dirname(ENV["OCRA_EXECUTABLE"]) if ENV["OCRA_EXECUTABLE"]

window = RubyEmblemWindow.new
window.show