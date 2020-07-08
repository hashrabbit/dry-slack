# frozen_string_literal: true

module Dry
  module Slack
    module Contracts
      class Option < Base
        schema do
          required(:text)
          optional(:description)
        end

        rule(:text, :description).validate(:is_valid)
        rule(:text, :description).validate(length_lte: 75)
        rule(:description).validate(is_plain: false)
      end
    end
  end
end
