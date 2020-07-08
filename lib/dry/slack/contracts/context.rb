# frozen_string_literal: true

module Dry
  module Slack
    module Contracts
      class Context < Base
        schema do
          required(:elements).value(:array, max_size?: 10)
        end

        rule(:elements).each(:is_valid)
      end
    end
  end
end
