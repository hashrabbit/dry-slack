# frozen_string_literal: true

module Dry
  module Slack
    class PublishWebhook
      extend Dry::Initializer
      include DoService

      option :url, default: proc { ENV.fetch('SLACK_WEBHOOK', '') }
      option :post_json, default: proc { PostJson.new(url) }

      def call(payload)
        yield payload.validate.to_monad
        post_json.call(payload.to_h.to_json)
      end
    end
  end
end
