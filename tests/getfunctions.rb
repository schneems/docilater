require_relative "../main.rb"
require "test/unit"

class TestGetFunctions < Test::Unit::TestCase

	def test_functionsGot
		assert_equal(["function1", "function2(input1)"], getFunctions("def function1\n        #do something\nend\n\ndef function2(input1)\n        #do something else\nend"), "Function selection doesn't work")
	end
end
