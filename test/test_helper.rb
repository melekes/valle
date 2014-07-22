require 'bundler/setup'
Bundler.require

require "active_record"

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(:color => true)]

class TestCase < MiniTest::Test
end
