require_relative '../handler'

RSpec.describe 'handler' do
  describe '.auth' do
    it 'responds with status code 200' do
      response = auth(event: nil, context: nil)
      expect(response[:statusCode]).to eq(200)
    end
  end

  describe '.auth' do
    it 'responds with status code 303' do
      response = callback_handler(event: {}, context: nil)
      expect(response[:statusCode]).to eq(303)
    end
  end
end
