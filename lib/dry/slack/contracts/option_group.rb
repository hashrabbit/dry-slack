# frozen_string_literal: true

module Dry
  module Slack
    module Contracts
      class OptionGroup < Base
        schema do
          required(:label)
          required(:options).value(:array, max_size?: 100)
        end

        rule(:label).validate(:is_valid)
        rule(:label).validate(:is_plain)
        rule(:label).validate(length_lte: 75)
        rule(:options).each(:is_valid)
      end
    end
  end
end
