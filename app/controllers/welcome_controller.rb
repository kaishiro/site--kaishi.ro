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
      "\"Never go to bed mad. Stay up and fight.\"<br />Phyllis Diller",
      "\"I love sleep. My life has the tendency to fall apart when I'm awake, you know?\"<br />Ernest Hemingway",
      "\"Each night, when I go to sleep, I die. And the next morning, when I wake up, I am reborn.\"<br />Mahatma Gandhi",
      "\"Sleep, those little slices of death — how I loathe them.\"<br />Edgar Allen Poe",
      "\"I've always envied people who sleep easily. Their brains must be cleaner, the floorboards of the skull well swept, all the little monsters closed up in a steamer trunk at the foot of the bed.\"<br />David Benioff",
      "\"For years now, I've wanted to fall asleep. The sort of slipping off, the giving up, the falling part of sleep. Now sleeping is the last thing I want to do.\"<br />Chuck Palahniuk",
      "\"Some people talk in their sleep. Lecturers talk while other people sleep.\"<br />Albert Camus",
      "\"Sleep is God. Go worship.\"<br />Jim Butcher",
      "\"I went to bed and woke in the middle of the night thinking I heard someone cry, thinking I myself was weeping, and I felt my face and it was dry.<br />
      Then I looked at the window and thought: Why, yes, it's just the rain, the rain, always the rain, and turned over, sadder still, and fumbled about for my dripping sleep and tried to slip it back on.\"<br />Ray Bradbury",
      "\"Why can I never go back to bed? Who's is the voice ringing in my head? Where is the sense in these desperate dreams? Why should I wake when I'm half past dead?\"<br />Emilie Autumn",
      "\"What would an ocean be without a monster lurking in the dark? It would be like sleep without dreams.\"<br />Werner Herzog"
    ].sample.html_safe

    # WEIGHT
    @weight = Weight.select("weight").where(:created_at => @today..@tomorrow)
    @weight = @weight.average("weight") 

    # FOOD 
    @calories = Food.select("calories").where(:created_at => @today..@tomorrow)
    @calories = @calories.sum(&:calories)
    @food_verb = [
      "consumed",
      "eaten",
      "devoured",
      "wolfed down",
      "gobbled up",
      "ingested",
      "dined on",
      "munched",
      "totally noshed"
    ].sample

    # VITAMIN
    @vitamin = Vitamin.where(:created_at => @today..@tomorrow)
    @vitamin = !@vitamin.empty?

    # WATER
    @waters = Water.where(:created_at => @today..@tomorrow)
    @waters = @waters.count
    @water_verb = [
      "gulped down",
      "soaked up",
      "swilled",
      "guzzled",
      "quaffed",
      "drained",
      "downed"
    ].sample
 
    # EXERCISES
    @exercises = Exercise.where(:created_at => @today..@tomorrow)
    @exercises = !@exercises.empty?



  end


end
