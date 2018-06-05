class Responder
  attr_reader :name

  def initialize(name, dictionary)
    @name = name
    @dictionary = dictionary
  end

  def response(input, parts, mood)
    ''
  end

  def select_random(array)
    array[rand array.size]
  end
end

class WhatResponder < Responder
  def response(input, parts, mood)
    "#{input}って何？"
  end
end

class RandomResponder < Responder
  def response(input, parts, mood)
    select_random @dictionary.random
  end
end

class PatternResponder < Responder
  def response(input, parts, mood)
    @dictionary.pattern.each do |ptn_item|
      if m = input.match(ptn_item[:pattern])
        resp = select_random(ptn_item[:phrases].split('|'))
        return resp.gsub(/%match%/, m.to_s)
      end
    end

    select_random @dictionary.random
  end
end

class TemplateResponder < Responder
  def response(input, parts, mood)
    keywords = []
    parts.each do |n|
      keywords.push n.surface if Morph.keyword? n.feature
    end
    count = keywords.size
    if 0 < count and templates = @dictionary.template[count]
      template = select_random templates
      return template.gsub(/%noun%/) { keywords.shift }
    end
    select_random @dictionary.random
  end
end
