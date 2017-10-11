require_relative "../main.rb"

require "coveralls"
require "codacy-coverage"
Coveralls.wear!
Codacy::Reporter.start

require "test/unit"

class TestDoFunction < Test::Unit::TestCase
  def test_doFunction
    code = "def is_even(number)\n  if number % 2 == 1\n    return false\n  else\n    return true\n  end\nend"
    resultCode = "def is_even(number)\n# Processes a single number, testing if it is equal\n# number - The number to process\n  if number % 2 == 1\n    return false\n  else\n    return true\n  end\nend"
		with_stdin do |user|
      File.open("test.rb", "w") do |testfl|
        testfl.puts code
      end
      user.puts "Processes a single number, testing if it is equal"
      user.puts "The number to process"
      doFunction("is_even(number)", "test.rb")
      result = ""
      File.open("test.rb").each as |testflline|
        result += "\n"
        result += testflline
      end
      assert_equal(resultCode, result)
    end
	end
  
  def with_stdin
    stdin = $stdin # remember $stdin
    $stdin, write = IO.pipe # create pipe, assigning its "read end" to $stdin
    yield write
  ensure
    write.close # close the pipe
    $stdin = stdin # restore $stdin
  end
end
