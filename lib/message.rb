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
    @response = ['今日は寒いね。', 'おやつ食べたい！', '遊ぼう！']
  end

  def response(input)
    @response[rand(@response.size)]
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
