class Dictionary
  attr_reader :random, :pattern

  def initialize
    @random = []
    open('dics/random.txt') do |f|
      f.each do |line|
        line.chomp!
        next if line.empty?
        @random.push(line)
      end
    end

    @pattern = []
    open('dics/pattern.txt') do |f|
      f.each do |line|
        pattern, phrases = line.chomp.split("\t")
        next if pattern.nil? || phrases.nil?
        @pattern.push({ pattern: pattern, phrases: phrases })
      end
    end
  end
end
