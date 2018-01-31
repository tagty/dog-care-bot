class Message
  def self.post(message)
    responder = RandomResponder.new('Random')
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
