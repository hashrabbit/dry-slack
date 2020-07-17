# frozen_string_literal: true

module Dry
  module Slack
    module Mentions
      class VerifySignature
        extend Dry::Initializer
        include DoService

        option :compute_sig, default: proc { ComputeSignature.new }

        def call(struct)
          yield struct.expired? ? failure('Invalid Timestamp') : Success()
          compare_sigs(struct)
        end

        private

        def compare_sigs(struct)
          return Success() if compute_sig.call(struct) == struct.signature

          failure('Invalid Signature')
        end

        def failure(text)
          Error.new(code: 403, text: text).to_result
        end
      end
    end
  end
end
