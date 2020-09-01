# frozen_string_literal: true

module Dry
  module Slack
    module Contracts
      class Header < Base
        schema do
          optional(:text)
        end

        rule(:text).validate(:is_valid)
        rule(:text).validate(:is_plain)
        rule(:text).validate(length_lte: 3000)
      end
    end
  end
end
