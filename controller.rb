require 'pry'

require_relative 'models'
require_relative 'view'

class Controller
  attr_reader :game

	def initialize
		@view = View.new
		@game = Game.new
	end

	def welcome
		@view.initial_instructions
    input = @view.get_input
    if input == 'quit'
      @view.sad_message
    else
      @view.garden_intro
      run
    end
  end

  def run
    input = @view.get_input
    @view.sad_message if input == "quit"
    if input == "A"
      @game.show_weather
    elsif input == "B"
      @view.water_options
      input = @view.get_input
      if input == "A"
        @game.water(2)
      elsif input == "B"
        @game.water(1)
      end
    elsif input == "C"
      @view.heat_options
      input = @view.get_input
      if input == "A"
        @game.heat(10)
      elsif input == "B"
        @game.heat(5)
      end
    elsif input == "D"
      @game.next_day
    else
      puts
      puts "I'm sorry, I didn't catch that. Please try again."
    end
    puts 
    puts "What would you like to do now?"
    @view.game_options
    run
	end

end

Controller.new.welcome
