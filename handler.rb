require 'json'

def createEvent(event:, context:)
  { statusCode: 200, body: event['body'] }
end
