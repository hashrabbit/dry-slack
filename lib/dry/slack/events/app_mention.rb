# frozen_string_literal: true

require 'shellwords'

module Dry
  module Slack
    module Events
      class AppMention < BaseStruct
        include Dry::Monads[:result]

        attribute :type, Types::String.constrained(eql: 'app_mention')
        attribute :user, Types::FilledString
        attribute :text, Types::FilledString
        attribute :ts, Types::TimeString
        attribute :channel, Types::FilledString

        def to_argv
          argv.empty? ? Failure('Invalid app_mention command') : Success(argv)
        end

        def to_argv!
          to_argv.value_or { raise InvalidAppMention }
        end

        private

        def argv
          @argv ||= cmd_text.to_s.shellsplit
        end

        def cmd_text
          /\A<[^>]+> (.*)\z/.match(text)
          Regexp.last_match(1)
        end
      end
    end
  end
end
