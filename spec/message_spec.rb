require 'message'

describe 'Message' do
  describe '#post' do
    it 'returns response' do
      expect(Message.post('こんにちは！')).not_to be_empty
    end
  end
end

describe 'RandomResponder' do
  describe '#response' do
    it 'returns response' do
      responder = RandomResponder.new('Random')
      expect(responder.response('こんにちは！')).not_to be_empty
    end
  end
end
