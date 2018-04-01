require 'message'

describe 'Message' do
  describe '#post' do
    it 'returns response' do
      response = Message.new.post('こんにちは！')
      puts "Response is: #{response}"
      expect(response).not_to be_empty
    end
  end
end

describe 'RandomResponder' do
  describe '#response' do
    it 'returns response' do
      responder = RandomResponder.new('Random', Dictionary.new)
      response = responder.response('こんにちは！')
      puts "Response is: #{response}"
      expect(response).not_to be_empty
    end
  end
end

describe 'WhatResponder' do
  describe '#response' do
    it 'asks what is input' do
      responder = WhatResponder.new('What', Dictionary.new)
      response = responder.response('こんにちは！')
      puts "Response is: #{response}"
      expect(response).to eq 'こんにちは！って何？'
    end
  end
end

describe 'PatternResponder' do
  describe '#response' do
    it 'asks what is input' do
      responder = PatternResponder.new('Pattern', Dictionary.new)
      response = responder.response('天気')
      puts "Response is: #{response}"
      expect(response).not_to be_empty
    end
  end
end
