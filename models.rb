class Game
  attr_accessor :seed
  attr_reader :weather

	def initialize
		@seed = Seed.new
    @weather = Weather.new
	end

  def show_weather
    puts 
    puts "The weather today is sunny: " + @weather.sunlight.to_s
    puts "The weather today is rainy: " + @weather.precipitation.to_s
    puts "The temperature today is: " + @weather.temperature.to_s
  end

  def water(amt)
    if @seed.watered_today == true
      puts "Sorry, you've already watered your plant."
    else
      @seed.daily_water += amt
      @seed.watered_today = true 
    end
  end

  def heat(amt)
    @weather.temperature += amt
    puts 
    puts "The temperature is now #{@weather.temperature} degrees Farenheit"
  end

  def next_day
    @seed.age -= 1
    @seed.watered_today = false
    @seed.daily_water = 0
    if @seed.age > 0
      @seed.calculate_daily_growth(@weather)
      puts
      puts "It's a new day! Your plant is now #{@seed.height.to_s} cm tall"
      @weather = Weather.new
    else
      "Sorry, you lost."
    end
  end
end

class Seed
  attr_reader :height
  attr_accessor :age, :watered_today, :daily_water

  def initialize
    @ideal_temp = (60..80).to_a.sample
    @ideal_daily_water = (1..3).to_a.sample
    @amt_sun_needed = (2..6).to_a.sample
    @height = 0
    @daily_water = 0
    @watered_today = false
    @age = 7
  end

  def calculate_daily_growth(weather)
    if weather.precipitation == true && weather.sunlight == false
      @daily_water += 2
    elsif weather.precipitation == false && weather.sunlight == true
      @amt_sun_needed -= 2
    elsif weather.precipitation == false && weather.sunlight == false
      @amt_sun_needed -= 1
    else weather.precipitation == true && wweather.sunlight == true 
      @daily_water += 1
      @amt_sun_needed -= 1
    end

    
    if @daily_water == 0
      water_ratio = 0
    else
      water_ratio = @ideal_daily_water.fdiv(@daily_water) unless @daily_water == 0
    end
    temp_ratio = @ideal_temp.fdiv(weather.temperature)
    
    
    @height += 2 if water_ratio > 1
    @height += 1 if water_ratio < 1 && water_ratio > 0

    @height += 2 if temp_ratio > 1
    @height += 1 if temp_ratio < 1 && temp_ratio > 0
  end
end

class Weather

  PRECIPITATION = [ false, false, false, false, false, false, true, true, true, true ]
  SUNLIGHT = [ false, false, false, true, true, true, true, true, true, true ]
  attr_reader :precipitation, :sunlight
  attr_accessor :temperature

	def initialize
		@temperature = (50..90).to_a.sample
		@precipitation = PRECIPITATION.sample
		@sunlight = SUNLIGHT.sample
	end

end
