# frozen_string_literal: true

module Dry
  module Slack
    module Blocks
      class Text < Block
        attribute :text, Types::FilledString
        attribute? :type, Types.type_string(0, 'mrkdwn', 'plain_text')
        attribute? :emoji, Types::Bool
        attribute? :verbatim, Types::Bool

        def length?(val)
          text.size <= val
        end

        def plain_text?
          type == 'plain_text'
        end
      end
    end
  end
end
