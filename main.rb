require "awesome_print"
require "progress_bar"

def doFunction(function)
	# not implemented
end

def startLoop(functions)
	bar = ProgressBar.new(functions.length)
	functions.length.times do |i|
		doFunction(functions[i])
		bar.increment!
	end
end

def getFunctions(code)
	functions = []
	words = code.split(" ")
	words.length.times do |i|
		if words[i] == "def"
			functions << words[i + 1]
		end
end

def start
	puts "What's your name? "
	puts GetWelcome(gets)
	puts "Enter the name of your Ruby file: "
	contents = File.open(gets)
	startLoop(getFunctions(contents))
end

def GetWelcome(name)
	return "Welcome to Docilater, " + name + "!"
end	
