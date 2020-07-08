# frozen_string_literal: true

module Dry
  module Slack
    class PostJson
      include Dry::Monads[:result, :try]
      extend Dry::Initializer

      param :url, default: proc { ENV.fetch('SLACK_WEBHOOK', '') }
      option :http, default: proc { RestClient }
      option :http_error, default: proc { RestClient::ExceptionWithResponse }

      def call(json)
        monad = Try(http_error) { http.post(url, json, content_type: :json) }
        monad
          .to_result
          .or { |e| Failure(PostFailed.new(e.response)) }
      end
    end
  end
end
