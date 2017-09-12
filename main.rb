require "awesome_print"
require "progress_bar"
require "text-table"

def doFunction(function, file)
	data = {}
	split = function.split("(")
	data["name"] = split[0]
	puts "Please describe what " + function + " is for and what it does. Try to make it as short as possible as this will be part of the function's comments."
	data["description"] = gets.strip
	inputs = {}
	inputlist = function.split(/[(|)]/)[1].split(", ")
	inputlist.length.times do |i|
		puts "Please describe what the input " + inputlist[i] + " does in " + function + "."
		inputs[inputlist[i]] = gets.strip
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
	File.open(file) do |f|
		filecode = f.read
	end
	splitup = filecode.spilt("def " + function)
	finalcode = splitup[0] + "def " + function + "\n" + commentcode + splitup[1]
	File.open(file, "w") do |f|
		f.write finalcode
	end
end

def startLoop(functions, file)
	bar = ProgressBar.new(functions.length)
	functions.length.times do |i|
		doFunction(functions[i], file)
		bar.increment!
	end
end

def getFunctions(code)
	functions = []
	words = code.split(/(?<!,) /)
	words.length.times do |i|
		if words[i] == "def"
			functions << words[i + 1]
		end
	end
	return functions
end

def start
	puts "What's your name? "
	puts GetWelcome(gets.strip)
	puts "Enter the name of your Ruby file: "
	file = gets.strip
	contents = File.open(file)
	startLoop(getFunctions(contents), file)
	tab = Text::Table.new
	tab.head = ["Function", "Documented"]
	tab.rows = []
	functions = getFunctions(contents)
	functions.length.times do |i|
		tab.rows << [functions[i], "Yes"]
	end
	puts tab.to_s
end

def GetWelcome(name)
	return "Welcome to Docilater, " + name + "!"
end	
