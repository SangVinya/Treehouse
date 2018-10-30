class SimpleBenchmarker
  def run(&block)
    start_time = Time.now
    block.call
    end_time = Time.now
    elapsed = end_time - start_time
    puts "Elapsed time: #{elapsed}"
  end
end

benchmarker = SimpleBenchmarker.new
benchmarker.run do
  5.times do
    print "."
    sleep(rand(0.1..1.0))
  end
end
