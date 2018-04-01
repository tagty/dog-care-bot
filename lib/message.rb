class Message
  def self.post(message)
    what_responder = WhatResponder.new('What')
    random_responder = RandomResponder.new('Random')
    responder = rand(2) == 0 ? what_responder : random_responder
    responder.response(message)
  end
end

class Responder
  def initialize(name)
    @name = name
  end
end

class RandomResponder < Responder
  def initialize(name)
    super
    @phrases = []
    open('dics/random.txt') do |f|
      f.each do |line|
        line.chomp!
        next if line.empty?
        @phrases.push(line)
      end
    end
  end

  def response(input)
    select_random @phrases
  end

  def select_random(array)
    array[rand array.size]
  end
end

class WhatResponder < Responder
  def initialize(name)
    super
  end

  def response(input)
    "#{input}って何？"
  end
end
