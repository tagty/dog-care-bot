require_relative 'responder'
require_relative 'dictionary'

class Message
  def initialize
    dictionary = Dictionary.new
    @what_responder = WhatResponder.new('What', dictionary)
    @random_responder = RandomResponder.new('Random', dictionary)
    @pattern_responder = PatternResponder.new('Pattern', dictionary)
  end

  def post(input)
    case rand(100)
    when 0..59
      responder = @pattern_responder
    when 60..89
      responder = @random_responder
    else
      responder = @what_responder
    end
    responder.response(input)
  end
end
