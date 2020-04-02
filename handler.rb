require 'json'
require 'google/apis/calendar_v3'
require 'googleauth'
require 'googleauth/stores/redis_token_store'
require 'ostruct'

def auth(event:, context:)
  { statusCode: 200, body: { message: 'boo' }.to_json }
end

def callback_handler(event:, context:)
  {
    statusCode: 303,
    headers: {
      location: "https://#{event.dig('requestContext','domainName')}/dev/authorize"
    }
  }
end
