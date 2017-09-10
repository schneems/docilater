require "awesome_print"
require "progress_bar"

def start
	puts "What's your name? "
	puts GetWelcome(gets)
end

def GetWelcome(name)
	return "Welcome to Docilater, " + name + "!"
end	
