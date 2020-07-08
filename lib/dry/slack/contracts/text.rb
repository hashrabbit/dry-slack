# frozen_string_literal: true

module Dry
  module Slack
    module Contracts
      class Text < Base
        schema do
          required(:type)
          optional(:emoji)
          optional(:verbatim)
        end

        rule(:emoji).validate(invalid_for_attr: { type: 'mrkdwn' })
        rule(:verbatim).validate(invalid_for_attr: { type: 'plain_text' })
      end
    end
  end
end
