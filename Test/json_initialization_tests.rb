require 'test/unit'
require 'json'
require 'gosu'
require_relative '../src/settings'
require_relative '../src/unit'

class JsonInitializationTests < Test::Unit::TestCase
  def test_unit_init_from_json
    unit = Unit.init_from_json(File.read(File.dirname(__FILE__) + '/data/unit.json'))

    assert_not_nil(unit)
  end
end