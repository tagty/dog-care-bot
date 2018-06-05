require 'morph'

class Dictionary
  attr_reader :random, :pattern, :template

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

    @template = []
    open('dics/template.txt') do |f|
      f.each do |line|
        count, template = line.chomp.split(/\t/)
        next if count.nil? or pattern.nil?
        count = count.to_i
        @template[count] = [] unless @template[count]
        @template[count].push template
      end
    end
  end

  def study(input, parts)
    study_random input
    study_pattern input, parts
    study_template parts
  end

  def study_random(input)
    return if @random.include?(input)
    @random.push(input)
  end

  def study_pattern(input, parts)
    parts.each do |word, part|
      next unless Morph::keyword? part
      duped = @pattern.find { |ptn_item| ptn_item.pattern == word }
      if duped
        duped.add_phrase input
      else
        @pattern.push PatternItem.new(word, input)
      end
    end
  end

  def study_template(parts)
    template = ''
    count = 0
    parts.each do |n|
      word = n.surface
      if Morph::keyword? n.feature
        word = '%noun%'
        count += 1
      end
      template += word
    end
    return unless 0 < count
    @template[count] = [] unless @template[count]
    unless @template[count].include? template
      @template[count].push template
    end
  end

  def save
    open('dics/random.txt', 'w') do |f|
      f.puts(@random)
    end

    open('dics/pattern.txt', 'w') do |f|
      @pattern.each { |ptn_item| f.puts ptn_item.make_line }
    end

    open('dics/template.txt', 'w') do |f|
      @template.each_with_index do |templates, i|
        next if templates.nil?
        templates.each do |template|
          f.puts i.to_s + "\t" + template
        end
      end
    end
  end
end
