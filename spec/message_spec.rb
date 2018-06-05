require 'message'

describe 'Message' do
  describe '#post' do
    it 'returns response' do
      response = Message.new.post('こんにちは')
      puts "    Response: #{response}"
      expect(response).not_to be_empty
    end
  end
end

describe 'RandomResponder' do
  describe '#response' do
    it 'returns response' do
      responder = RandomResponder.new('Random', Dictionary.new)
      input = 'こんにちは'
      parts = Morph::analyze input
      response = responder.response(input, parts, 0)
      puts "    Response: #{response}"
      expect(response).not_to be_empty
    end
  end
end

describe 'WhatResponder' do
  describe '#response' do
    it 'returns what message' do
      responder = WhatResponder.new('What', Dictionary.new)
      input = 'こんにちは'
      parts = Morph::analyze input
      response = responder.response(input, parts, 0)
      puts "    Response: #{response}"
      expect(response).to eq 'こんにちはって何？'
    end
  end
end

describe 'PatternResponder' do
  describe '#response' do
    it 'returns pattern message' do
      responder = PatternResponder.new('Pattern', Dictionary.new)
      input = '天気'
      parts = Morph::analyze input
      response = responder.response(input, parts, 0)
      puts "    Response: #{response}"
      expect(response).not_to be_empty
    end
  end
end

describe 'TemplateResponder' do
  describe '#response' do
    it 'returns template message' do
      responder = TemplateResponder.new('Template', Dictionary.new)
      input = '昼寝'
      parts = Morph::analyze input
      response = responder.response(input, parts, 0)
      puts "    Response: #{response}"
      expect(response).not_to be_empty
    end
  end
end

