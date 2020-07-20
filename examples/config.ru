# frozen_string_literal: true

require_relative '../lib/dry-slack'

class App
  def call(request)
    req = Rack::Request.new(request)
    body = req.body.gets
    puts body
    # challenge = Dry::Slack::Events::UrlVerification.new(JSON.parse(body))
    # p challenge.to_rack
    # challenge.to_rack
    event = Dry::Slack::Events::EventCallback.new(JSON.parse(body))
    event.to_rack
  end
end

run App.new
