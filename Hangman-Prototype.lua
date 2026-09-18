math.randomseed(os.time())


print("...This is a simple game of guess the Hangman Grimoire edition.\n Guess any letter in the word...")

local ManaTbl = { "Mana", "Holy", "Sorcery", "Wand", "Curse", "Grimoire" }

io.write("Enter your guess for any letter the word might have ...\n")
local UserGuess = io.read():lower()

--This function is responsible for creating the blank tile that shows on the player output
local function NewTableMaker()
	local randomChoose = ManaTbl[math.random(#ManaTbl)]

	local RandomsTbl = {}
	for i = 1, #randomChoose do
		table.insert(RandomsTbl, "_")
	end
	print(table.concat(RandomsTbl))

	--This Finder line searches for whether the UserGuess is in the Random selected word(randomChoose)
	local Finder = string.find(randomChoose:lower(), UserGuess)

	if Finder ~= nil and UserGuess ~= "" then
		print(UserGuess .. " is in the selected word and the word is " .. randomChoose)
	end
	--This function is the while loop Validation function to filter Input from correct to wrong
	local function ValidationFunc()
		while
			not Finder
			or string.match(UserGuess, "%d") ~= nil
			or #UserGuess > 1
			or string.find(UserGuess, "%s")
			or UserGuess == ""
		do
			if
				not Finder
				and string.match(UserGuess, "%d") == nil
				and string.find(UserGuess, "%s") == nil
				and #UserGuess == 1
			then
				print("The Grimoire word has " .. #randomChoose .. " letters")
				io.write("Choose a correct letter \n Youv'e chose a wrong letter\n>>> ")
				UserGuess = io.read()
			elseif string.match(UserGuess, "%d") ~= nil then
				print("The Grimoire word has " .. #randomChoose .. " letters")
				io.write("Invalid Character(No.) used \n Please correct !!!\n>>> ")
				UserGuess = io.read()
			elseif #UserGuess > 1 and string.match(UserGuess, "%a+") then
				print("The Grimoire word has " .. #randomChoose .. " letters")
				io.write("...You are only allowed to enter 1 letter at a time !!! \n Please Try again ...\n>>> ")
				UserGuess = io.read()
			elseif string.find(UserGuess, "%s") then
				print("The Grimoire word has " .. #randomChoose .. " letters")
				print("No Whitespaces allowed at all")
				io.write("Choose a letter at least...\n>>> ")
				UserGuess = io.read()
			elseif UserGuess == "" then
				print("The Grimoire word has " .. #randomChoose .. " letters")
				print("Don't just press 'ENTER' ...My advice!!! :: You have to get your eyes checked^^")
				io.write("Don't be lazy Choose something at least...\n >>> ")
				UserGuess = io.read()
			end

			Finder = string.find(randomChoose:lower(), UserGuess:lower())
			if Finder ~= nil and UserGuess ~= "" then
				print(UserGuess .. " is in the selected word  " .. randomChoose)
				print(table.concat(RandomsTbl))
			end
		end
	end
	ValidationFunc()
end

NewTableMaker()