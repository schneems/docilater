require "test/unit"

require "coveralls"
require "codacy-coverage"
Coveralls.wear!
Codacy::Reporter.start

require_relative "welcome.rb"
require_relative "getfunctions.rb"
require_relative "dofunction.rb"
