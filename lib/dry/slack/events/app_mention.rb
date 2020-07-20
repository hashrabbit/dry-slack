# frozen_string_literal: true

module Dry
  module Slack
    module Events
      class AppMention < Dry::Struct
        transform_keys(&:to_sym)

        attribute :type, Types::String.constrained(eql: 'app_mention')
        attribute :user, Types::FilledString
        attribute :text, Types::FilledString
        attribute :ts, Types::TimeString
        attribute :channel, Types::FilledString
      end
    end
  end
end
