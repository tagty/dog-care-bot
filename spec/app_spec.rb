require 'spec_helper'

describe 'My Sinatra Application' do
  it 'should allow accessing the home page' do
    get '/'
    expect(last_response).to be_ok
  end

  # it 'should post to get callback' do
  #   post '/callback', nil, { 'HTTP_X_LINE_SIGNATURE' => 'TEST_HTTP_X_LINE_SIGNATURE' }
  #   expect(last_response).to be_ok
  # end
end
