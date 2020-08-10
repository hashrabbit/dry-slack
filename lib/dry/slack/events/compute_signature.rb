# frozen_string_literal: true

require 'openssl'

module Dry
  module Slack
    module Events
      class ComputeSignature
        extend Dry::Initializer

        param :secret, default: proc { ENV.fetch('SLACK_SECRET', '') }

        def call(struct)
          sig = OpenSSL::HMAC.hexdigest(
            'sha256', secret, "v0:#{struct.timestamp}:#{struct.body}"
          )
          "v0=#{sig}"
        end
      end
    end
  end
end
