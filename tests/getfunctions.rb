require_relative "../main.rb"

require "coveralls"
Coveralls.wear!

require "test/unit"

class TestGetFunctions < Test::Unit::TestCase

	def test_functionsGot
		assert_equal(["afunction"], getFunctions("def afunction\n    #a simple function.\n    puts \"This is a function\"\nend"), "Basic function selection doesn't work")
		assert_equal(["function1", "function2(input1)"], getFunctions("def function1\n        #do something\nend\n\ndef function2(input1)\n        #do something else\nend"), "Function selection sith multiple functions doesn't work")
		assert_equal(["function(input, anotherinput)"], getFunctions("def function(input, anotherinput)\n    #this function has two inputs\nend"), "Function selection with multiple inputs doesn't work")
	end
end
