# frozen_string_literal: true

module Dry
  module Slack
    module Payloads
      class Basic < Dry::Struct
        attribute? :text, Types::FilledString
        attribute? :mrkdwn, Types::Bool
        attribute? :blocks, Types::Coercible::Array.of(Types::MessageBlock)
        attribute? :thread_ts, Types::IdString

        def validate
          @validate ||= Contracts::PayloadBasic.new.call(attributes)
        end
      end
    end
  end
end
