# frozen_string_literal: true

module Dry
  module Slack
    module Mentions
      EventStruct = Dry.Struct { transform_keys(&:to_sym) }
    end
  end
end

require 'dry/slack/mentions/error'

require 'dry/slack/mentions/app_mention'
require 'dry/slack/mentions/event_callback'
require 'dry/slack/mentions/url_verification'

module Dry
  module Slack
    module Types
      OuterEvents = Mentions::EventCallback | Mentions::UrlVerification
    end
  end
end

