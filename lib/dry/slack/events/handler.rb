# frozen_string_literal: true

module Dry
  module Slack
    module Events
      class Handler
        include DoService
        extend Dry::Initializer

        option :parse_request, default: proc { ParseRequest.new }
        option :verify_signature, default: proc { VerifySignature.new }
        option :outer_events, default: proc { Types::OuterEvents }

        def call(request)
          struct = yield parse_request.call(request)
          yield verify_signature.call(struct)
          to_outer_event(struct.to_h)
        end

        private

        def to_outer_event(hash)
          TryResult(Dry::Struct::Error) { outer_events.call(hash) }
            .or(Error.(400, 'Invalid Event Payload').to_result)
        end
      end
    end
  end
end
