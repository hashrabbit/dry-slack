# frozen_string_literal: true

module Dry
  module Slack
    module Mentions
      class EventCallback < EventStruct
        attribute :type, Types::String.constrained(eql: 'event_callback')
        attribute :event_id, Types::FilledString
        attribute :event_time, Types::TimeString
        attribute :event, AppMention
        attribute? :token, Types::FilledString
        attribute? :team_id, Types::FilledString
        attribute? :api_app_id, Types::FilledString
        attribute? :authed_users, Types::Array.of(Types::String)

        def to_rack
          [200, { 'Content-Type' => 'text/plain' }, ['OK']]
        end
      end
    end
  end
end
