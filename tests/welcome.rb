require_relative "../main.rb"
require "test/unit"

class TestWelcome < Test::Unit::TestCase

	def test_print
		assert_equal("Welcome to Docilater, John!", GetWelcome("John"))
	end

end
