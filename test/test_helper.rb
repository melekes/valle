require 'bundler/setup'
Bundler.require

require "active_record"

MiniTest::Unit.autorun

class TestCase < MiniTest::Unit::TestCase
end
