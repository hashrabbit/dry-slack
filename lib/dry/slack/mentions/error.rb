# frozen_string_literal: true

module Dry
  module Slack
    module Mentions
      class Error < EventStruct
        include Dry::Monads[:result]

        attribute :code, Types::Integer.enum(400, 403, 405)
        attribute :text, Types::FilledString

        def self.call(code, text)
          new(code: code, text: text)
        end

        def to_rack
          [
            code, { 'Content-Type' => 'application/json' },
            [{ error: text }.to_json]
          ]
        end

        def to_result
          Failure(self)
        end
      end
    end
  end
end
