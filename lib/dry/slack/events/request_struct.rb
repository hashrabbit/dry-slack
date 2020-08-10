# frozen_string_literal: true

module Dry
  module Slack
    module Events
      class RequestStruct < BaseStruct
        attribute :timestamp, Types::Coercible::Integer
        attribute :offset, Types::Integer
        attribute :signature, Types::FilledString
        attribute :body, Types::FilledString

        def self.call(request)
          ts = request.get_header('HTTP_X_SLACK_REQUEST_TIMESTAMP').to_i
          new(
            timestamp: ts,
            offset: (Time.now.to_i - ts).abs,
            signature: request.get_header('HTTP_X_SLACK_SIGNATURE'),
            body: request.body.tap(&:rewind).gets
          )
        end

        def expired?
          offset > 300
        end

        def to_h
          @to_h ||= JSON.parse(body)
        end
      end
    end
  end
end
