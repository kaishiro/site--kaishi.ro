class WelcomeController < ApplicationController
  def index
    @today    = Time.now.in_time_zone('Eastern Time (US & Canada)').midnight.utc
    @tomorrow = @today + 1.day
    
    @sleeps = Sleep.all
    @exercises = Exercise.all
    @vitamins = Vitamin.all
    @waters = Water.all
    @expenses = Expense.all
  
#   weights = Weight.where(:created_at => Time.now.beginning_of_day..Time.now.end_of_day)
    @weight = Weight.select("weight").where(:created_at => @today..@tomorrow).average("weight")
 
    @foods = Food.where(:created_at => @today..@tomorrow)

    @exercises = Exercise.where(:created_at => @today..@tomorrow)

    @vitamins = Vitamin.where(:created_at => @today..@tomorrow)

    @waters = Water.where(:created_at => @today..@tomorrow)

    @sleep = Sleep.order("created_at").last
 
  end

end
