require "awesome_print"
require "progress_bar"
require "text-table"

# Processes a single function's documentation.
#
# @author StellarDoor5319
# @param function [String] the name of the function to be processed, with parenthesis and parameters
# @param file [String] the path to the file being processed, can be relative
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
        	splitup = filecode.spilt("def " + function)
	        finalcode = splitup[0] + "def " + function + "\n" + commentcode + splitup[1]
         	File.open(file, "w") do |f|
	        	f.write finalcode
	        end
	end
end

# Loops through every function in a file, launching doFunction for them
#
# @author StellarDoor5319
# @param functions [Array] list of all functions, provided by getFunctions
# @param file [String] path to the file being processed, can be relative
def startLoop(functions, file)
	bar = ProgressBar.new(functions.length)
	functions.length.times do |i|
		doFunction(functions[i], file)
		bar.increment!
	end
end

# Gets a list of all functions defined in the code, including their parameters.
#
# @author StellarDoor5319
# @param code [String] the code to process
def getFunctions(code)
	functions = []
	words = code.split(/(?<!,)\s/)
	words.length.times do |i|
		if words[i] == "def"
			functions << words[i + 1].strip
		end
	end
	return functions
end

# Runs the full program.
#
# @author StellarDoor5319
# @note Call this function to run the program.
def start
	puts "What's your name? "
	puts GetWelcome(gets.strip)
	puts "Enter the name of your Ruby file: "
	file = gets.strip
	File.open(file) do |f|
		contents = f.read
		functions = getFunctions(contents)
	        startLoop(functions, file)
         	tab = Text::Table.new
        	tab.head = ["Function", "Documented"]
        	tab.rows = []
        	functions.length.times do |i|
        		tab.rows << [functions[i], "Yes"]
        	end
        	puts tab.to_s
	end
end

# Gets a welcome message for the user.
#
# @author StellarDoor5319
# @param name [String] the user's name
def GetWelcome(name)
	return "Welcome to Docilater, " + name + "!"
end	

