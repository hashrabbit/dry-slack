# frozen_string_literal: true

require 'dry/matcher'
require 'dry/matcher/result_matcher'

module Dry
  module Slack
    class PublishWebhook
      extend Dry::Initializer
      include Dry::Monads[:result]
      include Dry::Monads::Do.for(:call)
      include Dry::Matcher.for(:call, with: Dry::Matcher::ResultMatcher)

      option :url, default: proc { ENV.fetch('SLACK_WEBHOOK', '') }
      option :post_json, default: proc { PostJson.new(url) }

      def call(payload)
        json = yield render(payload)
        post_json.call(json)
      end

      private

      def render(payload)
        payload
          .validate
          .to_monad
          .fmap { payload.to_h.to_json }
      end
    end
  end
end
