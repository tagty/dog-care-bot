class PatternItem
  attr_reader :modify, :pattern, :phrases

  def add_phrase(phrase)
    return if @phrases.find { |p| p[:phrase] == phrase }
    @phrases.push { need: 0, phrases: phrase }
  end

  def make_line
    pattern = @modify.to_s + '##' + @pattern
    phrases = @phrases.map { |p| p[:need].to_s + '##' + p[:phrase] }
    pattern + "\t" + phrases.join '|'
  end
end
