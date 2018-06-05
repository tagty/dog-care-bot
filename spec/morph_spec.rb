require 'morph'

describe 'Morph' do
  describe '#analyze' do
    it 'returns analysis' do
      analysis = Morph::analyze('あたしはプログラムの女の子です')
      feature = analysis.peek.feature
      expect(feature).to include '名詞' 
    end
  end

  describe '#keyword?' do
    it 'returns true' do
      is_keyword = Morph::keyword? '名詞,代名詞,一般,*,*,*,あたし,アタシ,アタシ' 
      expect(is_keyword).to be_truthy
    end
  end
end

