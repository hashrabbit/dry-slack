# frozen_string_literal: true

module Dry
  module Slack
    module Mentions
      class UrlVerification < EventStruct
        attribute :type, Types::String.constrained(eql: 'url_verification')
        attribute :token, Types::FilledString
        attribute :challenge, Types::FilledString

        def to_rack
          [
            200, { 'Content-Type' => 'application/json' },
            [{ challenge: challenge }.to_json]
          ]
        end
      end
    end
  end
end
