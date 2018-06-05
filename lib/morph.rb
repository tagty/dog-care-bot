require 'natto'
module Morph
  def init_analyzer
    @natto_mecab = Natto::MeCab.new('-F%m\s%F-[0,1,2]')
  end

  def analyze(text)
    @natto_mecab.enum_parse text
  end

  def keyword?(part)
    # 名詞,(一般|固有名詞|サ変接続|形容動詞語幹)
    /名詞/ =~ part
  end

  module_function :analyze, :keyword?, :init_analyzer
end
