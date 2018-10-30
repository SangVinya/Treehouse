class Monster
  attr_reader :name, :actions

  def initialize(name)
    @name = name
    @actions = {
      screams: 0,
      scares: 0,
      runs: 0,
      hides: 0
    }
  end

  def say(&block)
    print "#{name} says: "
    yield
  end

  def inspect
    "<#{name}, #{actions}>"
  end

  def print_scoreboard
    puts "----------------"
    puts "#{name} scoreboard"
    puts "----------------"
    puts "Screams: #{actions[:screams]}"
    puts "Scares:  #{actions[:scares]}"
    puts "Runs:    #{actions[:runs]}"
    puts "Hides:   #{actions[:hides]}"
    puts "----------------"
  end

  def scream(&block)
    actions[:screams] += 1
    print "#{name} screams: "
    yield
  end

  def scare(&block)
    actions[:scares] += 1
    print "#{name} scares lord Farquaad! "
    yield
  end

  def run(&block)
    actions[:runs] += 1
    print "#{name} runs "
    yield
  end

  def hide(&block)
    actions[:hides] += 1
    print "#{name} hides "
    yield self if block_given?
  end
end

monster = Monster.new("Shrek")

monster.say { puts "I love onion!" }
monster.scream { puts "DONKEY!" }
monster.scare { puts "Give me back my swamp!" }
monster.run { puts "from castle!" }
monster.hide do |m|
  puts "under your bed..."
  puts "\n"
  puts m.inspect
end

puts "\n"
monster.print_scoreboard
