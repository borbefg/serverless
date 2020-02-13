require 'json'

def hello(event:, context:)
  {
    statusCode: 200,
    body: {
      message: 'Go Serverless v1.0! Your function executed successfully!',
      input: event
    }.to_json
  }
end

def authorize
  # get user consent
end

def oauth2callback(event:, context:)
  # exchange code for token
end

def createEvent(event:, context:)
  # TODO: Replace with POST request body
  sample_event = {
    "summary": "Test Date",
    "description": "Test Date",
    "location": "",
    "end": {
      "date": "2020-02-14"
    },
    "start": {
      "date": "2020-02-14"
    }
  }
end
