# frozen_string_literal: true

module Dry
  module Slack
    module Events
      BaseStruct = Dry.Struct { transform_keys(&:to_sym) }
    end
  end
end

require 'dry/slack/events/error'

require 'dry/slack/events/app_mention'
require 'dry/slack/events/url_verification'
require 'dry/slack/events/wrapper'

module Dry
  module Slack
    module Types
      OuterEvents = Events::Wrapper | Events::UrlVerification
    end
  end
end

require 'dry/slack/events/compute_signature'
require 'dry/slack/events/handler'
require 'dry/slack/events/parse_request'
require 'dry/slack/events/request_struct'
require 'dry/slack/events/verify_signature'
