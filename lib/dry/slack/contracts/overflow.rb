# frozen_string_literal: true

module Dry
  module Slack
    module Contracts
      class Overflow < Base
        schema do
          required(:options).value(:array, min_size?: 2, max_size?: 5)
          optional(:confirm)
        end

        rule(:options).each(:is_valid)
        rule(:options).each(:is_plain_option)
        rule(:confirm).validate(:is_valid)
      end
    end
  end
end
