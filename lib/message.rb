require_relative 'responder'
require_relative 'dictionary'
require_relative 'morph'
require_relative 'emotion'

class Message
  def initialize
    @dictionary = Dictionary.new
    @emotion = Emotion.new(@dictionary)

    @what_responder = WhatResponder.new('What', @dictionary)
    @random_responder = RandomResponder.new('Random', @dictionary)
    @pattern_responder = PatternResponder.new('Pattern', @dictionary)
    @template_responder = TemplateResponder.new('Template', @dictionary)
    @responder = @pattern_responder

    Morph::init_analyzer
  end

  def post(input)
    @emotion.update(input)
    parts = Morph::analyze input

    case rand(100)
    when 0..39
      @responder = @pattern_responder
    when 40..69
      @responder = @template_responder
    when 70..89
      @responder = @random_responder
    else
      @responder = @what_responder
    end

    # Not to study input before response was created
    response = @responder.response(input, parts, @emotion.mood)
    @dictionary.study input, parts
    response
  end

  def save
    @dictionary.save
  end
end
