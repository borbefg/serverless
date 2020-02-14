require 'json'
require 'google/apis/calendar_v3'
require 'googleauth'
require 'googleauth/stores/redis_token_store'
require 'ostruct'


def auth(event:, context:)
  user_id      = 'default'
  scope        = Google::Apis::CalendarV3::AUTH_CALENDAR_EVENTS
  client_id    = Google::Auth::ClientId.new(ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET'])
  token_store  = Google::Auth::Stores::RedisTokenStore.new(redis: Redis.new)
  authorizer   = Google::Auth::WebUserAuthorizer.new(client_id, scope, token_store, ENV['OAUTH_CALLBACK_URL'])
  credentials  = authorizer.get_credentials(user_id)

  if credentials.nil?
    request  = OpenStruct.new(session: {})
    auth_url = authorizer.get_authorization_url(login_hint: user_id, request: request)
    return {
      statusCode: 303,
      headers: {
        location: auth_url
      }
    }
  end
  { status: 200, body: credentials }
end

def createEvent(event:, context:)
  calendar = Google::Apis::CalendarV3::CalendarService.new
  calendar.authorization = authorize
  params = event['body']
  new_event = Google::Apis::CalendarV3::Event.new(params)
  rese = calendar.insert_event('primary', new_event)
  { statusCode: 200, body: res }
end
