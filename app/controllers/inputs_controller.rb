class InputsController < ApplicationController
  
  skip_before_filter :verify_authenticity_token, :only => [:create]

  def index
    @inputs = Input.all
    @weights = Weight.all
    @foods = Food.all
    @sleeps = Sleep.all
    @exercises = Exercise.all
    @vitamins = Vitamin.all
    @waters = Water.all
    @expenses = Expense.all
  end

  def create

    @input = Input.new
    @input.body = params[:Body]
    @input.save
    
    input_type = @input.body.split('|').first.downcase
    input_rest = @input.body.split('|').drop(1) 
 
    case input_type
    when "weight"
	    @weight = Weight.new
	    @weight.weight = input_rest[0]
	    @weight.save
    when "food"
    	@food = Food.new
	@food.name = input_rest[0].capitalize
	@food.calories = input_rest[1]
	@food.glyph = input_rest[2].downcase
	@food.save    
when "sleep"
	@sleep = Sleep.new
	action = input_rest[0].downcase
	if action=="start"
		@sleep.action = true	    
	end
	if action=="stop"
		@sleep.action = false	    
	end
	@sleep.save
    when "exercise"
	@exercise = Exercise.new
	@exercise.name = input_rest[0].capitalize
	@exercise.value = input_rest[1]
	@exercise.save
    when "vitamin"
	@vitamin = Vitamin.new
	@vitamin.consumed = true
	@vitamin.save
    when "water"
	@water = Water.new
	@water.consumed = true
	@water.save
    when "expense"
	@expense = Expense.new
	@expense.name = input_rest[0].capitalize
	@expense.amount = input_rest[1]
        @expense.save
    else
    end 
 
 
    redirect_to @input

  end

end
