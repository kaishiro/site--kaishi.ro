class WelcomeController < ApplicationController
  def seconds_to_units(seconds)
    '%d hours, %d minutes, %d seconds' %
      # the .reverse lets us put the larger units first for readability
      [60,60].reverse.inject([seconds]) {|result, unitsize|
        result[0,0] = result.shift.divmod(unitsize)
        result
      }
  end

  def index
    # Time Vars
    @today    = Time.now.in_time_zone('Eastern Time (US & Canada)').midnight.utc
    @tomorrow = @today + 1.day
    @yesterday = @today - 1.day
    @now      = Time.now.in_time_zone('Eastern Time (US & Canada)')

    # SLEEP
    @sleeps = Sleep.last(2)
    @sleep_last = @sleeps[-1]
   
    if @sleep_last.action == true
      @sleeping = true
      @sleep_start = @sleep_last.created_at 
      @sleep_end = @now
    else
      @sleeping = false
      @sleep_start = @sleeps[-2].created_at
      @sleep_end = @sleep_last.created_at 
    end

    @sleep_duration = seconds_to_units(@sleep_end - @sleep_start)
   
    @sleep_quote = [
      "\"Never go to bed mad. Stay up and fight.<br />\" Phyllis Diller",
      "Two",
      "Three"
    ].sample

    # WEIGHT
    @weight = Weight.select("weight").where(:created_at => @today..@tomorrow).average("weight")
   
    # FOOD 
    @calories = Food.select("calories").where(:created_at => @today..@tomorrow).sum(&:calories)

    # VITAMIN
    @vitamin = Vitamin.where(:created_at => @today..@tomorrow).empty?
    @vitamin = !@vitamin

    @exercises = Exercise.all
    @vitamins = Vitamin.all
    @waters = Water.all
    @expenses = Expense.all
  
 

    @exercises = Exercise.where(:created_at => @today..@tomorrow)


    @waters = Water.where(:created_at => @today..@tomorrow)


  end


end
