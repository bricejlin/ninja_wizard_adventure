def prompt
	print "> "
end

def start
	puts "You are sitting in a dark room."
	puts "There is a skinny creepy man with sunglasses is sitting across from you."
	puts "He opens his hand to reveal a blue pill and a red pill."
	puts "Which one do you take?"

	prompt; next_move = gets.chomp

	if next_move.include? "blue"
		puts "You swallow the blue pill and immediately black out."
		ninja_closet
	elsif next_move.include? "red"
		puts "You swallow the red pill and immediately black out."
		wizard_closet
	else
		die("The skinny creepy man is furious that you rejected his pills. He shoves them up your nose. You can't breathe. You die.")
	end
end

def ninja_closet
	ninja_weapons = %w[ shuriken katana nunchaku handclaw sai kusari-gama butterknife ]

	puts "You wake up in a small dark walk-in closet."
	puts "You flick on the lightswitch on the wall and find yourself in what looks like a ninja armory."
	puts "There are various weapons and armor hung on the walls."

	choice_weapon = ninja_weapons[rand(0..6)]

	puts "You reach inside a blackbox by the corner and find a #{choice_weapon}. Keep it?"

	while true
		prompt; next_move = gets.chomp

		if next_move == "no"
			choice_weapon = ninja_weapons[rand(0..6)]
			puts "You return the weapon and pull out a #{choice_weapon}. Keep it? "
		elsif next_move == "yes"
			puts "You take the #{choice_weapon} with you and walk out of the closet"
			battle_room
		else
			puts "Answer yes or no."
		end
	end
end

def wizard_closet
	wizard_weapons = [ 'blue wand', 'red wand', 'green wand', 'yellow wand', 'tree branch']

	puts "You wake up in a small dark walk-in closet."
	puts "You flick on the lightswitch on the wall and find yourself in what looks like a wizard armory."
	puts "There are various robes and wizard hats lying around."

	choice_weapon = wizard_weapons[rand(0..4)]

	puts "You reach inside a blackbox by the corner and find a #{choice_weapon}. Keep it?"
 
	while true
		prompt; next_move = gets.chomp

		if next_move == "no"
			choice_weapon = wizard_weapons[rand(0..4)]
			puts "You return the weapon and pull out a #{choice_weapon}. Keep it? "
		elsif next_move == "yes"
			puts "You take the #{choice_weapon} with you and walk out of the closet"
			battle_room
		else
			puts "Answer yes or no."
		end
	end
end

def battle_room
	puts "You find yourself in a giant room."
	puts "Across the room are two doors"
	puts "Do you open the left or the right one?"

	prompt; next_move = gets.chomp

	if next_move == "left"
		sat_manatee_room
	elsif next_move == "right"
		ballerina_cyclops_room
	else
		die("You walk around the giant room until you starve and die.")
	end
end

def ballerina_cyclops_room
	puts "Big mistake. You find yourself in a room with a cyclops in a tutu."
	puts "He dances and prances around the room to the Swan Lake soundtrack."
	puts "What do you do? Watch or flee?"

	prompt; next_move = gets.chomp

	if next_move == "flee"
		puts "Good choice. You run back through the door you came in."
		battle_room
	else
		die("The cyclops ballerina gets closer. And closer. And closer. He accidentally twirls into you and eats you.")
	end
end

def sat_manatee_room
	puts "You walk in and there's a giant manatee with a birthday hat on."
	puts "'I am SAT Manatee. You cannot pass so easily. Unless you define this word for me.'"
	puts "'What does 'assiduous' mean?'"
	manatee_moved = false

	while true
		prompt; next_move = gets.chomp

		if next_move.include? "working"
			puts "'Correct!'"
			puts "SAT Manatee rolls over, revealing a door behind him."
			manatee_moved = true
		elsif next_move == "taunt manatee"
			die("SAT Manatee all of a sudden is hungry and takes a bite out of your face.")
		elsif next_move == "open door" and manatee_moved
			puts "You open the door and walk through."
			riddler_rattlesnake_room
		else
			puts "I don't understand what you're saying"
		end
	end
end

def riddler_rattlesnake_room
	puts "You find yourself in another dark room..."
	puts "'SssssSss I am Riddler Rattlesnake.'"
	puts "'Sssolve thissS riddle and you can passSs..'"
	puts "'What'sSs brown and hasSs a head and a tail but no body?'"
	rattlesnake_moved = false

	while true
		prompt; next_move = gets.chomp

		if next_move.include? "penny"
			puts "'Correct!'"
			puts "Riddler Rattlesnake turns on the light, revealing himself to actually be a scrawny, teenage nerd with a lisp."
			puts "He runs to the corner and cries, leaving a big wooden door unguarded."
			rattlesnake_moved = true
		elsif next_move == "taunt scrawny nerd"
			die("Scrawny nerd injects homemade steroids into himself and proceeds to pummel you. You die.")
		elsif next_move == "open door" and rattlesnake_moved
			"You open the door and walk through"
			pop_culture_vulture_room
		else
			puts "I don't understand what you're saying."
		end
	end
end

def pop_culture_vulture_room
	puts "You are in a dimly lit room."
	puts "Suddenly, you hear loud swooshing sounds."
	puts "Argg, I am Pop Culture Vulture. Solve my meaningless trivia and you shall pass!"
	puts "Ready? Here we go:"
	puts "What unexpected event happened at Superbowl 2013?"
	vulture_moved = false

	while true
		prompt; next_move = gets.chomp

		if next_move.include? "power outage"
			puts "'Argg, correct!'"
			puts "Pop Culture Vulture flies away, revealing a golden door."
			vulture_moved = true
		elsif next_move == "taunt vulture"
			die("Pop Culture Vulture swoops down and lays a giant dump on you. The stench is so bad it kills you.")
		elsif next_move == "open door" and vulture_moved
			"You open the golden door and walk through"
			gold_room
		else
			puts "I don't understand what you're saying"
		end
	end
end
				
def gold_room
	puts "You are in a room full of glimmering gold coins."
	puts "Congratulations, you have reached the end. There are 500 gold coins in here."
	puts "How many do you take?"

	prompt; next_move = gets.chomp

	if next_move[/\d+/].to_i.integer?
		how_much = next_move.to_i
	else
		die("Man, learn to type a number.")
	end

	if how_much < 50
		puts "Nice, you're not greedy, you win!"
		Process.exit(0)
	else
		die("You greedy punk!")
	end
end

def die(reason)
	puts "#{reason} Game over. Play again?"

	prompt; next_move = gets.chomp

	if next_move == "yes"
		start
	else
		Process.exit(0)
	end
end

start