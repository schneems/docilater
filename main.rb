require "awesome_print"
require "progress_bar"

def doFunction(function)
	data = {}
	split = function.split("(")
	data["name"] = split[0]
	puts "Please describe what " + function + " is for and what it does. Try to make it as short as possible as this will be part of the function's comments."
	data["description"] = gets
	inputs = {}
	inputlist = function.split(/[(|)]/)[1].split(", ")
	inputlist.length.times do |i|
		puts "Please describe what the input " + inputlist[i] + " does in " + function + "."
		inputs[inputlist[i]] = gets
	end
	data["inputs"] = inputs
	ap data
	puts "Please wait, converting data into appropriate comments..."
	commentcode = "# " + data["description"]
	inputlist.length.times do |i|
		commentcode += "\n# " + inputlist[i] + " - " + data["inputs"][inputlist[i]]
	end
	puts "Conversion complete. Comment content:"
	puts commentcode
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
