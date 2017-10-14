require_relative "../lib/main.rb"

require "coveralls"
require "codacy-coverage"
Coveralls.wear!
Codacy::Reporter.start

require "test/unit"

class TestWelcome < Test::Unit::TestCase

	def test_print
		assert_equal("Welcome to Docilater, John!", GetWelcome("John"))
	end

end
