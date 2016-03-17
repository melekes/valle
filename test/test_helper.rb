require 'bundler/setup'
Bundler.require

require "active_record"
require "active_support/core_ext/hash/keys"

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(:color => true)]

class TestCase < MiniTest::Test
end
