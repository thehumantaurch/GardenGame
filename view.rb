require 'pry'

class View
	def initial_instructions
		puts 
    puts "Welcome to the Gardening Game"
    puts "============================="
    puts
    puts "To continue playing enter 'play' and then hit enter"
    puts "To quit at any time, enter 'quit' and then hit enter"
	end

  def get_input
    puts
    gets.chomp
  end

  def sad_message
    puts 
    puts "Aww, okay... maybe next time... "
  end

  def garden_intro
    puts
    puts "Here is your garden. You have one seed right now."
    puts "To earn more seeds, you must nurture this one to its full height"
    puts "within one week. But you don't know exactly what it needs or what it is."
    puts "To do so, you must take into account the weather and temperature."
    puts "You may water your plant if necessary, or use a heat lamp if necessary."
    game_options
  end

  def game_options
    puts
    puts "You have four options. You can type:"
    puts "A -- to check the daily weather"
    puts "B -- to water your plant"
    puts "C -- to turn on the heat lamp"
    puts "D -- do nothing and move onto the next day"
  end

  def water_options
    puts
    puts "You have two options. You can type:"
    puts "A -- water the plant A LOT"
    puts "B -- water the plant A LITTLE"
    puts "or, do nothing with watering your plant"
  end

  def heat_options
    puts
    puts "You have two options. You can type:"
    puts "A -- turn the heat lamp on HIGH"
    puts "B -- turn the heat lamp on LOW"
    puts "or, do nothing with the heat lamp"
  end

end