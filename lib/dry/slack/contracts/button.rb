# frozen_string_literal: true

module Dry
  module Slack
    module Contracts
      class Button < Base
        schema do
          required(:text)
          optional(:confirm)
        end

        rule(:text, :confirm).validate(:is_valid)
        rule(:text).validate(:is_plain)
        rule(:text).validate(length_lte: 75)
      end
    end
  end
end
