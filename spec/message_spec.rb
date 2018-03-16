require 'message'

describe 'Message' do
  describe '#post' do
    it 'returns response' do
      response = Message.post('こんにちは！')
      puts "Response is: #{response}"
      expect(response).not_to be_empty
    end
  end
end

describe 'RandomResponder' do
  describe '#response' do
    it 'returns response' do
      responder = RandomResponder.new('Random')
      response = responder.response('こんにちは！')
      puts "Response is: #{response}"
      expect(response).not_to be_empty
    end
  end
end

describe 'WhatResponder' do
  describe '#response' do
    it 'asks what is input' do
      responder = WhatResponder.new('What')
      response = responder.response('こんにちは！')
      puts "Response is: #{response}"
      expect(response).to eq 'こんにちは！って何？'
    end
  end
end
